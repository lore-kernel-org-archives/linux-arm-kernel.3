Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 552E2C7115D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Jun 2025 01:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mt5O7/7JEumjsAyKxjvlFipcH+4/5yB2S8im+OQhNPo=; b=zuw2MD64U/kkLuELwYDHja2TVZ
	1vvOM4s+SbC7yhLc5jFMB5DtxrVS2rzJG9aWzyPS+U2h5jz+rA3l6pvJAcyLERI2hEn6q7sdB0Pdw
	U3q9+K6KkhXO5PT21v7fzqEgSWNYSHCD+tgBDl0L6tgmGCt95rP0Ul25jOo5Cu4wjZN9LMuI1HL2C
	wq+7n2gNRQLxPGuJzVYj9hXbHJc7xzjXnMTxcRdeQeoJb00AH0fYPDsvtkQ97KnuArYNmk0N3HJ68
	pm7yBOXmCg2WPyuHZ1YCNIavfIYWmKLgP/P16wt4qBjBST0cFg9WzEGa3TBGEm8hseHlpUvnIYDT9
	A6BJwc1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSnPR-0000000GwRg-25d2;
	Sat, 21 Jun 2025 01:52:45 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSnLB-0000000Gvuh-3N8E;
	Sat, 21 Jun 2025 01:48:22 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-74264d1832eso3226495b3a.0;
        Fri, 20 Jun 2025 18:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750470501; x=1751075301; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mt5O7/7JEumjsAyKxjvlFipcH+4/5yB2S8im+OQhNPo=;
        b=N3QukF8v3WjO/HAra6tCXV8BRx0cLOMnD4x8UOmx0cdRkar8cukUrn1wnJltKZsu3j
         cLMAyFK/K0ZqPBBrA3Kt8y/RjC23RS+8Opeb9DUotVneugDovdh6iaBh6/cDXrDtDGaZ
         zNNcZ2kxaMtNRJqYLld4Mj8lxPGKzzoLfQAXOeyhtXr4+orYIZPYf//4//9QMlm30RxD
         S6Sf08N2SuSCWizI/kSX1t0vHnVTglak+8wCWCfpqkkqfDNP3vYJdIF+vuW40xPOUg5I
         7PDH97UQ5HdnuUg8baMR15zI8essnzJ/tih3LxnGC3JSVHhev2Z4iD+yeCNLztd//Na5
         F3Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750470501; x=1751075301;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mt5O7/7JEumjsAyKxjvlFipcH+4/5yB2S8im+OQhNPo=;
        b=FWIU2xbc18kqv79QY+d75Ufg3fe+7Odu8YubksCiV4j4vzcOx15h1D8iDljoZtQPjw
         XqfQ2g3sJs+mZlVljCL1NJTmmcRR+Bke3teILvHAOf0y/j1afevzhq2H2gritmxyNi6K
         g16ESFoBK2lnDe+HTWYopnF+UDoM7i3yl3jd5tMlTjT8fHHEgCPBk8/VLO1aqT9KwlVf
         kMDCHxDcaR741FciETYuwz/S8f+WpECVwhRmvyq50XyfWbaAL+35iPmo0sYlT7jKR+tb
         ByixjEhMf95vXOrPwpUxAd5gDBcvqjlJMRd5JnXzjYZ4WkwAo/ZMT6Mr9epHwTSBIwOz
         asUw==
X-Forwarded-Encrypted: i=1; AJvYcCUXM+9u5bK/b88dLBJLcS6b0ErTGF+Y9joCumfAtGEoYhXmSjaC38xExEBJFhLBVDHtJmd54XfTziYHcIdcgfX4@lists.infradead.org, AJvYcCXsbAKjve98JCKG3vsXxYBvTzqouzsXV4sqyS96wWrP/tAlGh4YTbr294RobsUSY8X4hreqFkfsaOWd@lists.infradead.org
X-Gm-Message-State: AOJu0Ywp1S7u2noYg/j3Y5aos5ImiWptUJ9HyGLrnncUnwuSsMS6/p24
	LSkF0KzNtOERWT5vJCTRpXKqasjWpR2XRP0Ww+JGHnhiYbrcnOjlYbl1qe/owCmM
X-Gm-Gg: ASbGncsVbVBXCzw7/4h4nE6bY77h/CvgYCUce6jB7Lc/pAEidpWYk6wKzW5MS0NrQ6x
	6j5sn4atTqwzgdbqQVXdAUA9He75/BOkJUtP8grRy7tMsv37jlSkul11M2buR/OQy7odH19c+Xr
	ed7zySNmb+5FJOsweg8n3+arY9/K3JpD77ba3eAD75/hsdyqmlgEIsAayi1RJcVhNIHd1jAlE3p
	GxRyWCdXVTpOpL4WsckLEuD2yGfIqek3Nic5WySKhW1d35mRJGMK8PZcLu7joKzyOvKs3W46c2L
	kjWC/mtLuZCGqtHzPPf/MTY/AfD9Cj5p4DI72tFw7FiTGBi2Jw==
