Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ACC8CAC5AD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 08:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8i4R6A5xOkKzMggVvt9wCBcON/S/bmdAL13N1oedjeg=; b=RKWapLSRuCQTCQKBeqOTGFkqig
	Zxi4GOQ4hmdqvK9FLlFFKpdSEBQH8sw+QU8klZGNR+YRYojCiff+QZiwogkAazvbDyAwEyzi+DdeJ
	A5hnQlIWLuvY1a/LZtSuBYxM6pLj79mLk8dH1AHcs5NzxeCatS5l2dTwCa3NeBPjFfTNV7UpJBCO9
	4sJkD54v9/qrZ6mG6bDgw6nwp2Ne8kIqbNg9UQoIS9aNkuykrby+ePMSuhqZgQrn6r7SLOZW3pk6U
	gKpQm0sc86+ddeY9pe0OiKZ6WrXgaisXXt2E9fxIYgQgQVNTRIsBqgpX56sIt5kA4whDYa7xOaHFD
	8w7Q+E1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0buq-00000009huN-1S6V;
	Mon, 22 Sep 2025 08:28:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0buh-00000009hhh-0Tqd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 08:28:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CC10344EA2;
	Mon, 22 Sep 2025 08:28:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABAF7C4CEF0;
	Mon, 22 Sep 2025 08:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758529726;
	bh=9bnWd8U5uJVzMhF0VNM4Fq8zW1CPc18xcTGjzBTs9K4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cvKPJ6yo3XE1zMlVxa0zyYCqCRg+QyaZH0AgS89N4mvhinGfez7MvNY3GdyBIvqFz
	 j7557PGEljG/RT7LHlH7yw3XJZPLJPr4g07iA2W+R0UqUCdoUy25GutLkf5nKbgUww
	 HTq/AeacIAttwMjQgJN1q5RFHQhkl/RPKDznfmC4sKTQp+cpIzj51iWcPgB4IOVLE7
	 QdsObwNmNbNaK/zIn4DKYLieKNmctRb0YUP3A8gg0Q16cPzQwMVl76CBMFkDV+xipn
	 jdZCh6FLxc21zw338WxdkfD5x5zNO4d6eCoJuzXhoA9OzrlEeEZ5OFkhtEVHOSRT/4
	 3D1c3epO0VbtQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1v0bue-00000008Kds-3Zg8;
	Mon, 22 Sep 2025 08:28:44 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Mark Rutland <mark.rutland@arm.com>,
	Will Deacon <will@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	James Clark <james.clark@linaro.org>,
	Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: [PATCH v3 11/26] genirq: Kill handle_percpu_devid_fasteoi_nmi()
Date: Mon, 22 Sep 2025 09:28:18 +0100
Message-ID: <20250922082833.2038905-12-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250922082833.2038905-1-maz@kernel.org>
References: <20250922082833.2038905-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org, tglx@linutronix.de, mark.rutland@arm.com, will@kernel.org, rafael@kernel.org, robh@kernel.org, saravanak@google.com, gregkh@linuxfoundation.org, sven@kernel.org, j@jannau.net, suzuki.poulose@arm.com, james.clark@linaro.org, jonathan.cameron@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_012847_214195_0CEB82B1 
X-CRM114-Status: GOOD (  13.30  )
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

There is no in-tree user of this flow handler anymore, so simply
remove it.

Suggested-by: Will Deacon <will@kernel.org>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 include/linux/irq.h |  1 -
 kernel/irq/chip.c   | 25 -------------------------
 2 files changed, 26 deletions(-)

diff --git a/include/linux/irq.h b/include/linux/irq.h
index 1d6b606a81efe..1381f9d1f5c9d 100644
--- a/include/linux/irq.h
+++ b/include/linux/irq.h
@@ -655,7 +655,6 @@ extern void handle_bad_irq(struct irq_desc *desc);
 extern void handle_nested_irq(unsigned int irq);
 
 extern void handle_fasteoi_nmi(struct irq_desc *desc);
-extern void handle_percpu_devid_fasteoi_nmi(struct irq_desc *desc);
 
 extern int irq_chip_compose_msi_msg(struct irq_data *data, struct msi_msg *msg);
 extern int irq_chip_pm_get(struct irq_data *data);
diff --git a/kernel/irq/chip.c b/kernel/irq/chip.c
index 0d0276378c707..d1c9e357f64d2 100644
--- a/kernel/irq/chip.c
+++ b/kernel/irq/chip.c
@@ -929,31 +929,6 @@ void handle_percpu_devid_irq(struct irq_desc *desc)
 		chip->irq_eoi(&desc->irq_data);
 }
 
-/**
- * handle_percpu_devid_fasteoi_nmi - Per CPU local NMI handler with per cpu
- *				     dev ids
- * @desc:	the interrupt description structure for this irq
- *
- * Similar to handle_fasteoi_nmi, but handling the dev_id cookie
- * as a percpu pointer.
- */
-void handle_percpu_devid_fasteoi_nmi(struct irq_desc *desc)
-{
-	struct irq_chip *chip = irq_desc_get_chip(desc);
-	struct irqaction *action = desc->action;
-	unsigned int irq = irq_desc_get_irq(desc);
-	irqreturn_t res;
-
-	__kstat_incr_irqs_this_cpu(desc);
-
-	trace_irq_handler_entry(irq, action);
-	res = action->handler(irq, raw_cpu_ptr(action->percpu_dev_id));
-	trace_irq_handler_exit(irq, action, res);
-
-	if (chip->irq_eoi)
-		chip->irq_eoi(&desc->irq_data);
-}
-
 static void
 __irq_do_set_handler(struct irq_desc *desc, irq_flow_handler_t handle,
 		     int is_chained, const char *name)
-- 
2.47.3


