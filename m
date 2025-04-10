Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB0FAC369A5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 15:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qfLkVHqKOkq18YfrYBSiR6b9zZ++DxRi+Oa+0TkBEjM=; b=MOIykbpx+Rz8ZlDblUwr6qoGuE
	8Txwnlwtph0WlLcaVknBRMuLs8n6WEhPmGoeIl0SE6FowPnLF8tKSbmr/dBY5qAaYW0zieeg5tP9Y
	zL9ifClk6u7P4AR+LUovD95XiuGHbIBeKVyLM6v1s3xqnr1L1uQWUtKKAJwplY9t7R9BShaiHjiKA
	TmPgsTDGBQP95Gp2vmuMxVAn+X9hhgdbjw/wmCFvPXi6QBKR20Ob4BFzoS4CBdyssUum7Bjm6rXJL
	89B2NGFzshPryh+fiP+OOMgCw4V8YYETdENsgQGVqoWG3NiOZzN9OMtJY2zvjtQYdMWp3y3ONw74w
	R4EU2YUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2tny-0000000B0ue-1oZJ;
	Thu, 10 Apr 2025 15:27:02 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2t6f-0000000Asqu-391b;
	Thu, 10 Apr 2025 14:42:19 +0000
X-UUID: fd0d6e24161911f0a1e849db4cc18d44-20250410
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=qfLkVHqKOkq18YfrYBSiR6b9zZ++DxRi+Oa+0TkBEjM=;
	b=nKpO7OS0nDOpxxJQDxQcrO3vMu8k4kS2d/pDXJXcXlBGL/Iv7G3ZkUalaiFb0g0CnVP4nsBnDpqIy1ggw5qMrIP0t9bT/2P47dYRE2rzmQHc7pXI8fkR11EN/tFymE1X9yADx1NbCfZGMWm2WUXSypYhieXH5uQTe91nKz5X5Sw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:bd0e88c9-3f2c-4edd-a47f-a9a6c4953232,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:f039188b-0afe-4897-949e-8174746b1932,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: fd0d6e24161911f0a1e849db4cc18d44-20250410
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <tze-nan.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 849958668; Thu, 10 Apr 2025 07:42:12 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 10 Apr 2025 22:42:09 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 10 Apr 2025 22:42:09 +0800
From: Tze-nan Wu <Tze-nan.Wu@mediatek.com>
To: Oleg Nesterov <oleg@redhat.com>, Christian Brauner <brauner@kernel.org>
CC: Andrew Morton <akpm@linux-foundation.org>, <wsd_upstream@mediatek.com>,
	<bobule.chang@mediatek.com>, Tze-nan Wu <Tze-nan.Wu@mediatek.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, chenqiwu <chenqiwu@xiaomi.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [RFC PATCH] exit: Skip panic in do_exit() during poweroff
Date: Thu, 10 Apr 2025 22:39:37 +0800
Message-ID: <20250410143937.1829272-1-Tze-nan.Wu@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_074217_810190_C411DEE8 
X-CRM114-Status: GOOD (  20.59  )
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

When kernel_power_off() is invoked by a process other than the global
init (PID 1) on a specific core, other CPUs are still allowed to execute
processes, even though the userspace becomes unreliable.

If PID 1 exits due to the unreliable userspace after kernel_power_off()
invoked, the panic follow by the last thread of global init exited in
do_exit() will stop the kernel_power_off() procedure, turn a shutdown
behavior into panic flow(reboot).

Add a condition check to ensure that the panic triggered by the last
thread of the global init exiting, only occurs while:
( system_state != SYSTEM_POWER_OFF and system_state != SYSTEM_RESTART).
Otherwise, WARN() instead.

[On Android 16 with arm64 arch]
Here's a scenario where the global init exits during kernel_power_off:
If PID 1 encounters a page fault after kernel_power_off() has been
invoked, the kernel will fail to handle the page fault because the
disk(UFS) has already shut down.
Consequently, the kernel will send a SIGBUS to PID 1 to indicate the
page fault failure, and ultimately, the panic will occur after PID 1
exits due to receiving the SIGBUS.

            cpu1                           cpu2
          ----------                     ----------
    kernel_power_off() start
        UFS shutdown
            ...                	       PID 1 page fault
            ...                    page fault handle failure
            ...			             PID 1 received SIGBUS
            ...                             panic
   kernel_power_off() not done

