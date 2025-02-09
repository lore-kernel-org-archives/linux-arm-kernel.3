Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E8ABC02199
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Feb 2025 04:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2uqH0LlhZdZ1/ZJgerOy14gnMEDsVqG8t0Fz3f/FUy8=; b=b83DQE/nQDG2fEovCTUrOwKlww
	210yeGWiRicAm9OudVLyCXMdiLjPVdnECAdjX7BymgyveIVUxlyJ6/CZG+px8VE/piYVAPj3bgN9C
	5wZ8HoV7IXzG5QFOhtzIka9oSJaddSoaojfIhAx9nk1u/W3c0F9wA4zi+AVR+q9lRmXIGRK/Yy6q3
	0ZPlPVcVjnww2pl8yq6t/qw1Nix4gPW6Y+TQv8rxaOq1ezwnQoU0dgN9xBpGuyCavli4towXgVC82
	bQ7OSOER1T1nmfIBZnvjn7W14S2bezWu+z5UHneNTSTOVUpZRURM383HRRjsvXUEcFWSsF2UMAVX5
	/Q+XdP3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgyzx-0000000E504-3Joe;
	Sun, 09 Feb 2025 04:32:49 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgymG-0000000E2hG-3ock
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Feb 2025 04:18:42 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-2fa1a3c88c5so3873385a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Feb 2025 20:18:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1739074720; x=1739679520; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2uqH0LlhZdZ1/ZJgerOy14gnMEDsVqG8t0Fz3f/FUy8=;
        b=TOi2f7YvdDCI1YjIVnHfKIIF8HkLUwjeIIZnsYt1FpeMDq8GS8dYcnqKnRrIxxllmv
         RV2RecWq4oSy5K+GfVEBYzmlw5t2YUzxVbU6XVk2e9zghV2XPoMr9WGwuBYdabjJ7p80
         Ww+phkPZCVkPhxdJoOE+/JqMKb1t70Kk9KIdZymLjV/WotyoLAaYiL01a9smS6DEn5zy
         qn6StW9LEDnkurjITnRdEMxJhC3CieCsW/a6F3rxGiCwO0TdWStFBS55ihQU1X1C2E9Q
         mIS/y7NvaXCRXhLPPfJlKDnbiDMMKrIrI7MALnXC6nteANOJRbIkc9EenfLs4/KDjsmC
         VQ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739074720; x=1739679520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2uqH0LlhZdZ1/ZJgerOy14gnMEDsVqG8t0Fz3f/FUy8=;
        b=g+gc72xKnFQcWmWHwqGHPhbul+mRslQyIjoDhMzGvOhYg1iIRdkzaQniLseppP6Y6l
         i0osYwqaZpB79JelbSxPhIL4ZWvZHeDNszHpo8o/UxrWwc+uIpRANOc+zW2j5Up2/ubs
         /xvWP6EWDESYG4MosqFVe8SYiXukLttp2kdK6ASTJIspCPrTKw7KEEMpUefl0pyeSE6G
         Q2GKbfazTf6Fwt+uKn0DdJczOkou2Myb051xU1QgIRPV9kHFO7RERVss73wKE489Lt+0
         vtTnIwE655JMZQh0pWBcAguNkfatqdCfoDzglAr2VTX0VHTG8OjnQq3A9BwrX0/iptth
         lMgw==
X-Forwarded-Encrypted: i=1; AJvYcCWe7XavAzDlFbw2a+XHWnIEhA28Juqjce2dehE847lkPsWd3Pfy1QDOfFENWwafpWUFUNsg3rJnWt1dPEpJmn3h@lists.infradead.org
X-Gm-Message-State: AOJu0Yxin+HLrs8N0ePzLZ5yIX0N01FfcO2+aC4SVYC3w5FbR0N4sUlc
	VVKDEBp+rkk+PCUmwnnG36neChh12UhMlC3O+TdGdVJTgmU5P5KfjULmlZE91ko=
X-Gm-Gg: ASbGnctH4KJ035B1pcqTz+OsyHyheZeJYM8s02YCaq57NrqUVf8g/mSym1ifxizQhhS
	f18zahs5Ofk1exWux5OT73mNe3rsYxQMXNhaQ0/0TD+8U9riiez3atwaJamMpmDnw7gk1HpCbms
	VVNqVU1OBvel1iVBOo7jfUCJ1qEuJIEKqNi0VK223P2Z4CE8vP6wLmdElUv6bBzIo+r4MUC0MSu
	8Auc5hlzx27YnkfGPJbV2SJdSKsgTf9R8XB3k4N6lULP2aJigjOJV0rNVjVrIK3EX26vuXUx+uv
	9zunG8ABW5bdK2hKKySU2kAxck5TMfwagfhSu2W+IdtvAWkAEYsGJxM=
X-Google-Smtp-Source: AGHT+IHUzy54yYs2fS4vJemZHOHOIs8APlSMaPpVV2klzUoQAT+FU5F1TyPBFlToppvPWeQiJJcXfw==
X-Received: by 2002:a05:6a00:949a:b0:730:75b1:720a with SMTP id d2e1a72fcca58-73075b1752dmr5977536b3a.23.1739074719968;
        Sat, 08 Feb 2025 20:18:39 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73073eba116sm1898410b3a.124.2025.02.08.20.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 20:18:39 -0800 (PST)
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
Subject: [PATCH v5 10/11] irqchip/riscv-imsic: Replace hwirq with irq in the IMSIC vector
Date: Sun,  9 Feb 2025 09:46:54 +0530
Message-ID: <20250209041655.331470-11-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250209041655.331470-1-apatel@ventanamicro.com>
References: <20250209041655.331470-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250208_201840_950938_8B236B15 
X-CRM114-Status: GOOD (  17.94  )
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
index b5def6268936..d2e8ed70d396 100644
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


