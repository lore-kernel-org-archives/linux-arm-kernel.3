Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA3F4FF8875
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 01:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mfTZRpJN8BzgWKzjsbT4RBl/kx+3RhaAnmYLrU/EOzY=; b=abpzjkJMIqGWe/16ZLCPiaRiWQ
	VhjDN7ZNoL1uv8JEWm8ySwFWxQIxpBmkuv3T4sA+rHLtIN2X0qO5uDBwXGo3WPO448W7AhNwJIltM
	7sk0y1zQjZlM4IxdKru6e2UxDb9K0rWPLzw8AHMi3sCYU3Zdei2aCuQfXfbhf0uFHxUcQdoNHNzXU
	Bhi9ylWSfxAv7TZSK8RDgbtYGEJsFTDNF+53fx5mk9SFsNpb0zeiQBTRB6xj0Y79tLX3MoAFnUtk4
	CQh0Z9CmJq8wQ1H0Cjej2NNIBQ5XAEpRO1tfrJaW0fYfTgw9WXALsejm9sLew7/pXvQGcNVedkoND
	c/73/76A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIGEL-00000004NcA-0yJH;
	Thu, 30 Apr 2026 01:30:17 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIGEI-00000004NbL-2IK6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 01:30:15 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5a2c0615d6fso39360e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 18:30:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777512612; cv=none;
        d=google.com; s=arc-20240605;
        b=cubaenLXZZ8mReP+LI/1/LZtBgDeVJxPKKbEM33mv7brMFk1drDogpnCm++kmkkuky
         QzYnd7Zfsk3fPl1GMYniFKbFu5RVBSJHy8xmyG9mIxIZ+H5L35yagiQ9gJQxjZzf1JKy
         gmZOeYLqh+MVO7ZAWgzEP6az+5uzQqfTmwm+zEyngCNrVhsKZ20r9cuu5gdQLDmvilrC
         /35D5hg0PC1HGDSh/Nf6yCh7TXK9o0bTdc9HCGoYfSPWelOzkmEdT9LoyV/7ffoXjBHT
         Jx8FY4lh0QevUx91F1DE30NSFyibm59lhDFueVR5sfDHyBJqhLmmxjPWZcgmxw9BXDVc
         y8YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mfTZRpJN8BzgWKzjsbT4RBl/kx+3RhaAnmYLrU/EOzY=;
        fh=d9exVfw0ppLrM3V/DJYCJSR3yKL4cPcZbKrf/8QE/MM=;
        b=K0Sz/xN3OvF9z4BDyqc5hz/e44/9hzcXm6WTHntcMwYUYgxoDktazhi0xKTn1Yr9Xy
         wjKpuAUDpgbgN+AcKgPJR6Ka+HSO6sQdev28soue+Vih9ZTDoTXuqYw21r0otmdVboeJ
         X/qBOoDArWAU56Sky/n5B0c/jIYhpgFAT/SgU+bUH23argKlOdoHbmmK/0IvSP0JN3zC
         JFGyh/U8ORdNadURhQe93eENHqf7x1vwIWyGES2S+Gc9ja55Q3SXodE5cEDQNXRuCxsh
         yZEp/IwvHV7YiCyRuOgR5BxNz9Ag3i+CIArDVTQ1MvNNNyEc4mJAYjX4LwOzfuXkHivy
         HqAQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777512612; x=1778117412; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mfTZRpJN8BzgWKzjsbT4RBl/kx+3RhaAnmYLrU/EOzY=;
        b=aZg5UF9F3gVWs8tBBt2RiGADFdbNO7RZ+PAVgZY3vJ00QVn4LvO8GeEc85u6l6LBn5
         X5526VvPUj/H18lPy7h36xqpD0iTB4FjfesGiocLCKas9Ry1PbAPnhEzMtwxfBt7e0uu
         3wj+CDjNE04ZEXERIxrNFYVKRkPyzPZe0raQVO87RXudbhMkR6fOVf/DJUc8rsvPp+JW
         HCbuMcIBbd/HZLmQ1TdFNPzZZprsRSnn3W2+/07esN3+pT0vQ64oUoYkJWx56DnFWSa4
         W4789TcZdcSY6csncoxH+L3sfr8/SrFZMM9Nvb7nLG6Jw42roM7rqIL9OozBW+GX3E5P
         vz4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777512612; x=1778117412;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mfTZRpJN8BzgWKzjsbT4RBl/kx+3RhaAnmYLrU/EOzY=;
        b=Z5EHxqPJjPWc4dHahfpKfgYjSipPQyLgC3cFyqPM+U2h0M9Im1RANnI3foUKJob7SE
         mBv1jhVILs/kVjXGmHbqMkQGteT0VYoUUr/HWRvXIc0ovfX+FnzpB9W32ZamNH5Em77F
         ZUlHWu7vPt6GSNBgDaNtedFAcH/7kKITW07Iq/ySo1MW1/x7+fw0yQsTCYmlyw/W7iX9
         w2ljoNvmpxtn1R54ErX4FYKsxR3vwXVhLrp8BlzAu2zgLHve6o6bJexmwmY11vb/tdNl
         Sdk3iOJV2qkgJ4V2XE0BopdYiubz0Ar5rf9uqyktYVmVWmJchNVbV58ZrGkFAJrkWY5h
         KYeA==
