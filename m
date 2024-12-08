Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 232DEE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Dec 2024 15:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dDa5uVtGTmKoF+EGxYZ14lQBrXBy+Zgm46G016g9yok=; b=bq1poGZQT5y9F2KmmnLYg/S43f
	8OpBi0M47raJ/xpcPzgrtznzIeTchUz+zo4AIef/cQSe7PQtTVxJDUhnlu0DcDI1UdtIyjoTL5tC7
	uwwlQTBGV1BedIqlsWDyxhMvb8wh8QHjtAoSTso29ot7+e2vQzUYWmwiLeU4H1MCWeyDBv6+E0im+
	jGEdiRr8sW29nuZhem2mFBQfvk8Yy1bAfO/JGNPnnaEfb+Nnsymd4arzffebKMx4DlsuZyW6ubVre
	rG0mFpQuST/mutac7Xk1L08aKnh9p/ODk6fg9lTInIlw0xD7K4LqrNDEjMhOVDgTA047ulKygyOMZ
	Wd4aZVvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKIvc-00000005Qri-0x5F;
	Sun, 08 Dec 2024 15:10:36 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKIsg-00000005Q6S-1ahd
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Dec 2024 15:07:35 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-21644e6140cso3043185ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Dec 2024 07:07:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1733670453; x=1734275253; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dDa5uVtGTmKoF+EGxYZ14lQBrXBy+Zgm46G016g9yok=;
        b=Hm8Kym6Vcd+F8xm+7D1klRhpb9t2YGbwDMBttB4Bd4kfxv6kNWVrOy6t6XdX8jwdFx
         kCKl3+GA2HMZuAlB1OYT8kDIOMqxeiMH93YdFbjUk4fz9E/gDoE4LjnrdIX9/z6MSLmh
         KGDEO7k0i+ERBaM9fDFbwR6SpvC2mtzjO7G2LTN9rQy+ELOirGnSRZx6GutDc6GcfyWU
         n0bRV67BlZMtcKolNDHLzwPtLwbOxX5i8u8dkPu3uWVVwDCd6wG9jDqb1p/mLN91s+4P
         4hKSREIFB4IahrxwGbhJ9s/HztnXYBwycf2DGAk19euqCNuR4x6QJTdKJ6t92tLSRLiS
         twnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733670453; x=1734275253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dDa5uVtGTmKoF+EGxYZ14lQBrXBy+Zgm46G016g9yok=;
        b=CIS08oLglvxtcMTBbK+PUuLTi+PaA85MMx24l56bwO/qfizInUokahQ341RPGR84KB
         cTgsgNKT2OXFXMlNrCaW87fSuRnpVSH9P53EEER0D6GgndulIz/pLbKTv5ZbqaScpAha
         zPlLFWmOv0zMVniziac+px897XR9LINTM3resojChsDL45Yrp6rgcPj1tfhuUJ5SvGXK
         8u6T88U0bg2N4oTC2UVsRagzTf1JMJaVuABYuKBeMZAcKXcs/As4y/ryxxALPuQkGvoT
         KA99QszHB4UgGnLBG/fnrw2yG2UIlkAO1aH0kaQnmxubXyifSKRrDf6OXJ6+RMRevROV
         OyZg==
X-Forwarded-Encrypted: i=1; AJvYcCXxfgdubfCn6KivyIbfkt/gqNAHshIZhtUngdaXZfoR8DFwc/dkDK4mw8KiIO4PIGb48jyd+SbYHbWT4jJ8AsFy@lists.infradead.org
X-Gm-Message-State: AOJu0Yyjh46BMJEhov3L4kVPAfsynU3C4quF6jQVswvLHBCaQpu5TK/C
	b88h4vuLc1HCenzh33QwJYUKS3kI2EFrfZnpMQQLNGDHCEk7VdkwbO8sCXlAFKE=
X-Gm-Gg: ASbGncu2weq/Lofnmgeswft+aKOFVkeKhMdUlbgvdNNJ29POlY9txSEdiGdneAasO9l
	qWNrSPaJX/dy44WnH3prKA+kW+AD5ffnmnPjPPVpDkJ50XTxvwGU4yb8gBxNYdk0TSTrVs0tZmp
	YCzls4RrVodp6Ajh0ozrUGLYkLhugOhvoBQltu/1GtgYu7W1V6+opyRkKY9k2ud3TWhG3VHhbWL
	nPTdnDb7Lt2VsETHjr8DCAV/eIjOhdMqR6zbS02/6QR0RTMY+GLWfe7Pi1ENi7x6KdF3ZC3+IaK
	ladUV6FFv2FK0W0=