X-Google-Smtp-Source: AGHT+IFSIf+C/e7hFUiyQQukqnOF7HBTcNd1+R55n0mGf9AyKlyC7XKNh6w0Bnji3xf4KraprNdL+Q==
X-Received: by 2002:a05:6a00:1a88:b0:748:2ac2:f8c3 with SMTP id d2e1a72fcca58-7490d6bf6d6mr7948158b3a.24.1750470500939;
        Fri, 20 Jun 2025 18:48:20 -0700 (PDT)
Received: from geday ([2804:7f2:800b:d1c8::dead:c001])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a626eecsm3049052b3a.82.2025.06.20.18.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 18:48:20 -0700 (PDT)
Date: Fri, 20 Jun 2025 22:48:14 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rick wertenbroek <rick.wertenbroek@gmail.com>,
	linux-phy@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH v6 1/4] PCI: rockchip: Use standard PCIe defines
Message-ID: <e81700ef4b49f584bc8834bfb07b6d8995fc1f42.1750470187.git.geraldogabriel@gmail.com>
References: <cover.1750470187.git.geraldogabriel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1750470187.git.geraldogabriel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_184821_844188_7144755E 
X-CRM114-Status: GOOD (  12.89  )
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

Current code uses custom-defined register offsets and bitfields for
standard PCIe registers. Change to using standard PCIe defines. Since
we are now using standard PCIe defines, drop unused custom-defined ones,
which are now referenced from offset at added Capabilities Register.

Suggested-By: Bjorn Helgaas <bhelgaas@google.com>
Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>
---
 drivers/pci/controller/pcie-rockchip-ep.c   |  4 +-
 drivers/pci/controller/pcie-rockchip-host.c | 44 ++++++++++-----------
 drivers/pci/controller/pcie-rockchip.h      | 12 +-----
 3 files changed, 25 insertions(+), 35 deletions(-)

diff --git a/drivers/pci/controller/pcie-rockchip-ep.c b/drivers/pci/controller/pcie-rockchip-ep.c
index 55416b8311dd..300cd85fa035 100644
--- a/drivers/pci/controller/pcie-rockchip-ep.c
+++ b/drivers/pci/controller/pcie-rockchip-ep.c
@@ -518,9 +518,9 @@ static void rockchip_pcie_ep_retrain_link(struct rockchip_pcie *rockchip)
 {
 	u32 status;
 
-	status = rockchip_pcie_read(rockchip, PCIE_EP_CONFIG_LCS);
+	status = rockchip_pcie_read(rockchip, PCIE_EP_CONFIG_BASE + PCI_EXP_LNKCTL);
 	status |= PCI_EXP_LNKCTL_RL;
-	rockchip_pcie_write(rockchip, status, PCIE_EP_CONFIG_LCS);
+	rockchip_pcie_write(rockchip, status, PCIE_EP_CONFIG_BASE + PCI_EXP_LNKCTL);
 }
 
 static bool rockchip_pcie_ep_link_up(struct rockchip_pcie *rockchip)
diff --git a/drivers/pci/controller/pcie-rockchip-host.c b/drivers/pci/controller/pcie-rockchip-host.c
index b9e7a8710cf0..65653218b9ab 100644
--- a/drivers/pci/controller/pcie-rockchip-host.c
+++ b/drivers/pci/controller/pcie-rockchip-host.c
@@ -40,18 +40,18 @@ static void rockchip_pcie_enable_bw_int(struct rockchip_pcie *rockchip)
 {
 	u32 status;
 
-	status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_LCS);
+	status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL);
 	status |= (PCI_EXP_LNKCTL_LBMIE | PCI_EXP_LNKCTL_LABIE);
-	rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_LCS);
+	rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL);
 }
 
 static void rockchip_pcie_clr_bw_int(struct rockchip_pcie *rockchip)
 {
 	u32 status;
 
-	status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_LCS);
+	status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL);
 	status |= (PCI_EXP_LNKSTA_LBMS | PCI_EXP_LNKSTA_LABS) << 16;
-	rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_LCS);
+	rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL);
 }
 
 static void rockchip_pcie_update_txcredit_mui(struct rockchip_pcie *rockchip)
@@ -269,7 +269,7 @@ static void rockchip_pcie_set_power_limit(struct rockchip_pcie *rockchip)
 	scale = 3; /* 0.001x */
 	curr = curr / 1000; /* convert to mA */
 	power = (curr * 3300) / 1000; /* milliwatt */
-	while (power > PCIE_RC_CONFIG_DCR_CSPL_LIMIT) {
+	while (power > FIELD_MAX(PCI_EXP_DEVCAP_PWR_VAL)) {
 		if (!scale) {
 			dev_warn(rockchip->dev, "invalid power supply\n");
 			return;
@@ -278,10 +278,10 @@ static void rockchip_pcie_set_power_limit(struct rockchip_pcie *rockchip)
 		power = power / 10;
 	}
 
-	status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_DCR);
-	status |= (power << PCIE_RC_CONFIG_DCR_CSPL_SHIFT) |
-		  (scale << PCIE_RC_CONFIG_DCR_CPLS_SHIFT);
-	rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_DCR);
+	status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_CR + PCI_EXP_DEVCAP);
+	status |= FIELD_PREP(PCI_EXP_DEVCAP_PWR_VAL, power);
+	status |= FIELD_PREP(PCI_EXP_DEVCAP_PWR_SCL, scale);
+	rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_CR + PCI_EXP_DEVCAP);
 }
 
 /**
@@ -309,14 +309,14 @@ static int rockchip_pcie_host_init_port(struct rockchip_pcie *rockchip)
 	rockchip_pcie_set_power_limit(rockchip);
 
 	/* Set RC's clock architecture as common clock */
