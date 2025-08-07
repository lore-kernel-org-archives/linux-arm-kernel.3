Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E14BC87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 07:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TrfZdnEzM8YI3DydNQ0/utFTCYg5k0TRMMcoKD0jcS8=; b=EOcO1rH/mGZZnCG4+4Ofy9tsXo
	QoNFxVARPN05r6HWWlbfqVA9iQzcsxLToCZQAvXnLHlBNhM21NObqCwX66j8kxvQsuam2uikN2NAA
	6bY1ot6gtJFmq+CR4Rz9QaZu1qrjKyCtOBhfxW8agU6iOtYHvePk6LmihPBPgifaVMzW2WduNjA8a
	xPFBUM3/cH15ujj8fAolSktCu9qIz6NnoT0x3Olmw+oqusIzxJhymJi5xWYEUNxvVLeaE91mVLHst
	p0km3FHTLk95KCMzSbYbBEWla1lfTj9n6tB7kdOiJ3O8k7ubiHt85GlT2pNhvafmuUHHIkMwBIBry
	nnmBuKCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujvEE-0000000HTyM-21O6;
	Thu, 07 Aug 2025 07:39:58 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujvA7-0000000HTZ4-005L
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Aug 2025 07:35:44 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5776Y6k6008798;
	Thu, 7 Aug 2025 09:35:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=TrfZdnEzM8YI3DydNQ0/ut
	FTCYg5k0TRMMcoKD0jcS8=; b=15WPNXIqawe1InQtQS6TSQ7l19vx8wRzokD1YL
	JX3/zXFuyzz5TtJrOWn2Xp66pICNI8wj98GWT3UZ7WYqw2bjZ2Dk8Fk23dOO9oDF
	jCn39Tkb0mpexYUSFm1r38PeLTP0B4WYP/DjQqxlsYOEx/RElBTWflhMj5Rj1Iog
	KG4nK4TYItqmOS4zJgFWL+lEoM5KXMuVkHj8vPYcqIpQ3dG2oYb3Iszy1LZFyCFF
	P5FGPzk/JuN9yOFEGdolwa6TS/rFj+deMJR4hcDE3ukiRmX9roLV7PF4WGncL6eY
	AZ8f8rF+A2LMpVJcergbpPDF3H4kSox0TZnLvU91k6cZAKCg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48cq00g955-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Aug 2025 09:35:26 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id D4AC94005B;
	Thu,  7 Aug 2025 09:34:36 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0AEF871860B;
	Thu,  7 Aug 2025 09:34:11 +0200 (CEST)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 7 Aug
 2025 09:34:10 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Thu, 7 Aug 2025 09:34:09 +0200
Subject: [PATCH v2] memory: stm32_omm: Fix req2ack update test
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250807-upstream_omm_fix_req2ack_test_condition-v2-1-d7df4af2b48b@foss.st.com>
X-B4-Tracking: v=1; b=H4sIAPBWlGgC/5WNQQ7CIBQFr2JYSwNYhbryHqYhCB9LDKXysdE0v
 bvYG7icl5eZhSDkAEjOu4VkmAOGNFYQ+x2xgxnvQIOrTAQTR6bYib4mLBlM1ClG7cNbZ3gKYx+
 6ABZt0+hCqQ4qJSh/Y44fnCLVNmWo76107SsPAUvKny0889/6f2PmlNNWyc5wJ73s2otPiA2Wx
 qZI+nVdvyRBBrTgAAAA
X-Change-ID: 20250806-upstream_omm_fix_req2ack_test_condition-77e8fb0d13d8
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Christophe Kerello <christophe.kerello@foss.st.com>
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        Patrice Chotard
	<patrice.chotard@foss.st.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_05,2025-08-06_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_003543_466241_125A848D 
X-CRM114-Status: GOOD (  13.08  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

If "st,omm-req2ack-ns" property is found and its value is not 0,
the current test doesn't allow to compute and set req2ack value,
Fix this test.

Fixes: 8181d061dcff ("memory: Add STM32 Octo Memory Manager driver")
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
Changes in v2:
- Add more detail in commit message
- Remove "Cc: <stable@vger.kernel.org>" tag as the fixed patch is not part of a LTS.
- Link to v1: https://lore.kernel.org/r/20250806-upstream_omm_fix_req2ack_test_condition-v1-1-4879a1d7f794@foss.st.com
---
 drivers/memory/stm32_omm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/memory/stm32_omm.c b/drivers/memory/stm32_omm.c
index 79ceb1635698f6bc8bd4a39fdeaced1ec318e1f6..9efc56a85b5ecca49eb6dfc0ef83880f89591cd1 100644
--- a/drivers/memory/stm32_omm.c
+++ b/drivers/memory/stm32_omm.c
@@ -247,7 +247,7 @@ static int stm32_omm_configure(struct device *dev)
 		if (mux & CR_MUXEN) {
 			ret = of_property_read_u32(dev->of_node, "st,omm-req2ack-ns",
 						   &req2ack);
-			if (!ret && !req2ack) {
+			if (!ret && req2ack) {
 				req2ack = DIV_ROUND_UP(req2ack, NSEC_PER_SEC / clk_rate_max) - 1;
 
 				if (req2ack > 256)

---
base-commit: 038d61fd642278bab63ee8ef722c50d10ab01e8f
change-id: 20250806-upstream_omm_fix_req2ack_test_condition-77e8fb0d13d8

Best regards,
-- 
Patrice Chotard <patrice.chotard@foss.st.com>


