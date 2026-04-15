Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D760F43858
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 16:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QEDDwtXRTUOANhKRqyVROE5RLIc56FzqLYMTec3ApnA=; b=aXtgzgWsTNcqDRTVvBcqbH7GDS
	89AQ16aMfr9BDRHvbKtfWCJtVAJH6h0pc4y2SdjFhszroBPfs3nOposs63dNwZi6my4ekv7/C5aP5
	sBd6zfD3SDfYNl7ZqXqJLF3QqvwSi5lqF9Oxzjrrb2KEqZAmC+YGmMZwoX9SEKF2AxQUueksd9ug6
	vhHajZHSECVQpHsThZMz2QBtCIG9CfxWErks/NftQn0SIkwiY3L/qi8tr9p5i/fQY0Ux32JRKPIjW
	wW9/ovqt1Vm18E1Pt2cioPSPXKRSrp+3cvrpTwkZ0wx2Me7aF+GSjkeawWmGlZc2cL0XFjtfFs6H8
	R4imNqJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD3Wy-00000001Pj4-0Jdq;
	Wed, 15 Apr 2026 16:56:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD3Wp-00000001Pb0-1FwD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 16:55:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7259D32FB;
	Wed, 15 Apr 2026 09:55:44 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3D7BC3F7D8;
	Wed, 15 Apr 2026 09:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776272150; bh=jJ7Gqb7ORflx/3s434eoHtGC4lP0qNeMEXUWzGOGbhM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PZxzD5lHR3fI7V1E5l2IikUK3PmlNAPlbqlsffwjqG5WaYRMpLwTGWQaVkTgiZxL2
	 C3orhkeS2ybYM2pZlXZXj+15gfvQEQ9h9eGHjbK4J9/ZUkYME3DfxYlsco5RbUVK/Y
	 yXgBcZ/JQybFrYRYc4wTreidmhBNoYSpDPv16MZ0=
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
Subject: [PATCH v5 08/12] coresight: etm4x: remove redundant call etm4_enable_hw() with hotplug
Date: Wed, 15 Apr 2026 17:55:24 +0100
Message-Id: <20260415165528.3369607-9-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260415165528.3369607-1-yeoreum.yun@arm.com>
References: <20260415165528.3369607-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_095551_381119_E8860738 
X-CRM114-Status: UNSURE (   9.80  )
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

Reviewed-by: Jie Gan <jie.gan@oss.qualcomm.com>
Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 15aaf4a898e1..2ce6b08f7f54 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -960,8 +960,20 @@ static int etm4_enable_sysfs(struct coresight_device *csdev, struct coresight_pa
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


