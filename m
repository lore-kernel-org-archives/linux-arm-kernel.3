Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 110F5C7115D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 11:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zdS3+LNIu3MBQqIxWvZTD7p9FokhVuBSl4turLIKiPc=; b=XC3cAb/uSEIkYKw5oWokXfLD3W
	fFOv2RE5X2FhYTAF78vkD8wz4/KWNjx1Zuqnx2w9DhPonOIVfLJ5oWptsZ6uEGR2ilVApQawCo0XO
	NmnmuHyXo+ssTIh9RQgm0eseGjGJCavhIrhia/xiW+3rVPEKK0S8cNbvPPG0Te5j/0/AHDtjOPi/C
	XzXmYzabe9nN1uf8p24zAWzU1A/uMBBiQyCkpmYzD72lbE+kE15Z8uqDHWhpFnPvlZY3BKtdZ1BVI
	EQNJgVw4jKhXW8B1PHPWELpYcDHJAkZ8LxiBvBZxc1ww/4ALQwTCvYlktbQSm0dlDZgL5w4xsywfJ
	t40fDH1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSaC4-0000000FUdP-0qtj;
	Fri, 20 Jun 2025 11:46:04 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSZcp-0000000FQnL-2RZe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 11:09:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 41DCEA5239E;
	Fri, 20 Jun 2025 11:09:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95D71C4CEED;
	Fri, 20 Jun 2025 11:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750417777;
	bh=U6TPdmTbp0rz+wPI0kkF0Wk6xpzhmG/dlFYR+tX1PT4=;
	h=From:To:Cc:Subject:Date:From;
	b=nxDlxXns9RtDQGQbywsJDRxhD5cs0Fah2o7lLR55gC+4ABZQZPcwE7EBJwREpCoqS
	 HRBDbycgWY3NU1syTFXycG/m6HLEYsksxAWu9cAoL2PYWW3uGNO6kPXcLoTXNesE/O
	 aiIkpX5EWJgtaGJn041X8wScxQrwqIGBY8c3CCv3leX0DZAYm4iRuhb9baoTMHRYvo
	 b3TfgKXRvAHuFPnUj6fdNy/BtoMh98dIxxnDkTnl+fbrcxFSuISMPXgDOwyu6fzwdw
	 YCoOII2pleIs3c8JrLP/LF5sXLU5e7IQMUJ443FdvSUpvC9PGozxtifHfMtxSwAHVQ
	 V4z57PVi61LVw==
From: Arnd Bergmann <arnd@kernel.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Leo Yan <leo.yan@linux.dev>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Junhao He <hejunhao3@huawei.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] coresight: fix building with CONFIG_CPUMASK_OFFSTACK
Date: Fri, 20 Jun 2025 13:09:28 +0200
Message-Id: <20250620110933.3364359-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_040939_686508_607D7443 
X-CRM114-Status: GOOD (  14.01  )
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

From: Arnd Bergmann <arnd@arndb.de>

Building with a ridiculous CONFIG_NR_CPUS shows that this function
fails to build because of incorrectly moving the mask offstack:

drivers/hwtracing/coresight/coresight-cpu-debug.c: In function ‘debug_enable_func’:
drivers/hwtracing/coresight/coresight-cpu-debug.c:452:1: error: the frame size of 8528 bytes is larger than 1536 bytes [-Werror=frame-larger-than=]

Use the recommended interface instead.

Fixes: 2227b7c74634 ("coresight: add support for CPU debug module")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/hwtracing/coresight/coresight-cpu-debug.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-cpu-debug.c b/drivers/hwtracing/coresight/coresight-cpu-debug.c
index a871d997330b..6ecd8e755ef3 100644
--- a/drivers/hwtracing/coresight/coresight-cpu-debug.c
+++ b/drivers/hwtracing/coresight/coresight-cpu-debug.c
@@ -416,13 +416,16 @@ static int debug_enable_func(void)
 {
 	struct debug_drvdata *drvdata;
 	int cpu, ret = 0;
-	cpumask_t mask;
+	cpumask_var_t mask;
+
+	if (!alloc_cpumask_var(&mask, GFP_KERNEL))
+		return -ENOMEM;
 
 	/*
 	 * Use cpumask to track which debug power domains have
 	 * been powered on and use it to handle failure case.
 	 */
-	cpumask_clear(&mask);
+	cpumask_clear(mask);
 
 	for_each_possible_cpu(cpu) {
 		drvdata = per_cpu(debug_drvdata, cpu);
@@ -433,9 +436,10 @@ static int debug_enable_func(void)
 		if (ret < 0)
 			goto err;
 		else
-			cpumask_set_cpu(cpu, &mask);
+			cpumask_set_cpu(cpu, mask);
 	}
 
+	free_cpumask_var(mask);
 	return 0;
 
 err:
@@ -443,11 +447,12 @@ static int debug_enable_func(void)
 	 * If pm_runtime_get_sync() has failed, need rollback on
 	 * all the other CPUs that have been enabled before that.
 	 */
-	for_each_cpu(cpu, &mask) {
+	for_each_cpu(cpu, mask) {
 		drvdata = per_cpu(debug_drvdata, cpu);
 		pm_runtime_put_noidle(drvdata->dev);
 	}
 
+	free_cpumask_var(mask);
 	return ret;
 }
 
-- 
2.39.5


