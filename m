Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92D6AC43327
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 06:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U47AD84cL4bgHSLmobM5ZhjbhKce39K3qqgD3AI5WGY=; b=U8TasCoT2iyjh2GygfOIVrAp5V
	vfS1wg0rg7DDTBEqN1WbxgVBZKjBCjoMjXgGXv7GSwXto4QmsNvWFT0OsO7GaiDDavmGOQK+RjISH
	drJLGngnE2o6sDDvHTtj1+TB9TZn4tivxpmrRCgmPovzB/DitOsWkCD+UYZe3eMZPScIeVT6pKuZS
	qAJSu0OjzdU3kNmk5cx1tGV7vfivIT/D7c1bANhespy/WXyHnDTRcV8N56Noco2HnDby5DDpTyKsQ
	UQGAwnEXYJBaLUfDpuAp0cJXNnNAZRUjrebYWPP05irRmDfxmPac0Si2OowewUCj+3uIAx4PY9evH
	sih2UXCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfB1Q-00000003eyB-08Do;
	Thu, 02 Jul 2026 06:35:40 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfB1O-00000003exR-1RtU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 06:35:39 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-493c5220cb7so4540745e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 23:35:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782974136; cv=none;
        d=google.com; s=arc-20260327;
        b=FsP1K8rz5wn1hqfjYvaZqau7DwLBwqS9dzQYjebZrA9+qQARTXjrXJNrKGabDCBoKv
         EDQ60sI0F2VQYegvQR30k3FbsEI40aBMO87wBoTpEvf4U5zmQS4jcy8vJ5BQzqJVN0hZ
         IKWWQt9PBc8RKll7mW2RPqHGFskcB67VfEfp9zOzPpNxRJNIpQKX2llwTYXw5KfOJw3S
         mJ0vB91l78GXC2xS4lLSOUFdIlOCPiKDPLUiAGAJAP3H1s/oe+q2bjStv5PGw6/S4bi9
         X6/I72OZRB0p6PZgZmiXG0KkEWhFkPRCOZiglOQ1QgRm3Ew9itTEP1q44do4OgEJMSZb
         NyoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=U47AD84cL4bgHSLmobM5ZhjbhKce39K3qqgD3AI5WGY=;
        fh=OFpM9pm2YuZUe/Lpw/1OtmiEUkc2f8qBluAFFUaJJJo=;
        b=SrkJl543ysvtLvkcuy0HDvA4lNBL5yJMatGHOJVkr3x/f/mX/xSHqhvuugvh+Ylk+q
         jB3BZXZexLXUm4ygR0lKFl3f4SJfGpqT0fU3cuWsSsWrHdtaOf/lzw9HTz+khB0xYYip
         KoWGuoXBoM024Mbd8k1je+D8TsgtHTVBX1pCkzNxA9n2KWCKOP76VGQBztQGyvCk2fqv
         yksgLgPSCBfd9BNQgJElROHV1weozEBk78r6h1ut/dWz6Az+ShWvapV+OCR/whT+WSlW
         QT499h4ci5sEtkbJ5Z/o2iR3Rc1RzJuI5hEfkVZ59z7AOJQhokl+bRPfJKh3vnIJFQMi
         oT3w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782974136; x=1783578936; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U47AD84cL4bgHSLmobM5ZhjbhKce39K3qqgD3AI5WGY=;
        b=mXcINqYYYxYcocRFVCuCz+1Z5Q+T/eWn1oSFu8FmXDvmh3wF7+u3QavAHHHeYcvvFK
         HOcW/mfagmkYmhNIfQLGltBw1AOUv7cE+NQNnmmX7aJM6PUEZDKXq2uPT39errPuZWzt
         imP3Dy/9cBLs1Bc2tff2Yq3ANO31oP/4+BQLoN+4xztp1sfeyV4Y3geGoxofUqNPg0Zc
         K3qRkv2bxfLCfYzK68KYysUUss9YNODUxIleRecT3iB6L6C1qQW9hluuri52GAL6yXZm
         iS21uwHBc51ZqnrUEw0kKZp/b2UYlPfqaM8Gqct5wbj2eqtCzor5GiAAbnT40nWDd0iX
         sBSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782974136; x=1783578936;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U47AD84cL4bgHSLmobM5ZhjbhKce39K3qqgD3AI5WGY=;
        b=EI4p9c/BACv7B1Rz7k8rbXZnNh4Ll2Go2m+wdyH1C8VjrXofJuH2/aS9rVuZNrthiC
         X2gaYVgxccjhrifE7OE+TOatKAb/ic2XKrlWXRzcKXL6UiVKLeWweyBD4BWJia+cpKR0
         m2f1HH634ivBPGX+v/wWxKgcKCUunIlfqDm+CZf9FsLjXyCqfXRjiuGBRXvDxM+xYlbf
         Nef+78fLGh17SIrOL67uSpuqiLhQT1GybcAol6jN7KmAZYkvii3Q6QE/87TOc6zkzGOX
         O2sXqTvKEVCGYuSKSPIHdOijmk8mDNJPGA4wnwLdo6McpmfGniYx9meZhAh6SI0mpcpK
         +B3A==
