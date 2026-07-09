Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB45AC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 08:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Aezc9O//egGLmPy5XC3coGY0bf/LgusaY72KiGQRYwM=; b=z4eE1VYEnu4KX4RbQxz0zn4Czv
	+LDkRXdz3UM7x2NcVurdN9qL8TAoC44cDBDXpz9I68/XjbNLO1kH6pbwjax31dKt37iJw2C5kP3UY
	91qSebn+kJcwP7SXTzFC8flOU/MSIYsSOtiFd/9UcPk+B4nSesDVqvmIt2Jp1cN2iyMvPrbkfq9Zz
	N16VoOCQCmYBtOMCGRrXMLrCjn3O86G460xEFmiS+Oano/GH2WWXdZYLRiSHM6Kd4kJI6U2Di+JmL
	7wlyh++mfB2i428H6BoJXdjHORvfmwU4HxGyLdm8tB6mKWjyKDRdqgKFSEbeGFxRoBWRfLkAJSZ1v
	S6pqI8Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whkJl-00000001Rxp-2cXJ;
	Thu, 09 Jul 2026 08:41:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whkJk-00000001RxG-1qip;
	Thu, 09 Jul 2026 08:41:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B28936001A;
	Thu,  9 Jul 2026 08:41:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30B781F00A3D;
	Thu,  9 Jul 2026 08:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783586471;
	bh=Aezc9O//egGLmPy5XC3coGY0bf/LgusaY72KiGQRYwM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=OT/7goZfnm7eVSTrmS3tf6H7PigGIlK+kWidCC1zlr7aF6+cjX6yC4wVCRtcco5sP
	 yeg5Z/OorVQcvsNSH9z73nPKRiIsTSmh8jAEI2n4RjMA6gKyuSW6iYGnHsLcG6SPiF
	 FYVHnfgq8FBU+qQF7QmolxjuwYPzgLvTzWforT5+AMslth+RELacxuJdM5U9pHPjIw
	 Ymt/I/crUh1yM0jqHb8NFYOOBh7XX+JqwoS7N3GSmenuVzkQjwyXAPm5BYwM7mAxck
	 scOBDPQ2LJKpLzYJbBdt44tuDzEM+161sAUhDhpC3ROYu92G86K4pwq+n8+jluehRY
	 ZovQ12E2nbuhw==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Thu, 09 Jul 2026 10:40:12 +0200
Subject: [PATCH v4 2/7] ACPI: RISC-V: Fix riscv_acpi_irq_get_dep() loop
 termination
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-gic-v5-acpi-iwb-probe-deferral-v4-2-48dae790f871@kernel.org>
References: <20260709-gic-v5-acpi-iwb-probe-deferral-v4-0-48dae790f871@kernel.org>
In-Reply-To: <20260709-gic-v5-acpi-iwb-probe-deferral-v4-0-48dae790f871@kernel.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Sunil V L <sunilvl@ventanamicro.com>, Marc Zyngier <maz@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
 Anup Patel <anup@brainfault.org>, Hanjun Guo <guohanjun@huawei.com>, 
 Sudeep Holla <sudeep.holla@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 loongarch@lists.linux.dev, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
 Sunil V L <sunilvl@oss.qualcomm.com>
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

In riscv_acpi_add_irq_dep() the main loop condition would currently stop
the loop if an interrupt descriptor contains an interrupt for which the
respective GSI handle is NULL, which is not correct because subsequent
interrupts in the interrupt descriptor might still have a GSI dependency
that must not be skipped.

Rework riscv_acpi_add_irq_dep() and the riscv_acpi_irq_get_dep() call chain
to fix it - by not forcing the loop to stop in order to guarantee
dependency detection for all the interrupt entries in the CRS descriptor.

Fixes: 1b173cc4bfcd ("ACPI: RISC-V: Implement function to add implicit dependencies")
Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Tested-by: Sunil V L <sunilvl@oss.qualcomm.com>
Reviewed-by: Sunil V L <sunilvl@oss.qualcomm.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Sunil V L <sunilvl@ventanamicro.com>
---
 drivers/acpi/riscv/irq.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/acpi/riscv/irq.c b/drivers/acpi/riscv/irq.c
index 9b88d0993e88..cd83c3035cf6 100644
--- a/drivers/acpi/riscv/irq.c
+++ b/drivers/acpi/riscv/irq.c
@@ -299,6 +299,7 @@ static acpi_status riscv_acpi_irq_get_parent(struct acpi_resource *ares, void *c
 			return AE_OK;
 
 		ctx->handle = riscv_acpi_get_gsi_handle(eirq->interrupts[ctx->index]);
+		ctx->rc = 0;
 		return AE_CTRL_TERMINATE;
 	}
 
@@ -314,10 +315,8 @@ static int riscv_acpi_irq_get_dep(acpi_handle handle, unsigned int index, acpi_h
 
 	acpi_walk_resources(handle, METHOD_NAME__CRS, riscv_acpi_irq_get_parent, &ctx);
 	*gsi_handle = ctx.handle;
-	if (*gsi_handle)
-		return 1;
 
-	return 0;
+	return ctx.rc;
 }
 
 static u32 riscv_acpi_add_prt_dep(acpi_handle handle)
@@ -381,8 +380,11 @@ static u32 riscv_acpi_add_irq_dep(acpi_handle handle)
 	int i;
 
 	for (i = 0;
-	     riscv_acpi_irq_get_dep(handle, i, &gsi_handle);
+	     !riscv_acpi_irq_get_dep(handle, i, &gsi_handle);
 	     i++) {
+		if (!gsi_handle)
+			continue;
+
 		dep_devices.count = 1;
 		dep_devices.handles = kzalloc_objs(*dep_devices.handles, 1);
 		if (!dep_devices.handles) {

-- 
2.34.1


