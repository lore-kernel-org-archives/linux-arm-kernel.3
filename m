Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89D67C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 09:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=muAXlG/uZk+Ut1w5NICM8ivKf832EJKGEf1Ht7zOCxs=; b=i4HLLopsFq0pzR7yjNj6bSBJtw
	EP3vtjYPRLp+ZW5Nt6Z6OQJqYZUnzNmdnglSiLE2qvXA8eAxSxKa+8Lj3Z1Hh4gekiBDp4sMEZVEa
	he7eARqwXgn2aY6tbdRLHg0Cmf9ubFjTR+uxWI7VOO7/HCAOV5MXp7EQlMwvzlz+KwMzZuoJRk8AF
	6JGa3KJcMeRvgm0kRmVjCTL4PfD97pornimCGcP5kk0BHxIh00Irrtf0+RI3t1J/mIATNw7++Pl8R
	PWZm13cXBZUg6Aw8UH2ymmsQFLj2a+tkMMg3vEl0IkLgEhDteXMIrdaVAL+eBr96zohI5H2GQ+Mao
	+L9Bcssg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjx4A-00000003rZ5-2cl2;
	Mon, 17 Feb 2025 09:05:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjwxQ-00000003ph4-05RX
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 17 Feb 2025 08:58:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=muAXlG/uZk+Ut1w5NICM8ivKf832EJKGEf1Ht7zOCxs=; b=nMXWel0BRWsn7xT7OHPYhpGk2Q
	NYuLUtPU3ZipWsgjxk2H+m0UMa5ONe3Hck2aO8E+x36mGn3Rgqh1XjGhr17tGqa0hGGEYDuIR6dgi
	I8mj9ccP7Amp2RKKkAhSviht+XKLILd8QfdYwyap9k4iqhlPxDKjwan0+aefrLXEDI4Jpd5kww7X/
	CqRjc4OidCSvSFmuuxEojG7poEZDokRGzJ5yOfbCv+NKnH5C45X5Ystl6gAPfkfvTsQZh8uMtjKM2
	OJjDykajpq+KoaL4LC2swLCjGx7UF8mWg+NN6QAwBxeJjPmtlx9DJ0VksrUup2zdxi7Zi6WWFmmH4
	Xwbm71WA==;
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjwxM-00000001jne-3gPR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 08:58:26 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-220bfdfb3f4so85208575ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Feb 2025 00:58:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1739782702; x=1740387502; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=muAXlG/uZk+Ut1w5NICM8ivKf832EJKGEf1Ht7zOCxs=;
        b=ZZBGFXBW3vK5EmD1UULMcXJVWUypnlYmUsxp6eHTjTL9lZyvtGuNLl4Is8SP2iPvAm
         LR7jB4wBYUgg5FhaG140qXaoE6LB6ncS8Q8x9pDluCNLg3A4G5eBddp0sgXCYhBh8UA6
         Qt65CcRaRz6Wu9+Y03sLi+bslv+o/Rd0weCQml6Dr2iIR/E4ORh6Ca9lcDxQsCvzNGAM
         3THY6V4OJReSlVbsR6+PHl15m8a+aNGFIrgwVnsMK9RXbLUFQAXutv3pXYvR1haRiEUb
         uibHYjZ8r+kkaM39RRSIQazLGF3FNXUTosUXmDwDTKF1YQCftXDCUzY2RiTP4lrFGxzB
         v4Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739782702; x=1740387502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=muAXlG/uZk+Ut1w5NICM8ivKf832EJKGEf1Ht7zOCxs=;
        b=ROLUeBwZ6wGCl/rgNAZo3KoGIkcQOTjiwqYcg6L1c6wZ47Udqa3o70aNOL5oeQ50ix
         aMkuc3vo3K6i3yIfDiWrBt+MtFHLeyGl+K2ZnDJIceUksA7O0gByeJCrkwVnYN7ohldl
         bxnb4uAj1N4grJniHUC26g3quzogSdLP5ApX4B0D8m3gQuqUHlPKa1JXbzVDcaMyQz54
         WQjgEEPPkG27sRAJ0qTCrvyhDW6mvsxy+qdHff5yI9Uxpfv46QDl4Jn/vJXPY7Ms6kXd
         dkh+H5f12Gh6AiuhHmYNEjkPxd0g3N+CSc+8hePHFGI11zu/Gy/AzqIfTbn1+251EKYh
         FH6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUyKGs91x/dwMPcIRUATM4AxkeJEpwXKnXZN4+Ogn+KfaubMwXsXV/8jndZEZeuJc306LTr09MAPWoeuWriTqvh@lists.infradead.org
