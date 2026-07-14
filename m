Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D69EC44501
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 09:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Eb8w9+npX5/dhsCqW4lckI0v6rU18FNTvsuJCjEq5yM=; b=wWwAeCbL5u/umDjxxT1TGdac2B
	HMX+ZcxNnN9qBPHoBFPevc6+8r+i+r8OlSsskBqM25QBWZPzUz6aML7sjXPzZMib0SuphnE5Lgmc+
	0zEF7oQ2L+16NtN/TPMzFI6hBqHaC3Qwh8dCyZ438+4yF6iAzuDrN5wMs8klEgYrSrA/P014wVT5G
	jNoyJ/RiHCwvs6CTrYLqmIs0A9NGWRsUVhAMZN5r33lxWjXpoyiNvjZlI2dlwv0kiS27R4LB7C0NS
	opOleRIhEegwHVdTjA+aJGjJTzXgWSacNFqHaQrfDy0XIFAI/1f+ZVpRxlx+6e9MS3DEPmonG/HTA
	Sr7yfzUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjZNs-0000000BS9o-19qD;
	Tue, 14 Jul 2026 09:25:00 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjZNp-0000000BS9T-2B6U
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 09:24:58 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-493f60208a5so35202175e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 02:24:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784021096; cv=none;
        d=google.com; s=arc-20260327;
        b=HNkF8l6xyB9PI3aTa70HotSaDzxqKCH5hmaucpkXGkV0uoGKfMreLOz/e+BtGJBTfJ
         btqsjH3H06bA8Z5PoocIbZ7kLMDkbfCq1FnDP/gopfzVEgjgdggFq4OxVI2jO2dwbjWc
         PIPy8fR20rbiW4jNHbFW4SoDcf/qz+9U1Fyx6tBWwyPnTpe6qo4k8x0qK4oL8wWMpua+
         Q+wwkFuTo/rFM6eT3TFUvlQM/MdizU1wWd8rpyrLE9RDBdZEFxhJBEhHpteS5Td0ZlcZ
         7B1RFYfJHrnQQMWyFpNr3pf9RYR2hItWbcISKSYw16xlXtnoKzce8kVp/siD9+7Jxgnq
         4+eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Eb8w9+npX5/dhsCqW4lckI0v6rU18FNTvsuJCjEq5yM=;
        fh=H58ErvcmJc4r5oGNb+gw//PCxL8Rl0ciKUwwhWuhYyA=;
        b=ZiZTYrA+wdFqW7SFzX8XwOhBcLvTKwEEqc71+BraTBdQ+1Hp8/X+Tp1ZXZAaCT1QWn
         peQkh6sS6CeePqm5lCrtJzhi0c56ZogFOOPsRp47b4OYLtHJ1UVbkzAOS6yh51WNTjhm
         MXI7Z0UguBEjuUYKiD532nKwuRP5FUueRtFqEtwlq6VAXh28QqnLq0yjDQMsP7+5NKoH
         MoYMgFVL8/fR3Qhc4LTnPkjvXl3Nh9kbGICwOYw/C5uoyVqw9sMgI+DcqFcoqTPJPmQc
         G+qHhWP8Uaure95+mOyM1bQM0FQ6b/aQCLU+0OvjfS5pv1NLwMe9GQ9kTOk2DhEDtaUA
         uYJA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784021096; x=1784625896; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Eb8w9+npX5/dhsCqW4lckI0v6rU18FNTvsuJCjEq5yM=;
        b=JVjgUP3WHum87xHtmqW4n9qugiSEd5JyJaRF9BQumlDQEtTRXmFXagp8CfclK0XINo
         i/wjqdz5B6Tk/Zy7Z30cjCn8/LmtU8q0ewn+gedPwrhy6EAcyT3Pn0hocVe6sZ4YIyYu
         1p++PUvMhcil8phRaOOqZZ+6twVUnVdM9+sfgW/u7OIYMBCgnxKZWDdxvaLJEdWDImsU
         /4rVoiGH3GJ5OZguompKaC4U6CCTEmC19cgvBgXiBZzYUVGn8RfyV12fBgI61eJTjsyH
         wHr2ug4OMEjvK9cNTCTCaPZvFeOuXrP9lDC4sdFpufLgpTlm2mD9RAZeQjIT3x3tE+76
         6S0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784021096; x=1784625896;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Eb8w9+npX5/dhsCqW4lckI0v6rU18FNTvsuJCjEq5yM=;
        b=NjwFZqm7R7BcNiJRT9MU54AcmeaRpIEBctsl0OPtVIN5KVN+EXPH9ah99tlYIVSden
         zUmkbGOtd7EpXl8nqssuVQcUn1ynoaHrgsH+b+Fw840ZJmUy96OS8src7qGpaSKXm8eT
         W1TPVXCCBdsD2ftAsC74Fqe6cviyDCt9QTtZV8kBVQRPVyHy9aAxt1NmFj+VeGoPffRI
         C1iiK10TFm9k/m+nLzJOAHfXheYG0x84ivVoiF9AeBCpxkx9brM4q4J9AZg91Zg4yiR3
         4nEogNT+QK3gD+JcmPk+OiFJcKo6Ph+gT18II3DY1NFDyh7zev1qEn3vdya2fD+K7uCp
         rfZg==
