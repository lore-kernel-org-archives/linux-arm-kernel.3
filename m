Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4071BD10DCF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 09:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HSOZ+NCNJBh82ZpanMfAli0sm776eGhBN4EdD7Z6roQ=; b=lCWtpZtGaVaXc02YJ+/pSMySS2
	ssX9hfg0oTf/p+dGtCP4K25Wa07X4OYSdKTEAC9sUc2JAyCnecVr1M3LBiepnLowgw44e3zm3Xezl
	6ZPF7vFr3XeoCGts8DstXAtoGPA+BtAo1+LGDxI3RXxFc0VgpeoJHZdro6RuY83gX1SeveLXSZr4y
	/cgWYm/attBB9nDNjLLb4zgxWklIrXYhhSK00Dy4N09bd8qL36vfZ43hq1l1AJunlpoGtPiEI+cy2
	rPIV6UpnqWmfqcmufGdSbovbFJSkYbzdvU6WDgB5RjvTKkGiMlWzYz0UbpzouGBX3DpguQ/aW/exS
	r7C3zZjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI2j5-00000005ZNR-30dj;
	Mon, 02 Dec 2024 09:28:19 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI2gB-00000005Ygn-2o6g
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 09:25:22 +0000
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Y1yyK0Gm8zRhrW;
	Mon,  2 Dec 2024 17:23:37 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id 4F84E180105;
	Mon,  2 Dec 2024 17:25:12 +0800 (CST)
Received: from localhost.localdomain (10.50.165.33) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Mon, 2 Dec 2024 17:25:11 +0800
From: Yicong Yang <yangyicong@huawei.com>
To: <suzuki.poulose@arm.com>, <mike.leach@linaro.org>,
	<james.clark@linaro.org>, <coresight@lists.linaro.org>,
	<linux-arm-kernel@lists.infradead.org>
CC: <jonathan.cameron@huawei.com>, <prime.zeng@hisilicon.com>,
	<hejunhao3@huawei.com>, <linuxarm@huawei.com>, <yangyicong@hisilicon.com>
Subject: [PATCH 3/4] coresight: tmc-etr: Fix race condition between sysfs and perf mode
Date: Mon, 2 Dec 2024 17:24:18 +0800
Message-ID: <20241202092419.11777-4-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20241202092419.11777-1-yangyicong@huawei.com>
References: <20241202092419.11777-1-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.165.33]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_012520_047301_EFC43BF1 
X-CRM114-Status: GOOD (  13.56  )
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

Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 .../hwtracing/coresight/coresight-tmc-etr.c   | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index ad83714ca4dc..d382d95da5ff 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1230,6 +1230,36 @@ static int tmc_enable_etr_sink_sysfs(struct coresight_device *csdev)
 
 	spin_lock_irqsave(&drvdata->spinlock, flags);
 
+	/*
+	 * Since the sysfs buffer allocation and the hardware enablement is not
+	 * in the same critical region, it's possible to race with the perf
+	 * mode:
+	 *   [sysfs mode]                   [perf mode]
+	 *   tmc_etr_get_sysfs_buffer()
+	 *     spin_lock(&drvdata->spinlock)
+	 *     [sysfs buffer allocation]
+	 *     spin_unlock(&drvdata->spinlock)
+	 *                                  spin_lock(&drvdata->spinlock)
+	 *                                  tmc_etr_enable_hw()
+	 *                                    drvdata->etr_buf = etr_perf->etr_buf
+	 *                                  spin_unlock(&drvdata->spinlock)
+	 *   spin_lock(&drvdata->spinlock)
+	 *   tmc_etr_enable_hw()
+	 *     WARN_ON(drvdata->etr_buf) // WARN sicne etr_buf initialized at
+	 *                                  the perf side
+	 *   spin_unlock(&drvdata->spinlock)
+	 *
+	 * So check here before continue.
+	 */
+	if (coresight_get_mode(csdev) == CS_MODE_PERF) {
+		drvdata->sysfs_buf = NULL;
+		spin_unlock_irqrestore(&drvdata->spinlock, flags);
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
2.24.0


