Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82D0BC4450A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 14:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Wr462XtGgX1my4l1561xtJMdx+4bahO1ClQS2sks7U=; b=tT9lYWY/CB1ZFW62O9zqZ0jx2+
	g635aOrTQve10b24Cl99rD25RQ0sxs1mqfXveMBCVy7khPD8p4Danz1bgWhISCedC8VAWUVVlykmV
	O6aU0/MlB6if3uYjSmGqGM8Q/98ttEv5qNlbAUKOZZtfIkkzOnC/WqfkiIIThsTjSpcV9pxaVX+Ev
	qxFKTKU83xUeGKfQAGlHZx5LXU1G6QxGrtBsNwJ0AcsqLoaGaH+QHr2PrVQL6OtjFACEGWd8SHhCN
	09xxn35fZrbTD/nXx2WZDGVpZaCyfe1YQ/0JECgA44QxyhguwiCMwe39PZ0P9x4PySOsTaf0ahFTe
	HooziVyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkNWI-0000000HYa9-1LeZ;
	Thu, 16 Jul 2026 14:57:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkNW8-0000000HYVp-0tT3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 14:56:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CA32C168F;
	Thu, 16 Jul 2026 07:56:46 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0329B3F7B4;
	Thu, 16 Jul 2026 07:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784213811; bh=Q9arXXauN4GVB8Ak/vT3fe4bjkQnGWjRmuD+Jz/T9SI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fI7mf3kzLxo6w/1wD0KoNeQan67ZPRAiUGDDosXpRUMREtCx+/NR+427pYecT3IG0
	 5hhgicBKmi3QclxCy9dziihQOw3Ibtymhibbgs2vOGiUB5Z9prmCqRfwNKoAfGDbz0
	 z51BKp+X/3cCe3wSCy4Kl7NIN5gVt8G+x3JElL0w=
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org,
	mark.rutland@arm.com,
	catalin.marinas@arm.com
Cc: ilkka@os.amperecomputing.com,
	bwicaksono@nvidia.com,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org
Subject: [PATCH v2 3/4] perf/arm_cspmu: Improve sub-module error reporting
Date: Thu, 16 Jul 2026 15:56:36 +0100
Message-ID: <256bcb4c8c98dc95bfdf295adb66b917545c919b.1784213435.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.54.0.dirty
In-Reply-To: <cover.1784213435.git.robin.murphy@arm.com>
References: <cover.1784213435.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_075652_298656_9D1CFC1C 
X-CRM114-Status: GOOD (  10.31  )
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

When waiting for a sub-module to register, we return a bare
-EPROBE_DEFER that ends up showing the end user:

  platform arm-cs-arch-pmu.1: deferred probe pending (no reason)

wherein it's not necessarily clear that they might need to take some
action to ensure the appropriate module is available to load. Let's use
dev_err_probe() here so we can show exactly what we're waiting for.

Similarly, in the case where something's gone horribly wrong with an
already-registered module, we can use dev_WARN() to standardise the
device/driver attribution rather than just open-coding "arm_cspmu".

Reviewed-by: Ilkka Koskinen <ilkka@os.amperecomputing.com>
Signed-off-by: Robin Murphy <robin.murphy@arm.com>

---
v2: No change
---
 drivers/perf/arm_cspmu/arm_cspmu.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/perf/arm_cspmu/arm_cspmu.c b/drivers/perf/arm_cspmu/arm_cspmu.c
index 8c2dda17d73e..caad9a36651d 100644
--- a/drivers/perf/arm_cspmu/arm_cspmu.c
+++ b/drivers/perf/arm_cspmu/arm_cspmu.c
@@ -437,13 +437,15 @@ static int arm_cspmu_init_impl_ops(struct arm_cspmu *cspmu)
 				if (ret)
 					module_put(match->module);
 			} else {
-				WARN(1, "arm_cspmu failed to get module: %s\n",
+				dev_WARN(cspmu->dev, "Failed to get module: %s\n",
 					match->module_name);
 				ret = -EINVAL;
 			}
 		} else {
 			request_module_nowait(match->module_name);
-			ret = -EPROBE_DEFER;
+			ret = dev_err_probe(cspmu->dev, -EPROBE_DEFER,
+					    "Waiting for module %s to load\n",
+					    match->module_name);
 		}
 
 		mutex_unlock(&arm_cspmu_lock);
-- 
2.54.0.dirty


