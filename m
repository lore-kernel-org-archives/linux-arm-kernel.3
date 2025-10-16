Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFCC0CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 10:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r1WKEJk9GAlT5x9p34JfYLH5DFWeYxL1lhRGvXGKo5M=; b=13ZwQzQmt5QajN/DgTfhF2u7J1
	ex1kQ0Xv7uIqtPjTHA4NLLOiq4mLXIQURRSSTlx6ST5EjmsoMCcoCEYelxjUAFl5sYexH4C8vG6o4
	qGqFLVh1aoWCUQeEYgkstmso/2/VHFsQOvbZ9dtndx/q7KBMrGtOVAfNfBs61/RiIUa72xgC+lg+G
	AWZJA+pU4AnStXg6Z2imtqvSSKC0rm49U4ennfZTxHdWuNWnjYYO/PuRfd0zfCIKns0S1OCf//dhO
	+pI5dWr7zxrlSnorAzJh4hOpBH0biovn67wy6pvbtq3hlkxAlCh6eBWXFKHm6rzzojtH+UoAfPpuU
	vWY5VDtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9L0u-00000004NnQ-16tQ;
	Thu, 16 Oct 2025 10:15:16 +0000
Received: from mail-vk1-f177.google.com ([209.85.221.177])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9L0r-00000004NmY-1XvV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 10:15:15 +0000
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-54a880e2858so383730e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Oct 2025 03:15:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760609711; x=1761214511;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r1WKEJk9GAlT5x9p34JfYLH5DFWeYxL1lhRGvXGKo5M=;
        b=es2sG81oMU80VLAoBoLJwb7zV4n7an3nfpJxcIdQOuoALOGfQVtmiDPzbhl9pe//gP
         4o6JCucQLww3cvrfQTuwqPqCQm7ibTqu8ltvy5ObzvGcyqZOcluSLZ61UyiMf4pDj0jE
         USwXp9b0cYTGgkixZtcnuAmQpRayUYKAiwfHEDUrZpIxaJ9vOuk903r9M3zaFIG0/5Jz
         ufJnJUoaoZx86iDSUZo6OMTmQmJfiHRGMczY6hqNfAovZ3iIQVP5NmxAd+arxwU2qN99
         0hg6qc39Pbl7OvLPvMVtavfKXJjvfvmu+kwmpx2fS684etFkOHhf5SMciMZCKHiGHMCq
         AfKA==
X-Forwarded-Encrypted: i=1; AJvYcCUqZxbEXdilUhVo4ysgSHSYohH3SmljjK8YcXzNveug6VA2STLeQABh+4kl6rvv6tZj1x1MrWqD1XiPdb2DK9Mx@lists.infradead.org
X-Gm-Message-State: AOJu0YzquePUqK2Q2rcSwFxB4FrdyzKtDOXc+aKWLexqlVxjYJwRliNS
	vL1xycxhConX83w2fGnkiQMNQT/MRs95bTu1ub19kLNcbh1R4huM2w04TNDg/9/y
X-Gm-Gg: ASbGncuEAv2HF8XifMElFBl70twSliAu46g6OYL6a88LM7AqW3036QCAF+ShZ+adfx2
	WbrmOHbS/v21N8aILVf/lAR2xSJOsrDxdIiZq5bcCT5AxsNEKUQLswHtd5Cbqxdu9lVNes7mA/G
	CtQH6zEp6uoW1tgVu0erejjslU9y4WkUDLWVPl25mtU7DpYjv0bMuWUc4NuK1BUNi2qxYFN/xY+
	ecj7RMXOfgr1piDHYys3oDxXMvBJR04zE3TdbiqDaxC+Abo5e2/DjIwi7hdvAjrb0M/ZUUtnLjC
	4Y4yK2poTFBofjWZU1rNht9yjvRxWF8vzeLZ4qQO/pxGxecDb/3blF/IxJj2+v1Mhieu6U5nnof
	9g3oMetAWSlSAScACUwhZaKfw7hVU1ksTQTn9gkfet6e3JUY5AQgOQcKaxVTgzpZxg2hunxwEHC
	HMIyyDVF2+BfQYG5PwxFb2REGZmawfp7IDy2g3HN9nY+LBZ4by
