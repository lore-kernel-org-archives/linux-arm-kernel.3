Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 782E7C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 01:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Vh8HgSffo8qUUq2yi9S0fYpRAAXvgsyR97cdyt1Ai2k=; b=bean93v7WUWzIIDeYRYOe8arYd
	J51UNrmraW7DuTf/lLFW+VoaXLZ2k+VuMOk33TWs8JfujReLJLlGtC7fOTOCfx2lceEqPBp4coZz4
	k3Z6WDW2hmoYGyo1pGNjX0vHbq5m16QYKEwssQ+D3BSA+6SH68dNwWBqZee5lbkrV7XPt8yUS+AJ0
	icP016uZlXOPDBlMD5SRthtBTaKpdUfma0EZYHo5P8fe3xRQwWoQg3/A5+tpPd1jCI6Ldjdc/Ryke
	pLFhJtYz1LkHbETUpTNW3BC13MYMQwx3yCbNkkf2W0NRxmWz9CSIl9XCzM+lHXFVZS8kKmPJiXvmB
	OQkOPo+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMdAu-0000000CEpc-0a2a;
	Wed, 04 Jun 2025 01:44:16 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMcQP-0000000C7CE-2mCH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Jun 2025 00:56:15 +0000
Received: from mail.maildlp.com (unknown [172.19.163.235])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4bBpzk2KLlzYQtyh
	for <linux-arm-kernel@lists.infradead.org>; Wed,  4 Jun 2025 08:56:02 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.252])
	by mail.maildlp.com (Postfix) with ESMTP id 60ACC1A0B24
	for <linux-arm-kernel@lists.infradead.org>; Wed,  4 Jun 2025 08:56:01 +0800 (CST)
Received: from huawei.com (unknown [10.67.174.45])
	by APP3 (Coremail) with SMTP id _Ch0CgBHmcOYmT9oFKbYOA--.9669S2;
	Wed, 04 Jun 2025 08:56:01 +0800 (CST)
From: Tengda Wu <wutengda@huaweicloud.com>
To: Oleg Nesterov <oleg@redhat.com>,
	Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>,
	"David A . Long" <dave.long@linaro.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Tengda Wu <wutengda@huaweicloud.com>
Subject: [PATCH -next] arm64/ptrace: Fix stack-out-of-bounds read in regs_get_kernel_stack_nth()
Date: Wed,  4 Jun 2025 00:55:33 +0000
Message-Id: <20250604005533.1278992-1-wutengda@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _Ch0CgBHmcOYmT9oFKbYOA--.9669S2
X-Coremail-Antispam: 1UD129KBjvJXoWxZr45Gr1Dtw15ZF4kZFyxKrg_yoWrAr47pw
	nxWanrCr48twn2yw47Ar1jgr1rGw4DAF1UGrZ7Kw1Yyr18Jr1Utry7JF1xWr4jvw1DJ3y3
	GFyDArZ8tF1Uuw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkl14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4U
	MIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VUbSfO7UUUU
	U==
X-CM-SenderInfo: pzxwv0hjgdqx5xdzvxpfor3voofrz/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_175613_995545_CAAD257D 
X-CRM114-Status: GOOD (  13.25  )
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

KASAN reports a stack-out-of-bounds read in regs_get_kernel_stack_nth().

