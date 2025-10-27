Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82EB0CCF9EA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 09:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m0Pus8VdE73cg6u8af88KZxL9loQlsMLgR1yhn6yEUA=; b=1p7HikEYeaBIxyF1/RHQiZRMnG
	hKI/doELaHoxxw89T1izFrVox7Y6dvBAo7mlIcjyuucJzTw44jdJTxP+jWzPRZi140tai0u+iiB9G
	+32nfm0iswJD0czeirrnTGxHb4t01eO5B6+hMi1acLXbg6ST71a0occgWp6zz9ihCLkodzNsF5EQj
	hR9YrA++3pWGvTnbkEca9JV0fnxmt5x0TJ77PSOxmMmT+TrUL/n5T+NIFBpUM1cUH61oDjlpq0yyD
	2xymBnrMVM1viZz+zx9dFjzfl2j6wd0PcsisbFV1X7WWR26gU0JaprZGL+pWIxYTiMizJ+fj72aUk
	5uJ52Q0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDJ80-0000000DTSP-0gOE;
	Mon, 27 Oct 2025 09:03:00 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDJ7u-0000000DTQG-2Dt8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 09:02:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761555774; x=1793091774;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=G1ePlaSWeQMNuAJ53oX32ThxSRn7zfNb9gCAqZMnhFs=;
  b=aBCMP6q/486wydOsu9r8a67gBh/x5n/t+znlcqFv8wpCuMn55uqoSZjZ
   k7/dnhheXAeOKGzgsFxvaPuMPADn6XJ2g+6+g2BFfsj1aXSSKhyQQGxIy
   8w8h2J2XHQdCrwEzbP16/h6wDiIl52GMDAnisxqj8n9v4jKJcS7sbqcNG
   ATUFrf3pd0pbugQpMqX8+NajDe+De7f8d74GADScKLVamGYJImONJtGXl
   YHZmbJBxHOVOqcfV5YuQSyPQBIzqOhh3c9RLm2xlxdomM+tMldaISZS9Z
   VNgoR00E9ga+pIGiMFsPBPyhBFrVTZHvQPIq5wjl5+C90sbzkTB0mya2Q
   w==;
X-CSE-ConnectionGUID: voPYy4RNQAC1JeQ/o7wg8g==
X-CSE-MsgGUID: C4guoIqCSF2ezXQnJsaIHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74306069"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="74306069"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 02:02:54 -0700
X-CSE-ConnectionGUID: u2MvC9QpS4uX+ruEyclGQA==
X-CSE-MsgGUID: Jyzz3AT/R3aV/tylkEXqnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="184893022"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost) ([10.245.246.35])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 02:02:51 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>, Linus Walleij
 <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org
Cc: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
Subject: Re: [PATCH 21/21] Docs: add Functions parameters order section
In-Reply-To: <20251025163305.306787-14-yury.norov@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20251025162858.305236-1-yury.norov@gmail.com>
 <20251025163305.306787-14-yury.norov@gmail.com>
Date: Mon, 27 Oct 2025 11:02:48 +0200
Message-ID: <723c936f92352352c3b1a84b858d684f5b7a0834@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_020254_578520_0F780154 
X-CRM114-Status: GOOD (  20.09  )
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

On Sat, 25 Oct 2025, "Yury Norov (NVIDIA)" <yury.norov@gmail.com> wrote:
> Standardize parameters ordering in some typical cases to minimize
> confusion.
>
> Signed-off-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>
> ---
>  Documentation/process/coding-style.rst | 48 ++++++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
>
> diff --git a/Documentation/process/coding-style.rst b/Documentation/process/coding-style.rst
> index d1a8e5465ed9..dde24148305c 100644
> --- a/Documentation/process/coding-style.rst
> +++ b/Documentation/process/coding-style.rst
> @@ -523,6 +523,54 @@ below, compared to the **declaration** example above)::
>  	...
>   }
>  
> +6.2) Function parameters order
> +------------------------------
> +
> +The order of parameters is important both for code generation and readability.
> +Passing parameters in an unusual order is a common source of bugs. Listing
> +them in standard widely adopted order helps to avoid confusion.
> +
> +Many ABIs put first function parameter and return value in R0. If your
> +function returns one of its parameters, passing it at the very beginning
> +would lead to a better code generation. For example::
> +
> +        void *memset64(uint64_t *s, uint64_t v, size_t count);
> +        void *memcpy(void *dest, const void *src, size_t count);
> +
> +If your function doesn't propagate a parameter, but has a meaning of copying
> +and/or processing data, the best practice is following the traditional order:
> +destination, source, options, flags.
> +
> +for_each()-like iterators should take an enumerator the first. For example::
> +
> +        for_each_set_bit(bit, mask, nbits);
> +                do_something(bit);
> +
> +        list_for_each_entry(pos, head, member);
> +                do_something(pos);
> +
> +If function operates on a range or ranges of data, corresponding parameters
> +may be described as ``start - end`` or ``start - size`` pairs. In both cases,
> +the parameters should follow each other. For example::
> +
> +        int
> +        check_range(unsigned long vstart, unsigned long vend,
> +                    unsigned long kstart, unsigned long kend);
> +
> +        static inline void flush_icache_range(unsigned long start, unsigned long end);
> +
> +        static inline void flush_icache_user_page(struct vm_area_struct *vma,
> +                                            struct page *page,
> +                                            unsigned long addr, int len);
> +
> +Both ``start`` and ``end`` of the interval are inclusive.
> +
> +Describing intervals in order ``end - start`` is unfavorable. One notable
> +example is the ``GENMASK(high, low)`` macro. While such a notation is popular
> +in hardware context, particularly to describe registers structure, in context
> +of software development it looks counter intuitive and confusing. Please switch
> +to an equivalent ``BITS(low, high)`` version.
> +

GENMASK when used for defining hardware registers is completely fine,
and *much* easier to deal with when you cross check against the specs
that almost invariably define high:low.

Which other parts of coding style take on specific interfaces and tell
you to switch? Weird. I for one don't want to encourage an influx of
trivial patches doing GENMASK to BITS conversions, and then keep
rejecting them. It's just a huge collective waste of time.

Anyway, that's a lot of text on "function parameter order" to justify
BITS(), but completely skips more important principles such as "context
parameter first", or "destination first".


BR,
Jani.


>  7) Centralized exiting of functions
>  -----------------------------------

-- 
Jani Nikula, Intel

