Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49E40E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Dec 2024 15:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DPiL+4+uUrxsUPNFNe0qcu/2Buvw2EBCmaBEkU4Ga+k=; b=2RnznLOR3rMyJt8wtuQ2cwjLqE
	4UyExCfsuddNuHTIpaiVS+OXwSYASySAZsErEOPoY0ONarBzzpCzcM9RaYLHCQ5myUcTBt1XMHA2G
	gfGcON5EO9NupAXNaCSr7NrTiq+HyVS7ixB50L70NmHip2oBns805ECu9lFUIXBfNxqrkZj+VSk7r
	/1ckMp6sXV+AdmG8Dfms+M/GM/YfcnU38uIEVx/OVxk/vnYMmYw4sg6WnoU6PAdirVabgBTyZ4ZOG
	C+fKOld8U83EEZzHcLW3NPzdtNIu+AD2rkpEYGEEuFNz0ZHRTaWNhbPbvmghsE5NM6aHzmhZ4QrQR
	VVeTV0KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKIua-00000005QWS-1GuJ;
	Sun, 08 Dec 2024 15:09:32 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKIsb-00000005Q51-08ab
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Dec 2024 15:07:30 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-21634338cfdso8868325ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Dec 2024 07:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1733670448; x=1734275248; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DPiL+4+uUrxsUPNFNe0qcu/2Buvw2EBCmaBEkU4Ga+k=;
        b=czm/e5o3GwrIWk9vvk3bUgZlbd6rGHjSDPxY8xKaZIR0+8QvpRWT952pq7/l4C5ZSE
         uVje1xffP+IVcxMmIqa+s0udULVHkdPeiVqCV4/c4+CoZXIXh42mjmp7BpNk6rdd7ZIu
         lz4VOO6KIM7nGn/wt16DGbAfHlH/li81P+uBdkNlUuWRdfsIZwvBz1aEmysZBD4oeZZ1
         ZmhTAZaL77O5mGpsi7rUB4a+a5OL/cQGEXo5Xc0nWaAJy9bfWw/ttq2kOlXBiP9C+/Dn
         eJNS2Ehd7o/udFJK7SyiOVq8wpkUcBTHLQBJ8BbvthzgLV6jgxZOU2lsIDtQQi0YLUPe
         6qlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733670448; x=1734275248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DPiL+4+uUrxsUPNFNe0qcu/2Buvw2EBCmaBEkU4Ga+k=;
        b=Z2lMOAQ2piwz5M5pnwmqYeooCqzZyjO49xGghjbSWDlaJhwEgI3jMxY6pszxlVkrjD
         LuXz0dE6g0AV1KomgSHvACyhbr3e0s2b6BVRSFBIW7GOBNuXWvWzqtK2Yo88u1exFM1B
         +tQuUllsQqn1wXsQW0i//Pn04dBToHrc6LcZF4hU2Wzf/uuxgVFSS0OMPlkZqA2getV/
         ZS6+IWECmCih7/Jq56JoSzEQ9sIuuCCdTeWURAhbOZcMnS/FxCIMjwvi6cfB/unNtiMJ
         BXIO25EDVSECqxatFrsbHzlhUHewphgG9LU7xzdlWHAx4ker2Oe6i5lnBjST0gUJtUEI
         0qeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyHP3VAXfcCdYbX5BQ7uLEFEgcIoSeUDwp1voKGE70hskBCAh2LhYvwVYtNAnDUr0lFNJNjFXJZgBdXYT1d3io@lists.infradead.org
X-Gm-Message-State: AOJu0YzbJ2EoZe/pLv08v7gdpa/nzpWfpyXyR9iD5W9Rs7ZSNObC4UEK
	Smuw9Hz1shNBnyhNxXkNQmDDLoTLvOMG2xxzMimM6Q1jaTBRS0ykl/Wo7FndXhg=
X-Gm-Gg: ASbGnctL81IIDzoWeMmqqwYrLac2GBSUJS/JYrCItZSXwW5uFku+aOJopE3wcJdwcI/
	C6R6ggf+1GJiPcq4a9qELrZzeLhfaaE+5Yt8k2va0lKRMDXYf3oR0zKqcJbr++kFYmQBP+69HdE
	0ZlCteLN7JQAJEPaVtqHXcNlJGqMs7nYqz0HJfIirw74O53IlPawSGN4fWGeMdlVjoURcAMskQU
	4xhH2fnyYQiyOQb7hsCA+NcsUI9OUCufAzEImeoFrHoz2iBDVH8PwVWCoVQo+yh2eTWR9L/LKB+
	MYirh5N0OPwkqDM=
X-Google-Smtp-Source: AGHT+IGeMHvOT6RCYMvwhhYpeZ8b5RyMdQq1g0U5HspyszP4RDGsvXBxsgKTLdGXoqrj8jvGvqY46w==
X-Received: by 2002:a17:902:ec90:b0:215:b5d6:5fa8 with SMTP id d9443c01a7336-21614d98c11mr163726535ad.22.1733670448046;
        Sun, 08 Dec 2024 07:07:28 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([223.185.130.223])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-216412293d2sm10274515ad.237.2024.12.08.07.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 07:07:27 -0800 (PST)
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
Subject: [PATCH 1/4] irqchip/riscv-imsic: Handle non-atomic MSI updates for device
Date: Sun,  8 Dec 2024 20:37:08 +0530
Message-ID: <20241208150711.297624-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241208150711.297624-1-apatel@ventanamicro.com>
References: <20241208150711.297624-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_070729_102034_5469E30F 
X-CRM114-Status: GOOD (  18.81  )
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

