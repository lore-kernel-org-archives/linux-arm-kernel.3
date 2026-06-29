Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42358C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 09:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DHDgXscw65YTQQ3gYSSiPACTkveMticMhZdcnVb9Yag=; b=xwnrQDskncKNhLVuy+60NhFWUM
	8gsePSsrR2kd9P4VortzmvIMsmduYTQe1AlbSt0c3D4aKrtRETEM8sOOkwkWmr4bs9iXdRfUMmR7e
	RrU+XW4+q7C9YcWolB+uMmLaMgGUndizi7MhGOqb4g6hJ3T1VsfE1NL4XvXyP38Q5F6GYcdArpdOt
	HI1XOdAytwJ93Km5kxv3XzrMKHE8inyi20o8Fp7rd1lzc/UYbIhGhDZtwF1+hbfZAz2BUXXZfNQv/
	JCUhnsqQiyYA1fkK2Cx0+ho+EQHYFQW7LWBqhzafHzrQ41ydws9Jinpbb+0YbcmRDsYjRZ9tKe+Jt
	F8/ggsUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we7rF-0000000E5CP-0ahd;
	Mon, 29 Jun 2026 09:00:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we7qs-0000000E4s2-2YKd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 09:00:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9F8841A00;
	Mon, 29 Jun 2026 02:00:21 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5015F3F836;
	Mon, 29 Jun 2026 02:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782723626; bh=QV1Oipki3O6lDO1YTL1XjnrOZLHYeMd1B5VY3Lh9Za4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=b5ICQrhkxW/zTsspYuVP0twrAlSKxr+4XpamlcpicNNDHHYWr466HETC35txE2m57
	 Pt1CHFd+Mcpnr4il2w0mAp08cocUmyroD+aLcvURx1SMH2JMD9soFGuQmxy+jwfj9q
	 J5EZZGKgZVMt+9SmaAb1Mhr5eWoxFGzBXU7GAFrY=
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
Subject: [PATCH v8 07/13] coresight: etm4x: fix leaked trace id
Date: Mon, 29 Jun 2026 10:00:00 +0100
Message-ID: <20260629090007.1718746-8-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260629090007.1718746-1-yeoreum.yun@arm.com>
References: <20260629090007.1718746-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_020026_692337_06B72552 
X-CRM114-Status: GOOD (  10.12  )
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

If etm4_enable_sysfs() fails in cscfg_csdev_enable_active_config(),
the trace ID may be leaked because it is not released.

To address this, call etm4_release_trace_id() when etm4_enable_sysfs()
fails in cscfg_csdev_enable_active_config().

Fixes: 7ebd0ec6cf94 ("coresight: configfs: Allow configfs to activate configuration")
Reviewed-by: Jie Gan <jie.gan@oss.qualcomm.com>
Reviewed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index faa00dcd03a7..2798604943ed 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -929,8 +929,10 @@ static int etm4_enable_sysfs(struct coresight_device *csdev, struct coresight_pa
 	cscfg_config_sysfs_get_active_cfg(&cfg_hash, &preset);
 	if (cfg_hash) {
 		ret = cscfg_csdev_enable_active_config(csdev, cfg_hash, preset);
-		if (ret)
+		if (ret) {
+			etm4_release_trace_id(drvdata);
 			return ret;
+		}
 	}
 
 	raw_spin_lock(&drvdata->spinlock);
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


