Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3225CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 16:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VqpF95Me50rWFEF/pPooatQSHRrhpris1NlOAFjPDf8=; b=S3s2hCRp6FC7WO8f6ziloxEKhi
	1xJXoWiv1r8MiFWznDUs8Fr70w8RYRM48n/vJ7FrEWeaaePB5/zCnNMy5G5A6+Ph6Rx+4atGDujgA
	iaMNO24S7r4kWkq5f6sNzr5SkbhXyoeeZTeKLJLV6KQQ0brblxgvXiTYHK1dfg5d+dXoRW/LBDwri
	F6CpivLTrnTAwWy+dHZODzeZeBtiNo9kX7wa65MLvWjn+YGGGrD0zKardx/rOvHhYRihipj1/YnDp
	Dx0lxTVhjD6741lGZcy2hvPup3yj1wiufyRNS2X2Myb/4YHpVYHYtE2IPtARyty+BT3b30uB9rVni
	IWE+TSTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSdyA-0000000621Y-2bmw;
	Thu, 28 May 2026 16:52:30 +0000
Received: from mail-m128189.netease.com ([103.209.128.189])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSdy6-0000000620u-3WkG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 16:52:28 +0000
Received: from PC-202605011814.localdomain (unknown [IPV6:2409:8924:2013:1a6b:50af:214a:ea2b:7da2])
	by smtp.qiye.163.com (Hmail) with ESMTP id 403594fc0;
	Fri, 29 May 2026 00:52:10 +0800 (GMT+08:00)
From: Runyu Xiao <runyu.xiao@seu.edu.cn>
To: suzuki.poulose@arm.com,
	alexander.shishkin@linux.intel.com
Cc: mike.leach@linaro.org,
	james.clark@linaro.org,
	mathieu.poirier@linaro.org,
	gregkh@linuxfoundation.org,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	runyu.xiao@seu.edu.cn,
	jianhao.xu@seu.edu.cn,
	stable@vger.kernel.org
Subject: [PATCH] coresight: etb10: restore atomic_t for shared reading state
Date: Fri, 29 May 2026 00:52:01 +0800
Message-Id: <20260528165201.319452-1-runyu.xiao@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9e6f8028ff03a1kunm2f79b8526ba12
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZHhpJVh9NTE1PHU0YTUsZS1YeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJT0tCQUNCSU9BSUtKSEFKGk0ZQU5LGh1BSUpPGkEeGkkZQU
	wfGklZV1kWGg8SFR0UWUFZT0tIVUpLSUhOQ0NVSktLVUtZBg++
DKIM-Signature: a=rsa-sha256;
	b=WW05eevjZQMJAhFhF9ztJLnsUyl5H1/yh18GhU7JzlaRniiQ6KXLE2Nia81lzO7qdhzh6Bp7UeX/357JhOfycisZiGkixs6pFrvWCf9KyQAYYx+dMr96SZC7ai2hLVzH1jQhj9MrGDrsnA6yK77grpufcnBldI5wBiEWXQfKPwo=; c=relaxed/relaxed; s=default; d=seu.edu.cn; v=1;
	bh=VqpF95Me50rWFEF/pPooatQSHRrhpris1NlOAFjPDf8=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_095227_137748_CC711D80 
X-CRM114-Status: GOOD (  13.59  )
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

The etb10 miscdevice uses drvdata->reading as a shared exclusivity gate
for userspace buffer access. etb_open() claims that gate with
local_cmpxchg(), and etb_release() clears it with local_set().

That gate is shared per-device state rather than CPU-local state. A
running system can reach it whenever /dev/<etb> is opened, closed, and
reopened by different tasks while the device remains registered, so the
same drvdata->reading variable may be claimed on one CPU and later
cleared on another.

This code used to use atomic_t for the same gate, but commit
27b10da8fff2 ("coresight: etb10: moving to local atomic operations")
changed it to local_t even though the access pattern remained cross-task
and cross-CPU. Restore atomic_t together with atomic_cmpxchg() and
atomic_set() so the exclusivity gate again uses a primitive intended
for shared state.

