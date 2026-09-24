Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50994C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 17:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=43VgedYygYUEwwBg73kLmhjSvbwh0oi8JU5BGTbr7ls=; b=T5cdC8r3kQElgb+7GDvo1yZGy1
	29dDe6op+3VLT84nD7Dx7n1OwMHei3WVgiQwmXSaZnblHuOXq3dIRzOhW/opnnGNhbxOeAbl2o9Ny
	jsnmGhxvyr29pVvB2iABL6uGqrQ1KsCfRCw6p9j+lJFO708nRZ5wVfV6kN3Bkn7RqhqHw13G6pMKO
	wnpu8/2GiLK0bK+ns+87LA6tyFUOR2qSWu16R3pZAJ2yOW1T5EB83XF2s2ax3kpgfsuEHhum/kUIL
	5T2mWz+yNUWS3j+36gdoPMwezPGOd2O9rpiJKMRCxHXw7EclZwo0oEmqvrkIG9vdgfFR6jDPW1NSJ
	2igG9Y4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9nLA-0000000BmIt-31H3;
	Thu, 24 Sep 2026 17:34:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9nL4-0000000BmE6-2dT6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 17:34:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 538901E5E;
	Thu, 24 Sep 2026 10:34:26 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8204C3F86F;
	Thu, 24 Sep 2026 10:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790271269; bh=TiWi/q8xGcjEmeDCS5JuOhiRjHoHgT0etgyhg2oNuXc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=t5n8vMauLKUNGewc6qGbdTdgiWoSsHiWd545D+clGvhHCm8X1SCMQyzgJKdRENxHa
	 qCDvzM01DZdZH+wt1DE5/MWeg+tgd6oFh5Vwa/bp2kSyshBAmV1d8MKVyeT79ll6ip
	 CcCPLvfoNJJ+6YFvjClD1l0ARyiVVfy7UKWFAhMM=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Thu, 24 Sep 2026 18:33:44 +0100
Subject: [PATCH v12 06/14] coresight: etm3x: remove redundant cpu online
 check on etm_enable_sysfs()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-separate_etm_cfg_v2-v12-6-a2b41d2f7c2b@arm.com>
References: <20260924-separate_etm_cfg_v2-v12-0-a2b41d2f7c2b@arm.com>
In-Reply-To: <20260924-separate_etm_cfg_v2-v12-0-a2b41d2f7c2b@arm.com>
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
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBqtV8OOoiUehSE1NCtOJ1jrZk1LRnIxlqhwtfLD
 +wrqBN2BiiJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCarVfDgAKCRBt1cPRWsUx
 M3qqC/wLixn4NISa+k9QHAOi6tql6I269pCxge8QEpe6MtXp+t6cfKZjxOL+VwY9icKelUhKM10
 x24Xh9cxyQf7gHok5eY33i+le6pC85/2IVG3+upW0xCP/SgBPiZNAJ4WpWvKUfQVYzn5seDf2FO
 cxf+0vS20IB7yVaHbE0NsVxbKCmW0ktxL9aGuw7F8Fatj2Sj9UZWes/lVWphEHVE769d55ohpr6
 i/GMUjjhEStPpd7QpK6KDheI1kOZidQ5zHnFcqMo0tcy/YR0wNGtNvvuHNncYwAz+xf+rCxhvjt
 GoFSlzMvQu6mQeEquQ+jht+3jdI1AQfuQ2xP8fWa/Cd9nYN/iWeWNRwtv+qUrOMKBr2tQP6u5m0
 9xah3KMiuB1d/RYOR7IJTvaDor0syE3dXk8xG+VsjyadtX9cORAlC4HArsDwZ72mTSaxJUDhZ8c
 YuFurBvQFVUApYFEnZgrrp/H5Uk8BapLy2yddoesRg8wxv7j3P0JzxcRDQLLghTBBBPfo=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_103430_763306_8C7DC3DC 
X-CRM114-Status: GOOD (  12.74  )
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


