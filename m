Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAC3ACD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 20:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+7D4HuLU5CPWyZYpKzCNZItt/8oOurC/Phfc9TXEdZo=; b=V1YDdupDcOGMOVnfjsCAv+X4a6
	doUiB5fh/l5leKdiVUSTL3wC6M0Zuv94LON9wPb0bgvGfBW+aJhBR0KAsKz+Jr2gUkaYzqLhhY1Ip
	LQHFq1lVJNYNCo1qkEgivLqoPR0DtD1tdJwCxUqS90ed1tq252sWCnjsMJ21zmeemXn+VBqgVF3TC
	qcjjNEFJDl/Pvh75JPr5tBkuKplj48L2J+DCz0pV+9vub6m4AIcjrjX9TsPSSiRjdWh+DVWuynO9Y
	fWAtyL8poEcs062EADLIuWLIHYfayZ1kJ6Z0viWLEb8Prplt48/pBwFFWJ95UDvgUK+R/WF5jBT6z
	k7FG2WoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNyr6-00000009JrU-2AFC;
	Fri, 15 May 2026 20:09:56 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNyqv-00000009Jfw-0faa
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 15 May 2026 20:09:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=+7D4HuLU5CPWyZYpKzCNZItt/8oOurC/Phfc9TXEdZo=; b=X61er3es6P0v0hpfzPWaOHa14D
	N8TqB4nlmQxQvAqI3zMW1Yxz0PzukCAwXh7MdpyhkfzLRBMrNtB8xLiCgPnoh0a/yx2fcLfuKxoSp
	pSvMxeRderIA9cZ5HF5ho1YESXgbg78poC93HmFMar1EWy2vKClmBjOOzbbxO+SnoN7Q7xt7sSOeu
	LwbZLhBnZQUhxBRV7UJLP/aVhsbDJIGIFUNsv99/qR6K90GDkcz3B5bHpnpluObJmCL/WfBeh3yna
	DrYmZ3aTg3KGCC/HbKZIgQ3iAAYflyP320U2JZQb12f7zP0YTJDKg0np1pLQFPH6Au+8GS13VEThm
	XUoD5F3A==;
Received: from foss.arm.com ([217.140.110.172])
	by casper.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNyqs-000000020Cv-0dm7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 20:09:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3701B35ED;
	Fri, 15 May 2026 13:09:35 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 975273F836;
	Fri, 15 May 2026 13:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778875780; bh=348bECp0Nts7S81G76y7tSi/f8D2zR3BAxZEcnwFwxs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=tDq1nNymcuA9CjAtypOqf3FbZj6ahgMpQO9aaR/d0ox45UP8tc0TYdLCiZNohaG5T
	 oWQMgMhQ4DwoUdZrwp0uLmGOOCAZy8Wpz34V7e31mwVjQJMCJjNJv0heLNFHdBVLSo
	 EWv4wm5nhGdMiS8u4tYuHrdOT6SK9apiYLakqDnk=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 15 May 2026 21:08:31 +0100
Subject: [PATCH v14 24/28] coresight: Add PM callbacks for sink device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-arm_coresight_path_power_management_improvement-v14-24-f88c4a3ecfe9@arm.com>
References: <20260515-arm_coresight_path_power_management_improvement-v14-0-f88c4a3ecfe9@arm.com>
In-Reply-To: <20260515-arm_coresight_path_power_management_improvement-v14-0-f88c4a3ecfe9@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
 Will Deacon <will@kernel.org>, Yabin Cui <yabinc@google.com>, 
 Keita Morisaki <keyz@google.com>, Jie Gan <jie.gan@oss.qualcomm.com>, 
 Yuanfang Zhang <quic_yuanfang@quicinc.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Tamas Petz <tamas.petz@arm.com>, Thomas Gleixner <tglx@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778875700; l=4031;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=348bECp0Nts7S81G76y7tSi/f8D2zR3BAxZEcnwFwxs=;
 b=nQ9wodqt5M4yhWNGwp5aUIU5JaQkOckviPB5pCgbzSSa2XsQQQLGeE8BMIGD4a75TgrV+iR/C
 69/4c2+wrDSDkNR13UZR6E7kyJ7FBsbk7y/WqtZ2zmRLAC3bvEODzUo
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_210942_646426_FEDCB814 
X-CRM114-Status: GOOD (  18.35  )
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