X-Gm-Message-State: AOJu0YzyYByMsjhEOW9m6iQNHLWrUZyPztkptXEBO53CZD5LuGAiCc8v
	VntaLSgwHPVW/tY8YmLCim+wCH4JeFLhWjBDtPYZ4TXZ/exLY1hYMLeMUteoh4o=
X-Gm-Gg: ASbGncuefv6Obxbg5iGGNis8jjX8BR3isgpNXWjA4GTe6D02YqGk5OLLWKBJKxHxSPZ
	QlRXTJSsGD6IEP1ffU8s/ruLWQ5cPzCof70x8pZNvaK9B/9PHeKmX+mGj/nDGYZKUymSZnAJ0ww
	UMmleSAWSExVl3Pa2DHOFgopihIs15N5wJQ0WlkKh7cPZy+PsLIEnRfohF9L1HydeUVFKJRZ5qq
	Yl7jENOLVV92vsBaSDfbse/aUmsZvG+B3Hwo4gh6VQx5c0ycUe7m6oghAht5Nt7HfJ42ADoTkfF
	tW0prUm0qZY9EjVtqPMWeW9c95Ut0gYttYqxMGaBQETRtw5BVPSKB/k=
X-Google-Smtp-Source: AGHT+IGeeSKqQaB04W0hYbcp5SOMBU/2KVamXBnyldtu8MmORMjRPb5xrOZF3XnR9hLS8Nh0YSNDYA==
X-Received: by 2002:a05:6a21:1693:b0:1ee:8099:e657 with SMTP id adf61e73a8af0-1ee8cbe7bb4mr16765666637.40.1739782702160;
        Mon, 17 Feb 2025 00:58:22 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([122.171.22.227])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73242546867sm7632018b3a.24.2025.02.17.00.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 00:58:21 -0800 (PST)
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
Subject: [PATCH v6 04/10] genirq: Introduce common irq_force_complete_move() implementation
Date: Mon, 17 Feb 2025 14:26:50 +0530
Message-ID: <20250217085657.789309-5-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250217085657.789309-1-apatel@ventanamicro.com>
References: <20250217085657.789309-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_085825_380195_2FA8916C 
X-CRM114-Status: GOOD (  37.96  )
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

The GENERIC_PENDING_IRQ requires an arch specific implementation of
irq_force_complete_move(). At the moment, only x86 implements this
but for RISC-V the irq_force_complete_move() is only needed when
RISC-V IMSIC driver is in use and not needed otherwise.

To address the above, introduce a common irq_force_complete_move()
implementation in kernel irq migration which lets irqchip do the
actual irq_force_complete_move() and also update x86 APIC to use
this common implementation.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/x86/kernel/apic/vector.c | 231 ++++++++++++++++------------------
 include/linux/irq.h           |   5 +-
 kernel/irq/internals.h        |   2 +
 kernel/irq/migration.c        |  10 ++
 4 files changed, 123 insertions(+), 125 deletions(-)

diff --git a/arch/x86/kernel/apic/vector.c b/arch/x86/kernel/apic/vector.c
index 736f62812f5c..72fa4bb78f0a 100644
--- a/arch/x86/kernel/apic/vector.c
+++ b/arch/x86/kernel/apic/vector.c
@@ -888,8 +888,109 @@ static int apic_set_affinity(struct irq_data *irqd,
 	return err ? err : IRQ_SET_MASK_OK;
 }
 
