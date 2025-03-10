Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49B1AC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 18:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DaOxr79zD5MKSxB74XUoKMZG3JjeyWYJuwDf8TR+mpw=; b=H8RQ+3ptu5Acto/77P8oyCV4U/
	4Os3YSKcGwOW41+f3TMhj/eQa58xO2WNOcbUCjwDf71yedVAtBlcir5NH4nEdbiusRLVKWb7q6cS4
	BepRe6+J6+Mf945fVxhGLe+YKphFUJmlBlF7sXqRRLLKmdGMFPTyXAVSctRMNhWv/1tkX1avJGXfF
	aCsQff9uxw3V4TlJcL5MdjuL/eoPnQvs2estsv3Gq0uDqjqc+UEQATmjNJ2KVbJy835WAnS3DLi7z
	JLdIm8tY6H/oUh990VjP0XR4DHN6I3KRT+ntDHxFqnZoTf73oG9OS/Irlc2YvMgDoXbPzsPoz0uld
	dvxcP0cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trhbn-00000003Zqe-2JEe;
	Mon, 10 Mar 2025 18:12:11 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trhZZ-00000003ZWp-1Q8K
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 18:09:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 20988A4611B;
	Mon, 10 Mar 2025 18:04:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 164C3C4CEE5;
	Mon, 10 Mar 2025 18:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741630192;
	bh=NqjlWBV34qNah3nFVeImdNVUTYXHJApCOBgfG6qXSxQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IXzR4HdHNm0lCsWhMS7Qh2ZjVOzf793rCeaBCvEbLwZeZieX3JWFlq4gZvAAmPjyz
	 +IXxKcH2D1GD2eTMbbrioyLSrC46Ufngk3DzORjpFG6zL1zigudZ/E9IyxzG3d3Irx
	 /gJYrBxcr4PtoBIItjeKpMldJ7F88T0Nxlomw/giWIVZaEQB4FqY+tBsKeviBkfhfG
	 +A/HtZ2+76YRzJt/V9IFIe8hoyZEIeoeAN+O+T0O4FmSfeSITfxFX2JO+XaxOs+tkj
	 qAZye9TjbuNu62QFmZC3adnFt5aWSAz+JNmg0SlenJTRG3g1cSSc/ovdo9KAdyR9c6
	 SpHxFa+1X7K0w==
Date: Mon, 10 Mar 2025 11:09:48 -0700
From: Kees Cook <kees@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Peter Collingbourne <pcc@google.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Shevchenko <andy@kernel.org>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH] string: Disable read_word_at_a_time() optimizations if
 kernel MTE is enabled
Message-ID: <202503101107.995ECFA@keescook>
References: <20250308023314.3981455-1-pcc@google.com>
 <202503071927.1A795821A@keescook>
 <Z88jbhobIz2yWBbJ@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z88jbhobIz2yWBbJ@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_110953_503978_9E1A9D76 
X-CRM114-Status: GOOD (  33.19  )
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

On Mon, Mar 10, 2025 at 05:37:50PM +0000, Catalin Marinas wrote:
> On Fri, Mar 07, 2025 at 07:36:31PM -0800, Kees Cook wrote:
> > On Fri, Mar 07, 2025 at 06:33:13PM -0800, Peter Collingbourne wrote:
> > > The optimized strscpy() and dentry_string_cmp() routines will read 8
> > > unaligned bytes at a time via the function read_word_at_a_time(), but
> > > this is incompatible with MTE which will fault on a partially invalid
> > > read. The attributes on read_word_at_a_time() that disable KASAN are
> > > invisible to the CPU so they have no effect on MTE. Let's fix the
> > > bug for now by disabling the optimizations if the kernel is built
> > > with HW tag-based KASAN and consider improvements for followup changes.
> > 
> > Why is faulting on a partially invalid read a problem? It's still
> > invalid, so ... it should fault, yes? What am I missing?
> 
> read_word_at_a_time() is used to read 8 bytes, potentially unaligned and
> beyond the end of string. The has_zero() function is then used to check
> where the string ends. For this uses, I think we can go with
> load_unaligned_zeropad() which handles a potential fault and pads the
> rest with zeroes.

Agh, right, I keep forgetting that this can read past the end of the
actual allocation. I'd agree, load_unaligned_zeropad() makes sense
there.

> 
> > > Signed-off-by: Peter Collingbourne <pcc@google.com>
> > > Link: https://linux-review.googlesource.com/id/If4b22e43b5a4ca49726b4bf98ada827fdf755548
> > > Fixes: 94ab5b61ee16 ("kasan, arm64: enable CONFIG_KASAN_HW_TAGS")
> > > Cc: stable@vger.kernel.org
> > > ---
> > >  fs/dcache.c  | 2 +-
> > >  lib/string.c | 3 ++-
> > >  2 files changed, 3 insertions(+), 2 deletions(-)
> > 
> > Why are DCACHE_WORD_ACCESS and HAVE_EFFICIENT_UNALIGNED_ACCESS separate
> > things? I can see at least one place where it's directly tied:
> > 
> > arch/arm/Kconfig:58:    select DCACHE_WORD_ACCESS if HAVE_EFFICIENT_UNALIGNED_ACCESS
> 
> DCACHE_WORD_ACCESS requires load_unaligned_zeropad() which handles the
> faults. For some reason, read_word_at_a_time() doesn't expect to fault
> and it is only used with HAVE_EFFICIENT_UNALIGNED_ACCESS. I guess arm32
> only enabled load_unaligned_zeropad() on hardware that supports
> efficient unaligned accesses (v6 onwards), hence the dependency.
> 
> > Would it make sense to sort this out so that KASAN_HW_TAGS can be taken
> > into account at the Kconfig level instead?
> 
> I don't think we should play with config options but rather sort out the
> fault path (load_unaligned_zeropad) or disable MTE temporarily. I'd go
> with the former as long as read_word_at_a_time() is only used for
> strings in conjunction with has_zero(). I haven't checked.

Okay, sounds good. (And with a mild thread-merge: yes, folks want to use
KASAN_HW_TAGS=y in production.)

-- 
Kees Cook

