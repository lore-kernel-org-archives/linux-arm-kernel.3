Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E72EC83F0D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 23:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nxuuX3SmTe/KHiGqxZf5tezD/Xp394VdI3B/HTH6SAc=; b=CIvZdijBD0YzJaavWN6fmUIANV
	+efQLg/gCybh6XwEei6B87DAxdMLh23ttxch3RrPiaEFxeq8U6QTCjogGSXOV1gtigV9HEemluziu
	BvUS6wH670ol4QCtjvoNJQhBgWbr/sfnZwYiSBfCe2gXvc3Doq8B82QqA53F1/FiKR3mbGr6QYG7F
	geA8sDDgPLMDklYSibWQ1Y41FsQ6jnla8I84dhL2wWdemGtannYKnVmVqxH12Y2JV7mQwCttGqGMU
	j8AIuh11GlcES043KDXLjVmCIqysgfeQCFDz09uYqLVpCuBXsDmCk5VcuZvFBhlc0lFwt9X6/w4Av
	zsClZ+Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXTXm-0000000CqjE-21WP;
	Thu, 03 Jul 2025 23:40:42 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXRs2-0000000Ceso-0FRB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 21:53:31 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-235ef62066eso6659775ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Jul 2025 14:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1751579609; x=1752184409; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nxuuX3SmTe/KHiGqxZf5tezD/Xp394VdI3B/HTH6SAc=;
        b=Uvo8+/b7EkdcKYra8I3NpHZtOb0k0VztEeumqXBbR7uctl+sjt2Z6OgFK3oW/F9nR7
         3i8yZu7UAjQjIDDzE1QEtAfuyHowygmmCTTnIgDGmA4KKsv9QXhw/NBS25ku9HsjOvqt
         VMTQkp3iWVIBKZHBLcDToiyXG7epMU+2hFRHk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751579609; x=1752184409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nxuuX3SmTe/KHiGqxZf5tezD/Xp394VdI3B/HTH6SAc=;
        b=ZvGbkHADpejPBLcBJQS7KucZj8yjwRcAFIO+XhaeyJN6AVWOJDKOFZ4Q85RS6Jj28W
         gueQ+UJUSVnwEv2IRzsVOp0A3di/5wBlR2G5vATO3pBIy123HCsRQr68DgX8BXf8ST5k
         d2c466vSM7lzaBB/72kB8HMY3YF24T0R4OJBxPagLJYTbL9+TFQCBOr/OuAd3tSopE5K
         KTSb2fKizo89oCs2vhuTd0zTd8bX6V1JykgYYefxl1AgI+m5+1nz/NRaJsjYYVe8e1Lf
         UUw2bONLe+ttJftlq6EIKe9H36AI2GU/l1PWgayITuLrQU2a2/J4x4nKw2sILDfIO+LJ
         NG5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUVL8V2Cr7DwineG98m4WqVDmMijWD2eOBkY01n1vcEYn+yt7YgmIEmySQIRj67FvdtLK98LcvbPdeB/O1o25eF@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+Mbj4tlcuoHh+bKVX7d0UHLK/L9oPjmxymUBBJIwvHotJlKdJ
	+OtxboOhGw7C7B5TnUxp4S1Sf9iYHp/Akn5nk6Fy16reL037D2zk1pXsCBEFEdSjhQ==
X-Gm-Gg: ASbGncv9/OP3BNRxzEYcl/O2QHWWRjZz38/NZTIIblzpjMFUB2aiiCwfcBtJTLLugW/
	3uRVohlhTsxfsSzc43el9rLNxCPX6PclqwoelNycj3RAdb7mnhnlzMZSH40Wc5hwYcBdhHHgRhg
	xUUSQC1XTNFn81LBhsnF7dV7UkPjzSM1mD9ROXh3CYYjT7C9TEaPeJQymok8QaWKoTWqD3nBe1g
	O1Hsd9HU+U1mTs7SNO6qjGIkfhq5Z6OJXN+o7sy4JewiszziR31IHxhp6N+a3ePSAHCr2gVpvLk
	ZLGnBXgPM2ILRhIgl2/i6U9XNqmZAboN5qQZg9TFuUv8jdQriL4w2hcVXeiwS+5zID3hDebHGjQ
	X8IHPsBg17wdFfY/liO51T2mmNewAsSxpZBdhMPzxPQ==
