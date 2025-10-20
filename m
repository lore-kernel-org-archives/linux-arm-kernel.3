Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12F93CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 12:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DGDDCXeBb8/9iws6ozrJ+dOrR7or/mq+zU0CurMAzTA=; b=fWMkN6BhsUQzVBl8p7mr9EC1BF
	Y3Pydub8D9YTqT0mvdH7hk0e/6RQUMA4ty795BvCJBp+0H1z7nagvYOuYq+xfeyZmx/zxwqrzFlyz
	hPqSjBpMlnZHUAD4ArgoxhOoiHIo+uwJWPqyR33ypl5U5VVbqhuf2wtO4T6Yqb5KEYcvRlHelRYgF
	lpdQxJC9/v26UsqUrtfOw8Ihyk04puq1OerZ+dIMXNIHAVJvfNbYulobnTylqJjYH0DYup9QM0MJm
	RO5DyGnzGy8NjjNUEyTk1d3+Nf7j5ie6PIdbIFbhk/9w/jHBWn+MJeUqDrYV3AkyKDFZAeJDhnSgI
	BD9cz0wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAp2X-0000000DSBn-0fLh;
	Mon, 20 Oct 2025 12:31:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAp1v-0000000DRHd-2Vyd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 12:30:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 47CA74529C;
	Mon, 20 Oct 2025 12:30:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B51EC4CEF9;
	Mon, 20 Oct 2025 12:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760963411;
	bh=zX7lqDoWbyPeNyYwwY3fy1ifM5eVofZ6o0yvdnCCG24=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GkMJoSAjb4S+cUYm06lGp87CcNHwjoxX/lVN+U2sJveh49UH6Cc+GbNSEDWqiGGGi
	 eo3o7Jfh+a/tOpRWd52HElF2FXWXe/q9H4Ehmmu4KGhU/7tcbleeEW1cI9/5QbQ63e
	 tZpFNXKkZ6DK6ra+gBtjl4KRuNDCCvbxxzBpXNLrwVHMrg6GhJi4iji3f2tVgcHUMf
	 uo1n2kLcxUK1WMl78fB6jdF0j//3Dy12NZAw179s/HgpCl729XWmLlUGJ6EjJRDrrF
	 p4jjvZU19E/O9Laep8YDiVW+VXBWby33shSvz9YsPu3ICEhkfQyGtS348Xw+kzeNx6
	 ar3WEwdjnQw0A==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vAp1d-0000000FUu2-1Dkq;
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
Subject: [PATCH v4 07/26] coresight: trbe: Convert to new IRQ affinity retrieval API
Date: Mon, 20 Oct 2025 13:29:24 +0100
Message-ID: <20251020122944.3074811-8-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20251020_053027_748867_F30C878D 
X-CRM114-Status: GOOD (  14.94  )
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

Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Tested-by: Will Deacon <will@kernel.org>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/hwtracing/coresight/coresight-trbe.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index 43643d2c5bdd0..8f17160fec442 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -1474,9 +1474,10 @@ static void arm_trbe_remove_cpuhp(struct trbe_drvdata *drvdata)
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
@@ -1487,8 +1488,7 @@ static int arm_trbe_probe_irq(struct platform_device *pdev,
 		return -EINVAL;
 	}
 
-	if (irq_get_percpu_devid_partition(drvdata->irq, &drvdata->supported_cpus))
-		return -EINVAL;
+	cpumask_copy(&drvdata->supported_cpus, affinity);
 
 	drvdata->handle = alloc_percpu(struct perf_output_handle *);
 	if (!drvdata->handle)
-- 
2.47.3


