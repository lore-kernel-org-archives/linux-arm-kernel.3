Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C2A310FC443
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 21:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hQX7iZU1sLRdwZhoYb3R3nLptKkjtedR7BZxMeedyD4=; b=RCX0Vhq5YOvYX1mGoAqOGe95Wk
	ZlVsCL3ksUnWNe8RMWcrQnNGhS3QqrkFeJzgowsSFFKkIcWUxyKHmquSBJpdyUtzWchdir4zzDHiN
	MYfNpCMN0PSKMzN9kup79vytXbGGOblheWDucVrbtz012DZAuQCBhVgUpb30y2OWyN3kCCz4G627h
	G3HejSeotY+qSLMHY+eiNXXYydkJVlzjR7rQGsr9Ry/sJaH6OWAEObhmyLJwMvmpc1IfB9Ye2szsH
	llFoWGUqeSJubJcWDY2CGN+33wwpucKRsulct/cebK8WyjhDY0h2zg4d0xFDRMlzl9tGPxu9QeWa4
	BA6vxPOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAaSz-00000009R7N-3BXv;
	Wed, 08 Apr 2026 21:29:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAaSx-00000009R6q-0VuW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 21:29:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8079D444F9
	for <linux-arm-kernel@lists.infradead.org>; Wed,  8 Apr 2026 21:29:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67205C2BCB5
	for <linux-arm-kernel@lists.infradead.org>; Wed,  8 Apr 2026 21:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775683777;
	bh=Y/lmxQXbhWG5INKynpR7jdhH5uj4BdkuJqvEO5FdF8Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mShnAkf/k0d/LPFZwfdKiBYhDDRse6tKDagf1kPr0oc2h9w/psRVyY/VbUi3fNrb/
	 UwejrwtODpxGK4z79tPZavt95SOnbd9sQLRlk39P65hH7VVNgNbtEk/e5DbB/+7/bP
	 5B1vSYWraZaEkPnl8p2FqY/yFJPFQwjm9t9YWKptwjSJFVpG65JiB+ZDSD1GSyxYHm
	 xfrrdmbqoXEBePOAjVHkqhnlYkckawhDLioIf+F6YK0jJTGJ2OKAppfEQDJOnhw7xM
	 N678+2fkcGmpwmOX8M7g5QP1A2k0MROxHaQA2BcOtjrzzDO/BD8NZq4JkLEC3Lb2Fq
	 4WwEwNJCm7Zrw==
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-8a00566c11bso3138906d6.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Apr 2026 14:29:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXdNXytiwcVHfwmrJaB9rjKVHN8tlpuz7wjm+fiSg2tf4Iz7/skpjCoM27Q6C6zmaITAc/H1Xg+EwScv5IC1W6v@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3NsLzH42qGNWet82FJEeTuXRu2nvAF8AlQ1RbX8VX5xk3q+Ul
	6Gvg80ymArkHTR7FOG4zRRienz6X9p9lbFE4N0ojlAUr6yOvOUYPfqgb12WghJZUxYUvG+iGEaR
	gaiT99Wokol+hZ7LOaEg40u8IOnLP1LA=
X-Received: by 2002:a05:6214:1d0a:b0:8ac:74d7:dd14 with SMTP id
 6a1803df08f44-8ac74d7debcmr15884866d6.34.1775683776598; Wed, 08 Apr 2026
 14:29:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260408025115.27368-1-baohua@kernel.org> <20260408025115.27368-4-baohua@kernel.org>
 <f661064f-269c-4e1d-8d6c-a9a2e50cd82c@arm.com>
In-Reply-To: <f661064f-269c-4e1d-8d6c-a9a2e50cd82c@arm.com>
From: Barry Song <baohua@kernel.org>
Date: Thu, 9 Apr 2026 05:29:25 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4x-7tk6FPM5eN+o2=1ewbbCvrGYSG-qk1FybnhYAqU0xg@mail.gmail.com>
X-Gm-Features: AQROBzDD8xzlg0Uj1HRs0Wqi-s5iSaX2fFmsZNIkL6fa0v5sA5A7gsWqrrxGDtU
Message-ID: <CAGsJ_4x-7tk6FPM5eN+o2=1ewbbCvrGYSG-qk1FybnhYAqU0xg@mail.gmail.com>
Subject: Re: [RFC PATCH 3/8] mm/vmalloc: Extend vmap_small_pages_range_noflush()
 to support larger page_shift sizes
To: Dev Jain <dev.jain@arm.com>
Cc: linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org, 
	catalin.marinas@arm.com, will@kernel.org, akpm@linux-foundation.org, 
	urezki@gmail.com, linux-kernel@vger.kernel.org, anshuman.khandual@arm.com, 
	ryan.roberts@arm.com, ajd@linux.ibm.com, rppt@kernel.org, david@kernel.org, 
	Xueyuan.chen21@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_142939_222869_DFFFBC04 
X-CRM114-Status: GOOD (  16.34  )
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

On Wed, Apr 8, 2026 at 7:08=E2=80=AFPM Dev Jain <dev.jain@arm.com> wrote:
>
>
>
> On 08/04/26 8:21 am, Barry Song (Xiaomi) wrote:
> > vmap_small_pages_range_noflush() provides a clean interface by taking
> > struct page **pages and mapping them via direct PTE iteration. This
> > avoids the page table zigzag seen when using
>
> "Zigzag" is ambiguous. Just say "page table rewalk". Also please
> elaborate on why the rewalk is happening currently.

Sure=E2=80=94I=E2=80=99m not a native speaker, but =E2=80=9Czigzag=E2=80=9D=
 feels like
=E2=80=9Crepeatedly walking the page tables back and forth=E2=80=9D to me.
That=E2=80=99s exactly what I want to express.

>
> > vmap_range_noflush() for page_shift values other than PAGE_SHIFT.
> >
> > Extend it to support larger page_shift values, and add PMD- and
> > contiguous-PTE mappings as well.
>
> So we can drop the "small" here since now it supports larger chunks
> as well.

I=E2=80=99m still struggling with the name, since we already have a
function without =E2=80=9Csmall=E2=80=9D here:

int vmap_pages_range_noflush(unsigned long addr, unsigned long end,
                pgprot_t prot, struct page **pages, unsigned int page_shift=
,
                gfp_t gfp_mask)

>
> Also at this point the code you add is a no-op since you pass PAGE_SHIFT.
> Let us just squash patch 4 into this. This patch looks weird retaining
> the pagetable-rewalk algorithm when it literally adds functionality
> to avoid that.

Sure. will do.

Thanks
Barry

