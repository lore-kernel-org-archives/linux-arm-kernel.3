Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB4BCC83030
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 23:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ibqJ1qfXyj8EfT7QyMpwHVnExe5FA06OoPBrLNd9L70=; b=bR90E1sQfrrgFUTjkSlMXBHPZo
	dAomb2xnSNtP5qbI0ERHFBg75yjrQHiCfKCCI+HCTSEobkRNqKQ94uODeJX3c9lSMp6X88bcFWJsZ
	0ZelW6NcWkajwCHOdHgMRwzgMC2pZF+D6QTHnsdOi5CpwhzCvqTuCYvNXbhke1qBjnRNG/pL/tWVy
	nB5Lqtt7VIoS55CPT1sCPkwfxjHYFIDXzg8zH6TUFC/U0cU/e2EYYs7UBMLlLpN4nAhtGe3P2UnzK
	L+QXxWydWOqZqrThZT+P/GAKYxaxIldtnx8ew/GpLlvXiRD2AE7dE5Ft25jpOSaW/AyxBBtG0N3FR
	dryZYRIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXTXl-0000000Cqis-3U2u;
	Thu, 03 Jul 2025 23:40:41 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXRry-0000000Cerj-3n2j
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 21:53:28 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-235d6de331fso5436935ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Jul 2025 14:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1751579606; x=1752184406; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ibqJ1qfXyj8EfT7QyMpwHVnExe5FA06OoPBrLNd9L70=;
        b=Y0qCL+3caZ9Ol9xsBb73cPHF1XrkELICen8Szdfar6+1ilX+ajwP9Rdw6M8KINLcRO
         +QDm/jPdgdLQAivT1Of3BsUU3aL1nGuePtp3KrERQnQvGblH8QcA8riLKTrxm+dyig4D
         nCTaTAY0ezZDN7bt6KKmdLSZfKhlA6Qp2soEA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751579606; x=1752184406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ibqJ1qfXyj8EfT7QyMpwHVnExe5FA06OoPBrLNd9L70=;
        b=s+ndSorSTpPWsI25E3ujx13mTuUyfTtdAZf9KRu1IDq6dTB31IJMRBp3pPpX5t4App
         uiZdX2SolsQoL3oXKQQTZ4q9u+yLc8N9sfZFRjm8SKwDI2peFZn6COAtytIRCh90zHhj
         8Qc6uSd2ciP7qZK0gvH+bfwu5JBmZz3mlimXVKiQqnApkt8Df+pQ78C6GlZTioER0gda
         rUDTsjM/fswjdOyQQpkzzwbU2V2H+ghczbT/d7cKS5S8Ml7Pwo7jQNowrgKvlv5CALH4
         j6Fvj9vE8gQAUdK2xkYY1fhqtIKRl0DzkK38qeCzR4jLEmh8UkyXFT3+m6xfVNIfXUQ/
         wulw==
X-Forwarded-Encrypted: i=1; AJvYcCXfFL7QVFYvYvhBPkPZeKkgPiIXUPcHfR1Nj7LadrG4XlRadESAdNOVDDv8V9H7v6vT3YOGlEPqbMw6gPWFPbbE@lists.infradead.org
X-Gm-Message-State: AOJu0YzYNlgg/k95eAqXrFYvsBt31EaIY9Sqlul7GiS5kLp8dh7gum7Y
	fkYZpRzUCZSIP84Pybqr02GDFxFLdJoLeDB3oJjGaDFq6jCj0lIMw4hGywwLXbc7MQ==
X-Gm-Gg: ASbGncv6Ba2GfZPnNqyBGUz/CQ8ycsdAh7fXIf6ccKjVT44DnoUJWb1BzMTlune7cF0
	6YT3bveAu/pnks98Tld5Au3hWoT1mnEjrIoOd8GJuGPvORxlFmhF0EEgTHCQBx02sqjO3f1DNN9
	YKk/U0yl29yeTV6AsEF7kaPO1Q6k5upaN0E+StLjgVuNIktWQpEjphia8k+c1GRqxQUjZckHESK
	1bUnPo+aaIm04TT/0Bs7WvYIvtDWW07UCF6Irn1292asHuvfV/tchUR8AtjGMSrowRpZSqG7FI1
	FfHa8G3YAXd0OxD9/eQ5dmhPlW47K76iUGdaYjHfjd2kRRtASr2GeeOT0+JGakx/rSR5pkHBU6M
	hfngMrdSTxis9y3CJ4gPLGi8A8Si1YP22PxjW3R2PtdiPsy8hBanu
X-Google-Smtp-Source: AGHT+IG43raFFh4Sga/+BHu1LSaZfdBpoQXF3HpuWwfM1okK6fDZ+ygvWWjun6fbVM2HU0P90x4sUg==
X-Received: by 2002:a17:903:1a03:b0:234:a139:11fa with SMTP id d9443c01a7336-23c85d9e22emr5623665ad.3.1751579606352;
        Thu, 03 Jul 2025 14:53:26 -0700 (PDT)
Received: from stband-bld-1.and.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8459b3a0sm4249645ad.219.2025.07.03.14.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 14:53:25 -0700 (PDT)
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
Subject: [PATCH 2/3] PCI: brcmstb: Acommodate newer SOCs with next-gen PCIe inbound mapping
Date: Thu,  3 Jul 2025 17:53:12 -0400
Message-Id: <20250703215314.3971473-3-james.quinlan@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250703215314.3971473-1-james.quinlan@broadcom.com>
References: <20250703215314.3971473-1-james.quinlan@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_145326_942790_1050BCDA 
X-CRM114-Status: GOOD (  19.20  )
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

