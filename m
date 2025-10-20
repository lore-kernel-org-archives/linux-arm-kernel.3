Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E23E1CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 12:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VJaYH7vQeeRx+vnrQfWj8lJzsmHVdauT0HZkjj0CWNo=; b=LJ1rx922hY8fBBfWkt7AcjKEwC
	miTk0A7DhwUu/WZCnaRnQHbdeyzqybtWoxRs/p+J88BbMUAUFk8+kV+KdvL0Vp9gTvN8y1mmlGBz6
	QB4wpLwlnQB+3OTk4PzxTNH93ckpe0euxHZNdpRkE4a2h/WOFCgI/p7ubmDB3e+24y3VSyYLFZxlk
	UYq5ROHfjvSuHmu/KdH+S1JMpmvURn0hZwMxImRvNYlfXhGRBoUp7LN4er6KmRZ/OXfcKi0wsz3rr
	MPauTHlM7nmT5BZ3w9Y/eEwq1TZaXvw+Tr6RihiJyC0J47tAu8MByiNpZBn1fp9uarOywDrv7SYV9
	RuQ3fPug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAp2t-0000000DSew-3gYf;
	Mon, 20 Oct 2025 12:31:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAp1x-0000000DRHd-3c3l
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 12:30:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A5AEB48AA8;
	Mon, 20 Oct 2025 12:30:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75B37C16AAE;
	Mon, 20 Oct 2025 12:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760963411;
	bh=vRe08IshBVZgH66zAsJxgYD+sZIV9HYsJFPIPT5JdzI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OppaTkzbaK9k6VlRvv3ZEudUZgk4TK/G+tW6ol5mfvMzbkkUnU5L/3eGUCEiiY4pv
	 5b3dpqA/kn0FG+Tjqgcp51DZXvi3GRo2R0eOQ1hCtPr+gvubXkfPh8/ac8tUwc06Oz
	 Gq8+wxx8FIKvakr4Cx3hPO3w2rl249ExtZBC9k/0JfNYOTO02VybTJ8usb8S4MDT4M
	 teLAePD7YreTLYxIW3fL3ZGRpQtZNchiG5kfS6UWyb0VtV6HgxyuGI2SwXT/RtZ1lY
	 MnRGIqILNOKPwucnc+d0ynQ1wtqs5sZltUcutuDOybc34f14xGmiPcYpks5zkUI7vg
	 He+kUOe5VcCIQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vAp1d-0000000FUu2-2a1v;
	Mon, 20 Oct 2025 12:30:09 +0000
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
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>
Subject: [PATCH v4 08/26] perf: arm_pmu: Convert to new IRQ affinity retrieval API
Date: Mon, 20 Oct 2025 13:29:25 +0100
Message-ID: <20251020122944.3074811-9-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251020122944.3074811-1-maz@kernel.org>
References: <20251020122944.3074811-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org, tglx@linutronix.de, mark.rutland@arm.com, will@kernel.org, rafael@kernel.org, robh@kernel.org, saravanak@google.com, gregkh@linuxfoundation.org, sven@kernel.org, j@jannau.net, suzuki.poulose@arm.com, james.clark@linaro.org, jonathan.cameron@huawei.com, ruanjinjie@huawei.com, alexandru.elisei@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_053030_050601_5240A598 
X-CRM114-Status: GOOD (  14.67  )
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

Now that the relevant interrupt controllers are equipped with
a callback returning the affinity of per-CPU interrupts, switch
the OF side of the ARM PMU driver over to this new method.

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
Tested-by: Will Deacon <will@kernel.org>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/perf/arm_pmu_platform.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/perf/arm_pmu_platform.c b/drivers/perf/arm_pmu_platform.c
index 118170a5cedef..9c0494d8a867a 100644
--- a/drivers/perf/arm_pmu_platform.c
+++ b/drivers/perf/arm_pmu_platform.c
@@ -42,14 +42,13 @@ static int probe_current_pmu(struct arm_pmu *pmu,
 	return ret;
 }
 
-static int pmu_parse_percpu_irq(struct arm_pmu *pmu, int irq)
+static int pmu_parse_percpu_irq(struct arm_pmu *pmu, int irq,
+				const struct cpumask *affinity)
 {
-	int cpu, ret;
 	struct pmu_hw_events __percpu *hw_events = pmu->hw_events;
+	int cpu;
 
-	ret = irq_get_percpu_devid_partition(irq, &pmu->supported_cpus);
-	if (ret)
-		return ret;
+	cpumask_copy(&pmu->supported_cpus, affinity);
 
 	for_each_cpu(cpu, &pmu->supported_cpus)
 		per_cpu(hw_events->irq, cpu) = irq;
@@ -115,9 +114,12 @@ static int pmu_parse_irqs(struct arm_pmu *pmu)
 	}
 
 	if (num_irqs == 1) {
-		int irq = platform_get_irq(pdev, 0);
+		const struct cpumask *affinity;
+		int irq;
+
+		irq = platform_get_irq_affinity(pdev, 0, &affinity);
 		if ((irq > 0) && irq_is_percpu_devid(irq))
-			return pmu_parse_percpu_irq(pmu, irq);
+			return pmu_parse_percpu_irq(pmu, irq, affinity);
 	}
 
 	if (nr_cpu_ids != 1 && !pmu_has_irq_affinity(dev->of_node))
-- 
2.47.3


