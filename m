Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DE07CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Oct 2025 10:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kqj912jHg1nZB/S//B1b7Qrhd1+TE5kArI8a3PspfuE=; b=SutdjYNhzCnE7PLZ5bFXDe0Kil
	VGnScDeJKbQuXPKWFtqkSMNO2hASRqoR5B39VfE7Y5vpe4Wc0U9XUOSTDwxNpZL524ZsIDlPOwcZ2
	t0Umqf0eu+bbhVieIaRlf5CHDiuoHWqVNYu4X/7p6Om/kx4qWens9TeQH5KYRpaI6S/A+M8fh5ZM6
	wYN/+UDGrYxFj6afmY4sn1uHjLqYaYdjkr7P0BPKkNEqpfWnQtUurun/zAJBwq9ZFpIU2Yh7DcAnp
	pjtsW1zIHoXZkdwa0Y3Y1A3AzURH1WKi3S72Vyt1+VY4LloLB+cB483a25oOlqbN6nx7FDWmTS4/g
	UVrVvQ7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5i0k-0000000HIbf-3DfE;
	Mon, 06 Oct 2025 10:00:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5i0j-0000000HIbX-2YfY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Oct 2025 10:00:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0C75160407;
	Mon,  6 Oct 2025 10:00:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 399D7C4CEF7;
	Mon,  6 Oct 2025 10:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1759744804;
	bh=HmCN+7Mqf/MRdFKZQf5GfilkUM5v3O6PnYlANxH+lYk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GcK951BVY6eNOsq8UkKBT79D/4LwVGMYN73Kh7H+2tp0kYNTImy/2HGvuo7iNrBNW
	 CcLxxOFnGZzkJ/VJxgc1j3YyHhYSNA8MW12qHBkRD73/FXSBMaDudUAlAseSbVChCc
	 /uXyC9ofKpzwzwAScFaRTD7qXRah83XPIq5TREdE=
Date: Mon, 6 Oct 2025 12:00:02 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Will Deacon <will@kernel.org>
Cc: stable@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, Ard Biesheuvel <ardb@kernel.org>,
	Lee Jones <lee@kernel.org>, Sasha Levin <sashal@kernel.org>,
	Kenneth Van Alstyne <kvanals@kvanals.org>
Subject: Re: [STABLE 5.15.y] [PATCH] KVM: arm64: Fix softirq masking in
 FPSIMD register saving sequence
Message-ID: <2025100641-guileless-retainer-c885@gregkh>
References: <20251003183917.4209-1-will@kernel.org>
 <aOAZR0-4ZCq78DZ8@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aOAZR0-4ZCq78DZ8@willie-the-truck>
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

On Fri, Oct 03, 2025 at 07:43:19PM +0100, Will Deacon wrote:
> On Fri, Oct 03, 2025 at 07:39:17PM +0100, Will Deacon wrote:
> > Stable commit 23249dade24e ("KVM: arm64: Fix kernel BUG() due to bad
> > backport of FPSIMD/SVE/SME fix") fixed a kernel BUG() caused by a bad
> > backport of upstream commit fbc7e61195e2 ("KVM: arm64: Unconditionally
> > save+flush host FPSIMD/SVE/SME state") by ensuring that softirqs are
> > disabled/enabled across the fpsimd register save operation.
> > 
> > Unfortunately, although this fixes the original issue, it can now lead
> > to deadlock when re-enabling softirqs causes pending softirqs to be
> > handled with locks already held:
> > 
> >  | BUG: spinlock recursion on CPU#7, CPU 3/KVM/57616
> >  |  lock: 0xffff3045ef850240, .magic: dead4ead, .owner: CPU 3/KVM/57616, .owner_cpu: 7
> >  | CPU: 7 PID: 57616 Comm: CPU 3/KVM Tainted: G           O       6.1.152 #1
> >  | Hardware name: SoftIron SoftIron Platform Mainboard/SoftIron Platform Mainboard, BIOS 1.31 May 11 2023
> >  | Call trace:
> >  |  dump_backtrace+0xe4/0x110
> >  |  show_stack+0x20/0x30
> >  |  dump_stack_lvl+0x6c/0x88
> >  |  dump_stack+0x18/0x34
> >  |  spin_dump+0x98/0xac
> >  |  do_raw_spin_lock+0x70/0x128
> >  |  _raw_spin_lock+0x18/0x28
> >  |  raw_spin_rq_lock_nested+0x18/0x28
> >  |  update_blocked_averages+0x70/0x550
> >  |  run_rebalance_domains+0x50/0x70
> >  |  handle_softirqs+0x198/0x328
> >  |  __do_softirq+0x1c/0x28
> >  |  ____do_softirq+0x18/0x28
> >  |  call_on_irq_stack+0x30/0x48
> >  |  do_softirq_own_stack+0x24/0x30
> >  |  do_softirq+0x74/0x90
> >  |  __local_bh_enable_ip+0x64/0x80
> >  |  fpsimd_save_and_flush_cpu_state+0x5c/0x68
> >  |  kvm_arch_vcpu_put_fp+0x4c/0x88
> >  |  kvm_arch_vcpu_put+0x28/0x88
> >  |  kvm_sched_out+0x38/0x58
> >  |  __schedule+0x55c/0x6c8
> >  |  schedule+0x60/0xa8
> > 
> > Take a tiny step towards the upstream fix in 9b19700e623f ("arm64:
> > fpsimd: Drop unneeded 'busy' flag") by additionally disabling hardirqs
> > while saving the fpsimd registers.
> > 
> > Cc: Ard Biesheuvel <ardb@kernel.org>
> > Cc: Lee Jones <lee@kernel.org>
> > Cc: Sasha Levin <sashal@kernel.org>
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org
> 
> Sorry, Greg, I lost a stray '>' here ^^^  and so you didn't end up on CC
> for this one.

No worries, I see the stuff going to stable@vger.kernel.org as well :)

Now all queued up, thanks for these.

greg k-h

