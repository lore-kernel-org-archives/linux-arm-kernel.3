Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F009CAC58A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 23:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gVENMcmy572+AGe0xH0d/CoKuiwUWCQuAixdjDrf16A=; b=iMUjdguw9Rn6rjpsf9Y1Sz374g
	8mOT/71XJYKBzyMZHWBLEC387izJcEFNa/6Iv7nlZot7EE07iavCVu8XCD82ztaajJD2ZuVwecjvK
	JXt52UJjMLRuCESTc2WzQdY5rZcNYXb4449MV/jAxfpXe7G5D4GHfb42BaL3oug7owsTX/p+y22U8
	3aH338IwS3Z4kNgZAoH61koN62+WjKQL3rUDJIdkyOuBwjIsHI2KZhTBApKekK7HV/e0/wQ2/KHKG
	Z+CRztSe5HH5+s3QzY/xeJIbbuPw3Lf6LxAI/IrjToOF6i3IkGKLGCJjSeelbk/yVx/7zTrFFkb2I
	7sZCI/FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvleh-000000033Cb-455i;
	Mon, 08 Sep 2025 23:52:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvemU-00000000lOU-2ObP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 16:31:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F10DC601D4;
	Mon,  8 Sep 2025 16:31:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD92DC4CEF9;
	Mon,  8 Sep 2025 16:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757349109;
	bh=BXehqBShX490v3aAs4Y17GiJfZWz8kwwWxRiKKAQ/G4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qvnvrwSM/pNc7BL66L2RweNhYgu1YmKOuWSMcbDHLsDbaV8+V6TRxiE+4Wfw8N8dq
	 DpcvyYGORdOZmvj/HRKmINlJeCBMwoarVbrY6iHOoqV0NIVxidhRnP0LCIgZ0GpEs3
	 f0wJhHtA07IQ96CycHzKVZKJWrabLBQ3bvJJLCaq8Pn5/cnvn7YL6UdBHm0gsXfH8/
	 ZoSO8SS4lohs2ezmXWYA8thr7ClB16YS8XK+lZrdKclHzPIoMEn1aMly5eYlp0d0Zd
	 B2s5APdqspWT65zKQeYUzF9knBUjqN+Vruzvpv9XbN5FkwQ/reCFyOFvPtDHqkQW8G
	 iPEpWkmnRBv1Q==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1uvemR-00000004NTm-3vA9;
	Mon, 08 Sep 2025 16:31:48 +0000
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
	James Clark <james.clark@linaro.org>
Subject: [PATCH 09/25] perf: arm_spe_pmu: Convert to new IRQ affinity retrieval API
Date: Mon,  8 Sep 2025 17:31:11 +0100
Message-Id: <20250908163127.2462948-10-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250908163127.2462948-1-maz@kernel.org>
References: <20250908163127.2462948-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org, tglx@linutronix.de, mark.rutland@arm.com, will@kernel.org, rafael@kernel.org, robh@kernel.org, saravanak@google.com, gregkh@linuxfoundation.org, sven@kernel.org, j@jannau.net, suzuki.poulose@arm.com, james.clark@linaro.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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
the ARM SPE driver over to this new method.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/perf/arm_spe_pmu.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
index 369e77ad5f13f..a1c86a1f21427 100644
--- a/drivers/perf/arm_spe_pmu.c
+++ b/drivers/perf/arm_spe_pmu.c
@@ -1211,8 +1211,10 @@ static void arm_spe_pmu_dev_teardown(struct arm_spe_pmu *spe_pmu)
 static int arm_spe_pmu_irq_probe(struct arm_spe_pmu *spe_pmu)
 {
 	struct platform_device *pdev = spe_pmu->pdev;
-	int irq = platform_get_irq(pdev, 0);
+	const struct cpumask *affinity;
+	int irq;
 
+	irq = platform_get_irq_affinity(pdev, 0, &affinity);
 	if (irq < 0)
 		return -ENXIO;
 
@@ -1221,10 +1223,7 @@ static int arm_spe_pmu_irq_probe(struct arm_spe_pmu *spe_pmu)
 		return -EINVAL;
 	}
 
-	if (irq_get_percpu_devid_partition(irq, &spe_pmu->supported_cpus)) {
-		dev_err(&pdev->dev, "failed to get PPI partition (%d)\n", irq);
-		return -EINVAL;
-	}
+	cpumask_copy(&spe_pmu->supported_cpus, affinity);
 
 	spe_pmu->irq = irq;
 	return 0;
-- 
2.39.2


