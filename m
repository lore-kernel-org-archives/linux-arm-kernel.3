Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C23FDC61DBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 17:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+C3oMNTxKING+oxnIVuwTvyrIfPtnlGjd1Gmndygo7I=; b=xJUHmM1Hm3F7WoUVE7PB2uuzAm
	YeH8OUY4AP2xbomZfIu7iDyuc+/QrPavrnnfLcqDLawvnGcOH8kAfO4r+wdC1H8whDmh3hsYYCeCI
	KDxnDRB7VZKRND0NfXjjTEhFxFhBFgizOyOp7FRX8mRjJ+HwV+XyzvEmSj0q+rPX3h6igp+sG3fJo
	Zb8Hqu1HXfq2I0fxWfhKOHut+CoX1wTQs/uEjUbLLjM+IRqzQ4zoi+t5snWVY34YJkhGe8+vuFJqN
	1jojLLknffMGDK2eyanAeTnuYIRKWGFI6IsdPJpRrDzZnT59Kss/98JfW7WrIkNkMur+sN3hj8C4U
	U8y+l1Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyv1v-00000001Dvj-1TOU;
	Tue, 25 Aug 2026 17:33:47 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyv1s-00000001Dv1-2TdC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 17:33:45 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4954a9e8490so6686165e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 10:33:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787679221; cv=none;
        d=google.com; s=arc-20260327;
        b=lVhqLlimx/qKUSZwh/fOPUfQ4c6cf0hl5ujk8/WJGkLlOUd7IQ/fsGIKbs61+1l425
         9eZUonEvCB9Jxx3MSzy/rB1UlYyStfynriXnDdutdSjDsLYICaSCVRUHVMNOcbQxEEg0
         19WDJgTHEV8NxA1Gb0e2peZfXK6f/OvGCT5+gNYMJhTBaCoWVB+QPUPSYkZ0k8ie8zmv
         FOAaS95yQfJfWC4DsTrl0D6X+bgaC41ipCDIHAmGNlS8pY9kJGMaWrnjQWPyYxBPc53f
         /5CzgLoAyS9S91VC0CUSyyOgY/lA3t2ZTbT7peLzZfSIBjPBpOoe8Co1jBwhP/UPJQqC
         fOPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+C3oMNTxKING+oxnIVuwTvyrIfPtnlGjd1Gmndygo7I=;
        fh=WkTZNgIDaMfNa4ndPAuAAwr+pMMmdn1XTdQIK1V9mLg=;
        b=gRWYGr6RnxFfC0cSwhTp7/n394+fixqnSPE1Q+cT0vbMFxE9ZALg0wmWGxsJEe9wmD
         f/bBH0r0ojiBfo93MlowkBMoI94lRRhBK16nYV7IPNQmYsmzmfqbhWQCACdZM5BsanmG
         0p34V/jq+H2XAVS4dGv+SBEDJDjcO8Qe4sN/QMzcyDzPQEJWJ2YtY0vG3Lk2AaIjQ2ah
         MTJtMgwohEDwDfRZfodnExP35OwP30/ccrsi1C33Fs5jxosTawFaqcASydW3nr33xLvE
         hI8TdXxcWXVXVw8V3PoEKQGpT2mXwwvXedLGqya6TTRaq2i4b7cM2ezk4CgWnhK5v7ON
         TeFw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787679221; x=1788284021; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+C3oMNTxKING+oxnIVuwTvyrIfPtnlGjd1Gmndygo7I=;
        b=I6G5rRxea5pLKR05QxerGnevL3TMHulY4j7BGlXtrps/LezzLKxcu1tRN6xIv1NweK
         TidmbGEWK0il/fxeaca+Sp5/6ktjOHP3xMJg37TmPqtNVtDaDivuNBhQOi2VOgbg1kUB
         58DkJOpX81JnrCY2Z6tfLjNcuUlpXDb6WEDhR1EOGOd/UB1Wvwq8seYFHP6RzuUh6WaQ
         UVAoarx+fHtntRRfJDxqY7pWR3AYgKdsNAs0w6zND60shVgU9efOcAGbTcFIM/Au5pdP
         aa91Ju2infPfLp6gtI17/lXIv7KW08mMB5pmMuT8E37tbpiw+M5lb9I+OKLaRMcxoi94
         db6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787679221; x=1788284021;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+C3oMNTxKING+oxnIVuwTvyrIfPtnlGjd1Gmndygo7I=;
        b=HJhYgw8mJG0YLzU4ikBxYtOJtvZUM7yZG5jLsJ8N5XF/y9HOZW4rkz9Eiy9BIbOC2d
         vEhONxeXaO3N6JThAig7gDxGmBe7aZhpp8kE9awjaacx4qACmFrb6bsAiNdpnXIf+KND
         7E3i9q0tSXtc/JXAFD4TMEWIUBEw7fr9/qRbXchNkVn+5O31W7EH4MsgiCxSRMpwnIsj
         0K6q2io0LhMrcvDXzVtEnxQBilBcVmPjHgrMzEPwIuN1Vk0fu1XNJr6P/KlE8zZc4JDD
         fuWYZb1SjkBDRAWmHtJDI/+/qIv5V1c/3Fze8mgUwVnb9eHcGXJ15Gr/MJN5SRquF/6M
         QlVQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpl48eHXLWUnMKxlP3X1AgCGi0GHxcmT+sq6mjSMHaghn2kqwEJeb5E7B5tJAondjZ8SOpCP7Nmn4OPUlIrUcgp@lists.infradead.org
