Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03E36C5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 15:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7GIhYXvKL3wJRk1dIpzuKAKsrZ2kloHNxniKoQVFP+w=; b=Q5dwxdJC8tPQm81cwMvyubeuCb
	lHCaeQ4EmS92wMquvG4+zFlTjKGp2Dgj9xDw96CvnRk4gjVKEfWQl7/9AR1kbFwpEjoi8RGO4cB/4
	uKrCtaaQBfi0M82p8ZjPicMtrYBklZbGHcMqZ7MRZUT6rwK0TtaT3IQJcL340jbWcQ62X/h907K8z
	VkxJM8mbE21HHb5EVYz9v7ntXl9AjihO9sNaZsvhLeY6GKs6U6DFSn/WNic7n57k3zOOXqCyVLvyr
	uMucNfhRfsr+YvCTju8iE9pauG83a3Rt/YKXWIoYTosoUO+MfQJ1/sQN8aQUvVplDCYwVXjRwpiWA
	ECQG+/Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNCyB-0000000FxXD-13P9;
	Thu, 05 Jun 2025 15:57:31 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNCvx-0000000FxIN-364y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Jun 2025 15:55:15 +0000
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555CUO6U017916;
	Thu, 5 Jun 2025 17:54:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=7GIhYXvKL3wJRk1dIpzuKA
	KsrZ2kloHNxniKoQVFP+w=; b=x5nIktGHB6dK7/e+5b1KmApj/ISN8oC8EBNx+s
	z3mdkw0inMfwOVzA8Anab5m1fToIfyw6mDrms8Es8FMQXnJGeCMYa1rql7wYQFl/
	hZHUBltTcubsMP5tGGi2amiyRhley1GvLu9RAlRih2X6KGFagtwJHWI1ATkIjTdY
	B0DWi2jEMxIWuDujRhw7VHbYClJsCndIq/IvVLDj4v2TWYPouzqntnaeV+Ze5MQv
	GqunbPTuErrMaCtO+jyDYZHbOKOBQiK5U3GuLycGnnlOz+IJ/XiaRAO66/KAV8Lb
	SV8WxTfRltHIatB0cHnomljiUxhpi+nOHnC8B46IKGu9Sn8w==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 471g90qrah-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Jun 2025 17:54:57 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 285E540051;
	Thu,  5 Jun 2025 17:54:04 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3CB7ED22AEA;
	Thu,  5 Jun 2025 17:53:41 +0200 (CEST)
Received: from localhost (10.48.87.237) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 5 Jun
 2025 17:53:40 +0200
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
Date: Thu, 5 Jun 2025 17:53:30 +0200
Subject: [PATCH] dmaengine: stm32-dma: configure next sg only if there are
 more than 2 sgs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250605-stm32_dma_dbm_fix-v1-1-44657463d7d6@foss.st.com>
X-B4-Tracking: v=1; b=H4sIAHm9QWgC/x2MQQqAIBAAvxJ7TjDNir4SIdVutQctNCII/550n
 IGZFyIFpgh98UKgmyMfPkNVFrDsk99IMGYGJZWRjTQiXk4ri26yODu78iP03DWqrdDUWEPuzkB
 Z/89hTOkDoElwwGMAAAA=
X-Change-ID: 20250605-stm32_dma_dbm_fix-3b86271d54d4
To: Vinod Koul <vkoul@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <dmaengine@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Amelie Delaunay <amelie.delaunay@foss.st.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.48.87.237]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_04,2025-06-05_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_085514_400914_E2B4F482 
X-CRM114-Status: GOOD (  12.59  )
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

DMA operates in Double Buffer Mode (DBM) when the transfer is cyclic and
there are at least two periods.
When DBM is enabled, the DMA toggles between two memory targets (SxM0AR and
SxM1AR), indicated by the SxSCR.CT bit (Current Target).
There is no need to update the next memory address if two periods are
configured, as SxM0AR and SxM1AR are already properly set up before the
transfer begins in the stm32_dma_start_transfer() function.
This avoids unnecessary updates to SxM0AR/SxM1AR, thereby preventing
potential Transfer Errors. Specifically, when the channel is enabled,
SxM0AR and SxM1AR can only be written if SxSCR.CT=1 and SxSCR.CT=0,
respectively. Otherwise, a Transfer Error interrupt is triggered, and the
stream is automatically disabled.

Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
---
 drivers/dma/stm32/stm32-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/stm32/stm32-dma.c b/drivers/dma/stm32/stm32-dma.c
index 917f8e9223739af853e492d97cecac0e95e0aea3..0e39f99bce8be8c38fe33dd0246012910243d831 100644
--- a/drivers/dma/stm32/stm32-dma.c
+++ b/drivers/dma/stm32/stm32-dma.c
@@ -744,7 +744,7 @@ static void stm32_dma_handle_chan_done(struct stm32_dma_chan *chan, u32 scr)
 		/* cyclic while CIRC/DBM disable => post resume reconfiguration needed */
 		if (!(scr & (STM32_DMA_SCR_CIRC | STM32_DMA_SCR_DBM)))
 			stm32_dma_post_resume_reconfigure(chan);
-		else if (scr & STM32_DMA_SCR_DBM)
+		else if (scr & STM32_DMA_SCR_DBM && chan->desc->num_sgs > 2)
 			stm32_dma_configure_next_sg(chan);
 	} else {
 		chan->busy = false;

---
base-commit: 3c018bf5a0ee3abe8d579d6a0dda616c3858d7b2
change-id: 20250605-stm32_dma_dbm_fix-3b86271d54d4

Best regards,
-- 
Amelie Delaunay <amelie.delaunay@foss.st.com>


