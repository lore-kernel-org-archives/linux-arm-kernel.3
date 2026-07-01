Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 282CEC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 11:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GZVdHF4RDDIw1GGyB47+k+m0XFHhbNyNGeWh/pCWjI8=; b=0GuDSBTVJnEoDtcD+eP9WVspf3
	Qj1QkJiiHezHLFv96uQHGtaFZ3c0Ny8Qm0JO8T+pRzDo8sR25KVjDADu0xL15MyvEQEc1lowfT84z
	hm8CoBgl8Kwk2sneR9nSUCI4HUedQ+8qLFWC4QP7+jInOLlZGUqkrojOen5PIcGqvcxf4KuIXehm2
	dfufcNNLp8UKAaIQmBj22I8Lb5rKTP+UIQTzA9+RQkrgHsF6bII1QoVsyquS7BAcDqJs8w6YxUWw/
	czsfDOwbCBQUGrHpZWa8EJHGurf0gBxVgwKIM61NmsBayfo/VmKOpLnDQ/t+t7uns7VWKFpIdPlEw
	S0QMtoSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wesk5-00000001Pjs-1jIn;
	Wed, 01 Jul 2026 11:04:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wesk3-00000001Pid-4BaT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 11:04:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 09507601EC
	for <linux-arm-kernel@lists.infradead.org>; Wed,  1 Jul 2026 11:04:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5D8C1F01558
	for <linux-arm-kernel@lists.infradead.org>; Wed,  1 Jul 2026 11:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782903870;
	bh=GZVdHF4RDDIw1GGyB47+k+m0XFHhbNyNGeWh/pCWjI8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=T7kun4FsQTg4nrByttcWF1XbAF9a1nz/xm5VEJGp6Vq6BvL4piRhl7pnpTSZaSsAv
	 o6vdGU5xtAPraiD6B8Aj1/xzLT/BeVvkRC60esDutv8NozfP303xB30G/dkU11VQby
	 BCcSNqv7e1MxVhEn3YG/ioapS6k5K4ypOjvOw3wlw9hBJ8M2p0awlpsfBQ0a+O3737
	 mfv8x7Ua6KnSPEuq53FbqNlRluTh+MLzo8GXEiNL5QA5BSyaGV9alRGPJvugzgZS8X
	 9x92fFNjHvpI/PYVIpjbqHZ1GQ7hyktFB9uCLU1mJC3CmOHgC5FWsCeEpNTD8BhjUj
	 3CcMF6KgvliIw==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5aeb8870485so439067e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 04:04:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqR3qJm+HXX1rXVlXaSoX3XBrRzNOpdO+5LjFfcMswBuDHyJ9JCmKVlGmrDXnXTQiG2q8yheZPC//xfoY/EjuWr@lists.infradead.org
X-Gm-Message-State: AOJu0YyRL4DbfAnM9K+lfM9i8HIc2vLt493DEsXvkR7p2slAX8BJgl27
	C3jCjE90/scQjBLfVofFOnJtpqmwwIXT6/p9F3Nh/O54/QQKwM4o8o6w8ToEauIxoUBFZz/GR1B
	f51XADtDbhe8rUQzWeLDa6Km8OCtjgyE=
X-Received: by 2002:a05:6512:2457:b0:5ad:abf:1e1a with SMTP id
 2adb3069b0e04-5aec678e6bcmr286502e87.5.1782903869487; Wed, 01 Jul 2026
 04:04:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260622092335.1166876-1-eleanor.lin@realtek.com>
 <20260622092335.1166876-2-eleanor.lin@realtek.com> <CAD++jL=6pqEA0-vs_J57MnhmLmLwrTj7-syOL8E7PLYW-vUBvg@mail.gmail.com>
 <56be68cba7d9461d9a1ec66ed1a1417a@realtek.com>
In-Reply-To: <56be68cba7d9461d9a1ec66ed1a1417a@realtek.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 1 Jul 2026 13:04:16 +0200
X-Gmail-Original-Message-ID: <CAD++jL=1mqDetG-+DW_Loj5Ufp_v5DmLN+T9pM_28dAASHHRzA@mail.gmail.com>
X-Gm-Features: AVVi8Cd5VWiNZ8yCkmPmPqgDgJBXqd110lMfJ3ncCbilkzR-pzDuizM2gwBEdko
Message-ID: <CAD++jL=1mqDetG-+DW_Loj5Ufp_v5DmLN+T9pM_28dAASHHRzA@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] dt-bindings: gpio: realtek: Add realtek,rtd1625-gpio
To: =?UTF-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
Cc: "brgl@kernel.org" <brgl@kernel.org>, "robh@kernel.org" <robh@kernel.org>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"afaerber@suse.com" <afaerber@suse.com>, "mwalle@kernel.org" <mwalle@kernel.org>, 
	"andriy.shevchenko@intel.com" <andriy.shevchenko@intel.com>, =?UTF-8?B?VFlfQ2hhbmdb5by15a2Q6YC4XQ==?= <tychang@realtek.com>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-realtek-soc@lists.infradead.org" <linux-realtek-soc@lists.infradead.org>, 
	=?UTF-8?B?Q1lfSHVhbmdb6buD6Ymm5pmPXQ==?= <cy.huang@realtek.com>, 
	=?UTF-8?B?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?= <stanley_chang@realtek.com>, 
	=?UTF-8?B?SmFtZXMgVGFpIFvmiLTlv5fls7Bd?= <james.tai@realtek.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, Jul 1, 2026 at 12:41=E2=80=AFPM Yu-Chun Lin [=E6=9E=97=E7=A5=90=E5=
=90=9B]
<eleanor.lin@realtek.com> wrote:

> To clarify the hardware design: this SoC does not use a banked GPIO
> architecture.
>
> Each GPIO pin has its own dedicated 32-bit control register that handles
> both GPIO configuration and interrupt settings (e.g., edge/level enable).
> The only exception is the interrupt status register, which is grouped int=
o
> 32-bit words.

Aha, I get it!

> Since physical GPIO banks do not exist, using a 3-cell <bank offset flags=
>
> format would misrepresent the hardware. Therefore,
> keeping #gpio-cells =3D <2> and #interrupt-cells =3D <2> is the most accu=
rate
> reflection of the actual silicon.

Hmmmm I would argue that the way the interrupts are routed into a
single 32-bit register for 32 GPIOs would be an argument for using
#interrupt-cells =3D <3> but it would be confusing to use a mixture of
2 and 3 cells for GPIOs and interrupts, so I guess 2 is OK for both.

Yours,
Linus Walleij

