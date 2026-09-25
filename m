Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 117FBC9830E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 07:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bbS6RVxPwSJkhIbaoq1cDhXQrT6Zk0hyEGnIaNM8PH8=; b=GE74bmkRCTPqe3QXRbVjyYY1g5
	q7+M5ejSG1HgchuXnCBn0BgWP9U/y5iaSrfXMXHTd+KyTNtGJmuE980yDkCzszqGjEOEGHFxdciUg
	cuL3clXgJUe7yVhKYKah3R+xkLvedY4BMyM0UGfMc9mz/Va0BzEUZK0o6dKa7rJT3LxF0Zjb57swj
	MbQ6avywlmd6rvgqQWPNR+6ne7IoMPDsFcVjBBuA7szip/1o3WkZtWSixTToIeFFA2xGoQqMZFIkT
	0HhAK1xI2aA5DaG6DjdWGsQk2ER72ruBRz8tJLkj+CTqR763Y6PqatOOy1Tg4a5C1muqr/NIkIsNu
	gK9LgX1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA0gQ-0000000Cr7v-2al7;
	Fri, 25 Sep 2026 07:49:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA0g4-0000000Cqon-0g6U
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 07:49:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C07EE40639;
	Fri, 25 Sep 2026 07:49:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 903B21F00893;
	Fri, 25 Sep 2026 07:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790322543;
	bh=bbS6RVxPwSJkhIbaoq1cDhXQrT6Zk0hyEGnIaNM8PH8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=TY2kkkVbvwuQLcFikGbNiXx2TM/xYBOBVA/RwbDzi6SZOY0n3IPQgpfBCZ90+FH6V
	 QgYyFdmARNyN0aPpfsxBos5sfP4T/hQEaZUb0SoLzz5blq5CLqFqiSpjBzF3wI47XR
	 9dp3igO4g8VtwU701v1aBscSVkp1Lvzag54p0ODXDFUv8OVahZ2K8AdmnzAHgzHP60
	 tm8jAdHrULcsY3hJpTpjmlA/X7VNUWR/ybl5affhj2EIoKGJ+mXYl3V/jHfcnq4fTo
	 O3V+LSgLn1bS6RApaa8O8Jp1ESaLK7Bl4iEJLfBKTTJILz5cJ8AMwdhRioQHu6egPo
	 bHpbRZuHgsw2g==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Fri, 25 Sep 2026 09:48:08 +0200
Subject: [PATCH RFC 09/11] iommu/arm-smmu: Add arm-smmu IRQ mapping
 -EPROBE_DEFER handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-acpi-static-table-irq-probe-defer-v1-9-2c62125d0085@kernel.org>
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

With the advent of GICv5, IRQs mapping can fail if the interrupt
controller the wired SMMU interrupts are routed to has not probed
yet when the SMMU driver probes.

Handle -EPROBE_DEFER gracefully for IRQ mappings failures.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index 889a0966d36c..a111b80553da 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -2154,6 +2154,8 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
 		return PTR_ERR(smmu);
 
 	num_irqs = platform_irq_count(pdev);
+	if (num_irqs < 0)
+		return dev_err_probe(dev, num_irqs, "IRQ count failed\n");
 
 	smmu->num_context_irqs = num_irqs - global_irqs - pmu_irqs;
 	if (smmu->num_context_irqs <= 0)
@@ -2171,7 +2173,7 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
 		int irq = platform_get_irq(pdev, global_irqs + pmu_irqs + i);
 
 		if (irq < 0)
-			return irq;
+			return dev_err_probe(dev, irq, "failed to get context IRQ\n");
 		smmu->irqs[i] = irq;
 	}
 
@@ -2211,7 +2213,7 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
 		int irq = platform_get_irq(pdev, i);
 
 		if (irq < 0)
-			return irq;
+			return dev_err_probe(dev, irq, "failed to get global IRQ\n");
 
 		err = devm_request_irq(dev, irq, global_fault, IRQF_SHARED,
 				       "arm-smmu global fault", smmu);

-- 
2.54.0