X-Google-Smtp-Source: AGHT+IF1seOk00Z0RhftkDpMFFkKJvY7ieSoRVS9p59zjsOGEJsObDm3awe7jX6qBQdyjd2wd4pUcQ==
X-Received: by 2002:a05:6122:3c44:b0:543:8c04:43f4 with SMTP id 71dfb90a1353d-554b8bf17a0mr12849684e0c.14.1760609711400;
        Thu, 16 Oct 2025 03:15:11 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-554dcfbdb73sm5483469e0c.8.2025.10.16.03.15.08
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 03:15:09 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-5aa6b7c085aso441699137.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Oct 2025 03:15:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU+Ll2nHob/Ih4L7ew1mXDi4iOAElZAil/i2YS4LM8uzoksIwHEAHH08iauraSq6HkhxuqihQEvkmERph4FL0Uw@lists.infradead.org
X-Received: by 2002:a05:6102:1516:b0:59d:2396:18fb with SMTP id
 ada2fe7eead31-5d5e23abc8bmr12255783137.25.1760609708606; Thu, 16 Oct 2025
 03:15:08 -0700 (PDT)
MIME-Version: 1.0
References: <20251015153952.185249-1-marek.vasut+renesas@mailbox.org>
 <20251015153952.185249-2-marek.vasut+renesas@mailbox.org> <CAMuHMdVdW+tMA1=g9D+BQV0fk0kis8FzyQgf7BpN-u=pi5eQfA@mail.gmail.com>
 <51ff107d-126d-4481-b94a-f614f31c7bb8@mailbox.org>
In-Reply-To: <51ff107d-126d-4481-b94a-f614f31c7bb8@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Oct 2025 12:14:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW+_1NZYdXrGsNcHkuvh_ym9148BRB+d0Wbz1oZrpWCdg@mail.gmail.com>
X-Gm-Features: AS18NWDOKj2jdUygVapjf0YY-lv6XkkQZ-xgi_PclRkP3UIDiy1yQHHau3vXzwU
Message-ID: <CAMuHMdW+_1NZYdXrGsNcHkuvh_ym9148BRB+d0Wbz1oZrpWCdg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] arm64: dts: renesas: r8a77960: Add GX6250 GPU node
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, linux-arm-kernel@lists.infradead.org, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Adam Ford <aford173@gmail.com>, Conor Dooley <conor+dt@kernel.org>, 
	David Airlie <airlied@gmail.com>, Frank Binns <frank.binns@imgtec.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Matt Coster <matt.coster@imgtec.com>, Maxime Ripard <mripard@kernel.org>, 
	Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
	Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_031513_413476_88E21757 
X-CRM114-Status: GOOD (  26.45  )
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

Hi Marek,

On Thu, 16 Oct 2025 at 11:48, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 10/16/25 10:22 AM, Geert Uytterhoeven wrote:
> >> --- a/arch/arm64/boot/dts/renesas/r8a77960.dtsi
> >> +++ b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
> >> @@ -2575,6 +2575,22 @@ gic: interrupt-controller@f1010000 {
> >>                          resets = <&cpg 408>;
> >>                  };
> >>
> >> +               gpu: gpu@fd000000 {
> >> +                       compatible = "renesas,r8a7796-gpu",
> >> +                                    "img,img-gx6250",
> >> +                                    "img,img-rogue";
> >> +                       reg = <0 0xfd000000 0 0x40000>;
> >> +                       interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
> >> +                       clocks = <&cpg CPG_CORE R8A7796_CLK_ZG>,
> >> +                                <&cpg CPG_CORE R8A7796_CLK_S2D1>,
> >> +                                <&cpg CPG_MOD 112>;
> >> +                       clock-names = "core", "mem", "sys";
> >> +                       power-domains = <&sysc R8A7796_PD_3DG_A>,
> >> +                                       <&sysc R8A7796_PD_3DG_B>;
> >> +                       power-domain-names = "a", "b";
> >> +                       resets = <&cpg 112>;
> >
> > status = "disabled"; ?
>
> The GPU is always present in the SoC, similar to IPMMU/GIC/DMA/VSP/...

These are special, as they are linked from other devices.
And everything needs the GIC.

> which are also never disabled, do we want to disable the GPU by default
> and enable per-board ?

Yes please. We do the same with renesas,*-mali GPU nodes.
The board may not even have graphical output.
Or do you envision using the GPU for more general and headless operation?

> I would argue the GPU should be enabled by default, so the GPU driver
> can do a proper power management of the GPU. If firmware is missing, at
> least power it off on failed probe, if nothing else.

The *_PD_3DG_* domains are powered down anyway when unused.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

