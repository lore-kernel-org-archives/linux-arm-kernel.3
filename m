Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A223E7716A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Dec 2024 17:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u6payGCmGMW/0vjHgpi/115tsc+b1yXaj6IL2K0q/xw=; b=emRM12zz6hmA8VpDu/s+3yRLoV
	61+qAVCvt+KbnEcyTtPNng3k8kThb7wNxWEagU3eCJ+GY7cy9YsUl2UtHHfXeK7bcijiVtoRoYcYV
	IQvfnCQydTvQ3mc1ccM1ivmr3C+QR/uYP2qQw3q71Sv4tZRmMbfNyxrUrek6fL8tptvU6XT2dWPYn
	Gm6KZqosgqN3ETcAfCpkW8FdfM0xhDgd7OI8ycJXiLRq+j2Vl0q+gB6YkzbmJRPXfoe9kMuap7GkV
	xLUuXadFznq7IuB/ZKD2SbtBUNlMpZ6pLiX+0WVLKD5qn/NzaMtJATR6NNvYoYrvsJUIlDiIdep8+
	pK0v39Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMW0W-00000006hml-27Vd;
	Sat, 14 Dec 2024 17:32:48 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMVua-00000006gQ6-0X9R
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Dec 2024 17:26:41 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2ee8e8e29f6so2110771a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Dec 2024 09:26:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1734197199; x=1734801999; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u6payGCmGMW/0vjHgpi/115tsc+b1yXaj6IL2K0q/xw=;
        b=MlCHZHWFhhhvk9pdN+LoMtPNyl++oJlxykhxrdrnbdhtxtb7rCEByhaT6j1tPLSrR+
         ff3Vg4p7aCZhfanj7Sc5KWNh8jR5q9WZrZ6gGC3MvRag/uxZKfv4GGB3hkt1z8DqgM8k
         eKcqNk6UeACjt6NniLVGTSiSZriEh0Spk9Nm1rJ8UOkQD13Rn22nFA8Xc2meMKY+I/v2
         LpU9Ax4ZSYWjjXVOMz2+ALYlW7BsQ6QTte6BtdZGH/A2DuAYqLTxrmkBXFiB3wrOVuSW
         gk36qYCCWlE7XwklidHd9p++Ih+iJTvuFXLd+qvpaF76kcs6cV56NdNSfVgHpgEbzR8A
         JBMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734197199; x=1734801999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u6payGCmGMW/0vjHgpi/115tsc+b1yXaj6IL2K0q/xw=;
        b=tO2jaEqrgdjqsNIGAeCFVzpq0Q0Aa7JUcsdNS3XkkxRWD2tvnWD8TkkVwsJT3xFNAA
         pWVAFa7XA3WM462T3eoVRkTbHjMgD9nu6MkeOB//kQqHm4v1UK97B2fnGeNj60DyTNIk
         3DLcJlmuzcZ8n4iAuwvEUTl4I89ZP++SNlUrrwSrKUSLHgT48TuOljhb5FDo2noGT7Ao
         SBAEaBZBkRyayROebYfFX+vhN5Gaj2PBqtwqMo+PxgunqlzGTCbJk3eIEQsp8bJQDARr
         auy7CF1MrOmr6DlfLhgMZ83T5+FutrpHhEhIDug15d7k4jI1crNhRg+yJkHx+jEdyIbO
         klUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfE3mZYYyl6a/deaGeiFkz3mC3+DOZfi4YO1Zr28DGsxWEapOItUbnBNZE+L+ASWOBZMXLB0Nbk4mFUEY5lBQD@lists.infradead.org
X-Gm-Message-State: AOJu0Yyv5sypSldQgXYpbwN6cID4Bzz86Crtu7HdrSUksPSVDP4IfkF8
	HDC2M5k0/9e5nPphTblD1opNVOtpniXutr0HJ/185IpwbVNkKePZEQ5skFl8gSY=
X-Gm-Gg: ASbGncvH/w7w/1EHxD8VYYfdMsYki9ACmUr1gV3N1g/st0ZscOrKTk6Nt3rsrKv2a7K
	NX577Pg/j8vPqcHgm1WY6s7iNfslZ+XxHjdn6m2/eJve9uZ4Fm4liojnpCUYvnv7YhbUxAlAz++
	SEuuwJgaxTNrEfmGwjBg+XZ2Q+aW05IeK5SPZFmWk3mgfjNE/4guzQVvC6a2ZSymA5ZA85LH2FM
	R+bMBvcrfZln3lsf1q7sI5EQj7ythoaV1vJtkEGd40p/G9r2HUlB1aZRontwakaeRyL/dK3PQsK
	LnKYBcH0mpbklTE=
