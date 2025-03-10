Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC24DC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 17:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YpoKqmY26E+EiNPwqoey7nNgntyh00SFpI2Dt2BOSOg=; b=MU0m7xIHZiRB6KM8Nlhs9fvvAX
	87avWi1PyGu0Vi6FywcspjQ70bzMlXAAJX6bF1rxIvaJR6hYH3O/OC6YSk5m8zPIcNdjHEpUpfJqw
	ia9j5Wvlsui+m9IVNHU3hvVo7RZu5hFYt0o3IvaBQaLNWdC6M9GawaGYuiXnPxDeHdRBLFSkkvhqE
	yVg7U23HS1lqXEdeysMSP8IkH72sSMdxRRlmFEexS6zVoVeW3KhA3YV/ypbDaZG3ekyA/ogN3RhFJ
	GAWM230gwFixIt4zW57jzZ7fTIb/5ngn83DMQJy4Sg4NAEFC37Tl/YobJTiSbYWIPpaIO1JjTNgIH
	w5B+/zkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trh6j-00000003W9i-3TvU;
	Mon, 10 Mar 2025 17:40:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trh4i-00000003W0i-0SYj
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 10 Mar 2025 17:38:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=YpoKqmY26E+EiNPwqoey7nNgntyh00SFpI2Dt2BOSOg=; b=SxV8XEaRktSVBOPPEZVj6zEnDI
	GlgA7dETIgsQUXyhAG3Hvqydxv9qc+fpLc+nNa2qiuefOSvv4Iquq9kjsKWuwldtGMVkqZFaXITON
	m/AjowRkQ5k+uv2cf0TWCFLyNEfFG8rReLMnrTyC0Bu8lLc7safeGCxMmKmDcr7nQr2L+vYyiiDOv
	8mkjbK8JqfiRPDncAe9kI0Eo9AHxUqBwg3rTcEv/KKyACvWyMptsRDflq2M2mfm+gYGR+n/1T/9bj
	mVVR8hwmJrwYlJasuPKhcPoppnnjeCYd+mqk9tEFZryGu/4hG9X2I5QOCwcNH7NpHRbd7nhGr2rB4
	nLqvM9Xg==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trh4e-00000001zV7-3Kl6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 17:37:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 57F82A460FB;
	Mon, 10 Mar 2025 17:32:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02D57C4CEE5;
	Mon, 10 Mar 2025 17:37:52 +0000 (UTC)
Date: Mon, 10 Mar 2025 17:37:50 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Kees Cook <kees@kernel.org>
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
Message-ID: <Z88jbhobIz2yWBbJ@arm.com>
References: <20250308023314.3981455-1-pcc@google.com>
 <202503071927.1A795821A@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202503071927.1A795821A@keescook>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_173757_190672_79F4CEE7 
X-CRM114-Status: GOOD (  25.25  )
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

On Fri, Mar 07, 2025 at 07:36:31PM -0800, Kees Cook wrote:
> On Fri, Mar 07, 2025 at 06:33:13PM -0800, Peter Collingbourne wrote:
> > The optimized strscpy() and dentry_string_cmp() routines will read 8
> > unaligned bytes at a time via the function read_word_at_a_time(), but
> > this is incompatible with MTE which will fault on a partially invalid
> > read. The attributes on read_word_at_a_time() that disable KASAN are
> > invisible to the CPU so they have no effect on MTE. Let's fix the
> > bug for now by disabling the optimizations if the kernel is built
> > with HW tag-based KASAN and consider improvements for followup changes.
> 
> Why is faulting on a partially invalid read a problem? It's still
> invalid, so ... it should fault, yes? What am I missing?

read_word_at_a_time() is used to read 8 bytes, potentially unaligned and
beyond the end of string. The has_zero() function is then used to check
where the string ends. For this uses, I think we can go with
load_unaligned_zeropad() which handles a potential fault and pads the
rest with zeroes.

> > Signed-off-by: Peter Collingbourne <pcc@google.com>
> > Link: https://linux-review.googlesource.com/id/If4b22e43b5a4ca49726b4bf98ada827fdf755548
> > Fixes: 94ab5b61ee16 ("kasan, arm64: enable CONFIG_KASAN_HW_TAGS")
> > Cc: stable@vger.kernel.org
> > ---
> >  fs/dcache.c  | 2 +-
> >  lib/string.c | 3 ++-
> >  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> Why are DCACHE_WORD_ACCESS and HAVE_EFFICIENT_UNALIGNED_ACCESS separate
> things? I can see at least one place where it's directly tied:
> 
> arch/arm/Kconfig:58:    select DCACHE_WORD_ACCESS if HAVE_EFFICIENT_UNALIGNED_ACCESS

DCACHE_WORD_ACCESS requires load_unaligned_zeropad() which handles the
faults. For some reason, read_word_at_a_time() doesn't expect to fault
and it is only used with HAVE_EFFICIENT_UNALIGNED_ACCESS. I guess arm32
only enabled load_unaligned_zeropad() on hardware that supports
efficient unaligned accesses (v6 onwards), hence the dependency.

> Would it make sense to sort this out so that KASAN_HW_TAGS can be taken
> into account at the Kconfig level instead?

I don't think we should play with config options but rather sort out the
fault path (load_unaligned_zeropad) or disable MTE temporarily. I'd go
with the former as long as read_word_at_a_time() is only used for
strings in conjunction with has_zero(). I haven't checked.

-- 
Catalin

