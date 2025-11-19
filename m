Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D76E3CF3941
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 15:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ui9hVtBOnZvHpg1WzjTFn8zOeqtN+NyGsaSIzrj5D7M=; b=CEsDYNLhqIbWSfmQfFmZam9p7o
	hWEa0bzLvUSNPpWFms2soWLID4bVZnGYY96oSpJkOFd/BAG4/soX9cCqF96Ku0ObM7g+V7+2kca5u
	5l84RIQNGuBprPBw2PX+pFR5BIyiep1eWPJd/Ex6aGJF8cpRUj+FwPj/HTNYnABZTuABvfa6mvJXe
	qg8LI0xgfRLh2ko4m0LMeknMTEnlpmzCHv3EPR1RFNdpKe0CRNVpEwsViQDmJdU4UHAVNHFqwoXcc
	X/9HFNWDxrBbQAOdkhMK9aZuCMImkqXC9vfnzzlOYOsNqPs9Xxz0ooGXrStfI7edtXrslqsMkQ+nq
	0BP2xQfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkR8-00000003Yp8-0wXx;
	Wed, 19 Nov 2025 15:49:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkR0-00000003Yjy-1WzV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 15:49:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 93C9CFEC;
	Wed, 19 Nov 2025 07:49:21 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8FFD23F66E;
	Wed, 19 Nov 2025 07:49:27 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Wed, 19 Nov 2025 15:49:00 +0000
Subject: [PATCH v5 02/19] coresight: Set per-CPU source pointer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-arm_coresight_path_power_management_improvement-v5-2-f615a301ad0b@arm.com>
References: <20251119-arm_coresight_path_power_management_improvement-v5-0-f615a301ad0b@arm.com>
In-Reply-To: <20251119-arm_coresight_path_power_management_improvement-v5-0-f615a301ad0b@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>, 
 Yuanfang Zhang <quic_yuanfang@quicinc.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763567363; l=2442;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=EiqI/dIcPZzoKbNDR1qIufBw8ujI7PvLxfvi/Qy5UXs=;
 b=PXmMnyGjPiM63aD1vARAv5CdbDL7oW+UNEmPE7Ypd4Hkl1pgFzpYK1a4lE6duahVLDEJXSTwz
 lJgeDGoxSWTBPkK/KRcCHpdZAfhs5fFTNJt6bDZDAedK3DuF3Eq6bMG
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_074930_545665_40BB2B5C 
X-CRM114-Status: GOOD (  12.45  )
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

Add coresight_set_percpu_source() to set the CPU source device.  Source
devices are stored in the per-CPU structure csdev_source.

When the CPU is online, set the per-CPU pointer on the local CPU to
avoid race conditions between setting and fetching the same pointer.

Reviewed-by: Mike Leach <mike.leach@linaro.org>
Tested-by: James Clark <james.clark@linaro.org>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 0c48f5c85db6a7ec0377335eaa734527959d57c4..f22fd89f29b97ffe7004a2c988b09d5fd412af8d 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -34,6 +34,7 @@
  */
 DEFINE_MUTEX(coresight_mutex);
 static DEFINE_PER_CPU(struct coresight_device *, csdev_sink);
+static DEFINE_PER_CPU(struct coresight_device *, csdev_source);
 
 /**
  * struct coresight_node - elements of a path, from source to sink
@@ -79,6 +80,22 @@ struct coresight_device *coresight_get_percpu_sink(int cpu)
 }
 EXPORT_SYMBOL_GPL(coresight_get_percpu_sink);
 
+static void coresight_set_percpu_source_local(void *csdev)
+{
+	this_cpu_write(csdev_source, csdev);
+}
+
+static void coresight_set_percpu_source(int cpu, struct coresight_device *csdev)
+{
+	cpus_read_lock();
+	if (cpu_online(cpu))
+		smp_call_function_single(cpu, coresight_set_percpu_source_local,
+					 csdev, 1);
+	else
+		per_cpu(csdev_source, cpu) = csdev;
+	cpus_read_unlock();
+}
+
 static struct coresight_device *coresight_get_source(struct coresight_path *path)
 {
 	struct coresight_device *csdev;
@@ -1397,6 +1414,10 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
 			goto out_unlock;
 		}
 	}
+
+	if (coresight_is_percpu_source(csdev))
+		coresight_set_percpu_source(csdev->cpu, csdev);
+
 	/* Device is now registered */
 	registered = true;
 
@@ -1428,6 +1449,8 @@ EXPORT_SYMBOL_GPL(coresight_register);
 
 void coresight_unregister(struct coresight_device *csdev)
 {
+	if (coresight_is_percpu_source(csdev))
+		coresight_set_percpu_source(csdev->cpu, NULL);
 	etm_perf_del_symlink_sink(csdev);
 	/* Remove references of that device in the topology */
 	if (cti_assoc_ops && cti_assoc_ops->remove)

-- 
2.34.1


