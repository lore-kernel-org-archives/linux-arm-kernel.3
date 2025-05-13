Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71781C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 15:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=S0lXHtXZiBNe2UA5zB9pQMWlV9t4LIkccdodCgquO/A=; b=OGuOKTzbfdmysX8+AAr5/OeLAU
	HawMkABI4nljdRhPztf2DcRv8q1Tj4PN1vvxKifY8rhKOnjA0WDYFGgfSfb7mNT0MehtITp9bKJVu
	3TOjhX/YQSMSn/hF2yqJ+I/SxY1dyeyMsfxIwcywmgj4cmxYwsnxdZGRlkxDjFxHaeIShCTCqAEcO
	tqbhf2kiITtCGY7eJInoYaBbYdoEl/Ftd4/Y9L++LRrN6m7Dp+mj7pLYNFrFLPVcqXuap0wntwZWR
	fMSw1mvaaDY8pFfLICvknuKa8LgfoDaMkOJDLSq7dnvJKxjwGh3GMlImwir1C6JKgHORsIWgo1EDq
	ZKSBkdQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uErmC-0000000Cp9K-06o9;
	Tue, 13 May 2025 15:42:40 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uErhu-0000000CoKR-2eiX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 15:38:16 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54DDx9qo003335;
	Tue, 13 May 2025 17:38:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=S0lXHtXZiBNe2UA5zB9pQM
	WlV9t4LIkccdodCgquO/A=; b=p9JGB16a4j66mxFLU3vLFy8QHAp3DtF+cNhAk0
	c4d3mHbEs6GyXdmRMHj08EkDk5LvYCYsONNUTmKdf6K34Hb7kS1RCXDERHkK8gCQ
	kCtd5/XcUnp9IJyAs+O7t5S1VpxZjV5Ngh/WKLicCvO7tE5htIBF71HSnb6F+pbj
	MRxtFmsWHSHV1urhK4yxFnaojJF+EWig7cJyKiLtFYbufdRP9MlBglWaBkOB3xUn
	Ugs66fKGuWDXzPZWHmrOpfYLWQOZmMu8e6azSrAHnGkDigH0xsxpBjGvayIT3+i5
	V/fMiDsSRAoe7TA4u4qU18U8aWd4z0jVxcAOZRZg+lPnXCwA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46huxacqp5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 May 2025 17:38:07 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id E936C40045;
	Tue, 13 May 2025 17:36:52 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 66CE2A2A2E5;
	Tue, 13 May 2025 17:34:38 +0200 (CEST)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 13 May
 2025 17:34:38 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Tue, 13 May 2025 17:34:31 +0200
Subject: [PATCH] memory: stm32_omm: Fix error handling in
 stm32_omm_disable_child()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250513-stm32_omm_fix_typo-v1-1-5b90ec8b52e7@foss.st.com>
X-B4-Tracking: v=1; b=H4sIAIZmI2gC/x2MQQqAIBAAvyJ7TjDTQ30lQirX2oMaKlFEf086D
 sPMAxkTYYaBPZDwpEwxVGgbBus+hw052coghdRCtx3PxXfSRO+No8uU+4gcrVuUm1Vv0UINj4T
 V/dNxet8PcNgQXGQAAAA=
X-Change-ID: 20250513-stm32_omm_fix_typo-edfb4fa49ded
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
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-13_03,2025-05-09_01,2025-02-21_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_083814_952888_C9E872C0 
X-CRM114-Status: GOOD (  11.24  )
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

Fix stm32_omm_toggle_child_clock() return value test, we should exit
only on non zero value.

Fixes: 8181d061dcff ("memory: Add STM32 Octo Memory Manager driver")
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 drivers/memory/stm32_omm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/memory/stm32_omm.c b/drivers/memory/stm32_omm.c
index 8523d9601af20fc8fe74cceea84e63d253cafec1..79ceb1635698f6bc8bd4a39fdeaced1ec318e1f6 100644
--- a/drivers/memory/stm32_omm.c
+++ b/drivers/memory/stm32_omm.c
@@ -164,7 +164,7 @@ static int stm32_omm_disable_child(struct device *dev)
 	u8 i;
 
 	ret = stm32_omm_toggle_child_clock(dev, true);
-	if (!ret)
+	if (ret)
 		return ret;
 
 	for (i = 0; i < omm->nb_child; i++) {

---
base-commit: 0169a24036848cf18205301673259bb6879eef97
change-id: 20250513-stm32_omm_fix_typo-edfb4fa49ded

Best regards,
-- 
Patrice Chotard <patrice.chotard@foss.st.com>


