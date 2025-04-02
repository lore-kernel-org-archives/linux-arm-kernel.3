Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 429FCC36018
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 20:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hFW3v//IajFZdnewSaOSlrzgqURblC3b+kl5GYS3Y3o=; b=TLz80q/WtMnSxLiXlO2YvO/JCY
	er3V3bMW4Dp8jrHesEcSlziv6ia85rBZYTMosHEeJCvYHwJJ5DzzEIc4XX1Sv5nSzcnmQvDPvz1aR
	W2aGTq3oiISSzZKmQHO+/WEiIbbtXav4z0iUGDJtFta7aOq2ygGW5CiyDmYGq1EPsHFI34+RuRaXX
	4OlRz5IoML5P1BBzMk2YKr5NLmJPoccAYZ4tvAnA74wd6AHriBv3+9+4zxLxnX8Oj4TtLa9A8KHE0
	FBcd4cWknPIqx9lJOMSJMDVYAkivvZSIJJ7sSXHyxmgqVOF3NuSWTPcycskMMIdOq6pkRt22CYnM/
	tBa5Gm2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u04Rw-000000077M4-3zLq;
	Wed, 02 Apr 2025 20:12:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u04QB-00000007767-1LdT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 20:10:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EFCFA44069;
	Wed,  2 Apr 2025 20:10:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC11FC4CEDD;
	Wed,  2 Apr 2025 20:10:43 +0000 (UTC)
Date: Wed, 2 Apr 2025 21:10:41 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Peter Collingbourne <pcc@google.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kees Cook <kees@kernel.org>, Andy Shevchenko <andy@kernel.org>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH v4 1/2] string: Add load_unaligned_zeropad() code path to
 sized_strscpy()
Message-ID: <Z-2ZwThH-7rkQW86@arm.com>
References: <20250329000338.1031289-1-pcc@google.com>
 <20250329000338.1031289-2-pcc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250329000338.1031289-2-pcc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_131047_398613_698E8CF4 
X-CRM114-Status: GOOD (  20.45  )
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

On Fri, Mar 28, 2025 at 05:03:36PM -0700, Peter Collingbourne wrote:
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
>  	/*
>  	 * If src is unaligned, don't cross a page boundary,
> @@ -133,12 +134,14 @@ ssize_t sized_strscpy(char *dest, const char *src, size_t count)
>  	/* If src or dest is unaligned, don't do word-at-a-time. */
>  	if (((long) dest | (long) src) & (sizeof(long) - 1))
>  		max = 0;
> +#endif
>  #endif
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

Kees mentioned the scenario where this crosses the page boundary and we
pad the source with zeros. It's probably fine but there are 70+ cases
where the strscpy() return value is checked, I only looked at a couple.

Could we at least preserve the behaviour with regards to page boundaries
and keep the existing 'max' limiting logic? If I read the code
correctly, a fall back to reading one byte at a time from an unmapped
page would panic. We also get this behaviour if src[0] is reading from
an invalid address, though for arm64 the panic would be in
ex_handler_load_unaligned_zeropad() when count >= 8.

Reading across tag granule (but not across page boundary) and causing a
tag check fault would result in padding but we can live with this and
only architectures that do MTE-style tag checking would get the new
behaviour.

What I haven't checked is whether a tag check fault in
ex_handler_load_unaligned_zeropad() would confuse the KASAN logic for
MTE (it would be a second tag check fault while processing the first).
At a quick look, it seems ok but it might be worth checking.

-- 
Catalin

