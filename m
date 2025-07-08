Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90246C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 12:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cLnLB/RO4UTB94beI0koaGJXjHPYatj4KwpOKVL4to4=; b=KKKZ/k2gazEagQw9KrOldMClfm
	Jxao3HmdX4Eo478eDvGhOAtpm4NczYhkrlEvLrA83SjzpDhct1wQumePaPPVHORatwjZd95wv/W9W
	xkN/9XPxLS85iMj1UzLnvyIUYi4wuZG+MtbuaKRHnOoQKV0Sie+pDmJi98NAenMbKLI/7zc8r1WQ0
	4dv4bA2KqT/8iSk6K1FmSMzh/Fi4AqWQrHplkEIjGtdwq1NjO+3U9g0MnKquZxpkgZhKq/SYon9VX
	OWYtX+lDOrPTgGkOsMPXecXzRbnYvSGy5qhwgxLGOr9hhLvALIR+CqbuHJhTt0dh9GXHSJKqiBjSn
	9nE0TY3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ7Fv-00000005Gxt-1stG;
	Tue, 08 Jul 2025 12:17:03 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ7Da-00000005GfH-2Zjy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 12:14:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9C0465C5DC0;
	Tue,  8 Jul 2025 12:14:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F884C4CEED;
	Tue,  8 Jul 2025 12:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751976876;
	bh=kEi/z0SApD4McCBJYfg8E/oqKRETuGz5mVH55FI4E9E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A9gs4jnvcQMxjniKthzF3T8B3QVKkcsrdRfyYJF4BGni/JN22pFgMB8IbtBOz6n3K
	 xNGQHd1htHQ+dG2IRx+Qie9IBQgtvcUNUOgOz/P+oXe6IpiWHMPBitQlBvTJQJIM/h
	 JOOkfwv3qAunprvbL5qDiP4Ij81eqOPJcAVq6V1CcSjfyLPj68UCmGZ2JQBKAkk8jJ
	 knu0fVXaBTkCOGuitbI3jvSyqG4SSSg+sScLbJFsGNatOxuu53pznGGyIGmPq40Pr3
	 LI0zOG87BaGPM58U4xCr/YjhUwcwwYbac3MsVj9s19Gb98s8WqnypFJ6+ICYkPcCaT
	 yDUMJPB0CU+uQ==
Date: Tue, 8 Jul 2025 13:14:31 +0100
From: Will Deacon <will@kernel.org>
To: Breno Leitao <leitao@debian.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-efi@vger.kernel.org, leo.yan@arm.com, kernel-team@meta.com
Subject: Re: [PATCH 1/8] arm64: Enable VMAP_STACK support
Message-ID: <aG0Lpy1c2LuSPdj2@willie-the-truck>
References: <20250707-arm64_vmap-v1-0-8de98ca0f91c@debian.org>
 <20250707-arm64_vmap-v1-1-8de98ca0f91c@debian.org>
 <aGwCfRkYqcYBvxZK@J2N7QTR9R3>
 <aGznbObwbaZlnD17@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGznbObwbaZlnD17@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_051438_696152_81D51502 
X-CRM114-Status: GOOD (  19.61  )
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

Hey Breno,

Thanks for doing this.

On Tue, Jul 08, 2025 at 02:39:56AM -0700, Breno Leitao wrote:
> On Mon, Jul 07, 2025 at 06:23:09PM +0100, Mark Rutland wrote:
> > On Mon, Jul 07, 2025 at 09:01:01AM -0700, Breno Leitao wrote:
> > > Enable virtually mapped kernel stacks for ARM64. This provides better
> > > stack overflow detection and improved security by mapping kernel stacks
> > > in vmalloc space rather than using direct mapping.
> > > 
> > > VMAP_STACK helps catch stack overflows early by placing guard pages
> > > around kernel stacks, and also provides better isolation between
> > > kernel stacks and other kernel data structures.
> > > 
> > > All dependencies are satisfied for arm64: HAVE_ARCH_VMAP_STACK is
> > > already selected above, and KASAN_VMALLOC is selected when KASAN is
> > > enabled, meeting the KASAN dependency requirements.
> > 
> > I reckon it might be better to say something like:
> > 
> > | arm64: Mandate VMAP_STACK
> > |
> > | On arm64, VMAP_STACK has been enabled by default for a while now, and
> > | the only reason to disable it was a historical lack of support for
> > | KASAN_VMALLOC. Today there's no good reason to disable VMAP_STACK.
> > |
> > | Mandate VMAP_STACK, which will allow code to be simplified in
> > | subsequent patches.
> > 
> > ... to make it clear that we're not changing the default, and we are
> > removing the ability to deselect VMAP_STACK.
> > 
> > Either way, the patch itself looks good to me.
> 
> Thanks for the suggestion. I will update and respin.

No need to respin just for that; I can fold the above when I apply.

Cheers,

Will