X-Forwarded-Encrypted: i=1; AHgh+RrGpc4DFK01RB+FcM2VmCU2phhT+bUjYOlYTxWoT4Cr5N54xxQU3TdGJR6Hu4qAfsO6UQ9GrWP72HodrE0SkpV0@lists.infradead.org
X-Gm-Message-State: AOJu0YyYH07tjShMToF6ASWP8khGzIqiBlguVzJGxTqrXjeC0kqKaUbs
	Tq4Q6HaoNzTbGdBHnI+fi4O2aUyS2wTgXj2SttNYD55UidHxhq19rC8ewSmNuVbOg0pS+ktA+NX
	0+EMa6wi4DMX8sZ+LNctXhJx7MUGMnr9Tntsu
X-Gm-Gg: AfdE7ckihkzPZU8Xg1yIIn6kAkZ1a2Zp1hCyDwJVhVfVhIWxN68yt4g/5c4zhOSwT2d
	ZO0Dn9LzStuVX7dzoWjilI/jKK29wBaP/NM/5LLPh03j3AAqFzoJLQUhsHgT65YnCocXaKhTPD9
	IvcnqaeulmISA5aCJM69EenDlWEszcdNnuwNyItaLhaGhacxpUFoBeNAmRQdwlzARPb6kxv+z4n
	kI6ZTQb9C0ydjcEbguN/3EYkWDWwukBGjaDbqODgs7OwBqPqJ4gKtbiqXNV66uDM1Y4BxkHmA==
X-Received: by 2002:a05:600c:5392:b0:490:b00c:8e6a with SMTP id
 5b1f17b1804b1-493f8826bbfmr125775275e9.28.1784021095515; Tue, 14 Jul 2026
 02:24:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260709073823.6643-1-jiangwen6@xiaomi.com> <20260709073823.6643-3-jiangwen6@xiaomi.com>
 <bc4ab9da-0b16-4203-9901-4845323c3e5c@arm.com>
