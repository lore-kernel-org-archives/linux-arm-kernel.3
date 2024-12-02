Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCB92D10DDD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 09:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9CnR6cugJeZs80WFd1vc3StZ9brSKMmV49E9dW03A9g=; b=Rr9X+39+Uu9ggILJGZDYKCo5K2
	VhK1ldnlPDgD+aDY3E/DnhQ03kqgkI6uWTZnV6PkcQXISqrtxb1lBn9OwNrUzvb4mHUpwMjSHKx/S
	2Xf0fE1Y+QFfEiM6Qbs3WqMGYOasTZNdmVgRz1j++ocW09Auuj7YIt1vL8YdWy2yeoKVJN48IOhP2
	w/DY09C/gjqq2Bz3p/ln4XN/fL5dJ9f4/54Epp7CiaWX5CH+QaqXMmy+q0PnLN10jeAfymEuCtAPK
	cgznpJIiC9CPaFssrNzGBVpbkx/7++iQUkbi+Lycnzd28aSfpNA+/dNnK9LspGSw5+ck5YFOmvqgc
	mlSBsfgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI2hA-00000005Yo9-2HpD;
	Mon, 02 Dec 2024 09:26:20 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI2gB-00000005Ygm-1Ege
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 09:25:21 +0000
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Y1yxX42Scz1T6GV;
	Mon,  2 Dec 2024 17:22:56 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id 569911A0188;
	Mon,  2 Dec 2024 17:25:11 +0800 (CST)
Received: from localhost.localdomain (10.50.165.33) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Mon, 2 Dec 2024 17:25:10 +0800
From: Yicong Yang <yangyicong@huawei.com>
To: <suzuki.poulose@arm.com>, <mike.leach@linaro.org>,
	<james.clark@linaro.org>, <coresight@lists.linaro.org>,
	<linux-arm-kernel@lists.infradead.org>
CC: <jonathan.cameron@huawei.com>, <prime.zeng@hisilicon.com>,
	<hejunhao3@huawei.com>, <linuxarm@huawei.com>, <yangyicong@hisilicon.com>
Subject: [PATCH 1/4] coresight: tmc: Don't reallocate the sysfs_buffer if it's in use
Date: Mon, 2 Dec 2024 17:24:16 +0800
Message-ID: <20241202092419.11777-2-yangyicong@huawei.com>
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
X-CRM114-CacheID: sfid-20241202_012519_678640_A37B329B 
X-CRM114-Status: GOOD (  12.08  )
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

From: Suzuki K Poulose <suzuki.poulose@arm.com>

Enable the trace in below steps will crash the kernel by NULL pointer
dereferencing:
echo 1 > /sys/bus/coresight/devices/tmc_etr0/enable_sink
echo 1 > /sys/bus/coresight/devices/etm0/enable_source
echo 0x400000 > /sys/bus/coresight/devices/tmc_etr0/buffer_size
echo 1 > /sys/bus/coresight/devices/etm2/enable_source
dd if=/dev/tmc_etr0 of=test_etm_sysfs_etr_030.data

The call trace will be like:
 WARNING: CPU: 39 PID: 8586 at drivers/hwtracing/coresight/coresight-tmc-etr.c:1123 __tmc_etr_disable_hw+0x108/0x140 [coresight_tmc]
 [...]
 Call trace:
  __tmc_etr_disable_hw+0x108/0x140 [coresight_tmc]
  tmc_read_prepare_etr+0xc0/0xd0 [coresight_tmc]
  tmc_open+0x60/0xa0 [coresight_tmc]
  misc_open+0x11c/0x170
  chrdev_open+0xcc/0x2b0
  do_dentry_open+0x140/0x4e0
  vfs_open+0x34/0xf8
  path_openat+0x2b0/0xf58
  do_filp_open+0x8c/0x148
  do_sys_openat2+0xb8/0xe8
  __arm64_sys_openat+0x70/0xc0
  el0_svc_common.constprop.0+0x64/0x148
  do_el0_svc+0x24/0x38
  el0_svc+0x40/0x140
  el0t_64_sync_handler+0xc0/0xc8
  el0t_64_sync+0x1a4/0x1a8
 ---[ end trace 0000000000000000 ]---
 Unable to handle kernel NULL pointer dereference at virtual address 0000000000000028
 [...]
 Call trace:
  tmc_etr_get_sysfs_trace+0x10/0x80 [coresight_tmc]
  vfs_read+0xcc/0x310
  ksys_read+0x74/0x108
  __arm64_sys_read+0x24/0x38
  el0_svc_common.constprop.0+0x64/0x148
  do_el0_svc+0x24/0x38
  el0_svc+0x40/0x140

Due to the buffer size changed, the buffer will be reallocated in
tmc_etr_get_sysfs_buffer() when the second source enabled. At trace
end tmc_etr_sync_sysfs_buf() will reset the drvdata->sysfs_buf and
trigger the later NULL pointer dereference when reading out the
data. Fix this by checking whether the buffer's in use before
reallocate a now one in tmc_etr_get_sysfs_buffer().

Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 drivers/hwtracing/coresight/coresight-tmc-etr.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index a48bb85d0e7f..ad83714ca4dc 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1178,7 +1178,11 @@ static struct etr_buf *tmc_etr_get_sysfs_buffer(struct coresight_device *csdev)
 	 */
 	spin_lock_irqsave(&drvdata->spinlock, flags);
 	sysfs_buf = READ_ONCE(drvdata->sysfs_buf);
-	if (!sysfs_buf || (sysfs_buf->size != drvdata->size)) {
+
+	/* Don't reallocate the buffer if it's already in use */
+	if (!sysfs_buf ||
+	    ((sysfs_buf->size != drvdata->size) &&
+	     coresight_get_mode(csdev) != CS_MODE_SYSFS)) {
 		spin_unlock_irqrestore(&drvdata->spinlock, flags);
 
 		/* Allocate memory with the locks released */
-- 
2.24.0


