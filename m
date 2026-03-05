Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D95EAF3095A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 13:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Vo6LolXreM1BYx+KUx8ovfJxU2nYq3Q7Wemen42flk=; b=YNN1wgzE8yoF3phwO+B3TvDgUW
	cIHX0M1BsmIzdQ8d2qB9QcHwP9n1yRhqyIwwSOE9V64QxViaf+w+OfPVsyoDWU9uUwBmfvTO1NczJ
	8ZrTXd++LRdjPzZDeIdubLBc/Boqp0OImbDyv56vRXrSetyZuvg6FSWxpijDEe82H/HeJfPpMuNAr
	8JYzpCFkoIMCaXSflD6SPFkkt91hyFtJijrr1UniRRVB8YBOnep1Jlx1H3YSNlVl1NIkuMC1N1KCv
	WKq+q/9DzOPPclUuM4QJUDU3+CJjfXoE4SWbCKLatm6tGYL38cq5T42VFCVGWsJ2N4sLb0FqUclx7
	GBLXIM1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy8WT-00000001rlh-48Hm;
	Thu, 05 Mar 2026 13:13:49 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy8WR-00000001rlE-2ngw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 13:13:48 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5a11da904cbso842687e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 05:13:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772716425; x=1773321225; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7Vo6LolXreM1BYx+KUx8ovfJxU2nYq3Q7Wemen42flk=;
        b=4UHVdMtPWcWoZVwGsl0Q1KuGWzB9XRz2l6ZUB2wniDYtXcXPtYkynLB+2q/Xv9TY1I
         xRIvnlUNoc42IoDZecIQac32qDEjeHL+g+9jo0f6XP5jh1uOvzTEstkO/oxdyba4AkPW
         4fyZ0yGnGRv4KJeO3IfbJmWOrG42V1rgV2BBbU3m9OYl4jqWIM8RHVoiLtMW2B+sL/DW
         80wXBFRQQ8RiLqmbYtbFfb/Q2YgQ7CZR3qasFifDVhMKPHj4O8hlHypaEbQZmifzEkSu
         QXHkd6y9/VGlA5qr6LUUx/8vXbvi5CVN5tLDUJvz/KNixaTN2kxKGalmqmFjJC9Wsvoc
         yvrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772716425; x=1773321225;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Vo6LolXreM1BYx+KUx8ovfJxU2nYq3Q7Wemen42flk=;
        b=vkA9rC7AxugbqS8JvxttzT0e53UI1Grous94K0mJpxdnxG5zcp0HmYDrXKOmkGChj8
         Byl/ISOUunfHxjs3iArnmqadvqiqZ7YLutUwEPiywGqrVGGp7bhao3j7HIudtWkCIvvz
         G7CyDAfh/3od+KM8J7osK6qWhnQW1zDfjw5AEnsfT+o1hum/63xr4nkDRpDUFJfRM2jh
         jcvwTQeMZj3govniuQcBZPQQe3jt+1YUSLEXDcQFb5Atj9Jyg2KaBrnzZ8GXU120AT1L
         IRpqRdp/DD9weT8arHwZlyFB69xSLCU8tHIkNv+NYeFu9zYKqAZGlBA5ZU17tNzi40/x
         Gung==
X-Forwarded-Encrypted: i=1; AJvYcCWln/5LmIrWvxFwvWpXNSqYcjUvrqDDXQYaSfBiE5qq4Ar1qMBwttnn5ORTSWxAmcD6gcH9WyjolpNNyDZD5YbP@lists.infradead.org
X-Gm-Message-State: AOJu0YyP1RKyo5yOYkkYgrDVZtxKozB5sAeO56K5lpQTOvqysvTLOK0+
	3y0TTcgmQ6UbhIUxOtXkbGZaiaMg8r3iXIn5VKlmuGvV/KkD1i5yMpnjwdGydGdCZQ==
X-Gm-Gg: ATEYQzw9WDPWNbfVhSSzTSDM0tubcT/ssDDOWeOJ69uWrdBgENoyTydz/xRIF5q265t
	o5DILX0Xv6L4OuIVxlwX42Y5/6kcBkKzqHGscL7MrZAkA1z497OZjvVsiVgrzDYsFyZO6mZeKJx
	fsbzQLTrwUfAwUyxbRYjC6v7T0cRiEOFDvL48Fd9Sx4ihkIlM0tXRyFRgaRvR2wJIyoIjCRhdmZ
	JYlBdFL6T7WU8sX0+3nqOGHt9d45oPyahxYoA0EYYh9xIsd5VfiZ/coNYJvD9BLictPXbWLQZLk
	iKJIn0khDALF7NetRWtoqKpMblXqiSIKLqQ4/+cbpElHRnYmMVz0aKVkYl0rKPjlAJTdMJgjo8T
	/cp6yZjEEen4TiyvO4gs57GfE7vz37AWAHgLNnWBxR1hdkfGM7uiep5JvYVDSI6bruQwsKIdFs0
	XdlD3uPjUqlPBI1EnB0B3Y6Brj+MsZLea/vcvR8XJdh0UZF/sRtECl4xIVZJryvMG5sw==
