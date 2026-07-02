Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 319DAC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 09:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ltAucTOR/5O5x3cPBkQD7HWTrR+has2ZItj9F0GdEnw=; b=xg3+cVj0SXFgzRRYFnNHWNpJnR
	30Mu0pxPFXztb0xY1X+IIOcobKtwExG0YGO+0Sfgq258jWfyVEGxUNQq7c6tiAOiRUd5x2FkZgia/
	fI/6krXjhL13i9EhCQQiK1+oERv6MwAKG00l0yWayURc5M/VPolRah2OIkmouZta0v+7thpVPDr8i
	ho4awJAHPGDntdzDWBm58ge0GOnVZNOJUGEtxIZqV8ucHHUJk+H0QfAaLcPyJSE7oOQJ4bTj7z2ik
	GYoNRvPKj5yV3Y+arls8ysAydtNSP56j1DbS2b2agWGumtCRT0TGZzddqahsu0/8RVt72nFv9dWAl
	tMYwoPiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfDLR-00000003xbm-3iE6;
	Thu, 02 Jul 2026 09:04:29 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfDLP-00000003xab-0o0u
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 09:04:28 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-5aebba706b3so1542148e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 02:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782983065; x=1783587865; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ltAucTOR/5O5x3cPBkQD7HWTrR+has2ZItj9F0GdEnw=;
        b=evvstO52fWRa3K5PMcJ+RhEDjl93ldJOiviH4k7YBeewKcjmGoj26WZ7gcc7/87+Yj
         uXgCHAybkVqWZ+EdlolxiUTCQR5Q/oMLcxBBEqyNuvlU0lfB2gMThHzgIa9Q1xsakgCA
         Z+76YDno13u3dK9KgVycz0+cEXt3DmFenozXTZn7Lhsie+8cFeMJLbxbKImW/5f5tmhj
         QZVCizOSLptAxukxL8P1MWQD9R2T2UD/BNiIggvo7k56PNFrkAElP2C33ii+GswRy/uI
         AD8dl3lz0LM9YUnPLfMdQA4a9R9SLizZoTlek8kdmG3h6O22maaQqPVRGpEofi/unix3
         ZguQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782983065; x=1783587865;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ltAucTOR/5O5x3cPBkQD7HWTrR+has2ZItj9F0GdEnw=;
        b=Wnbd2ZwE0ryrP+wt5+7PRcPdvahn5xe6RUMAeUrmheRoFVxlDIFpylk4gZYv3i32ON
         8ky2zYY0bhd6cwAkOIxVkN3EI1mRh6tj1ffh9K0Q64K/d4AUU0s+uJjp99Xb4WAclf/D
         g0Y5YsPEAtzS/2w7WDeQhdGZxcNG2NietDSyfwQdQD0kxD/CcVApaleW0PJs06J3YvGJ
         6iOvqPP+VITodci6YUofQEqh264+osktOUdFYC/GclZqaoYRqKKQ212r09skAfcoNB9E
         XXz69mRuMaerjrTy/Ylwq6JuOON7QJUOhVErKlTeYxToFJpDuGQvrhgEOWz4mUTCp1hg
         9edA==
X-Forwarded-Encrypted: i=1; AHgh+RpnDQ+wAyD5dQiPJSBgV5encssU7Jr75MzV4IqdUW3ghTg6Uy+a4R6dYoiyC6wykaHHfGlmxSBClBcvPrlsvT6Y@lists.infradead.org
X-Gm-Message-State: AOJu0Yxnne0Hk9f8IfHVMrp8eAgwnO1zXwI/u2z1jacP9T+BBf0mxiD/
	Pbqe7XH0Mt5tdn1n2wtTx/dMa72utuUDAD0BysGaHZ8BEwhh68t42gFq
X-Gm-Gg: AfdE7cnrIhQpY+K7aGVWaF1QiXM4W8mrIHjYd/SuPjeadKYzvLJKqlWN+bZ6lXlE58g
	aBDBGMpUvsJwdcoiRNK2c9VaIbpEIA4jYqeuty8/kcjoIf+SbgnC0pUM/8AG80usd9Z0wTLUFV0
	GEVryGzDV68fCeU06hheaerDNQBCXMS+I8w1m6KvmBZZ6HCBjKxPTRwmkj9lcBVQYn83gdGYUeg
	8haD7ba0E4UjW5bUBjKY8juDfuzVwxTdFNQlGOiOYqZVMCgYlJv97rD6uVi4itdhBWiEH5dNoWE
	bQ7me/tTGGAxbSiQt9AirH/TGyGdmjNL34Y8K29XCm8yCY5TYDaqwq8ljDJkbbKR+LXXxRvFrtB
	QFqIkbSNNnZ1FMyNS9sM9vZ3ZuAM4nurbKqN2pgr513FkO+w80/G82rgYkcVcd38QWCD+jU5peW
	UCb7CqHrb7L30hqJ5x0n7lgMT4XNT7wi0O8KpGKyCFz7Bj1IS7eaa76g==
