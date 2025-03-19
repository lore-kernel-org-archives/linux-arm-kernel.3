Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CE2BC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 03:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ux++vUKtizBXRxMS1k10eDXBIrTgFeG6P4A+B1edTkc=; b=BlFYxz+vl9BpqxzRWnq4Og6qGi
	IP7V2eFoCSOG53fEj4CEOTDDi8jzkMxwJl7FhUUOR1ggxCgbLOEB/NDmEtE7mmG9Z5jXE0ES9U2o0
	KSnCcU6Fsou94P/W1kI26rKY/7aaGOzkO4CYWOhTtfINPDfJryS6LpQt5CInGBk2ZGh1PLUQRN2IM
	PUQGzsROlBshwvyGeQTa0DR4U1+k1xuKmweZkFJR3bam9p5PpTWEqzuTxJAspedMILJmDcslx0Wo3
	Cd/XKTpwoB8KD/eM/ysRpF5I+Fz/0r7ntCjmFCjuJ1rPm4qOdEWPkwiZ8cxiVqPA3QGFV/qLzWGqK
	IZPP60iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tujmy-00000007qjf-2OFf;
	Wed, 19 Mar 2025 03:08:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tujlK-00000007qaA-20kV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 03:06:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A37B3615DA;
	Wed, 19 Mar 2025 03:06:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DC99C4CEE3;
	Wed, 19 Mar 2025 03:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742353592;
	bh=bSt/O7czoSNWFRcsE3rQTY00tKWSZJC7M7fXZe1tBRY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XUs5+gRN7F3D9wjM00iR5qUYJ+zg+KhgaBhp3hIjBKS7MmOnFRi5z4uyKZMByuzpT
	 aRnLHnPrRFmw8TJD3EQ9k+RW4h8RwxCa62cAsI/eHS2et+ABobxSUuR51AjK8Qkkmx
	 aTXLesTsTLkqQ0TyHDI6ckPdzTz7db3ZvW/Nbv9lOSP+4w+eqg/pLJD5mMykQEWnh2
	 +g/1KVNEsR5ZjYg+2/frXjJkI7gO9Zr/97dD3MApFTAzH2nEFs6eoQtXFJbJIxt3kR
	 GrWHMXbljMz8EcObP0y6RWAQ0vYec8y7uKu9SlDUyWi8TEW2Ilp4CmqKbnh1Zx6SnC
	 ZePzyIlyjLcTA==
Date: Tue, 18 Mar 2025 20:06:28 -0700
From: Kees Cook <kees@kernel.org>
To: Peter Collingbourne <pcc@google.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Shevchenko <andy@kernel.org>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/2] string: Add load_unaligned_zeropad() code path to
 sized_strscpy()
Message-ID: <202503181957.55A0E0A@keescook>
References: <20250318214035.481950-1-pcc@google.com>
 <20250318214035.481950-2-pcc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250318214035.481950-2-pcc@google.com>
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

On Tue, Mar 18, 2025 at 02:40:32PM -0700, Peter Collingbourne wrote:
> The call to read_word_at_a_time() in sized_strscpy() is problematic
> with MTE because it may trigger a tag check fault when reading
> across a tag granule (16 bytes) boundary. To make this code
> MTE compatible, let's start using load_unaligned_zeropad()
> on architectures where it is available (i.e. architectures that
> define CONFIG_DCACHE_WORD_ACCESS). Because load_unaligned_zeropad()
> takes care of page boundaries as well as tag granule boundaries,
> also disable the code preventing crossing page boundaries when using
> load_unaligned_zeropad().
> 
> Signed-off-by: Peter Collingbourne <pcc@google.com>
> Link: https://linux-review.googlesource.com/id/If4b22e43b5a4ca49726b4bf98ada827fdf755548
> Fixes: 94ab5b61ee16 ("kasan, arm64: enable CONFIG_KASAN_HW_TAGS")
> Cc: stable@vger.kernel.org
> ---
> v2:
> - new approach
> 
>  lib/string.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/string.c b/lib/string.c
> index eb4486ed40d25..b632c71df1a50 100644
> --- a/lib/string.c
> +++ b/lib/string.c
> @@ -119,6 +119,7 @@ ssize_t sized_strscpy(char *dest, const char *src, size_t count)
>  	if (count == 0 || WARN_ON_ONCE(count > INT_MAX))
>  		return -E2BIG;
>  
> +#ifndef CONFIG_DCACHE_WORD_ACCESS
>  #ifdef CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS

I would prefer this were written as:

#if !defined(CONFIG_DCACHE_WORD_ACCESS) && \
    defined(CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS)

Having 2 #ifs makes me think there is some reason for having them
separable. But the logic here is for a single check.

>  	/*
>  	 * If src is unaligned, don't cross a page boundary,
> @@ -133,12 +134,14 @@ ssize_t sized_strscpy(char *dest, const char *src, size_t count)
>  	/* If src or dest is unaligned, don't do word-at-a-time. */
>  	if (((long) dest | (long) src) & (sizeof(long) - 1))
>  		max = 0;
> +#endif
>  #endif

(Then no second #endif needed)

>  
>  	/*
> -	 * read_word_at_a_time() below may read uninitialized bytes after the
> -	 * trailing zero and use them in comparisons. Disable this optimization
> -	 * under KMSAN to prevent false positive reports.
> +	 * load_unaligned_zeropad() or read_word_at_a_time() below may read
> +	 * uninitialized bytes after the trailing zero and use them in
> +	 * comparisons. Disable this optimization under KMSAN to prevent
> +	 * false positive reports.
>  	 */
>  	if (IS_ENABLED(CONFIG_KMSAN))
>  		max = 0;
> @@ -146,7 +149,11 @@ ssize_t sized_strscpy(char *dest, const char *src, size_t count)
>  	while (max >= sizeof(unsigned long)) {
>  		unsigned long c, data;
>  
> +#ifdef CONFIG_DCACHE_WORD_ACCESS
> +		c = load_unaligned_zeropad(src+res);
> +#else
>  		c = read_word_at_a_time(src+res);
> +#endif
>  		if (has_zero(c, &data, &constants)) {
>  			data = prep_zero_mask(c, data, &constants);
>  			data = create_zero_mask(data);

The rest seems good. Though I do wonder: what happens on a page boundary
for read_word_at_a_time(), then? We get back zero-filled remainder? Will
that hide a missing NUL terminator? As in, it's not actually there
because of the end of the page/granule, but a zero was put in, so now
it looks like it's been terminated and the exception got eaten? And
doesn't this hide MTE faults since we can't differentiate "overran MTE
tag" from "overran granule while over-reading"?

-- 
Kees Cook

