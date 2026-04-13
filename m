Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDE0AF34C56
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 14:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t/ITGBXb+6JlYkoLiD/k8mytDZiFQsgnSbtwtNFX5Zk=; b=FAbL4yl2NQNXrN0plJhcXIYQtb
	rwUNfgEb6RZwuQCh7X/DDLI77tzo1R53MG7h+9nDWrHEvvTQMf0wV+h4cTog5MDBKFcwmmhjJMTv7
	dx1Pr8tbeUKSajP/cXzuTS6oW1OIYYoCxbrNN0fLfWW+kRNowEb9eXVtHJmgf/1yZd3A1knXPXjOw
	jCiaS3GBa2VkoEpOk/Lk4Ee8YvDocpsE4IKZe5/00M3gY8jbMWNBQY8G+n+uvTZmUdEY5qNQoX7Kj
	ehq53Ud4hIrf4qh6JtP5qODils7LjJEN1ZDRXI7V2CSF6t8qFmoUfkppjIRt7C5z39Z8CCz5EcbS0
	qsOjPBzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCI9G-0000000FqZZ-1WVH;
	Mon, 13 Apr 2026 14:20:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCI9A-0000000FqV2-3gr7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 14:20:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 948D0359A;
	Mon, 13 Apr 2026 07:20:10 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BCE963F641;
	Mon, 13 Apr 2026 07:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776090016; bh=c0st7JybrwCZbZ8ZJ6QIDs3+mz+WSuu30vMH4RaKehk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jRDdbwj09g2nOAbY8vKdO6xBXiPxmAs6Q5gxqxJEv1cJ/hdJyYFz+OgDX2boLBlUx
	 /ZtVO1XdH+fttfXeR1FNSWY+v+YxL7T2HggzQ141uCv2QBXGyI+xdMTZ5SlNAz2wcM
	 tjBQc1eyuueY5+1icJ7QJ2Y9Kutji/uxtXxfJSNs=
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: suzuki.poulose@arm.com,
	mike.leach@arm.com,
	james.clark@linaro.org,
	alexander.shishkin@linux.intel.com,
	leo.yan@arm.com,
	jie.gan@oss.qualcomm.com,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH v4 5/9] coresight: etm4x: remove redundant call etm4_enable_hw() with hotplug
Date: Mon, 13 Apr 2026 15:19:58 +0100
Message-Id: <20260413142003.3549310-6-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260413142003.3549310-1-yeoreum.yun@arm.com>
References: <20260413142003.3549310-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_072016_962390_15C328F2 
X-CRM114-Status: UNSURE (   9.83  )
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

The cpu_online_mask is set at the CPUHP_BRINGUP_CPU step.
In other words, if etm4_enable_sysfs() is called between
CPUHP_BRINGUP_CPU and CPUHP_AP_ARM_CORESIGHT_STARTING,
etm4_enable_hw() may be invoked in etm4_enable_sysfs_smp_call()
and then executed again in etm4_starting_cpu().

To remove this redundant call, take the hotplug lock before executing
etm4_enable_sysfs_smp_call().

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 01099689525b..facd5a306228 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -959,8 +959,20 @@ static int etm4_enable_sysfs(struct coresight_device *csdev, struct coresight_pa
 	arg.config = drvdata->config;
 	raw_spin_unlock(&drvdata->spinlock);
 
+	/*
+	 * Take the hotplug lock to prevent redundant calls to etm4_enable_hw().
+	 *
+	 * The cpu_online_mask is set at the CPUHP_BRINGUP_CPU step.
+	 * In other words, if etm4_enable_sysfs() is called between
+	 * CPUHP_BRINGUP_CPU and CPUHP_AP_ARM_CORESIGHT_STARTING,
+	 * etm4_enable_hw() may be invoked in etm4_enable_sysfs_smp_call()
+	 * and then executed again in etm4_starting_cpu().
+	 */
+	cpus_read_lock();
 	ret = smp_call_function_single(drvdata->cpu,
 				       etm4_enable_sysfs_smp_call, &arg, 1);
+	cpus_read_unlock();
+
 	if (!ret)
 		ret = arg.rc;
 	if (!ret)
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