The issue was found on Linux v6.18.21 by our static analysis tool while
scanning surviving local_t-on-shared-state sites, and then manually
reviewed against the live etb10 file-op path.

It was runtime-validated with a reproducible QEMU no-device KCSAN PoC
that kept the same report-local contract:

  1. use one shared struct etb_drvdata carrier and its
     drvdata->reading gate;
  2. call etb_open() and etb_release() sequentially on that gate to
     confirm the original claim/clear path;
  3. bind the open side to CPU0 and the release side to CPU1 for the
     same gate to show cross-CPU ownership;
  4. run bound workers that repeatedly race etb_open() and
     etb_release() on the same gate until KCSAN reports a target hit.

The harness recorded:

  L1 passed open=1 release=1
  reading_after_open=1 reading_after_release=0
  L2 passed open_cpu=0 release_cpu=1
  cross_cpu_release=1 reading_after=0 open_ret=0

Representative KCSAN excerpt from the no-device validation run:

  BUG: KCSAN: data-race in etb_open.constprop.0.isra.0 [vuln_msv]

  write to 0xffffffffc0003810 of 4 bytes by task 216 on cpu 1:
   etb_open.constprop.0.isra.0+0x38/0x80 [vuln_msv]
   l3_worker_thread_fn+0x4f/0xf0 [vuln_msv]
   kthread+0x17e/0x1c0
   ret_from_fork+0x22/0x30

  read to 0xffffffffc0003810 of 4 bytes by task 215 on cpu 0:
   etb_open.constprop.0.isra.0+0x18/0x80 [vuln_msv]
   l3_worker_thread_fn+0x4f/0xf0 [vuln_msv]
   kthread+0x17e/0x1c0
   ret_from_fork+0x22/0x30

  value changed: 0x00000000 -> 0x00000001

  Reported by Kernel Concurrency Sanitizer on:
  CPU: 0 PID: 215 Comm: etb10_l3_a Tainted: G           O       6.1.66 #2

This no-device harness is not a real ETB10 hardware end-to-end run, but
it preserves the same shared drvdata->reading gate and the same
etb_open()/etb_release() claim/clear contract. No real ETB10 hardware
was available for runtime testing.

Build-tested with:
  make olddefconfig
  make -j"$(nproc)" drivers/hwtracing/coresight/coresight-etb10.o

Fixes: 27b10da8fff2 ("coresight: etb10: moving to local atomic operations")
Cc: stable@vger.kernel.org
Signed-off-by: Runyu Xiao <runyu.xiao@seu.edu.cn>
---
 drivers/hwtracing/coresight/coresight-etb10.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etb10.c b/drivers/hwtracing/coresight/coresight-etb10.c
index 35db1b6093d1..98269ea6f7ae 100644
--- a/drivers/hwtracing/coresight/coresight-etb10.c
+++ b/drivers/hwtracing/coresight/coresight-etb10.c
@@ -85,7 +85,7 @@ struct etb_drvdata {
 	struct coresight_device	*csdev;
 	struct miscdevice	miscdev;
 	raw_spinlock_t		spinlock;
-	local_t			reading;
+	atomic_t		reading;
 	pid_t			pid;
 	u8			*buf;
 	u32			buffer_depth;
@@ -603,7 +603,7 @@ static int etb_open(struct inode *inode, struct file *file)
 	struct etb_drvdata *drvdata = container_of(file->private_data,
 						   struct etb_drvdata, miscdev);
 
-	if (local_cmpxchg(&drvdata->reading, 0, 1))
+	if (atomic_cmpxchg(&drvdata->reading, 0, 1))
 		return -EBUSY;
 
 	dev_dbg(&drvdata->csdev->dev, "%s: successfully opened\n", __func__);
@@ -641,7 +641,7 @@ static int etb_release(struct inode *inode, struct file *file)
 {
 	struct etb_drvdata *drvdata = container_of(file->private_data,
 						   struct etb_drvdata, miscdev);
-	local_set(&drvdata->reading, 0);
+	atomic_set(&drvdata->reading, 0);
 
 	dev_dbg(&drvdata->csdev->dev, "%s: released\n", __func__);
 	return 0;
-- 
2.34.1

