Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A30BC87FD3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 15:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VGM4i/YY8L3GxVbjbzZ+E1wPLPAJDd6KHMtwpJhsXpg=; b=cWGAt/nDs8RWFY+QqKja/30kVP
	glZP3k/C7JZE7ETVe4Mw7KDUffD0COE7JFlRQtoTY61txaeM8PLCtzDh5mhIgVXxdUSiOdRGFghjX
	4OIwjeRlwa5iXrDQEK3AtyibzgqkXviVbgC56f0oaetXMh/e8rBhUiJmuaaOlarESWS2IrKymzQWu
	1k5kRcgV4C3vlBXD1E4itxcIqAFMrpwmtjt7z2qcth1V1l13t63qpyQpoygsO+zJIi/dSU/IXirg7
	dp7qE8G7ug604N477ufbuar90AYkGbZ3fUUmf4lAmbgyWED89vLztmXVtK+NxwjZaxCSE5Ug7LcjB
	pa5D925Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujgPW-0000000FfV5-0cKR;
	Wed, 06 Aug 2025 15:50:38 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujg9l-0000000FcWj-1Izx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 15:34:22 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 576FTZjq001991;
	Wed, 6 Aug 2025 17:34:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=VGM4i/YY8L3GxVbjbzZ+E1
	wPLPAJDd6KHMtwpJhsXpg=; b=skleuEToU7r5Casj+OZTYun99QOB8DFNTFQ4gF
	yLZwcardz6CLAhXNpoFWCTjttw94meQyIvM0uUQQLkFzq0RLYX7Eh2QldUct1v1U
	LH5M7mMW7AUO2ceaRvyXOTuQmZsPChxoKmryoh5QA1okx2yKksGkG2Tx3oDVJItv
	SBxhNnvMiMKvUhecO0siRRIm4A9jcFl6+EGhd5Hdy8g+ufpHewostoxOEaaimwT9
	EDCVS3EApwDVWtrv3Sr7PwcF7J/RHT9MApWwNcl8QPilLpumde8stW2lxMSKsP5L
	apKUvkID04kAmGSIijAdsB47yYTqP6d8B447BtSxoVP8defg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48bpx8c1b1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Aug 2025 17:34:12 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 551D240053;
	Wed,  6 Aug 2025 17:33:13 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1A45D7385C3;
	Wed,  6 Aug 2025 17:32:43 +0200 (CEST)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 6 Aug
 2025 17:32:42 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Wed, 6 Aug 2025 17:32:42 +0200
Subject: [PATCH] memory: stm32_omm: Fix req2ack update test
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250806-upstream_omm_fix_req2ack_test_condition-v1-1-4879a1d7f794@foss.st.com>
X-B4-Tracking: v=1; b=H4sIAJl1k2gC/x2N0QrCMAwAf2Xk2UJX0RV/RSTUNtMgbWfSiTD27
 xYfD467DZSESeEybCD0YeVaOoyHAeIzlAcZTp3BWXey3p7NumgTChlrzjjzF4XeLsQXNtKGsZb
 ErTfMNJGf7zaNx+Sh1xahbv9P19u+/wBG27kLeQAAAA==
X-Change-ID: 20250806-upstream_omm_fix_req2ack_test_condition-77e8fb0d13d8
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Christophe Kerello <christophe.kerello@foss.st.com>
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <stable@vger.kernel.org>,
        Patrice
 Chotard <patrice.chotard@foss.st.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_04,2025-08-06_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_083421_828180_86B42FC2 
X-CRM114-Status: GOOD (  11.17  )
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

Fix test which allows to compute req2ack value.

Cc: stable@vger.kernel.org
Fixes: 8181d061dcff ("memory: Add STM32 Octo Memory Manager driver")
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
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


