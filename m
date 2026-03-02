Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D18CCE9B36A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 11:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZHfrvoLB4lzzZIvZnau+xd1udtKYwoRNgfM5H2wHyG4=; b=mciJFABUc2SjUgQbXOIH8T6cKL
	g2ejzpuhF8S4F1wjXzVgXYl5iESuTKGPqIsUkimGOCSGHln8BYUhSkCFlpcz6ti3oV9iBMJ4tyBQJ
	rJtLCZsxi1p4vU/v+9ZHwdrr5FIb/BmQcmQCrg3hwzGsaaTRfT4VT5oC1gP5uUcc9amYeedcEiPEE
	15BnM2TDWyXl6xCpV9c3EAZ0shxsFeEmbyq6ePWEHduXwzNagGrC635sn0i0Z0T30wDf56I3l+V64
	IjurYP2KhUpikD0cWMtf6ehLKTmMDxgnQBuXDEUaooQfLbjp9v4cH8he+xLUrLC97oJh9U1eb56o8
	H7/yuAzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx1NM-0000000Coob-2DR1;
	Mon, 02 Mar 2026 11:23:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx1NK-0000000Cong-0IUg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 11:23:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 515CF14BF;
	Mon,  2 Mar 2026 03:23:38 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DDD853F73B;
	Mon,  2 Mar 2026 03:23:42 -0800 (PST)
Date: Mon, 2 Mar 2026 11:23:37 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Khaja Hussain Shaik Khaji <khaja.khaji@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/1] kernel: kprobes: fix cur_kprobe corruption during
Message-ID: <aaVzOfAKhQ-uLG06@J2N7QTR9R3>
References: <aZSdkGjy2BXUL0bT@J2N7QTR9R3.cambridge.arm.com>
 <20260302105347.3602192-1-khaja.khaji@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260302105347.3602192-1-khaja.khaji@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_032346_225676_E87C47BB 
X-CRM114-Status: GOOD (  12.78  )
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
Cc: linux-arm-msm@vger.kernel.org, dev.jain@arm.com, linux-kernel@vger.kernel.org, mhiramat@kernel.org, catalin.marinas@arm.com, will@kernel.org, linux-arm-kernel@lists.infradead.org, yang@os.amperecomputing.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, Mar 02, 2026 at 04:23:46PM +0530, Khaja Hussain Shaik Khaji wrote:
> This patch fixes a kprobes failure observed due to lost current_kprobe
> on arm64 during kretprobe entry handling under interrupt load.
> 
> v1 attempted to address this by simulating BTI instructions as NOPs and 
> v2 attempted to address this by disabling preemption across the
> out-of-line (XOL) execution window. Further analysis showed that this
> hypothesis was incorrect: the failure is not caused by scheduling or
> preemption during XOL.
> 
> The actual root cause is re-entrant invocation of kprobe_busy_begin()
> from an active kprobe context. On arm64, IRQs are re-enabled before
> invoking kprobe handlers, allowing an interrupt during kretprobe
> entry_handler to trigger kprobe_flush_task(), which calls
> kprobe_busy_begin/end and corrupts current_kprobe and kprobe_status.
> 
> [ 2280.630526] Call trace:
> [ 2280.633044]  dump_backtrace+0x104/0x14c
> [ 2280.636985]  show_stack+0x20/0x30
> [ 2280.640390]  dump_stack_lvl+0x58/0x74
> [ 2280.644154]  dump_stack+0x20/0x30
> [ 2280.647562]  kprobe_busy_begin+0xec/0xf0
> [ 2280.651593]  kprobe_flush_task+0x2c/0x60
> [ 2280.655624]  delayed_put_task_struct+0x2c/0x124
> [ 2280.660282]  rcu_core+0x56c/0x984
> [ 2280.663695]  rcu_core_si+0x18/0x28
> [ 2280.667189]  handle_softirqs+0x160/0x30c
> [ 2280.671220]  __do_softirq+0x1c/0x2c
> [ 2280.674807]  ____do_softirq+0x18/0x28
> [ 2280.678569]  call_on_irq_stack+0x48/0x88
> [ 2280.682599]  do_softirq_own_stack+0x24/0x34
> [ 2280.686900]  irq_exit_rcu+0x5c/0xbc
> [ 2280.690489]  el1_interrupt+0x40/0x60
> [ 2280.694167]  el1h_64_irq_handler+0x20/0x30
> [ 2280.698372]  el1h_64_irq+0x64/0x68
> [ 2280.701872]  _raw_spin_unlock_irq+0x14/0x54
> [ 2280.706173]  dwc3_msm_notify_event+0x6e8/0xbe8
> [ 2280.710743]  entry_dwc3_gadget_pullup+0x3c/0x6c
> [ 2280.715393]  pre_handler_kretprobe+0x1cc/0x304
> [ 2280.719956]  kprobe_breakpoint_handler+0x1b0/0x388
> [ 2280.724878]  brk_handler+0x8c/0x128
> [ 2280.728464]  do_debug_exception+0x94/0x120
> [ 2280.732670]  el1_dbg+0x60/0x7c

The el1_dbg() function was removed in commit:

  31575e11ecf7 ("arm64: debug: split brk64 exception entry")

... which was merged in v6.17.

Are you able to reproduce the issue with v6.17 or later?

Which specific kernel version did you see this with?

The arm64 entry code has changed substantially in recent months (fixing
a bunch of latent issues), and we need to know which specific version
you're looking at. It's possible that your issue has already been fixed.

Mark.

> [ 2280.735815]  el1h_64_sync_handler+0x48/0xb8
> [ 2280.740114]  el1h_64_sync+0x64/0x68
> [ 2280.743701]  dwc3_gadget_pullup+0x0/0x124
> [ 2280.747827]  soft_connect_store+0xb4/0x15c
> [ 2280.752031]  dev_attr_store+0x20/0x38
> [ 2280.755798]  sysfs_kf_write+0x44/0x5c
> [ 2280.759564]  kernfs_fop_write_iter+0xf4/0x198
> [ 2280.764033]  vfs_write+0x1d0/0x2b0
> [ 2280.767529]  ksys_write+0x80/0xf0
> [ 2280.770940]  __arm64_sys_write+0x24/0x34
> [ 2280.774974]  invoke_syscall+0x54/0x118
> [ 2280.778822]  el0_svc_common+0xb4/0xe8
> [ 2280.782587]  do_el0_svc+0x24/0x34
> [ 2280.785999]  el0_svc+0x40/0xa4
> [ 2280.789140]  el0t_64_sync_handler+0x8c/0x108
> [ 2280.793526]  el0t_64_sync+0x198/0x19c


