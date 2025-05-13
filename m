Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73AADC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 16:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wA8/oWFm8euKCjeKQigsS3cio9FadLZHVS2v0RBA68E=; b=m73iOszSqt9kZ+2fkif8L1obzS
	C8H/t11EzH19i8klTw0l34ahdW5W/K39TNRtaCIbGlKm8wZ0c8Ncb8s34XfNpqNx9c1+tceuasdpK
	M6cXLFmDLkT2aAaKoyhEZK7bnd4gVEGNbf8Z7Mh9g2+n41ri1jpNQIRO7ki56eCO1mMVrDweAWJz/
	fetnjFSDt90nEl9V1WULs4zUyU3z/skL0MAkXwrShBlonWDgmYm4kSHvvZN9D6PP56p/Uu7m3OhOg
	VX4NygKHCCqGT/LjXBAsm0r7j9sXyosohQm+k0KnL0Ut5mfbpze/Q45J8XqHBCCX/z2UlTp7z30QQ
	7i7NoRvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEsk4-0000000CysT-2poB;
	Tue, 13 May 2025 16:44:32 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEsXp-0000000Cvul-0QV7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 16:31:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6889AA4DA2D;
	Tue, 13 May 2025 16:31:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A6E2C4CEF1;
	Tue, 13 May 2025 16:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747153912;
	bh=EnmoQWrnaV1Hvaf1udlclzJvTLDhJHEEja5GIK61C/I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fFJsX6TdE3Ukgp937aSEcaY4ZWy0xuVyFyqU4fCsA7l/5mg80Bcgltlp6srb+BIvc
	 oLY4Nfhbph0bTJLDcF5Z0YHuARDg37/CAdJP4OVcQwX98d4dy2El7jfD2Tfaxlw7w/
	 7MjFLMikWTE2e2W4uJ/CWkWoWfmXRVVfeL5Johj00F9an59BGiCYqYZVOL14m725JF
	 NQqb7r4m6hPnICEGTgrCdTkECOM7NBiMKt/BSxyFRtsNyCQR7Q/tJCxjg65/2uHM/W
	 MptUIh7cpv2DuWbDCSje9Jrm1b4L+/xrjHHTodi+upO20fzVpUY+GFLfycsZn8lkV4
	 q3AzgMyWNoRVQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uEsXm-00EaLc-65;
	Tue, 13 May 2025 17:31:50 +0100
From: Marc Zyngier <maz@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Timothy Hayes <timothy.hayes@arm.com>
Subject: [PATCH v2 2/5] irqchip/gic-v3-its: Implement .msi_teardown() callback
Date: Tue, 13 May 2025 17:31:41 +0100
Message-Id: <20250513163144.2215824-3-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250513163144.2215824-1-maz@kernel.org>
References: <20250513163144.2215824-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, tglx@linutronix.de, lpieralisi@kernel.org, sascha.bischoff@arm.com, timothy.hayes@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_093153_284488_32279A79 
X-CRM114-Status: GOOD (  25.38  )
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

The ITS driver currently nukes the structure representing
an endpoint device translating via an ITS on freeing the last LPI
allocated for it.

That's an unfortunate state of affair, as it is pretty common for
a driver to allocate a single MSI, do something clever, teardown
this MSI, and reallocate a whole bunch of them. The nvme driver
does exactly that, amongst others.

What happens in that case is that the core code is buggy enough
to issue another .msi_prepare() call, even if it shouldn't.
This luckily cancels the above behaviour and hides the problem.

In order to fix the core code, start by implementing the new
.msi_teardown() callback. Nothing calls it yet, so a side effect
is that the its_dev structure will not be freed and that the DID
will stay mapped. Not a big deal, and this will be solved in
following patches.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/irqchip/irq-gic-v3-its-msi-parent.c | 10 +++++
 drivers/irqchip/irq-gic-v3-its.c            | 46 +++++++++++----------
 kernel/irq/msi.c                            |  3 +-
 3 files changed, 36 insertions(+), 23 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v3-its-msi-parent.c b/drivers/irqchip/irq-gic-v3-its-msi-parent.c
index 68f9ba4085ce5..958736622fa57 100644
--- a/drivers/irqchip/irq-gic-v3-its-msi-parent.c
+++ b/drivers/irqchip/irq-gic-v3-its-msi-parent.c
@@ -167,6 +167,14 @@ static int its_pmsi_prepare(struct irq_domain *domain, struct device *dev,
 					  dev, nvec, info);
 }
 
