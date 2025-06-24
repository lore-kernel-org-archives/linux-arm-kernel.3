Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14EADC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 02:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gwAjevotn2+cLNInpCgkKPBdJ1HaetZ55em2s+ME0vk=; b=2cyatGmLL1hVSfPQkuo8CGv4RE
	8hq6HCAuw/dIsJus3s7cThxio/C/ELfowgS/5ijfT2UJBz+8tEDI7Wpkzf5oQNyzYhJq1MqAJONV3
	hPywuJeSPKRmjCopLICzV/y5ucRsxqIV1YrtFui1h5Rs7WK6iJNzIHEAPKthabXgGersf108MYBhU
	/0I6qOECl5l6TJHSukMFaNuJy4j7JBQbPrlqk29PLdSMMA9O+/zBgpO+fw8qEtYrmpV3065g15fSw
	33rH7emNSq0RI/OEqLLvLKxKIEzTJRAfB5CafdKJGfJSVX8bSjHQZDJWBEhHw4MrOvb7DuC+SHLsM
	ExgnjwWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTthS-00000004V9J-0JYR;
	Tue, 24 Jun 2025 02:47:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTtf6-00000004UlJ-1hiO;
	Tue, 24 Jun 2025 02:45:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 47CEF44AFC;
	Tue, 24 Jun 2025 02:45:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1A0AC4CEEA;
	Tue, 24 Jun 2025 02:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750733126;
	bh=wvw4KZrFb3bDpFyljDt13+2hzP7dlyNidFKreU0+rGc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oIipPcPUENDbB1DVaM2klpFxZLymtMC1278ktKPXQMNZt41mnhj+ZJexStFH5JK2u
	 nFXCl0kaNRAtFSccN6WfWV998QOsGwbB+qf9yeRG2pfUiPe5aPfG7a5fiaJzXH3RE/
	 FIJSmpv+ncH9OqsDWsdaTgdlboVcC2ABX1ghnprIEbIl3QAUqvV2QqsDjZ1079FYkn
	 jPt0nzSxpOunutckTus8H/G0ofSpk6ztujnJoy+KSEri/GKc+oFI2MLNBYknXyAgdT
	 3HUYlPxE9SjpaR0UWveXbgSzRwttALUuqVwFQiG2HmGYrj+2QgHF3a3xvoxS0gN2+S
	 O5Eof0eJUCorA==
Date: Mon, 23 Jun 2025 19:44:51 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jason@zx2c4.com, Ard Biesheuvel <ardb@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
	x86@kernel.org
Subject: Re: [PATCH v2 5/9] lib/crypto: riscv: move arch/riscv/lib/crypto/
 into lib/crypto/
Message-ID: <20250624024451.GA7127@sol>
References: <20250619191908.134235-6-ebiggers@kernel.org>
 <mhng-8FC37478-859D-40EA-A0E9-3EA86429DC53@palmerdabbelt-mac>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <mhng-8FC37478-859D-40EA-A0E9-3EA86429DC53@palmerdabbelt-mac>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_194528_490491_10C08FEC 
X-CRM114-Status: GOOD (  22.95  )
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

On Mon, Jun 23, 2025 at 04:23:52PM -0700, Palmer Dabbelt wrote:
> On Thu, 19 Jun 2025 12:19:04 PDT (-0700), ebiggers@kernel.org wrote:
> > From: Eric Biggers <ebiggers@google.com>
> > 
> > Move the contents of arch/riscv/lib/crypto/ into lib/crypto/riscv/.
> > 
> > The new code organization makes a lot more sense for how this code
> > actually works and is developed.  In particular, it makes it possible to
> > build each algorithm as a single module, with better inlining and dead
> > code elimination.  For a more detailed explanation, see the patchset
> > which did this for the CRC library code:
> > https://lore.kernel.org/r/20250607200454.73587-1-ebiggers@kernel.org/.
> > Also see the patchset which did this for SHA-512:
> > https://lore.kernel.org/linux-crypto/20250616014019.415791-1-ebiggers@kernel.org/
> > 
> > This is just a preparatory commit, which does the move to get the files
> > into their new location but keeps them building the same way as before.
> > Later commits will make the actual improvements to the way the
> > arch-optimized code is integrated for each algorithm.
> > 
> > Signed-off-by: Eric Biggers <ebiggers@google.com>
> > ---
> >  arch/riscv/lib/Makefile                                         | 1 -
> >  lib/crypto/Kconfig                                              | 2 +-
> >  lib/crypto/Makefile                                             | 1 +
> >  {arch/riscv/lib/crypto => lib/crypto/riscv}/Kconfig             | 0
> >  {arch/riscv/lib/crypto => lib/crypto/riscv}/Makefile            | 0
> >  .../riscv/lib/crypto => lib/crypto/riscv}/chacha-riscv64-glue.c | 0
> >  .../riscv/lib/crypto => lib/crypto/riscv}/chacha-riscv64-zvkb.S | 0
> >  .../crypto/riscv}/sha256-riscv64-zvknha_or_zvknhb-zvkb.S        | 0
> >  {arch/riscv/lib/crypto => lib/crypto/riscv}/sha256.c            | 0
> >  9 files changed, 2 insertions(+), 2 deletions(-)
> >  rename {arch/riscv/lib/crypto => lib/crypto/riscv}/Kconfig (100%)
> >  rename {arch/riscv/lib/crypto => lib/crypto/riscv}/Makefile (100%)
> >  rename {arch/riscv/lib/crypto => lib/crypto/riscv}/chacha-riscv64-glue.c (100%)
> >  rename {arch/riscv/lib/crypto => lib/crypto/riscv}/chacha-riscv64-zvkb.S (100%)
> >  rename {arch/riscv/lib/crypto => lib/crypto/riscv}/sha256-riscv64-zvknha_or_zvknhb-zvkb.S (100%)
> >  rename {arch/riscv/lib/crypto => lib/crypto/riscv}/sha256.c (100%)
> 
> I'm assuming you want to keep these all together.
> 
> Acked-by: Palmer Dabbelt <palmer@dabbelt.com>
> 

Yes, I'm taking this series through libcrypto-next.  Thanks!

- Eric

