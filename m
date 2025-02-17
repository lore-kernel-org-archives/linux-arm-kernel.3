Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78165C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 09:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=koCL3sGSNowxnA2uthh7D1mm9ult5obqPLO5TypzPmY=; b=iA9zpL2qTeEtz+ikfYOpvTzIIJ
	UnJqaV30kKKTgOfGk9LuSo4Xe6/ZBJgGktwu7OYPUzhfp4jC0Qp6B78hp5oaK60gf/Gtsju6CpU2q
	l8DCj0vvxQYqtKk7DSIeXgwLgrb3GdrXOD3OvcZm4sJvMVeMM5kAqGQLdjfoLpvKGxwkmPNpIfLgO
	7FNRU4vO4UvZhTcCs3zM+ay/mHRvIZi1inBt2pXwT2M05Tay8wnk2UH3uf8n6BvMjFhsnIk0gRVUy
	PgdgKOLfesg7uV4OfTcMF91hqmdeV/52FbTkyJaw4eTKjMot/LCi1hOKPwQfSjjjID2odYVI+12DJ
	Q8czvh2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjxBK-00000003tFd-1ocO;
	Mon, 17 Feb 2025 09:12:50 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjwxy-00000003pok-2Brd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 08:59:03 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2fc1f410186so5455988a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Feb 2025 00:59:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1739782742; x=1740387542; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=koCL3sGSNowxnA2uthh7D1mm9ult5obqPLO5TypzPmY=;
        b=PH00+nYQ6Vf3D150ksjsP5miu5HL/gVaiAwwhUb0YGdBcokD52Y6S/2NN5b4d6cxfa
         vyuM/9npvGj3mS6yckbFm1LDjL1+5oOyW+Fyl657gEGYs9sD3uc3+N5Ci0DukW1Se6k9
         XVMBzS/stz0PmoZGmoR5jsLIjMvl1amXoB3bb5Q4j67hBsAe2oGVty0uczC7sACEWRLr
         pXsZA/dSD3pQvGdxLQM1veB+1vzV2NjkrwNGyBBkipAJSpXF0wtf4ewI4FWglnPmqs1C
         q83lG9SF3rwCI2RYaDUe5WHn7VRllFV+JIbgxt2TuJ/sTdLye3WoHNODypWmsTXicVI9
         YM5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739782742; x=1740387542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=koCL3sGSNowxnA2uthh7D1mm9ult5obqPLO5TypzPmY=;
        b=jr7vbm8uvQDEk2x02RKmBsooJiRTaMCmtPtdSJ8Ejtjn8BJaxQ3H6UuWSBsqmolRV5
         puwhPiKjqSup6kL4WvpQP5+q2N3ZQUGx4Yf5W/s7SC/P3mhK8LjpB4tLu1xefyevu+K8
         icF37tJgPuE/6ruYIq12bSfwCmi8Eq43hfbpy2VhaN1NpSdf5FbCUF+dQMvpgXYKbBbF
         umEKC0/3k3Sw7qIHrFwPPKNcAfw+TvxhcASB0a9jC0545iI9OP1jCO53lLYQ59+hAE1M
         jUm/my3h9tLiIuvVPdHiylm250UcV0D4LmHCIOhInvFbk2mva0dP7wKVOkDO2J7GsWhp
         Snqg==
X-Forwarded-Encrypted: i=1; AJvYcCUdEmBoLb2V6mW0eL8e6wlh3v65U3BJCtDcOK4YsFqF/oza9Tc5sq4btYfavMRaMxswLEVQt2pjb2bOdbT7TtAG@lists.infradead.org
X-Gm-Message-State: AOJu0YwZFsIvCybW1H75f6MfH6VcVYrENazR+MSdF2lcAJ3Oe210J6St
	X0hqlglzAzmnPkBIQuQvBB9x+F+Mei3YNCrrojF9cRTQFiXYiKADa1jt1APzdE4=
