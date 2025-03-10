Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3519CC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 18:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MYClSjwXiljhdjUcN2EIkqdvKWWmZBY7ZYSZ9O05b9Q=; b=pfRZEdvGzBuOBolMPBv1m5zE04
	40bQoFPq5KKz2H5M5bOdAxthosrXtg0OGWGIUtMAYtndSaodCIYt0XBnKYRboWt8crkSD9qvbd601
	nSGlF8+d9bcIwblrOvkPg2gq4PDhmKHt/mVIeCrekKzsx4MfwqjAygKfJjskWrBNhZ5QCjJglb0eP
	AhtaU78BGhUem9auFF3bWe0ZaTfXFDSRQadwTxzkBEA9g3rNVTC2kSPYetAQih8D9r1OdPmxd2ghL
	+zCOcJ4MgFttcOevWnqe3NXK3J1yzXuHfKO79FIxkeJKEyhnECCM7+jF/f6ite6an/VWIKmyq8DxY
	sYS0NefA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trhyT-00000003crt-2Yqu;
	Mon, 10 Mar 2025 18:35:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trgwG-00000003V6a-3WAS
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 10 Mar 2025 17:29:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=MYClSjwXiljhdjUcN2EIkqdvKWWmZBY7ZYSZ9O05b9Q=; b=ptrjSpfOMJ9KpHiobo0cBZnbpS
	fq/hMUW+J8UxEP9ucEUFj+Tcz50UZGIK5tBRXZY5DJPxTTPs2c8HvjV67TOk4Fr5oVS11gdKDwQj6
	0GQ2nQWiEhdZVcAYyaauvxiUyioqyG3FV0NqoZLiqx0BU6BEe2OaGhNzXrGx+k4VOAs13oa2buCF1
	qTT4TShlUeKd3d+f+b7DdhADm3hWrXy1NwmRBwxosO3q3m43W3OwmQ+mxTtCra/yqKBlB0Waj2E4c
	TgvZPQtNEhsubM5DnP6dtCpJjvB0YdmSd5NbcANuaWSEuTybgrfj3CfeJrbh9ynqdSonApd+2T71z
	vI1ZtYDw==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trgwD-00000001ywb-2D7R
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 17:29:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 33632A460F2;
	Mon, 10 Mar 2025 17:23:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C61A4C4CEE5;
	Mon, 10 Mar 2025 17:29:07 +0000 (UTC)
Date: Mon, 10 Mar 2025 17:29:05 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Peter Collingbourne <pcc@google.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kees Cook <kees@kernel.org>, Andy Shevchenko <andy@kernel.org>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH] string: Disable read_word_at_a_time() optimizations if
 kernel MTE is enabled
Message-ID: <Z88hYdTAe6ok4_WT@arm.com>
References: <20250308023314.3981455-1-pcc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250308023314.3981455-1-pcc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_172913_694675_3E36D2DB 
X-CRM114-Status: GOOD (  18.63  )
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

On Fri, Mar 07, 2025 at 06:33:13PM -0800, Peter Collingbourne wrote:
> The optimized strscpy() and dentry_string_cmp() routines will read 8
> unaligned bytes at a time via the function read_word_at_a_time(), but
> this is incompatible with MTE which will fault on a partially invalid
> read. The attributes on read_word_at_a_time() that disable KASAN are
> invisible to the CPU so they have no effect on MTE. Let's fix the
> bug for now by disabling the optimizations if the kernel is built
> with HW tag-based KASAN and consider improvements for followup changes.
> 
> Signed-off-by: Peter Collingbourne <pcc@google.com>
> Link: https://linux-review.googlesource.com/id/If4b22e43b5a4ca49726b4bf98ada827fdf755548
> Fixes: 94ab5b61ee16 ("kasan, arm64: enable CONFIG_KASAN_HW_TAGS")
> Cc: stable@vger.kernel.org

Some time ago Vincenzo had an attempt at fixing this but neither of us
got around to posting it. It's on top of 6.2 and not sure how cleanly it
would rebase:

git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux devel/mte-strscpy

Feel free to cherry-pick patches from above, rewrite them etc.

> diff --git a/lib/string.c b/lib/string.c
> index eb4486ed40d25..9a43a3824d0d7 100644
> --- a/lib/string.c
> +++ b/lib/string.c
> @@ -119,7 +119,8 @@ ssize_t sized_strscpy(char *dest, const char *src, size_t count)
>  	if (count == 0 || WARN_ON_ONCE(count > INT_MAX))
>  		return -E2BIG;
>  
> -#ifdef CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
> +#if defined(CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS) && \
> +	!defined(CONFIG_KASAN_HW_TAGS)

Assuming that no-one wants to ever use KASAN_HW_TAGS=y in production,
this patch would do. Otherwise I'd rather use TCO around the access as
per the last patch from Vincenzo above.

Yet another option - use load_unaligned_zeropad() instead of
read_word_at_a_time(), not sure how it changes the semantics of
strscpy() in any way. This can be done in the arch code

-- 
Catalin

