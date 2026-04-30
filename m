Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EC0AFF8875
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 01:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aLow3HQFoJVLOLNB41BTbY1U/5FqL+LxoPbJhmXQezc=; b=veqCRTFa6LOOlOfkBwhPdsexYq
	Z52wj6DXN7Z20vGdJogx/utz+49QAjvhhhKb8rFogPOOa1Jne5jW+93lw4Sd0pEB1+moRr1zynDFT
	iE0jPI+urtZxp4bywpt5KqFW8vUZmdqYM2kgctHvKYoHdWatgOBEchOkh9oXFBeY88eBI6D0ytpmU
	29tUim72ZooE0+FR+EqQ4rMqlAWLuUXv7WH6TdsKCdOamZbYUh9Caa3g5JdnckPoZ5lnInVw0uxff
	vgsI5wnVjx5KvMqlrsVrRaVjJGCkZYPMn6n8ZPIridhVoDJMOpqr0uzBjf8Bz1jtx5i2LpmaIrtH5
	gyLVklAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIGds-00000004Oho-29a0;
	Thu, 30 Apr 2026 01:56:40 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIGdp-00000004OhR-3z7j
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 01:56:39 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-5a749f4de6dso34812e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 18:56:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777514195; cv=none;
        d=google.com; s=arc-20240605;
        b=Wv6x3JI0R3dIQdzuIUyB52Mlvbg07MkBNCzLGCme/y0+UklQQf5K/JShs8tyqHNAWv
         O15QCHOU93BJ3K7NehD6+97e8IgDxCbvcUVF4c6j38IjyAPE9juCtG4slZlz7UQjpdWu
         O8uQ/dDVSrmiJNPL+SiK4ZgsqkcVCsOLfckujXAudrm2faoOuEdSuPHs1QmbIQh4cXW+
         C0hJRnw/iozvChtKSrzVIZrOVlHJoongyROGfYH8QBldFPKRTX6sKdd/hFeKjpCLZrjE
         Jufa4S2Er7NsOKH1BI73+O9Hzbledg4W4ph3ijeoyfq+ynWA8lOKrkLpBdQ6aa7ZU12A
         8Qrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aLow3HQFoJVLOLNB41BTbY1U/5FqL+LxoPbJhmXQezc=;
        fh=VUv/ch2CicP3U403xXGhy48BZFU48IzmmRm+tb1bEFw=;
        b=UFin+j1VguruqyGuLdQf7Fmh6l+/Qrf2WRWy+EPddnvXGReklieRijPv5VcsNcfzS6
         LxpTFaMI4jutMC++RvWc2RCbf99QKbqqjGR3YB7t/txVq2b7i4rTQHfXYKYWk7ODl8iG
         kDN/l8zreifeIXUTMFnyOD8bpU07SQA5tfiPwHuEIua/X83EURX4qB5HMX8b0oqiqrOR
         V+M30eKUwelpWvkFrzPjV/MmnJAZdFau9Ad58KpXyLvlnDQFkBk1u8mlyI2orNm8Muxy
         cYfMClAYJfn4Qc+ProX4eeTU0XsSYWfHQdn9yEHWUUMWhKX6tLIrG+UBBqkPZMS+Xv+e
         DFww==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777514195; x=1778118995; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aLow3HQFoJVLOLNB41BTbY1U/5FqL+LxoPbJhmXQezc=;
        b=tJ4NWg05GvUO0L+DTYLvuSPFmCRLSXhWeaVxGZDK6LzgWg0qxZ7qlMs6sNFEMzw7h7
         9RHUw4uDh+uhX/SrQou0qXknVCe5FmOFQuwSSQmoXU6i45QOwIN3xg+FgHbTed4R/L7U
         BmtVlsdw7kkb7yynqai4wYE9DfkQl7DTymtDkTxxK6o+4+fNhyb2R6Ebo38/cxMed6AG
         +QMaCjT4aFTstyCM+4c4qdvbf8QDfthUwOtIlq1Rot02DNsdsZMVIXEdQxr9fxBsM749
         4xrN9vmBUDrD9eB9BnN0dT+9IXhOY6Krex98kGt1B5rhuRM4cwWjF4Ebqx3nvelJP6ME
         xksg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777514195; x=1778118995;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aLow3HQFoJVLOLNB41BTbY1U/5FqL+LxoPbJhmXQezc=;
        b=Xq0nMIcYSdwlvvcPDu5h/Sbew3gKb1RsK+EdpPzcmetlrhtm3owxtgQAnxIrO4iqJ0
         XRmY8Rvbx8mrH6mnYgX/2xXojD05hLf63rK7BkRAUbl/wVl9mug7UCL2NJ1qwzXmbBle
         O4J/9dLHhhmmxS7F8lN59+CHb885k6J/+pGvKrKcdn0bz8Q089dtEYA7ZvGri2ozoWBS
         TOtQizh68m2r/jBMowACeOfSraurmrklYz9aO48a3cBWr5HBytTF/qI6ahz2O2L/Klmh
         K6KdnzsmNnoGQMhiOtOJoRTP9WJEQ+RwWqKs4/Oq3LmqWy1b3+sw0fHWGnLI7RdRySL6
         1WdA==
