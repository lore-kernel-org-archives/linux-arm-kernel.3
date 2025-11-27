Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08CA2D11183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 13:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m/HhN7PweXDCoHADbAO01OSEGdFHLn6AnoNvGrA1vak=; b=j/v1pFBMML8cV+eImlHymhqoU5
	saJ+i4mw7vmJIuZ0VLIrfTzzMury1FZR0DqUeOXVm/xXrMl+9inmmK2kp375xckYaHOfn7O4yDbsw
	bEYH1TL24zOvY+S0I2Qy4kbVfOiALJDn8oB3Skv81YC7CcUl7aEmq8jp5DKgG+V3f55KBkl8D3V68
	7OD82p6ou2+Nv1hksHNk51Jexuv6+TQy6w0Xt6V8vp6lxVc6rRT5j/cZLnxOEciXjuSLKS10qmPwW
	Fmu3SqdS/wlhu1EMNVGK/8qhl6YcH0Fp29vAJW66fkk0ebm/0FwxDxNNAB0R24LIyxzAvdxKOLQA+
	oW8NYkxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOcQ6-0000000GiUS-0fLP;
	Thu, 27 Nov 2025 13:52:26 +0000
Received: from mail-ot1-f53.google.com ([209.85.210.53])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOcQ3-0000000GiTw-3Svx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 13:52:25 +0000
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7c7533dbd87so636004a34.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Nov 2025 05:52:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764251542; x=1764856342;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m/HhN7PweXDCoHADbAO01OSEGdFHLn6AnoNvGrA1vak=;
        b=Fc0n4p+/YmaFmx8t7UpmmGCwaW6IAkohhub5Z1lsk/TqR0sTdpOehgsVMebV7G7qmr
         qprue4xtdNCwpvN0gr04vEuUiFrglni3qCO65PuPc9uqb01XS7XeBFMXEQdLJ3xF5X6K
         l3XzpjKdeimWm/75XcjBs3U8TG8kqkBGIopLm9HT47cyJ12YcVxQqhCkjXsgvt344Z7a
         yE6XDPm7A/OuxDWMVJHuQIIs++W7BPVc9Zikwi/NEEupa+3YULc5kyIPi3QFVuadw6vT
         6U4Ih5T2ypKZ4N7UVlhgFUGS909+AtkiaFK0N0PUbCAz5QAXWS//3F2EjSsX02MbWIAH
         0mpg==
X-Forwarded-Encrypted: i=1; AJvYcCWsik3ae2LcrVlpPWJl33cD/UKBmlav1N72rGO9nQGdgDDk/dfGeEO3YVXk6Q+WRYawAxhu6ETyEHVdciZOGEBd@lists.infradead.org
X-Gm-Message-State: AOJu0Yzc2iRg3LEA3Y9m/ozD54VEw4TbwuS6Czu7//EED+gPyZYhG9+F
	22Q63PepHBDuK71iSmfgrd45GuUy6iaQOdLwrxL8ahumWKhPd++wL0NXI5TINHe+
X-Gm-Gg: ASbGncvdMPtX0WykwvGYyEo9ka984lVH5I6hNaY5d9kybdoQs4C4BVbgiQXy66b+lhd
	Qz1WxQfTTn5zTFCfLvqhWLuYajrVo9wNWA6CAMyWdwl5HbVEmCzfox85WwFOEvjcAYE5uh7Tw+g
	UPqy7d5HYyn6PWk3W0DcuhtXznwjpDf6LnP05LRfa4WZlVqQ/1+GldW/vNgW8xHqIVDG/lzb6Xb
	nOCtc6Wc0FJrjeFhOBG8KcisZlqR3HNgACly4RO0BIUup6G/ItRek0o6nQXEuYSKiAi5ghoOFuk
	JRhv5zo4AOC7etapP3h/77SsFN8oqD9YZGPj4MTTfcVIP9VGvQpvZLa42KElxdI5VXp261S63PS
	TRsHFuXiymadI8LfGcwVAVFLw1iZHqLhI9VWQmbGPH8xOBxhcLr3eDtn+El4f4WBDQ/V3b0NS1K
	FAuih0jSq1Ua3xqWSNr01o98afWL8OcLrvAAXEn0/buTgvgwLDg0VI
X-Google-Smtp-Source: AGHT+IG1jVxjL4hsYf6wWifVv3hE3mGZKO1l4slmQCPQzRS+iW1wtzrE9Z5EC/A0EFioUg3Tww+OAg==
X-Received: by 2002:a05:6830:2b09:b0:7c7:69c8:2cb with SMTP id 46e09a7af769-7c7c439810fmr4770541a34.24.1764251542546;
        Thu, 27 Nov 2025 05:52:22 -0800 (PST)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com. [209.85.167.177])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-65933cedba1sm266116eaf.14.2025.11.27.05.52.22
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 05:52:22 -0800 (PST)
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-4510974a8cdso355920b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Nov 2025 05:52:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUAKzGTYRx7jLXXXj4e0zwSc7LbaoE9xduwwoeqye+OS+ViXaJQVzq0r4/7YU7XkHMIEvV7M348qhWLmhmW4lYH@lists.infradead.org
X-Received: by 2002:a05:6102:291f:b0:5db:ebb4:fde3 with SMTP id
 ada2fe7eead31-5e224274604mr3094319137.16.1764251214244; Thu, 27 Nov 2025
 05:46:54 -0800 (PST)