X-Gm-Gg: ASbGnctoYYXyrJCQ2IkAKjSvPs+Zxr7xWhha6CgBtQ7GurcRnXOHZotcJhtlEnr2ART
	3vTu1nX77SXKzDJVz3Uc6Mm4+yjcJOaOzO9HLFswYy5TxYDZX14J3QaLDtv0BqQGJJKuWqEk9o3
	7NekXT9pUcgmyE1hVfWdCvkyqdcWaD19rpn5/4DM/Gk3VSPxNQVu7BLCnn2vZrteslRHLDaPV3o
	8wh0KjVXCgYPdPUbSHfjdzRlEVv8CPm6m7d4P7E+QoqvAgH4UYyR9/+8kkiIJ+5hTUDiQUuCJ2y
	Mjy5nBKYqVRhPcWdRzzJmjqPF9ZZWp6eGx2Dn4HMf9x548EinUkfX00=
X-Google-Smtp-Source: AGHT+IHbBvzPw0Wn7/Eyf5Y7dSkIAJVrU71JRxh4insgq9Beex3YYjwNlgnCYaOLqfIHDCH+B/xxjA==
X-Received: by 2002:a05:6a00:4fd2:b0:730:949d:2d52 with SMTP id d2e1a72fcca58-73262158ademr14543775b3a.3.1739782741534;
        Mon, 17 Feb 2025 00:59:01 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([122.171.22.227])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73242546867sm7632018b3a.24.2025.02.17.00.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 00:59:00 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org
Cc: hpa@zytor.com,
	Marc Zyngier <maz@kernel.org>,
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
Subject: [PATCH v6 09/10] irqchip/riscv-imsic: Replace hwirq with irq in the IMSIC vector
Date: Mon, 17 Feb 2025 14:26:55 +0530
Message-ID: <20250217085657.789309-10-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250217085657.789309-1-apatel@ventanamicro.com>
References: <20250217085657.789309-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_005902_559326_43F16EE0 
X-CRM114-Status: GOOD (  17.99  )
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
index 553650932c75..d9ae87808651 100644
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
index b9e3f9030bdf..6bf5d63f614e 100644
--- a/drivers/irqchip/irq-riscv-imsic-platform.c
+++ b/drivers/irqchip/irq-riscv-imsic-platform.c
@@ -111,7 +111,7 @@ static int imsic_irq_set_affinity(struct irq_data *d, const struct cpumask *mask
 		return -EBUSY;
 
 	/* Get a new vector on the desired set of CPUs */
-	new_vec = imsic_vector_alloc(old_vec->hwirq, mask_val);
+	new_vec = imsic_vector_alloc(old_vec->irq, mask_val);
 	if (!new_vec)
 		return -ENOSPC;
 
diff --git a/drivers/irqchip/irq-riscv-imsic-state.c b/drivers/irqchip/irq-riscv-imsic-state.c
index 5ec2b6bdffb2..d0148e48ab05 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.c
+++ b/drivers/irqchip/irq-riscv-imsic-state.c
@@ -422,7 +422,7 @@ struct imsic_vector *imsic_vector_from_local_id(unsigned int cpu, unsigned int l
 	return &lpriv->vectors[local_id];
 }
 
-struct imsic_vector *imsic_vector_alloc(unsigned int hwirq, const struct cpumask *mask)
+struct imsic_vector *imsic_vector_alloc(unsigned int irq, const struct cpumask *mask)
 {
 	struct imsic_vector *vec = NULL;
 	struct imsic_local_priv *lpriv;
@@ -438,7 +438,7 @@ struct imsic_vector *imsic_vector_alloc(unsigned int hwirq, const struct cpumask
 
 	lpriv = per_cpu_ptr(imsic->lpriv, cpu);
 	vec = &lpriv->vectors[local_id];
-	vec->hwirq = hwirq;
+	vec->irq = irq;
 	vec->enable = false;
 	vec->move_next = NULL;
 	vec->move_prev = NULL;
@@ -451,7 +451,7 @@ void imsic_vector_free(struct imsic_vector *vec)
 	unsigned long flags;
 
 	raw_spin_lock_irqsave(&imsic->matrix_lock, flags);
-	vec->hwirq = UINT_MAX;
+	vec->irq = 0;
 	irq_matrix_free(imsic->matrix, vec->cpu, vec->local_id, false);
 	raw_spin_unlock_irqrestore(&imsic->matrix_lock, flags);
 }
@@ -510,7 +510,7 @@ static int __init imsic_local_init(void)
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


