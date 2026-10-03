Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CA86CA5FE3
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 02:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=43VgedYygYUEwwBg73kLmhjSvbwh0oi8JU5BGTbr7ls=; b=saZj5fgKcL4zvApqi5vnGKPvQX
	GOCJNV13mtSWEO2TFO2D0+J0T1hFCtPrMaqKe4Jjv5CPQEfyA8hCbThlZLzaeLKpXanHwqJRfg3tY
	7vuDBds8xcUntH0WJ7T4DF0C+4L38Vk2Oz9pGBZ1iQruexr9JJlthsInOMl/3UDoS/BuchGK3m9v9
	uSKjxEK48vEiOf2A2bUz9ZzPIb/+V2xGv4j/dLCSeMwa447fZsMlGhQInM7temmtUjbaI6zokh6gv
	Hkkc+RX558KZVQaikW/xrs8pDlp/uBvmLZYqMCZX6lVSqSSeuNQSg8OrIlu2BJbJTCc9ERAO1LsAw
	b/Ez19Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCprp-0000000CxIK-210B;
	Sat, 03 Oct 2026 02:52:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCprm-0000000CxEf-0Ff5
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Oct 2026 02:52:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E788E2F;
	Fri,  2 Oct 2026 19:52:43 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4630D3F763;
	Fri,  2 Oct 2026 19:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790995967; bh=TiWi/q8xGcjEmeDCS5JuOhiRjHoHgT0etgyhg2oNuXc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KFLzS+wandwS8zb36jLpa7iVNTukJJtF4lozUzbfVNB4m3PCmtHbnRigGAYTlgtXR
	 J1oTq9Wty5vsPpscTQWq9o1RUSkQuSXdHbj3YEKOxjjaaCcG/w0xA1fHpiwsKR8s97
	 /C9yX3AYx1ZRuKyEG5gzOsYef9Y1AKZcL18h7vIY=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Sat, 03 Oct 2026 03:52:18 +0100
Subject: [PATCH RESEND v13 06/14] coresight: etm3x: remove redundant cpu
 online check on etm_enable_sysfs()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261003-separate_etm_cfg_v2-v13-6-5d8a29aead95@arm.com>
References: <20261003-separate_etm_cfg_v2-v13-0-5d8a29aead95@arm.com>
In-Reply-To: <20261003-separate_etm_cfg_v2-v13-0-5d8a29aead95@arm.com>
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
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBqwG3ndhqbOpIs0XikI01YmdV96LXjrn8NQK+UG
 oWtGDM8vm6JAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCasBt5wAKCRBt1cPRWsUx
 M/XoDADX73C5l4GqYrjcLcI5nvXpAYB6U4nC1C5tzSaJec3VRWePXWHPO/QVyyPXzmGbhWUrNDp
 Z7mEcBETzEIST/saAseeWsUA+NJG7Yn+r1IxKypaQx3ttiTW7FbIT1cMdHO6n8kyg+X8Hg+TcP+
 QxaNnDAtomZvm6rB7ZYiq/JyB5db7QuOnzz5cxSQE0pWPtwMbv97JIG4WODMoYtLV/r5nB8YKS5
 Oy7gtX7zLtRDYIucOGCe1zOJ1UywzIOWFEWxmzumy51r+gtEZEck4XVTnbvz+1nFH+lQLYWz3Z8
 3K5KI//zbvVMNX+iTAcbzcJCEaQyfE7Mbhdj9giiFEnMz9tZEKHKKEHzDdClB2Mrsp7fpSp0vLo
 88Kqwtmuk5L7eK299TqsmesMcWF4RZElvpxxz/c+zVVFVq4vRexsr1WB0mPeLJGEao/drlfRV75
 rELEwvVAcI8704FJVnbDA+jM/+25M6WLeNT2H/5dhAYBeeQgxyg4D9l3CIMLtu/RY/kZw=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_195250_848324_64F28502 
X-CRM114-Status: GOOD (  12.71  )
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