+static void its_msi_teardown(struct irq_domain *domain, msi_alloc_info_t *info)
+{
+	struct msi_domain_info *msi_info;
+
+	msi_info = msi_get_domain_info(domain->parent);
+	msi_info->ops->msi_teardown(domain->parent, info);
+}
+
 static bool its_init_dev_msi_info(struct device *dev, struct irq_domain *domain,
 				  struct irq_domain *real_parent, struct msi_domain_info *info)
 {
@@ -190,6 +198,7 @@ static bool its_init_dev_msi_info(struct device *dev, struct irq_domain *domain,
 		 * %MSI_MAX_INDEX.
 		 */
 		info->ops->msi_prepare = its_pci_msi_prepare;
+		info->ops->msi_teardown = its_msi_teardown;
 		break;
 	case DOMAIN_BUS_DEVICE_MSI:
 	case DOMAIN_BUS_WIRED_TO_MSI:
@@ -198,6 +207,7 @@ static bool its_init_dev_msi_info(struct device *dev, struct irq_domain *domain,
 		 * size is also known at domain creation time.
 		 */
 		info->ops->msi_prepare = its_pmsi_prepare;
+		info->ops->msi_teardown = its_msi_teardown;
 		break;
 	default:
 		/* Confused. How did the lib return true? */
diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index fd6e7c170d37e..a77f11e23ad6c 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -3620,8 +3620,33 @@ static int its_msi_prepare(struct irq_domain *domain, struct device *dev,
 	return err;
 }
 
+static void its_msi_teardown(struct irq_domain *domain, msi_alloc_info_t *info)
+{
+	struct its_device *its_dev = info->scratchpad[0].ptr;
+
+	guard(mutex)(&its_dev->its->dev_alloc_lock);
+
+	/* If the device is shared, keep everything around */
+	if (its_dev->shared)
+		return;
+
+	/* LPIs should have been already unmapped at this stage */
+	if (WARN_ON_ONCE(!bitmap_empty(its_dev->event_map.lpi_map,
+				       its_dev->event_map.nr_lpis)))
+		return;
+
+	its_lpi_free(its_dev->event_map.lpi_map,
+		     its_dev->event_map.lpi_base,
+		     its_dev->event_map.nr_lpis);
+
+	/* Unmap device/itt, and get rid of the tracking */
+	its_send_mapd(its_dev, 0);
+	its_free_device(its_dev);
+}
+
 static struct msi_domain_ops its_msi_domain_ops = {
 	.msi_prepare	= its_msi_prepare,
+	.msi_teardown	= its_msi_teardown,
 };
 
 static int its_irq_gic_domain_alloc(struct irq_domain *domain,
@@ -3722,7 +3747,6 @@ static void its_irq_domain_free(struct irq_domain *domain, unsigned int virq,
 {
 	struct irq_data *d = irq_domain_get_irq_data(domain, virq);
 	struct its_device *its_dev = irq_data_get_irq_chip_data(d);
-	struct its_node *its = its_dev->its;
 	int i;
 
 	bitmap_release_region(its_dev->event_map.lpi_map,
@@ -3736,26 +3760,6 @@ static void its_irq_domain_free(struct irq_domain *domain, unsigned int virq,
 		irq_domain_reset_irq_data(data);
 	}
 
-	mutex_lock(&its->dev_alloc_lock);
-
-	/*
-	 * If all interrupts have been freed, start mopping the
-	 * floor. This is conditioned on the device not being shared.
-	 */
-	if (!its_dev->shared &&
-	    bitmap_empty(its_dev->event_map.lpi_map,
-			 its_dev->event_map.nr_lpis)) {
-		its_lpi_free(its_dev->event_map.lpi_map,
-			     its_dev->event_map.lpi_base,
-			     its_dev->event_map.nr_lpis);
-
-		/* Unmap device/itt */
-		its_send_mapd(its_dev, 0);
-		its_free_device(its_dev);
-	}
-
-	mutex_unlock(&its->dev_alloc_lock);
-
 	irq_domain_free_irqs_parent(domain, virq, nr_irqs);
 }
 
diff --git a/kernel/irq/msi.c b/kernel/irq/msi.c
index a3b34c3c599be..31378a2535fb9 100644
--- a/kernel/irq/msi.c
+++ b/kernel/irq/msi.c
@@ -795,8 +795,7 @@ static int msi_domain_ops_prepare(struct irq_domain *domain, struct device *dev,
 	return 0;
 }
 
-static void msi_domain_ops_teardown(struct irq_domain *domain,
-				    msi_alloc_info_t *arg)
+static void msi_domain_ops_teardown(struct irq_domain *domain, msi_alloc_info_t *arg)
 {
 }
 
-- 
2.39.2


