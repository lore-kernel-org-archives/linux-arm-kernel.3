Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B77B3F9EDC9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 13:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8KxdJDksoiAeh1pPUdsNPEiLOeYoDokSxMTlO8DR6Go=; b=o6cYLY+r3n5kShGkKx26W9RgSn
	evpsKcEJOV3knXPw5EZQ3ducXdR1wnjveTl3DMh2r0WzUCuHW3Lb5e43hpDnmAGO+5jpl2L+XxH3m
	N9+KerOFLJAYhc8SILQrTZxmqn2W2q2QgowHbGnIir3NGe8NNJhlTV5HShBaiNJ/caYe9CttCZplL
	mo2hdl3PLls1g8gup90YQtE5zlbBdVPO5RCMcjwv+sAkQIuuNl4fDOoC6lvttLVRegjwlIZgPjbl0
	Yg5tel9XT9/rOdIhkVOGeFxSpU7qBy9gSkJGKmvREGgUmupuyBmpMK987Ca/7xfLa517lQxKZ5xCB
	VuShSDyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFXXI-0000000AHly-2tg1;
	Wed, 22 Apr 2026 13:22:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFXX3-0000000AHcH-3KBP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 13:22:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BCADB2454;
	Wed, 22 Apr 2026 06:22:15 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 732F73FD46;
	Wed, 22 Apr 2026 06:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776864141; bh=atkgTcQ1tzsflRhMqxeHZlAsF0L4dyaL/654Anxyj/g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LuoxIqEBMAH6PV6xM/ZhWfPOfy2YKfFB3oykEc5uF1JE92CVAeQcB6DNu0cXDafpP
	 VxzC2YcQFPbjs+2zjwzRJJA4CPz9GDmVIMYgby3ogy29mqODkUwgDguYjLIYxePUJ3
	 SnlT+rFVNlRmjrpI+F6i4ru0PYB88CQ2HboAg0Vs=
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
Subject: [PATCH v6 06/13] coresight: etm4x: fix leaked trace id
Date: Wed, 22 Apr 2026 14:21:56 +0100
Message-Id: <20260422132203.977549-7-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260422132203.977549-1-yeoreum.yun@arm.com>
References: <20260422132203.977549-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_062221_872555_03E96A2E 
X-CRM114-Status: GOOD (  10.05  )
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
index afa64a339b6e..bbfcd7e16532 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -920,8 +920,10 @@ static int etm4_enable_sysfs(struct coresight_device *csdev, struct coresight_pa
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