Unlike system level sinks, per-CPU sinks may lose power during CPU idle
states.  Currently, this applies specifically to TRBE.  This commit
invokes save and restore callbacks for the sink in the CPU PM notifier.

If the sink provides PM callbacks but the source does not, this is
unsafe because the sink cannot be disabled safely unless the source
can also be controlled, so veto low power entry to avoid lockups.

Tested-by: James Clark <james.clark@linaro.org>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: James Clark <james.clark@linaro.org>
Tested-by: Jie Gan <jie.gan@oss.qualcomm.com>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 35 ++++++++++++++++++++++++++--
 1 file changed, 33 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index fc60b72a4abff9f217d48165bdb3f38a621906e7..e3de4b388372a4600cfa349452bffacfa0c755a7 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1874,7 +1874,7 @@ static struct coresight_path *coresight_cpu_get_active_path(void)
 /* Return: 1 if PM is required, 0 if skip, or a negative error */
 static int coresight_pm_is_needed(struct coresight_path *path)
 {
-	struct coresight_device *source;
+	struct coresight_device *source, *sink;
 
 	if (this_cpu_read(percpu_pm_failed))
 		return -EIO;
@@ -1883,7 +1883,8 @@ static int coresight_pm_is_needed(struct coresight_path *path)
 		return 0;
 
 	source = coresight_get_source(path);
-	if (!source)
+	sink = coresight_get_sink(path);
+	if (!source || !sink)
 		return 0;
 
 	/* pm_save_disable() and pm_restore_enable() must be paired */
@@ -1891,16 +1892,35 @@ static int coresight_pm_is_needed(struct coresight_path *path)
 	    coresight_ops(source)->pm_restore_enable)
 		return 1;
 
+	/*
+	 * It is not permitted that the source has no callbacks while the sink
+	 * does, as the sink cannot be disabled without disabling the source,
+	 * which may lead to lockups. Fix this by enabling self-hosted PM
+	 * mode for ETM (see etm4_probe()).
+	 */
+	if (coresight_ops(sink)->pm_save_disable &&
+	    coresight_ops(sink)->pm_restore_enable) {
+		pr_warn_once("coresight PM failed: source has no PM callbacks; "
+			     "cannot safely control sink\n");
+		return -EINVAL;
+	}
+
 	return 0;
 }
 
 static int coresight_pm_device_save(struct coresight_device *csdev)
 {
+	if (!csdev || !coresight_ops(csdev)->pm_save_disable)
+		return 0;
+
 	return coresight_ops(csdev)->pm_save_disable(csdev);
 }
 
 static void coresight_pm_device_restore(struct coresight_device *csdev)
 {
+	if (!csdev || !coresight_ops(csdev)->pm_restore_enable)
+		return;
+
 	coresight_ops(csdev)->pm_restore_enable(csdev);
 }
 
@@ -1919,15 +1939,24 @@ static int coresight_pm_save(struct coresight_path *path)
 	to = list_prev_entry(coresight_path_last_node(path), link);
 	coresight_disable_path_from_to(path, from, to);
 
+	/*
+	 * Save the sink. Most sinks do not implement a save callback to avoid
+	 * latency from memory copying. We assume the sink's save and restore
+	 * always succeed.
+	 */
+	coresight_pm_device_save(coresight_get_sink(path));
 	return 0;
 }
 
 static void coresight_pm_restore(struct coresight_path *path)
 {
 	struct coresight_device *source = coresight_get_source(path);
+	struct coresight_device *sink = coresight_get_sink(path);
 	struct coresight_node *from, *to;
 	int ret;
 
+	coresight_pm_device_restore(sink);
+
 	from = coresight_path_first_node(path);
 	/* Enable up to the node before sink */
 	to = list_prev_entry(coresight_path_last_node(path), link);
@@ -1940,6 +1969,8 @@ static void coresight_pm_restore(struct coresight_path *path)
 	return;
 
 path_failed:
+	coresight_pm_device_save(sink);
+
 	pr_err("Failed in coresight PM restore on CPU%d: %d\n",
 	       smp_processor_id(), ret);
 

-- 
2.34.1


