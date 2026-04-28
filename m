Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 911CFFF8867
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 03:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qTEZ1HZ1PdRHfsgQndRbtsh7bY4hkpV65+GmJp+lBmM=; b=I9sCrLgtDo6T68xM3K6z2Kt7Y7
	Tuf69KtuXqq+ua2Fu2nn5AATTYgujqvw5F5eD8lZTDrHwYhaLF/7ugojRV0oWZNGj1ZVbqSW4S/wN
	TEXJCAFgjtQ4z06QmKfaVZ+qeOTKjwpA0HpC8d5kDmZ0mmPnDcObnkuV5Jl+R6OaX7epKi2gVBDhs
	9btlT0/iHJen8+0uZykctVB2CDEVrlANQGadxNgkXTn/m2D5k5i14r49BvNcIF6n1sJCdOEernIno
	Xp1zEKEYkgEx64EwEw4xU3Qsz6nWWJRTMIBuORcyLIOzT74Gpiq95ChUCguCIk4+VdSQ1NEiSPjns
	RPqwY3pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHYwc-00000000Ucw-0O0g;
	Tue, 28 Apr 2026 03:17:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHYwZ-00000000UcR-40un
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 03:17:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E1CEE6012B
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 03:17:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89AC6C2BCB8
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 03:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777346222;
	bh=wyw3V0ckGkRkNnb1F5GXlIGScC5WOYDuhH9iKbweEj8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JA+GnZntI++ywISl//G2he7Sf6z4XhwDvYfIeWytJMGDUtt7AFq+ATNvlKhxKoe8B
	 Q20DQweR0Sr0ZJ/FxFjdTPFak1zI9cbIUbNCLTIxkttzgPPRtx3RJp79PXJwd3vL/c
	 WWnuQdXVIPE+1onllLCsElsUI0Zsr9l4Hoywtd5DQTDQ0txmMSLYbc/56wCuAzTjWm
	 HBza8zLJfWcprz+RsA8HMPPbMgglwSyCzG9lOoCzKxdmtlbcu06d969/CT0MIXg/hm
	 UAK5MEjflfvIQRmB1NG1cGO9gHmoP88eqUJXWY8rex6dcUOfnX48s/mXh6vcbuWptP
	 j3pD/8Efe0d2g==
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-8a15ebb3abbso1897586d6.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 20:17:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ89PMbojiHl9zLYnvUXn8U0gNZfVj77pxOe25bYoHuPtUa+R+C3G0vZKMDSThmLmLVMXIMF/JvFk7p3IRqPAC8i@lists.infradead.org
X-Gm-Message-State: AOJu0Yw02ngJ3QGCItK6aL+62mhF3hMD5KI7AFztbpmnbbFbrb0ydED9
	Ae6quONEAuaAGhsHpsKclD296HE+zO0giVukg4ZZ0iQrGBHSlNDvzh2UidHbnF17vlDWcntEURW
	mJdoOUK48aTe63pnaKd+5NcZoJFG980A=
X-Received: by 2002:a05:6214:4a02:b0:8ac:a6f7:8a70 with SMTP id
 6a1803df08f44-8b3e306a5a9mr25772956d6.22.1777346221843; Mon, 27 Apr 2026
 20:17:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260408025115.27368-1-baohua@kernel.org> <fb022a6f-0faf-4742-8934-8a7ffae806f6@arm.com>
In-Reply-To: <fb022a6f-0faf-4742-8934-8a7ffae806f6@arm.com>
From: Barry Song <baohua@kernel.org>
Date: Tue, 28 Apr 2026 11:16:49 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4zwrsrKt5NiuN-rYCqJiyjNdv=UssLuf8VCu8xZ+5sohA@mail.gmail.com>
X-Gm-Features: AVHnY4KKjM_yWoA3CDFUcrhYL1bvm0dmk8-MpHN_PetdZebPEYEa2kPDHJNVQVA
Message-ID: <CAGsJ_4zwrsrKt5NiuN-rYCqJiyjNdv=UssLuf8VCu8xZ+5sohA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/8] mm/vmalloc: Speed up ioremap, vmalloc and vmap
 with contiguous memory
To: Dev Jain <dev.jain@arm.com>
Cc: linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org, 
	catalin.marinas@arm.com, will@kernel.org, akpm@linux-foundation.org, 
	urezki@gmail.com, linux-kernel@vger.kernel.org, anshuman.khandual@arm.com, 
	ryan.roberts@arm.com, ajd@linux.ibm.com, rppt@kernel.org, david@kernel.org, 
	Xueyuan.chen21@gmail.com, jiangwenxiaomi@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Mon, Apr 27, 2026 at 11:05=E2=80=AFPM Dev Jain <dev.jain@arm.com> wrote:
>
>
>
> On 08/04/26 8:21 am, Barry Song (Xiaomi) wrote:
[...]
> >
> > Barry Song (Xiaomi) (8):
> >   arm64/hugetlb: Extend batching of multiple CONT_PTE in a single PTE
> >     setup
> >   arm64/vmalloc: Allow arch_vmap_pte_range_map_size to batch multiple
> >     CONT_PTE
> >   mm/vmalloc: Extend vmap_small_pages_range_noflush() to support larger
> >     page_shift sizes
> >   mm/vmalloc: Eliminate page table zigzag for huge vmalloc mappings
> >   mm/vmalloc: map contiguous pages in batches for vmap() if possible
> >   mm/vmalloc: align vm_area so vmap() can batch mappings
> >   mm/vmalloc: Coalesce same page_shift mappings in vmap to avoid pgtabl=
e
> >     zigzag
> >   mm/vmalloc: Stop scanning for compound pages after encountering small
> >     pages in vmap
> >
> >  arch/arm64/include/asm/vmalloc.h |   6 +-
> >  arch/arm64/mm/hugetlbpage.c      |  10 ++
> >  mm/vmalloc.c                     | 178 +++++++++++++++++++++++++------
> >  3 files changed, 161 insertions(+), 33 deletions(-)
> >
>
> Hi Barry, have you got the chance to work on v2?

Hi Dev, thanks for the ping.

Yes, I=E2=80=99m getting Wen Jiang (cc=E2=80=99d) to send v2 within the nex=
t few days.
The patchset is basically ready, but still under testing.

