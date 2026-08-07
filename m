Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21AF9C2A09B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 15:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Az5wp+kAsSbtOjG5rv8pQmucG2yE4e6DGCCgwM57rEM=; b=lBaaj68k4sKutiHkWKpxl5Ee8o
	+zO3M+2nGe5StcurMrRFWEHvjgaBjNytI/5SQfvj3/WSRfuvik7PlebxzlnKlp+fI39+qdgUs209Z
	2zQEo4x/AW/y0XD6I4yrG0TzuSanXoBD5UuQp5mvE5Beo3kAVZR85HECIXOdUaPNoU/tqPHtCblwY
	Brl4aH/gJFt1qswsWPx1KtW0tdsA8YUDx7v2WRwMTS4d1ht6MHQMqNViqlvwFwvVkGsUbNRyzXLR4
	dU/fZejRrl06D0/RLVnwh2jUayy5bwrW5X70BTVGiJDrBIi4rBTSCfhUMsT9evxFUCAy/ahK7mQEI
	jAk99ZSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsMb7-00000008LdP-2nUB;
	Fri, 07 Aug 2026 15:35:01 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsMb5-00000008LcI-0Xiv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 15:35:00 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-69fec8b4638so13950a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 08:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786116897; x=1786721697; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Az5wp+kAsSbtOjG5rv8pQmucG2yE4e6DGCCgwM57rEM=;
        b=TdOJkVeGooatMLj7z//jd1iEi+kX1xBKJou13KOBgCOlsR8RrXbWMAStcPJZsq81ih
         aZg+Yfl4FyspcpUcag0P1bM9rGGlOBMob2hvTxwhPt65UxtFb412/lOO12Qex6sOInPn
         3XTpXberjnTxkXdr+8W95hj7F9dwvC3hCgVDjOb4QbSv2f/JTOHqkzJSZnz2sZ72+ums
         HM9+Q/evU+ntrBpmzj5hM7Fz+YJuz7LWMovOUKMw6AWAf3vgja3G+dbm13UVzU/QoRZT
         5TA6mzpfVf0YnyN2xfLQUNBGNI/AN5HT4yewg2Pje51LH0jHyieIrIuh6wGz1B3YpQqr
         AxbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786116897; x=1786721697;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Az5wp+kAsSbtOjG5rv8pQmucG2yE4e6DGCCgwM57rEM=;
        b=ox+RG89QbALj9WfXsVopB4LC/m9rpzEtMehvhLK2SjeoFQvW2/ODyGrTqz1uiqRfds
         SS73ABDZqjlvYtod8ZEvhn+8uZYxN11sSJT5zB00Gv0wgSYNpAL4YrjKLk8JzkJApbSj
         CVafE9RrgWsXVT0nCeNWcNBAB4V9z/M88z0V1xAt1nCYsENzifbzfJnYzGKBu9l+w3Po
         Rd5o19yaeIIdMlvLLSjaEl3KQcLojIcOgOYI55h8KXQlXcG1m6EX0hSuOIERQByu6Syi
         JnyZUq2TqMcehg9vcbEIrgqtT/7VC+Wdwd48iuTWJ+drBAIdrllFjza1tPJcWxGjpqyS
         LFOw==
X-Forwarded-Encrypted: i=1; AHgh+RpTYSmxdbTyCZGZ4OxK3KKp+DHpabw6RcCJ4svL5z6tPM81YPSVysH8HfD4fZXj1mk58ziBbk0vVJVwmpsDOxBA@lists.infradead.org
X-Gm-Message-State: AOJu0YwZ2K8mTw6vVS6EwNwcyYjf0rJzWCvN3+GWlJfiVoB0L+DWTYYJ
	ttnd0Nq/V6gz9bCl6IefpQG15KGTaImJ3j9uGk0JXXAyJqx/dEOwleubi2rRIXnrcw==
