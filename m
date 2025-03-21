Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B333C36000
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 17:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qFJmlO/iB6/7i2e30laD/4rk/wX+i4QVOj1nk+xkAog=; b=Ft0A3fFoHFwTXsOx+W6HV8vuYD
	KqhaR4+K5M5JrQDDvF/mcqLP5SMo4Z+ZoX1eKccSFaPeLfwkYeWmZrHHlt0xyUpXlWXrv0ppLGEcv
	ZdtcZ7rtnpvz05RTbDRzCL8ylXHRGLY1Bq94aEtHswTpceU0C9ucc+Cu/rIKD2HqYmo8roElXXUYD
	fOdyT5BPOYsBZGrdDvPrG/J6l8NdRiHzW3BLzOp09IJdk7q1cyX26Yi472nmet1ZU1imUT3fG+0Of
	2w1SG0W4H62C6sZ8D3do/UsSYYXOlIkA4DpBFOHYU5IhGWxeoZLLBN2FrjSY7B4vkws+i0KPXzaIb
	z5gEKikw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvfql-0000000Fdgo-21W8;
	Fri, 21 Mar 2025 17:08:03 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvfoB-0000000FdD0-1vem
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 17:05:24 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2235189adaeso44020985ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Mar 2025 10:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742576722; x=1743181522; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qFJmlO/iB6/7i2e30laD/4rk/wX+i4QVOj1nk+xkAog=;
        b=ZYrKx5JH7tldYOtMxC2oHYu90JB4BpoJpDSGCNcIhDeTpwxIjIJDgaTjb9GTKaBS7o
         aeCBovuZeMMdV73lXstOfQsOIIT10nCkr+j/vzjHX2CmbVpMRvaKdjsrTM3sndFhjTrl
         gfUczJm/KXyTyJWIlh4vKU4BKu4TBytVp2Sby1ipaLEOvs0NbYwzVcaThVwz8/axvVKl
         D5nQssx431+RHeE9RJrOi7dg6awcnprndNjiC/j+cxe59KDPHJaAae72qdih9m7dvoI+
         X2anNJtwAg5XCnpgcMg4ujFYJkC9oiADRi7sHl2LLxdb0iLcQm1hUvXrFU7BytqkE4/i
         fl6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742576722; x=1743181522;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qFJmlO/iB6/7i2e30laD/4rk/wX+i4QVOj1nk+xkAog=;
        b=YQB5CI0hPtahD8TglbkqBRszmbwswrqHWNXzFVia6oxe7PyO+I526KE8HfdxnT1VOY
         jTR622wW+Ycc0Wnkc9KS2KeQgTb5VbqW4ELwGwPArLL0Nd9dC7sOIwV2bKFBQckEiGXV
         BZP16lRL3ozireUeYgQRtEqecCOH5XJLYtijBINt0t3UCQLLlj9SmqPmxHucflLMuHYV
         I/SH1DZ6n47gEVdhU4g88N94L5KqJivXpy4UNylNnvX+b8960vmy+e8jXeGFa0q07lPe
         cpvP5oZxpkzrPjN4q0zDt+U+Luj+3OvhA/qgB6zxk1e0/aY1B91PcOeveSBjHJprokEq
         Ld6w==
X-Gm-Message-State: AOJu0YwTZbMRVobemlIRezs0bFsNkRsTdtVfCE3o/kE2isjKMd8AyPVb
	YbU55ujubXijaI69DGlsWoGyLckgZDHIfuzWT8VwrRk3uOrdayJPIkhabw==
X-Gm-Gg: ASbGncuEOhgsyYlm4eYkeu1Udu0jasUMRiaTfK6VTYYezxmZJqW+/SCFy3L0ArL3cT8
	QMpcNZgO/HokQOeuX4dTSZzDb+yphnu4X6xCM/DHYWXyZ9MJmmDmcKVvEmxjoEPYD5juMX8AaXp
	tGIaKWq5ZghEZBXXI/rbK8n3F5Ex6kQBLhvgK99DtGQElVAaSIDc/n1HpmtKIXNTcL5XWelOYci
	PY8pE5vgPGnGa5yGAlqVFtp/YeqfoHAi4J6ipAJJIO9DYMr69qKt8UUIEI5tFBMVxhpE32aPDvv
	okxn0v9M2CUNakf2pZXCfhOGK9dKaVQWrSf5T3VitgB2
X-Google-Smtp-Source: AGHT+IH7UrSBOupRRVjrb3wtNzf50EusSmn8NacmvaKZuKRlw8NkIWXeCKo1ec3bmF+7vhQTLnjYjQ==
X-Received: by 2002:a17:902:f684:b0:215:58be:3349 with SMTP id d9443c01a7336-227806d072amr73177805ad.14.1742576721585;
        Fri, 21 Mar 2025 10:05:21 -0700 (PDT)