MIME-Version: 1.0
References: <20251126182257.157439-4-krzysztof.kozlowski@oss.qualcomm.com>
 <20251126182257.157439-6-krzysztof.kozlowski@oss.qualcomm.com>
 <CAMuHMdX7t=mabqFE5O-Cii3REMuyaePHmqX+j_mqyrn6XXzsoA@mail.gmail.com>
 <dbb94fb1-2f78-4bd2-9254-c435ab3325c0@oss.qualcomm.com> <0e90817e-1c05-4fa3-a6fd-8e755608a2c9@oss.qualcomm.com>
 <CAMuHMdX2qv2YBbvkM8tkSTWDPe-paMp5=fdv=4tGKheTseK9Pw@mail.gmail.com> <ebb0d41c-1836-42d1-8406-ead97c4d6886@oss.qualcomm.com>
In-Reply-To: <ebb0d41c-1836-42d1-8406-ead97c4d6886@oss.qualcomm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 27 Nov 2025 14:46:43 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUF9nTRkOOi+KnH2ATsFdTWMCtohWZQ1T_vhB=cf_42Yg@mail.gmail.com>
X-Gm-Features: AWmQ_bmuZJ1L1xbNpDXxY3ptFDbRDwAIihpcjmcYa3Px9900l5_objftbJng000
Message-ID: <CAMuHMdUF9nTRkOOi+KnH2ATsFdTWMCtohWZQ1T_vhB=cf_42Yg@mail.gmail.com>
Subject: Re: [PATCH 3/3] i2c: rcar: Fix Wvoid-pointer-to-enum-cast warning
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, linux-i2c@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_055223_900187_CDB715D4 
X-CRM114-Status: GOOD (  44.61  )
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

Hi Krzysztof,

On Thu, 27 Nov 2025 at 14:42, Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
> On 27/11/2025 13:52, Geert Uytterhoeven wrote:
> > On Thu, 27 Nov 2025 at 12:48, Krzysztof Kozlowski
> > <krzysztof.kozlowski@oss.qualcomm.com> wrote:
> >> On 27/11/2025 12:42, Krzysztof Kozlowski wrote:
> >>>>> --- a/drivers/i2c/busses/i2c-rcar.c
> >>>>> +++ b/drivers/i2c/busses/i2c-rcar.c
> >>>>> @@ -1141,7 +1141,7 @@ static int rcar_i2c_probe(struct platform_device *pdev)
> >>>>>         if (IS_ERR(priv->io))
> >>>>>                 return PTR_ERR(priv->io);
> >>>>>
> >>>>> -       priv->devtype = (enum rcar_i2c_type)of_device_get_match_data(dev);
> >>>>> +       priv->devtype = (kernel_ulong_t)of_device_get_match_data(dev);
> >>>>
> >>>> Any specific reason you picked "kernel_ulong_t" instead of "unsigned long"?
> >>>> The former seems to be the least common option.
> >>>
> >>> As I wrote in the first patch, because to my knowledge it is the
> >
> > I don't see that written in the first patch; it has the same patch description
> > as the other patches in the series (mutatis mutandis)?
>
> https://lore.kernel.org/all/20251126182257.157439-4-krzysztof.kozlowski@oss.qualcomm.com/
>
> I meant that brief statement in the patch changelog.

Sorry, I had missed that, as I don't read patches for foreign hardware,
and had just b4-am'ed the series, and compared the two commits.

> >>> preferred form for holding driver data which are in general pointers. We
> >>> do not store pointers as unsigned long. It is also already used for the
> >>> driver data types - see include/linux/mod_devicetable.h.
> >>
> >> ... and in case it is still not obvious: I do not cast here to final
> >> type, because that cast is the reason for the warning.
> >>
> >> I cast to an intermediary type to help compiler suppressing the warning
> >
> > I know...
> >
> >> - to integer representing the pointer. Unsigned long is not representing
> >> pointers in the kernel. Integer type representing the pointer is
> >
> > "unsigned long" indeed does not represent a pointer, but in the Linux
> > kernel, it is guaranteed to be the same size as a pointer.
> >
> > '"unsigned long" is superior'
> > https://lore.kernel.org/CAHk-=wj2OHy-5e+srG1fy+ZU00TmZ1NFp6kFLbVLMXHe7A1d-g@mail.gmail.com
> > (he doesn't seem to have said anything about kernel_ulong_t)
>
> Yes, that was again comparing to uintptr_t, so we both agree.
>
> >> kernel_ulong_t, I think.
> >
> > include/linux/mod_devicetable.h:typedef unsigned long kernel_ulong_t;
> >
> > IIRC, it was introduced originally because "unsigned long" might have
> > a different size in userspace.  Nowadays (for x32), uapi uses
> > __kernel_ulong_t, though.
>
> Maybe, but if you look at the data structures all have kernel_ulong_t,
> so this fits the logic I was following here - I cast to the type which
> is both representing pointer and is already used for driver data,
> because this match data serves similar purpose as mentioned driver data.
>
> I don't mind casting via unsigned long, but:
> 1. these are old and trivial issues,
> 2. they are quite annoying when people want to compile test with W=1,
> 3. I was trying to fix them (although not sure if for I2C) already,
> 4. and some others probably as well were trying to fix them,
> so how many people need to send them and debate before we fix them finally?
>
> unsigned long vs kernel_ulong_t is a nit-style discussion IMO, unless we
> have here more concrete arguments, e.g. statement from Linus that
> kernel_ulong_t is wrong.
>
> If maintainers of this code want unsigned long, please apply the patch
> and fix directly, but for the sake, let's get it merged...

Sure, let's get it fixed!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

