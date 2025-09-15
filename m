Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 679C2CAC59B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 08:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ic9o+VndUXPRx8kTEScNKikd2uC1KP5uDpqoGdmWmrU=; b=OwS69OipKRoAj45LBa/ebKVP4e
	ehkZAlvHeGtVMtgd8BLSlnuSOu2foA9eoVYm8Rs18kRs6fOMfI7TXo1Sc0yF0fGpy4rlhTS9lgoCa
	A9i1X3le5RcRtjrSF9H5va4zFqVPADEZoxi3IVix2nHmhaMNKJOTff//5NcQhuLzKuldt/+Xr36z3
	DUf/P9TRv+iIP+f9kV1Kxc6kCJ4abLPr8HbZEBnOqF/WDq9TEO9J03/2OcUG4+CkvFNhM1tFtHMVa
	60vDQS0tetwAU3LnV3n3c0CQ43zyQKe737ccDb7CbRhq1yudVoOfc01Anpd0rdTKJLP5VyhH83729
	X21rqZyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy51a-00000003J9T-14tV;
	Mon, 15 Sep 2025 08:57:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy51Q-00000003IyJ-2g9o
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 08:57:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E771F44804;
	Mon, 15 Sep 2025 08:57:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C74A6C4CEF1;
	Mon, 15 Sep 2025 08:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757926634;
	bh=jQHOrUvrdulPrMOQtn05zaOApqc5lhkt4nBzVAEvlWw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mhEZNaJCOef+kjuudwquagxii3vPQdIanoRj6OFfUnBUUlN8fm1rbJPQ9S/BKrvQ5
	 Zp9O5ZOgux068/m4Ixy7HyArw1cavqKQCIG38Ty619Yol5Zrpg9fcoHnpiSutswoEP
	 ZhDyAmdGgCwSHjwH3sboQ6OpDdH0E4elI7JagqhJjLI53VC2RTjb8Kqyq8VUaDSZgV
	 ts6gu2rdjlmbLjaRoL7cmjuVkxlfhkI0LTSEi4w5vHM8nEU2+7kJ+5Ll21n2HS6b0i
	 tGNT0O39khZcX2QW0P2fgLQfe3cZ7uehBs4plY/jSX62UgLhJCd2pFoxO3mhpaHt07
	 0Gmrl39nppT7g==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1uy51M-00000006IHP-3uqQ;
	Mon, 15 Sep 2025 08:57:12 +0000
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
Subject: [PATCH v2 07/25] coresight: trbe: Convert to new IRQ affinity retrieval API
Date: Mon, 15 Sep 2025 09:56:44 +0100
Message-Id: <20250915085702.519996-8-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250915085702.519996-1-maz@kernel.org>
References: <20250915085702.519996-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org, tglx@linutronix.de, mark.rutland@arm.com, will@kernel.org, rafael@kernel.org, robh@kernel.org, saravanak@google.com, gregkh@linuxfoundation.org, sven@kernel.org, j@jannau.net, suzuki.poulose@arm.com, james.clark@linaro.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_015716_749121_37853E8F 
X-CRM114-Status: GOOD (  15.49  )
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