X-Google-Smtp-Source: AGHT+IHyj7sXoNPiIJh6cz0a5ruVm18syQJN52TbYaMiqQ+76Oy4OAu0uMksfaRalPqaCn9B1Ej6QQ==
X-Received: by 2002:a17:903:8d0:b0:215:7f94:2b8 with SMTP id d9443c01a7336-21614da3e0dmr176826745ad.24.1733670453399;
        Sun, 08 Dec 2024 07:07:33 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([223.185.130.223])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-216412293d2sm10274515ad.237.2024.12.08.07.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 07:07:32 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Marc Zyngier <maz@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Atish Patra <atishp@atishpatra.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 2/4] irqchip/irq-msi-lib: Optionally set default irq_eoi/irq_ack
Date: Sun,  8 Dec 2024 20:37:09 +0530
Message-ID: <20241208150711.297624-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241208150711.297624-1-apatel@ventanamicro.com>
References: <20241208150711.297624-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_070734_409158_FFDA50BB 
X-CRM114-Status: GOOD (  17.70  )
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

From: Thomas Gleixner <tglx@linutronix.de>

Introduce chip_flags in struct msi_parent_ops. This allows
msi_lib_init_dev_msi_info() set default irq_eoi/irq_ack
callbacks only when the corresponding flags are set in
the chip_flags.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/irqchip/irq-gic-v2m.c    |  1 +
 drivers/irqchip/irq-imx-mu-msi.c |  1 +
 drivers/irqchip/irq-msi-lib.c    | 11 ++++++-----
 drivers/irqchip/irq-mvebu-gicp.c |  1 +
 drivers/irqchip/irq-mvebu-odmi.c |  1 +
 drivers/irqchip/irq-mvebu-sei.c  |  1 +
 include/linux/msi.h              | 11 +++++++++++
 7 files changed, 22 insertions(+), 5 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v2m.c b/drivers/irqchip/irq-gic-v2m.c
