Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 246A1D11183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 12:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bjYT7JRJe3Gqrk9ZtGCdcYVgPeOXASFBXLgUHTdPheE=; b=LG6HfN9P5xcdSZ+/F6XOYrT3cD
	mAzJnQg6qY8NSamBehLyAEMJG9CUNvp39MCGUjddlUH2pNr13OHrjfTsZZ23VxipteUFzifShaC8Q
	mmVbrVaRFQBmMydl85NPuF45vxxIz40dWDSEkIqsBYRMxB80tnibAA0XiDZhx2GDuam0iU/25duZi
	kZSfd/4f+kKJ2VYfSxWIy44B9DXYRDQ8VwvKX40YCffHalGYTvMGPz2xeS3HBlYSI1mdUYD6vfD57
	93P6vBg7cbjlCi+nChbrU5uoQEbKLhOiOqzUdTmXTk9f5ytvbmpaOHbQGi1E7yh2zBjalLTVfZFsG
	tVkUxieA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vObZb-0000000GcrG-3Gby;
	Thu, 27 Nov 2025 12:58:11 +0000
Received: from mail-ot1-f46.google.com ([209.85.210.46])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vObZY-0000000Gcqh-2Oyz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 12:58:10 +0000
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7c6e9538945so1004517a34.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Nov 2025 04:58:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764248287; x=1764853087;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bjYT7JRJe3Gqrk9ZtGCdcYVgPeOXASFBXLgUHTdPheE=;
        b=XJi3c9FdRyWlTurASOfxBxa0qeLzLXodzKtT6apXN/5xDbdoRK6DaT2aet+uO1+Gwh
         LSqd423pkqmjFqNqBxTd5gXcQf65lSs+ef4fIEJfyA0O4bySBOrZ795LiMY2WAc/cpDs
         g+fGV6r01LLrsxN1ZvFEUY7kuL2huJyP5voL9qsgq4n/++evw3H83Ayuj+cI5yJ/nbjl
         j85o149XHGsnVsDldJHaSw8ejOWMQD6ODWxeXB/XY1T+1XnOgHki0+waO7n+X3ez6XzY
         L2o/VKphm9utIJDUvcGJu4jj/vvxijv0OfAzQ13RwVSJJC1ocOjddX4C+198tsxkCWwy
         zctQ==
X-Forwarded-Encrypted: i=1; AJvYcCVikEgvAmgskJLjHy7Nnb4z9FNNL7phykYQBv24RHx08oX8x95TlwgCWViDqvqlGu7od4mnvlVt4kNHhrwxvc8H@lists.infradead.org
X-Gm-Message-State: AOJu0YwHr308qZyR11KNU0nvwTwRVl5LQ/29OZbA6e5gfWwfs6gCrQUO
	sLz+EafOM5T6W8wXIyaydzuHzRCBfzDTYl2Bk6BL4mZ6bzVLxHVLzfEtPZ9WEBPc
X-Gm-Gg: ASbGnctD1RROkWCry1eB+39s/xIOavX0WSSQGk3qXL0osa6Z5kNu5z+MtFXx1uTFXMh
	USf8TRwrVUtLGzxn+HkoJpH87D/1rcEMhiM4amg8tjMnE/usVyQYjWFFZcvyk5WtH0shxwB28zS
	uiuZ69NkqvAYI79gcr7kvfcWR8oVv8j3BFPyTEdVw3FUrmZWxPXBgnZChEk/ZpSevpjELSvQQKz
	QwrLPBOt+5OpdjfzuFdg8e6gIqVjRDmFhuimiwHgMll+rv50flE12z12cHO3UkSpDQ1ueqWOKbX
	S466d17f5l3Q4sKE2GVylIXUlhkd8l2TqhCtUn416WhrTfjnhQI2WsvKyE/KGgMYe+vAsd4yu1X
	ELRUcN3RAlry9roh90i4a868JXji1qKteiFUS5xVaGzefCXWUfVhC3q32p14U91th8EYVsgTJ2n
	AnnFTPq4h089OES+cZQZVEHj9xUZ68QbwmaFKWlEYfW6gTtPVR