X-Forwarded-Encrypted: i=1; AHgh+Rq7adYCxiZ24uJ2ydOLm5BNnUKZh3APZ9b+B3l4VnqqvUfLDIWoJYQDT4jV8HlMWwO5x/jkOEsEaR57N+iYdGWA@lists.infradead.org
X-Gm-Message-State: AOJu0YwejhPZyAiXPac+X17OCCtQzM1WDYdY78Nen8ZuhZ29nH/Mv8rw
	93KmedRbg82Ro+XEOI40D5kCzS5oOGLzXZEAR3t6kb4RaoefLeqjF4lILAf49g8LZOcDQ9uwx9A
	GW4+BGN2PbMr6cJMp39qoxfykUIkWpTA=
X-Gm-Gg: AfdE7cnLok7It28h1XtrpP60djmsY9C7Z2u9AJKJ0hzUysebYjr8RIZpS1/29AKrhB/
	FYLApZjtqlFMWJPnm6jNkAX9ctPG3GPuC9H2f6rODU6Ov1T2HbStlXKGEf4v8Cu8eK/eIsr+Zcy
	onIz+VWG69V/OCkQt1jrZBs6rNfm/dXmRN9na7l/sH+rP8ihGNB41K3aV5sM10CobjyRlJUaHPQ
	q3DkaXAFDnZJo5oriMu2CwW101okCArbN5p7wNntkrSgkM9WWjVOUa86VSEtp0ILIDrPd+upQ==
X-Received: by 2002:a05:6000:2282:b0:470:4900:8d14 with SMTP id
 ffacd0b85a97d-477b32c1b95mr5561148f8f.2.1782974136196; Wed, 01 Jul 2026
 23:35:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260618084726.1070022-1-jiangwen6@xiaomi.com> <20260624195704.5c29c0353163babb721585ca@linux-foundation.org>
In-Reply-To: <20260624195704.5c29c0353163babb721585ca@linux-foundation.org>
From: Wen Jiang <jiangwenxiaomi@gmail.com>
Date: Thu, 2 Jul 2026 14:35:24 +0800
X-Gm-Features: AVVi8CdG5CabgJEFZZpewjLyJ7t--OOyNjBGNXchfHTDNoEBtggbSD2E0Nzod_E
Message-ID: <CAHKocdHJ-JB5jjXG3_-syz4P8k1C=jWrGaFxwnTjcinpGyR_BA@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] mm/vmalloc: Speed up ioremap, vmalloc and vmap
 with contiguous memory
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org, 
	catalin.marinas@arm.com, will@kernel.org, urezki@gmail.com, baohua@kernel.org, 
	Xueyuan.chen21@gmail.com, dev.jain@arm.com, rppt@kernel.org, david@kernel.org, 
	ryan.roberts@arm.com, anshuman.khandual@arm.com, ajd@linux.ibm.com, 
	linux-kernel@vger.kernel.org, jiangwen6@xiaomi.com, shanghaoqiang@xiaomi.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_233538_421837_DD3FEB11 
X-CRM114-Status: GOOD (  25.57  )
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

