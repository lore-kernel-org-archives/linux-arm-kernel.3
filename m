Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4E2DC02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 16:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RoqQmmMLZnhmH7e8y5iCPOfAA2UjM+1/YD5gOA06f3E=; b=VVRKjs6vJl7nSATHXAWL+0j0EQ
	r0G/bRPvSp+hKcd35FHSeszC9VliR8miQOQevteSHFTUF0gYsdVS9UK2vvTI5EfGXpME3xEFtrDRp
	tQfKEVk/g+xMltFIMfm8wiaTBe49PFZ93d0mZgoOzl9d0J1Ey9PlIl5QZ6tDjnOiL3zM6nilCgGCC
	oF6HHNsUGbdEVffgR7+X9PiVyHpzK7jiTTAsHSq/FeRV+1W9F3JtcOui9PJXpk6srrX4tJqVjZH+s
	jt6ApJ7CTa+/CRt5uxlhCbWsuI3BFEZ9S58IPYa7fxjJamVzagwwS1pp4M/2khQVnAx1Dj+kpIO21
	k5MYfq5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfi3J-00000003w30-30gu;
	Wed, 05 Feb 2025 16:15:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfhpr-00000003t4P-2wse
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 05 Feb 2025 16:01:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=RoqQmmMLZnhmH7e8y5iCPOfAA2UjM+1/YD5gOA06f3E=; b=Yi1TpON6QPCnB19z0FeDve8asX
	lz7QSI19cm9wnli/iUuX4entKdiAwKPa1ApDvRKh/VO/5xmw+ooXqV94ilOzgl1I4wT+164+RrUzw
	VICnPZoBuRBoEX9IeVt+cXvWtGWni/tGyJhzGH1vyNIz1hWLvMCTLQiytRJaTUNMXHI0Xjz9Ga5sJ
	b/E0nY2JV3zRYLfC02lBWKGFBMhEDUcYg4BBvk7bGLaEhJBW9AZ6mu74S/OjpRX8QFzEPwyDU8sLq
	C1oM3Sy1pJJcJOzRJlUXwetI74lZ3VidgfACarAI9PFB7NRDYjpG+KjBX42Dny6I4jILhFz/XgqIe
	cCWZyWvQ==;
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfhpo-0000000GgQX-3Tl0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 16:01:06 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-21f20666e72so11170805ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Feb 2025 08:01:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738771262; x=1739376062; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RoqQmmMLZnhmH7e8y5iCPOfAA2UjM+1/YD5gOA06f3E=;
        b=KUOzjZ3pk/WuctByCJugIn0Yo+ZvLAGlAGpb0MQbW1f35ZXcrM8r4makroiw079ZCl
         w75qsY1JhDbdhNo47FAkkiHMbPtOs0NuI1DL51DuEr/ytE0zrbKtqW/p2hmtwTSaWK+k
         Bg5BTQPSr+ijxnILjs/cu8ltkfFvPwz7Wtkcum/hTeqXClx2oJxw8z9+vnsoFzhNuLg5
         881Fxs4g9gk3lQ69mJXQ+gl7HdsQRqKmRNZXDyOJQlMjX2BcUT+94/q8XSGGZHhuRFWJ
         x6GNrBJQB6GQoE/bv8wm03P1wD4mxeK6TQiEcLPJ+K+Nl3LyEABCGE8Qj+m+3in+bu5y
         eJbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738771262; x=1739376062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RoqQmmMLZnhmH7e8y5iCPOfAA2UjM+1/YD5gOA06f3E=;
        b=dcdxa3600oINcXLJk240HDxT1r53P5hO29vkGEMtf9RIltkUGTzwnMPRiaBUwr3Fpg
         rGX1Ttl0Rd6cdXUKiKwMXeWGhRjJ4+QADNUPQs/YatIuTc+hZXHOQwKrXUDHq2hSIyIw
         /7oC4c53g0Do0eGkwZ79t23egV1wBTST5G2rDX42JY4AysDSgpG7Zc4X8xXkQW22ss4R
         LsU4SAV7aZVZBQOoiS7aTuEzMR6zB/5lP7lRWr8yfK8Keop8QS7sTb5QdXFGe3ZF7nYW
         UxbZaqc3ATxnFe0SGvvH8XozXZVwqTKOn1Jaujdg5qco6ImyTf+H+vZhXO2nWUiQOx+6
         kG5w==
