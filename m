Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 813B9E77184
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Dec 2024 18:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EP+pJC86HytY47PbI5sMBg+o5TFAFMoqjjekp4WBZSk=; b=BdF+yeWlb4OOem8zB1UHD9YnvV
	1q4HEhKCfRgOnTQOlh3ZS3Trd7O7yWaU+3NO1sDVIDmo431zwSo/taYcrij8gVtRwykY0lTHPPhGC
	lscZgOVoAN689TbAeI9N2QygbvRNpukgoUtYimCHz4y5YjeAk4OG+qNFa64b8UZlAKYbQ8pvPEI1j
	ZHeLoFvh2fnMwyvv4jB55FatgSxM5aH1O/L4Jlti4hjo33IahhEzgmyA3aQXksQTr24JOaaEDN8n8
	ZPjlx5gDvUtfFmBYSPT9Zv5gHBSOEhC7lIyqsDIQrhRBjrFE+MuPEbRY0NZJiqGmMv3CiwVPfeTeM
	Tua2JJJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMX9G-00000006nY0-2KXF;
	Sat, 14 Dec 2024 18:45:54 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMVv8-00000006gZv-3WEc
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Dec 2024 17:27:16 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-7fcfb7db9bfso2058023a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Dec 2024 09:27:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1734197234; x=1734802034; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EP+pJC86HytY47PbI5sMBg+o5TFAFMoqjjekp4WBZSk=;
        b=NEwm7NCgBZvTjh5PL4xLstTePcqDe4KhrPWnztezena2SxcMXXwOFjVkWHCQ93468f
         L6P855gjOlOfFV9arAAEaGBCPQLdGEMCqzHq9USk5LfsQt9TCxA23t9qBWDBP6aPJP3L
         MyZWr2dbz7fXLsJdmWOTDXaa0cHkuHqJfs1YAaZFv6BjpvAy6RZDdaxYbRRFl1jdDKna
         BrIjH5gDhGWcDMl2m7osUDsegpFfMzdIhfK/XMKyfv91GPfGqrBrfrsQYziiWFixcsBQ
         vwfdjMzSsJ+QML1GohD+EOZZbLjqk1DfGOu8EG3hfEfJmrkQyrIYm/XfKk9PyUpDeVzk
         Ig+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734197234; x=1734802034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EP+pJC86HytY47PbI5sMBg+o5TFAFMoqjjekp4WBZSk=;
        b=XxDIeCyRwFEOcoKfNSN3AjzO0N+pzEK0eIh+rv7Zl2HCILgzswrsZteDDsqGvo3YMN
         ckIMYjoytXmZrYz1NnxC2nE3kSUEF+FLdMpbyOFOsBzdaojYx6DlOceI0gMVnxsr8Q8W
         crcm4uKQEGhBMwVK0OyJMlFni9Pgnint4dvlUsPAg7rRSvrJ+D5RW1eps6BeIBCuqQ/C
         7AYuepJSpHSsdJo5q3NJNr7mWUakIeDfSrfOqGTFwfmHBBgQEbzLlwJ7yJ4jgEhUTWrH
         iPQT676c45b1us8FVqvRy+DKAEoG/pOofMyMW5VwNcP0LOCAA+68xDzeCW7Y5j0JhNSW
         3tvg==
X-Forwarded-Encrypted: i=1; AJvYcCXI7MRF7LhZUorjUiLYZoaQwvAZ0xT84Q5qVJZGq9y7d+6AwXTy67Y/58RNJXutAH/bWtzPjbFfIAK/1670cMQ3@lists.infradead.org
X-Gm-Message-State: AOJu0YyCtGLDCsBBxjdGSqmPnKHQscvIbC9ukfQ9izkWPKcYslF63lab
	coiYXL1XzoYTs7xiTOrV+zq4w3F11W0N7kADXDs03K/r/BzLzdw+7jAckkmr+T0=
X-Gm-Gg: ASbGnctZP6W4uVuwtK/30dRjp6/+NV8hsH7TzPjYmnOWgHWy5hZwRK9cx3VMVYwQhlR
	00NR/RkxoGraiYwRDpWMi28E2Gmj8tVeEnLtlT0ynhJeDhDsSO9sPc2q96iEt9VIk56b181vdbB
	IWLuQmBLBxnlqThqrP2wNjYnxCZPUTtmHRfNP2AV+R9afTnDdH99c6huq/srSmXEM0JyxVlX87w
	UUglJiUgfKbZq4psrq/sx55gs73qwby/P7tOyYFQUtdilD3AUSSZ7caOCirR0zEPRbzNbBGCcSR
	LbhivERjGfokHKo=
X-Google-Smtp-Source: AGHT+IEViE/EyOEoU9avO8xOUuGHIK7Nu4di+ccQuUelW0qrSBcAUC23H6R13dSAPO44yc0spDyzYw==
X-Received: by 2002:a17:90a:ec84:b0:2ee:f80c:6889 with SMTP id 98e67ed59e1d1-2f290dbce03mr10584296a91.33.1734197234199;
        Sat, 14 Dec 2024 09:27:14 -0800 (PST)
Received: from localhost.localdomain ([223.185.132.246])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f142f9e186sm5049811a91.41.2024.12.14.09.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Dec 2024 09:27:13 -0800 (PST)
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
Subject: [PATCH v2 10/11] irqchip/riscv-imsic: Replace hwirq with irq in the IMSIC vector
Date: Sat, 14 Dec 2024 22:55:48 +0530
Message-ID: <20241214172549.8842-11-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241214172549.8842-1-apatel@ventanamicro.com>
References: <20241214172549.8842-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241214_092715_049358_3EE5CC42 
X-CRM114-Status: GOOD (  18.23  )
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

