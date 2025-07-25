Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19004C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 16:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PiUW6IKELWOMYDlTOgeuRwLBVLSH4/0LDp7MyDMND9E=; b=ZNdWPCIE6zpL6sCQL1ITGuD3Xk
	ORBwfzNF7XD5yro6SaRLejbfSIfLsPZAIcYLQNtbjNT2FBE0ix/NZEXLcLrA+0LdSsvWyE88UPOPI
	/jEbMrP+ftAYyu95KMqmHtYysZf3JW8Yzj6BVK+Mo+0LPOHBrBXYtMJdaiFIN3WqfcaLYqGgcsdla
	KAgVsX1vfjxg3Tp5iIX2VKWEam0sKsFBtU2GbatjxnCd4qMNncQGnWGgarkjTiTFThs/somcAc495
	Ae5Kb+jkG37jzic242/Z/a/f8H+VIVXFafAORc9uFM89btAeGzyMfijukvt2Ycv5X3ezH8eDLj4tW
	orQEnwpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufLUB-0000000AFGN-2FN7;
	Fri, 25 Jul 2025 16:41:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufLRi-0000000AEzd-1jO3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 16:38:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E66525C6322;
	Fri, 25 Jul 2025 16:38:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 292A6C4CEE7;
	Fri, 25 Jul 2025 16:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753461537;
	bh=ph09R88EGj0H43KIRGl9OnKpp1uyR+qA9PEna2s/QNo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r/3owUOetdGfJ7NIolrwZMMOxRlDHBwquuCvs3fYNgdlE2+s8SrMe8N7hMu5JJ0ow
	 /ZSz+d6zYcTZgVq3fXq12zRN68fSteTIG+YZuZgHFb1Y2NZwlTz0aXkGzTnLzICNZz
	 agu2z5TUwRfLzLCs2DoHCEbueY0ip/cwCXEUqR1LOUOd7aHYtd7nfm0H1i5Lr1OR2+
	 fHQ+sfSBfvmQld5NyMrp8iwsHrEFcEOCRDX13kdNHhj8c+tZJFNyGTE0a/Eta35aPU
	 ioYtyNmXsuDO+cSmQVU54BwWFBJllFSsUzsc1PrAwLU4ia/+Lk8ST893Eqh525HBxB
	 phA7AsoV+ZP8w==
Date: Fri, 25 Jul 2025 09:38:51 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Justin Stitt <justinstitt@google.com>, Marc Zyngier <maz@kernel.org>,
	James Morse <james.morse@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Tom Rix <trix@redhat.com>,
	Christopher Covington <cov@codeaurora.org>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	kvmarm@lists.cs.columbia.edu, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH 6.1.y] KVM: arm64: silence -Wuninitialized-const-pointer
 warning
Message-ID: <20250725163851.GB684490@ax162>
References: <20250724-b4-clidr-unint-const-ptr-v1-1-67c4d620b6b6@google.com>
 <2025072553-chevy-starter-565e@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025072553-chevy-starter-565e@gregkh>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_093858_496155_A4D804EA 
X-CRM114-Status: GOOD (  18.29  )
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

On Fri, Jul 25, 2025 at 10:58:05AM +0200, Greg KH wrote:
> On Thu, Jul 24, 2025 at 06:15:28PM -0700, Justin Stitt wrote:
> > A new warning in Clang 22 [1] complains that @clidr passed to
> > get_clidr_el1() is an uninitialized const pointer. get_clidr_el1()
> > doesn't really care since it casts away the const-ness anyways.
> 
> Is clang-22 somehow now a supported kernel for the 6.1.y tree?  Last I
> looked, Linus's tree doesn't even build properly for it, so why worry
> about this one just yet?

Our goal is to have tip of tree LLVM / clang be able to build any
supported branch of the kernel so that whenever it branches and
releases, the fixes for it are already present in released kernel
versions so users can just pick them up and go. We are going to have to
worry about this at some point since it is a stable-only issue so why
not tackle it now?

> > Silence the warning by initializing the struct.
> 
> Why not fix the compiler not to do this instead?  We hate doing foolish
> work-arounds for broken compilers.

While casting away the const from the pointer in this case is "fine"
because the object it pointed to was not const, I am fairly certain it
is undefined behavior to cast away the const from a pointer to a const
object, see commit 12051b318bc3 ("mips: avoid explicit UB in assignment
of mips_io_port_base") for an exampile, so I am not sure the warning is
entirely unreasonable.

Cheers,
Nathan