X-Google-Smtp-Source: AGHT+IE4G8tF4t4tobhDLydlOHpy74mKHnjdVddbrMVpE78sNcz73JzvON/bt8jZjW3R+eaoP7P0Vw==
X-Received: by 2002:a17:90b:2242:b0:2ee:ba0c:1726 with SMTP id 98e67ed59e1d1-2f2901b253dmr8940041a91.34.1734197199504;
        Sat, 14 Dec 2024 09:26:39 -0800 (PST)
Received: from localhost.localdomain ([223.185.132.246])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f142f9e186sm5049811a91.41.2024.12.14.09.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Dec 2024 09:26:39 -0800 (PST)
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
Subject: [PATCH v2 05/11] genirq: Introduce kconfig option GENERIC_PENDING_IRQ_CHIPFLAGS
Date: Sat, 14 Dec 2024 22:55:43 +0530
Message-ID: <20241214172549.8842-6-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241214172549.8842-1-apatel@ventanamicro.com>
References: <20241214172549.8842-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241214_092640_186978_81CBB13E 
X-CRM114-Status: GOOD (  21.07  )
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

Introduce kconfig option GENERIC_PENDING_IRQ_CHIPFLAGS which allows
irq core to set IRQD_MOVE_PCNTXT flag based on IRQCHIP_MOVE_DEFERRED
flag.

This kconfig option will help architectures such as x86 and RISC-V
to mark top-level irqchip instances where irqs can't be moved in
the process context.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/linux/irq.h    | 10 ++++++++++
 kernel/irq/Kconfig     |  4 ++++
 kernel/irq/chip.c      | 39 ++++++++++++++++++++++++++++++++++++---
 kernel/irq/irqdomain.c |  1 +
 4 files changed, 51 insertions(+), 3 deletions(-)