X-Google-Smtp-Source: AGHT+IG8Ju9r9MlKJJXocMV1WVPBiLOOuYw6n/iOrKlXwV9/VDMLMa13X4YBn3ouctiP8hzpusjAjg==
X-Received: by 2002:a9d:6a95:0:b0:7c7:6b2e:2c4c with SMTP id 46e09a7af769-7c78ea79101mr9397221a34.2.1764248287149;
        Thu, 27 Nov 2025 04:58:07 -0800 (PST)
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com. [209.85.161.44])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7c90f5d7b27sm511870a34.4.2025.11.27.04.58.06
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 04:58:06 -0800 (PST)
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-65752954c43so318138eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Nov 2025 04:58:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWNKuPopnW/N3BiRz1okaRmF9D/4rWdvsIdh9fUspT9SoDSLvJvIt7BNaTIafItud2OCriusavV3VKraGAdiyTe@lists.infradead.org
X-Received: by 2002:a05:6102:4492:b0:5db:dad4:840 with SMTP id
 ada2fe7eead31-5e1c40dc2ffmr11440563137.12.1764247933503; Thu, 27 Nov 2025
 04:52:13 -0800 (PST)
MIME-Version: 1.0
References: <20251126182257.157439-4-krzysztof.kozlowski@oss.qualcomm.com>
 <20251126182257.157439-6-krzysztof.kozlowski@oss.qualcomm.com>
 <CAMuHMdX7t=mabqFE5O-Cii3REMuyaePHmqX+j_mqyrn6XXzsoA@mail.gmail.com>
 <dbb94fb1-2f78-4bd2-9254-c435ab3325c0@oss.qualcomm.com> <0e90817e-1c05-4fa3-a6fd-8e755608a2c9@oss.qualcomm.com>
In-Reply-To: <0e90817e-1c05-4fa3-a6fd-8e755608a2c9@oss.qualcomm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 27 Nov 2025 13:52:02 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX2qv2YBbvkM8tkSTWDPe-paMp5=fdv=4tGKheTseK9Pw@mail.gmail.com>
X-Gm-Features: AWmQ_bkZiOzXPS0HFic3DjDBZhimEkCswEaupj15K-zH3plFs36PgNAI9kUlDvg
Message-ID: <CAMuHMdX2qv2YBbvkM8tkSTWDPe-paMp5=fdv=4tGKheTseK9Pw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20251127_045808_643710_2E5EDD7A 
X-CRM114-Status: GOOD (  29.88  )
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

On Thu, 27 Nov 2025 at 12:48, Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
> On 27/11/2025 12:42, Krzysztof Kozlowski wrote:
> >>> --- a/drivers/i2c/busses/i2c-rcar.c
> >>> +++ b/drivers/i2c/busses/i2c-rcar.c
> >>> @@ -1141,7 +1141,7 @@ static int rcar_i2c_probe(struct platform_device *pdev)
> >>>         if (IS_ERR(priv->io))
> >>>                 return PTR_ERR(priv->io);
> >>>
> >>> -       priv->devtype = (enum rcar_i2c_type)of_device_get_match_data(dev);
> >>> +       priv->devtype = (kernel_ulong_t)of_device_get_match_data(dev);
> >>
> >> Any specific reason you picked "kernel_ulong_t" instead of "unsigned long"?
> >> The former seems to be the least common option.
> >
> > As I wrote in the first patch, because to my knowledge it is the

I don't see that written in the first patch; it has the same patch description
as the other patches in the series (mutatis mutandis)?

> > preferred form for holding driver data which are in general pointers. We
> > do not store pointers as unsigned long. It is also already used for the
> > driver data types - see include/linux/mod_devicetable.h.
>
> ... and in case it is still not obvious: I do not cast here to final
> type, because that cast is the reason for the warning.
>
> I cast to an intermediary type to help compiler suppressing the warning

I know...

> - to integer representing the pointer. Unsigned long is not representing
> pointers in the kernel. Integer type representing the pointer is

"unsigned long" indeed does not represent a pointer, but in the Linux
kernel, it is guaranteed to be the same size as a pointer.

'"unsigned long" is superior'
https://lore.kernel.org/CAHk-=wj2OHy-5e+srG1fy+ZU00TmZ1NFp6kFLbVLMXHe7A1d-g@mail.gmail.com
(he doesn't seem to have said anything about kernel_ulong_t)

> kernel_ulong_t, I think.

include/linux/mod_devicetable.h:typedef unsigned long kernel_ulong_t;

IIRC, it was introduced originally because "unsigned long" might have
a different size in userspace.  Nowadays (for x32), uapi uses
__kernel_ulong_t, though.

> Once you have integer type representing the pointer, you do not need
> further casts to enum.

True.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

