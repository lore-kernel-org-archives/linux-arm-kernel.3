Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9107CC369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 16:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9NWrz+uGXp/skKrGJXcyNkb6DdoWaNPehr7XIbL91e8=; b=annFBoKNyKIe+zfnjEjQ2clL9c
	p8cKedOVldGboFrltwFnScvjNkXZY7GvVPbKrZNBVHiEFlrY9NJQbqM+fH8Jpo3m5Ove9+GFDQvDM
	wikwQP2nR7wIczz/2KEaFSamNghbBqXXE5WKtd4ik8lARIOFlNdS2poUS1XpiaReKRbygGAlxOrN0
	FWtsDTcZec4PhIBU3f6JedyUB57ssF1WqqyRkWMCPMwlpYRouilEaFKalyiaBv4EGF+W8vXvDLDG/
	EturhDw7QoDwk7tdfvznKZH+uTL/hSWJiRVF7MLddJE6iD6OxYkGrwroz2/OicUqIoC1+d1wQPfS4
	GHCQxnIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5SSW-0000000Dj8a-0hj7;
	Thu, 17 Apr 2025 16:51:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5SA5-0000000DgHf-1fgr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 16:32:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 430BF4A174;
	Thu, 17 Apr 2025 16:32:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7CD8C4CEE4;
	Thu, 17 Apr 2025 16:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744907544;
	bh=IV/xW+QXt1ASDi8c6AGAf/97Q00BOAQgySjKp6oRkGQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ttluGruoonakRWVv2QadlsnXULVOzog0Vv6+AUNJs7eFI4QI1pV/no4q9xkLONAHa
	 ND3JGSYH6nxKKbmxpfAk3lZRxnxlKtOzXZZkoplp5mWvGpuC2Hvnh8byO5PQmx1hNB
	 J6Y/H5VBxTyZTegf4X6qSAylixrad/WfU/iej79TEbLb4+jS16TT1JgnyCM3NBRBJl
	 H8VmM+L/sGPSbtsZWrNRfaqDOr3siGDYmXV59DFk5upNBZclqmvezjF3RTSLQisHR5
	 XCt6eaEq5R/CGobkqTZEIrgkFklo0zUaJigiUCOQTG8NcZjLX5p9LhBDfFIbTuRRaV
	 06/JbYgKkSMYQ==
Date: Thu, 17 Apr 2025 09:32:21 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Heiko Carstens <hca@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org, linux-s390@vger.kernel.org,
	x86@kernel.org
Subject: Re: [PATCH] lib/crc: make the CPU feature static keys __ro_after_init
Message-ID: <20250417163221.GA800@quark.localdomain>
References: <20250413154350.10819-1-ebiggers@kernel.org>
 <20250417125318.12521F12-hca@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417125318.12521F12-hca@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_093225_454596_70CD5E35 
X-CRM114-Status: GOOD (  23.89  )
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

On Thu, Apr 17, 2025 at 02:53:18PM +0200, Heiko Carstens wrote:
> On Sun, Apr 13, 2025 at 08:43:50AM -0700, Eric Biggers wrote:
> > From: Eric Biggers <ebiggers@google.com>
> > 
> > All of the CRC library's CPU feature static_keys are initialized by
> > initcalls and never change afterwards, so there's no need for them to be
> > in the regular .data section.  Put them in .data..ro_after_init instead.
> > 
> > Signed-off-by: Eric Biggers <ebiggers@google.com>
> > ---
> > 
> > I'm planning to take this via the crc tree.
> > 
> >  arch/arm/lib/crc-t10dif-glue.c       | 4 ++--
> >  arch/arm/lib/crc32-glue.c            | 4 ++--
> >  arch/arm64/lib/crc-t10dif-glue.c     | 4 ++--
> >  arch/loongarch/lib/crc32-loongarch.c | 2 +-
> >  arch/mips/lib/crc32-mips.c           | 2 +-
> >  arch/powerpc/lib/crc-t10dif-glue.c   | 2 +-
> >  arch/powerpc/lib/crc32-glue.c        | 2 +-
> >  arch/s390/lib/crc32-glue.c           | 2 +-
> 
> 
> Acked-by: Heiko Carstens <hca@linux.ibm.com> # s390
> 
> I just realized that we can get rid of the static key in the s390
> piece and end up with slightly better code. Could you add the patch
> below to your tree, please? If this would go via the s390 tree this
> would result in a merge conflict, which is unnecessary.
> 
> From 6c4c0ca6fe87e43acf6192f1afc0a6346db994f4 Mon Sep 17 00:00:00 2001
> From: Heiko Carstens <hca@linux.ibm.com>
> Date: Thu, 17 Apr 2025 14:30:56 +0200
> Subject: [PATCH] s390/crc32: Remove have_vxrs static key
> 
> Replace the have_vxrs static key with a cpu_has_vx() call.  cpu_has_vx()
> resolves into a compile time constant (true) if the kernel is compiled for
> z13 or newer. Otherwise it generates an unconditional one instruction
> branch, which is patched based on CPU alternatives.
> 
> In any case the generated code is at least as good as before and avoids
> static key handling.
> 
> Signed-off-by: Heiko Carstens <hca@linux.ibm.com>
> ---
>  arch/s390/lib/crc32-glue.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)

Thanks!  Applied to
https://web.git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git/log/?h=crc-next

- Eric

