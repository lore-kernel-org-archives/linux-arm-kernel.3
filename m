Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E929C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 16:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rEJ4iHuQgWMl+Cr32S21PdKe6roUXboWUOAmd5Iy2lQ=; b=jmoBuYjTLQ6NJDIhQxLorWw006
	pQ6BRhk5MePW11b8+/UNxJC+lQ1TtoW/Vm4NL665wa887LpIM2cuERLoak7A7xnYH0mG77o+g3TZW
	66uFt8hFaI/ox2SV+14kVyqd2nztpiIhHb5UF476JzrIEUBvZOrdKn6GvBVu4T1N5Zv63NFDM2V0B
	F3AgafVwY1kCr4BrtyWG0ZUlitLB8On6BCMdu3YM3fIKILHsvR8nWJ4RXS0o4BVFqj/xb/dFzgSBn
	h5EdRXuVnmY8Uj4Op7bTMzPruc+Hp8wNxKauYYS9JSJnQ2hm34v2pUifTIfVWcSfENp2ejWamfZFy
	ZJbv7+QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWeIq-000000068Tl-0dmE;
	Tue, 01 Jul 2025 16:57:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWcNI-00000005mpw-31a1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 14:54:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 10FDE12FC;
	Tue,  1 Jul 2025 07:54:05 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 560F83F66E;
	Tue,  1 Jul 2025 07:54:18 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Tue, 01 Jul 2025 15:53:38 +0100
Subject: [PATCH v2 13/28] coresight: Set per CPU source pointer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-arm_cs_pm_fix_v3-v2-13-23ebb864fcc1@arm.com>
References: <20250701-arm_cs_pm_fix_v3-v2-0-23ebb864fcc1@arm.com>
In-Reply-To: <20250701-arm_cs_pm_fix_v3-v2-0-23ebb864fcc1@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Levi Yun <yeoreum.yun@arm.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>, 
 Yuanfang Zhang <quic_yuanfang@quicinc.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751381627; l=1922;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=4m7eT5tfhZOLfAcGb/o9rljKjvvedBRVjxFwdOLgSqI=;
 b=7qpgAmLoyoY7ovI70BZmdSIYYa9Jq+O6UeTZHDqhzWy+2tWL6H5heDIZz+p9ab/Vmza9ELq37
 BMa+4vW1I9SCXCtHXHs+gnzu9MDpVa20WJAhwBN9OFcIriTS6B9uDTf
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_075420_802000_F3F6760E 
X-CRM114-Status: GOOD (  10.36  )
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
index 1a4bde5d6cd8fcfdd43bcafb45aa4dc5f1dd2d34..042e8e646ff521a15dc18d7264faa427f1ac0dc7 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -32,6 +32,7 @@
  */
 DEFINE_MUTEX(coresight_mutex);
 static DEFINE_PER_CPU(struct coresight_device *, csdev_sink);
+static DEFINE_PER_CPU(struct coresight_device *, csdev_source);
 
 /**
  * struct coresight_node - elements of a path, from source to sink
@@ -77,6 +78,11 @@ struct coresight_device *coresight_get_percpu_sink(int cpu)
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
@@ -1390,6 +1396,10 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
 			goto out_unlock;
 		}
 	}
+
+	if (coresight_is_percpu_source(csdev))
+		coresight_set_percpu_source(csdev->cpu, csdev);
+
 	/* Device is now registered */
 	registered = true;
 
@@ -1421,6 +1431,8 @@ EXPORT_SYMBOL_GPL(coresight_register);
 
 void coresight_unregister(struct coresight_device *csdev)
 {
+	if (coresight_is_percpu_source(csdev))
+		coresight_set_percpu_source(csdev->cpu, NULL);
 	etm_perf_del_symlink_sink(csdev);
 	/* Remove references of that device in the topology */
 	if (cti_assoc_ops && cti_assoc_ops->remove)

-- 
2.34.1