X-Gm-Gg: AR+sD10uuqv8Jj2Ei1kgXxov9pLfDXoLfcB244sD4ZlXdOil2V5MaZJglFX6fS/d7GJ
	nxlj9EgGqAO/YgdgnyhwvGyWm4BNxXKlIE1cbkxrJ1HJAYgJ3OnW33BAQ1USdk2+uE5FajZJYek
	8T5WMrIaFnjLhpMXvB53RYjBf0YJNtCyEOcJVeKaKfYOmtP0LxY5J2KJVMyDclCyqeTaFoi4KQD
	W0N6Lj9/yXx+iTkYsDSdttjOEljCIfChQe14t0QcXLl9UdkO2hn+t2zjBmgmPwSUnCxJc4uvMe4
	tHFZqUHHoRqUxpeIEZE4OWOilSf/B4Z/HwgZUpB+Za0+ACdY1PrVFwQBHXfYqaVcjdrN7KNYq/p
	q7Q7wZ5eBPeay+XKdu4A4YAVeqq9J7EhHKNwagtuNqs8wfy9iP0HPuVw8r9oav26KocC3QIv8nK
	0CJx/vMFhudfB8OR/elsM33X15c5A0vt+TZ4PsRUXUonkUsZO1AU4EW08vtsrodWiQLbg6nJXD8
	iNZALYkU64GJqat957shGnIlX55fQ==
X-Received: by 2002:a05:6402:65a:b0:6a1:f088:9486 with SMTP id 4fb4d7f45d1cf-6a1f088972amr16113a12.4.1786116896722;
        Fri, 07 Aug 2026 08:34:56 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a1e7d48f8dsm708475a12.17.2026.08.07.08.34.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 08:34:55 -0700 (PDT)
Date: Fri, 7 Aug 2026 15:34:47 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Will Deacon <will@kernel.org>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev, Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Marc Zyngier <maz@kernel.org>, Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Pirko <jiri@resnulli.us>, Petr Tesarik <ptesarik@suse.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Xu Yilun <yilun.xu@linux.intel.com>, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, x86@kernel.org
Subject: Re: [PATCH] arm64: swiotlb: Keep the default size for protected
 guests
Message-ID: <anX7F7dnKOtAOIIe@google.com>
References: <20260717180442.110954-18-aneesh.kumar@kernel.org>
 <20260807092612.2202005-1-aneesh.kumar@kernel.org>
 <anXIZSh9lq99VG9X@willie-the-truck>
 <yq5acxvu2ict.fsf@kernel.org>
 <anXbJ2O4DWgPxCeg@willie-the-truck>
 <20260807135810.GA200537@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260807135810.GA200537@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_083459_187753_1BC0643C 
X-CRM114-Status: GOOD (  25.05  )
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

On Fri, Aug 07, 2026 at 10:58:10AM -0300, Jason Gunthorpe wrote:
> On Fri, Aug 07, 2026 at 02:18:31PM +0100, Will Deacon wrote:
> 
> > > I was under the impression that there is a possibility of using swiotlb
> > > instead of restricted-dma-pool with pKVM.
> > 
> > Yes, that patch enables swiotlb as a possibility for protected guests
> > but with your patch we avoid shrinking the swiotlb buffer even when
> > restricted dma pools are being used and that's a waste of memory.
> 
> I also thought we switched pkvm to use CC-like swiotlb as part of the
> alignment in this rework? Mostafa ?

Yes, now protected VMs can use the SWIOTLB for bouncing. However for
Android (and kvmtool), use restricted DMA. so SWIOTLB is not used.

However, I do not think we should over engineer this in the code,
swiotlb can be set from the cmdline and now through Kconfig also.

Thanks,
Mostafa

> 
> > > If that is not the case, then we could change:
> > > 
> > > !cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT) &&
> > > 
> > > to
> > > 
> > > !is_realm_world() &&
> > 
> > Perhaps, or you could just pass the swiotlb= option if the defaults don't
> > work for you. Can you give more details about the slots exhaustion you're
> > seeing under CCA?
> 
> We see badness with swiotlb too, it basically doesn't work out of the
> box if you have to use it 100% for real devices. It easily runs out
> of memory.
> 
> Auto tuning to higher levels makes sense to me, but I'd rather the
> core code handled adjusting its size to the estimated need, not arch
> code.
> 
> Jason

