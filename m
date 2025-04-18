Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4C56C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 12:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ex4CZQWgxkClQmKHcyHVLX17Io0C6G4ejKLtSY01Ru4=; b=2TzHGdhl+ZY1tBVex454Rl8Q6m
	f/Kt9o7pE1ghZ16+YfHdD+f9Ob+Uz5FWNYQvb4apMjPFnfYa7yz3MLn4sp3G1K3sNaFQ8yAsZ5RIK
	w+eDqNn2Fz2K6N5hvoRnKRravNQYU3mQP9Jt1lYEAlHL+vLIwGn5MxXu9kEYDkSgN3/dTekDBtBIy
	T8tRObkR6DwiIvlYXl++gET5IKeAI8TgSLkG+eiacydxbkFJqzrSkYH/4Eguac4FzA5vi40afNCHO
	YE5idAGWT3M//VL+/Ihs5BGo+/IFsxGt6OWXgI3hY8+nRfofmvvSXoa/AeVjrAK0HZ4CcHejtG0vI
	8JRosXsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5l1Q-0000000G6oA-2eSQ;
	Fri, 18 Apr 2025 12:40:44 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5kzV-0000000G6Yk-325s
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 12:38:47 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-47688ae873fso18175171cf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Apr 2025 05:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744979924; x=1745584724; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ex4CZQWgxkClQmKHcyHVLX17Io0C6G4ejKLtSY01Ru4=;
        b=YUYu0VlHvNzYdEgf8pxHYuYsGK+H2fS1UxVK9pExej9kixCgKD6wT9MdUnoPYe8yNX
         DQl9D1AXxzcZzMw/C9AzFDRcYgRNWx1vtP+QlbMNPi88lFzY5sf28qAW51e75kPCIxGm
         cRaACn9jYzBMy6xnlgwLfg3QkxLZVuVzpZssAHvNSCryGvSWMi2rh/UvMyshNFMeWQq8
         nS44/Jw/FyVnfYoEFRFU9mWgHF1sfk4qbli5YIsTI2UBqDCoL7rzobqOQNu0uLdgRq2w
         MZTkOYXdI5uOjrhdteR/O+52yi13QFqxwPLqx/kVD+oONQxDxfnDFF6i99Z0unQ8ikqv
         RKPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744979924; x=1745584724;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ex4CZQWgxkClQmKHcyHVLX17Io0C6G4ejKLtSY01Ru4=;
        b=efQb8JNfvwC+zvgF89Qdt0vKtu8vCxxZDJXTXHx/vQSSH+QKgizbOb4fdWMqSvOsNU
         f5mC0CH3Z9xkcphnIBe9sCp0kcR3+c1d0Ac+hSB99HHmh1L8abW+eqZoSLcAMmvI/Rqn
         jQKn9/WNP4rR4Ih4e/gUoAe6AA7QRneeE3Fb/8dDKUNMu/CFyRD4CL2HKtX4TNk8hOl6
         KkoFANk1gps9WaT2Gq0JCYsEqP7tmvbPjjS+LTFSEDNWfGeFCEDaHSbe2ze2r9YcIXbB
         gkkEUV3Ew6CTWJ7FBkt1V1M/ppYNGiUW7nkRKc3W/LuprYjCayDaV0+YuZAVKEEZR1VF
         rSMA==
X-Forwarded-Encrypted: i=1; AJvYcCVz3sPoz+2Cs+Ne4OohqrnqghIYgGbcFvUbtvVwDOj4S07njDV0i67C9mloNsACgSNrw0fn9Ti/Ztw2z+qJBe0x@lists.infradead.org
X-Gm-Message-State: AOJu0YyfoGCWYcHUquJ0A3wL6UKUWbBsT30Z2MYrhKsIdypcgGjifZYl
	8busqFWIdCRX4Uv/MMnjfamO0qYaYk0GpFhaGzblWPAMneuoV5Me0DNdIJ9LZkbUnsdXCpLFIKu
	qqLFkx86FB0dKvQKcbHwBsB9M4MM=
X-Gm-Gg: ASbGncuSMMfGsVKgax3Ygq4A04LB8cCNjUyD+nFhNn105KEQ/QMKB11zzyg2FmJ74cE
	NFZc/9jOb3Zor+iLOVgF156K3JZYdCMHYKGljLltDSuF0SHeA+Hkcwmek3yGincTPYF62We2Wdb
	8fcnCIP0CrcFk1MOm3OV824w/GUr7MJFpxZd6FdRoAchVAnN7MUCeMDQ==
