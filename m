Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 869B0CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 08:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SsCBmKCKrqBmvHButl34jDKlVFinqggAX7T4neqwKAk=; b=DiwMY+icX7EnDtHDMM2igurstS
	b7g7J63Fz9S6r8/sMReu+NgkFu9K1XjWVPK9fJGIA/rhmrv/Qm+WrU0nu7SS7WIE4tiIZjevFxxbP
	Ow9g/Di/TdrapreRIRddMpjNN9JbMIj1/6h9UmE3LayWX5IS6J7GK2Mmq6ELaG9kmMaPLHIXtO/Zw
	t5DszJCUhrKSVsF5VOe8aBz9plYseYcGP6Te68awZAAqRsueNFLU2WbpQbFNvlhSkxhfeD8H4MCK9
	Y9MyLr20UeWL3lgvHOSzvSVaHH/FZIMMN+CPQNVrXxwUXyguXjvfxON/wQDac5JEsVK3pe2ISruEo
	8TqJTLFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6Po0-00000003V6A-2JID;
	Wed, 08 Oct 2025 08:45:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6Pnz-00000003V5x-0hTX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Oct 2025 08:45:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8C42661F25;
	Wed,  8 Oct 2025 08:45:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69559C4CEF4;
	Wed,  8 Oct 2025 08:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759913150;
	bh=/tT7K/+4Yic47D9gSJOVksDXGGdOZm6NjABI8bxhXZA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n/SRhARr89olGEmHCXk6SVGPbo61lltxmCojxUI1OPSr9+MCr1mMhFzhmwaraWyHr
	 6GNgMhv8EAEO7fVc080LNIr3L7IPATMwRF8/iinwYoicHfXfeCL4AlAy0NOPKFrB6+
	 KhvYUeLJiIc+h93A3EW9EBof+BV7l0BfOGMZz9ojqHV6CGZjCjI18dltE/6LECdBRf
	 2jsxHNqTjIwGIygKNp+KP2aHY1T8a5pnS+BgGO4dz009tW16nAHe0m3tfb//2JqHLI
	 pwoj6BcTANg2SxqrW7yu3TdbD2yuDkl8xbd+KkFlJm9Zlul3yoqZoAMf3m8mF74vx2
	 UZWMgB/zFyAfQ==
Date: Wed, 8 Oct 2025 09:45:45 +0100
From: Will Deacon <will@kernel.org>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Tomasz Figa <tfiga@chromium.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: kvm: arm64: stable commit "Fix kernel BUG() due to bad backport
 of FPSIMD/SVE/SME fix" deadlocks host kernel
Message-ID: <aOYkuatjNVyiQzU1@willie-the-truck>
References: <hjc7jwarhmwrvcswa7nax26vgvs2wl7256pf3ba3onoaj26s5x@qubtqvi3vy6u>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <hjc7jwarhmwrvcswa7nax26vgvs2wl7256pf3ba3onoaj26s5x@qubtqvi3vy6u>
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

On Wed, Oct 08, 2025 at 01:45:32PM +0900, Sergey Senozhatsky wrote:
> Commits 8f4dc4e54eed4 (6.1.y) and 23249dade24e6 (5.15.y) (maybe other
> stable kernels as well) deadlock the host kernel (presumably a
> recursive spinlock):
> 
>  queued_spin_lock_slowpath+0x274/0x358
>  raw_spin_rq_lock_nested+0x2c/0x48
>  _raw_spin_rq_lock_irqsave+0x30/0x4c
>  run_rebalance_domains+0x808/0x2e18
>  __do_softirq+0x104/0x550
>  irq_exit+0x88/0xe0
>  handle_domain_irq+0x7c/0xb0
>  gic_handle_irq+0x1cc/0x420
>  call_on_irq_stack+0x20/0x48
>  do_interrupt_handler+0x3c/0x50
>  el1_interrupt+0x30/0x58
>  el1h_64_irq_handler+0x18/0x24
>  el1h_64_irq+0x7c/0x80
>  kvm_arch_vcpu_ioctl_run+0x24c/0x49c
>  kvm_vcpu_ioctl+0xc4/0x614
> 
> We found out a similar report at [1], but it doesn't seem like a formal
> patch was ever posted.  Will, can you please send a formal patch so that
> stable kernels can run VMs again?

Yup, already queued up for stable:

https://lore.kernel.org/r/20251003183917.4209-1-will@kernel.org
https://lore.kernel.org/r/20251003184018.4264-1-will@kernel.org
https://lore.kernel.org/r/20251003184054.4286-1-will@kernel.org

Sorry for the breakage.

Will

