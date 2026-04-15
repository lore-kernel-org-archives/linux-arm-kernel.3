Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDA02F43848
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 16:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dnfKYi0dOWMJdbUjuwPPxscgjg63xAF2RMyVBxA5/2s=; b=jpwlkCIsSgrO5GNgBu1kXG5gvd
	n8Wlp66UgtkPK9q6OYJc8RjvctJzpJakmsp0ce+x7/mgrND4W1KPIfpLsPd0w4cAU70HhKTgRvK3t
	SJdPA1DnoK6UG/I/X82GIfDgXVl62sh2+Grv4vSINrsY2YUxN35gwrIJYcd4ai0S54q8kBkOsCEeo
	AWXD9g+5thtm5CTct79psoEwpCY4ZKzvWlVsRUyMpgi3iNuwDINc82zSqh+idilHq//0oPN7tqFQF
	seq5RSOBctQoY2w7ZQ53cl2ms0F7NPaRUmmIMtcphSnZPF2QwMZbuqm/i7dkysmShHd9NUzDYSn7/
	rN8nAcNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD3X8-00000001Pu6-20xh;
	Wed, 15 Apr 2026 16:56:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD3Wx-00000001Pi5-1cn5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 16:56:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4176732FB;
	Wed, 15 Apr 2026 09:55:53 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 15A013F7D8;
	Wed, 15 Apr 2026 09:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776272158; bh=dBlTY/m9WM8JFBhitEJBbiQCl2HVEF88g590hzectJQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vfz2VPZ+E4+S/V8gmtkEd82xHkMvjDsBPzkeQ5dRYm453U+QxKRxSfCeyv3ItuxOg
	 6yaNV4eyCAh0PJg1gnW8nbgNtOHBZXQMzgTonqD2jc8eMOT7+yWe2mfoISgCHzlASk
	 QRDmLZ2RpWTLdV83NvqBxDGJUCJLTa8oeTA9iCPc=
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
Subject: [PATCH v5 12/12] coresight: etm3x: remove redundant call etm_enable_hw() with hotplug
Date: Wed, 15 Apr 2026 17:55:28 +0100
Message-Id: <20260415165528.3369607-13-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260415165528.3369607-1-yeoreum.yun@arm.com>
References: <20260415165528.3369607-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_095559_468410_0D858301 
X-CRM114-Status: GOOD (  12.48  )
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
etm_enable_hw() may be invoked in etm_enable_sysfs_smp_call()
and then executed again in etm_starting_cpu().

To remove this redundant call, take the hotplug lock before executing
etm_enable_sysfs_smp_call().

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 .../coresight/coresight-etm3x-core.c          | 24 +++++++++----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
index 706a4c7a40df..8bf7ae276096 100644
--- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
@@ -521,26 +521,26 @@ static int etm_enable_sysfs(struct coresight_device *csdev, struct coresight_pat
 	struct etm_enable_arg arg = { };
 	int ret;
 
+	arg.drvdata = drvdata;
+	arg.traceid = path->trace_id;
+
+	raw_spin_lock(&drvdata->spinlock);
+	arg.config = drvdata->config;
+	raw_spin_unlock(&drvdata->spinlock);
 
 	/*
 	 * Configure the ETM only if the CPU is online.  If it isn't online
 	 * hw configuration will take place on the local CPU during bring up.
 	 */
-	if (cpu_online(drvdata->cpu)) {
-		arg.drvdata = drvdata;
-		arg.traceid = path->trace_id;
-
-		raw_spin_lock(&drvdata->spinlock);
-		arg.config = drvdata->config;
-		raw_spin_unlock(&drvdata->spinlock);
-
+	cpus_read_lock();
 		ret = smp_call_function_single(drvdata->cpu,
 					       etm_enable_sysfs_smp_call, &arg, 1);
-		if (!ret)
-			ret = arg.rc;
-	} else {
+	cpus_read_unlock();
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