X-Forwarded-Encrypted: i=1; AFNElJ8zVCeV+6n/EduQTBmrWwEqIkge+83h19BId5PqGgrr3+uHEgoQQxnUQr01KwU4dHr724zebCZ7PKBHDF9JQGJf@lists.infradead.org
X-Gm-Message-State: AOJu0YxF4vEbUk6g37k53TakHH6Nl+nsueDfjzmT+VslCRP6YAbduDnM
	TnyS5BupOkhdnpIZUIfIuaXh4fnNzBgPbj/BF+7BGVhyUXnoOMRHg5Vayaug7Es8L20La6wrCWD
	6fd9F/y9uI4ZLdvDbvtb5ZYe4Lq0fslg=
X-Gm-Gg: AeBDieut2jQvixc/ZKw3qIK+rMZTenKQrJq0EMPUALwgCT8alEuq6IMmvMo0kHyhfPy
	Cb+AM8JgYOOb0DItnhyEJFDbXsQz4U/KOfj1FJULc9JDnl/9Btba7Mp9IY8Rt+YtWyXpSj3+ACU
	JOjY5HJrYSEQjncZxRqD4bhgGwuWSFUFIUMRnogtOetFaOQ3PWH7U/xDElaGkAbGHQQDUHTD+tW
	qhwjoQ4ebkYmd8Zk0FvdL20pB6OtQc6dTxAb//zLWoX/cugp9P8a7k6MolwQZauLuimfxcEKIdm
	vKZzvNXVgdYlNqW/Iag=
X-Received: by 2002:a05:651c:b06:b0:392:4ed4:5c8b with SMTP id
 38308e7fff4ca-3934e235527mr1084621fa.5.1777512611747; Wed, 29 Apr 2026
 18:30:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260429061752.2880923-1-zhaoyang.huang@unisoc.com> <8fcde357-aaa1-4bd2-a8b3-d660b94a38c6@app.fastmail.com>
In-Reply-To: <8fcde357-aaa1-4bd2-a8b3-d660b94a38c6@app.fastmail.com>
From: Zhaoyang Huang <huangzhaoyang@gmail.com>
Date: Thu, 30 Apr 2026 09:29:59 +0800
X-Gm-Features: AVHnY4LsqzxYOZmha1EKfGqQQCdJzd6EQsrhXESUURyre2a7bp3C_dmZhtYOR4M
Message-ID: <CAGWkznGtGB58AZcwD51qfrFRcV5F060pH4ytyXXCuX6SxJNBOw@mail.gmail.com>
Subject: Re: [PATCH] arch: arm64: fix KERNEL_SEGMENT_COUNT error
To: Ard Biesheuvel <ardb@kernel.org>
Cc: "zhaoyang.huang" <zhaoyang.huang@unisoc.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, steve.kang@unisoc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_183014_674405_B56CF95D 
X-CRM114-Status: GOOD (  26.82  )
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

