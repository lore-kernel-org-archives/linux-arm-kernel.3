Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55DD3C61DB2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 08:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=M5JZlSM1LhLy0SQ19Tkx1NwHmMyReoGwUgGBqgLGVOM=; b=BHaUEs5EvKXoBecankxxRLb8GX
	dSPPZvU4xMOMMf7fIFP7dYZdhns70cfSrVobj/yiTCG1d/+agvc2sGXxX3c6qHteBaWcT7B4rXTuS
	y+QPtPOZvCFxiXIzyRgBRoBiY/gPzsowq8Tx/l1iULbSsuACvJ3f9d/EllV9zSqgmnkV9PrZeZjdB
	Jjhh8L0kyCbTATfOBMG58MbIMK5prXMikwI7K8AMqO3pVTGZkZhoNf/RDiV0Xj/1+ugMoephms6bw
	ovF6nKNOEkkpHd1XJ1dFdh3q2MJvLzW4fbjg00KTW+lT6fhpwxqguSYZ6W6vECQFN/DfJtcUqOCzO
	tVkULrug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOY4o-00000003gcj-0Srd;
	Mon, 09 Jun 2025 08:41:54 +0000
Received: from mx.swemel.ru ([95.143.211.150])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOY0K-00000003gGR-2yAS;
	Mon, 09 Jun 2025 08:37:18 +0000
From: Denis Arefev <arefev@swemel.ru>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=swemel.ru; s=mail;
	t=1749458230;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=M5JZlSM1LhLy0SQ19Tkx1NwHmMyReoGwUgGBqgLGVOM=;
	b=OzSX9d57vkqshQh00a/8Hob5qFWfdi6VQB2wqkIT7hHS4dYf6JE0uQK/WzJ85fEpSAblKx
	JfBD4cyxgaaUGy6woQHdT+hXlY1aZNScMR5tkZJqQ39RFKtmCVGM56zkvAGbjiyDhO/7Zw
	RT3TVS1zwoKIXN+RgWPhnkTd/zp/o6k=
To: stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	Qun-Wei Lin <qun-wei.lin@mediatek.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	lvc-project@linuxtesting.org,
	Andrew Yang <andrew.yang@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Casper Li <casper.li@mediatek.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Chinwen Chang <chinwen.chang@mediatek.com>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Shakeel Butt <shakeel.butt@linux.dev>
Subject: [PATCH 5.10] sched/task_stack: fix object_is_on_stack() for KASAN tagged pointers
Date: Mon,  9 Jun 2025 11:37:08 +0300
Message-ID: <20250609083709.27569-1-arefev@swemel.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_013717_249941_F0A03DD5 
X-CRM114-Status: UNSURE (   9.91  )
X-CRM114-Notice: Please train this message.
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

From: Qun-Wei Lin <qun-wei.lin@mediatek.com>

commit fd7b4f9f46d46acbc7af3a439bb0d869efdc5c58 upstream.

When CONFIG_KASAN_SW_TAGS and CONFIG_KASAN_STACK are enabled, the
object_is_on_stack() function may produce incorrect results due to the
presence of tags in the obj pointer, while the stack pointer does not have
tags.  This discrepancy can lead to incorrect stack object detection and
subsequently trigger warnings if CONFIG_DEBUG_OBJECTS is also enabled.

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

Link: https://lkml.kernel.org/r/20241113042544.19095-1-qun-wei.lin@mediatek.com
Signed-off-by: Qun-Wei Lin <qun-wei.lin@mediatek.com>
Cc: Andrew Yang <andrew.yang@mediatek.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Casper Li <casper.li@mediatek.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Chinwen Chang <chinwen.chang@mediatek.com>
Cc: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: Shakeel Butt <shakeel.butt@linux.dev>
Cc: <stable@vger.kernel.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
[Denis: minor fix to resolve merge conflict.]                                           
Signed-off-by: Denis Arefev <arefev@swemel.ru>                                    
---
Backport fix for CVE-2024-53128
Link: https://nvd.nist.gov/vuln/detail/CVE-2024-53128
---
 include/linux/sched/task_stack.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/linux/sched/task_stack.h b/include/linux/sched/task_stack.h
index 879a5c8f930b..7aa1235a5bbe 100644
--- a/include/linux/sched/task_stack.h
+++ b/include/linux/sched/task_stack.h
@@ -8,6 +8,8 @@
 
 #include <linux/sched.h>
 #include <linux/magic.h>
+#include <linux/refcount.h>
+#include <linux/kasan.h>
 
 #ifdef CONFIG_THREAD_INFO_IN_TASK
 
@@ -86,6 +88,7 @@ static inline int object_is_on_stack(const void *obj)
 {
 	void *stack = task_stack_page(current);
 
+	obj = kasan_reset_tag(obj);
 	return (obj >= stack) && (obj < (stack + THREAD_SIZE));
 }
 
-- 
2.43.0