X-Google-Smtp-Source: AGHT+IFglctMK4Y0kmMgoX4O2sEYz7+usWw4Ox+ioQ0YNjPdTo5gPJOnupN4TRKyDCVpucZphxoS0w==
X-Received: by 2002:a17:902:f684:b0:210:f706:dc4b with SMTP id d9443c01a7336-23c86064c7amr4212915ad.13.1751579609484;
        Thu, 03 Jul 2025 14:53:29 -0700 (PDT)
Received: from stband-bld-1.and.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8459b3a0sm4249645ad.219.2025.07.03.14.53.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 14:53:28 -0700 (PDT)
From: Jim Quinlan <james.quinlan@broadcom.com>
To: linux-pci@vger.kernel.org,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Cyril Brulebois <kibi@debian.org>,
	bcm-kernel-feedback-list@broadcom.com,
	jim2101024@gmail.com,
	james.quinlan@broadcom.com
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	linux-rpi-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 3/3] PCI: brcmstb: Add 74110a0 SoC configuration details
Date: Thu,  3 Jul 2025 17:53:13 -0400
Message-Id: <20250703215314.3971473-4-james.quinlan@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250703215314.3971473-1-james.quinlan@broadcom.com>
References: <20250703215314.3971473-1-james.quinlan@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_145330_099969_6F571905 
X-CRM114-Status: GOOD (  11.76  )
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

Enable PCIe for 74110a0 SoC.  This chip uses a simple mechanism
to map inbound memory regions.  Both the "ranges" and "dma-ranges"
are identity-mapped to PCIe space.

Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
---
 drivers/pci/controller/pcie-brcmstb.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
index 362ac083e112..bfedab15a162 100644
--- a/drivers/pci/controller/pcie-brcmstb.c
+++ b/drivers/pci/controller/pcie-brcmstb.c
@@ -276,6 +276,7 @@ enum pcie_soc_base {
 	BCM7435,
 	BCM7712,
 	BCM33940,
+	BCM74110,
 };
 
 /*
@@ -291,7 +292,7 @@ enum pcie_soc_base {
  * power of two.  Such systems may or may not have an IOMMU between the RC
  * and memory.
  */
-#define IS_NG_PCI_SOC(t) (0)
+#define IS_NG_PCI_SOC(t) ((t) == BCM74110)
 
 struct inbound_win {
 	u64 size;
@@ -2046,6 +2047,14 @@ static const int pcie_offsets_bcm7712[] = {
 	[PCIE_INTR2_CPU_BASE]	= 0x4400,
 };
 
+static const int pcie_offset_bcm74110[] = {
+	[RGR1_SW_INIT_1] = 0xc010,
+	[EXT_CFG_INDEX]  = 0x9000,
+	[EXT_CFG_DATA]   = 0x8000,
+	[PCIE_HARD_DEBUG] = 0x4204,
+	[PCIE_INTR2_CPU_BASE] = 0x4300,
+};
+
 static const int pcie_offset_bcm33940[] = {
 	[RGR1_SW_INIT_1] = 0x9210,
 	[EXT_CFG_INDEX] = 0x9000,
@@ -2162,6 +2171,15 @@ static const struct pcie_cfg_data bcm33940_cfg = {
 	.num_inbound_wins = 10,
 };
 
+static const struct pcie_cfg_data bcm74110_cfg = {
+	.offsets	= pcie_offset_bcm74110,
+	.soc_base	= BCM74110,
+	.perst_set	= brcm_pcie_perst_set_7278,
+	.bridge_sw_init_set = brcm_pcie_bridge_sw_init_set_generic,
+	.has_phy	= true,
+	.has_err_report	= true,
+};
+
 static const struct of_device_id brcm_pcie_match[] = {
 	{ .compatible = "brcm,bcm2711-pcie", .data = &bcm2711_cfg },
 	{ .compatible = "brcm,bcm2712-pcie", .data = &bcm2712_cfg },
@@ -2177,6 +2195,7 @@ static const struct of_device_id brcm_pcie_match[] = {
 	{ .compatible = "brcm,bcm7445-pcie", .data = &generic_cfg },
 	{ .compatible = "brcm,bcm7712-pcie", .data = &bcm7712_cfg },
 	{ .compatible = "brcm,bcm33940-pcie", .data = &bcm33940_cfg },
+	{ .compatible = "brcm,bcm74110-pcie", .data = &bcm74110_cfg },
 	{},
 };
 
-- 
2.34.1


