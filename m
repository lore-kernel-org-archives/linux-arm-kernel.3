Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36C5CC36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 16:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pfKZtzv59eBwLvLslJklRIH1GlVmmxb0T7NI0lTwvR4=; b=ufFGGCWLTxuQPb6yyv+vSynPCp
	vvliOue5ocUCdgCa6dszzIxrSu9JNka6zdWx0jEAmMN/f2CYkIpeFMpHVGohYSxY2X1RezgqJayh+
	7EJlzkZPUmIQMk+ugcDMhum4XLFIjybMuCc9DdYdfl2TkFo9kLPu/bAMg9B+r+FctAD+od9jf8eBF
	Yhik13VMdCUK9DbsZvsWABSMAaccHy6VsGpqEQkdjx3o/nvywyKuy1SAriB9f2qqkxnjBPOL6LG2/
	k2rFGLxn2yD+MMdwYVwC7HlNJ2d5yOSwsKsI+4HQd6/a41mluBH0PpvHI7lujknwH7OAgOHnBC9Mk
	y0moEA0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twkUR-00000003btS-4A1j;
	Mon, 24 Mar 2025 16:17:27 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twkOH-00000003b65-1HAo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 16:11:06 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-2ff187f027fso9886901a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Mar 2025 09:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742832664; x=1743437464; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pfKZtzv59eBwLvLslJklRIH1GlVmmxb0T7NI0lTwvR4=;
        b=dMJ75vw36o27rSGszGiV1KJ8Ulely4ZdyLuHSJymTVQLaJoGMCz2BlYW2RMpmRCo+k
         Q4l5FwwslY8Y6mCjTXnqQwvXA4Fgdx/+ZF80Dt91yjQLjpOhkzE3ak6pfQC+Bb0Jebvf
         MvYdolrUPvvdeai2a4CMztsdUWYKjh6vKYOxHgE5QzZ/BH5N7it0/19Y+9zM3bIGZPdd
         VfAUNAn5LjFK0K1hSs89yAEmwsuvc7LKfcL9P/fRaxtNaIbqXGkO8Z/HtbsyAxc6opK0
         frmK5XKy2xPbEFkd9NmR+fHZ+n6PvWTZlcMas3KPudkOF4OMF0tg5Vr1lK4bpWGgc3JP
         wt0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742832664; x=1743437464;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pfKZtzv59eBwLvLslJklRIH1GlVmmxb0T7NI0lTwvR4=;
        b=g20rwBJHM4OfpnJ3Uziimz7enOEdF0sPY71Bil2O2f+orOI9Di78tR19U7IXpKyRc1
         Iw7Ezi2ZbbTCJK4HWJjD10mBzEO3kxR3r6gkuOf282FyydW6u/xhOxEGl6Oye2xHYpy9
         XVaetI1bvWMdtwOMhmjl5Tphohj4d1BR27vRvGof3S1dItG0C+nbN9nkVwna92ZASc37
         aarTpGrka3Emtu7U14BKydI0tq+bZlCAztKE+25v80ofLEo/8nhQ+x0hhK9oZY6OVSev
         5Y7WGjdyeNc8Fa0LceR5rDEa7KPtYlir09Q9QmEbA7JroySLXfbQ+9a0iWZr6ya5MWXL
         RxMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDevC5uhwj42ArJ8uX4FUGCsZ5vRaLPVnvHVJhOhRW4SGw2BXF0+QjQcxMlNSrgDkBZkBSetst2v14DGRT6y4e@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4iLQQlf2xyuu7pVhE3qgMOsdUEYWTfVb/TlUDLOPrMYQEoAQ+
	kyTG53nTxKyFXpyYK7KIyD1j0WBVE9489pKaJSWNSiQ6lExBf9QC
X-Gm-Gg: ASbGnctqBMMhGy7LMW3rqQSRKqVA9E6nPTJ1J0J4z8dLH7kNOM8l+6ZYz/LaD3Jj6nw
	Ifn3hrr1haFGyVUK1MubYIx3mpNyhIWxCZgxvab8SLtFAfvDME2pmtrvD8awEX2pzI4Cc/vY+MC
	aJc2yonV8wCJ0TEHFl8PkCU/cFvNpKTWYsuJ6KNQIGGGNgflt0yJvM2+LtTBfOUrUmdMgThOz2X
	Q1Gff53Cf3tJal7r/Llc055lL9ysE6/8gcOmVIxQC7I/1jH1eO8vpC61K72r7nJyIqSodfJlk+h
	vsG+c1QYvyokZs1fAUyAVKGOhucgwknV8q5qrjScN7DNLsvQLniU+n5IEfldEnZuJ4Xr
X-Google-Smtp-Source: AGHT+IFGSZzECIzd4xFIfdlc38K0Cf0n26OwSjiHv+4oEt7ysXyvnNIq/1GYBi7pelSqe/eAsII4KQ==
X-Received: by 2002:a17:90b:3943:b0:2ef:ad48:7175 with SMTP id 98e67ed59e1d1-301d43c9272mr29014013a91.15.1742832664244;
        Mon, 24 Mar 2025 09:11:04 -0700 (PDT)
