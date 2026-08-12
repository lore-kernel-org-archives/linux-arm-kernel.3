Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C8A0C5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 09:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xWgwrJeQwM87bLzVkHyeUPqK874plAM7uWk/D/Ey/lw=; b=yKnhIzerPIKFN8bP+TfLsHvXNP
	XJJnB1EEQyc9jrrSLzxid4OsdgvnT1AUDOSqnsJ/csvwdHxwQUqvbAE8rN3hdXw/Utdt+COjbLsWa
	Csn5XbmNY86alHmQO6GC3RFo9hyuk/emcqH57rXzn9WUId+ie8DS/ZX1SUMo7nHeVbWaZO5Aj70Bi
	FusPV3Hvywcvf9Hk0NmR3WCJDSSVvpg8pBpGDTrErJ+dsY6Of4F7fBRu5y2C2triVpDlWSfKgvKqc
	tidxoPQAz2jfOlbCOxtXZHVBUp17XjKdiYC/Xo9ug14itdKI5A6bAZTTXcG5is+qnNMnCfyElzXE1
	6yt059EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu4zN-0000000FhV8-2UiP;
	Wed, 12 Aug 2026 09:11:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu4zJ-0000000FhTU-36CF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 09:11:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 017436187E;
	Wed, 12 Aug 2026 09:11:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 707FD1F000E9;
	Wed, 12 Aug 2026 09:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786525864;
	bh=xWgwrJeQwM87bLzVkHyeUPqK874plAM7uWk/D/Ey/lw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=JkWFy7LQgQ7KbUGbSf4woplA1Kb4UiLrTb0KVmFLdnjfgEwCaDSm1OuzloOlXHhF3
	 8Wg0rOcbYhpM9UrL2ra26GUD5uS+3SZxOas2k8DkkjHlIu9SiugmxSk8Q1duRv9g4/
	 mBC8LCkm4v94YNzFs8HHF18/Uri93Aiix0B+osVQcbC+WaU/TY0VNaCl7JWGyBVz/h
	 ImIEnczQYOs1JH8+Ys3XFkvqZ1tnkxUOMVCtIGdnhUU6XgItbtk+sTLEuXivt0kFn6
	 EIEiU1k0+HUzaoXQpaEk3Ali1XoI5qV+ucAwu0RqkVWvaZ3GRTgLDvdNaRSMH4BTru
	 g47IZGzG5AcWA==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Wed, 12 Aug 2026 11:10:31 +0200
Subject: [PATCH 3/7] irqchip/gic-v5: Disable IRSes on probe failures
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-gicv5-7-2-fixes-v1-3-3743e82c69a4@kernel.org>
References: <20260812-gicv5-7-2-fixes-v1-0-3743e82c69a4@kernel.org>
In-Reply-To: <20260812-gicv5-7-2-fixes-v1-0-3743e82c69a4@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Jonathan Cameron <jic23@kernel.org>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
 Sascha Bischoff <sascha.bischoff@arm.com>, 
 Timothy Hayes <timothy.hayes@arm.com>
Cc: Sascha Bischoff <Sascha.Bischoff@arm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>
X-Mailer: b4 0.15.2
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

GICv5 driver probe failures cause IRSes initialized by the kernel to be
unmapped and their data structures to be destroyed but the current driver
leaves the probed IRSes enabled, whereas they should be disabled.

Disable IRSes on driver probe failures so that the IRSes are brought back
to their quiescent HW state.

Fixes: 5cb1b6dab2de ("irqchip/gic-v5: Add GICv5 IRS/SPI support")
Fixes: 35866efa52fe ("irqchip/gic-v5: Add ACPI IRS probing")
Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>
Link: https://sashiko.dev/#/message/20260810104747.E5CE71F000E9%40smtp.kernel.org
---
 drivers/irqchip/irq-gic-v5-irs.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/irqchip/irq-gic-v5-irs.c b/drivers/irqchip/irq-gic-v5-irs.c
index 0bd9ae9ae12e..9d25ce8bfd8c 100644
--- a/drivers/irqchip/irq-gic-v5-irs.c
+++ b/drivers/irqchip/irq-gic-v5-irs.c
@@ -488,6 +488,12 @@ static int gicv5_irs_wait_for_idle(struct gicv5_irs_chip_data *irs_data)
 					GICV5_IRS_CR0_IDLE, NULL);
 }
 
+static void __init gicv5_irs_disable(struct gicv5_irs_chip_data *irs_data)
+{
+	irs_writel_relaxed(irs_data, 0, GICV5_IRS_CR0);
+	gicv5_irs_wait_for_idle(irs_data);
+}
+
 void gicv5_irs_syncr(void)
 {
 	struct gicv5_irs_chip_data *irs_data;
@@ -786,6 +792,7 @@ static int __init gicv5_irs_of_init(struct device_node *node)
 
 out_iomem:
 	gicv5_irs_clear_affinity(irs_data);
+	gicv5_irs_disable(irs_data);
 	iounmap(irs_base);
 out_err:
 	kfree(irs_data);
@@ -801,6 +808,7 @@ void __init gicv5_irs_remove(void)
 
 	list_for_each_entry_safe(irs_data, tmp_data, &irs_nodes, entry) {
 		gicv5_irs_clear_affinity(irs_data);
+		gicv5_irs_disable(irs_data);
 		iounmap(irs_data->irs_base);
 		list_del(&irs_data->entry);
 		kfree(irs_data);
@@ -968,6 +976,7 @@ static int __init gic_acpi_parse_madt_irs(union acpi_subtable_headers *header,
 
 out_map:
 	gicv5_irs_clear_affinity(irs_data);
+	gicv5_irs_disable(irs_data);
 	iounmap(irs_base);
 out_release:
 	release_mem_region(r->start, resource_size(r));

-- 
2.53.0


