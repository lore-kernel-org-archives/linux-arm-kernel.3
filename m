Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13B89CA5FE4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 19:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=43VgedYygYUEwwBg73kLmhjSvbwh0oi8JU5BGTbr7ls=; b=kCcwjv26cFS03rvB1/f1nKRdUI
	KNiTF/tUA7UWD3ksGdvFWZZcmPnp7SvDxeJjhaTlJmumUjYoHF6vhX0Vu+Ktyux2XLYHZcTJ9CmGy
	wzTptFbRrP5iAmA57pHsYvrAFf8v3vMimH5kRgAk7h56AUslvE737XbmISod1dwSYpmS4TDXewev+
	1pdeSEyE1QCpGG4fJtyrOa0+5DKIFR0+wgYm+tcpI37bLoZrQpBls55qHy9kp/O7DgsB0WJ13aBcB
	Io2dZSYEpoQ/eJW3WjrBsBe964ZnvmHy5YQjMT40VashBV78bWMfgPSP1AehKU9nrF6t2g7I18ITb
	4mwDpkxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCiY0-0000000CLuX-3VwO;
	Fri, 02 Oct 2026 19:03:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCiXw-0000000CLpq-2uMp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 19:03:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A7EEE1476;
	Fri,  2 Oct 2026 12:03:47 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1343F3F85F;
	Fri,  2 Oct 2026 12:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790967831; bh=TiWi/q8xGcjEmeDCS5JuOhiRjHoHgT0etgyhg2oNuXc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DK9sVj88zXM5metsERRy3cD/ejQPsB9TTDuYwSmOJ1xUZ3Ba6NOIyjFlffUJpTCaL
	 Udorf8K5ydYxS6hEHxnQQsmbusbW1icTc4m3aSA1LiJzWazSUKGqF2b/e6bMZUU3wg
	 xeyMj7UNJK7de4JfS6pGXJ3kIKoND9zUYAWmgad8=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Fri, 02 Oct 2026 20:03:27 +0100
Subject: [PATCH v13 06/14] coresight: etm3x: remove redundant cpu online
 check on etm_enable_sysfs()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-separate_etm_cfg_v2-v13-6-fe429d8d96fb@arm.com>
References: <20261002-separate_etm_cfg_v2-v13-0-fe429d8d96fb@arm.com>
In-Reply-To: <20261002-separate_etm_cfg_v2-v13-0-fe429d8d96fb@arm.com>
To: Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Leo Yan <leo.yan@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, coresight@lists.linaro.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-rt-devel@lists.linux.dev
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1758; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=TiWi/q8xGcjEmeDCS5JuOhiRjHoHgT0etgyhg2oNuXc=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBqwAAClj6/WMDI/0X3K7yiGCcw9edPlTETeoZQs
 zMbjgc9L2OJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCasAAAgAKCRBt1cPRWsUx
 M66SDADV22CluO+UuRpGCaaHd7GfOWPziCfhgbvB7vkQMVXfIqvxkQT2FIoXatl7Z6rJ5Blh73P
 FruijSwmWg7HZQMaipt9lWbwbjjf+GbTwT4++DEVHKp7nzD7j4GHPwd1pWtLijXMpd3CdgtCxna
 ji0MiWZp54bEbeesdgtDUALgXkTrAAGunH0nO/seML2V3UMEuKnNfUsWZ/vQBqJ0E3aPF++soT9
 7tqQEAWAsThqQqfWJAyX+K8W7McQjJIounlJX/GLsOmGj/i/2ey1E1lmp/sax0cTzdpYz8kJtR4
 kAULPJo+Hs6D7Y8exohZ1g04nK6gSJwf40ExnHov1fEf4bj7i8K4JzyiCBA5OtgzNS40+P5erOC
 5IzIglD7ZRgylbI2i6Fm3cnHGGOMAP0dgV8Lv5p9hHKDYUtEgMSW8PpLIw9Pb2Vu2uDjI6axiyh
 v2tFsESV0uWmPIx9SVc135ehVeRppjKi6uoEhBXDMX+zXM/tlkrWFdL6GxWGtVYhw7esw=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_120352_828397_67C6D0BE 
X-CRM114-Status: GOOD (  12.70  )
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

Reviewed-by: Mike Leach <mike.leach@arm.com>
Tested-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm3x-core.c | 26 +++++++++-------------
 1 file changed, 10 insertions(+), 16 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
index dcadcc383012..ac7c154720cb 100644
--- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
@@ -513,25 +513,19 @@ static int etm_enable_sysfs(struct coresight_device *csdev, struct coresight_pat
 		return -EBUSY;
 	}
 
-	/*
-	 * Configure the ETM only if the CPU is online.  If it isn't online
-	 * hw configuration will take place on the local CPU during bring up.
-	 */
-	if (cpu_online(drvdata->cpu)) {
-		arg.drvdata = drvdata;
-		arg.path = path;
+	arg.drvdata = drvdata;
+	arg.path = path;
 
-		scoped_guard(spinlock, &drvdata->spinlock) {
-			drvdata->curr_config = drvdata->config;
-		}
+	scoped_guard(spinlock, &drvdata->spinlock) {
+		drvdata->curr_config = drvdata->config;
+	}
 
-		ret = smp_call_function_single(drvdata->cpu,
-					       etm_enable_sysfs_smp_call, &arg, 1);
-		if (!ret)
-			ret = arg.rc;
-	} else {
+	ret = smp_call_function_single(drvdata->cpu,
+				       etm_enable_sysfs_smp_call, &arg, 1);
+	if (!ret)
+		ret = arg.rc;
+	else
 		ret = -ENODEV;
-	}
 
 	if (!ret) {
 		dev_dbg(&csdev->dev, "ETM tracing enabled\n");

-- 
2.43.0


