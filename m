Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BE85C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Jul 2026 11:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HWvLw4n6LAKjbvQUMSH6hgN/I8yta9PINHCj2hZRP7c=; b=zC6HgGw/osU3L4vTUWrtroy1Qn
	9vMVcdCX6gAKl+InJRVIWUdYgo5koY86dR9a9CKlMQwijJ3XcFtNQvNkMgNzXAxm1nASUpcWDwLWg
	ZovU53TYcgeh+Vi2tbXMNb78lXG3GTMo9krJvLg1cNp97KtpToTb4eh84Tdx2KjaVcgEGIq9C6BWH
	RRcy8dXfTJXqfQXwiiK7O8GZ/MupGg5VxRyjyCyPS69hr69qpxYf/d6o490HktO7lG5ZYbvKKENk5
	rm/w93Sy000b+fg8AquEeZc5aA91j7BRqE6CfR7q493bTKUKp4jRCzSAziqflOLKTcTNTJSqzmjYg
	NdbZMlcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnah6-00000000IRE-0qRM;
	Sat, 25 Jul 2026 11:37:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnagy-00000000ILG-03iH
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Jul 2026 11:37:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D63871A9A;
	Sat, 25 Jul 2026 04:37:12 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7184F3F86F;
	Sat, 25 Jul 2026 04:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784979436; bh=uc+Z6a0PVB/ia4S0bITwPuYxjRsDEDME8Yx0cfaGsRw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mz+B2HYDvTEO9e6Ms3tCfMzs+6RrVH8V+ZUgK/+nB31YsJhCF8ti7cH7q76WyTnq4
	 8PXBpqIJKjta2oMppJqfTDai8r8aPPmS0PwFaPpmYCo5BP/acE7HS3pmGeeuL3QzQl
	 X4la/vsBwwQx6KAgpq3s5Y3oZONgv+odSmPe9gvE=
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
Subject: [PATCH v9 08/13] coresight: etm3x: remove redundant cpu online check on etm_enable_sysfs()
Date: Sat, 25 Jul 2026 12:36:40 +0100
Message-ID: <20260725113645.57519-9-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260725113645.57519-1-yeoreum.yun@arm.com>
References: <20260725113645.57519-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260725_043720_422826_D6003C3D 
X-CRM114-Status: GOOD (  12.23  )
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

cpu online() check is done in coresight_validate_source_sysfs() already.
and smp_call_function_single() will fail when cpu is offline.

Therefore, remove redundant check in etm_enable_sysfs().

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 .../coresight/coresight-etm3x-core.c          | 31 ++++++++-----------
 1 file changed, 13 insertions(+), 18 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
index 7a1e183c0b48..14e0724a43a1 100644
--- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
@@ -519,25 +519,20 @@ static int etm_enable_sysfs(struct coresight_device *csdev, struct coresight_pat
 	struct etm_enable_arg arg = { };
 	int ret;
 
-	/*
-	 * Configure the ETM only if the CPU is online.  If it isn't online
-	 * hw configuration will take place on the local CPU during bring up.
-	 */
-	if (cpu_online(drvdata->cpu)) {
-		arg.drvdata = drvdata;
-		arg.path = path;
-
-		raw_spin_lock(&drvdata->spinlock);
-		arg.config = drvdata->config;
-		raw_spin_unlock(&drvdata->spinlock);
-
-		ret = smp_call_function_single(drvdata->cpu,
-					       etm_enable_sysfs_smp_call, &arg, 1);
-		if (!ret)
-			ret = arg.rc;
-	} else {
+	arg.drvdata = drvdata;
+	arg.path = path;
+
+	raw_spin_lock(&drvdata->spinlock);
+	arg.config = drvdata->config;
+	raw_spin_unlock(&drvdata->spinlock);
+
+	ret = smp_call_function_single(drvdata->cpu,
+				       etm_enable_sysfs_smp_call, &arg, 1);
+
+	if (!ret)
+		ret = arg.rc;
+	else
 		ret = -ENODEV;
-	}
 
 	if (!ret)
 		dev_dbg(&csdev->dev, "ETM tracing enabled\n");
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


