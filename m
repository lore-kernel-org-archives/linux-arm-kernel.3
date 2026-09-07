Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A83D3C79F89
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 06:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KWBg4m2wDtJRgYbxKBLwGfw2dBRi+ov6pvH3X93gXJg=; b=I0MDmCrTyxNRHN4fCOau+RxIs4
	nHSRLmV7fCzFovlzCxNrQHOOZqok24SOFFBwl1gCDCtGWQYS8cDN7r3Jg7UD01RTt+v8rIFVsFabI
	NVSwNihwgGab0+62UQ1jxiQZvrN0waRsO+v4iEn4LyQKBio74iOb8fX56cevBn2MT60blVZ+Vt2x4
	Xj+EXr9xLsX6A0IByKlHsM+vZJIAFKh/FnLghl5Lqr+pDCJK5IlQrjtOzuE28iELTujCNSfE7+Gwu
	NA/lwe+UzTxUXbfODCE8xlZYJWxCZQVWiq/OPoO5mgBr3UueQE2XNWeR9cgtFvP5sAt+Wv9m79h1z
	lZ+CJhUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3SSA-00000005z7H-310V;
	Mon, 07 Sep 2026 06:03:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3SS8-00000005z6y-3Ss4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 06:03:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 63C6043BBB;
	Mon,  7 Sep 2026 06:03:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8080E1F00A3A;
	Mon,  7 Sep 2026 06:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788761015;
	bh=KWBg4m2wDtJRgYbxKBLwGfw2dBRi+ov6pvH3X93gXJg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QIPJIqcnFHP0Lub1MpXj6uRKUv0FSKOwY+sKSOczIkurDFVg8DJ/zw7OLg5EB1ma2
	 4f0nD1HaGoa20C0MK76SEYuvFrXMDliytjO0IYEiTMoFIOq+M5I138pybc42UHA94d
	 FOCqIBC6kJ76AIN2jWAkgAIjdaufr79vdXXUWUzVc+bl6XxXw5qNChplpmxaw0oQIt
	 64JewSBIMk61QWyocXlPGeqiA5+54lMnNUrXjwqq2CMadvw+trfiqKrzs+JZxbVx1D
	 czt5lT+NJ/uSVNKO9dDRZFe50OVsDUXIcboFdDYOzOx2mjo5h5nLUzUCYAY0hL7gnx
	 asXnfjRtMbFSw==
Date: Mon, 7 Sep 2026 09:03:22 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Xueyuan Chen <xueyuan.chen21@gmail.com>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
	usama.arif@linux.dev, ziy@nvidia.com, baolin.wang@linux.alibaba.com,
	liam@infradead.org, nico.pache@linux.dev, ryan.roberts@arm.com,
	dev.jain@arm.com, baohua@kernel.org, lance.yang@linux.dev,
	kas@kernel.org, catalin.marinas@arm.com, will@kernel.org,
	mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org,
	tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
	luto@kernel.org, peterz@infradead.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/3] mm: make persistent huge zero folio read-only
Message-ID: <ap5Tqu5yswJrj5UM@kernel.org>
References: <20260901151818.3191443-1-xueyuan.chen21@gmail.com>
 <20260901151818.3191443-2-xueyuan.chen21@gmail.com>
 <apk8ZRr6do_YAlzf@kernel.org>
 <CA+qSx6wqd5VSR=9yarFFmyN1SyvLJqEHpA7BwmzuxNQTHbS=Xg@mail.gmail.com>
 <ap05ue1pq3TgHOS6@kernel.org>
 <CA+qSx6y=OaMsvTKUbPP2DOan3Ym6c8L5z60512-tCYeUjLZz3w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+qSx6y=OaMsvTKUbPP2DOan3Ym6c8L5z60512-tCYeUjLZz3w@mail.gmail.com>
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

Hi Xueyuan,

On Mon, Sep 07, 2026 at 09:11:14AM +0800, Xueyuan Chen wrote:
> On Sun, Sep 6, 2026 at 6:00 PM Mike Rapoport <rppt@kernel.org> wrote:
> >
> > > > > +
> > > > > +     /* Highmem folios have no permanent direct-map mapping to protect. */
> > > > > +     if (!folio_test_highmem(huge_zero_folio))
> > > > > +             set_direct_map_ro(folio_page(huge_zero_folio, 0), HPAGE_PMD_NR);
> > > >
> > > > Sorry, I don't remember if it was discussed previously, but why can't we
> > > > use the existing set_memory_ro() here?
> > >
> > > Hi Mike,
> > >
> > > We want to change the linear map here, but arm64 set_memory_ro() only
> > > works on vmalloc addresses.
> >
> > I believe this is an historical artifact. change_memory_common() already
> > updates the linear map when a vmalloc mapping switches to RO and the system
> > supports it.
> 
> On x86, set_memory_ro() does work on direct-map addresses.
> 
> >
> > I believe arm64::set_memory_ro() can change the linear map in the general
> > case as well as long as can_set_direct_map() is true.
> >
> 
> On arm64, I'm reading arch/arm64/mm/pageattr.c, and the linear-map
> update in change_memory_common() is only reachable for vmalloc
> addresses:
> 
>   set_memory_ro
>     change_memory_common
>        area = find_vm_area((void *)addr);
>        if (!area || ...)
>           return -EINVAL;
> 
> So set_memory_ro() on a linear-map address returns -EINVAL on arm64.

And I believe this is an historical artifact rather than necessity. For
configurations that allow set_direct_map on arm64, change_memory_common can
update direct map too, it just need to be implemented there.

-- 
Sincerely yours,
Mike.

