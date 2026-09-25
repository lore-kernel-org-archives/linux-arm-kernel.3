Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 574CDC9830D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 07:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AAVRqCmTFl1INQ4GWLQBmb/9F8qh8Im4ZaqVBVS7Nk0=; b=E/VoR5QS2tLeImEA1/dV7OuXWw
	wLn9z5jeM1K6w2gTnZmmKyUB709hmq6giBjBYBJbrcr9mNk5N3fdUtIfDz4ucn1Cv9zH7/3ol1mt+
	PJeuOoLk1aGVJHeYMcjY6ZTWZvYjdatZkXhxCn9sXGhDhh6Z4ys2/HXjE8AUC++2XpWe4tHJbf8MA
	6+3RGRdzhs7+TlSnnSQAUqo1oCYdhnucoaoVtSRb6S0zVRCHiLmkoLpAlLSbzUSXEQcvunTN7LaL0
	rHNkZ1KdrX1zcuEiwjpudHBgdgB1bKMaglwr7KDRkm15cwhNmeuDN/UpxGQL8IccnC4G8or0gas8y
	8NEhnoMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA0gQ-0000000Cr8D-3J1C;
	Fri, 25 Sep 2026 07:49:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA0g9-0000000Cqu6-3nKn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 07:49:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5A09860230;
	Fri, 25 Sep 2026 07:49:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E4111F000FF;
	Fri, 25 Sep 2026 07:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790322549;
	bh=AAVRqCmTFl1INQ4GWLQBmb/9F8qh8Im4ZaqVBVS7Nk0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=iV61sFDmiXtKzqIoYYMzCr/gNo/Xbp02ea54IKoci0Bnxo4nPmxATJM96hCW6EzMs
	 Ugc+s2DzBuenaujXmxpCFOiU2p6oKYM+jh2Rs65yCdGJOEyk2EK+B4mcUOpdFEYOd9
	 XnBn/NMD3FI0HbcXmiF1O5bUyH7z5OURjmoYjkIRimHjIANjv/r+H9g9HeIMtuhJLz
	 sxVdqAtvXtqOwt8ZfEPgbLn3rK1HqNgoM6Eh2gpYJv1DkptQn/kfF3pw9/Y9XFL3EY
	 x2u61sCfQe9Ts+oidTPsC9kpEt/t7vtcEF9R285wYWRUnL7muS9HRYu3MPSQpnyeZ8
	 EisWYoFEUD3BA==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Fri, 25 Sep 2026 09:48:09 +0200
Subject: [PATCH RFC 10/11] iommu/arm-smmu-v3: Add IRQ mapping -EPROBE_DEFER
 handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-acpi-static-table-irq-probe-defer-v1-10-2c62125d0085@kernel.org>
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
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 5732f3ba0122..1832389916a4 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -5562,18 +5562,26 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
 	/* Interrupt lines */
 
 	irq = platform_get_irq_byname_optional(pdev, "combined");
+	if (irq == -EPROBE_DEFER)
+		return dev_err_probe(dev, irq, "failed to get combined IRQ\n");
 	if (irq > 0)
 		smmu->combined_irq = irq;
 	else {
 		irq = platform_get_irq_byname_optional(pdev, "eventq");
+		if (irq == -EPROBE_DEFER)
+			return dev_err_probe(dev, irq, "failed to get eventq IRQ\n");
 		if (irq > 0)
 			smmu->evtq.q.irq = irq;
 
 		irq = platform_get_irq_byname_optional(pdev, "priq");
+		if (irq == -EPROBE_DEFER)
+			return dev_err_probe(dev, irq, "failed to get priq IRQ\n");
 		if (irq > 0)
 			smmu->priq.q.irq = irq;
 
 		irq = platform_get_irq_byname_optional(pdev, "gerror");
+		if (irq == -EPROBE_DEFER)
+			return dev_err_probe(dev, irq, "failed to get gerror IRQ\n");
 		if (irq > 0)
 			smmu->gerr_irq = irq;
 	}

-- 
2.54.0


