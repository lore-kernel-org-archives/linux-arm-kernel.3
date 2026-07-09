Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 810ABC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 14:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ahq+Em5VvpHKduZs+ErvBvfi+Vz3ksF9THllhSwJjq0=; b=hFFDIu8ub0+eAr1+BeRwHCQvGk
	WM3U4T7zfycy++gRpBrQWaMA0JyDelVDKogovXvUMiKSwiiNdtwPxBzhjhvYvc+E9JLnwJ+7AoR0W
	QI6+3Geewv+yotsacZTHeFOO7AQVxs1iWXxVvQL8OYP21a9P6rgwgq/6OuvUe2vMH/9odw9QG+ZTZ
	0MSLeWSne8MgwHFjhNURPlkiYhWJhVAWe6aB/dU5NXEv/lsloOKoe6gYQPB5keTPV+ytqhN3U5aNV
	OoMNpTpjJJBL9+b/PBhKkh/YovFgBCcgHEzdwwxqkhlRmBFMPBdBktEl92LJmK9UwMtCzR9OzQJnt
	4arbQPRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whpvG-00000002npt-0ddU;
	Thu, 09 Jul 2026 14:40:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whpvB-00000002nmm-0bkl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 14:40:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BD1433593;
	Thu,  9 Jul 2026 07:40:07 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CB6D13F66F;
	Thu,  9 Jul 2026 07:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783608012; bh=dTWZAhXUg/zIANpVE145MggYBDQAbM1dZ1/YXMvvVOc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=b2gLKjz3lHVUVmjhx6a7QM3yzxS7NX/9h9oX8hx/y4KIsHg86VbbkfpRW7xbKJQkG
	 dTLmP7Q3tgsFtMOmaxDae0OeHhBg+88hTTFRc01SJYGEQf73jJ+xjwlv47lOceV9yQ
	 nP61o3K89S2tygk9//p5Uh0lgaSrtTzFrK4jH79E=
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org,
	mark.rutland@arm.com,
	catalin.marinas@arm.com
Cc: ilkka@os.amperecomputing.com,
	bwicaksono@nvidia.com,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org
Subject: [PATCH 3/4] perf/arm_cspmu: Improve sub-module error reporting
Date: Thu,  9 Jul 2026 15:39:55 +0100
Message-ID: <f8bdaf6c3f0ec2be905e43766410177d3c409690.1783605641.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.54.0.dirty
In-Reply-To: <cover.1783605641.git.robin.murphy@arm.com>
References: <cover.1783605641.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_074013_269903_8BEC0065 
X-CRM114-Status: GOOD (  10.37  )
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

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/perf/arm_cspmu/arm_cspmu.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/perf/arm_cspmu/arm_cspmu.c b/drivers/perf/arm_cspmu/arm_cspmu.c
index 0570be74d11f..0b26a1588eba 100644
--- a/drivers/perf/arm_cspmu/arm_cspmu.c
+++ b/drivers/perf/arm_cspmu/arm_cspmu.c
@@ -438,13 +438,15 @@ static int arm_cspmu_init_impl_ops(struct arm_cspmu *cspmu)
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


