Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88059C19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 05:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tTyDWMq7LuxFszntaa+iD29bxyoweAzlnH0TTz0fmag=; b=SHhx6fxBEKP6e5FpsaMXZFXa+U
	yRwAn96xyaXkXFlBh/LPoMMoO67Bg0+aD+65ZlH5VpBT9Zx5CoINZ3twrJsBLkEn+miCzgBthHWfp
	Q/O6XghyG+cLwIP/EvswFs+WSqHGeyqJhpdqTdBciY+nGXOZrdoU3FANeVwysCdtU1deaKbc5K+UA
	vf7zZQVM84CmCaE3J3J2JACXDPXuvj4WX8OnjP4DcguRC9VUjxQNXjzKFU8k0uzNcbliM7UqcllTq
	XJll/aOwPDhq6xNOx7wquaPGFa0v+FOfdfBXn4jR8P2ae4hf7uvLZMQQ3+QS6MaF6ZjCRmSIjKiZO
	sTsT1RYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tntNO-00000009pmd-2gpg;
	Fri, 28 Feb 2025 05:57:34 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tntLp-00000009pdF-2XNP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 05:55:58 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-2f9d3d0f55dso2920724a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Feb 2025 21:55:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740722156; x=1741326956; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tTyDWMq7LuxFszntaa+iD29bxyoweAzlnH0TTz0fmag=;
        b=VSv7bs6HxxUgiR1cYBj5Tuk2Dkgsjiv2ebzwWge5s5dWiddEVAAq5hgx0MW7iloQ5q
         96x3QCFwf9yoOQzi7EaBWgGzptxRZ+dfM7DmOrpOp+tEc8l8Map+IwtE32ztSsjX8RuF
         fhl6dYcmvU0/GUQrQCtdUBmD6w0KlHn9d1sQ5JmlFif6nj39iSoooXPMO15FIWI5Djab
         W7kSP0N7+bamUCeMYj/SjoJtZQK1xuQKxRUJcwQJ6yYibAa911poyG+5kelr+I3XbwlA
         9n4MQ0taRNbDBhYSHC76QiMCLt5XPx55z3U9AJBxXM7VONA7FEb/p9OmMjKAMaxHzuQj
         +XsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740722156; x=1741326956;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tTyDWMq7LuxFszntaa+iD29bxyoweAzlnH0TTz0fmag=;
        b=LqsauBRMwuTfYTH74kRAp4rGtUy778OpBxmN8fN0Yo8wqSTxcBX3cEVW0UrfS6VFE6
         iRvDzu3Z6woW3VtfxDvWZYQgh90ziWcy9Pn3gRL9yPQSKm2/YQy9hT7ob3z4mVSEpR3/
         prIBa3WaSnFI/LcoBLJ+b03dWiRn1vp0tgNucomoj2ccV0EvguKkLofhyZ0pXwlmyl/z
         lVo39xa9rNO5pinUO3wM3xmjtnW3yhiMzSq3os0GYkBadVJVrj4iFtItBevVMwWBC0gB
         5JtWCcS//2DRpdXomx0heG48w/na5EDLbceNorOYzbx3I5QlmWVZutrDzxAYMU71ca72
         T54g==
X-Gm-Message-State: AOJu0YyEtAJXZ3MRSt3ROyDLb5gTwHEln5Bi5R2UgLNq2v6ZvoRqV6oX
	War5Y6E0doFFrF+/mRdDMtn+JT2PrscwqWg2hOA6Vo9EoYiR+2PvG5AtIxUjehdkoutoa8uGyKm
	dSYnMnRMLbO+LMRb0lSYH3ZrK/Oc=
X-Gm-Gg: ASbGncuuCy/SMycFpetiqI7Fh6zdGnYWNjZ+nVHN7C4lkdSBpwgaQnMwInET9baGyEE
	0prc13qt7Kjw0uJJppeJl84L1eCcwd1id30zb8XF/BqLoOyndBotzr+6K3FNUk/LHuy1tItYVux
	Oi6NnnL0s=
X-Google-Smtp-Source: AGHT+IH1kXpO6UtU9fFbMiz1TwsUkVKouvQAhEFuVTY7b3q6gVCZwEbIs13RvSk10ypmcMw3ai6cwMKrN9AtOIdFY5g=
X-Received: by 2002:a17:90b:4f44:b0:2fe:7f40:420a with SMTP id
 98e67ed59e1d1-2febab799f7mr3898280a91.17.1740722156297; Thu, 27 Feb 2025
 21:55:56 -0800 (PST)
