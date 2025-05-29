Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4021C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 17:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gVwUTgaj25sjMKTStAmjKE9+CrC7e5n2kVvgLBCxltU=; b=avvnOa2HtQtEWb+CMFmFuCd/gP
	WhdsyUnQ2d/Fz/l/KnZu4GuR+eZYWnWu6Qm8xO4UvHaGgzQKNIkdl/9tabAs+TxEy2NGBbyZy7DoE
	AlXeJ8cW/ZTl7e20gE61tGeALhY3QqnsTgNFfWcgf/nW6159gb/OPys1u9wOi3PE0/+pdVNCJs+UZ
	W6qITz9XZrgSv6NAJqSZuqQP4Yu5ZbJNuNkOKvmgZetV25/jDp85f1tHjVxXfCzoUFWjvRSrj7jpy
	WuK/s2nX+Y1GVsxzRvgK8hT9N5wupXSWooZEqh59i8IDiJLEBaZ+yf0LzWI90dpAIcSp+Q5G0V7qZ
	tY5TZ9uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKhES-0000000GIiS-31ni;
	Thu, 29 May 2025 17:39:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKhBi-0000000GIOA-3lP5;
	Thu, 29 May 2025 17:37:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DDB925C66E7;
	Thu, 29 May 2025 17:34:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC1A4C4CEE7;
	Thu, 29 May 2025 17:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748540225;
	bh=0GXm5pTogqSytd7HXCHRBpGcw/KVfKQwmeZU/tPlGeY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P05+EG6QuWbLmid658i7wJ4peqnrvmqlgPCljhnLaj4XyclH8hkfrYGL+CRlxzddC
	 hbyeNHzdiUoe6//EBJN0SHtXtGWpoidgCFvB7Nd+c6GGHyDeCN0m7YTZPZj5b0A43P
	 Yt2bBDtjqOAiSVHMGqQPF67AYYacgPSoiHuo7/B03p7Tbyu0TexTB8Tq6SN5kWMndg
	 CKM23WFv/5LhygR8VTeBM9aYW5uyOIlvel/5nWf0c8MhUDD10NZbPKL3v1kbAXKqUe
	 XT3gPdF+TlTtWX4Dy4gUrnrl9Pe40MGx9z4Ewb2voiHEnUaQkami6AjhZ53YldkzTP
	 9yMidZsyEePUQ==
Date: Thu, 29 May 2025 17:37:02 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: Alex Williamson <alex.williamson@redhat.com>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, sparclinux@vger.kernel.org,
	linux-s390@vger.kernel.org, x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v4 08/13] crypto: s390/sha256 - implement library instead
 of shash
Message-ID: <20250529173702.GA3840196@google.com>
References: <20250428170040.423825-1-ebiggers@kernel.org>
 <20250428170040.423825-9-ebiggers@kernel.org>
 <20250529110526.6d2959a9.alex.williamson@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250529110526.6d2959a9.alex.williamson@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_103706_979398_B5F63084 
X-CRM114-Status: GOOD (  17.35  )
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

On Thu, May 29, 2025 at 11:05:26AM -0600, Alex Williamson wrote:
> On Mon, 28 Apr 2025 10:00:33 -0700
> Eric Biggers <ebiggers@kernel.org> wrote:
> 
> > From: Eric Biggers <ebiggers@google.com>
> > 
> > Instead of providing crypto_shash algorithms for the arch-optimized
> > SHA-256 code, instead implement the SHA-256 library.  This is much
> > simpler, it makes the SHA-256 library functions be arch-optimized, and
> > it fixes the longstanding issue where the arch-optimized SHA-256 was
> > disabled by default.  SHA-256 still remains available through
> > crypto_shash, but individual architectures no longer need to handle it.
> 
> I can get to the following error after this patch, now merged as commit
> b9eac03edcf8 ("crypto: s390/sha256 - implement library instead of shash"):
> 
> error: the following would cause module name conflict:
>   crypto/sha256.ko
>   arch/s390/lib/crypto/sha256.ko

Thanks for reporting this.  For now the s390 one should be renamed to
sha256-s390, similar to how the other architectures' sha256 modules are named.
I'll send a patch.

Long-term, I'd like to find a clean way to consolidate the library code for each
algorithm into a single module.  So instead of e.g. libsha256.ko,
libsha256-generic.ko, and sha256-s390.ko (all of which get loaded when the
SHA-256 library is needed), we'd just have libsha256.ko.  (Or just sha256.ko,
with the old-school crypto API one renamed to sha256-cryptoapi.ko.)  A lot of
these weird build problems we've been having are caused by the unnecessary
separation into multiple modules.

- Eric