X-Google-Smtp-Source: AGHT+IGB0+9rYEJMYSumpu6Vzq9goNJmJbJ95NPX/w0TApxD1IhEm9WvTNPQJ7w305XUYtnHZHJIiC78RgW25GjDsKk=
X-Received: by 2002:a05:622a:1828:b0:476:8225:dac9 with SMTP id
 d75a77b69052e-47aec4c57a5mr39379541cf.45.1744979924108; Fri, 18 Apr 2025
 05:38:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250416-wmt-updates-v1-0-f9af689cdfc2@gmail.com>
 <20250416-wmt-updates-v1-3-f9af689cdfc2@gmail.com> <20250416201407.GC3811555-robh@kernel.org>
 <CABjd4YyTKquLcYC+DVg_koi3p7AhqwBNiazCiC713DQKjCaBSA@mail.gmail.com>
In-Reply-To: <CABjd4YyTKquLcYC+DVg_koi3p7AhqwBNiazCiC713DQKjCaBSA@mail.gmail.com>
From: Alexey Charkov <alchark@gmail.com>
Date: Fri, 18 Apr 2025 16:38:40 +0400
X-Gm-Features: ATxdqUHZEjWs_YUTRnLI_mqfQ2sstLgHtYWGD2PkyOOwUEJjeYm4m7FuAwUHjuc
Message-ID: <CABjd4Yxi4SLqsAk_fb9C=1BW6XjnZ8LQ_JKYu6KZ3TtMS0fnhg@mail.gmail.com>
Subject: Re: [PATCH 03/13] dt-bindings: mmc: vt8500-sdmmc: Convert to YAML
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, 
	netdev@vger.kernel.org, linux-pwm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_053845_763753_13BB3B04 
X-CRM114-Status: GOOD (  36.03  )
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

On Thu, Apr 17, 2025 at 10:25=E2=80=AFAM Alexey Charkov <alchark@gmail.com>=
 wrote:
>
> On Thu, Apr 17, 2025 at 12:14=E2=80=AFAM Rob Herring <robh@kernel.org> wr=
ote:
> >
> > On Wed, Apr 16, 2025 at 12:21:28PM +0400, Alexey Charkov wrote:
> > > Rewrite the textual description for the WonderMedia SDMMC controller
> > > as YAML schema, and switch the filename to follow the compatible
> > > string.
> > >
> > > Signed-off-by: Alexey Charkov <alchark@gmail.com>
> > > ---
> > >  .../devicetree/bindings/mmc/vt8500-sdmmc.txt       | 23 --------
> > >  .../devicetree/bindings/mmc/wm,wm8505-sdhc.yaml    | 61 ++++++++++++=
++++++++++
> > >  MAINTAINERS                                        |  1 +
> > >  3 files changed, 62 insertions(+), 23 deletions(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/mmc/vt8500-sdmmc.txt b=
/Documentation/devicetree/bindings/mmc/vt8500-sdmmc.txt
> > > deleted file mode 100644
> > > index d7fb6abb3eb8c87e698ca4f30270c949878f3cbf..000000000000000000000=
0000000000000000000
> > > --- a/Documentation/devicetree/bindings/mmc/vt8500-sdmmc.txt
> > > +++ /dev/null
> > > @@ -1,23 +0,0 @@
> > > -* Wondermedia WM8505/WM8650 SD/MMC Host Controller
> > > -
> > > -This file documents differences between the core properties describe=
d
> > > -by mmc.txt and the properties used by the wmt-sdmmc driver.
> > > -
> > > -Required properties:
> > > -- compatible: Should be "wm,wm8505-sdhc".
> > > -- interrupts: Two interrupts are required - regular irq and dma irq.
> > > -
> > > -Optional properties:
> > > -- sdon-inverted: SD_ON bit is inverted on the controller
> > > -
> > > -Examples:
> > > -
> > > -sdhc@d800a000 {
> > > -     compatible =3D "wm,wm8505-sdhc";
> > > -     reg =3D <0xd800a000 0x1000>;
> > > -     interrupts =3D <20 21>;
> > > -     clocks =3D <&sdhc>;
> > > -     bus-width =3D <4>;
> > > -     sdon-inverted;
> > > -};
> > > -
> > > diff --git a/Documentation/devicetree/bindings/mmc/wm,wm8505-sdhc.yam=
l b/Documentation/devicetree/bindings/mmc/wm,wm8505-sdhc.yaml
> > > new file mode 100644
> > > index 0000000000000000000000000000000000000000..a7d962bc13c7ff70b5044=
8201b0416efc7f787af
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/mmc/wm,wm8505-sdhc.yaml
> > > @@ -0,0 +1,61 @@
> > > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/mmc/wm,wm8505-sdhc.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: WonderMedia SOC SoC SDHCI Controller
> > > +
> > > +maintainers:
> > > +  - Alexey Charkov <alchark@gmail.com>
> > > +
> > > +allOf:
> > > +  - $ref: mmc-controller.yaml#
> > > +
> > > +properties:
> > > +  compatible:
> > > +    oneOf:
> > > +      - const: wm,wm8505-sdhc
> > > +      - items:
> > > +          - const: wm,wm8650-sdhc
> > > +          - const: wm,wm8505-sdhc
> > > +      - items:
> > > +          - const: wm,wm8750-sdhc
> > > +          - const: wm,wm8505-sdhc
> > > +      - items:
> > > +          - const: wm,wm8850-sdhc
> > > +          - const: wm,wm8505-sdhc
> >
> > Combine the last 3 entries into 1 using 'enum' for the 1st compatible.
>
> Fair enough, will do.
>
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  clocks:
> > > +    maxItems: 1
> > > +
> > > +  interrupts:
> > > +    items:
> > > +      - description: SDMMC controller interrupt
> > > +      - description: SDMMC controller DMA interrupt
> > > +
> > > +  sdon-inverted:
> > > +    type: boolean
> > > +    description: SD_ON bit is inverted on the controller
> >
> > This implies I know what the non-inverted state is. If you know, please
> > state that here.
>
> This is a tricky one. The only answer I have is "it's inverted in
> later versions vs. the first version I saw in the wild, and I'm not
> sure if it's board related or IP version related - nor if the original
> was active low or high". No docs, no schematics, no vendor left around
> to chase for answers.
>
> Will dig around some more and update the description if I succeed in
> uncovering any further clues :)