Received: from localhost ([216.228.125.130])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22780f3bbedsm19697085ad.3.2025.03.21.10.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 10:05:20 -0700 (PDT)
Date: Fri, 21 Mar 2025 13:05:18 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
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
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v4 3/8] bits: introduce fixed-type genmasks
Message-ID: <Z92cThxAyXu9JJdk@thinkpad>
References: <20250305-fixed-type-genmasks-v4-0-1873dcdf6723@wanadoo.fr>
 <20250305-fixed-type-genmasks-v4-3-1873dcdf6723@wanadoo.fr>
 <Z8hsRJvpjYoqh9RG@thinkpad>
 <Z9oiEkQEcHhA0a80@thinkpad>
 <5cbaefa8-e51f-415f-a9b3-4841e69bb3fa@arm.com>
 <1aba17f1-0cd2-429c-8338-28387ec16314@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1aba17f1-0cd2-429c-8338-28387ec16314@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_100523_516654_966AF45A 
X-CRM114-Status: GOOD (  38.41  )
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

On Wed, Mar 19, 2025 at 09:43:06AM +0530, Anshuman Khandual wrote:
> 
> 
> On 3/19/25 09:04, Anshuman Khandual wrote:
> > On 3/19/25 07:16, Yury Norov wrote:
> >> + Catalin Marinas, ARM maillist
> >>
> >> Hi Catalin and everyone,
> > 
> > Hello Yury,
> > 
> >>
> >> Anshuman Khandual asked me to merge GENMASK_U128() saying it's
> >> important for ARM to stabilize API. While it's a dead code, I
> >> accepted his patch as he promised to add users shortly.
> >>
> >> Now it's more than half a year since that. There's no users,
> >> and no feedback from Anshuman.
> > 
> > My apologies to have missed your email earlier. Please find response
> > for the earlier email below as well.
> > 
> >>
> >> Can you please tell if you still need the macro? I don't want to
> >> undercut your development, but if you don't need 128-bit genmasks
> >> there's no reason to have a dead code in the uapi.
> > 
> > The code base specifically using GENMASK_U128() has not been posted
> > upstream (probably in next couple of months or so) till now, except
> > the following patch which has been not been merged and still under
> > review and development.
> > 
> > https://lore.kernel.org/lkml/20240801054436.612024-1-anshuman.khandual@arm.com/
> > 
> >>
> >> Thanks,
> >> Yury
> >>
> >> On Wed, Mar 05, 2025 at 10:22:47AM -0500, Yury Norov wrote:
> >>> + Anshuman Khandual <anshuman.khandual@arm.com>
> >>>
> >>> Anshuman,
> >>>
> >>> I merged your GENMASK_U128() because you said it's important for your
> >>> projects, and that it will get used in the kernel soon.
> >>>
> >>> Now it's in the kernel for more than 6 month, but no users were added.
> >>> Can you clarify if you still need it, and if so why it's not used?
> > 
> > We would need it but although the code using GENMASK_U128() has not been
> > posted upstream.
> > 
> >>>
> >>> As you see, people add another fixed-types GENMASK() macros, and their
> >>> implementation differ from GENMASK_U128().
> > 
> > I will take a look. Is GENMASK_U128() being problematic for the this new
> > scheme ?
> > 
> >>>
> >>> My second concern is that __GENMASK_U128() is declared in uapi, while
> >>> the general understanding for other fixed-type genmasks is that they
> >>> are not exported to users. Do you need this macro to be exported to
> >>> userspace? Can you show how and where it is used there?
> > 
> > No, not atleast right now.

Ok, thanks.

> > These were moved into uapi subsequently via the following commit.
> > 
> > 21a3a3d015aee ("tools headers: Synchronize {uapi/}linux/bits.h with the kernel sources")
> > 
> > But in general GENMASK_U128() is needed for generating 128 bit page table
> > entries, related flags and masks whether in kernel or in user space for
> > writing kernel test cases etc.
> 
> In the commit 947697c6f0f7 ("uapi: Define GENMASK_U128"), GENMASK_U128() gets defined
> using __GENMASK_U128() which in turn calls __BIT128() - both of which are defined in
> UAPI headers inside (include/uapi/linux/). 
> 
> Just wondering - are you suggesting to move these helpers from include/uapi/linux/ to
> include/linux/bits.h instead ?

Vincent is working on fixed-width GENMASK_Uxx() based on GENMASK_TYPE().

https://lore.kernel.org/lkml/20250308-fixed-type-genmasks-v6-0-f59315e73c29@wanadoo.fr/T/

The series adds a general GENMASK_TYPE() in the linux/bits.h. I'd like
all fixed-widh genmasks to be based on it. The implementation doesn't
allow to move GENMASK_TYPE() the to uapi easily.

There was a discussion regarding that, and for now the general understanding
is that userspace doesn't need GENMASK_Uxx().

Are your proposed tests based on the in-kernel tools/ ? If so, linux/bits.h
will be available for you.

Vincent,

Can you please experiment with moving GENMASK_U128() to linux/bits.h
and switching it to GENMASK_TYPE()-based implementation?

If it works, we can do it after merging of GENMASK_TYPE() and
ancestors.

Thanks,
Yury

