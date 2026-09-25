Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7310C98326
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 07:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mcoE4taw/OLMDriwb1yayyHs+mcRpX6YAGjWNE6TbuA=; b=cWAb0Mn0pDqeUFIYgkoX7q67vz
	xkpf/I4JH5JCiF7LY4xRmYV5K0DjFRJyCSwOVZkXxHTJ1petBQ0iFNZn2ws83PcYTco/rRkLBpeOH
	XFH1Mn2HDYBQKB1XkUpdy6YOcXN6uOjNra7qZF3HyUDThhln3TGQcGSlyh8wVoT3ClDQzNl27Yykd
	FYS75zJDUreDu1F1gx9ExFzDxpyUnJpE9wsE1GqvUwCWRP1NWVi3dvX26r6k5Eu2RIz9WKfnPMl8P
	kYrQT61b2nCaJHSAtpDh3oy+nPzpJ8BNgAoIYCIIOQpTgFV5QhBKO7sWag5zCVXt90hTzgPfPuPiB
	LF0hc6Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA0fo-0000000Cqem-0Yp2;
	Fri, 25 Sep 2026 07:48:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA0fi-0000000Cqcg-0sdQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 07:48:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F166440639;
	Fri, 25 Sep 2026 07:48:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F00D31F00893;
	Fri, 25 Sep 2026 07:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790322521;
	bh=mcoE4taw/OLMDriwb1yayyHs+mcRpX6YAGjWNE6TbuA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=brH0ciHVa9J/G8l4gnG7FghqweWW9L33lgcN1TBe/jRiPM9YZt6bV2fVWb7UDY7wP
	 6ie2Ceo7tG6w+WMRqjKUKPg6FMudAxMupN/QobSFHF/AQGZ4FUfhUzsaSvKfL8nyuv
	 alrEXWTeaCCvvQRuJzTeSvZ746CIxrlMOntjdIxKhol3tOMH7vHQTLkBhG9FkDOC+N
	 CgazS5XDriypfGkRu3xw21AiYwntp5YNButkEP5eXKcsCNA0m5JvLGnncX6LOuhhme
	 RNavDQhXzAoQf2DGitkShy4Qh3qEwUQOW+Ydtnw6S+IBwz4cSf7NkKt08Gw9ywqxsD
	 Vl9ZFShi9TZiQ==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Fri, 25 Sep 2026 09:48:04 +0200
Subject: [PATCH RFC 05/11] clocksource/drivers/arm_arch_timer_mmio:
 Implement arch mem timer deferred probe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-acpi-static-table-irq-probe-defer-v1-5-2c62125d0085@kernel.org>
References: <20260925-acpi-static-table-irq-probe-defer-v1-0-2c62125d0085@kernel.org>
In-Reply-To: <20260925-acpi-static-table-irq-probe-defer-v1-0-2c62125d0085@kernel.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Danilo Krummrich <dakr@kernel.org>, Hanjun Guo <guohanjun@huawei.com>, 
 Sudeep Holla <sudeep.holla@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Robin Murphy <robin.murphy@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, driver-core@lists.linux.dev, 
 linux-watchdog@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>
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

Resolving the arch mem timer IRQ on ACPI systems might require
two-steps if the IRQ is wired to an interrupt controller whose
driver has not probed yet at the time the IRQ mapping is carried
out through acpi_register_gsi(), which would result in an
-EPROBE_DEFER return value that in turn should trigger a
driver probe deferral.

Instead of trying to map an IRQ when the arch mem timer device is
created, stash the GSIs number and flag values in the arch_timer_mem_frame
data structure and use it at driver probe time to map the GSIs.

