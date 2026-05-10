Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86ECDCD37B2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 May 2026 19:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8iI1RsUJy3jPss5H1NJck2z9ijXsiYtxqAXvRNgtOYk=; b=gF7dKy0qrwuay/fJLye6BzWnKG
	tOA+Vjt1skbsakbRVjA2gV49WIXR+v5rsjv5Q//mTZ62+vSQgF3Qh4F4riqeeyeLLecyJrg0daDZp
	MtoU30TODpverannSO3T0sAZcIevrb69e2kt2iKykNF9zU82kE5ZWIp/89gU2AIGIiU2urb0Nh/ZH
	y6oPslgOjKGLDvzq8E355bEF0Hh34Nxp6V1ZSPcmG5BhMWx/UastBc2TJXT+IAE54+3i668LIBeBU
	Nbf3PEJ0iFgpDT3dUGS2MONF+WbnT0OJAK7eTYvIohh+qIdUNEiyECTnSwF14aFWw68ak0OdErTAJ
	qC28UaQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMAB9-0000000BWX3-2SAT;
	Sun, 10 May 2026 19:51:07 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMAB7-0000000BWWJ-2fY1
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 May 2026 19:51:06 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2ab077e3f32so16795475ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 10 May 2026 12:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778442664; x=1779047464; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8iI1RsUJy3jPss5H1NJck2z9ijXsiYtxqAXvRNgtOYk=;
        b=m6COC/KrtmadKFHon3yly9/X3KEGBDx5bQTa1fNH1CuZwFhtMCA1xrzG+5Q0YubPEn
         ZPgkgm77qSp4fKv/j3jwmBBe+o8rSs5R0HF/ypjv5OmMPne6WQdGDKmpv0OcXBG1q18C
         DvusA2rU/J6ye7H/+4IYVEPaIyqLEkPaUcetPf5LQyw5gyKzr/b45Bq/r+eQ4m1jqdMN
         9XgllutAlwTtqtgeKqsDL3nyDHctmh7zGIhGjR42LtlWj2Ww8ci1yCZ1tNpK766vk964
         JZDFj/xpjP/sJsKBnfAqhtcw/5hHZBCC4jC/n/y64ktbGmT40zQAH8zuBWTBJF4a2cWH
         vweA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778442664; x=1779047464;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8iI1RsUJy3jPss5H1NJck2z9ijXsiYtxqAXvRNgtOYk=;
        b=Y548kvZzCDuwLCWO9tIno5indUqF9plWBj9CzUWqFXoG3rXcd1CoE+BaZcZQ3FEM0F
         ibb57DjigCxnZ/+qoStwialHgPqKb8Zg9HQLWc8qds9QGIr5v7807KmyBsGDDIevjSI3
         0PlgoApzyUzL6eKeKzCr8TwGbv004e33LJPU3O56AdnsN4M79Jb5+VcpAv1fxRYE1PbE
         29eFoxTykqTSjVgDwAwvs21JtUKUtqpv7kGqeCahxFV7Z4duDip+qIxp173pE3QQd/2I
         L2mLr7SIisu1WqwUD05MPpxjcEPzAWRnOWjLlOgzzuC2TV1wp97o1ovbJxzJvvG5eo8P
         Fq2Q==
X-Forwarded-Encrypted: i=1; AFNElJ8jWJERIpgH47qdTGk4LVzjeHmU4LsxlBuzoD05ZDElpyU0IhTFWP7X2f3ZOn0NV3W1kTNxmlHhwoEewvB9OffD@lists.infradead.org
X-Gm-Message-State: AOJu0Ywq4lQb1fHhtpQQIWr8OTQ3JYmt/QL3PHrC9WzQS7dcZZVmCczJ
	EzMQIjuYwEwUlDiBhn45wI/gHEDSHDUSRzCqZ2XDs7aBtj+ltl/okNAo
X-Gm-Gg: Acq92OFSoZ+ffNKA/nNaDtOa/Mt8lfz7izo+TXLQo0QaLstYLW6UadfGwDuaSMnooPy
	ozhp17imkX0jdxKdJhwhCuRaHYIsEZ2gEyploeub7R/HBWhxxXK9YKa04DHuiHAawq1K2XlTY+P
	pQ0WNX3efuziTLFx8mkLBRAq6pf1J1WT5qLx2YHT1TyOY7vCcCwVfqD30gjBW0K5ZpwQRoR2Dr9
	EPhZ4Da+PQ9cLPDaGKjHO5yr5owv9zKLhJFPxKM57RdNxGQ9I4T7URGOkAOFcgWOrDs8nMa4Pa2
	JOpyIF7s6cX7FXfIHXGz8DWdGyXK8hnXWM/5l/AZX++m7Ojlyb3spAUznTZV7NUDx0/pgAx9oGR
	SeQWPjfQd3lNoRG1/PVC4DSZjAk4p7Eyj30H7b3p23AlwZ+l+P6IqvQu3aWsBS2+syxyxnLpgq6
	mdJj9PJVXMpX9uDYmbDRH7jisTCYsag1R7/gQuLEQ1ixqrvCoEAk6ZywuJbcCUz+jcMFzcr8qRw
	SFrJxOX7IOFesG6OfVOBH078YUE5fczgu0=
