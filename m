Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2EF4E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 11:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jINeOzk/kxCLUpo5xPvvPqQUW7qOAt4Ya2wpVxUnrII=; b=o3VZV9+b19Sq0h0kbOQuJdI0Qa
	/kNF4iQXEfxxSLJ7GUSflN4niEoBaNhI8erMzvwhyced5cTgq2ThOZTnlXRY4h02xknEGf/BXzaZ2
	2BMrLZo6cOxR6zryUPFX8VFvKIluTdVNv5VBiSTuViIluJF/mr7I5EcGls8URjlzGuK/x2Hn/Ecud
	SapfXIwWV0IPJF74fuIfu7yNaabJpyTJi+8+brLihuCGEt1FqbIptQp0sIdAcicW8AukkQCyeR3NX
	mD8CsIftpd8aYirKPzageKoSI2Tq7LggJ2vGGpiNfxnTWo/yxoasx4ekYXruwns+N0W1hs68iRCxh
	UIhJiYaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKc5p-00000007X6o-2uIL;
	Mon, 09 Dec 2024 11:38:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKc4n-00000007Wxo-0yS9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 11:37:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 553171007;
	Mon,  9 Dec 2024 03:37:48 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4941A3F5A1;
	Mon,  9 Dec 2024 03:37:19 -0800 (PST)
Date: Mon, 9 Dec 2024 11:37:12 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, linux-bcachefs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: arm64: stacktrace: unwind exception boundaries
Message-ID: <Z1bWaGCvUrwrj2fZ@J2N7QTR9R3>
References: <36kx57aw46vwykgckr5cm4fafhw54tjuj4cqljrdnpfwvjl7if@a7znuhpfu54o>
 <zbwbgkuvvciezpmigcp6gaahfxwm7cwhpzus7gtbfnbzsjb2n3@kfbdppbd74o4>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <zbwbgkuvvciezpmigcp6gaahfxwm7cwhpzus7gtbfnbzsjb2n3@kfbdppbd74o4>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_033721_360463_A32F9EC0 
X-CRM114-Status: GOOD (  20.03  )
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

Hi Kent,

On Thu, Dec 05, 2024 at 01:04:59PM -0500, Kent Overstreet wrote:
> On 6.13-rc1, I'm now seeing a ton of test failures due to this warning -
> what gives?

Sorry about this; I just sent what I *thought* was a fix for this:

  https://lore.kernel.org/linux-arm-kernel/20241209110351.1876804-1-mark.rutland@arm.com/

... but re-reading the below I see you're actually hitting a different
issue.

> 00104 ========= TEST   generic/017
> 00104        run fstests generic/017 at 2024-12-05 11:47:43
> 00104 spectre-v4 mitigation disabled by command-line option
> 00106 bcachefs (vdc): starting version 1.13: inode_has_child_snapshots
> 00106 bcachefs (vdc): initializing new filesystem
> 00106 bcachefs (vdc): going read-write
> 00106 bcachefs (vdc): marking superblocks
> 00106 bcachefs (vdc): initializing freespace
> 00106 bcachefs (vdc): done initializing freespace
> 00106 bcachefs (vdc): reading snapshots table
> 00106 bcachefs (vdc): reading snapshots done
> 00106 bcachefs (vdc): done starting filesystem
> 00200 ------------[ cut here ]------------
> 00200 WARNING: CPU: 8 PID: 12571 at arch/arm64/kernel/stacktrace.c:223 arch_stack_walk+0x2c0/0x388

Looking at v6.13-rc1, that's the warning in
kunwind_next_frame_record_meta() for when the frame_record_meta::type is
not a valid value, which likely implies one of the following:

(a) The logic to identify a frame_record_meta is wrong.

(b) The entry logic has failed to initilialize pt_regs::stackframe::meta
    on an entry path somehow.

(c) The stack has been corrupted, and some frame record has been
    clobbered to look like a frame_record_meta.

The unwind will terminate at this point even if the warning is
supressed, so the backtrace from the warning itself should indicate
where the frame record was:

> 00200 Modules linked in:
> 00200 CPU: 8 UID: 0 PID: 12571 Comm: cat Not tainted 6.13.0-rc1-ktest-gdf1fce23d033 #10877
> 00200 Hardware name: linux,dummy-virt (DT)
> 00200 pstate: 80001005 (Nzcv daif -PAN -UAO -TCO -DIT +SSBS BTYPE=--)
> 00200 pc : arch_stack_walk+0x2c0/0x388
> 00200 lr : arch_stack_walk+0x1f4/0x388
> 00200 sp : ffffff80ca757b00
> 00200 x29: ffffff80ca757b00 x28: ffffff80d6783758 x27: 000000000000036f
> 00200 x26: ffffff80d6783780 x25: ffffff80c19de180 x24: ffffff80c273ee40
> 00200 x23: ffffffc080022708 x22: ffffffc080025828 x21: ffffff80ca757be8
> 00200 x20: ffffffc0800c98c8 x19: ffffff80d8533d10 x18: ffffffffffffffff
> 00200 x17: 0000000000000000 x16: 0000000000000000 x15: ffffffffffffffff
> 00200 x14: 0000000000000000 x13: ffffff80d6c92000 x12: 0000000000000000
> 00200 x11: 0000000000000000 x10: 000000000000000a x9 : ffffffc08086beec
> 00200 x8 : ffffff80ca757bc0 x7 : 0000000000000000 x6 : ffffff80d8533d28
> 00200 x5 : ffffff80ca757b60 x4 : ffffff80d8534000 x3 : ffffff80ca757b40
> 00200 x2 : 0000000000000018 x1 : ffffff80d8533d10 x0 : 0000000000000000
> 00200 Call trace:
> 00200  arch_stack_walk+0x2c0/0x388 (P)
> 00200  arch_stack_walk+0x1f4/0x388 (L)
> 00200  stack_trace_save_tsk+0x90/0xd8
> 00200  bch2_save_backtrace+0x68/0x160
> 00200  bch2_prt_task_backtrace+0x30/0xb8
> 00200  bch2_btree_transactions_read+0xe0/0x1f0
> 00200  full_proxy_read+0x60/0xd0
> 00200  vfs_read+0x80/0x2d8
> 00200  ksys_read+0x5c/0xf0
> 00200  __arm64_sys_read+0x20/0x30
> 00200  invoke_syscall.constprop.0+0x54/0xe8
> 00200  do_el0_svc+0x44/0xc8
> 00200  el0_svc+0x18/0x58
> 00200  el0t_64_sync_handler+0x104/0x130
> 00200  el0t_64_sync+0x154/0x158

This suggests that the bad frame_record_meta is in the entry code, in
the pt_regs. There *should* be a frame_record_meta there with type
FRAME_META_TYPE_FINAL, which suggests the probkem isn't case (a) above,
and either the entry code is failing to initialise
pt_regs::stackframe::type somehow, or that is getting corrupted later.

AFAICT, the entry code correctly initializes the frame_record_meta in
the kernel_entry assembly macro:

        /*
         * Create a metadata frame record. The unwinder will use this to
         * identify and unwind exception boundaries.
         */
        stp     xzr, xzr, [sp, #S_STACKFRAME]
        .if \el == 0
        mov     x0, #FRAME_META_TYPE_FINAL
        .else
        mov     x0, #FRAME_META_TYPE_PT_REGS
        .endif
        str     x0, [sp, #S_STACKFRAME_TYPE]
        add     x29, sp, #S_STACKFRAME

... and that's shared by *all* exceptions, so if it were wrong I'd
expect it to trigger an explosion on the very first backtrace taken
under an exception (from userspace or kernel).

Given the above, I'd suspect that maybe you're encountering stack
corruption here.

How are you reproducing this, and how consistently do you see the
failure? Is it always triggered by the same test?

The below diff will log the bad frame_record_meta::type value; if you're
able to run with that it might give an indication as to what's going on.

Mark.

---->8----
diff --git a/arch/arm64/kernel/stacktrace.c b/arch/arm64/kernel/stacktrace.c
index caef85462acb6..d1d9436c49101 100644
--- a/arch/arm64/kernel/stacktrace.c
+++ b/arch/arm64/kernel/stacktrace.c
@@ -205,13 +205,15 @@ kunwind_next_frame_record_meta(struct kunwind_state *state)
        unsigned long fp = state->common.fp;
        struct frame_record_meta *meta;
        struct stack_info *info;
+       u64 type;
 
        info = unwind_find_stack(&state->common, fp, sizeof(*meta));
        if (!info)
                return -EINVAL;
 
        meta = (struct frame_record_meta *)fp;
-       switch (READ_ONCE(meta->type)) {
+       type = READ_ONCE(meta->type);
+       switch (type) {
        case FRAME_META_TYPE_FINAL:
                if (meta == &task_pt_regs(tsk)->stackframe)
                        return -ENOENT;
@@ -220,7 +222,7 @@ kunwind_next_frame_record_meta(struct kunwind_state *state)
        case FRAME_META_TYPE_PT_REGS:
                return kunwind_next_regs_pc(state);
        default:
-               WARN_ON_ONCE(1);
+               WARN_ONCE(1, "Bad frame_record_meta::type: 0x%016llx\n", type);
                return -EINVAL;
        }
 }
 