On Thu, 25 Jun 2026 at 10:57, Andrew Morton <akpm@linux-foundation.org> wro=
te:
>
> On Thu, 18 Jun 2026 16:47:20 +0800 Wen Jiang <jiangwenxiaomi@gmail.com> w=
rote:
>
> > This patchset accelerates ioremap, vmalloc, and vmap when the memory
> > is physically fully or partially contiguous. Two techniques are used:
>
> Thanks.
>
> > 1. Avoid page table rewalk when setting PTEs/PMDs for multiple memory
> >    segments
> > 2. Use batched mappings wherever possible in both vmalloc and ARM64
> >    layers
> >
> > Besides accelerating the mapping path, this also enables large
> > mappings (PMD and cont-PTE) for vmap, which are currently not
> > supported.
> >
> > Patches 1-2 extend ARM64 vmalloc CONT-PTE mapping to support multiple
> > CONT-PTE regions instead of just one.
> >
> > Patch 3 extracts a common helper vmap_set_ptes() that consolidates PTE
> > mapping logic between the ioremap and vmalloc/vmap paths, handling both
> > CONT_PTE and regular PTE mappings. This prepares for the next patch.
> >
> > Patch 4 extends the page table walk path to support page shifts other
> > than PAGE_SHIFT and eliminates the page table rewalk for huge vmalloc
> > mappings. The function is renamed from vmap_small_pages_range_noflush()
> > to vmap_pages_range_noflush_walk().
> >
> > Patches 5-6 add huge vmap support for contiguous pages, including
> > support for non-compound pages with pfn alignment verification.
> >
> > On the RK3588 8-core ARM64 SoC, with tasks pinned to a little core and
> > the performance CPUfreq policy enabled, benchmark results:
> >
> > * ioremap(1 MB): 1.35x faster (3407 ns -> 2526 ns)
> > * vmalloc(1 MB) mapping time (excluding allocation) with
> >   VM_ALLOW_HUGE_VMAP: 1.42x faster (5.00 us -> 3.53us)
> > * vmap(100MB) with order-8 pages: 8.3x faster (1235 us -> 149 us)
>
> Nice.
>
> > Many thanks to Xueyuan Chen for his testing efforts on RK3588 boards.
>
> Indeed.
>
> I see Dev had a good look at v3 - hopefully he (and Ulad) (and more ARM
> folks) have time to go through this.
>
> Is there any effect on anything other than arm64?  I'm wondering how
> much testing these changes will really get in mm.git and linux-next.
>
> How is our selftests coverage of these changes?  Is there some existing
> selftest which will exercise these new features?
>

Hi Andrew,

I ran all test_vmalloc subtests (run_test_mask=3D0xff) on both ARM64 and
x86_64, comparing base (v7.0.10) against the patched kernel.

All test_vmalloc subtests passed on both platforms. I do not see any
functional or performance regression. The small differences below look
like measurement noise.

ARM64 (Radxa ROCK 5B+, RK3588, pinned to CPU 0, performance governor,
5 runs averaged):

 +------------------------------+------------+------------+--------+
 | Test                         | Base(usec) |Patch(usec) | Change |
 +------------------------------+------------+------------+--------+
 | fix_size_alloc_test          |     935371 |     913368 |  -2.4% |
 | full_fit_alloc_test          |    1208295 |    1244718 |  +3.0% |
 | long_busy_list_alloc_test    |   35669866 |   35854584 |  +0.5% |
 | random_size_alloc_test       |   20122611 |   20200013 |  +0.4% |
 | fix_align_alloc_test         |    3240373 |    3288431 |  +1.5% |
 | random_size_align_alloc_test |    4822107 |    4792305 |  -0.6% |
 | pcpu_alloc_test              |      87641 |      89429 |  +2.0% |
 | Total cycles                 | 1586173575 | 1593193228 |  +0.4% |
 +------------------------------+------------+------------+--------+

x86_64 (Intel i7-8700, bare metal, pinned to CPU 0, performance governor,
5 runs averaged):

 +------------------------------+-------------+-------------+--------+
 | Test                         |  Base(usec) | Patch(usec) | Change |
 +------------------------------+-------------+-------------+--------+
 | fix_size_alloc_test          |      447739 |      439655 |  -1.8% |
 | full_fit_alloc_test          |      572719 |      575582 |  +0.5% |
 | long_busy_list_alloc_test    |     8544326 |     8635052 |  +1.1% |
 | random_size_alloc_test       |     4475421 |     4490037 |  +0.3% |
 | fix_align_alloc_test         |     1725389 |     1712483 |  -0.7% |
 | random_size_align_alloc_test |     2192646 |     2215064 |  +1.0% |
 | pcpu_alloc_test              |       50354 |       51911 |  +3.1% |
 | Total cycles                 | 57494755150 | 57703906913 |  +0.4% |
 +------------------------------+-------------+-------------+--------+

> You diligently went through the Sashiko report against v3 (thanks).
> Please pass an eye across its v4 report, see if something new popped
> up?
>         https://sashiko.dev/#/patchset/20260618084726.1070022-1-jiangwen6=
@xiaomi.com
>

I've gone through the Sashiko findings:

- Patch 5 (CONFIG_HAVE_ARCH_HUGE_VMAP): Over-interpretation.
  CONFIG_HAVE_ARCH_HUGE_VMAP is correct =E2=80=94 it gates
  arch_vmap_pmd_supported() and arch_vmap_pte_supported_shift() which
  this code calls.

- Patch 5 (__ffs(page_to_pfn())): Over-interpretation. Never appears.

- Patch 6 (GFP_KERNEL triggering reclaim on alignment failure):
  Over-interpretation. The same GFP_KERNEL is used by the
  existing get_vm_area_caller() =E2=80=94 no behavioral change.

Best Regards,
Wen

