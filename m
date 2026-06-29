Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2639BC44500
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 09:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x5nzMpG/GwW7Xqqy1mUFuuih69K6FrxFM6B9LYI2OFs=; b=iQpLHmLHx62WwFsW5Qiqozhd13
	w7t9qfj6OHi0haVxEa6T9Q+qPjyppKVnWOzeMRLKhjggfuoKONC4LO6Fd6UjNvgEsv9VeV09Bm2Mg
	E/9Q7/EeoeW13YW8NwmBUjH1V9Q52LBXYHDMAhqNt5FXnu4xyzbRvPL2R9vKjDxnb3wknmYMz+FmF
	45Zm2mgYygGbb36cX3Vm0Sn33akTtwrZoDuJLUqs2uLGg3v26r6lEhWJ2xQmgARe3xVP+ncUkWsQH
	KvqY+UGjjC86SFQoAXNLv3tnwE86PlFNP3NdJ0TVBMSjh/GrAXVDWxpYHvGKFtUeb02fLHadeA2zo
	wbhReNfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we7rF-0000000E5Es-3lRQ;
	Mon, 29 Jun 2026 09:00:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we7r5-0000000E55U-1pPf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 09:00:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 51FD51A00;
	Mon, 29 Jun 2026 02:00:34 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 08C5D3F836;
	Mon, 29 Jun 2026 02:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782723638; bh=1v+4DtwiP426UnV9z8aEwX4WxDX0JQvRdZWfwFpb2yQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=f/BqQgnqYYUu2mxmPIY0jT3Y4zEREnAJR9VDQnnseFwPhHO1mdUJleXPws8a4mz0b
	 5GAU111VUvTg67s3gL2zsiAioV84mE0k6s858/uM8rQ1nYUidzqF8rnnf06IMJABd5
	 yiHROki7bdr66M+rSyxF1HOuoRFi4gHF/VfNHc/A=
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
Subject: [PATCH v8 13/13] coresight: etm3x: remove redundant cpu online check on etm_enable_sysfs()
Date: Mon, 29 Jun 2026 10:00:06 +0100
Message-ID: <20260629090007.1718746-14-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260629090007.1718746-1-yeoreum.yun@arm.com>
References: <20260629090007.1718746-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_020039_513106_5EA7F5EB 
X-CRM114-Status: GOOD (  12.26  )
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
Therefore, remove redundant check in etm_enable_sysfs().

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 .../coresight/coresight-etm3x-core.c          | 31 ++++++++-----------
 1 file changed, 13 insertions(+), 18 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
index ed27e35b42ec..9dbfe6a1dc4d 100644
--- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
@@ -520,25 +520,20 @@ static int etm_enable_sysfs(struct coresight_device *csdev, struct coresight_pat
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