+static void free_moved_vector(struct apic_chip_data *apicd)
+{
+	unsigned int vector = apicd->prev_vector;
+	unsigned int cpu = apicd->prev_cpu;
+	bool managed = apicd->is_managed;
+
+	/*
+	 * Managed interrupts are usually not migrated away
+	 * from an online CPU, but CPU isolation 'managed_irq'
+	 * can make that happen.
+	 * 1) Activation does not take the isolation into account
+	 *    to keep the code simple
+	 * 2) Migration away from an isolated CPU can happen when
+	 *    a non-isolated CPU which is in the calculated
+	 *    affinity mask comes online.
+	 */
+	trace_vector_free_moved(apicd->irq, cpu, vector, managed);
+	irq_matrix_free(vector_matrix, cpu, vector, managed);
+	per_cpu(vector_irq, cpu)[vector] = VECTOR_UNUSED;
+	hlist_del_init(&apicd->clist);
+	apicd->prev_vector = 0;
+	apicd->move_in_progress = 0;
+}
+
+/*
+ * Called from fixup_irqs() with @desc->lock held and interrupts disabled.
+ */
+static void apic_force_complete_move(struct irq_data *irqd)
+{
+	unsigned int cpu = smp_processor_id();
+	struct apic_chip_data *apicd;
+	unsigned int vector;
+
+	guard(raw_spinlock)(&vector_lock);
+	apicd = apic_chip_data(irqd);
+	if (!apicd)
+		return;
+
+	/*
+	 * If prev_vector is empty or the descriptor is neither currently
+	 * nor previously on the outgoing CPU no action required.
+	 */
+	vector = apicd->prev_vector;
+	if (!vector || (apicd->cpu != cpu && apicd->prev_cpu != cpu))
+		return;
+
+	/*
+	 * This is tricky. If the cleanup of the old vector has not been
+	 * done yet, then the following setaffinity call will fail with
+	 * -EBUSY. This can leave the interrupt in a stale state.
+	 *
+	 * All CPUs are stuck in stop machine with interrupts disabled so
+	 * calling __irq_complete_move() would be completely pointless.
+	 *
+	 * 1) The interrupt is in move_in_progress state. That means that we
+	 *    have not seen an interrupt since the io_apic was reprogrammed to
+	 *    the new vector.
+	 *
+	 * 2) The interrupt has fired on the new vector, but the cleanup IPIs
+	 *    have not been processed yet.
+	 */
+	if (apicd->move_in_progress) {
+		/*
+		 * In theory there is a race:
+		 *
+		 * set_ioapic(new_vector) <-- Interrupt is raised before update
+		 *			      is effective, i.e. it's raised on
+		 *			      the old vector.
+		 *
+		 * So if the target cpu cannot handle that interrupt before
+		 * the old vector is cleaned up, we get a spurious interrupt
+		 * and in the worst case the ioapic irq line becomes stale.
+		 *
+		 * But in case of cpu hotplug this should be a non issue
+		 * because if the affinity update happens right before all
+		 * cpus rendezvous in stop machine, there is no way that the
+		 * interrupt can be blocked on the target cpu because all cpus
+		 * loops first with interrupts enabled in stop machine, so the
+		 * old vector is not yet cleaned up when the interrupt fires.
+		 *
+		 * So the only way to run into this issue is if the delivery
+		 * of the interrupt on the apic/system bus would be delayed
+		 * beyond the point where the target cpu disables interrupts
+		 * in stop machine. I doubt that it can happen, but at least
+		 * there is a theoretical chance. Virtualization might be
+		 * able to expose this, but AFAICT the IOAPIC emulation is not
+		 * as stupid as the real hardware.
+		 *
+		 * Anyway, there is nothing we can do about that at this point
+		 * w/o refactoring the whole fixup_irq() business completely.
+		 * We print at least the irq number and the old vector number,
+		 * so we have the necessary information when a problem in that
+		 * area arises.
+		 */
+		pr_warn("IRQ fixup: irq %d move in progress, old vector %d\n",
+			irqd->irq, vector);
+	}
+	free_moved_vector(apicd);
+}
+
 #else
-# define apic_set_affinity	NULL
+# define apic_set_affinity		NULL
+# define apic_force_complete_move	NULL
 #endif
 
 static int apic_retrigger_irq(struct irq_data *irqd)
@@ -923,39 +1024,16 @@ static void x86_vector_msi_compose_msg(struct irq_data *data,
 }
 
 static struct irq_chip lapic_controller = {
-	.name			= "APIC",
-	.irq_ack		= apic_ack_edge,
-	.irq_set_affinity	= apic_set_affinity,
-	.irq_compose_msi_msg	= x86_vector_msi_compose_msg,
-	.irq_retrigger		= apic_retrigger_irq,
+	.name				= "APIC",
+	.irq_ack			= apic_ack_edge,
+	.irq_set_affinity		= apic_set_affinity,
+	.irq_compose_msi_msg		= x86_vector_msi_compose_msg,
+	.irq_force_complete_move	= apic_force_complete_move,
+	.irq_retrigger			= apic_retrigger_irq,
 };
 
 #ifdef CONFIG_SMP
 