I've found some extra clues and would like to consult on the best way forwa=
rd.

It turns out (if my understanding of the decompiled binary-only WM8505
vendor driver is correct) that all chips before (not including) WM8505
rev. A2 treated their "clock stop" bit (register offset 0x08 a.k.a.
SDMMC_BUSMODE, bit 0x10 a.k.a. BM_CST in vendor sources, BM_SD_OFF in
mainline) as "set 1 to disable SD clock", while all the later versions
treated it as "set 0 to disable SD clock". Which means that there are
WM8505 based systems that rely on either of those behaviours, while
any later chips need "set 0 to disable". This is not a board related
quirk but an on-chip SDMMC controller revision related quirk.

I'd love to switch to a compatible-based logic and drop the
"sdon-inverted" flag altogether from the binding I'm writing, but here
are my doubts where I'd love to consult.

* Looks like WM8505 rev. A2 needs a separate compatible string vs.
prior WM8505. Can we have something like "wm,wm8505a2-sdhc" and
"wm,wm8505-sdhc" respectively? WM8505a2 not being an actual chip name,
but something discoverable by reading its hardware ID from a system
configuration register at runtime
* If I introduce new compatible strings for "wm,wm8650-sdhc",
"wm,wm8750-sdhc", "wm,wm8850-sdhc" and "wm,wm8880-sdhc" in bindings,
DTS and driver code, then the new driver and new DTB should work fine,
and the DTS should pass schema checks. New driver code won't work with
older DTB unless I keep the logic to parse "sdon-inverted" which
wouldn't be part of the binding. Old driver code would not work with
newer DTB except for pre-A2 versions of WM8505. Is that acceptable?
* Existing DTS doesn't differentiate between pre-A2 vs. post-A2
revisions of WM8505 and is bound to fail on the latter

I realize that breaking backward/forward compatibility is undesirable,
but frankly these systems seem to have few mainline users, and those
people who do run mainline on them ought to be compiling the kernel
and its DTB at the same time, because the firmware doesn't know
anything about DT and any modern kernel can only be booted in
"appended DTB" mode. I also don't know of any non-Linux code that
might be using these device trees.

Any guidance would be much appreciated.

Best regards,
Alexey

