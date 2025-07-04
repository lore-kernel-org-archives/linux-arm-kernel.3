Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34DBEC8303D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 15:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WbSext6onKKjDs37MnisE73O5uppHzZhzD+iEHs4084=; b=GgSgVfAXYJBHlrSWsigfB35hEB
	Nqxocddm9CRXyozd2kWiSaxPfurJwKxjKpNNLdZKothtu/NjsITt1beyRbsaUfaUxFApopL29PrN8
	sMBL4F1fIocAhkSUc+fCSjmX7RDy1lTY+55YrTOITNseMUaXba9n5XSkZl+uT/SPwVlvvkKZmjrF+
	Qt56oe+INxz15U5E7/1IsFUSEg+sElgfjZFNeOQg8hyB9UP+ftXWc+xc3PzsnA5+fgYjpm1MrwQ4g
	E9cT5rHHLCPwk+ABLWt66GbS794Ou2m8MUbaXG8phPTyhdcpRclp+HjN08HYoh05PcDC0Fdcl6FEu
	QBrvk+gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXhzm-0000000El5M-1QS9;
	Fri, 04 Jul 2025 15:06:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXgXt-0000000EWxD-3ANG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 13:33:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EF3AE5C5C2B;
	Fri,  4 Jul 2025 13:33:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B6DFC4CEEE;
	Fri,  4 Jul 2025 13:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751636020;
	bh=EtiXfEKSjZZE/8/wPMmve0WLVrmAKdqLK+/3mXSBmUc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pHxzUfPal/RIBhfUkLePrBxqx6oTeqJAlzbFVduGtQPwX0rR881ITBr83pybvvjnU
	 daKVy+8l94zMIxS/aqhtXwWsFdT9Lu1VTLuvj9OHv+1dQshXSMXoziwkMcS5NF3ON1
	 28LXVHfPjiHl/RBJ988hayW0rqn2m0qd3N76sDyKk8LU97y5HhfG5C/lyhM5Pzwpiq
	 oUHatjtdPk+iqIMs8kQ0uAJB16D1DIOUU9wZmLmnNHuNOZTEIeeuSlqR1rkbMSM6zI
	 pOhAHPE4xb4vpzXEmc3L1o4t6I8ZihShlcjHDY8s3fnBTewDkQ/XNREvk1XvVR1HE3
	 cJYhisXGPgDfQ==
Date: Fri, 4 Jul 2025 14:33:35 +0100
From: Will Deacon <will@kernel.org>
To: Breno Leitao <leitao@debian.org>
Cc: Ard Biesheuvel <ardb@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>, usamaarif642@gmail.com,
	rmikey@meta.com, andreyknvl@gmail.com, kasan-dev@googlegroups.com,
	linux-efi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH] arm64: efi: Fix KASAN false positive for EFI runtime
 stack
Message-ID: <aGfYL8eXjTA9puQr@willie-the-truck>
References: <20250624-arm_kasan-v1-1-21e80eab3d70@debian.org>
 <aGaxZHLnDQc_kSur@arm.com>
 <CAMj1kXFadibWLnhFv3cOk-7Ah2MmPz8RqDuQjGr-3gmq+hEnMg@mail.gmail.com>
 <aGfK2N6po39zyVIp@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGfK2N6po39zyVIp@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_063341_877099_8B7A0A1C 
X-CRM114-Status: GOOD (  28.69  )
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

On Fri, Jul 04, 2025 at 01:36:40PM +0100, Breno Leitao wrote:
> On Fri, Jul 04, 2025 at 10:26:37AM +0200, Ard Biesheuvel wrote:
> > On Thu, 3 Jul 2025 at 18:35, Catalin Marinas <catalin.marinas@arm.com> wrote:
> > > On Tue, Jun 24, 2025 at 05:55:53AM -0700, Breno Leitao wrote:
> ...
> > > >  arch/arm64/kernel/efi.c | 9 ++++++---
> ...
> > > >  static bool region_is_misaligned(const efi_memory_desc_t *md)
> > > >  {
> > > > @@ -214,9 +215,11 @@ static int __init arm64_efi_rt_init(void)
> > > >       if (!efi_enabled(EFI_RUNTIME_SERVICES))
> > > >               return 0;
> > > >
> > > > -     p = __vmalloc_node(THREAD_SIZE, THREAD_ALIGN, GFP_KERNEL,
> > > > -                        NUMA_NO_NODE, &&l);
> > > > -l:   if (!p) {
> > > > +     if (!IS_ENABLED(CONFIG_VMAP_STACK))
> > > > +             return -ENOMEM;
> > >
> > > Mark Rutland pointed out in a private chat that this should probably
> > > clear the EFI_RUNTIME_SERVICES flag as well.
> > >
> > 
> > If VMAP_STACK is a hard requirement, should we make CONFIG_EFI depend
> > on it for arm64?
> 
> What about if we make CONFIG_EFI select VMAP_STACK? I think it is more
> straight forward from a configuration perspective.
> 
> I thought about the following. What do you think?
> 
> 	arm64: EFI selects VMAP_STACK
> 
> 	Modify the ARM64 Kconfig to make the CONFIG_EFI configuration option
> 	automatically select CONFIG_VMAP_STACK.
> 
> 	The motivation is that arm64_efi_rt_init() will fail at runtime if
> 	CONFIG_VMAP_STACK is not set, so the patch ensures that enabling EFI
> 	will always enable VMAP_STACK as well, and avoid having EFI disabled in
> 	case the user didn't set VMAP_STACK.
> 
> 	Suggested-by: Ard Biesheuvel <ardb@kernel.org>
> 	Signed-off-by: Breno Leitao <leitao@debian.org>
> 
> 	diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> 	index 55fc331af3371..cc2585143f511 100644
> 	--- a/arch/arm64/Kconfig
> 	+++ b/arch/arm64/Kconfig
> 	@@ -2437,6 +2437,7 @@ config EFI
> 		select EFI_RUNTIME_WRAPPERS
> 		select EFI_STUB
> 		select EFI_GENERIC_STUB
> 	+	select VMAP_STACK
> 		imply IMA_SECURE_AND_OR_TRUSTED_BOOT
> 		default y
> 		help

I would actually like to select VMAP_STACK unconditionally for arm64.
Historically, we were held back waiting for all the various KASAN modes
to support vmalloc properly, but I _think_ that's fixed now...

The VMAP_STACK dependency is:

	depends on !KASAN || KASAN_HW_TAGS || KASAN_VMALLOC

and in arm64 we have:

	select KASAN_VMALLOC if KASAN

so it should be fine to select it afaict.

Any reason not to do that?

Will