MIME-Version: 1.0
References: <20250224062111.66528-1-kpark3469@gmail.com> <CA+KhAHYujgeC2kAd-vs0N0zwprpeqtD8G-8DpJ0w2RSxzZ5SQw@mail.gmail.com>
 <CAMj1kXH-QmuXGi-5MSEzz7zSpPYWvM2eBPN-NbWF+R=49P2_2g@mail.gmail.com>
In-Reply-To: <CAMj1kXH-QmuXGi-5MSEzz7zSpPYWvM2eBPN-NbWF+R=49P2_2g@mail.gmail.com>
From: Keun-O Park <kpark3469@gmail.com>
Date: Fri, 28 Feb 2025 09:55:44 +0400
X-Gm-Features: AQ5f1Jqv7vZum04ir1zjNFlxNiWh8h_GwAtHGiIdceGOJ9NtD2R77znnZ1Sxpmk
Message-ID: <CA+KhAHYDui3VkebjxZLnN_ijMUzJf2BRMqtPqqos+rCbf8J7Ww@mail.gmail.com>
Subject: Re: [PATCH] arm64: kaslr: consider parange is bigger than linear_region_size
To: Ard Biesheuvel <ardb@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	catalin.marinas@arm.com, will@kernel.org, Keuno Park <keun-o.park@katim.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_215557_644900_22B34B6D 
X-CRM114-Status: GOOD (  25.62  )
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

How about adding a warning message in case of linear region
randomization failure?
And, there might be two options in my mind by now to consider hotplug memor=
y.
Either giving an option for users to override "parange" as kernel
param or providing the legacy way((memblock_end_of_DRAM() -
memblock_start_of_DRAM()) when CONFIG_MEMORY_HOTPLUG is off.
Users believe KASLR will work fine by enabling CONFIG_RANDOMIZE_BASE.
In case of linear region randomization failure, I think at least users
need to know about this failure.
Can you share your thoughts on this please?

On Tue, Feb 25, 2025 at 12:28=E2=80=AFPM Ard Biesheuvel <ardb@kernel.org> w=
rote:
>
> On Tue, 25 Feb 2025 at 05:48, Keun-O Park <kpark3469@gmail.com> wrote:
> >
> > On Mon, Feb 24, 2025 at 10:21=E2=80=AFAM Keun-O Park <kpark3469@gmail.c=
om> wrote:
> > >
> > > From: Keuno Park <keun-o.park@katim.com>
> > >
> > > On systems using 4KB pages and having 39 VA_BITS, linear_region_size
> > > gets 256GiB space. It was observed that some SoCs such as Qualcomm
> > > QCM8550 returns 40bits of PA range from MMFR0_EL1. This leads range
> > > value to have minus as the variable range is s64, so that all the
> > > calculations for randomizing linear address space are skpped.
> > > As a result of this, the kernel's linear region is not randomized.
> > > For this case, this patch sets the range by calculating memblock
> > > DRAM range to randomize the linear region of kernel.
> > >
> > > Change-Id: Ib29e45f44928937881d514fb87b4cac828b5a3f5
> > > Fixes: 97d6786e0669 ("arm64: mm: account for hotplug memory when rand=
omizing the linear region")
> > > Signed-off-by: Keuno Park <keun-o.park@katim.com>
> > > ---
> > >  arch/arm64/mm/init.c | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > >
> > > diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
> > > index 9c0b8d9558fc..2ee657e2d60f 100644
> > > --- a/arch/arm64/mm/init.c
> > > +++ b/arch/arm64/mm/init.c
> > > @@ -290,6 +290,11 @@ void __init arm64_memblock_init(void)
> > >                 s64 range =3D linear_region_size -
> > >                             BIT(id_aa64mmfr0_parange_to_phys_shift(pa=
range));
> > >
> > > +               if (range < 0) {
> > > +                       range =3D linear_region_size -
> > > +                               (memblock_end_of_DRAM() - memblock_st=
art_of_DRAM());
> > > +               }
> > > +
> ..
> >
> > In most cases, the hotplug memory code will be working the same as befo=
re.
>
> How so? Such memory will usually appear above memblock_end_of_DRAM(),
> and due to the randomization, there may not be any space left there.