X-Received: by 2002:a05:6512:3b14:b0:5a1:1daf:f7b2 with SMTP id 2adb3069b0e04-5a12c2990e7mr994159e87.0.1772716424198;
        Thu, 05 Mar 2026 05:13:44 -0800 (PST)
Received: from google.com (27.69.88.34.bc.googleusercontent.com. [34.88.69.27])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a1308fb9eesm519960e87.66.2026.03.05.05.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 05:13:43 -0800 (PST)
Date: Thu, 5 Mar 2026 13:13:40 +0000
From: Quentin Perret <qperret@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Leo Yan <leo.yan@arm.com>
Subject: Re: [PATCH] KVM: arm64: Adjust range correctly during host stage-2
 faults
Message-ID: <fdqyxxlu2n4hngowq2ksllhwew33swrsj6mqpeyzb7vaofzuzf@ks7z6dnatyoo>
References: <20250625105548.984572-1-qperret@google.com>
 <86wlzr77cn.wl-maz@kernel.org>
 <86seae7dg1.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86seae7dg1.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_051347_777037_42CF47E7 
X-CRM114-Status: GOOD (  33.04  )
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

On Thursday 05 Mar 2026 at 10:55:42 (+0000), Marc Zyngier wrote:
> On Wed, 04 Mar 2026 18:55:04 +0000,
> Marc Zyngier <maz@kernel.org> wrote:
> > 
> > On Wed, 25 Jun 2025 11:55:48 +0100,
> > Quentin Perret <qperret@google.com> wrote:
> > > 
> > > host_stage2_adjust_range() tries to find the largest block mapping that
> > > fits within a memory or mmio region (represented by a kvm_mem_range in
> > > this function) during host stage-2 faults under pKVM. To do so, it walks
> > > the host stage-2 page-table, finds the faulting PTE and its level, and
> > > then progressively increments the level until it finds a granule of the
> > > appropriate size. However, the condition in the loop implementing the
> > > above is broken as it checks kvm_level_supports_block_mapping() for the
> > > next level instead of the current, so pKVM may attempt to map a region
> > > larger than can be covered with a single block.
> > > 
> > > This is not a security problem and is quite rare in practice (the
> > > kvm_mem_range check usually forces host_stage2_adjust_range() to choose a
> > > smaller granule), but this is clearly not the expected behaviour.
> > > 
> > > Refactor the loop to fix the bug and improve readability.
> > > 
> > > Fixes: c4f0935e4d95 ("KVM: arm64: Optimize host memory aborts")
> > > Signed-off-by: Quentin Perret <qperret@google.com>
> > 
> > This patch prevents my O6 board from booting in protected mode as of
> > e728e705802fe. Reverting it on top of 7.0-rc2 make the box work again.
> > 
> > I haven't quite worked out why though. The hack below makes it work,
> > but implies that we can get ranges that are smaller than a page.  That
> > feels unlikely, but I'm not sure we can rule it out (the kernel page
> > size could be pretty large anyway).
> 
> Having spent a bit of time on this, I'm pretty sure this is the cause
> of the issue. The memblock tables are as such:
> 
> maz@cosmic-debris:~/vminstall$ sudo cat /sys/kernel/debug/memblock/memory
>    0: 0x0000000080000000..0x00000000843fffff    0 NOMAP
>    1: 0x0000000084400000..0x00000000845fffff    0 NONE
>    2: 0x0000000085000000..0x000000009fffffff    0 NONE
>    3: 0x00000000a0000000..0x00000000a7ffffff    0 NOMAP
>    4: 0x00000000a8000000..0x00000000fffbffff    0 NONE
>    5: 0x00000000fffc0000..0x00000000fffeffff    0 NOMAP
>    6: 0x00000000ffff0000..0x00000000ffffdfff    0 NONE
>    7: 0x00000000ffffe000..0x00000000ffffffff    0 NOMAP
>    8: 0x0000000100000000..0x00000007fe4effff    0 NONE
>    9: 0x00000007fe4f0000..0x00000007fedeffff    0 NOMAP
>   10: 0x00000007fedf0000..0x00000007ffffffff    0 NONE
>   11: 0x0000008000000000..0x000000807a290fff    0 NONE
>   12: 0x000000807a291000..0x000000807a2927b2    0 NOMAP
>   13: 0x000000807a2927b3..0x000000807fffffff    0 NONE

Ouch, these last few are 'interesting', oh well :-)

> Any access to page 0x000000807a292000 is going to blow up in your
> face, because there is no way you can map this and still respect the
> memblock boundary. Same thing for any region that is smaller than
> PAGE_SIZE, or not aligned on PAGE_SIZE. Which is even more annoying.
> 
> I'm starting to think that my hack is not that idiotic in the end...

Yes, I can't think of anything better TBH. We've already asserted that
we don't have an annotated PTE here, and at the last level we're
guaranteed not to accidentally map a neighbouring private region, so yes
we should just proceed with a page-aligned mapping there.

Want me to post a proper patch or do you already have one in stock?

Thanks!
Quentin

