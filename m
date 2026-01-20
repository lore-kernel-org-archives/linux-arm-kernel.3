Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84019D2ECE9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 14:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=61uJrUPfT5U9DRGtqaHRnNb4l+eYBRqUTw8sR2BEonU=; b=iWvlQRcGvGk+Z7uOGNWiCgQuDQ
	qmpcqVnpmos93BXBf64rxZ+H8sehdjawx+GXm3vWyaJX+XKsTV6N2SFhi7qb2LrmP0hhWbg4mJi7f
	7tlmlDsLt2xlw2NDNEl8DfeJvUo9QhJiNdi60/dOR7xv7UlEgK6yHgimTmt3DvnIREKSIIy8JFa6j
	OWGU8lGKtjjQxtz/sZlK8XNPTvE9/7RUX202NFoNPIkkATbbCiU015TXhhZlLx2Xe+1Y+YtWoQk7K
	3NsWtGyvZ42EHXwy72eQiWGUwp280mLs0UaRgVRI9pJhrhPHa0DxxO/WrQ1CRHOZXkJUamWQA/IlU
	SdMU40jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viD56-000000041UZ-2uR4;
	Tue, 20 Jan 2026 14:51:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viD53-000000041SY-0J9N
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 20 Jan 2026 14:51:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=61uJrUPfT5U9DRGtqaHRnNb4l+eYBRqUTw8sR2BEonU=; b=fMRDX3cCoJfzQH7LK043DmSCZ6
	EK/LU/XbyDPk/4I1Op65fKiLZiQsEPTCIbbSMTXoayESIA3eKaGEa2R9QyguYHY1jLmTlnW6r4esZ
	IALY3XjLNUZcHMTIK8yOoNxFlRmgNbGXFRpaRujB710AAY2TrmkdpABNulv4og3IhG+lZymATM3Fc
	zMq+esx5RkTu+QH/PxVT7tGQX7zKz+/bg9Bn+eCPqTZ3o5NDzyAmL13FjZC6rtAFkuhIn81RmMtdd
	DCHjxeKAOxr5QEvWq9VLpCumZUE4VLc8k7T/ptdBa1e1JWXr+WP92kWO1fDIA6fnI8bHR7b8i9gza
	92zsbzng==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viD4y-0000000EFl3-3lsp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 14:51:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 685CF1684;
	Tue, 20 Jan 2026 06:51:29 -0800 (PST)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0A8633F694;
	Tue, 20 Jan 2026 06:51:34 -0800 (PST)
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: broonie@kernel.org,
	catalin.marinas@arm.com,
	mark.rutland@arm.com,
	syzbot+d4ab35af21e99d07ce67@syzkaller.appspotmail.com,
	will@kernel.org
Subject: [PATCH 2/3] arm64/fpsimd: signal: Allocate SSVE storage when restoring ZA
Date: Tue, 20 Jan 2026 14:51:06 +0000
Message-Id: <20260120145107.1278972-3-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20260120145107.1278972-1-mark.rutland@arm.com>
References: <20260120145107.1278972-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_145137_284701_441D61E3 
X-CRM114-Status: GOOD (  13.62  )
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

The code to restore a ZA context doesn't attempt to allocate the task's
sve_state before setting TIF_SME. Consequently, restoring a ZA context
can place a task into an invalid state where TIF_SME is set but the
task's sve_state is NULL.

In legitimate but uncommon cases where the ZA signal context was NOT
created by the kernel in the context of the same task (e.g. if the task
is saved/restored with something like CRIU), we have no guarantee that
sve_state had been allocated previously. In these cases, userspace can
enter streaming mode without trapping while sve_state is NULL, causing a
later NULL pointer dereference when the kernel attempts to store the
register state:

| # ./sigreturn-za
| Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
| Mem abort info:
|   ESR = 0x0000000096000046
|   EC = 0x25: DABT (current EL), IL = 32 bits
|   SET = 0, FnV = 0
|   EA = 0, S1PTW = 0
|   FSC = 0x06: level 2 translation fault
| Data abort info:
|   ISV = 0, ISS = 0x00000046, ISS2 = 0x00000000
|   CM = 0, WnR = 1, TnD = 0, TagAccess = 0
|   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
| user pgtable: 4k pages, 52-bit VAs, pgdp=0000000101f47c00
| [0000000000000000] pgd=08000001021d8403, p4d=0800000102274403, pud=0800000102275403, pmd=0000000000000000
| Internal error: Oops: 0000000096000046 [#1]  SMP
| Modules linked in:
| CPU: 0 UID: 0 PID: 153 Comm: sigreturn-za Not tainted 6.19.0-rc1 #1 PREEMPT
| Hardware name: linux,dummy-virt (DT)
| pstate: 214000c9 (nzCv daIF +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
| pc : sve_save_state+0x4/0xf0
| lr : fpsimd_save_user_state+0xb0/0x1c0
| sp : ffff80008070bcc0
| x29: ffff80008070bcc0 x28: fff00000c1ca4c40 x27: 63cfa172fb5cf658
| x26: fff00000c1ca5228 x25: 0000000000000000 x24: 0000000000000000
| x23: 0000000000000000 x22: fff00000c1ca4c40 x21: fff00000c1ca4c40
| x20: 0000000000000020 x19: fff00000ff6900f0 x18: 0000000000000000
| x17: fff05e8e0311f000 x16: 0000000000000000 x15: 028fca8f3bdaf21c
| x14: 0000000000000212 x13: fff00000c0209f10 x12: 0000000000000020
| x11: 0000000000200b20 x10: 0000000000000000 x9 : fff00000ff69dcc0
| x8 : 00000000000003f2 x7 : 0000000000000001 x6 : fff00000c1ca5b48
| x5 : fff05e8e0311f000 x4 : 0000000008000000 x3 : 0000000000000000
| x2 : 0000000000000001 x1 : fff00000c1ca5970 x0 : 0000000000000440
| Call trace:
|  sve_save_state+0x4/0xf0 (P)
|  fpsimd_thread_switch+0x48/0x198
|  __switch_to+0x20/0x1c0
|  __schedule+0x36c/0xce0
|  schedule+0x34/0x11c
|  exit_to_user_mode_loop+0x124/0x188
|  el0_interrupt+0xc8/0xd8
|  __el0_irq_handler_common+0x18/0x24
|  el0t_64_irq_handler+0x10/0x1c
|  el0t_64_irq+0x198/0x19c
| Code: 54000040 d51b4408 d65f03c0 d503245f (e5bb5800)
| ---[ end trace 0000000000000000 ]---

Fix this by having restore_za_context() ensure that the task's sve_state
is allocated, matching what we do when taking an SME trap. Any live
SVE/SSVE state (which is restored earlier from a separate signal
context) must be preserved, and hence this is not zeroed.

Fixes: 39782210eb7e ("arm64/sme: Implement ZA signal handling")
Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Will Deacon <will@kernel.org>
---
 arch/arm64/kernel/signal.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/kernel/signal.c b/arch/arm64/kernel/signal.c
index 1110eeb21f572..9c2e26e01d729 100644
--- a/arch/arm64/kernel/signal.c
+++ b/arch/arm64/kernel/signal.c
@@ -576,6 +576,10 @@ static int restore_za_context(struct user_ctxs *user)
 	if (user->za_size < ZA_SIG_CONTEXT_SIZE(vq))
 		return -EINVAL;
 
+	sve_alloc(current, false);
+	if (!current->thread.sve_state)
+		return -ENOMEM;
+
 	sme_alloc(current, true);
 	if (!current->thread.sme_state) {
 		current->thread.svcr &= ~SVCR_ZA_MASK;
-- 
2.30.2


