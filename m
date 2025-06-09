Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E076AC61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 22:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IMoKAlogNuxi+k73MimG2uE83AVBZtkP2P3fFABB9ok=; b=n8zPWyD9Oxrsm2p8TJpfbWWOMb
	zfKdIeLelWDiDXQ77myhvBQ0e+P8IWCp18TMGtfQ5R2Fg6TVjev3xpaXkY1ekhLh6vb38jkZ3OTKJ
	jBpNWW0lOh6/L2aVY5B73m/8Hawl269YXN2wbbx/vsEZ/HRdqZydb3xt4fZRtj7G8suevWINMdgyz
	IDOl608jVGg7gmOfby/VyNmfN21yInBkthN9YnHXuOxNvBuJfdf9F/E7P0Trw6tGBPwmorN/6HdOO
	vkKLOGBXIjn3Z23mCXK9am6a1/ZUGNiZf5w/0fNHD746KVvn6Hs/qHqtEGBlnk4lnTo3P+sgOMjpq
	Dxjp4kQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOkwV-00000005LSs-3HzB;
	Mon, 09 Jun 2025 22:26:11 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOko3-00000005Kio-2JOa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 22:17:28 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-747fc77bb2aso3731343b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Jun 2025 15:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1749507447; x=1750112247; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IMoKAlogNuxi+k73MimG2uE83AVBZtkP2P3fFABB9ok=;
        b=I/gLiQ6HWten7y6tXYQUyykxEF5sL+nnTCDqrOM2ktgXjfwwYlbZrSr2/Q1JbOhX3t
         0fJFiZRctLTjgkz0GB6XhVFpq5wWIgXUdMcFP7lW7vriaUd2VWR34GBidgn2p6Qz6wtf
         +NnAQUWDKhu91Pc+aQOMxIgR7KdoaPGSlkYJM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749507447; x=1750112247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IMoKAlogNuxi+k73MimG2uE83AVBZtkP2P3fFABB9ok=;
        b=u721Si5udyoszcOJgcufUpVFqJbRlWt4GR1l35gSig5iYjGT3d8/Bg3eNaJmvkUSe8
         cb7XkevpVWBh1gy9PLTTzPUClY+w7IUUH33WdMQDVNcDHk8fBApYgWpZUAEfHSqQl+ns
         9m1Uo4cnSrrTNSvF/trXNi/9WUgg+hwa0JR7oZaDy2fF38/6YPVtJ9OXiFRmXWSr4eA8
         BrUhExo3fBsUBnprCyluQxZC4uRsMshhgd2CU/pLuBPNo09YSi0zzwitgrV5py82XB+O
         xOjmwj4v3EIDPyPsrCzM28qF3i2Z9muDh3BmvM6CH5M1UphNjxi89SA/O0hAu0HmelSa
         kQMA==
X-Forwarded-Encrypted: i=1; AJvYcCWkddpoPVBu6Kkwivstpewh8UYBpXBPyoCInUM398ETL/IEAz5rZn4nmkPUjLtwrNfxaOkPbesXNNzHuGXRebvK@lists.infradead.org
X-Gm-Message-State: AOJu0Yyd1tsap4SRAMfhI68fX7fEZ4pN1lx2MFs2rMraFCHRxL2Gfoue
	bUhvi1xMFA/JpY2i2Cntmk2IEEzAXlYItF+XfITZZYcC1Q+n7KXKq5gb8jXp8Wq42A==
X-Gm-Gg: ASbGncvSdY/UL0cACjI7PZJiVz2XEkw6QF31g1sHj6AUa2McnhbRoe9szzs6SQOrDIr
	+S0mEcXgveXynO1piwWtCtn1/43Plz1i64WKUaOh/zVbiFRU8hsmn//Il098rnQTa5JN41om5AX
	N6wcxLOs7kSC8kYIGycf6KugrufINb3x5QWZYFeKL4FWqJIS3x5W5Qyn1tqav9AJ4Zas9uzW1GS
	Ce2Bh8T93/IJDrU5BXxb9wNUIz9U/sNLaR7S8dX/KZaoudvh+lPLYz4k0Df5kvOH4havLVCry+/
	R0uNaatcZ1TbKPND4WF60URQ/OUgkcQ2hKY9vUqcRfrQbcqTM/WAh+tR0nSz0gBH8TQxqO88dcq
	vGVJCGJU7Xz1wjmP8Ze+jPQ2VfDdKcR908cy3M7AC0W8n3lmTywNe