X-Forwarded-Encrypted: i=1; AJvYcCVCzOb2lQiSoDieKBHjQK5XAsIKQR80AIzABi2u4jSuwJBJdIxRc6SxHAQdzL2NIca0Bz/4dANzVjXO7VZ7/cew@lists.infradead.org
X-Gm-Message-State: AOJu0Yz28MUUtkLi8efDRqDKH6Od6G9r1HVGCpXeMzsneLK0N+egP/+j
	ryAQ4eN3vPRM57JWH+lZKf5lErbJfVB9FHv07nWrcP0eepMOS8aasf0fHEDe8So=
X-Gm-Gg: ASbGncvM1o9NOMzjXDfn4YwuMgZJVimpqzy4jc0RuNI9dIB24Ps8cdDsIT+Nu/4xP34
	8BxY0EtDGBSze3ifeIzUXgeKnAhXl5hecsDgg2oCg0xu6HmYWfh8rynxNeZnPj3k+nfNe2FoOIQ
	72R7Wgo5wxkqjEdgjvk1/RBCsXTCAvrvOlwK8pL80Ymj44CmeqzPEOe9GXi5GbopLnoQbcY0cPE
	eGWQOKQsuFZ/x5fDjh64HKgRKovGX6HQenbz2crwefhmDIC1zmPoRXY5xZ9jqopTOC/nTVRBGAe
	qCi2DyaWQAUX+0lCGAvaK1GrOKV5bsj/tiZyqS0NNQBNouDwfzksa4E=
X-Google-Smtp-Source: AGHT+IGA6bIArcQBSZQINkR2ug10cWLWOtAjnqU2/HK+jfs8kC57mwS6eJ+lRGDZ5WGk1pjMRxBEnA==
X-Received: by 2002:a17:902:ced1:b0:215:65f3:27f2 with SMTP id d9443c01a7336-21f17e2719dmr55903235ad.8.1738771262008;
        Wed, 05 Feb 2025 08:01:02 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21edddf883fsm99369015ad.4.2025.02.05.08.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 08:00:58 -0800 (PST)
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
Subject: [PATCH v4 09/11] irqchip/riscv-imsic: Implement irq_force_complete_move() for IMSIC
Date: Wed,  5 Feb 2025 21:29:45 +0530
Message-ID: <20250205155948.81385-10-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250205155948.81385-1-apatel@ventanamicro.com>
References: <20250205155948.81385-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_160105_038654_55073779 
X-CRM114-Status: GOOD (  15.96  )
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

Implement irq_force_complete_move() for IMSIC driver so that in-flight
vector movements on a CPU can be cleaned-up when the CPU goes down.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/irqchip/irq-riscv-imsic-platform.c | 32 ++++++++++++++++++++++
 drivers/irqchip/irq-riscv-imsic-state.c    | 17 ++++++++++++
 drivers/irqchip/irq-riscv-imsic-state.h    |  1 +
 3 files changed, 50 insertions(+)

diff --git a/drivers/irqchip/irq-riscv-imsic-platform.c b/drivers/irqchip/irq-riscv-imsic-platform.c
index 9a5e7b4541f6..b9e3f9030bdf 100644
--- a/drivers/irqchip/irq-riscv-imsic-platform.c
+++ b/drivers/irqchip/irq-riscv-imsic-platform.c
@@ -129,6 +129,37 @@ static int imsic_irq_set_affinity(struct irq_data *d, const struct cpumask *mask
 
 	return IRQ_SET_MASK_OK_DONE;
 }
