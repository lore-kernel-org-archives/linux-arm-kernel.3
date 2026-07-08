Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89FF3C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 16:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hO17YRpuaXnOXgeP7ftbHwpUP+dSdnes8jnl1DmJr/I=; b=tDh+akq8AmiOOzfOWBAiYfQymD
	srCmFwqXAAjGTzlPJsIrK4G97AgPlwiWW7V6sctItIJDkJ7RgDWB4TBGgZmpuWb4mcAFWIvueXv5p
	+0rN2b6WNW7/YFjc1uDLpUnbUr4HWkjcQ5xF8XSgvilnW7Lz07UfTH+XK2bYNizF/OqRvQxqrOgyd
	aDSx5+vM8jGr88aNujijTyK+FcoCINYaPsQ6kzQoWDyVPuUaaV8wvXfdASmQX9SLIiPU4Pxn2cTEb
	cjOUAZNuADsu2w7Pnw3YJwR3l6ibZrrZHIzj+i3XdSED8XZXM8LEhIRHyCC5pbSc/3BNt8KRRg+df
	vyGOe2Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whUsX-0000000HZSp-0XAx;
	Wed, 08 Jul 2026 16:12:05 +0000
Received: from mail-ej1-f44.google.com ([209.85.218.44])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whUsV-0000000HZSA-0C92
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 16:12:04 +0000
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c126e47a82cso113415166b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 09:12:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783527120; x=1784131920;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hO17YRpuaXnOXgeP7ftbHwpUP+dSdnes8jnl1DmJr/I=;
        b=HBCFZxBb1JGVceqn5Cq0E6c/G1d7MfckUCyK9nUF/GWou0YEO0ZdJDXkp8itahQdQu
         qOzcbmu10n7FzgjPI/uKcBUBJ2XFW93C1OPB0SApSpBAVnNiXcuSjUi0Xvq/HcpRiphR
         3DzxpF+OrRB1OwVSyUnY97Mz7FQ6JK8ScFUNUmo1TUqHfoLKIMGJIRgIFKbOPedNPlEr
         qLAOEqsZw8MDkDEWNNT2C0cxElOAZwrp0YNVoeCGB3OmBp2GsV9UYo8pmtR5Lw1IQ4dh
         NpMDgo0ChnUJ3Bbe9rYXZfkl3yvkFcr7nOyg3YXDVBTxmCojSTYyXKV/PuGDdWFiOypU
         ZktA==
X-Forwarded-Encrypted: i=1; AHgh+RpkDAR/AlO0H9G97zJi6gPrRbj88Y1N3UXYYwU5gDQXjtHdZOWZNVUizaBru3lEGvOuwncHUfNp3g6Soa0M0XoA@lists.infradead.org
X-Gm-Message-State: AOJu0YxaIhpKM5YRScEomXg7Pa8BBUIPGehsV7q4+Wk85KQhDFAZBLom
	9DbpQGochZoe/n7zRGg9uPY+Fe2E2YNGuUsno2e+RnPwu2Z/hd/qtl+4FVw78PHLY5g=
X-Gm-Gg: AfdE7cmtECJICHT8BRhnsRSi0F42rg48LTCU273OdBeSgt1u40O4LjCosr45+fiXaNz
	N8kc9hOSeFv4AnHdpDMXo+5VoOoUkYJrY9TLjcmMy8+UNh3CCNaQN0CruIwS3QsrY1Ffv+oRrhi
	6xAJ3E0/X2TuPKyMPnO0FQq5dZD59dYz0u8ZZcw1cyzlAvLwzgS42Yyms/oQD2VAvP1l+z1sVGN
	eFn+ub2FcqFw2an+ofOoql+3X/iYrZPNciMgpwci5BvJR5G5lWreUGSGQ/N97mZ6LjlAThMNuY8
	eqNRlofiphwpeOfKnwGob65RHY8QlfQyzkWCXQhwMtVO3ib2AbLzq+3/6Y9jZQ3uW26ZRxAQDrB
	8RTGHtlWE9wnU48vlqXYllLxqwt01HXZ4ZrKzDE4dFNLE1vbgDew/0bl99GTwbu7F+Ivamnoah8
	IgjNlE7N/uw8j46gNrHNcNXIK8hMj8tc9dnyMDEnFeCZ7+6QHYLg==
X-Received: by 2002:a17:907:e155:b0:c05:3c55:ee86 with SMTP id a640c23a62f3a-c15ce09a0damr85249866b.46.1783527120366;
        Wed, 08 Jul 2026 09:12:00 -0700 (PDT)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com. [209.85.208.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15d6cbadaasm96678166b.46.2026.07.08.09.11.59
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 09:12:00 -0700 (PDT)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-698bf7a1a2dso1277390a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 09:11:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rp3dUyIQ47wmqSOPRhfhryKmxMxP4o/viYv4b7a0WqmqYDz4d3SEcRF6WK07zgKDCDILiFlvR/Oj+KitRQhAI9P@lists.infradead.org
X-Received: by 2002:a05:6402:1475:b0:698:1973:1da9 with SMTP id
 4fb4d7f45d1cf-69ab44a2082mr1330602a12.19.1783526681164; Wed, 08 Jul 2026
 09:04:41 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1783505329.git.geert+renesas@glider.be> <3c76a2d4-a8b8-493a-9196-c5cc72958118@mailbox.org>
In-Reply-To: <3c76a2d4-a8b8-493a-9196-c5cc72958118@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Jul 2026 18:04:27 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUVUKYrrms0Vd4i3_nwq2LVjvnvFRWswi8UY3cA67u2-w@mail.gmail.com>
X-Gm-Features: AVVi8CdIlIxklIbGHNZaygjBAfJd_Dhsc8WBwlY036WlOLVf0uDAr_hqlDulMbU
Message-ID: <CAMuHMdUVUKYrrms0Vd4i3_nwq2LVjvnvFRWswi8UY3cA67u2-w@mail.gmail.com>
Subject: Re: [PATCH v2 00/10] R-Car X5H Ironhide CPG/MDLC SCMI remapping support
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Kevin Hilman <khilman@baylibre.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_091203_102261_B3EFEF58 
X-CRM114-Status: GOOD (  20.69  )
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

On Wed, 8 Jul 2026 at 17:42, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 7/8/26 12:16 PM, Geert Uytterhoeven wrote:
> > Geert Uytterhoeven (10):
> >    firmware: arm_scmi: Add scmi_get_base_info()
> >    of: property: fw_devlink: Add support for firmware
> >    pmdomain: Make genpd_get_from_provider() public
> >    reset: Add reset_controller_get_provider()
> >    dt-bindings: clock: renesas,r8a78000-cpg: Add firmware property
> >    dt-bindings: power: renesas,r8a78000-mdlc: Add firmware property
> >    clk: renesas: r8a78000: Add SCMI remapping support
> >    pmdomain: renesas: r8a78000: Add SCMI remapping support
> >    arm64: dts: renesas: ironhide: Enable SCMI devpd, sys, clock, and
> >      reset
> >    arm64: dts: renesas: ironhide: Add CPG/MDLC firmware properties
>
> I think 10/10 did not make it either to my inbox or lore.k.o , but the
> remaining 9 patches look good. Thank you !

Thanks, I did something silly while sending.
Lore now has it, b4 still seems to miss it, unless I specify the
Message-ID of 10/10.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