Currently, the imsic_handle_irq() uses generic_handle_domain_irq() to
handle the irq which internally has an extra step of resolving hwirq
using domain. This extra step can be avoided by replacing hwirq with
irq in the IMSIC vector and directly calling generic_handle_irq().

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/irqchip/irq-riscv-imsic-early.c    | 6 ++----
 drivers/irqchip/irq-riscv-imsic-platform.c | 2 +-
 drivers/irqchip/irq-riscv-imsic-state.c    | 8 ++++----
 drivers/irqchip/irq-riscv-imsic-state.h    | 4 ++--
 4 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-imsic-early.c b/drivers/irqchip/irq-riscv-imsic-early.c
index 73a93ce8668f..0c94ce8ce580 100644
--- a/drivers/irqchip/irq-riscv-imsic-early.c
+++ b/drivers/irqchip/irq-riscv-imsic-early.c
@@ -73,7 +73,7 @@ static int __init imsic_ipi_domain_init(void) { return 0; }
 static void imsic_handle_irq(struct irq_desc *desc)
 {
 	struct irq_chip *chip = irq_desc_get_chip(desc);
-	int err, cpu = smp_processor_id();
+	int cpu = smp_processor_id();
 	struct imsic_vector *vec;
 	unsigned long local_id;
 
@@ -103,9 +103,7 @@ static void imsic_handle_irq(struct irq_desc *desc)
 			continue;
 		}
 
-		err = generic_handle_domain_irq(imsic->base_domain, vec->hwirq);
-		if (unlikely(err))
-			pr_warn_ratelimited("hwirq 0x%x mapping not found\n", vec->hwirq);
+		generic_handle_irq(vec->irq);
 	}
 
 	chained_irq_exit(chip, desc);
diff --git a/drivers/irqchip/irq-riscv-imsic-platform.c b/drivers/irqchip/irq-riscv-imsic-platform.c
index fae47b8ccf73..e6c81718ba78 100644
--- a/drivers/irqchip/irq-riscv-imsic-platform.c
+++ b/drivers/irqchip/irq-riscv-imsic-platform.c
@@ -112,7 +112,7 @@ static int imsic_irq_set_affinity(struct irq_data *d, const struct cpumask *mask
 		return -EBUSY;
 
 	/* Get a new vector on the desired set of CPUs */
-	new_vec = imsic_vector_alloc(old_vec->hwirq, mask_val);
+	new_vec = imsic_vector_alloc(old_vec->irq, mask_val);
 	if (!new_vec)
 		return -ENOSPC;
 
diff --git a/drivers/irqchip/irq-riscv-imsic-state.c b/drivers/irqchip/irq-riscv-imsic-state.c
index c915a5cf4187..aca769d915bf 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.c
+++ b/drivers/irqchip/irq-riscv-imsic-state.c
@@ -434,7 +434,7 @@ struct imsic_vector *imsic_vector_from_local_id(unsigned int cpu, unsigned int l
 	return &lpriv->vectors[local_id];
 }
 
-struct imsic_vector *imsic_vector_alloc(unsigned int hwirq, const struct cpumask *mask)
+struct imsic_vector *imsic_vector_alloc(unsigned int irq, const struct cpumask *mask)
 {
 	struct imsic_vector *vec = NULL;
 	struct imsic_local_priv *lpriv;
@@ -450,7 +450,7 @@ struct imsic_vector *imsic_vector_alloc(unsigned int hwirq, const struct cpumask
 
 	lpriv = per_cpu_ptr(imsic->lpriv, cpu);
 	vec = &lpriv->vectors[local_id];
-	vec->hwirq = hwirq;
+	vec->irq = irq;
 	vec->enable = false;
 	vec->move_next = NULL;
 	vec->move_prev = NULL;
@@ -463,7 +463,7 @@ void imsic_vector_free(struct imsic_vector *vec)
 	unsigned long flags;
 
 	raw_spin_lock_irqsave(&imsic->matrix_lock, flags);
-	vec->hwirq = UINT_MAX;
+	vec->irq = 0;
 	irq_matrix_free(imsic->matrix, vec->cpu, vec->local_id, false);
 	raw_spin_unlock_irqrestore(&imsic->matrix_lock, flags);
 }
@@ -522,7 +522,7 @@ static int __init imsic_local_init(void)
 			vec = &lpriv->vectors[i];
 			vec->cpu = cpu;
 			vec->local_id = i;
-			vec->hwirq = UINT_MAX;
+			vec->irq = 0;
 		}
 	}
 
diff --git a/drivers/irqchip/irq-riscv-imsic-state.h b/drivers/irqchip/irq-riscv-imsic-state.h
index 19dea0c77738..3202ffa4e849 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.h
+++ b/drivers/irqchip/irq-riscv-imsic-state.h
@@ -20,7 +20,7 @@ struct imsic_vector {
 	unsigned int				cpu;
 	unsigned int				local_id;
 	/* Details saved by driver in the vector */
-	unsigned int				hwirq;
+	unsigned int				irq;
 	/* Details accessed using local lock held */
 	bool					enable;
 	struct imsic_vector			*move_next;
@@ -96,7 +96,7 @@ void imsic_vector_move(struct imsic_vector *old_vec, struct imsic_vector *new_ve
 
 struct imsic_vector *imsic_vector_from_local_id(unsigned int cpu, unsigned int local_id);
 
-struct imsic_vector *imsic_vector_alloc(unsigned int hwirq, const struct cpumask *mask);
+struct imsic_vector *imsic_vector_alloc(unsigned int irq, const struct cpumask *mask);
 void imsic_vector_free(struct imsic_vector *vector);
 
 void imsic_vector_debug_show(struct seq_file *m, struct imsic_vector *vec, int ind);
-- 
2.43.0