X-Gm-Message-State: AFuF++kV0v9QMbRA05tbdBOrN7EeXw+rFIZLBxoiCRQRNSDqwG2KsuBR
	1RY3ptPu3Ivj3k4albHhk7QUBlbxO42P3381qZbZ9ZQb6cNYD+IcvG1lIl0mpeAeoS+Ix/c2GPd
	SO4D9IGZu47dzuYYFrXq2Fg4XJHUsQ1RjuLPNW5hQIdn48xCi/56zXF3paAI=
X-Gm-Gg: AR+sD12R5suQrprbSeGJF5cqLWOxXnlunD0sG2VCwwux14/BoHLEfCCcF60np+o8EH4
	KSrhYDZ63H8bFxo5Bq+X47kPfaRohi5uXlcdPlVw8kM2etPEM/2qqmtAAB7xsclTfUdOq++EW3s
	adejPgKC6gyverlRWxjs4ddH0BREpV38alXiSARqoiQzS7/QEdCPjDWhe5GeXLH4Sze9ICFlbGD
	SRPwBYkFWD7YBPxZGkqFHOcFPsgpUf/nJBkbVaVkM4YxAeMWszkQQNlvhaY2PH4WzO4frGHunh7
	1P6KPv7KDTuvYtMnaNU/N/9SLRpNkX1KBlgivt/1XGJvJzKWyYQBj5SWudyfWVuzkgX9WG4BEu4
	f71axyygAoU/IF8lP+sSLjwAlCe/PvUbwgEt1mjw10Z3srpvAdio6YTmJFHdDYQ==
X-Received: by 2002:a05:600c:4c9a:b0:499:b81d:f580 with SMTP id
 5b1f17b1804b1-499d630abbbmr70390245e9.2.1787679220347; Tue, 25 Aug 2026
 10:33:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260718111340.159896-1-linux@yoavmoshe.com> <CABCJKudqGL+BFFcz3qsuoJB6S_OAt-vs2yqePC_=oy+JzmPpVw@mail.gmail.com>
 <3046e60d-509f-471f-bd15-3ce78c87500b@yoavmoshe.com> <20260721180950.GA3684684@ax162>
 <180001f5-bddd-4e58-8442-f7ef3c979500@yoavmoshe.com> <CABCJKufhvTxmVm8y7xr4RWWKsoZk0h8UGBnem+F5fknnimaqPA@mail.gmail.com>
 <7f273a08-b29c-4e15-b340-898b251efe57@yoavmoshe.com> <CABCJKud+GsBVv+XMTsi_4QAaTHo7jXD2Hyvi9wqKd7x3i2xyAg@mail.gmail.com>
 <415ffa24-a30b-43b2-aa6a-a1cde3bd4ef0@yoavmoshe.com> <CABCJKud9B8vB-J8f0HLHw6EgEKVWzy+Q1PrNxpO_6yCGtEyi8A@mail.gmail.com>
 <12a46993-82a5-4109-87fa-61b8fcf764aa@yoavmoshe.com> <CABCJKufoQ0fX797M01t7CkTgMEwNCELY1=ptZsxr=jWOR-KAyA@mail.gmail.com>
 <CAKwvOdnaOy-nyZ=8oLw4N-_hA9JZVdP2BhR8cweCAOhsy4VG6w@mail.gmail.com>
 <91cb0f21-e78a-4931-b123-937c6a01592c@yoavmoshe.com> <CAKwvOdk-JmqjhZWBiLjXTxKhEV+T3BAB6An+3Ara8oybmhAMpA@mail.gmail.com>
 <da6bffba-6c44-4ee7-a1a8-842f9e6de408@yoavmoshe.com>
