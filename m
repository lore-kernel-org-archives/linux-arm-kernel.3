Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3D33C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 07:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/OOfgjQxMjGX08q/r6dj/8dQnsOf9sej1vvHwcv9Vck=; b=X0fLpL0qhRXGJzDUtcz0jFoy7h
	H1bhqAQMK94o1i/ft9DcHu6kuJLNwHmsaQCaj7wvMcfV9Yvxqo6Tbj3VPwMozKUB3ERdKLEWKD2WF
	UxCdoxFYmhPVVnVrb9BNiWQZyJmn7ljo+SLV1ifjLGLJSkdFgoQOv20f9DuHv/LAUHD7OxVpI4RTg
	Q2KJHeQn44xzZAb5cGQk88AcueQ4Yo/YXngmzGmhnh8qxwd9czdE5783f9tYCXx/V/cOhv7hw/zup
	vjUIhBKJVE56URtS9YhJbcERIDtv0+WfNjzkeMl9Ut0O/gSccvdqz1UZI+8ACtnZSFjyZE2v3rnHd
	9lrHVkGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA0fn-0000000CqeT-4AUc;
	Fri, 25 Sep 2026 07:48:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA0fd-0000000Cqa4-2hVs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 07:48:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B97BF60239;
	Fri, 25 Sep 2026 07:48:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B6FF1F000FF;
	Fri, 25 Sep 2026 07:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790322516;
	bh=/OOfgjQxMjGX08q/r6dj/8dQnsOf9sej1vvHwcv9Vck=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=LpEHIegPKzUVlrkOLNpoL0ngOMJlprMq1b+rdJXcMA6wbG/crOWY74u3z1m3oByaF
	 IRsb+JvYJE/il9O2UF7+fR1bX9vSFlZAVp2Ds12u4AGs5HYwFTr58/nEI7aE27V44R
	 ZoubgELe2oPQ5HT9s/duVu5mhrqElkaCpB5lM6THMfiAR5gMBVxyrCl0ThfoYMnahl
	 e3FIoLEABvWS61Nen+BUaDu2kUppexJysr+4aNiiz8U7kjGUuvax/Ai67WxCvcmbGY
	 w8WnaYgjpv47z2Lx+HsYwBCHUF5zzEafTJHLFhKfXnHE3h77mXSAgpzzp0Tmg2td/K
	 TiZsvgBXBt6xw==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Fri, 25 Sep 2026 09:48:03 +0200
Subject: [PATCH RFC 04/11] clocksource/drivers/arm_arch_timer_mmio: Dispose
 IRQ mappings on probe failure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-acpi-static-table-irq-probe-defer-v1-4-2c62125d0085@kernel.org>
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

On probe failure the driver does not dispose the IRQ mappings that
were carried out before the probe function hit an error condition.

Add code to dispose the IRQ mappings on driver probe failure.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
---
 drivers/clocksource/arm_arch_timer_mmio.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/clocksource/arm_arch_timer_mmio.c b/drivers/clocksource/arm_arch_timer_mmio.c
index d678f764d3bb..c3f2fe39bdd2 100644
--- a/drivers/clocksource/arm_arch_timer_mmio.c
+++ b/drivers/clocksource/arm_arch_timer_mmio.c
@@ -191,6 +191,34 @@ static irqreturn_t arch_timer_mmio_handler(int irq, void *dev_id)
 	return IRQ_NONE;
 }
 
+static void arch_timer_mmio_unmap_irq(int *irq)
+{
+	if (irq && *irq) {
+		irq_dispose_mapping(*irq);
+		*irq = 0;
+	}
+}
+
+static void arch_timer_mmio_unmap_frame_irqs(struct arch_timer_mem_frame *frame)
+{
+	arch_timer_mmio_unmap_irq(&frame->phys_irq);
+	arch_timer_mmio_unmap_irq(&frame->virt_irq);
+}
+
+static void arch_timer_mmio_unmap_irqs(struct arch_timer_mem *gt_block)
+{
+	int i;
+
+	for (i = 0; i < ARCH_TIMER_MEM_MAX_FRAMES; i++) {
+		struct arch_timer_mem_frame *frame = &gt_block->frame[i];
+
+		if (!frame->valid)
+			continue;
+
+		arch_timer_mmio_unmap_frame_irqs(frame);
+	}
+}
+
 static struct arch_timer_mem_frame *find_best_frame(struct platform_device *pdev)
 {
 	struct arch_timer_mem_frame *frame, *best_frame = NULL;
@@ -398,6 +426,7 @@ static int arch_timer_mmio_probe(struct platform_device *pdev)
 
 	frame = find_best_frame(pdev);
 	if (!frame) {
+		arch_timer_mmio_unmap_irqs(at->gt_block);
 		dev_err(&pdev->dev,
 			"Unable to find a suitable frame in timer @ %pa\n",
 			&at->gt_block->cntctlbase);

-- 
2.54.0