-static void free_moved_vector(struct apic_chip_data *apicd)
-{
-	unsigned int vector = apicd->prev_vector;
-	unsigned int cpu = apicd->prev_cpu;
-	bool managed = apicd->is_managed;
-
-	/*
-	 * Managed interrupts are usually not migrated away
-	 * from an online CPU, but CPU isolation 'managed_irq'
-	 * can make that happen.
-	 * 1) Activation does not take the isolation into account
-	 *    to keep the code simple
-	 * 2) Migration away from an isolated CPU can happen when
-	 *    a non-isolated CPU which is in the calculated
-	 *    affinity mask comes online.
-	 */
-	trace_vector_free_moved(apicd->irq, cpu, vector, managed);
-	irq_matrix_free(vector_matrix, cpu, vector, managed);
-	per_cpu(vector_irq, cpu)[vector] = VECTOR_UNUSED;
-	hlist_del_init(&apicd->clist);
-	apicd->prev_vector = 0;
-	apicd->move_in_progress = 0;
-}
-
 static void __vector_cleanup(struct vector_cleanup *cl, bool check_irr)
 {
 	struct apic_chip_data *apicd;
@@ -1068,99 +1146,6 @@ void irq_complete_move(struct irq_cfg *cfg)
 		__vector_schedule_cleanup(apicd);
 }
 
-/*
- * Called from fixup_irqs() with @desc->lock held and interrupts disabled.
- */
-void irq_force_complete_move(struct irq_desc *desc)
-{
-	unsigned int cpu = smp_processor_id();
-	struct apic_chip_data *apicd;
-	struct irq_data *irqd;
-	unsigned int vector;
-
-	/*
-	 * The function is called for all descriptors regardless of which
-	 * irqdomain they belong to. For example if an IRQ is provided by
-	 * an irq_chip as part of a GPIO driver, the chip data for that
-	 * descriptor is specific to the irq_chip in question.
-	 *
-	 * Check first that the chip_data is what we expect
-	 * (apic_chip_data) before touching it any further.
-	 */
-	irqd = irq_domain_get_irq_data(x86_vector_domain,
-				       irq_desc_get_irq(desc));
-	if (!irqd)
-		return;
-
-	raw_spin_lock(&vector_lock);
-	apicd = apic_chip_data(irqd);
-	if (!apicd)
-		goto unlock;
-
-	/*
-	 * If prev_vector is empty or the descriptor is neither currently
-	 * nor previously on the outgoing CPU no action required.
-	 */
-	vector = apicd->prev_vector;
-	if (!vector || (apicd->cpu != cpu && apicd->prev_cpu != cpu))
-		goto unlock;
-
-	/*
-	 * This is tricky. If the cleanup of the old vector has not been
-	 * done yet, then the following setaffinity call will fail with
-	 * -EBUSY. This can leave the interrupt in a stale state.
-	 *
-	 * All CPUs are stuck in stop machine with interrupts disabled so
-	 * calling __irq_complete_move() would be completely pointless.
-	 *
-	 * 1) The interrupt is in move_in_progress state. That means that we
-	 *    have not seen an interrupt since the io_apic was reprogrammed to
-	 *    the new vector.
-	 *
-	 * 2) The interrupt has fired on the new vector, but the cleanup IPIs
-	 *    have not been processed yet.
-	 */
-	if (apicd->move_in_progress) {
-		/*
-		 * In theory there is a race:
-		 *
-		 * set_ioapic(new_vector) <-- Interrupt is raised before update
-		 *			      is effective, i.e. it's raised on
-		 *			      the old vector.
-		 *
-		 * So if the target cpu cannot handle that interrupt before
-		 * the old vector is cleaned up, we get a spurious interrupt
-		 * and in the worst case the ioapic irq line becomes stale.
-		 *
-		 * But in case of cpu hotplug this should be a non issue
-		 * because if the affinity update happens right before all
-		 * cpus rendezvous in stop machine, there is no way that the
-		 * interrupt can be blocked on the target cpu because all cpus
-		 * loops first with interrupts enabled in stop machine, so the
-		 * old vector is not yet cleaned up when the interrupt fires.
-		 *
-		 * So the only way to run into this issue is if the delivery
-		 * of the interrupt on the apic/system bus would be delayed
-		 * beyond the point where the target cpu disables interrupts
-		 * in stop machine. I doubt that it can happen, but at least
-		 * there is a theoretical chance. Virtualization might be
-		 * able to expose this, but AFAICT the IOAPIC emulation is not
-		 * as stupid as the real hardware.
-		 *
-		 * Anyway, there is nothing we can do about that at this point
-		 * w/o refactoring the whole fixup_irq() business completely.
-		 * We print at least the irq number and the old vector number,
-		 * so we have the necessary information when a problem in that
-		 * area arises.
-		 */
-		pr_warn("IRQ fixup: irq %d move in progress, old vector %d\n",
-			irqd->irq, vector);
-	}
-	free_moved_vector(apicd);
-unlock:
-	raw_spin_unlock(&vector_lock);
-}
-
 #ifdef CONFIG_HOTPLUG_CPU
 /*
  * Note, this is not accurate accounting, but at least good enough to
diff --git a/include/linux/irq.h b/include/linux/irq.h
index 8daa17f0107a..56f6583093d2 100644
--- a/include/linux/irq.h
+++ b/include/linux/irq.h
@@ -486,6 +486,7 @@ static inline irq_hw_number_t irqd_to_hwirq(struct irq_data *d)
  * @ipi_send_mask:	send an IPI to destination cpus in cpumask
  * @irq_nmi_setup:	function called from core code before enabling an NMI
  * @irq_nmi_teardown:	function called from core code after disabling an NMI
+ * @irq_force_complete_move:	optional function to force complete pending irq move
  * @flags:		chip specific flags
  */
 struct irq_chip {
@@ -537,6 +538,8 @@ struct irq_chip {
 	int		(*irq_nmi_setup)(struct irq_data *data);
 	void		(*irq_nmi_teardown)(struct irq_data *data);
 
+	void		(*irq_force_complete_move)(struct irq_data *data);
+
 	unsigned long	flags;
 };
 
@@ -619,11 +622,9 @@ static inline void irq_move_irq(struct irq_data *data)
 		__irq_move_irq(data);
 }
 void irq_move_masked_irq(struct irq_data *data);