X-Received: by 2002:a05:6512:1556:b0:5ae:bfa0:54f1 with SMTP id 2adb3069b0e04-5aec743317amr986635e87.59.1782983064322;
        Thu, 02 Jul 2026 02:04:24 -0700 (PDT)
Received: from pc636 (host-90-233-199-119.mobileonline.telia.com. [90.233.199.119])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aec899a3a8sm547824e87.31.2026.07.02.02.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 02:04:23 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Thu, 2 Jul 2026 11:04:21 +0200
To: Wen Jiang <jiangwenxiaomi@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
	will@kernel.org, urezki@gmail.com, baohua@kernel.org,
	Xueyuan.chen21@gmail.com, dev.jain@arm.com, rppt@kernel.org,
	david@kernel.org, ryan.roberts@arm.com, anshuman.khandual@arm.com,
	ajd@linux.ibm.com, linux-kernel@vger.kernel.org,
	jiangwen6@xiaomi.com, shanghaoqiang@xiaomi.com
Subject: Re: [PATCH v4 0/6] mm/vmalloc: Speed up ioremap, vmalloc and vmap
 with contiguous memory
Message-ID: <akYplZcaLXIl7AsP@pc636>
References: <20260618084726.1070022-1-jiangwen6@xiaomi.com>
 <20260624195704.5c29c0353163babb721585ca@linux-foundation.org>
 <CAHKocdHJ-JB5jjXG3_-syz4P8k1C=jWrGaFxwnTjcinpGyR_BA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHKocdHJ-JB5jjXG3_-syz4P8k1C=jWrGaFxwnTjcinpGyR_BA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_020427_294723_123749C1 
X-CRM114-Status: GOOD (  28.94  )
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

On Thu, Jul 02, 2026 at 02:35:24PM +0800, Wen Jiang wrote:
> On Thu, 25 Jun 2026 at 10:57, Andrew Morton <akpm@linux-foundation.org> wrote:
> >
> > On Thu, 18 Jun 2026 16:47:20 +0800 Wen Jiang <jiangwenxiaomi@gmail.com> wrote:
> >
> > > This patchset accelerates ioremap, vmalloc, and vmap when the memory
> > > is physically fully or partially contiguous. Two techniques are used:
> >
> > Thanks.
> >
> > > 1. Avoid page table rewalk when setting PTEs/PMDs for multiple memory
> > >    segments
> > > 2. Use batched mappings wherever possible in both vmalloc and ARM64
> > >    layers
> > >
> > > Besides accelerating the mapping path, this also enables large
> > > mappings (PMD and cont-PTE) for vmap, which are currently not
> > > supported.
> > >
> > > Patches 1-2 extend ARM64 vmalloc CONT-PTE mapping to support multiple
> > > CONT-PTE regions instead of just one.
> > >
> > > Patch 3 extracts a common helper vmap_set_ptes() that consolidates PTE
> > > mapping logic between the ioremap and vmalloc/vmap paths, handling both
> > > CONT_PTE and regular PTE mappings. This prepares for the next patch.
> > >
> > > Patch 4 extends the page table walk path to support page shifts other
> > > than PAGE_SHIFT and eliminates the page table rewalk for huge vmalloc
> > > mappings. The function is renamed from vmap_small_pages_range_noflush()
> > > to vmap_pages_range_noflush_walk().
> > >
> > > Patches 5-6 add huge vmap support for contiguous pages, including
> > > support for non-compound pages with pfn alignment verification.
> > >
> > > On the RK3588 8-core ARM64 SoC, with tasks pinned to a little core and
> > > the performance CPUfreq policy enabled, benchmark results:
> > >
> > > * ioremap(1 MB): 1.35x faster (3407 ns -> 2526 ns)
> > > * vmalloc(1 MB) mapping time (excluding allocation) with
> > >   VM_ALLOW_HUGE_VMAP: 1.42x faster (5.00 us -> 3.53us)
> > > * vmap(100MB) with order-8 pages: 8.3x faster (1235 us -> 149 us)
> >
> > Nice.
> >
> > > Many thanks to Xueyuan Chen for his testing efforts on RK3588 boards.
> >
> > Indeed.
> >
> > I see Dev had a good look at v3 - hopefully he (and Ulad) (and more ARM
> > folks) have time to go through this.
> >
> > Is there any effect on anything other than arm64?  I'm wondering how
> > much testing these changes will really get in mm.git and linux-next.
> >
> > How is our selftests coverage of these changes?  Is there some existing
> > selftest which will exercise these new features?
> >
> 
> Hi Andrew,
> 
> I ran all test_vmalloc subtests (run_test_mask=0xff) on both ARM64 and
> x86_64, comparing base (v7.0.10) against the patched kernel.
> 
> All test_vmalloc subtests passed on both platforms. I do not see any
> functional or performance regression. The small differences below look
> like measurement noise.
> 
> ARM64 (Radxa ROCK 5B+, RK3588, pinned to CPU 0, performance governor,
> 5 runs averaged):
> 
I think there are still comments to this series. One from me about
naming and there is one more from Jain here: [PATCH v4 6/6] mm/vmalloc: align vm_area so vmap() can batch mappings

Could you please have a look?

--
Uladzislau Rezki

