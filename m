Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77360C98326
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 07:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ThxKXBdcGAVa3HEFR93seFrJ2tte9ths6R+UnHKtC8k=; b=VKAdDOYVJFdqhcTMOmpmI/Kkii
	taj21TEKxZL6DYbqKF9ya5a8cquR3lQ8eWrg7b1IhySBjgaf0yz0dlN6bmx/+8HDrtq7hZTE507cW
	f4Au5P073rz0HaFBbpT+aMuhPucN8+CSL6G30V03bzWc8wAxigMO2TbFgOc2B4k5pn9CbFvCqaSXs
	nQWyB7OUIefReUJSXownNl2PL5WeyUTYy3MmvX6NAJlq5IIEAVKnm6X7UDF0v5MmnQUGjMlLWLkHd
	ztkh0QGJWLcmWnh9tLDiswVBt/CW1CjgzWsueG7zA/vay2Lf4SIQsudzrQsFxEVglbA3CYpa50e0V
	8Nf5SfbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA0gR-0000000Cr8d-053v;
	Fri, 25 Sep 2026 07:49:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA0gF-0000000CqzQ-1LgL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 07:49:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BC52460239;
	Fri, 25 Sep 2026 07:49:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F96F1F00893;
	Fri, 25 Sep 2026 07:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790322554;
	bh=ThxKXBdcGAVa3HEFR93seFrJ2tte9ths6R+UnHKtC8k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=YqaHETUL2eC40mdJHh0euOmNn5P445obFRq5dZhIW9t9NHF3lShYPPwEc6hyuhIP0
	 fnXRYnux+hQQhIAt/HGA8WEqJVs7GM4h13BtRiETyEFXmbX5tHpXBn8U490qbaDD8q
	 0tghAg3bsI/brL3iCBm5L2jpYWPQxdtHVpb6KMIYyjrVJcpJDU3vjhu1Dp6naTEbqn
	 rwOlcUYRDfJWFhauJK7tTVykrP0okP/rxeG89yuU4bMzhlSfOh6HqvtlmcsWspalLS
	 oEUDs6Wcd97m8YFxocn4+rZyevt48fSfqdcpVVngIyvESpwRBt4ESKYT7aTF8av3eO
	 itQjsJlG2Gl5w==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Fri, 25 Sep 2026 09:48:10 +0200
Subject: [PATCH RFC 11/11] perf/arm-smmu-v3-pmu: Add IRQ mapping
 -EPROBE_DEFER handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-acpi-static-table-irq-probe-defer-v1-11-2c62125d0085@kernel.org>
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
controller the wired SMMU PMCG interrupts are routed to has not probed
yet when the SMMU PMCG driver probes.

Handle -EPROBE_DEFER gracefully for IRQ mappings failures.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>
---
 drivers/perf/arm_smmuv3_pmu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/perf/arm_smmuv3_pmu.c b/drivers/perf/arm_smmuv3_pmu.c
index 8ce34e6bb82b..d8d977c13ab9 100644
--- a/drivers/perf/arm_smmuv3_pmu.c
+++ b/drivers/perf/arm_smmuv3_pmu.c
@@ -893,6 +893,9 @@ static int smmu_pmu_probe(struct platform_device *pdev)
 	}
 
 	irq = platform_get_irq_optional(pdev, 0);
+	if (irq == -EPROBE_DEFER)
+		return dev_err_probe(dev, irq, "failed to get PMCG IRQ\n");
+
 	if (irq > 0)
 		smmu_pmu->irq = irq;
 

-- 
2.54.0


