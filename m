Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56FF5CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 06:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ic9o+VndUXPRx8kTEScNKikd2uC1KP5uDpqoGdmWmrU=; b=T3cDVC6IhIrKL1D8sXCPU8p6YE
	91leH+t4ISbFxZFoSVN6JwfPYNGRtFv36QgsbbayyASp48R2+0wDZAtfbS37DHvpJOCQUeVvNsWg7
	XNxNtwtklg7isqrfBTuLjhgeKso20h9657+QLUlN8Obyc2m0UlPQKNL5eC24k8UmWJ2fL3FFjVwLi
	aWhje5uMzsDZ82ywC4ztrf1mV3RdU1AI7PWI7xZ3hPMYhqfrNPlJc0RWWyfYQYKzpGmhieTRVANNv
	BUOSaYBb6Ty3kajr4tJ+6NJBFnwvU8fw0+8mxyAhLHn8P3lKvUY+5D1CfMBQmMSy+6eA8TqHal/0J
	D8Mr4xtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvs6s-00000004mKZ-2xnF;
	Tue, 09 Sep 2025 06:45:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvemU-00000000lOQ-16pP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 16:31:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5DB4744A28;
	Mon,  8 Sep 2025 16:31:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BD22C113D0;
	Mon,  8 Sep 2025 16:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757349109;
	bh=jQHOrUvrdulPrMOQtn05zaOApqc5lhkt4nBzVAEvlWw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=czBXERcPZ33eoypWE2xIzk9HQjHljbDix3cn36Hh2mK5gUF1VODYSJBFYDAUJ6FfN
	 Xao2Jr7HDWzJbhTYQeiuhScA9+g1QYJFXD0XuoA3aJyI+bDM2kdcmlDEdl8dqw99r7
	 k2lmphqCUS7LLR16vmtfF7f0crh3jq0ztn+KDnZjZ0o5F8CoMs6mW1oZAsCAIYAk27
	 UutSHwagfgmzCShbT/X/w6S1a3lPOh2AamN33Hxj1huPARni8NJjs084ST8cnZz7wr
	 3uUMmZbPs582U9/20z/SQXmsbCIIFkgnt6+Ec8uL2AXa9uTfgbXqxp4xIWkcCjD043
	 KeTlQw941xp+Q==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1uvemR-00000004NTm-1fwn;
	Mon, 08 Sep 2025 16:31:47 +0000
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
Subject: [PATCH 07/25] coresight: trbe: Convert to new IRQ affinity retrieval API
Date: Mon,  8 Sep 2025 17:31:09 +0100
Message-Id: <20250908163127.2462948-8-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250908163127.2462948-1-maz@kernel.org>
References: <20250908163127.2462948-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org, tglx@linutronix.de, mark.rutland@arm.com, will@kernel.org, rafael@kernel.org, robh@kernel.org, saravanak@google.com, gregkh@linuxfoundation.org, sven@kernel.org, j@jannau.net, suzuki.poulose@arm.com, james.clark@linaro.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_093150_346305_06F0EB4C 
X-CRM114-Status: GOOD (  15.70  )
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
the TRBE driver over to this new method.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/hwtracing/coresight/coresight-trbe.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index 8267dd1a2130d..c512f8faa6012 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -1472,9 +1472,10 @@ static void arm_trbe_remove_cpuhp(struct trbe_drvdata *drvdata)
 static int arm_trbe_probe_irq(struct platform_device *pdev,
 			      struct trbe_drvdata *drvdata)
 {
+	const struct cpumask *affinity;
 	int ret;
 
-	drvdata->irq = platform_get_irq(pdev, 0);
+	drvdata->irq = platform_get_irq_affinity(pdev, 0, &affinity);
 	if (drvdata->irq < 0) {
 		pr_err("IRQ not found for the platform device\n");
 		return drvdata->irq;
@@ -1485,8 +1486,7 @@ static int arm_trbe_probe_irq(struct platform_device *pdev,
 		return -EINVAL;
 	}
 
-	if (irq_get_percpu_devid_partition(drvdata->irq, &drvdata->supported_cpus))
-		return -EINVAL;
+	cpumask_copy(&drvdata->supported_cpus, affinity);
 
 	drvdata->handle = alloc_percpu(struct perf_output_handle *);
 	if (!drvdata->handle)
-- 
2.39.2