In-Reply-To: <da6bffba-6c44-4ee7-a1a8-842f9e6de408@yoavmoshe.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 25 Aug 2026 10:33:28 -0700
X-Gm-Features: AcwNN1VhEAk5JMtsG9Q-WQf39WhqqMQXw7xm3opvD6bBF_aO5cN6dQw8NYVOTcc
Message-ID: <CAKwvOdmT=Q+etTTJUna4ZAg1=eXwaT9cSDy=U0s15UT-3TOu1Q@mail.gmail.com>
Subject: Re: [PATCH v3] ARM: imx: Fix suspend/resume crash with Clang CFI
To: "Yo'av Moshe" <linux@yoavmoshe.com>
Cc: Sami Tolvanen <samitolvanen@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Russell King <linux@armlinux.org.uk>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, 
	stable@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_103344_699559_5A56FE75 
X-CRM114-Status: GOOD (  39.88  )
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

On Mon, Aug 24, 2026 at 7:10=E2=80=AFAM Yo'av Moshe <linux@yoavmoshe.com> w=
rote:
>
> Sorry it took so long, I finally got it to work using your method!

Great! (It's somewhat funny to me the level of effort going into this;
I love it. Keep up the good work).  It's also good to hear that we can
keep this working _with_ CFI still enabled.

>
> On 2026-08-17 11:58 PM, Nick Desaulniers wrote:
> > Can you share that diff? I would have expected that to work. Perhaps a
> > minor mistake in your implementation?
>
> I started with something very simple: using SYM_TYPED_FUNC_START and
> copying the 4-byte hash into OCRAM before fncpy(). But that didn't boot
> on my hardware (Kobo Clara HD, i.MX6SLL).
>
> I think the issues were:
> 1. My first attempt wrote the hash to suspend_ocram_base +
> sizeof(*pm_info) - 4, which I suspect overwrote the last member of
> struct imx6_cpu_pm_info, corrupting the memory controller setup.
> 2. Moving the hash after pm_info and offsetting fncpy by +4 still failed
> =E2=80=94 I think because fncpy requires 8-byte aligned source and destin=
ation
> addresses (FNCPY_ALIGN, with a BUG_ON check).
> 3. Offsetting by +8 for alignment also failed. I suspect it is because
> SYM_TYPED_FUNC_START emits the 4-byte hash after the .align directive,
> which shifts the imx6_suspend label out of 8-byte alignment, again
> triggering fncpy's source alignment BUG_ON.
>
> The version that finally boots on hardware emits the hash manually with
> explicit alignment padding, instead of using SYM_TYPED_FUNC_START:
>
> diff --git a/arch/arm/mach-imx/pm-imx6.c b/arch/arm/mach-imx/pm-imx6.c
> index a671ca4..b500922 100644
> --- a/arch/arm/mach-imx/pm-imx6.c
> +++ b/arch/arm/mach-imx/pm-imx6.c
> @@ -515,7 +515,7 @@ static int __init imx6q_suspend_init(const struct imx=
6_pm_socdata *socdata)
>         pm_info =3D suspend_ocram_base;
>         pm_info->pbase =3D ocram_pbase;
>         pm_info->resume_addr =3D __pa_symbol(v7_cpu_resume);
> -       pm_info->pm_info_size =3D sizeof(*pm_info);
> +       pm_info->pm_info_size =3D sizeof(*pm_info) + 8;

I wonder if it would be better to modify the `struct imx6_cpu_pm_info`
struct definition instead to add explicit padding there?  The comment
below about reserving padding seems to make more sense for this hunk
here than down there.