-void irq_force_complete_move(struct irq_desc *desc);
 #else
 static inline void irq_move_irq(struct irq_data *data) { }
 static inline void irq_move_masked_irq(struct irq_data *data) { }
-static inline void irq_force_complete_move(struct irq_desc *desc) { }
 #endif
 
 extern int no_irq_affinity;
diff --git a/kernel/irq/internals.h b/kernel/irq/internals.h
index a979523640d0..d4e190e690bd 100644
--- a/kernel/irq/internals.h
+++ b/kernel/irq/internals.h
@@ -442,6 +442,7 @@ static inline struct cpumask *irq_desc_get_pending_mask(struct irq_desc *desc)
 	return desc->pending_mask;
 }
 bool irq_fixup_move_pending(struct irq_desc *desc, bool force_clear);
+void irq_force_complete_move(struct irq_desc *desc);
 #else /* CONFIG_GENERIC_PENDING_IRQ */
 static inline bool irq_can_move_pcntxt(struct irq_data *data)
 {
@@ -467,6 +468,7 @@ static inline bool irq_fixup_move_pending(struct irq_desc *desc, bool fclear)
 {
 	return false;
 }
+static inline void irq_force_complete_move(struct irq_desc *desc) { }
 #endif /* !CONFIG_GENERIC_PENDING_IRQ */
 
 #if !defined(CONFIG_IRQ_DOMAIN) || !defined(CONFIG_IRQ_DOMAIN_HIERARCHY)
diff --git a/kernel/irq/migration.c b/kernel/irq/migration.c
index eb150afd671f..e110300ad650 100644
--- a/kernel/irq/migration.c
+++ b/kernel/irq/migration.c
@@ -35,6 +35,16 @@ bool irq_fixup_move_pending(struct irq_desc *desc, bool force_clear)
 	return true;
 }
 
+void irq_force_complete_move(struct irq_desc *desc)
+{
+	for (struct irq_data *d = irq_desc_get_irq_data(desc); d; d = d->parent_data) {
+		if (d->chip && d->chip->irq_force_complete_move) {
+			d->chip->irq_force_complete_move(d);
+			return;
+		}
+	}
+}
+
 void irq_move_masked_irq(struct irq_data *idata)
 {
 	struct irq_desc *desc = irq_data_to_desc(idata);
-- 
2.43.0


