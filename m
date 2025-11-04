Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D982CCFA0C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 15:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yS9MthnOvSPw4tn75MO5dIGfzCweBf0U4W5bg5bZuEA=; b=duywPyiinpcDuBC8Q721UFiZGO
	nes3iH4/Slw9nx9ZokA5J+17yxAGDWVBP8cEuj6vRiRLJiN122ctOQW0hvY1kTCWPbHcfCXjFoauq
	cHt70iMa/5e5+OniKIvR+YkJNZIZet4O4Q04Ce9PLq0UYj9DIIYPArCZ3Jkon1X9SjL/xbvRHsF7t
	HLkGtKwF7yzDNwX5hm63rfDdLgyUXp4KZXnNJaRtw24B3fhUe9/u61p+GjsPq2WUsYHHinbqp+scK
	sZjRlVgVD3qodBnInWJ49HRUPoRtfGy/kMrXLmpx1BOr89vBMUssJzukP0iK+R0DCnilEVt/il2/+
	njVO9d/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGIrp-0000000C3zE-2K1C;
	Tue, 04 Nov 2025 15:22:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGIrl-0000000C3wo-1C1X
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 15:22:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 826F91CE0;
	Tue,  4 Nov 2025 07:22:28 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A6FDC3F66E;
	Tue,  4 Nov 2025 07:22:34 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Tue, 04 Nov 2025 15:21:46 +0000
Subject: [PATCH v4 02/15] coresight: Set per CPU source pointer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251104-arm_coresight_path_power_management_improvement-v4-2-3d4bba674709@arm.com>
References: <20251104-arm_coresight_path_power_management_improvement-v4-0-3d4bba674709@arm.com>
In-Reply-To: <20251104-arm_coresight_path_power_management_improvement-v4-0-3d4bba674709@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762269750; l=1971;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=ciImQ/0ZRoPNCgHkwDr+twvegH8yWYkdKO44bzLhTJ4=;
 b=Mxw4hnS2m7l6YoCV/P5WyrU/L4W10dK6yhCn6iJvbHox/qKomSBavuwD0UmFOAS8TQt6OG0Fg
 rmck3jpkL0PD79ehS1c50DlsouXZkyyfU4EqzDDeuWyy4LoQ7VQUcBY
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_072237_372951_B687519F 
X-CRM114-Status: UNSURE (   9.93  )
X-CRM114-Notice: Please train this message.
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

Introduce coresight_set_percpu_source() for setting CPU source device. The
sources are maintained in a per CPU structure 'csdev_source'.

Reviewed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index db325dff884d21cc8d93f32bfe3be5c0491ffc8d..25a530cde8938b366bbb144fdcc107271ebae276 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -34,6 +34,7 @@
  */
 DEFINE_MUTEX(coresight_mutex);
 static DEFINE_PER_CPU(struct coresight_device *, csdev_sink);
+static DEFINE_PER_CPU(struct coresight_device *, csdev_source);
 
 /**
  * struct coresight_node - elements of a path, from source to sink
@@ -79,6 +80,11 @@ struct coresight_device *coresight_get_percpu_sink(int cpu)
 }
 EXPORT_SYMBOL_GPL(coresight_get_percpu_sink);
 
+static void coresight_set_percpu_source(int cpu, struct coresight_device *csdev)
+{
+	per_cpu(csdev_source, cpu) = csdev;
+}
+
 static struct coresight_device *coresight_get_source(struct coresight_path *path)
 {
 	struct coresight_device *csdev;
@@ -1393,6 +1399,10 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
 			goto out_unlock;
 		}
 	}
+
+	if (coresight_is_percpu_source(csdev))
+		coresight_set_percpu_source(csdev->cpu, csdev);
+
 	/* Device is now registered */
 	registered = true;
 
@@ -1424,6 +1434,8 @@ EXPORT_SYMBOL_GPL(coresight_register);
 
 void coresight_unregister(struct coresight_device *csdev)
 {
+	if (coresight_is_percpu_source(csdev))
+		coresight_set_percpu_source(csdev->cpu, NULL);
 	etm_perf_del_symlink_sink(csdev);
 	/* Remove references of that device in the topology */
 	if (cti_assoc_ops && cti_assoc_ops->remove)

-- 
2.34.1