-	status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_LCS);
+	status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL);
 	status |= PCI_EXP_LNKSTA_SLC << 16;
-	rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_LCS);
+	rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL);
 
 	/* Set RC's RCB to 128 */
-	status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_LCS);
+	status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL);
 	status |= PCI_EXP_LNKCTL_RCB;
-	rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_LCS);
+	rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL);
 
 	/* Enable Gen1 training */
 	rockchip_pcie_write(rockchip, PCIE_CLIENT_LINK_TRAIN_ENABLE,
@@ -341,9 +341,9 @@ static int rockchip_pcie_host_init_port(struct rockchip_pcie *rockchip)
 		 * Enable retrain for gen2. This should be configured only after
 		 * gen1 finished.
 		 */
-		status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_LCS);
+		status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL);
 		status |= PCI_EXP_LNKCTL_RL;
-		rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_LCS);
+		rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL);
 
 		err = readl_poll_timeout(rockchip->apb_base + PCIE_CORE_CTRL,
 					 status, PCIE_LINK_IS_GEN2(status), 20,
@@ -380,15 +380,15 @@ static int rockchip_pcie_host_init_port(struct rockchip_pcie *rockchip)
 
 	/* Clear L0s from RC's link cap */
 	if (of_property_read_bool(dev->of_node, "aspm-no-l0s")) {
-		status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_LINK_CAP);
-		status &= ~PCIE_RC_CONFIG_LINK_CAP_L0S;
-		rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_LINK_CAP);
+		status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCAP);
+		status &= ~PCI_EXP_LNKCAP_ASPM_L0S;
+		rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCAP);
 	}
 
-	status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_DCSR);
-	status &= ~PCIE_RC_CONFIG_DCSR_MPS_MASK;
-	status |= PCIE_RC_CONFIG_DCSR_MPS_256;
-	rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_DCSR);
+	status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_CR + PCI_EXP_DEVCTL);
+	status &= ~PCI_EXP_DEVCTL_PAYLOAD;
+	status |= PCI_EXP_DEVCTL_PAYLOAD_256B;
+	rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_CR + PCI_EXP_DEVCTL);
 
 	return 0;
 err_power_off_phy:
diff --git a/drivers/pci/controller/pcie-rockchip.h b/drivers/pci/controller/pcie-rockchip.h
index 5864a20323f2..f5cbf3c9d2d9 100644
--- a/drivers/pci/controller/pcie-rockchip.h
+++ b/drivers/pci/controller/pcie-rockchip.h
@@ -155,17 +155,7 @@
 #define PCIE_EP_CONFIG_DID_VID		(PCIE_EP_CONFIG_BASE + 0x00)
 #define PCIE_EP_CONFIG_LCS		(PCIE_EP_CONFIG_BASE + 0xd0)
 #define PCIE_RC_CONFIG_RID_CCR		(PCIE_RC_CONFIG_BASE + 0x08)
-#define PCIE_RC_CONFIG_DCR		(PCIE_RC_CONFIG_BASE + 0xc4)
-#define   PCIE_RC_CONFIG_DCR_CSPL_SHIFT		18
-#define   PCIE_RC_CONFIG_DCR_CSPL_LIMIT		0xff
-#define   PCIE_RC_CONFIG_DCR_CPLS_SHIFT		26
-#define PCIE_RC_CONFIG_DCSR		(PCIE_RC_CONFIG_BASE + 0xc8)
-#define   PCIE_RC_CONFIG_DCSR_MPS_MASK		GENMASK(7, 5)
-#define   PCIE_RC_CONFIG_DCSR_MPS_256		(0x1 << 5)
-#define PCIE_RC_CONFIG_LINK_CAP		(PCIE_RC_CONFIG_BASE + 0xcc)
-#define   PCIE_RC_CONFIG_LINK_CAP_L0S		BIT(10)
-#define PCIE_RC_CONFIG_LCS		(PCIE_RC_CONFIG_BASE + 0xd0)
-#define PCIE_EP_CONFIG_LCS		(PCIE_EP_CONFIG_BASE + 0xd0)
+#define PCIE_RC_CONFIG_CR		(PCIE_RC_CONFIG_BASE + 0xc0)
 #define PCIE_RC_CONFIG_L1_SUBSTATE_CTRL2 (PCIE_RC_CONFIG_BASE + 0x90c)
 #define PCIE_RC_CONFIG_THP_CAP		(PCIE_RC_CONFIG_BASE + 0x274)
 #define   PCIE_RC_CONFIG_THP_CAP_NEXT_MASK	GENMASK(31, 20)
-- 
2.49.0