diff --git a/include/linux/irq.h b/include/linux/irq.h
index fa711f80957b..b689c8fe8d60 100644
--- a/include/linux/irq.h
+++ b/include/linux/irq.h
@@ -567,6 +567,7 @@ struct irq_chip {
  *                                    in the suspend path if they are in disabled state
  * IRQCHIP_AFFINITY_PRE_STARTUP:      Default affinity update before startup
  * IRQCHIP_IMMUTABLE:		      Don't ever change anything in this chip
+ * IRQCHIP_MOVE_DEFERRED:             Move the interrupt in actual interrupt context
  */
 enum {
 	IRQCHIP_SET_TYPE_MASKED			= (1 <<  0),
@@ -581,6 +582,7 @@ enum {
 	IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND	= (1 <<  9),
 	IRQCHIP_AFFINITY_PRE_STARTUP		= (1 << 10),
 	IRQCHIP_IMMUTABLE			= (1 << 11),
+	IRQCHIP_MOVE_DEFERRED			= (1 << 12),
 };
 
 #include <linux/irqdesc.h>
@@ -634,6 +636,14 @@ static inline void irq_move_masked_irq(struct irq_data *data) { }
 static inline void irq_force_complete_move(struct irq_desc *desc) { }
 #endif
 
+#if defined(CONFIG_GENERIC_PENDING_IRQ_CHIPFLAGS)
+void irq_update_pcntxt_flag(unsigned int irq, const struct irq_chip *chip);
+#else
+static inline void irq_update_pcntxt_flag(unsigned int irq, const struct irq_chip *chip)
+{
+}
+#endif
+
 extern int no_irq_affinity;
 
 #ifdef CONFIG_HARDIRQS_SW_RESEND
diff --git a/kernel/irq/Kconfig b/kernel/irq/Kconfig
index 529adb1f5859..6d85a47fbf41 100644
--- a/kernel/irq/Kconfig
+++ b/kernel/irq/Kconfig
@@ -31,6 +31,10 @@ config GENERIC_IRQ_EFFECTIVE_AFF_MASK
 config GENERIC_PENDING_IRQ
 	bool
 
+# Deduce delayed migration from top-level interrupt chip flags
+config GENERIC_PENDING_IRQ_CHIPFLAGS
+	bool
+
 # Support for generic irq migrating off cpu before the cpu is offline.
 config GENERIC_IRQ_MIGRATION
 	bool
diff --git a/kernel/irq/chip.c b/kernel/irq/chip.c
index 271e9139de77..623959a24464 100644
--- a/kernel/irq/chip.c
+++ b/kernel/irq/chip.c
@@ -33,6 +33,33 @@ struct irqaction chained_action = {
 	.handler = bad_chained_irq,
 };
 
+#ifdef CONFIG_GENERIC_PENDING_IRQ_CHIPFLAGS
+static void __irq_update_pcntxt_flag(struct irq_desc *desc,
+				     const struct irq_chip *chip)
+{
+	if (chip) {
+		if (chip->flags & IRQCHIP_MOVE_DEFERRED)
+			irqd_clear(&desc->irq_data, IRQD_MOVE_PCNTXT);
+		else
+			irqd_set(&desc->irq_data, IRQD_MOVE_PCNTXT);
+	}
+}
+
+void irq_update_pcntxt_flag(unsigned int irq, const struct irq_chip *chip)
+{
+	unsigned long flags;
+	struct irq_desc *desc = irq_get_desc_lock(irq, &flags, 0);
+
+	__irq_update_pcntxt_flag(desc, chip);
+	irq_put_desc_unlock(desc, flags);
+}
+#else
+static inline void __irq_update_pcntxt_flag(struct irq_desc *desc,
+					    const struct irq_chip *chip)
+{
+}
+#endif
+
 /**
  *	irq_set_chip - set the irq chip for an irq
  *	@irq:	irq number
@@ -47,6 +74,7 @@ int irq_set_chip(unsigned int irq, const struct irq_chip *chip)
 		return -EINVAL;
 
 	desc->irq_data.chip = (struct irq_chip *)(chip ?: &no_irq_chip);
+	__irq_update_pcntxt_flag(desc, chip);
 	irq_put_desc_unlock(desc, flags);
 	/*
 	 * For !CONFIG_SPARSE_IRQ make the irq show up in
@@ -1114,16 +1142,21 @@ void irq_modify_status(unsigned int irq, unsigned long clr, unsigned long set)
 	trigger = irqd_get_trigger_type(&desc->irq_data);
 
 	irqd_clear(&desc->irq_data, IRQD_NO_BALANCING | IRQD_PER_CPU |
-		   IRQD_TRIGGER_MASK | IRQD_LEVEL | IRQD_MOVE_PCNTXT);
+		   IRQD_TRIGGER_MASK | IRQD_LEVEL);
 	if (irq_settings_has_no_balance_set(desc))
 		irqd_set(&desc->irq_data, IRQD_NO_BALANCING);
 	if (irq_settings_is_per_cpu(desc))
 		irqd_set(&desc->irq_data, IRQD_PER_CPU);
-	if (irq_settings_can_move_pcntxt(desc))
-		irqd_set(&desc->irq_data, IRQD_MOVE_PCNTXT);
 	if (irq_settings_is_level(desc))
 		irqd_set(&desc->irq_data, IRQD_LEVEL);
 
+	/* Keep this around until x86 is converted over */
+	if (!IS_ENABLED(CONFIG_GENERIC_PENDING_IRQ_CHIPFLAGS)) {
+		irqd_clear(&desc->irq_data, IRQD_MOVE_PCNTXT);
+		if (irq_settings_can_move_pcntxt(desc))
+			irqd_set(&desc->irq_data, IRQD_MOVE_PCNTXT);
+	}
+
 	tmp = irq_settings_get_trigger_mask(desc);
 	if (tmp != IRQ_TYPE_NONE)
 		trigger = tmp;
diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
index ec6d8e72d980..ec5fc1d8cebe 100644
--- a/kernel/irq/irqdomain.c
+++ b/kernel/irq/irqdomain.c
@@ -1508,6 +1508,7 @@ int irq_domain_set_hwirq_and_chip(struct irq_domain *domain, unsigned int virq,
 	irq_data->hwirq = hwirq;
 	irq_data->chip = (struct irq_chip *)(chip ? chip : &no_irq_chip);
 	irq_data->chip_data = chip_data;
+	irq_update_pcntxt_flag(virq, chip);
 
 	return 0;
 }
-- 
2.43.0


