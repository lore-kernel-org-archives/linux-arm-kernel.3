Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D193C44507
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 10:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yNcYzRqRFOHuPxQt5oqfw0T1O8F+lbBG3hLsgKheepY=; b=g6lwfOTyoAXs3kspqgal8gUugr
	gdtjIeJ+msLtjrTDeWROCMn3RxeBDlgq9i/8f9+g4pvOKLgvo3y/Mn+zxnoAhSySfw/w0xwc02RqU
	t57MFnS7QWPufX6qQmExgiwY+i1Bo2gPKVfiXvtKadfNTpcJpTYDmKjWQWC86PwgY8kuJZor2vzJY
	rcCg6cwBwaPG1dg/x8X3nTpcfxZTIn4CI6dqzznwwvc5hfx6tJRwSPMJJGKPVN1t1sJ19X30UsS+H
	Z1LFSRIuF6DRwBJ2vX6d2PLrlgsxYEXZcKWqGhoYdqVyoXRHi5pl9b4jF9dPg8zpXulPf/oYLrtgl
	eENY6llA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viVFq-00000005Foq-0VRl;
	Wed, 21 Jan 2026 10:16:02 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viVFh-00000005FkL-3rj2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 10:15:56 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=yNcYzRqRFOHuPxQt5oqfw0T1O8F+lbBG3hLsgKheepY=;
	b=XxMXYMfczr86xcNHRH2DweGacFS4mHx/YDyQM5pBEtcE7Uz9Mydu+Pg0zo/oVgtEjAB1UjJvt
	e+keaa/3y9/OwAxsouwX/u9L21DsluYD0TIOWcXLxlcwOH3yIWCAOmAQK1eY7oIS6teDUmyhr1c
	xr5VqYXfC3aL0LkXcZv7MG0=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4dx0NG6HFfz1T4MS;
	Wed, 21 Jan 2026 18:11:42 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 9B46440539;
	Wed, 21 Jan 2026 18:15:45 +0800 (CST)
Received: from kwepemn100008.china.huawei.com (7.202.194.111) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 21 Jan 2026 18:15:45 +0800
Received: from localhost.huawei.com (10.90.31.46) by
 kwepemn100008.china.huawei.com (7.202.194.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Wed, 21 Jan 2026 18:15:44 +0800
From: Yushan Wang <wangyushan12@huawei.com>
To: <suzuki.poulose@arm.com>, <james.clark@linaro.org>,
	<anshuman.khandual@arm.com>, <yeoreum.yun@arm.com>, <mike.leach@linaro.org>,
	<leo.yan@arm.com>
CC: <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linuxarm@huawei.com>,
	<jonathan.cameron@huawei.com>, <hejunhao3@h-partners.com>,
	<wangyushan12@huawei.com>
Subject: [PATCH v5 2/3] coresight: tmc-etr: Fix race condition between sysfs and perf mode
Date: Wed, 21 Jan 2026 18:15:42 +0800
Message-ID: <20260121101543.2017014-3-wangyushan12@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20260121101543.2017014-1-wangyushan12@huawei.com>
References: <20260121101543.2017014-1-wangyushan12@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.31.46]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemn100008.china.huawei.com (7.202.194.111)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_021554_277459_31527F5A 
X-CRM114-Status: GOOD (  16.30  )
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

From: Yicong Yang <yangyicong@hisilicon.com>

When trying to run perf and sysfs mode simultaneously, the WARN_ON()
in tmc_etr_enable_hw() is triggered sometimes:

 WARNING: CPU: 42 PID: 3911571 at drivers/hwtracing/coresight/coresight-tmc-etr.c:1060 tmc_etr_enable_hw+0xc0/0xd8 [coresight_tmc]
 [..snip..]
 Call trace:
  tmc_etr_enable_hw+0xc0/0xd8 [coresight_tmc] (P)
  tmc_enable_etr_sink+0x11c/0x250 [coresight_tmc] (L)
  tmc_enable_etr_sink+0x11c/0x250 [coresight_tmc]
  coresight_enable_path+0x1c8/0x218 [coresight]
  coresight_enable_sysfs+0xa4/0x228 [coresight]
  enable_source_store+0x58/0xa8 [coresight]
  dev_attr_store+0x20/0x40
  sysfs_kf_write+0x4c/0x68
  kernfs_fop_write_iter+0x120/0x1b8
  vfs_write+0x2c8/0x388
  ksys_write+0x74/0x108
  __arm64_sys_write+0x24/0x38
  el0_svc_common.constprop.0+0x64/0x148
  do_el0_svc+0x24/0x38
  el0_svc+0x3c/0x130
  el0t_64_sync_handler+0xc8/0xd0
  el0t_64_sync+0x1ac/0x1b0
 ---[ end trace 0000000000000000 ]---

Since the enablement of sysfs mode is separeted into two critical regions,
one for sysfs buffer allocation and another for hardware enablement, it's
possible to race with the perf mode. Fix this by double check whether
the perf mode's been used before enabling the hardware in sysfs mode.

 mode:
   [sysfs mode]                   [perf mode]
   tmc_etr_get_sysfs_buffer()
     spin_lock(&drvdata->spinlock)
     [sysfs buffer allocation]
     spin_unlock(&drvdata->spinlock)
                                  spin_lock(&drvdata->spinlock)
                                  tmc_etr_enable_hw()
                                    drvdata->etr_buf = etr_perf->etr_buf
                                  spin_unlock(&drvdata->spinlock)
   spin_lock(&drvdata->spinlock)
   tmc_etr_enable_hw()
     WARN_ON(drvdata->etr_buf) // WARN sicne etr_buf initialized at
                                  the perf side
   spin_unlock(&drvdata->spinlock)

With this fix, we retain the check for CS_MODE_PERF in get_etr_sysfs_buf.
This ensures we verify whether the perf mode's already running before we
actually allocate the buffer. Then we can save the time of
allocating/freeing the sysfs buffer if race with the perf mode.

Fixes: 296b01fd106e ("coresight: Refactor out buffer allocation function for ETR")
Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
Signed-off-by: Junhao He <hejunhao3@h-partners.com>
---
 drivers/hwtracing/coresight/coresight-tmc-etr.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index e0d83ee01b77..fc0a946053dd 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1306,6 +1306,19 @@ static int tmc_enable_etr_sink_sysfs(struct coresight_device *csdev)
 
 	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
 
+	/*
+	 * Since the sysfs buffer allocation and the hardware enablement is not
+	 * in the same critical region, it's possible to race with the perf.
+	 */
+	if (coresight_get_mode(csdev) == CS_MODE_PERF) {
+		drvdata->sysfs_buf = NULL;
+		raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+
+		/* Free allocated memory out side of the spinlock */
+		tmc_etr_free_sysfs_buf(sysfs_buf);
+		return -EBUSY;
+	}
+
 	/*
 	 * In sysFS mode we can have multiple writers per sink.  Since this
 	 * sink is already enabled no memory is needed and the HW need not be
-- 
2.33.0


