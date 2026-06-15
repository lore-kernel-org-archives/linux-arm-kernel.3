Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDB6CCD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 05:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=w/VYWIsAm3/rj9ud9HF65iMCsS44uAcxVnMSvEFYedg=; b=nN247HsoUl/LxN
	9Z8FYY0dCehuanMBZT4HeWIB8XyvhTuLwU6DIYsxlRW9EYAYcEN798+na+w0w723yJIVcwaSDk5EC
	hoOytrfqcRf14XbQptnjDuopzdEJZ64I2iX/+pbrSSJYin+O/WOBhTQIdqB7poEqBpt7rmYyySCph
	Z0yDFVgAVYs1IjSwDD3St2z90ZvSoX49EuCL9L+O5RYbfw3D2GSaNiD58lJkZ/KBqLeC96SKvIyow
	pIr+aEEQ+2xm7zq6a58GOf1OOrEf4ys1TCivf9Pf/1Tp/2PkCP1jAB3MwI11tcjZJFB37Qgh7xiGl
	Vg0MHevRZDo9Gw/tnBAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYzsz-0000000DcuW-42TL;
	Mon, 15 Jun 2026 05:29:25 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYzsw-0000000Dctx-2fyK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 05:29:25 +0000
X-UUID: 212e3022687b11f1aa26b74ffac11d73-20260615
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:1b027d43-8290-4169-97cb-9812800dba6b,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:379f686648e9e50fbb42f6dc5c6ae1f9,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|123|850|865|898,TC:nil,Content:0|15|
	50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 212e3022687b11f1aa26b74ffac11d73-20260615
X-User: liuqiqi@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <liuqiqi@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1749328274; Mon, 15 Jun 2026 13:29:07 +0800
From: liuqiqi@kylinos.cn
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH] arm64: kgdb: Fix interrupt-induced single-step exception
Date: Mon, 15 Jun 2026 13:29:03 +0800
Message-Id: <20260615052903.207943-1-liuqiqi@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_222923_012375_7FB7F70F 
X-CRM114-Status: GOOD (  10.67  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, Tongbo Wei <kf.weitongbo@h3c.com>, Qiqi Liu <liuqiqi@kylinos.cn>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Qiqi Liu <liuqiqi@kylinos.cn>

After entering kdb due to breakpoint, when we execute 'ss' or 'go'
(will delay installing breakpoints, do single-step first),
and it will enter kdb again.
We found that due to context switching caused by interrupt, 
the instruction at ss is no longer the original breakpoint instruction.

Before the patch:
[root@localhost ~]# echo g > /proc/sysrq-trigger
Entering kdb (current=0xffff030004f2bc00, pid 8818) on processor 15 due to Keyboard Entry
[15]kdb> bp sysctl_vm_numa_stat_handler
Instruction(i) BP #0 at 0xffffae550650c810 (sysctl_vm_numa_stat_handler)
    is enabled    addr at 0xffffae550650c810, hardtype=0 installed=0
[15]kdb> g
[root@localhost ~]# echo 1 > /proc/sys/vm/numa_stat
Entering kdb (current=0xffff030004f2bc00, pid 8818) on processor 12 due to Breakpoint @ 0xffffae550650c810
[12]kdb> g
Entering kdb (current=0xffff030004f2bc00, pid 8818) on processor 12 due to Breakpoint @ 0xffffae550650c810
[12]kdb> g

After the patch:
[root@localhost ~]# echo g > /proc/sysrq-trigger
Entering kdb (current=0xfffff010012c36400, pid 6488) on processor 41 due to Keyboard Entry
[41]kdb> bp sysctl_vm_numa_stat_handler
Instruction(i) BP #0 at 0xfffffd1768c2dc7c8 (sysctl_vm_numa_stat_handler)
    is enabled    addr at ffffdf1768c2dc7c8, hardtype=0 installed=0
[41]kdb> g
[root@localhost ~]# echo 1 > /proc/sys/vm/numa_stat
Entering kdb (current=0xfffff010012c36400, pid 6488) on processor 7 due to Breakpoint @ 0xfffffd1768c2dc7c8
[7]kdb> g
[root@localhost ~]#

Fixes: 44679a4f142b ("arm64: KGDB: Add step debugging support")
Co-developed-by: Tongbo Wei <kf.weitongbo@h3c.com>
Signed-off-by: Tongbo Wei <kf.weitongbo@h3c.com>
Signed-off-by: Qiqi Liu <liuqiqi@kylinos.cn>
---
 arch/arm64/kernel/kgdb.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/kernel/kgdb.c b/arch/arm64/kernel/kgdb.c
index 968324a79a89..e9a246a0c34f 100644
--- a/arch/arm64/kernel/kgdb.c
+++ b/arch/arm64/kernel/kgdb.c
@@ -101,6 +101,8 @@ struct dbg_reg_def_t dbg_reg_def[DBG_MAX_REG_NUM] = {
 	{ "fpcr", 4, -1 },
 };
 
+static DEFINE_PER_CPU(unsigned int, kgdb_pstate);
+
 char *dbg_get_reg(int regno, void *mem, struct pt_regs *regs)
 {
 	if (regno >= DBG_MAX_REG_NUM || regno < 0)
@@ -207,6 +209,8 @@ int kgdb_arch_handle_exception(int exception_vector, int signo,
 		err = 0;
 		break;
 	case 's':
+		__this_cpu_write(kgdb_pstate, linux_regs->pstate);
+		linux_regs->pstate |= PSR_I_BIT;
 		/*
 		 * Update step address value with address passed
 		 * with step packet.
@@ -252,9 +256,17 @@ NOKPROBE_SYMBOL(kgdb_compiled_brk_handler);
 
 int kgdb_single_step_handler(struct pt_regs *regs, unsigned long esr)
 {
+	unsigned int pstate;
 	if (!kgdb_single_step)
 		return DBG_HOOK_ERROR;
 
+	/* restore interrupt mask status */
+	pstate = __this_cpu_read(kgdb_pstate);
+	if (pstate & PSR_I_BIT)
+		regs->pstate |= PSR_I_BIT;
+	else
+		regs->pstate &= ~PSR_I_BIT;
+
 	kgdb_handle_exception(0, SIGTRAP, 0, regs);
 	return DBG_HOOK_HANDLED;
 }
-- 
2.25.1