X-Received: by 2002:a17:903:1a68:b0:2bc:7486:21cf with SMTP id d9443c01a7336-2bc748623e7mr86956865ad.36.1778442664283;
        Sun, 10 May 2026 12:51:04 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1eafa62sm84439455ad.74.2026.05.10.12.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 12:51:03 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Thomas Gleixner <tglx@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,...),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH] irqchip/mvebu: Allow EBU irqchips to be compile-tested
Date: Sun, 10 May 2026 12:50:47 -0700
Message-ID: <20260510195047.10143-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_125105_710372_02F534CF 
X-CRM114-Status: GOOD (  12.64  )
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

The Marvell EBU interrupt controller Kconfig symbols are hidden and
selected only by platform code. This prevents build coverage for the
drivers on other architectures even though the code only needs OF and
MMIO support.

Add COMPILE_TEST prompts and the required dependencies for the GICP,
ICU, ODMI, PIC and SEI irqchips. While touching PIC for this coverage,
use GENMASK() and BIT() for its masks so that 32-bit platforms can
compile this safely without running into issues.

Tested: make LLVM=1 ARCH=s390 drivers/irqchip/

Assisted-by: Codex:GPT-5.5
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/irqchip/Kconfig         | 31 ++++++++++++++++++++++++++-----
 drivers/irqchip/irq-mvebu-pic.c |  8 ++++----
 2 files changed, 30 insertions(+), 9 deletions(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index e7d559472790..cf3aea96866b 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -451,22 +451,43 @@ config MSCC_OCELOT_IRQ
 	select GENERIC_IRQ_CHIP
 
 config MVEBU_GICP
+	bool "Marvell EBU GICP interrupt controller" if COMPILE_TEST
+	depends on OF
+	depends on HAS_IOMEM
 	select IRQ_MSI_LIB
-	bool
+	help
+	  Support the Marvell EBU GICP interrupt controller.
 
 config MVEBU_ICU
-	bool
+	bool "Marvell EBU ICU interrupt controller" if COMPILE_TEST
+	depends on OF
+	depends on HAS_IOMEM
+	select GENERIC_MSI_IRQ
+	help
+	  Support the Marvell EBU ICU interrupt controller.
 
 config MVEBU_ODMI
-	bool
+	bool "Marvell EBU ODMI interrupt controller" if COMPILE_TEST
+	depends on OF
+	depends on HAS_IOMEM
 	select IRQ_MSI_LIB
 	select GENERIC_MSI_IRQ
+	help
+	  Support the Marvell EBU ODMI interrupt controller.
 
 config MVEBU_PIC
-	bool
+	bool "Marvell EBU PIC interrupt controller" if COMPILE_TEST
+	depends on OF
+	depends on HAS_IOMEM
+	help
+	  Support the Marvell EBU PIC interrupt controller.
 
 config MVEBU_SEI
-        bool
+	bool "Marvell EBU SEI interrupt controller" if COMPILE_TEST
+	depends on OF
+	depends on HAS_IOMEM
+	help
+	  Support the Marvell EBU SEI interrupt controller.
 
 config LS_EXTIRQ
 	bool "Freescale Layerscape external IRQ support" if COMPILE_TEST
diff --git a/drivers/irqchip/irq-mvebu-pic.c b/drivers/irqchip/irq-mvebu-pic.c
index 10b85128183a..95090d8efc06 100644
--- a/drivers/irqchip/irq-mvebu-pic.c
+++ b/drivers/irqchip/irq-mvebu-pic.c
@@ -24,7 +24,7 @@
 #define PIC_MASK	       0x4
 
 #define PIC_MAX_IRQS		32
-#define PIC_MAX_IRQ_MASK	((1UL << PIC_MAX_IRQS) - 1)
+#define PIC_MAX_IRQ_MASK	GENMASK(PIC_MAX_IRQS - 1, 0)
 
 struct mvebu_pic {
 	void __iomem *base;
@@ -44,7 +44,7 @@ static void mvebu_pic_eoi_irq(struct irq_data *d)
 {
 	struct mvebu_pic *pic = irq_data_get_irq_chip_data(d);
 
-	writel(1 << d->hwirq, pic->base + PIC_CAUSE);
+	writel(BIT(d->hwirq), pic->base + PIC_CAUSE);
 }
 
 static void mvebu_pic_mask_irq(struct irq_data *d)
@@ -53,7 +53,7 @@ static void mvebu_pic_mask_irq(struct irq_data *d)
 	u32 reg;
 
 	reg =  readl(pic->base + PIC_MASK);
-	reg |= (1 << d->hwirq);
+	reg |= BIT(d->hwirq);
 	writel(reg, pic->base + PIC_MASK);
 }
 
@@ -63,7 +63,7 @@ static void mvebu_pic_unmask_irq(struct irq_data *d)
 	u32 reg;
 
 	reg = readl(pic->base + PIC_MASK);
-	reg &= ~(1 << d->hwirq);
+	reg &= ~BIT(d->hwirq);
 	writel(reg, pic->base + PIC_MASK);
 }
 
-- 
2.54.0


