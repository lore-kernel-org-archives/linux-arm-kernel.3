Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EBABC88E4C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 10:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l6s4NvH3jC+D0b5yUpNIAvYV27KRkvNONC8b1ZLhUWw=; b=Zs1CwmXxn9FdDvvIIsq+ioh7C/
	hWoO9HJE7ZZKzJarxs7aOHuV7us/F7JhNWIJ9kMKyvoXxR5Dn+zwzoQKxuFJeheM/GqxTJ2xQaJW+
	gSrTBTKEqow6iN/CUo3x3RBe8dUT1kwjbNb1aW0APeXVzxF5msXxiERbYc1lcgMcaGaRExqmqTdgi
	imSHve7TDlOBDeZrdZeymPYGjegNAIvMxrntspRg8ENfEkcmxA+/LS2GYRq8WkhIem1RRcMn+OCwm
	oAP1SPjvZ3AH/ECaGtrhvvGCl5PBldVw3E53P7NYcJnZXRx/UeTmB/gRPDq0LFggtcE71xot6ntxw
	5RtqISeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4yw1-0000000GRJP-14mS;
	Fri, 11 Sep 2026 10:56:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4yvh-0000000GRCd-00lz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 10:56:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BF80A16F2;
	Fri, 11 Sep 2026 03:56:20 -0700 (PDT)
Received: from e129823.arm.com (unknown [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 647313F7B4;
	Fri, 11 Sep 2026 03:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789124184; bh=CBHqN7snhxYRskBFclU3Ntl2e2QfakAxW5bdmKzKdRM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QvHFRCYzN4i2ZWcoXe9bdOkaXqC97SdBYKOI7X7ornq//8ieCnM22RPKtQAoRfd5G
	 Qxeup9GhETzRB0iRRJG+EfDmGw8Jy0ii+/+Pg3/JAQMdvxeifw9kjATSyMvdtyh5+r
	 q8kcWdKjfKDf38uQHUBtZ6L80Jdbx3tIzqOz8dNw=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Fri, 11 Sep 2026 11:56:03 +0100
Subject: [PATCH v10 4/8] coresight: etm3x: remove redundant cpu online
 check on etm_enable_sysfs()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-separate_etm_cfg_v2-v10-4-1b715d95927a@arm.com>
References: <20260911-separate_etm_cfg_v2-v10-0-1b715d95927a@arm.com>
In-Reply-To: <20260911-separate_etm_cfg_v2-v10-0-1b715d95927a@arm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1733; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=CBHqN7snhxYRskBFclU3Ntl2e2QfakAxW5bdmKzKdRM=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBqo95J7fsYucbkFqj21ZH5KdtKSs4sYSGPjoVq4
 qKl4BHZxXSJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCaqPeSQAKCRBt1cPRWsUx
 M5hfDAC6LewplU7u2JiEw7+dcseutPOZQpNoX/YQGOmgH61JH/Soy9RkpG+SnZKHREb7xAmPiRI
 W0DsSeXXE8Makft+mbt36F0UE9Hn/+bb0qhuxSKPIU38tY6vR5bd4VM7irX/6fwx5yIrn46b6pd
 /kmmHMOdzQCaTtqfMTacuyLBJhbRdaLajFVHIAefPSc5MRTjOHy8Fa4KTwE1ErOAy7G3dxaxwXi
 jiz/27bdDSMGD+J82Qjyh0i5c9qjYClFE7dNnm3WiWPxAYqiBjlNu7tOZ+uDipBnO5/axTWQN7F
 zwJiJadly5A99Jeae4U+kP15krbS6Y4eB2xhtmLIBZsQU6i4RYQ4LsPtyOxgrMj55c6TK+7tq0V
 ySTCLL2Zec54uBlJVr7L3lQ61do9rZwR91ZcFDE7FnGdrw6lQn9SUUS3GmigdLrdDKYZ/w5jgam
 KBWsTkZyzhEPav/KMwWbsVOz56cSl48YFRHpGNRQnH4NszpvZvU5LreMAxmb/jexgG6pc=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_035630_354895_45DAB9B8 
X-CRM114-Status: GOOD (  13.23  )
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
 drivers/hwtracing/coresight/coresight-etm3x-core.c | 31 +++++++++-------------
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
2.43.0