X-Forwarded-Encrypted: i=1; AFNElJ9qBHGiOMZTyqR5l0/sBUZfP2IEcgndauNmk5iicPZtQmgLAnotuWOjt41a1CtpWEHCNmMB0KmUhTvg8/uIyP/z@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8nuaZseTWm7yGjz46U+Fm+MlHNBuA5WB6kToqeCrSW1KtIDUI
	J6i4d0TfzKHbXrXPUthI8V0WYLkI4F8ur8ctdQuQMuQuKLNJ3xcjmz/1lS9gncUp3EnO0IVhEbM
	opSH441PXg3p443TQ6twKbnFyLDOfIu3KH057
X-Gm-Gg: AeBDiesYcBPh0nHw/alYZRmshJZApuDQqGRA+osa6BJdBtL+kzeE6SUF5KhuHTYXCZQ
	3Nq7AhviUY1Lq67gefvCDcLNoW9cdqyLWpYgU1OtGlbVtqbalpx0s4SPN9P3uYSnCjbtynrfIcD
	efSTJHYn/DtJlmZ6HXShHunOax/Xp9WHLMAstisaIJnUqiwIwG65GM5AnL3nZmH99woPEXjBZH1
	i5svAXd0dAvSHtyuYdt4v3ybnnTJUbBIV4HZZ+Wo97yVUjCqsQ3vzUZfrg0x2RQIRHoGZVSevk8
	7DHwOMIGOwMFA3fVw2E=
X-Received: by 2002:a05:651c:515:b0:38e:827b:98ee with SMTP id
 38308e7fff4ca-3934e278af6mr1116541fa.8.1777514194963; Wed, 29 Apr 2026
 18:56:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260429061752.2880923-1-zhaoyang.huang@unisoc.com>
 <8fcde357-aaa1-4bd2-a8b3-d660b94a38c6@app.fastmail.com> <CAGWkznGtGB58AZcwD51qfrFRcV5F060pH4ytyXXCuX6SxJNBOw@mail.gmail.com>
In-Reply-To: <CAGWkznGtGB58AZcwD51qfrFRcV5F060pH4ytyXXCuX6SxJNBOw@mail.gmail.com>
From: Zhaoyang Huang <huangzhaoyang@gmail.com>
Date: Thu, 30 Apr 2026 09:56:22 +0800
X-Gm-Features: AVHnY4I8qIKxEMUaztNcU2IjPxzVAlr4KMfaGlPG8Yzcc1cvaCkN3LMhfiRQkrE
Message-ID: <CAGWkznHXAyr05NrwD3TqY_jMO6_AieE8KUZRpqF++icrbB=HEA@mail.gmail.com>
Subject: Re: [PATCH] arch: arm64: fix KERNEL_SEGMENT_COUNT error
To: Ard Biesheuvel <ardb@kernel.org>
Cc: "zhaoyang.huang" <zhaoyang.huang@unisoc.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, steve.kang@unisoc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_185638_027762_D03040B4 
X-CRM114-Status: GOOD (  32.12  )
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