New SoCs are coming that are not encumbered with a baroque internal memory
mapping scheme or power-of-two restrictions on the sizes of inbound
regsions.  Enable the driver to use these SoCs.

Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
---
 drivers/pci/controller/pcie-brcmstb.c | 61 ++++++++++++++++++++++++++-
 1 file changed, 60 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
index 5c8aa5e36338..362ac083e112 100644
--- a/drivers/pci/controller/pcie-brcmstb.c
+++ b/drivers/pci/controller/pcie-brcmstb.c
@@ -152,6 +152,8 @@
 
 #define PCIE_MSI_INTR2_BASE		0x4500
 
+#define PCIE_MISC2_BAR1_CONFIG_SIZE				0x4700
+
 /* Offsets from INTR2_CPU and MSI_INTR2 BASE offsets */
 #define  MSI_INT_STATUS			0x0
 #define  MSI_INT_CLR			0x8
@@ -282,6 +284,15 @@ enum pcie_soc_base {
  */
 #define IS_CM_SOC(t) ((t) == BCM3162 || (t) == BCM33940 || (t) == BCM3392)
 
+/*
+ * Newer chips (NG is "Next Generation") have simplified the design of how
+ * inbound regions are mapped to system memory as compared to previous STB
+ * designs.  In addition, the inbound window size is not restricted to be a
+ * power of two.  Such systems may or may not have an IOMMU between the RC
+ * and memory.
+ */
+#define IS_NG_PCI_SOC(t) (0)
+
 struct inbound_win {
 	u64 size;
 	u64 pci_offset;
@@ -1008,7 +1019,8 @@ static int brcm_pcie_get_inbound_wins(struct brcm_pcie *pcie,
 		 * memory.  That being said, each window's size must still
 		 * be a power of two.
 		 */
-		if (pcie->cfg->soc_base == BCM7712 || IS_CM_SOC(pcie->cfg->soc_base))
+		if (pcie->cfg->soc_base == BCM7712 || IS_CM_SOC(pcie->cfg->soc_base)
+		    || IS_NG_PCI_SOC(pcie->cfg->soc_base))
 			add_inbound_win(b++, &n, size, cpu_start, pcie_start);
 
 		if (n > pcie->cfg->num_inbound_wins)
@@ -1020,6 +1032,22 @@ static int brcm_pcie_get_inbound_wins(struct brcm_pcie *pcie,
 		return -EINVAL;
 	}
 
+	if (IS_NG_PCI_SOC(pcie->cfg->soc_base)) {
+		/*
+		 * STB NG SoCs may still be limited with three inbound
+		 * windows, and if so, the last one should be disabled.
+		 */
+		if (pcie->cfg->num_inbound_wins == 3) {
+			n = 2;
+			add_inbound_win(b++, &n, 0, 0, 0);
+		}
+		/*
+		 * NG SoCs do not have internal mapping system that enables
+		 * multiple memory controllers, so return now.
+		 */
+		return n;
+	}
+
 	/*
 	 * 7712, CM, and newer chips do not have an internal memory
 	 * mapping system that enables multiple memory controllers.  As
@@ -1120,6 +1148,17 @@ static u32 brcm_ubus_reg_offset(int bar)
 		return PCIE_MISC_UBUS_BAR4_CONFIG_REMAP + 8 * (bar - 4);
 }
 
+/*
+ * NG SoCs have configurable inbound region size registers (as opposed to
+ * having to set them to a power of two).  There are multiple contiguous
+ * registers, one for each inbound window.  This function provides the
+ * register offset for a specific window.
+ */
+static unsigned int brcm_calc_config_size_reg_offset(int bar)
+{
+	return PCIE_MISC2_BAR1_CONFIG_SIZE + (bar - 1) * 4;
+}
+
 static void set_inbound_win_registers(struct brcm_pcie *pcie,
 				      const struct inbound_win *inbound_wins,
 				      u8 num_inbound_wins)
@@ -1134,6 +1173,24 @@ static void set_inbound_win_registers(struct brcm_pcie *pcie,
 		u32 reg_offset = brcm_bar_reg_offset(i);
 		u32 tmp = lower_32_bits(pci_offset);
 
+		if (IS_NG_PCI_SOC(pcie->cfg->soc_base)) {
+			/* PCIe address */
+			writel(lower_32_bits(pci_offset), base + reg_offset);
+			writel(upper_32_bits(pci_offset), base + reg_offset + 4);
+
+			/* Size of region */
+			reg_offset = brcm_calc_config_size_reg_offset(i);
+			/* Register value has granularity of 4k units */
+			writel(size >> 12, base + reg_offset);
+
+			/* CPU address */
+			reg_offset = brcm_ubus_reg_offset(i);
+			writel(lower_32_bits(cpu_addr), base + reg_offset);
+			writel(upper_32_bits(cpu_addr), base + reg_offset + 4);
+
+			continue;
+		}
+
 		u32p_replace_bits(&tmp, brcm_pcie_encode_ibar_size(size),
 				  PCIE_MISC_RC_BAR1_CONFIG_LO_SIZE_MASK);
 
@@ -1264,6 +1321,8 @@ static int brcm_pcie_setup(struct brcm_pcie *pcie)
 	 */
 	if (IS_CM_SOC(pcie->cfg->soc_base))
 		pcie->msi_target_addr = BRCM_MSI_TARGET_ADDR_FOR_CM;
+	else if (IS_NG_PCI_SOC(pcie->cfg->soc_base))
+		pcie->msi_target_addr = BRCM_MSI_TARGET_ADDR_GT_4GB;
 	else if (inbound_wins[2].pci_offset >= SZ_4G ||
 		 (inbound_wins[2].size + inbound_wins[2].pci_offset) < SZ_4G)
 		pcie->msi_target_addr = BRCM_MSI_TARGET_ADDR_LT_4GB;
-- 
2.34.1