On Wed, Apr 29, 2026 at 5:28=E2=80=AFPM Ard Biesheuvel <ardb@kernel.org> wr=
ote:
>
> Hello Zhaoyang,
>
> On Wed, 29 Apr 2026, at 08:17, zhaoyang.huang wrote:
> > From: Zhaoyang Huang <zhaoyang.huang@unisoc.com>
> >
> > During debug of a kernel panic, we find that the pte_t of the final
> > part of [data, end] segment got overflow to the next page of
> > init_pg_end[1] which is the gap page before early_init_stack[2].
> > This should be introduced by the KERNEL_SEGMENT_COUNT's value is 5
> > which should be 6 as map_segment are called 6 times for the segments
> > of (text, stext, rodata, inittext, initdata, data+bss)
> >
> > [1]
> > crash_arm64_v9.0.1> vtop ffffffed00601000
> > VIRTUAL           PHYSICAL
> > ffffffed00601000  83401000
> >
> > PAGE DIRECTORY: ffffffecffd62000
> >    PGD: ffffffecffd62da0 =3D> 10000000833fb003
> >    PMD: ffffff80033fb018 =3D> 10000000833fe003
> >    PTE: ffffff80033fe008 =3D> 68000083401f03
> >   PAGE: 83401000
> >
> >      PTE        PHYSICAL  FLAGS
> > 68000083401f03  83401000  (VALID|SHARED|AF|NG|PXN|UXN)
> >
> >       PAGE       PHYSICAL      MAPPING       INDEX CNT FLAGS
> > fffffffec00d0040 83401000                0        0  1 4000 reserved
> >
> > [2]
> > ffffffed002c8000 (r) __pi__data
> > ffffffed0054e000 (d) __pi___bss_start
> > ffffffed005f5000 (b) __pi_init_pg_dir
> > ffffffed005fe000 (b) __pi_init_pg_end
> > ffffffed005ff000 (B) early_init_stack
> > ffffffed00608000 (b) __pi__end
> >
> > Signed-off-by: Zhaoyang Huang <zhaoyang.huang@unisoc.com>
> > ---
> >  arch/arm64/include/asm/kernel-pgtable.h | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/arm64/include/asm/kernel-pgtable.h
> > b/arch/arm64/include/asm/kernel-pgtable.h
> > index 74a4f738c5f5..14dd1c52552a 100644
> > --- a/arch/arm64/include/asm/kernel-pgtable.h
> > +++ b/arch/arm64/include/asm/kernel-pgtable.h
> > @@ -64,8 +64,8 @@
> >  #define INIT_IDMAP_FDT_PAGES (EARLY_PAGES(INIT_IDMAP_PGTABLE_LEVELS,
> > 0UL, UL(MAX_FDT_SIZE), 1) - 1)
> >  #define INIT_IDMAP_FDT_SIZE  ((INIT_IDMAP_FDT_PAGES +
> > EARLY_IDMAP_EXTRA_FDT_PAGES) * PAGE_SIZE)
> >
> > -/* The number of segments in the kernel image (text, rodata, inittext,
> > initdata, data+bss) */
> > -#define KERNEL_SEGMENT_COUNT 5
> > +/* The number of segments in the kernel image (text, stext, rodata,
> > inittext, initdata, data+bss) */
> > +#define KERNEL_SEGMENT_COUNT 6
> >
> >  #if SWAPPER_BLOCK_SIZE > SEGMENT_ALIGN
> >  #define EARLY_SEGMENT_EXTRA_PAGES (KERNEL_SEGMENT_COUNT + 1)
>
> I think the better fix would be
>
> --- a/arch/arm64/include/asm/kernel-pgtable.h
> +++ b/arch/arm64/include/asm/kernel-pgtable.h
> @@ -68,7 +68,7 @@
>  #define KERNEL_SEGMENT_COUNT   5
>
>  #if SWAPPER_BLOCK_SIZE > SEGMENT_ALIGN
> -#define EARLY_SEGMENT_EXTRA_PAGES (KERNEL_SEGMENT_COUNT + 1)
> +#define EARLY_SEGMENT_EXTRA_PAGES (KERNEL_SEGMENT_COUNT + 2)
Thanks for the comment. This makes sense since KERNEL_SEGMENT_COUNT is
also used for defining vmlinux_seg[] in declare_kernel_vmas.
>  /*
>   * The initial ID map consists of the kernel image, mapped as two separa=
te
>   * segments, and may appear misaligned wrt the swapper block size. This =
means
>
> and add a line
>
> Fixes: 5973a62efa34 ("arm64: map [_text, _stext) virtual address range no=
n-executable+read-only")
>
>