Received: from localhost (maglev-oncall.nvidia.com. [216.228.125.128])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301bf576c7dsm12373991a91.3.2025.03.24.09.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 09:11:03 -0700 (PDT)
Date: Mon, 24 Mar 2025 12:11:01 -0400
From: Yury Norov <yury.norov@gmail.com>
To: mailhol.vincent@wanadoo.fr
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	Andi Shyti <andi.shyti@linux.intel.com>,
	David Laight <David.Laight@aculab.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH 0/3] bits: Split asm and non-asm GENMASK*() and unify
 definitions
Message-ID: <Z-GEFcciqCwxL88W@thinkpad>
References: <20250322-consolidate-genmask-v1-0-54bfd36c5643@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250322-consolidate-genmask-v1-0-54bfd36c5643@wanadoo.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_091105_343658_03ACC2C3 
X-CRM114-Status: GOOD (  28.53  )
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

+ Anshuman Khandual, Catalin Marinas, linux-arm-kernel@lists.infradead.org

This series moves GENMASK_U128 out of uapi. ARM is the only proposed
user. Add ARM people for visibility.

Thanks,
Yury

On Sat, Mar 22, 2025 at 07:39:35PM +0900, Vincent Mailhol via B4 Relay wrote:
> This is a subset of below series:
> 
>   bits: Fixed-type GENMASK_U*() and BIT_U*()
>   Link: https://lore.kernel.org/r/20250308-fixed-type-genmasks-v6-0-f59315e73c29@wanadoo.fr
> 
> Yury suggested to split the above series in two steps:
> 
>   #1 Introduce the new fixed type GENMASK_U*()
>   #2 Consolidate the existing GENMASK*()
> 
> This new series is the resulting step #2 following the split.
> 
> And thus, this series consolidate all the non-asm GENMASK*() so that
> they now all depend on GENMASK_TYPE() which was introduced in step #1.
> 
> To do so, I had to split the definition of the asm and non-asm
> GENMASK(). I think this is controversial. So I initially implemented a
> first draft in which both the asm and non-asm version would rely on
> the same helper macro, i.e. adding this:
> 
>   #define __GENMASK_TYPE(t, w, h, l)		\
>   	(((t)~_ULL(0) << (l)) &			\
>   	 ((t)~_ULL(0) >> (w - 1 - (h))))
> 
> to uapi/bits.h. And then, the different GENMASK()s would look like
> this:
> 
>   #define __GENMASK(h, l) __GENMASK_TYPE(unsigned long, __BITS_PER_LONG, h, l)
> 
> and so on.
> 
> I implemented it, and the final result looked quite ugly. Not only do
> we need to manually provide the width each time, the biggest concern
> is that adding this to the uapi is asking for trouble. Who knows how
> people are going to use this? And once it is in the uapi, there is
> virtually no way back.
> 
> Adding to this, that macro can not even be generalized to u128
> integers, whereas after the split, it can.
> 
> And so, after implementing both, the asm and non-asm split seems way
> more clean and I think this is the best compromise.
> 
> Aside from the split, the asm's GENMASK() and GENMASK_ULL() are left
> untouched. While there are some strong incentives to also simplify
> these as pointed by David Laight in this thread:
> 
>   https://lore.kernel.org/all/20250309102312.4ff08576@pumpkin/
> 
> this series deliberately limit its scope to the non-asm variants.
> 
> Here are the bloat-o-meter stats:
> 
>   $ ./scripts/bloat-o-meter vmlinux_before.o vmlinux_after.o 
>   add/remove: 0/0 grow/shrink: 4/2 up/down: 5/-4 (1)
>   Function                                     old     new   delta
>   intel_psr_invalidate                         666     668      +2
>   mst_stream_compute_config                   1652    1653      +1
>   intel_psr_flush                              977     978      +1
>   intel_dp_compute_link_config                1327    1328      +1
>   cfg80211_inform_bss_data                    5109    5108      -1
>   intel_drrs_activate                          379     376      -3
>   Total: Before=22723481, After=22723482, chg +0.00%
> 
> (done with GCC 12.4.1 on an x86_64 defconfig)
> 
> --
> 2.43.0
> 
> Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
> ---
> Vincent Mailhol (3):
>       bits: split the definition of the asm and non-asm GENMASK*()
>       bits: unify the non-asm GENMASK*()
>       test_bits: add tests for __GENMASK() and __GENMASK_ULL()
> 
>  include/linux/bits.h | 29 ++++++-----------------------
>  lib/test_bits.c      | 19 +++++++++++++++++++
>  2 files changed, 25 insertions(+), 23 deletions(-)
> ---
> base-commit: e3f42c436d7e0cb432935fe3ae275dd8d9b60f71
> change-id: 20250320-consolidate-genmask-6cd02abadf82
> prerequisite-change-id: 20250228-fixed-type-genmasks-8d1a555f34e8:v7
> prerequisite-patch-id: 572c05165229640db7dd8fe4d53e1a33ee5dd586
> prerequisite-patch-id: c16d122a487f83e2866a9a669259db097ef46a70
> prerequisite-patch-id: 35f115c0f1b327f1516cfc38b3076e07713df6cd
> prerequisite-patch-id: 5fe7058f6ea73b37df75d5c39ad69a4da928058d
> prerequisite-patch-id: 82fb628d052ce9f1efac7f3b61eafb2749f95847
> 
> Best regards,
> -- 
> Vincent Mailhol <mailhol.vincent@wanadoo.fr>
> 