+
+static void imsic_irq_force_complete_move(struct irq_data *d)
+{
+	struct imsic_vector *mvec, *vec = irq_data_get_irq_chip_data(d);
+	unsigned int cpu = smp_processor_id();
+
+	if (WARN_ON(!vec))
+		return;
+
+	/* Do nothing if there is no in-flight move */
+	mvec = imsic_vector_get_move(vec);
+	if (!mvec)
+		return;
+
+	/* Do nothing if the old IMSIC vector does not belong to current CPU */
+	if (mvec->cpu != cpu)
+		return;
+
+	/*
+	 * The best we can do is force cleanup the old IMSIC vector.
+	 *
+	 * The challenges over here are same as x86 vector domain so
+	 * refer to the comments in irq_force_complete_move() function
+	 * implemented at arch/x86/kernel/apic/vector.c.
+	 */
+
+	/* Force cleanup in-flight move */
+	pr_info("IRQ fixup: irq %d move in progress, old vector cpu %d local_id %d\n",
+		d->irq, mvec->cpu, mvec->local_id);
+	imsic_vector_force_move_cleanup(vec);
+}
 #endif
 
 static struct irq_chip imsic_irq_base_chip = {
@@ -137,6 +168,7 @@ static struct irq_chip imsic_irq_base_chip = {
 	.irq_unmask		= imsic_irq_unmask,
 #ifdef CONFIG_SMP
 	.irq_set_affinity	= imsic_irq_set_affinity,
+	.irq_force_complete_move = imsic_irq_force_complete_move,
 #endif
 	.irq_retrigger		= imsic_irq_retrigger,
 	.irq_compose_msi_msg	= imsic_irq_compose_msg,
diff --git a/drivers/irqchip/irq-riscv-imsic-state.c b/drivers/irqchip/irq-riscv-imsic-state.c
index 96e994443fc7..5ec2b6bdffb2 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.c
+++ b/drivers/irqchip/irq-riscv-imsic-state.c
@@ -311,6 +311,23 @@ void imsic_vector_unmask(struct imsic_vector *vec)
 	raw_spin_unlock(&lpriv->lock);
 }
 
+void imsic_vector_force_move_cleanup(struct imsic_vector *vec)
+{
+	struct imsic_local_priv *lpriv;
+	struct imsic_vector *mvec;
+	unsigned long flags;
+
+	lpriv = per_cpu_ptr(imsic->lpriv, vec->cpu);
+	raw_spin_lock_irqsave(&lpriv->lock, flags);
+
+	mvec = READ_ONCE(vec->move_prev);
+	WRITE_ONCE(vec->move_prev, NULL);
+	if (mvec)
+		imsic_vector_free(mvec);
+
+	raw_spin_unlock_irqrestore(&lpriv->lock, flags);
+}
+
 static bool imsic_vector_move_update(struct imsic_local_priv *lpriv,
 				     struct imsic_vector *vec, bool is_old_vec,
 				     bool new_enable, struct imsic_vector *move_vec)
diff --git a/drivers/irqchip/irq-riscv-imsic-state.h b/drivers/irqchip/irq-riscv-imsic-state.h
index f02842b84ed5..19dea0c77738 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.h
+++ b/drivers/irqchip/irq-riscv-imsic-state.h
@@ -91,6 +91,7 @@ static inline struct imsic_vector *imsic_vector_get_move(struct imsic_vector *ve
 	return READ_ONCE(vec->move_prev);
 }
 
+void imsic_vector_force_move_cleanup(struct imsic_vector *vec);
 void imsic_vector_move(struct imsic_vector *old_vec, struct imsic_vector *new_vec);
 
 struct imsic_vector *imsic_vector_from_local_id(unsigned int cpu, unsigned int local_id);
-- 
2.43.0