Device having non-atomic MSI update might see an intermediate
state when changing target IMSIC vector from one CPU to another.

To handle such intermediate device state, update MSI address
and MSI data through separate MSI writes to the device.

Fixes: 027e125acdba ("irqchip/riscv-imsic: Add device MSI domain support for platform devices")
Suggested-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/irqchip/irq-riscv-imsic-platform.c | 27 ++++++++++++++++++++++
 drivers/irqchip/irq-riscv-imsic-state.c    | 27 +++++++++++++++++++---
 2 files changed, 51 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-imsic-platform.c b/drivers/irqchip/irq-riscv-imsic-platform.c
index c708780e8760..707c7ccb4d08 100644
--- a/drivers/irqchip/irq-riscv-imsic-platform.c
+++ b/drivers/irqchip/irq-riscv-imsic-platform.c
@@ -97,6 +97,7 @@ static int imsic_irq_set_affinity(struct irq_data *d, const struct cpumask *mask
 {
 	struct imsic_vector *old_vec, *new_vec;
 	struct irq_data *pd = d->parent_data;
+	struct imsic_vector tmp_vec;
 
 	old_vec = irq_data_get_irq_chip_data(pd);
 	if (WARN_ON(!old_vec))
@@ -110,11 +111,37 @@ static int imsic_irq_set_affinity(struct irq_data *d, const struct cpumask *mask
 	if (imsic_vector_get_move(old_vec))
 		return -EBUSY;
 
+	/*
+	 * Device having non-atomic MSI update might see an intermediate
+	 * state when changing target IMSIC vector from one CPU to another.
+	 *
+	 * To avoid losing interrupt to some intermediate state, do the
+	 * following (just like x86 APIC):
+	 *
+	 * 1) First write a temporary IMSIC vector to the device which
+	 * has MSI address same as the old IMSIC vector but MSI data
+	 * matches the new IMSIC vector.
+	 *
+	 * 2) Next write the new IMSIC vector to the device.
+	 *
+	 * Based on the above, the __imsic_local_sync() must check both
+	 * old MSI data and new MSI data on the old CPU for pending
+	 */
+
 	/* Get a new vector on the desired set of CPUs */
 	new_vec = imsic_vector_alloc(old_vec->hwirq, mask_val);
 	if (!new_vec)
 		return -ENOSPC;
 
+	if (new_vec->local_id != old_vec->local_id) {
+		/* Setup temporary vector */
+		tmp_vec.cpu = old_vec->cpu;
+		tmp_vec.local_id = new_vec->local_id;
+
+		/* Point device to the temporary vector */
+		imsic_msi_update_msg(d, &tmp_vec);
+	}
+
 	/* Point device to the new vector */
 	imsic_msi_update_msg(d, new_vec);
 
diff --git a/drivers/irqchip/irq-riscv-imsic-state.c b/drivers/irqchip/irq-riscv-imsic-state.c
index b97e6cd89ed7..230b917136e6 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.c
+++ b/drivers/irqchip/irq-riscv-imsic-state.c
@@ -126,8 +126,8 @@ void __imsic_eix_update(unsigned long base_id, unsigned long num_id, bool pend,
 
 static void __imsic_local_sync(struct imsic_local_priv *lpriv)
 {
-	struct imsic_local_config *mlocal;
-	struct imsic_vector *vec, *mvec;
+	struct imsic_local_config *tlocal, *mlocal;
+	struct imsic_vector *vec, *tvec, *mvec;
 	int i;
 
 	lockdep_assert_held(&lpriv->lock);
@@ -151,7 +151,28 @@ static void __imsic_local_sync(struct imsic_local_priv *lpriv)
 		mvec = READ_ONCE(vec->move);
 		WRITE_ONCE(vec->move, NULL);
 		if (mvec && mvec != vec) {
-			if (__imsic_id_read_clear_pending(i)) {
+			/*
+			 * Device having non-atomic MSI update might see an
+			 * intermediate state so check both old ID and new ID
+			 * for pending interrupts.
+			 *
+			 * For details, refer imsic_irq_set_affinity().
+			 */
+
+			tvec = vec->local_id == mvec->local_id ?
+			       NULL : &lpriv->vectors[mvec->local_id];
+			if (tvec && __imsic_id_read_clear_pending(tvec->local_id)) {
+				/* Retrigger temporary vector if it was already in-use */
+				if (READ_ONCE(tvec->enable)) {
+					tlocal = per_cpu_ptr(imsic->global.local, tvec->cpu);
+					writel_relaxed(tvec->local_id, tlocal->msi_va);
+				}
+
+				mlocal = per_cpu_ptr(imsic->global.local, mvec->cpu);
+				writel_relaxed(mvec->local_id, mlocal->msi_va);
+			}
+
+			if (__imsic_id_read_clear_pending(vec->local_id)) {
 				mlocal = per_cpu_ptr(imsic->global.local, mvec->cpu);
 				writel_relaxed(mvec->local_id, mlocal->msi_va);
 			}
-- 
2.43.0


