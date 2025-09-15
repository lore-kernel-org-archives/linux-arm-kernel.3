Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA46CCAC59C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 10:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NFyuQ4D/uMtDKROby9XSkWZ1paMYH+Nh4qLo7Yhz3Bs=; b=LQF1UyfPF5L8r7xgKh87N/m1lH
	LRNkZPF2B49NnMq6QX7HSGYTVm0vPYICpewyaak56SMQQ4sLiXMrLPLW/tqtz7w1toBMm3VZffjl0
	sErPcOuLmoV+WcfWRNm70qDxrfMF7Cee0UYX7AqlbpMnGIdSjvyKRrfMNjOZa8PqTHSXZ9eQALDhc
	SwItUzkcvoYEwckqdWguHfNYwnsyEb3caGchopejjr3GpJwUqiJlEPYoS+RaiA10svF1pKgpOmHF9
	khXw4jltqnULZQsdMgRaOvqkjN8b/g4sMT0UaNoSaWYSB0NBjBJ0H0085QxjvEO/xmnrfFX8NBXp4
	jsetLjwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6XL-00000003fsA-02bp;
	Mon, 15 Sep 2025 10:34:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6XC-00000003fiB-3MbX
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 15 Sep 2025 10:34:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=NFyuQ4D/uMtDKROby9XSkWZ1paMYH+Nh4qLo7Yhz3Bs=; b=DVej27QFSvx1G13J5Cw2QUy/QE
	pskMxlMg5K6LjtB+YmDm6zWttJVcn9iY3HC6YFgC4JuqxactfH5i4lUioIbyNEPERXEHAEji4nJJ/
	lskQp1FEvrWcY9xnzj9hy+yqrOZ1r560wKGXrm25enBBJt5SRdfP/vBmPUuzJ/odZAwMtDR/PyY7V
	wEthxZC2OYaT31nytRRHY7EDH6K1tF+V0FT10mrVQcF+rfJ03Wj8LP+NSMCVtsLVKLTwG6O9oqbBL
	xnvnQmXaL8bV+pu23JrN8GUMqUw4PQ7FR3u8lBOFRdy7SCVdJkSYzIN30NCCEkHu7D6KfXVuNoKf8
	vrd8Bycw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6X9-00000006vXF-2vG1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 10:34:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9B8A11BF7;
	Mon, 15 Sep 2025 03:33:58 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3EA3A3F66E;
	Mon, 15 Sep 2025 03:34:05 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 15 Sep 2025 11:33:36 +0100
Subject: [PATCH v3 13/31] coresight: Set per CPU source pointer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250915-arm_coresight_power_management_fix-v3-13-ea49e91124ec@arm.com>
References: <20250915-arm_coresight_power_management_fix-v3-0-ea49e91124ec@arm.com>
In-Reply-To: <20250915-arm_coresight_power_management_fix-v3-0-ea49e91124ec@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757932420; l=1922;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=LQu0VFG5v0mLzppstjBDJtGpzi+DEl1wdBU++zw9vbA=;
 b=NZr6yB/79Ewo7lb2AiPT8CF7Dgr6v+x4MoPSXrLXv8uXtdJPtydt36aFPdskGcixUKKjF/Ipz
 NwBu2tsw1VtA26CiPQO/M+wmhoooj/B5r3Iyd+KumYCOLFq+AwlYkFw
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_113408_035889_095B7F9A 
X-CRM114-Status: GOOD (  10.17  )
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


