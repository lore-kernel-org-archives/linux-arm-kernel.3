Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BA71CA0EF8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 14:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eXSSb7hau3lLxL822Dash4tjRXgn93V51VZQeX8MsTE=; b=dGoK+MAfykaOEcQzH14chcGlDb
	CXhE8cR98HcFKMSNv9Me+U1o8Vuvn39PPxo+yj5Ry3k2KHrf61v9JKxyI+Ybrg1BdyjKPzEHAnjjk
	4mghAiYVm9eahSWoHXkttQet7s3HnY/zMJ+07k9o+oHEZb2xTNudakCDFxWvXD4ry/QM153mfrpCe
	qgdlup0kg0w6oVgl6iHAsu9OtwZWeencoS8gsDpT5SOh4yt1dYrAc+Owq8HCuUEynvZUuF7cgbroG
	AX7ciDKu9DVZjIQOAdzJmdh28JW2BxNaDVi3srXw0vo/xBAuG25qpxz/6eT67s1oViHzIxeg9yvYk
	BuC9864w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up5tY-0000000HA5E-1EFg;
	Thu, 21 Aug 2025 14:04:00 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up1OE-0000000GMrN-3LG1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 09:15:24 +0000
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57L90E15004160;
	Thu, 21 Aug 2025 11:15:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=eXSSb7hau3lLxL822Dash4
	tjRXgn93V51VZQeX8MsTE=; b=fNjIcH9Hmk72pMu7f1tlbcksLZaFHNHkh1SdVV
	tgj4ljvki2fdQmUMBdqCvX3iqCQjIYheSH4uBwU4i4BEw067gmtu3Wn9IRA8Q6L2
	3pu+EmCDbQMfeKuGGrvKjzF4oFd2PJFaJYITJu5O73s50I5o+idJ32ABbM2AMrF+
	EFrI2fM555PSmkFHnnsuE/GG+7KI1Iuf/JpTBFbxtns7OnWc79aM4qy0g/+amELF
	xgYPLauk9wH4LUzhbMhcYE4Rmu+b8MjeaqGojKA2+ox3K2/wsLWtqRxXm1avOpYX
	Mx3EwvEO2jrpwUVr1vIWoyDMJ+aKIQ4+Az4RQPI7wvGrGpnQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48n81wnvsx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Aug 2025 11:15:14 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 3B9BF40048;
	Thu, 21 Aug 2025 11:14:26 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BF2DA73D3F4;
	Thu, 21 Aug 2025 11:14:04 +0200 (CEST)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 21 Aug
 2025 11:14:04 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Thu, 21 Aug 2025 11:14:02 +0200
Subject: [PATCH] arm64: defconfig: Enable STMicroelectronics STM32 DMA3
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250821-upstream_defconfig_enable_stm32_dma3-v1-1-d9c1b71883d9@foss.st.com>
X-B4-Tracking: v=1; b=H4sIAFnjpmgC/x3NWwrCMBBG4a2UeTaQCxZ1KyIhJn/qgElLphWhd
 O8GH7+Xc3YSNIbQbdip4cPCc+0wp4HiK9QJilM3WW3P+mK12hZZG0LxCTnONfPkUcPzDS9rcda
 nEpyKJl5dNmbEaKmnlobM3//m/jiOHy2UqVh2AAAA
X-Change-ID: 20250820-upstream_defconfig_enable_stm32_dma3-c1c93f116e62
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Patrice Chotard
	<patrice.chotard@foss.st.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_02,2025-08-20_03,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_021523_317259_662CADBB 
X-CRM114-Status: UNSURE (   8.31  )
X-CRM114-Notice: Please train this message.
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

Enable STMicroelectronics STM32 DMA3 support as module.
STM32 DMA3 is used among others by STM32 Octo SPI driver on
STM32MP257F-EV1 board.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 667c4859ecc3cda9b0a3dae7abdd8587fc4f8dbe..d0a9d2a5b140aabe40927981ee710b0eb3b729cf 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1302,6 +1302,7 @@ CONFIG_RENESAS_USB_DMAC=m
 CONFIG_RZ_DMAC=y
 CONFIG_TI_K3_UDMA=y
 CONFIG_TI_K3_UDMA_GLUE_LAYER=y
+CONFIG_STM32_DMA3=m
 CONFIG_VFIO=y
 CONFIG_VFIO_PCI=y
 CONFIG_VIRTIO_PCI=y

---
base-commit: 5303936d609e09665deda94eaedf26a0e5c3a087
change-id: 20250820-upstream_defconfig_enable_stm32_dma3-c1c93f116e62

Best regards,
-- 
Patrice Chotard <patrice.chotard@foss.st.com>