Like add a `u32 cfi_type;` member last, maybe?  That's not 8 bytes,
but I think it fits in the padding, then you might not need +/- 8 in
your pointer arithmetic anymore? I _think_.

>
>         /*
>          * ccm physical address is not used by asm code currently,
> @@ -568,10 +568,16 @@ static int __init imx6q_suspend_init(const struct i=
mx6_pm_socdata *socdata)
>                         mmdc_offset_array[i]);
>         }
>
> +       /* Reserve 8 bytes between pm_info and the function copy in OCRAM=
:
> +        * 4 bytes padding + 4 bytes kCFI type hash, so that the hash sit=
s
> +        * at fncpy_dest - 4 and fncpy_dest remains 8-byte aligned. */
> +       *(u32 *)(suspend_ocram_base + sizeof(*pm_info) + 4) =3D
> +               *(((u32 *)&imx6_suspend) - 1);

This is incredibly hard to follow.  This is copying the hash, not
reserving anything?

Is cfi_get_func_hash() something we can use here?

```
#include <linux/cfi.h>

#ifdef CONFIG_CFI
    // Make sure to clear the thumb bit!
    pm_info->cfi_type =3D cfi_get_func_hash((void
*)((uintptr_t)&imx6_suspend & ~1));
#endif
```

then remove the below hunk?

> +
>         imx6_suspend_in_ocram_fn =3D fncpy(
> -               suspend_ocram_base + sizeof(*pm_info),
> +               suspend_ocram_base + sizeof(*pm_info) + 8,
>                 &imx6_suspend,
> -               MX6Q_SUSPEND_OCRAM_SIZE - sizeof(*pm_info));
> +               MX6Q_SUSPEND_OCRAM_SIZE - sizeof(*pm_info) - 8);
>
>         __arm_iomem_set_ro(suspend_ocram_base, MX6Q_SUSPEND_OCRAM_SIZE);
>
> diff --git a/arch/arm/mach-imx/suspend-imx6.S b/arch/arm/mach-imx/suspend=
-imx6.S
> index 63ccc2d..c06e474 100644
> --- a/arch/arm/mach-imx/suspend-imx6.S
> +++ b/arch/arm/mach-imx/suspend-imx6.S
> @@ -3,6 +3,7 @@
>   * Copyright 2014 Freescale Semiconductor, Inc.
>   */
>
> +#include <linux/cfi_types.h>
>  #include <linux/linkage.h>
>  #include <asm/assembler.h>
>  #include <asm/asm-offsets.h>
> @@ -148,6 +149,15 @@
>
>         .endm
>
> +#ifdef CONFIG_CFI
> +       /*
> +        * Emit kCFI type hash before imx6_suspend with padding to preser=
ve
> +        * the 8-byte alignment that fncpy requires for the source addres=
s.
> +        */
> +       .align  3
> +       .4byte  0
> +       __CFI_TYPE(imx6_suspend)
> +#endif
>  ENTRY(imx6_suspend)

Should you replace ENTRY (and everything you added to this file) with
SYM_TYPED_START?  Or perhaps we should add a new macro to cfi_types.h
for this?  ENTRY_TYPED or something?

>         ldr     r1, [r0, #PM_INFO_PBASE_OFFSET]
>         ldr     r2, [r0, #PM_INFO_RESUME_ADDR_OFFSET]
>
>
> > How did you verify this? Can you share the command line invocations and=
 output?
> I tested each iteration on postmarketOS by building the kernel with
> pmbootstrap (Clang/LLVM, CONFIG_CFI=3Dy), replacing the vmlinuz on the SD
> card, and booting the Kobo Clara HD. The earlier attempts all failed to
> boot (though they worked fine in QEMU, which doesn't emulate the i.MX6
> MMDC hardware I guess?).
>
> I'm not really sure which approach is better now. The version above
> preserves CFI on the indirect call, but it's quite involved compared to
> the v3 __nocfi wrapper. If you think this is the better way to go, I'm
> happy to clean it up and resubmit as v4.

I do think it's better, but probably still needs revision.

FWIW, I still have a bunch of i.mx8 family boards in a box under my
desk.  I have a wafer gifted to me from my best man that we think is
some i.mx chip from his time at NXP.  Out of nostalgia for that line,
let's get this wrapped up neatly with a bow.

>
> Yo'av



--=20
Thanks,
~Nick Desaulniers