On Thu, Apr 30, 2026 at 9:29=E2=80=AFAM Zhaoyang Huang <huangzhaoyang@gmail=
.com> wrote:
>
> On Wed, Apr 29, 2026 at 5:28=E2=80=AFPM Ard Biesheuvel <ardb@kernel.org> =
wrote:
> >
> > Hello Zhaoyang,
> >
> > On Wed, 29 Apr 2026, at 08:17, zhaoyang.huang wrote:
> > > From: Zhaoyang Huang <zhaoyang.huang@unisoc.com>
> > >
> > > During debug of a kernel panic, we find that the pte_t of the final
> > > part of [data, end] segment got overflow to the next page of
> > > init_pg_end[1] which is the gap page before early_init_stack[2].
> > > This should be introduced by the KERNEL_SEGMENT_COUNT's value is 5
> > > which should be 6 as map_segment are called 6 times for the segments
> > > of (text, stext, rodata, inittext, initdata, data+bss)
> > >
> > > [1]
> > > crash_arm64_v9.0.1> vtop ffffffed00601000
> > > VIRTUAL           PHYSICAL
> > > ffffffed00601000  83401000
> > >
> > > PAGE DIRECTORY: ffffffecffd62000
> > >    PGD: ffffffecffd62da0 =3D> 10000000833fb003
> > >    PMD: ffffff80033fb018 =3D> 10000000833fe003
> > >    PTE: ffffff80033fe008 =3D> 68000083401f03
> > >   PAGE: 83401000
> > >
> > >      PTE        PHYSICAL  FLAGS
> > > 68000083401f03  83401000  (VALID|SHARED|AF|NG|PXN|UXN)
> > >
> > >       PAGE       PHYSICAL      MAPPING       INDEX CNT FLAGS
> > > fffffffec00d0040 83401000                0        0  1 4000 reserved
> > >
> > > [2]
> > > ffffffed002c8000 (r) __pi__data
> > > ffffffed0054e000 (d) __pi___bss_start
> > > ffffffed005f5000 (b) __pi_init_pg_dir
> > > ffffffed005fe000 (b) __pi_init_pg_end
> > > ffffffed005ff000 (B) early_init_stack
> > > ffffffed00608000 (b) __pi__end
> > >
> > > Signed-off-by: Zhaoyang Huang <zhaoyang.huang@unisoc.com>
> > > ---
> > >  arch/arm64/include/asm/kernel-pgtable.h | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/arch/arm64/include/asm/kernel-pgtable.h
> > > b/arch/arm64/include/asm/kernel-pgtable.h
> > > index 74a4f738c5f5..14dd1c52552a 100644
> > > --- a/arch/arm64/include/asm/kernel-pgtable.h
> > > +++ b/arch/arm64/include/asm/kernel-pgtable.h
> > > @@ -64,8 +64,8 @@
> > >  #define INIT_IDMAP_FDT_PAGES (EARLY_PAGES(INIT_IDMAP_PGTABLE_LEVELS,
> > > 0UL, UL(MAX_FDT_SIZE), 1) - 1)
> > >  #define INIT_IDMAP_FDT_SIZE  ((INIT_IDMAP_FDT_PAGES +
> > > EARLY_IDMAP_EXTRA_FDT_PAGES) * PAGE_SIZE)
> > >
> > > -/* The number of segments in the kernel image (text, rodata, inittex=
t,
> > > initdata, data+bss) */
> > > -#define KERNEL_SEGMENT_COUNT 5
> > > +/* The number of segments in the kernel image (text, stext, rodata,
> > > inittext, initdata, data+bss) */
> > > +#define KERNEL_SEGMENT_COUNT 6
> > >
> > >  #if SWAPPER_BLOCK_SIZE > SEGMENT_ALIGN
> > >  #define EARLY_SEGMENT_EXTRA_PAGES (KERNEL_SEGMENT_COUNT + 1)
> >
> > I think the better fix would be
> >
> > --- a/arch/arm64/include/asm/kernel-pgtable.h
> > +++ b/arch/arm64/include/asm/kernel-pgtable.h
> > @@ -68,7 +68,7 @@
> >  #define KERNEL_SEGMENT_COUNT   5
> >
> >  #if SWAPPER_BLOCK_SIZE > SEGMENT_ALIGN
> > -#define EARLY_SEGMENT_EXTRA_PAGES (KERNEL_SEGMENT_COUNT + 1)
> > +#define EARLY_SEGMENT_EXTRA_PAGES (KERNEL_SEGMENT_COUNT + 2)
> Thanks for the comment. This makes sense since KERNEL_SEGMENT_COUNT is
> also used for defining vmlinux_seg[] in declare_kernel_vmas.
Is the following fix more reasonable, since it makes both map_segment
and declare_kernel_vmas compatible with the value 6?

-/* The number of segments in the kernel image (text, rodata,
inittext, initdata, data+bss) */
-#define KERNEL_SEGMENT_COUNT   5
+/* The number of segments in the kernel image (text, stext, rodata,
inittext, initdata, data+bss) */
+#define KERNEL_SEGMENT_COUNT   6

 static void __init declare_kernel_vmas(void)
 {
-       static struct vm_struct vmlinux_seg[KERNEL_SEGMENT_COUNT];
+       /*
+        * [_text, _stext) is mapped in init_pg_dir seperatly while they go=
t
+        * merged into one here
+        */
+       static struct vm_struct vmlinux_seg[KERNEL_SEGMENT_COUNT - 1];


> >  /*
> >   * The initial ID map consists of the kernel image, mapped as two sepa=
rate
> >   * segments, and may appear misaligned wrt the swapper block size. Thi=
s means
> >
> > and add a line
> >
> > Fixes: 5973a62efa34 ("arm64: map [_text, _stext) virtual address range =
non-executable+read-only")
> >
> >

