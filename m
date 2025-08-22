Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDDDCCA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8YhYvWFOqWFPEDJvCrNPXyBtRbPj45VJ4O9zNDN/ii8=; b=h3Rf1Ue7MFVLWFjQuVweuNYxG5
	qux/GLz0+Z35prmiVwYxNDbFNy42iS1BB6ITm9Jq0T0iwlEugc3FVpnhdO6rKjRjF4Zn343PTJiNr
	nvkt3xIAOT0Ck8JAPLtSxEeuPJ/PRsjD+AP9aqi9fJ+q97NJ4dPv9XnUh27WezQ59Hy9ilCtE+uBS
	gn5uO/pLrOYsAKTnImAcZ/ZDtXfpR0yyHLXUxPcea8V2evIeSiDLDXrflz8JhFt2GnxMdR5FZlMgl
	dDzdfoNxNgqG4KPRNFKGpUgJEGpHD2ewiz4avQMASDiqobm5cJAGufAtcIzV9JSEkxoehzTK7Y/tr
	JWvHTjJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphmu-000000040g6-1NgC;
	Sat, 23 Aug 2025 06:31:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upShi-00000002orU-3Ph6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 14:25:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2D9E743C88;
	Fri, 22 Aug 2025 14:25:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95107C4CEED;
	Fri, 22 Aug 2025 14:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1755872718;
	bh=hd4mU3eVfUpI8O+XIWVhc+/UeFGUawqGS9Ci7m0C8Qs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kc+8Fmg2j5u6iZ8MOCY+V2p8A7pE4SoLN+xUG7lq79Vhcawfgh37AUZgbc55y8um3
	 gP4ChwRQS/Mgy15Pp8TvfXuMqNzWOc6vT7v1weB04IxsnN2JV++6ej0Z97ndBwGTwU
	 MsbMOxjiYo7VpU9YpkVSuVhnmrKoG/Hk+0tZtTfM=
Date: Fri, 22 Aug 2025 16:25:14 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Will Deacon <will@kernel.org>
Cc: stable@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, Ard Biesheuvel <ardb@kernel.org>,
	Lee Jones <lee@kernel.org>, Sasha Levin <sashal@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Fuad Tabba <tabba@google.com>,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [STABLE] [PATCH] KVM: arm64: Fix kernel BUG() due to bad
 backport of FPSIMD/SVE/SME fix
Message-ID: <2025082203-stream-carless-e5d9@gregkh>
References: <20250822140402.2688-1-will@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822140402.2688-1-will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_072518_874880_A1056BDF 
X-CRM114-Status: GOOD (  13.84  )
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

On Fri, Aug 22, 2025 at 03:04:02PM +0100, Will Deacon wrote:
> Upstream commit fbc7e61195e2 ("KVM: arm64: Unconditionally save+flush
> host FPSIMD/SVE/SME state") relies on interrupts being disabled during
> fpsimd_save_and_flush_cpu_state() so that a softirq cannot be taken
> while the host floating point context is being saved and potentially try
> to use kernel-mode NEON.
> 
> Unfortunately, stable kernels without 9b19700e623f ("arm64: fpsimd: Drop
> unneeded 'busy' flag") leave interrupts enabled in
> fpsimd_save_and_flush_cpu_state() and so the BUG_ON(!may_use_simd()) in
> kernel_neon_begin() has been observed to trigger in real-world usage:
> 
>  |  kernel BUG at arch/arm64/kernel/fpsimd.c:1904!
>  |  Internal error: Oops - BUG: 00000000f2000800 [#1] PREEMPT SMP
>  |
>  |  Call trace:
>  |   kernel_neon_begin+0xdc/0x12c
>  |   ...
>  |   crypto_aead_decrypt+0x5c/0x6c
>  |   seqiv_aead_decrypt+0x88/0x9c
>  |   crypto_aead_decrypt+0x5c/0x6c
>  |   esp_input+0x280/0x364
>  |   xfrm_input+0x6ac/0x16f8
>  |   ...
>  |   net_rx_action+0x13c/0x31c
>  |   handle_softirqs+0x124/0x3d0
>  |   __do_softirq+0x14/0x20
>  |   ____do_softirq+0x10/0x20
>  |   call_on_irq_stack+0x3c/0x74
>  |   do_softirq_own_stack+0x1c/0x2c
>  |   __irq_exit_rcu+0x54/0xb4
>  |   irq_exit_rcu+0x10/0x1c
>  |   el1_interrupt+0x38/0x58
>  |   el1h_64_irq_handler+0x18/0x24
>  |   el1h_64_irq+0x68/0x6c
>  |   fpsimd_save+0xe4/0x130
>  |   kvm_arch_vcpu_load_fp+0x2c/0x58
>  |   kvm_arch_vcpu_load+0x88/0x26c
>  |   kvm_sched_in+0x2c/0x3c
> 
> Given that 9b19700e623f ("arm64: fpsimd: Drop unneeded 'busy' flag") is
> not a fix in its own right, has non-trivial dependencies and is a
> reasonably invasive change to the in-kernel use of fpsimd, opt instead
> for a simple fix to use the softirq-safe {get,put}_cpu_fpsimd_context()
> helpers in fpsimd_save_and_flush_cpu_state().
> 
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Lee Jones <lee@kernel.org>
> Cc: Sasha Levin <sashal@kernel.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Fuad Tabba <tabba@google.com>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: <stable@vger.kernel.org> # 5.15.y, 6.1.y and 6.6.y

Now queued up to these trees, thanks!

greg k-h

