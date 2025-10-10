Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56372CCA476
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 12:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zFPQz4TK9Xo2d5s4+OYRx8/mVx/Je8Rfq5nWIrq1GPo=; b=wVXftx4Eh8iYhwcjgz/A3Bxpi9
	BOgUd1DkSoSKjdHKZofZszkbIADC8rhQAuvcB4fgES27norTKD0oO/fSDpxM+IdbvTIJcCVs/rRpQ
	uRV9ckNZLzkh8T6gwE1EnMgbePxSiY0kjvPookAHU8IO/ntWKtvicmhzJgF3hCEgM281SaRwFbFqQ
	kYVJ8lXtSIHL1HemSgqNGZaTItX68EiI9DuuvYc0HVP0XMWHtkbvNDYb5ka+AAOrFqBDwazVaIcdz
	4w5hX7ukflT6IkWsnl5C/Lsw8G9fybAMwijawtAXIeWuI/PxlLJc1MA1EAJpn+QO3CQcnwR53POsm
	kKJtP1jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7CFh-00000008RQB-1M1e;
	Fri, 10 Oct 2025 12:29:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7CFd-00000008RPI-2Mpf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 12:29:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E73E844F04;
	Fri, 10 Oct 2025 12:29:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5D7CC4CEF1;
	Fri, 10 Oct 2025 12:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760099376;
	bh=Jj1hHD26ywHZMQ9GcmV4Z80Kfj4cikffumrIj2vHHVc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M89jGeQ+NJe3vL+jI1vMZ43D5BwZBga3DFmtKIQZdEQp/IMbFwdkyba+qYbAas5hU
	 FkZXsMDOBauWrtjWMjOl/BC+UUOQdTqcEEcgrmk+faiu3xmhRnbOY5i06bmCTzGjut
	 jj77AxtZeDrqtl1iJZmH7aDBKphq3NNCamTsyuDTY7RBR/5tfpW/JGj/d/GdzJpEUP
	 MxoYC4312jSflEeoF2r7hpeJwN17vlGswS3NX9abdDWIRsB0zL/S9bOhBQ5batjWNL
	 u/ORdZB9g2BaXzF4/djWqyRP+SSoRdq1ZW2/VJhHdeBgnJIYs07twhUkSPHDSqP11K
	 R0sSrESLuBXHw==
Date: Fri, 10 Oct 2025 13:29:30 +0100
From: Will Deacon <will@kernel.org>
To: Yunseong Kim <ysk@kzalloc.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	James Morse <james.morse@arm.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Marc Zyngier <maz@kernel.org>, Mark Brown <broonie@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Ard Biesheuvel <ardb@kernel.org>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com
Subject: Re: [PATCH] arm64: cpufeature: Don't cpu_enable_mte() when
 KASAN_GENERIC is active
Message-ID: <aOj8KsntbVPRNBKL@willie-the-truck>
References: <20251008210425.125021-3-ysk@kzalloc.com>
 <CA+fCnZcknrhCOskgLLcTn_-o5jSiQsFni7ihMWuc1Qsd-Pu7gg@mail.gmail.com>
 <d0fc7dd9-d921-4d82-9b70-bedca7056961@kzalloc.com>
 <2b8e3ca5-1645-489c-9d7f-dd13e5fc43ed@kzalloc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2b8e3ca5-1645-489c-9d7f-dd13e5fc43ed@kzalloc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_052937_623902_491A8C98 
X-CRM114-Status: GOOD (  20.86  )
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

On Thu, Oct 09, 2025 at 08:10:53AM +0900, Yunseong Kim wrote:
> To summarize my situation, I thought the boot panic issue might be due
> to incompatibility between MTE and KASAN Generic, so I sent this patch.
> 
> However, it seems that the problem is related to the call path involving
> ZERO page. Also, I am curious how it works correctly in other machine.
> 
> On 10/9/25 7:28 AM, Yunseong Kim wrote:
> > Hi Andrey,
> > 
> > On 10/9/25 6:36 AM, Andrey Konovalov wrote:
> >> On Wed, Oct 8, 2025 at 11:13 PM Yunseong Kim <ysk@kzalloc.com> wrote:
> >>> [...]
> >> I do not understand this. Why is Generic KASAN incompatible with MTE?
> > 
> > My board wouldn't boot on the debian debug kernel, so I enabled
> > earlycon=pl011,0x40d0000 and checked via the UART console.
> > 
> >> Running Generic KASAN in the kernel while having MTE enabled (and e.g.
> >> used in userspace) seems like a valid combination.
> > 
> > Then it must be caused by something else. Thank you for letting me know.
> > 
> > It seems to be occurring in the call path as follows:
> > 
> > cpu_enable_mte()
> >  -> try_page_mte_tagging(ZERO_PAGE(0))
> >    -> VM_WARN_ON_ONCE(folio_test_hugetlb(page_folio(page)));
> > 
> >  https://elixir.bootlin.com/linux/v6.17/source/arch/arm64/include/asm/mte.h#L83
> 
>  -> page_folio(ZERO_PAGE(0))
>   -> (struct folio *)_compound_head(ZERO_PAGE(0))
> 
>  https://elixir.bootlin.com/linux/v6.17/source/include/linux/page-flags.h#L307

Do you have:

https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git/commit/?id=f620d66af3165838bfa845dcf9f5f9b4089bf508

?

Will