X-Google-Smtp-Source: AGHT+IH9Z2VFHsTsQkiIm50bQai7IcSgX6nHAp/z/E6H/q5Ll4+CHu3KKn/F1i+u9OsTfpSNvWZuDg==
X-Received: by 2002:a17:90b:2ec7:b0:312:ec:4128 with SMTP id 98e67ed59e1d1-3134706f814mr18808620a91.34.1749507446759;
        Mon, 09 Jun 2025 15:17:26 -0700 (PDT)
Received: from stbsrv-and-02.and.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603078d65sm59290415ad.5.2025.06.09.15.17.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 15:17:26 -0700 (PDT)
From: Jim Quinlan <james.quinlan@broadcom.com>
To: linux-pci@vger.kernel.org,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
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
Subject: [PATCH 3/3] PCI: brcmstb: Enable Broadcom Cable Modem SoCs
Date: Mon,  9 Jun 2025 18:17:06 -0400
Message-ID: <20250609221710.10315-4-james.quinlan@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250609221710.10315-1-james.quinlan@broadcom.com>
References: <20250609221710.10315-1-james.quinlan@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_151727_593204_0FEB1AF0 
X-CRM114-Status: GOOD (  30.30  )
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

Broadcom's Cable Modem (CM) group also uses this PCIe driver
as it shares the PCIe HW core with the STB group.

Make the modifications to enable the CM SoCs.

Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
---
 drivers/pci/controller/pcie-brcmstb.c | 186 +++++++++++++++++++++-----
 1 file changed, 152 insertions(+), 34 deletions(-)

diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
index db7872cda960..e25dbcdc56a7 100644
--- a/drivers/pci/controller/pcie-brcmstb.c
+++ b/drivers/pci/controller/pcie-brcmstb.c
@@ -51,6 +51,9 @@
 #define PCIE_RC_CFG_PRIV1_ROOT_CAP			0x4f8
 #define  PCIE_RC_CFG_PRIV1_ROOT_CAP_L1SS_MODE_MASK	0xf8
 
+#define PCIE_RC_DL_PDL_CONTROL_4			0x1010
+#define  PCIE_RC_DL_PDL_CONTROL_4_NPH_FC_INIT_MASK	0xff000000
+
 #define PCIE_RC_DL_MDIO_ADDR				0x1100
 #define PCIE_RC_DL_MDIO_WR_DATA				0x1104
 #define PCIE_RC_DL_MDIO_RD_DATA				0x1108
@@ -60,6 +63,7 @@
 #define  PCIE_RC_PL_PHY_CTL_15_PM_CLK_PERIOD_MASK	0xff
 
 #define PCIE_MISC_MISC_CTRL				0x4008
+#define  PCIE_MISC_MISC_CTRL_PCIE_IN_CPL_RO_MASK	0x20
 #define  PCIE_MISC_MISC_CTRL_PCIE_RCB_64B_MODE_MASK	0x80
 #define  PCIE_MISC_MISC_CTRL_PCIE_RCB_MPS_MODE_MASK	0x400
 #define  PCIE_MISC_MISC_CTRL_SCB_ACCESS_EN_MASK		0x1000
@@ -170,6 +174,7 @@
 /* MSI target addresses */
 #define BRCM_MSI_TARGET_ADDR_LT_4GB	0x0fffffffcULL
 #define BRCM_MSI_TARGET_ADDR_GT_4GB	0xffffffffcULL
+#define BRCM_MSI_TARGET_ADDR_FOR_CM	0xfffffffffcULL
 
 /* MDIO registers */
 #define MDIO_PORT0			0x0