Add -EPROBE_DEFER handling to the arch mem timer driver so
that it can cope with GSIs that are routed to interrupt controllers
whose driver has not yet probed at the time acpi_register_gsi() is
invoked.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
---
 drivers/acpi/arm64/gtdt.c                 | 27 +++------
 drivers/clocksource/arm_arch_timer_mmio.c | 94 +++++++++++++++++++++++++++++++
 include/clocksource/arm_arch_timer.h      |  4 ++
 3 files changed, 106 insertions(+), 19 deletions(-)

diff --git a/drivers/acpi/arm64/gtdt.c b/drivers/acpi/arm64/gtdt.c
index 00158c8aa6d9..d7248684b2c5 100644
--- a/drivers/acpi/arm64/gtdt.c
+++ b/drivers/acpi/arm64/gtdt.c
@@ -287,23 +287,12 @@ static int __init gtdt_parse_timer_block(struct acpi_gtdt_timer_block *block,
 		if (frame->valid)
 			goto error;
 
-		frame->phys_irq = map_gt_gsi(gtdt_frame->timer_interrupt,
-					     gtdt_frame->timer_flags);
-		if (frame->phys_irq <= 0) {
-			pr_warn("failed to map physical timer irq in frame %d.\n",
-				gtdt_frame->frame_number);
-			goto error;
-		}
+		frame->phys_gsi = gtdt_frame->timer_interrupt;
+		frame->phys_flags = gtdt_frame->timer_flags;
 
 		if (gtdt_frame->virtual_timer_interrupt) {
-			frame->virt_irq =
-				map_gt_gsi(gtdt_frame->virtual_timer_interrupt,
-					   gtdt_frame->virtual_timer_flags);
-			if (frame->virt_irq <= 0) {
-				pr_warn("failed to map virtual timer irq in frame %d.\n",
-					gtdt_frame->frame_number);
-				goto error;
-			}
+			frame->virt_gsi = gtdt_frame->virtual_timer_interrupt;
+			frame->virt_flags = gtdt_frame->virtual_timer_flags;
 		} else {
 			pr_debug("virtual timer in frame %d not implemented.\n",
 				 gtdt_frame->frame_number);
@@ -329,12 +318,12 @@ static int __init gtdt_parse_timer_block(struct acpi_gtdt_timer_block *block,
 
 		frame = &timer_mem->frame[gtdt_frame->frame_number];
 
-		if (frame->phys_irq > 0)
-			acpi_unregister_gsi(gtdt_frame->timer_interrupt);
+		frame->phys_gsi = 0;
+		frame->phys_flags = 0;
 		frame->phys_irq = 0;
 
-		if (frame->virt_irq > 0)
-			acpi_unregister_gsi(gtdt_frame->virtual_timer_interrupt);
+		frame->virt_gsi = 0;
+		frame->virt_flags = 0;
 		frame->virt_irq = 0;
 	} while (i-- > 0 && gtdt_frame--);
 
diff --git a/drivers/clocksource/arm_arch_timer_mmio.c b/drivers/clocksource/arm_arch_timer_mmio.c
index c3f2fe39bdd2..cfa819687e68 100644
--- a/drivers/clocksource/arm_arch_timer_mmio.c
+++ b/drivers/clocksource/arm_arch_timer_mmio.c
@@ -10,6 +10,7 @@
 
 #define pr_fmt(fmt) 	"arch_timer_mmio: " fmt
 
+#include <linux/acpi.h>
 #include <linux/clockchips.h>
 #include <linux/interrupt.h>
 #include <linux/io-64-nonatomic-lo-hi.h>
@@ -205,6 +206,96 @@ static void arch_timer_mmio_unmap_frame_irqs(struct arch_timer_mem_frame *frame)
 	arch_timer_mmio_unmap_irq(&frame->virt_irq);
 }
 
+#ifdef CONFIG_ACPI
+static int arch_timer_mmio_map_gsi(struct platform_device *pdev, u32 gsi,
+				   u32 flags, int *irq)
+{
+	int trigger, polarity, ret;
+
+	if (!gsi || *irq)
+		return 0;
+
+	trigger = (flags & ACPI_GTDT_INTERRUPT_MODE) ? ACPI_EDGE_SENSITIVE
+						     : ACPI_LEVEL_SENSITIVE;
+	polarity = (flags & ACPI_GTDT_INTERRUPT_POLARITY) ? ACPI_ACTIVE_LOW
+							  : ACPI_ACTIVE_HIGH;
+
+	ret = acpi_register_gsi(&pdev->dev, gsi, trigger, polarity);
+	if (ret < 0)
+		return ret;
+
+	*irq = ret;
+
+	return 0;
+}
+
+static int arch_timer_mmio_map_frame_gsis(struct platform_device *pdev,
+					  struct arch_timer_mem_frame *frame)
+{
+	int ret;
+
+	ret = arch_timer_mmio_map_gsi(pdev, frame->phys_gsi, frame->phys_flags, &frame->phys_irq);
+	if (ret < 0) {
+		if (ret == -EPROBE_DEFER)
+			return ret;
+
+		dev_err(&pdev->dev,
+			"Failed to map physical timer GSI %u for frame @ %pa: %d\n",
+			frame->phys_gsi, &frame->cntbase, ret);
+		return ret;
+	}
+
+	ret = arch_timer_mmio_map_gsi(pdev, frame->virt_gsi, frame->virt_flags, &frame->virt_irq);
+	if (ret < 0) {
+		if (ret != -EPROBE_DEFER)
+			dev_err(&pdev->dev,
+				"Failed to map virtual timer GSI %u for frame @ %pa: %d\n",
+				frame->virt_gsi, &frame->cntbase, ret);
+		arch_timer_mmio_unmap_irq(&frame->phys_irq);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int arch_timer_mmio_map_gsis(struct platform_device *pdev,
+				    struct arch_timer_mem *gt_block)
+{
+	int i, ret;
+
+	for (i = 0; i < ARCH_TIMER_MEM_MAX_FRAMES; i++) {
+		struct arch_timer_mem_frame *frame = &gt_block->frame[i];
+
+		if (!frame->valid)
+			continue;
+
+		ret = arch_timer_mmio_map_frame_gsis(pdev, frame);
+		if (ret < 0)
+			goto unmap_err;
+	}
+
+	return 0;
+
+unmap_err:
+	for (i--; i >= 0; i--) {
+		struct arch_timer_mem_frame *frame = &gt_block->frame[i];
+
+		if (!frame->valid)
+			continue;
+
+		arch_timer_mmio_unmap_frame_irqs(frame);
+	}
+
+	return ret;
+}
+#else
+static inline int arch_timer_mmio_map_gsis(struct platform_device *pdev,
+					   struct arch_timer_mem *gt_block)
+{
+	return -ENODEV;
+}
+#endif
+
 static void arch_timer_mmio_unmap_irqs(struct arch_timer_mem *gt_block)
 {
 	int i;
@@ -420,6 +511,9 @@ static int arch_timer_mmio_probe(struct platform_device *pdev)
 			return ret;
 	} else {
 		at->gt_block = dev_get_platdata(&pdev->dev);
+		ret = arch_timer_mmio_map_gsis(pdev, at->gt_block);
+		if (ret)
+			return ret;
 	}
 
 	platform_set_drvdata(pdev, at);
diff --git a/include/clocksource/arm_arch_timer.h b/include/clocksource/arm_arch_timer.h
index 2eda895f19f5..c14741519899 100644
--- a/include/clocksource/arm_arch_timer.h
+++ b/include/clocksource/arm_arch_timer.h
@@ -76,6 +76,10 @@ struct arch_timer_mem_frame {
 	size_t size;
 	int phys_irq;
 	int virt_irq;
+	u32 phys_gsi;
+	u32 phys_flags;
+	u32 virt_gsi;
+	u32 virt_flags;
 };
 
 struct arch_timer_mem {

-- 
2.54.0