In-Reply-To: <bc4ab9da-0b16-4203-9901-4845323c3e5c@arm.com>
From: Wen Jiang <jiangwenxiaomi@gmail.com>
Date: Tue, 14 Jul 2026 17:24:44 +0800
X-Gm-Features: AUfX_mylJ-bQk36F-lqOtF83r56yTp9Z07DBP_uUrN5vhZN-KgZgzRTY9TytYoU
Message-ID: <CAHKocdFn9DP=wGLYJrhndxTnxz=eMeWYjK1m2OzPotcvz_sVjA@mail.gmail.com>
Subject: Re: [PATCH v6 2/6] arm64/vmalloc: Allow arch_vmap_pte_range_map_size
 to batch multiple CONT_PTE
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: akpm@linux-foundation.org, catalin.marinas@arm.com, linux-mm@kvack.org, 
	urezki@gmail.com, will@kernel.org, Xueyuan.chen21@gmail.com, 
	ajd@linux.ibm.com, david@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, rppt@kernel.org, ryan.roberts@arm.com, 
	dev.jain@arm.com, "Barry Song (Xiaomi)" <baohua@kernel.org>, Wen Jiang <jiangwen6@xiaomi.com>, 
	Leo Yan <leo.yan@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_022457_590315_E21C660B 
X-CRM114-Status: GOOD (  24.87  )
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

On Tue, 14 Jul 2026 at 15:13, Anshuman Khandual
<anshuman.khandual@arm.com> wrote:
>
>
>
> On 09/07/26 1:08 PM, Wen Jiang wrote:
> > From: "Barry Song (Xiaomi)" <baohua@kernel.org>
> >
> > Allow arch_vmap_pte_range_map_size to batch across multiple CONT_PTE
> > blocks, reducing both PTE setup and TLB flush iterations.
>
> Too little commit description for the proposed change here.
> >
> > Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> > Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
> > Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> > Tested-by: Leo Yan <leo.yan@arm.com>
> > Reviewed-by: Dev Jain <dev.jain@arm.com>
> > ---
> >  arch/arm64/include/asm/vmalloc.h | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/include/asm/vmalloc.h b/arch/arm64/include/asm/vmalloc.h
> > index 4ec1acd3c1b34..7d9c7dc795c42 100644
> > --- a/arch/arm64/include/asm/vmalloc.h
> > +++ b/arch/arm64/include/asm/vmalloc.h
> > @@ -23,6 +23,8 @@ static inline unsigned long arch_vmap_pte_range_map_size(unsigned long addr,
> >                                               unsigned long end, u64 pfn,
> >                                               unsigned int max_page_shift)
> >  {
> > +     unsigned long size;
> > +
> >       /*
> >        * If the block is at least CONT_PTE_SIZE in size, and is naturally
> >        * aligned in both virtual and physical space, then we can pte-map the
> > @@ -40,7 +42,9 @@ static inline unsigned long arch_vmap_pte_range_map_size(unsigned long addr,
> >       if (!IS_ALIGNED(PFN_PHYS(pfn), CONT_PTE_SIZE))
> >               return PAGE_SIZE;
> >
> > -     return CONT_PTE_SIZE;
> > +     size = min3(end - addr, 1UL << max_page_shift, PMD_SIZE >> 1);
> > +     size = rounddown_pow_of_two(size);
> > +     return size;
>
> Please do explain the fact in a comment that huge pte mappings
> upto PMD_SIZE are being allowed here, if the given block is
> CONT_PTE_SIZE aligned.
>
> IIUC arch_vmap_pte_range_map_size() gets used only when config
> CONFIG_HUGETLB_PAGE is enabled. Hence should not these new huge
> sizes being supported here also be added as valid HugeTLB sizes
> thus updating __hugetlb_valid_size() and adding corresponding
> new HugeTLB page sizes with hugetlb_add_hstate() ?
>
> OR could arch_vmap_pte_range_map_size() and set_huge_pte_at()
> can be updated for vmalloc without doing corresponding changes
> into HugeTLB itself ?

These sizes are not new HugeTLB page sizes. They are only vmalloc mapping
spans selected for a particular virtually and physically aligned range, so that
the PTEs can be installed with the contiguous bit in larger batches.

Therefore I do not think they should be added to __hugetlb_valid_size() or
registered with hugetlb_add_hstate(). Those describe the HugeTLB hstate sizes,
while this change only affects how vmalloc chooses the PTE-level mapping span.

Thanks,
Wen
> >  }
> >
> >  #define arch_vmap_pte_range_unmap_size arch_vmap_pte_range_unmap_size
>