Call Trace:
[   97.283505] BUG: KASAN: stack-out-of-bounds in regs_get_kernel_stack_nth+0xa8/0xc8
[   97.284677] Read of size 8 at addr ffff800089277c10 by task 1.sh/2550
[   97.285732]
[   97.286067] CPU: 7 PID: 2550 Comm: 1.sh Not tainted 6.6.0+ #11
[   97.287032] Hardware name: linux,dummy-virt (DT)
[   97.287815] Call trace:
[   97.288279]  dump_backtrace+0xa0/0x128
[   97.288946]  show_stack+0x20/0x38
[   97.289551]  dump_stack_lvl+0x78/0xc8
[   97.290203]  print_address_description.constprop.0+0x84/0x3c8
[   97.291159]  print_report+0xb0/0x280
[   97.291792]  kasan_report+0x84/0xd0
[   97.292421]  __asan_load8+0x9c/0xc0
[   97.293042]  regs_get_kernel_stack_nth+0xa8/0xc8
[   97.293835]  process_fetch_insn+0x770/0xa30
[   97.294562]  kprobe_trace_func+0x254/0x3b0
[   97.295271]  kprobe_dispatcher+0x98/0xe0
[   97.295955]  kprobe_breakpoint_handler+0x1b0/0x210
[   97.296774]  call_break_hook+0xc4/0x100
[   97.297451]  brk_handler+0x24/0x78
[   97.298073]  do_debug_exception+0xac/0x178
[   97.298785]  el1_dbg+0x70/0x90
[   97.299344]  el1h_64_sync_handler+0xcc/0xe8
[   97.300066]  el1h_64_sync+0x78/0x80
[   97.300699]  kernel_clone+0x0/0x500
[   97.301331]  __arm64_sys_clone+0x70/0x90
[   97.302084]  invoke_syscall+0x68/0x198
[   97.302746]  el0_svc_common.constprop.0+0x11c/0x150
[   97.303569]  do_el0_svc+0x38/0x50
[   97.304164]  el0_svc+0x44/0x1d8
[   97.304749]  el0t_64_sync_handler+0x100/0x130
[   97.305500]  el0t_64_sync+0x188/0x190
[   97.306151]
[   97.306475] The buggy address belongs to stack of task 1.sh/2550
[   97.307461]  and is located at offset 0 in frame:
[   97.308257]  __se_sys_clone+0x0/0x138
[   97.308910]
[   97.309241] This frame has 1 object:
[   97.309873]  [48, 184) 'args'
[   97.309876]
[   97.310749] The buggy address belongs to the virtual mapping at
[   97.310749]  [ffff800089270000, ffff800089279000) created by:
[   97.310749]  dup_task_struct+0xc0/0x2e8
[   97.313347]
[   97.313674] The buggy address belongs to the physical page:
[   97.314604] page: refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x14f69a
[   97.315885] flags: 0x15ffffe00000000(node=1|zone=2|lastcpupid=0xfffff)
[   97.316957] raw: 015ffffe00000000 0000000000000000 dead000000000122 0000000000000000
[   97.318207] raw: 0000000000000000 0000000000000000 00000001ffffffff 0000000000000000
[   97.319445] page dumped because: kasan: bad access detected
[   97.320371]
[   97.320694] Memory state around the buggy address:
[   97.321511]  ffff800089277b00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[   97.322681]  ffff800089277b80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[   97.323846] >ffff800089277c00: 00 00 f1 f1 f1 f1 f1 f1 00 00 00 00 00 00 00 00
[   97.325023]                          ^
[   97.325683]  ffff800089277c80: 00 00 00 00 00 00 00 00 00 f3 f3 f3 f3 f3 f3 f3
[   97.326856]  ffff800089277d00: f3 f3 00 00 00 00 00 00 00 00 00 00 00 00 00 00

This issue seems to be related to the behavior of some gcc compilers and
was also fixed on the s390 architecture before:

 commit d93a855c31b7 ("s390/ptrace: Avoid KASAN false positives in regs_get_kernel_stack_nth()")

As described in that commit, regs_get_kernel_stack_nth() has confirmed that
`addr` is on the stack, so reading the value at `*addr` should be allowed.
Use READ_ONCE_NOCHECK() helper to silence the KASAN check for this case.

Fixes: 0a8ea52c3eb1 ("arm64: Add HAVE_REGS_AND_STACK_ACCESS_API feature")
Signed-off-by: Tengda Wu <wutengda@huaweicloud.com>
---
 arch/arm64/kernel/ptrace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
index f79b0d5f71ac..fe3f7e554d14 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -141,7 +141,7 @@ unsigned long regs_get_kernel_stack_nth(struct pt_regs *regs, unsigned int n)
 
 	addr += n;
 	if (regs_within_kernel_stack(regs, (unsigned long)addr))
-		return *addr;
+		return READ_ONCE_NOCHECK(addr);
 	else
 		return 0;
 }
-- 
2.34.1