@@ -223,13 +228,23 @@ enum {
 enum pcie_soc_base {
 	GENERIC,
 	BCM2711,
+	BCM3162,
+	BCM3392,
+	BCM3390,
 	BCM4908,
 	BCM7278,
 	BCM7425,
 	BCM7435,
 	BCM7712,
+	BCM33940,
 };
 
+/*
+ * BCM3390 CM chip actually conforms to STB design, so it
+ * is not present in the macro below.
+ */
+#define IS_CM_SOC(t) ((t) == BCM3162 || (t) == BCM33940 || (t) == BCM3392)
+
 struct inbound_win {
 	u64 size;
 	u64 pci_offset;
@@ -757,6 +772,9 @@ static int brcm_pcie_bridge_sw_init_set_generic(struct brcm_pcie *pcie, u32 val)
 	u32 shift = RGR1_SW_INIT_1_INIT_GENERIC_SHIFT;
 	int ret = 0;
 
+	if (IS_CM_SOC(pcie->cfg->soc_base))
+		return 0;
+
 	if (pcie->bridge_reset) {
 		if (val)
 			ret = reset_control_assert(pcie->bridge_reset);
@@ -891,13 +909,13 @@ static int brcm_pcie_get_inbound_wins(struct brcm_pcie *pcie,
 	struct inbound_win *b = b_begin;
 
 	/*
-	 * STB chips beside 7712 disable the first inbound window default.
-	 * Rather being mapped to system memory it is mapped to the
-	 * internal registers of the SoC.  This feature is deprecated, has
-	 * security considerations, and is not implemented in our modern
-	 * SoCs.
+	 * STB chips beside CM chips and 7712 disable the first inbound
+	 * window default.  Rather being mapped to system memory it is
+	 * mapped to the internal registers of the SoC.  This feature is
+	 * deprecated, has security considerations, and is not
+	 * implemented in our modern SoCs.
 	 */
-	if (pcie->cfg->soc_base != BCM7712)
+	if (pcie->cfg->soc_base != BCM7712 && !IS_CM_SOC(pcie->cfg->soc_base))
 		add_inbound_win(b++, &n, 0, 0, 0);
 
 	resource_list_for_each_entry(entry, &bridge->dma_ranges) {
@@ -905,16 +923,32 @@ static int brcm_pcie_get_inbound_wins(struct brcm_pcie *pcie,
 		u64 cpu_start = entry->res->start;
 
 		size = resource_size(entry->res);
+
+		/*
+		 * For BCM3390, single dma-range may map to the SoC
+		 * register space in [0xf0000000..0xffffffff].  If present,
+		 * this has to be assigned to inbound window #1, as this is
+		 * the only one that HW allows to map to register space.
+		 * So if we see this range, place it in inbound_wins[1]
+		 * which is previously disabled (zeroed out).
+		 */
+		if (pcie->cfg->soc_base == BCM3390 && cpu_start >= 0xf0000000
+		    && cpu_start + size - 1 <= 0xffffffff) {
+			add_inbound_win(b_begin, &n, size, cpu_start, pcie_start);
+			n--;
+			continue;
+		}
+
 		tot_size += size;
 		if (pcie_start < lowest_pcie_addr)
 			lowest_pcie_addr = pcie_start;
 		/*
-		 * 7712 and newer chips may have many BARs, with each
-		 * offering a non-overlapping viewport to system memory.
-		 * That being said, each BARs size must still be a power of
-		 * two.
+		 * 7712, CM, and newer chips may have many inbound windows,
+		 * with each offering a non-overlapping viewport to system
+		 * memory.  That being said, each window's size must still
+		 * be a power of two.
 		 */
-		if (pcie->cfg->soc_base == BCM7712)
+		if (pcie->cfg->soc_base == BCM7712 || IS_CM_SOC(pcie->cfg->soc_base))
 			add_inbound_win(b++, &n, size, cpu_start, pcie_start);
 
 		if (n > pcie->cfg->num_inbound_wins)
@@ -927,11 +961,11 @@ static int brcm_pcie_get_inbound_wins(struct brcm_pcie *pcie,
 	}
 
 	/*
-	 * 7712 and newer chips do not have an internal memory mapping system
-	 * that enables multiple memory controllers.  As such, it can return
-	 * now w/o doing special configuration.
+	 * 7712, CM, and newer chips do not have an internal memory
+	 * mapping system that enables multiple memory controllers.  As
+	 * such, it can return now w/o doing special configuration.
 	 */
-	if (pcie->cfg->soc_base == BCM7712)
+	if (pcie->cfg->soc_base == BCM7712 || IS_CM_SOC(pcie->cfg->soc_base))
 		return n;
 
 	ret = of_property_read_variable_u64_array(pcie->np, "brcm,scb-sizes", pcie->memc_size, 1,
@@ -1051,10 +1085,10 @@ static void set_inbound_win_registers(struct brcm_pcie *pcie,
 		/*
 		 * Most STB chips:
 		 *     Do nothing.
-		 * 7712:
-		 *     All of their BARs need to be set.
+		 * 7712, CM:
+		 *     All of their inbound windows need to be set.
 		 */
-		if (pcie->cfg->soc_base == BCM7712) {
+		if (pcie->cfg->soc_base == BCM7712 || IS_CM_SOC(pcie->cfg->soc_base)) {
 			/* BUS remap register settings */
 			reg_offset = brcm_ubus_reg_offset(i);
 			tmp = lower_32_bits(cpu_addr) & ~0xfff;
@@ -1118,6 +1152,8 @@ static int brcm_pcie_setup(struct brcm_pcie *pcie)
 		burst = 0x0; /* 128 bytes */
 	else if (pcie->cfg->soc_base == BCM7278)
 		burst = 0x3; /* 512 bytes */
+	else if (pcie->cfg->soc_base == BCM3162 || pcie->cfg->soc_base == BCM33940)
+		burst = 0x1; /* Encoding: 0=64, 1=128, 2=Rsvd, 3=Rsvd */
 	else
 		burst = 0x2; /* 512 bytes */
 
@@ -1144,18 +1180,20 @@ static int brcm_pcie_setup(struct brcm_pcie *pcie)
 		return -EINVAL;
 	}
 
-	tmp = readl(base + PCIE_MISC_MISC_CTRL);
-	for (memc = 0; memc < pcie->num_memc; memc++) {
-		u32 scb_size_val = ilog2(pcie->memc_size[memc]) - 15;
-
-		if (memc == 0)
-			u32p_replace_bits(&tmp, scb_size_val, SCB_SIZE_MASK(0));
-		else if (memc == 1)
-			u32p_replace_bits(&tmp, scb_size_val, SCB_SIZE_MASK(1));
-		else if (memc == 2)
-			u32p_replace_bits(&tmp, scb_size_val, SCB_SIZE_MASK(2));
+	if (!IS_CM_SOC(pcie->cfg->soc_base)) {
+		tmp = readl(base + PCIE_MISC_MISC_CTRL);
+		for (memc = 0; memc < pcie->num_memc; memc++) {
+			u32 scb_size_val = ilog2(pcie->memc_size[memc]) - 15;
+
+			if (memc == 0)
+				u32p_replace_bits(&tmp, scb_size_val, SCB_SIZE_MASK(0));
+			else if (memc == 1)
+				u32p_replace_bits(&tmp, scb_size_val, SCB_SIZE_MASK(1));
+			else if (memc == 2)
+				u32p_replace_bits(&tmp, scb_size_val, SCB_SIZE_MASK(2));
+		}
+		writel(tmp, base + PCIE_MISC_MISC_CTRL);
 	}
-	writel(tmp, base + PCIE_MISC_MISC_CTRL);
 
 	/*
 	 * We ideally want the MSI target address to be located in the 32bit
@@ -1164,8 +1202,10 @@ static int brcm_pcie_setup(struct brcm_pcie *pcie)
 	 * 4GB or when the inbound area is smaller than 4GB (taking into
 	 * account the rounding-up we're forced to perform).
 	 */
-	if (inbound_wins[2].pci_offset >= SZ_4G ||
-	    (inbound_wins[2].size + inbound_wins[2].pci_offset) < SZ_4G)
+	if (IS_CM_SOC(pcie->cfg->soc_base))
+		pcie->msi_target_addr = BRCM_MSI_TARGET_ADDR_FOR_CM;
+	else if (inbound_wins[2].pci_offset >= SZ_4G ||
+		 (inbound_wins[2].size + inbound_wins[2].pci_offset) < SZ_4G)
 		pcie->msi_target_addr = BRCM_MSI_TARGET_ADDR_LT_4GB;
 	else
 		pcie->msi_target_addr = BRCM_MSI_TARGET_ADDR_GT_4GB;
@@ -1226,6 +1266,29 @@ static int brcm_pcie_setup(struct brcm_pcie *pcie)
 		PCIE_RC_CFG_VENDOR_VENDOR_SPECIFIC_REG1_ENDIAN_MODE_BAR2_MASK);
 	writel(tmp, base + PCIE_RC_CFG_VENDOR_VENDOR_SPECIFIC_REG1);
 
+	/*
+	 * Relax read ordering for chip architectures using RBUS/SCB that
+	 * use WiFi Runner offload (i.e. BCM3390) to avoid deadlock where
+	 * reads are blocked by writes.
+	 */
+	if (pcie->cfg->soc_base == BCM3390) {
+		tmp = readl(base + PCIE_MISC_MISC_CTRL);
+		u32p_replace_bits(&tmp, 1, PCIE_MISC_MISC_CTRL_PCIE_IN_CPL_RO_MASK);
+		writel(tmp, base + PCIE_MISC_MISC_CTRL);
+	}
+
+	/*
+	 * The 3392 has a bug that requires the NP credit advertised by the
+	 * MAC to be overwritten with 0x10 in bits 31:24 of the following
+	 * register.
+	 */
+	if (pcie->cfg->soc_base == BCM3392) {
+		tmp = readl(base + PCIE_RC_DL_PDL_CONTROL_4);
+		u32p_replace_bits(&tmp, 0x10,
+				  PCIE_RC_DL_PDL_CONTROL_4_NPH_FC_INIT_MASK);
+		writel(tmp, base + PCIE_RC_DL_PDL_CONTROL_4);
+	}
+
 	if (pcie->cfg->post_setup) {
 		ret = pcie->cfg->post_setup(pcie);
 		if (ret < 0)
@@ -1246,8 +1309,8 @@ static void brcm_extend_rbus_timeout(struct brcm_pcie *pcie)
 	const unsigned int REG_OFFSET = PCIE_RGR1_SW_INIT_1(pcie) - 8;
 	u32 timeout_us = 4000000; /* 4 seconds, our setting for L1SS */
 
-	/* 7712 does not have this (RGR1) timer */
-	if (pcie->cfg->soc_base == BCM7712)
+	/* CM and 7712 do not have this (RGR1) timer */
+	if (IS_CM_SOC(pcie->cfg->soc_base) || pcie->cfg->soc_base == BCM7712)
 		return;
 
 	/* Each unit in timeout register is 1/216,000,000 seconds */
@@ -1354,7 +1417,10 @@ static int brcm_pcie_start_link(struct brcm_pcie *pcie)
 
 	brcm_config_clkreq(pcie);
 
-	if (pcie->ssc) {
+	if (IS_CM_SOC(pcie->cfg->soc_base)) {
+		/* This driver does configure SSC for CM chips */
+		ssc_str = "";
+	} else if (pcie->ssc) {
 		ret = brcm_pcie_set_ssc(pcie);
 		if (ret == 0)
 			ssc_str = "(SSC)";
@@ -1715,6 +1781,14 @@ static const int pcie_offsets[] = {
 	[PCIE_INTR2_CPU_BASE]	= 0x4300,
 };
 
+static const int pcie_offset_bcm3162[] = {
+	[RGR1_SW_INIT_1] = 0x9210,
+	[EXT_CFG_INDEX] = 0x9000,
+	[EXT_CFG_DATA] = 0x9004,
+	[PCIE_HARD_DEBUG] = 0x4204,
+	[PCIE_INTR2_CPU_BASE] = 0x4300
+};
+
 static const int pcie_offsets_bcm7278[] = {
 	[RGR1_SW_INIT_1]	= 0xc010,
 	[EXT_CFG_INDEX]		= 0x9000,
@@ -1739,6 +1813,14 @@ static const int pcie_offsets_bcm7712[] = {
 	[PCIE_INTR2_CPU_BASE]	= 0x4400,
 };
 
+static const int pcie_offset_bcm33940[] = {
+	[RGR1_SW_INIT_1] = 0x9210,
+	[EXT_CFG_INDEX] = 0x9000,
+	[EXT_CFG_DATA] = 0x9004,
+	[PCIE_HARD_DEBUG] = 0x4304,
+	[PCIE_INTR2_CPU_BASE] = 0x4400
+};
+
 static const struct pcie_cfg_data generic_cfg = {
 	.offsets	= pcie_offsets,
 	.soc_base	= GENERIC,
@@ -1765,6 +1847,30 @@ static const struct pcie_cfg_data bcm2712_cfg = {
 	.num_inbound_wins = 10,
 };
 
+static const struct pcie_cfg_data bcm3162_cfg = {
+	.offsets	= pcie_offset_bcm3162,
+	.soc_base	= BCM3162,
+	.perst_set	= brcm_pcie_perst_set_7278,
+	.bridge_sw_init_set = brcm_pcie_bridge_sw_init_set_generic,
+	.num_inbound_wins = 3,
+};
+
+static const struct pcie_cfg_data bcm3392_cfg = {
+	.offsets	= pcie_offset_bcm33940,
+	.soc_base	= BCM3392,
+	.perst_set	= brcm_pcie_perst_set_7278,
+	.bridge_sw_init_set = brcm_pcie_bridge_sw_init_set_generic,
+	.num_inbound_wins = 10,
+};
+
+static const struct pcie_cfg_data bcm3390_cfg = {
+	.offsets	= pcie_offsets,
+	.soc_base	= BCM3390,
+	.perst_set	= brcm_pcie_perst_set_generic,
+	.bridge_sw_init_set = brcm_pcie_bridge_sw_init_set_generic,
+	.num_inbound_wins = 3,
+};
+
 static const struct pcie_cfg_data bcm4908_cfg = {
 	.offsets	= pcie_offsets,
 	.soc_base	= BCM4908,
@@ -1814,9 +1920,20 @@ static const struct pcie_cfg_data bcm7712_cfg = {
 	.num_inbound_wins = 10,
 };
 
+static const struct pcie_cfg_data bcm33940_cfg = {
+	.offsets	= pcie_offset_bcm33940,
+	.soc_base	= BCM33940,
+	.perst_set	= brcm_pcie_perst_set_7278,
+	.bridge_sw_init_set = brcm_pcie_bridge_sw_init_set_generic,
+	.num_inbound_wins = 10,
+};
+
 static const struct of_device_id brcm_pcie_match[] = {
 	{ .compatible = "brcm,bcm2711-pcie", .data = &bcm2711_cfg },
 	{ .compatible = "brcm,bcm2712-pcie", .data = &bcm2712_cfg },
+	{ .compatible = "brcm,bcm3162-pcie", .data = &bcm3162_cfg },
+	{ .compatible = "brcm,bcm3390-pcie", .data = &bcm3390_cfg },
+	{ .compatible = "brcm,bcm3392-pcie", .data = &bcm3392_cfg },
 	{ .compatible = "brcm,bcm4908-pcie", .data = &bcm4908_cfg },
 	{ .compatible = "brcm,bcm7211-pcie", .data = &generic_cfg },
 	{ .compatible = "brcm,bcm7216-pcie", .data = &bcm7216_cfg },
@@ -1825,6 +1942,7 @@ static const struct of_device_id brcm_pcie_match[] = {
 	{ .compatible = "brcm,bcm7435-pcie", .data = &bcm7435_cfg },
 	{ .compatible = "brcm,bcm7445-pcie", .data = &generic_cfg },
 	{ .compatible = "brcm,bcm7712-pcie", .data = &bcm7712_cfg },
+	{ .compatible = "brcm,bcm33940-pcie", .data = &bcm33940_cfg },
 	{},
 };
 
-- 
2.43.0


