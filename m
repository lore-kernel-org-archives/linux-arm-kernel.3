Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB56ED41D4A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 04:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Emxr/ZModhTk+YBu/LrGLB2BvoOFjQnlSY8/C8ehCuo=; b=xsl4TyDHPK2RYcZHArU4KVEluZ
	YWr7RaaO/G50lM6fJQhMsvAKmy1WGlXtow0KIsPKEdzWnIQzkmEVnsbh/AOpmddPzv1VkDOe8Sy23
	nmaHQO/+a9l7Z+mGLd49B5oM3Pltv1kPRkI3Lm31UFk52tbd8vpOaekrjEZFc1/LIXhmPFIsqdWU0
	opRSbadMlEMmyDFL1cEFoQoyfnH2xh5ADxzXldr0hzGnNxRxZWnxBdwYtEdzkqRkrL83FcDPZJXrN
	NVqypBCcjjNVtgg3UcJqxuPmEEAKv+TEwMXuTI+uW/LR2b/6QKQy3XQ5nPgkzyngEdeTlO17byS/k
	ruFPr5DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tB4zF-00000005jK9-1QWV;
	Wed, 13 Nov 2024 04:28:13 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tB4xR-00000005jCo-2kVW;
	Wed, 13 Nov 2024 04:26:23 +0000
X-UUID: 6b4c4b0ca17711ef82ff63e91e7eb18c-20241112
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Emxr/ZModhTk+YBu/LrGLB2BvoOFjQnlSY8/C8ehCuo=;
	b=nnsFO2VxDQY2TcUfkhPhCszMgDlTY0INZqJUEI4ncWjBTPnF95Qa9kMmfQS2l7WsFbIHF+YD9fGa1rg3DHXjpJngJ2b59OUVL2aBYVvZi+R/P3vmrSWP9f1dkaFOY1XCgnhEnshxJmne6WNn0ve1IQilHNjMhiMD9DLP4DQZNZg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:180edcce-803c-4ff5-b9f1-321ab43bc74c,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0fcdc3,CLOUDID:61a8101c-4f51-4e1d-bb6a-1fd98b6b19d2,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 6b4c4b0ca17711ef82ff63e91e7eb18c-20241112
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <qun-wei.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1421159990; Tue, 12 Nov 2024 21:26:14 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 12 Nov 2024 20:26:11 -0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 13 Nov 2024 12:26:11 +0800
From: Qun-Wei Lin <qun-wei.lin@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Shakeel Butt
	<shakeel.butt@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, Kent
 Overstreet <kent.overstreet@linux.dev>, Pasha Tatashin
	<pasha.tatashin@soleen.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <catalin.marinas@arm.com>, Casper Li
	<casper.li@mediatek.com>, Chinwen Chang <chinwen.chang@mediatek.com>, Andrew
 Yang <andrew.yang@mediatek.com>, Elena Yu <elena.yu@mediatek.com>,
	<wsd_upstream@mediatek.com>, Qun-Wei Lin <qun-wei.lin@mediatek.com>
Subject: [PATCH] sched/task_stack: Fix object_is_on_stack() for KASAN tagged pointers
Date: Wed, 13 Nov 2024 12:25:43 +0800
Message-ID: <20241113042544.19095-1-qun-wei.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_202621_736719_B4A601E2 
X-CRM114-Status: GOOD (  13.02  )
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

When CONFIG_KASAN_SW_TAGS and CONFIG_KASAN_STACK are enabled, the
object_is_on_stack() function may produce incorrect results due to the
presence of tags in the obj pointer, while the stack pointer does not
have tags. This discrepancy can lead to incorrect stack object detection
and subsequently trigger warnings if CONFIG_DEBUG_OBJECTS is also
enabled.

Example of the warning:

ODEBUG: object 3eff800082ea7bb0 is NOT on stack ffff800082ea0000, but annotated.
------------[ cut here ]------------
WARNING: CPU: 0 PID: 1 at lib/debugobjects.c:557 __debug_object_init+0x330/0x364
Modules linked in:
CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.12.0-rc5 #4
Hardware name: linux,dummy-virt (DT)
pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : __debug_object_init+0x330/0x364
lr : __debug_object_init+0x330/0x364
sp : ffff800082ea7b40
x29: ffff800082ea7b40 x28: 98ff0000c0164518 x27: 98ff0000c0164534
x26: ffff800082d93ec8 x25: 0000000000000001 x24: 1cff0000c00172a0
x23: 0000000000000000 x22: ffff800082d93ed0 x21: ffff800081a24418
x20: 3eff800082ea7bb0 x19: efff800000000000 x18: 0000000000000000
x17: 00000000000000ff x16: 0000000000000047 x15: 206b63617473206e
x14: 0000000000000018 x13: ffff800082ea7780 x12: 0ffff800082ea78e
x11: 0ffff800082ea790 x10: 0ffff800082ea79d x9 : 34d77febe173e800
x8 : 34d77febe173e800 x7 : 0000000000000001 x6 : 0000000000000001
x5 : feff800082ea74b8 x4 : ffff800082870a90 x3 : ffff80008018d3c4
x2 : 0000000000000001 x1 : ffff800082858810 x0 : 0000000000000050
Call trace:
 __debug_object_init+0x330/0x364
 debug_object_init_on_stack+0x30/0x3c
 schedule_hrtimeout_range_clock+0xac/0x26c
 schedule_hrtimeout+0x1c/0x30
 wait_task_inactive+0x1d4/0x25c
 kthread_bind_mask+0x28/0x98
 init_rescuer+0x1e8/0x280
 workqueue_init+0x1a0/0x3cc
 kernel_init_freeable+0x118/0x200
 kernel_init+0x28/0x1f0
 ret_from_fork+0x10/0x20
---[ end trace 0000000000000000 ]---
ODEBUG: object 3eff800082ea7bb0 is NOT on stack ffff800082ea0000, but annotated.
------------[ cut here ]------------

Signed-off-by: Qun-Wei Lin <qun-wei.lin@mediatek.com>
---
 include/linux/sched/task_stack.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/sched/task_stack.h b/include/linux/sched/task_stack.h
index bf10bdb487dd..6c2fef89a4fd 100644
--- a/include/linux/sched/task_stack.h
+++ b/include/linux/sched/task_stack.h
@@ -9,6 +9,7 @@
 #include <linux/sched.h>
 #include <linux/magic.h>
 #include <linux/refcount.h>
+#include <linux/kasan.h>
 
 #ifdef CONFIG_THREAD_INFO_IN_TASK
 
@@ -89,6 +90,7 @@ static inline int object_is_on_stack(const void *obj)
 {
 	void *stack = task_stack_page(current);
 
+	obj = kasan_reset_tag(obj);
 	return (obj >= stack) && (obj < (stack + THREAD_SIZE));
 }
 
-- 
2.45.2