Backtrace while PID 1 received signal 7:
   init-1 [007] d..1 41239.922385: \
      signal_generate: sig=7 errno=0 code=2 comm=init pid=1 grp=0 res=0
   init-1 [007] d..1 41239.922389: kernel_stack: <stack trace>
   => __send_signal_locked
   => send_signal_locked
   => force_sig_info_to_task
   => force_sig_fault
   => arm64_force_sig_fault
   => do_page_fault
   => do_translation_fault
   => do_mem_abort
   => el0_ia
   => el0t_64_sync_handler

Simplified kernel log:
kernel_power_off() invoked by pt_notify_thread.
[41239.526109] pt_notify_threa: reboot set flag, old value 0x********,
*.
[41239.526114] pt_notify_threa: reboot set flag new value 0x********.
UFS reject I/O after kerenl_power_off.
[41239.686411]  scsi +scsi******** apexd: sd* ******** rejecting I/O to
offline device.
Lots of I/O error & erofs error happened after kernel_power_off().
[41239.690312] apexd: I/O error, dev sdc, sector ******* op ***:(READ)
flags 0x**** phys_seg ** prio class 0.
[41239.690465] apexd: I/O error, dev sdc, sector ******* op ***:(READ)
flags 0x**** phys_seg ** prio class 0.
...
...
[41239.922265] init: erofs: (device ****): z_erofs_read_folio: read
error * @ *** of nid ********.
[41239.922341] init: erofs: (device ****): z_erofs_read_folio: read
error * @ *** of nid ********.
Finally device panic due to PID 1 received SIGBUS.
[41239.923789] init: Kernel panic - not syncing: Attempted to kill init!
exitcode=0x00000007

Fixes: 43cf75d96409 ("exit: panic before exit_mm() on global init exit")
Link: https://lore.kernel.org/all/20191219104223.xvk6ppfogoxrgmw6@wittgenstein/
Signed-off-by: Tze-nan Wu <Tze-nan.Wu@mediatek.com>
---

I am also wondering if this patch is reasonable?

From my perspective, there are two reasons not to trigger such panic
during kernel_power_off() or kernel_restart():
  1. It is not worthwhile to interrupt kernel_power_off() by a panic
     resulted from userspace instability.
  2. The panic in do_exit() was originally designed to ensure a usable
     coredump if the last thread of the global init process exited.
	 However, capture a coredump triggered by userspace crash after
     kernel_power_off() seems not particularly useful, in my opinion.
	 
In certain scenarios, a kernel module may need to directly power off
from kernel space to protect hardware (e.g., thermal protection).
In my opinion, rather than causing a panic during kernel_power_off(),
it sounds better to allow the device to complete its power-off process.

Appreciate for any comment on this, if there's any better way to
handle this panic, please point me out.

---
 kernel/exit.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/kernel/exit.c b/kernel/exit.c
index 1dcddfe537ee..23cb6b42a1f1 100644
--- a/kernel/exit.c
+++ b/kernel/exit.c
@@ -901,11 +901,17 @@ void __noreturn do_exit(long code)
 	if (group_dead) {
 		/*
 		 * If the last thread of global init has exited, panic
-		 * immediately to get a useable coredump.
+		 * immediately to get a usable coredump, except when the
+		 * device is currently powering off or restarting.
 		 */
-		if (unlikely(is_global_init(tsk)))
-			panic("Attempted to kill init! exitcode=0x%08x\n",
-				tsk->signal->group_exit_code ?: (int)code);
+		if (unlikely(is_global_init(tsk))) {
+			if (system_state != SYSTEM_POWER_OFF &&
+			    system_state != SYSTEM_RESTART)
+				panic("Attempted to kill init! exitcode=0x%08x\n",
+				      tsk->signal->group_exit_code ?: (int)code);
+			WARN(1, "Attempted to kill init! exitcode=0x%08x\n",
+			     tsk->signal->group_exit_code ?: (int)code);
+		}
 
 #ifdef CONFIG_POSIX_TIMERS
 		hrtimer_cancel(&tsk->signal->real_timer);
-- 
2.45.2