index be35c5349986..1e3476c335ca 100644
--- a/drivers/irqchip/irq-gic-v2m.c
+++ b/drivers/irqchip/irq-gic-v2m.c
@@ -255,6 +255,7 @@ static void __init gicv2m_teardown(void)
 static struct msi_parent_ops gicv2m_msi_parent_ops = {
 	.supported_flags	= GICV2M_MSI_FLAGS_SUPPORTED,
 	.required_flags		= GICV2M_MSI_FLAGS_REQUIRED,
+	.chip_flags		= MSI_CHIP_FLAG_SET_EOI | MSI_CHIP_FLAG_SET_ACK,
 	.bus_select_token	= DOMAIN_BUS_NEXUS,
 	.bus_select_mask	= MATCH_PCI_MSI | MATCH_PLATFORM_MSI,
 	.prefix			= "GICv2m-",
diff --git a/drivers/irqchip/irq-imx-mu-msi.c b/drivers/irqchip/irq-imx-mu-msi.c
index 4342a21de1eb..69aacdfc8bef 100644
--- a/drivers/irqchip/irq-imx-mu-msi.c
+++ b/drivers/irqchip/irq-imx-mu-msi.c
@@ -214,6 +214,7 @@ static void imx_mu_msi_irq_handler(struct irq_desc *desc)
 static const struct msi_parent_ops imx_mu_msi_parent_ops = {
 	.supported_flags	= IMX_MU_MSI_FLAGS_SUPPORTED,
 	.required_flags		= IMX_MU_MSI_FLAGS_REQUIRED,
+	.chip_flags		= MSI_CHIP_FLAG_SET_EOI | MSI_CHIP_FLAG_SET_ACK,
 	.bus_select_token       = DOMAIN_BUS_NEXUS,
 	.bus_select_mask	= MATCH_PLATFORM_MSI,
 	.prefix			= "MU-MSI-",
diff --git a/drivers/irqchip/irq-msi-lib.c b/drivers/irqchip/irq-msi-lib.c
index d8e29fc0d406..51464c6257f3 100644
--- a/drivers/irqchip/irq-msi-lib.c
+++ b/drivers/irqchip/irq-msi-lib.c
@@ -28,6 +28,7 @@ bool msi_lib_init_dev_msi_info(struct device *dev, struct irq_domain *domain,
 			       struct msi_domain_info *info)
 {
 	const struct msi_parent_ops *pops = real_parent->msi_parent_ops;
+	struct irq_chip *chip = info->chip;
 	u32 required_flags;
 
 	/* Parent ops available? */
@@ -92,10 +93,10 @@ bool msi_lib_init_dev_msi_info(struct device *dev, struct irq_domain *domain,
 	info->flags			|= required_flags;
 
 	/* Chip updates for all child bus types */
-	if (!info->chip->irq_eoi)
-		info->chip->irq_eoi	= irq_chip_eoi_parent;
-	if (!info->chip->irq_ack)
-		info->chip->irq_ack	= irq_chip_ack_parent;
+	if (!chip->irq_eoi && (pops->chip_flags & MSI_CHIP_FLAG_SET_EOI))
+		chip->irq_eoi = irq_chip_eoi_parent;
+	if (!chip->irq_ack && (pops->chip_flags & MSI_CHIP_FLAG_SET_ACK))
+		chip->irq_ack = irq_chip_ack_parent;
 
 	/*
 	 * The device MSI domain can never have a set affinity callback. It
@@ -105,7 +106,7 @@ bool msi_lib_init_dev_msi_info(struct device *dev, struct irq_domain *domain,
 	 * device MSI domain aside of mask/unmask which is provided e.g. by
 	 * PCI/MSI device domains.
 	 */
-	info->chip->irq_set_affinity	= msi_domain_set_affinity;
+	chip->irq_set_affinity = msi_domain_set_affinity;
 	return true;
 }
 EXPORT_SYMBOL_GPL(msi_lib_init_dev_msi_info);
diff --git a/drivers/irqchip/irq-mvebu-gicp.c b/drivers/irqchip/irq-mvebu-gicp.c
index 2b6183919ea4..d67f93f6d750 100644
--- a/drivers/irqchip/irq-mvebu-gicp.c
+++ b/drivers/irqchip/irq-mvebu-gicp.c
@@ -161,6 +161,7 @@ static const struct irq_domain_ops gicp_domain_ops = {
 static const struct msi_parent_ops gicp_msi_parent_ops = {
 	.supported_flags	= GICP_MSI_FLAGS_SUPPORTED,
 	.required_flags		= GICP_MSI_FLAGS_REQUIRED,
+	.chip_flags		= MSI_CHIP_FLAG_SET_EOI | MSI_CHIP_FLAG_SET_ACK,
 	.bus_select_token       = DOMAIN_BUS_GENERIC_MSI,
 	.bus_select_mask	= MATCH_PLATFORM_MSI,
 	.prefix			= "GICP-",
diff --git a/drivers/irqchip/irq-mvebu-odmi.c b/drivers/irqchip/irq-mvebu-odmi.c
index ff19bfd258dc..28f7e81df94f 100644
--- a/drivers/irqchip/irq-mvebu-odmi.c
+++ b/drivers/irqchip/irq-mvebu-odmi.c
@@ -157,6 +157,7 @@ static const struct irq_domain_ops odmi_domain_ops = {
 static const struct msi_parent_ops odmi_msi_parent_ops = {
 	.supported_flags	= ODMI_MSI_FLAGS_SUPPORTED,
 	.required_flags		= ODMI_MSI_FLAGS_REQUIRED,
+	.chip_flags		= MSI_CHIP_FLAG_SET_EOI | MSI_CHIP_FLAG_SET_ACK,
 	.bus_select_token	= DOMAIN_BUS_GENERIC_MSI,
 	.bus_select_mask	= MATCH_PLATFORM_MSI,
 	.prefix			= "ODMI-",
diff --git a/drivers/irqchip/irq-mvebu-sei.c b/drivers/irqchip/irq-mvebu-sei.c
index 065166ab5dbc..ebd4a9014e8d 100644
--- a/drivers/irqchip/irq-mvebu-sei.c
+++ b/drivers/irqchip/irq-mvebu-sei.c
@@ -356,6 +356,7 @@ static void mvebu_sei_reset(struct mvebu_sei *sei)
 static const struct msi_parent_ops sei_msi_parent_ops = {
 	.supported_flags	= SEI_MSI_FLAGS_SUPPORTED,
 	.required_flags		= SEI_MSI_FLAGS_REQUIRED,
+	.chip_flags		= MSI_CHIP_FLAG_SET_EOI | MSI_CHIP_FLAG_SET_ACK,
 	.bus_select_mask	= MATCH_PLATFORM_MSI,
 	.bus_select_token	= DOMAIN_BUS_GENERIC_MSI,
 	.prefix			= "SEI-",
diff --git a/include/linux/msi.h b/include/linux/msi.h
index b10093c4d00e..9abef442c146 100644
--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -558,11 +558,21 @@ enum {
 	MSI_FLAG_NO_AFFINITY		= (1 << 21),
 };
 
+/*
+ * Flags for msi_parent_ops::chip_flags
+ */
+enum {
+	MSI_CHIP_FLAG_SET_EOI		= (1 << 0),
+	MSI_CHIP_FLAG_SET_ACK		= (1 << 1),
+};
+
 /**
  * struct msi_parent_ops - MSI parent domain callbacks and configuration info
  *
  * @supported_flags:	Required: The supported MSI flags of the parent domain
  * @required_flags:	Optional: The required MSI flags of the parent MSI domain
+ * @chip_flags:		Optional: Select MSI chip callbacks to update with defaults
+ *			in msi_lib_init_dev_msi_info().
  * @bus_select_token:	Optional: The bus token of the real parent domain for
  *			irq_domain::select()
  * @bus_select_mask:	Optional: A mask of supported BUS_DOMAINs for
@@ -575,6 +585,7 @@ enum {
 struct msi_parent_ops {
 	u32		supported_flags;
 	u32		required_flags;
+	u32		chip_flags;
 	u32		bus_select_token;
 	u32		bus_select_mask;
 	const char	*prefix;
-- 
2.43.0


