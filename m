Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7DCEC5AD5A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 10:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CR60h/fVXoId0NfC1qox1rIsZX7Vdp8o1eA32koeHU0=; b=BTI0NmRPumxl1Cj5YD2EouIZXx
	yYsT3Y5MGarid6dYnX5AXVCUQ/zKjuUFN4Q8w30UFBG/O3vgj0ZKw8qDBIvW28Me6GStnyb/IS9UG
	4GwrsK8hkkEa+5/sbpiua85Hu2g4XQ0PshCi58CiKDOXkoMZ/r8Hitv60KUjUHONBY1sn6dkedbkm
	dUvjB4Q2fxQqb/eprLnFZrNnKMJwEKKbhDiZp/b0BFUeIUtaM2Kt7avAzv/0YYVM91809zv4/lea/
	kmgt+vJttdpRq4s9f3d0BT2PclW7IQKZN7DOUqco1ntL2loZ4U+WR6nuT8nvaIqYJOH+L6QecAWOQ
	KJChImVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu5nG-0000000Fpv3-0I9N;
	Wed, 12 Aug 2026 10:02:42 +0000
Received: from mail-ua1-f52.google.com ([209.85.222.52])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu5nD-0000000FpuR-1dUS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 10:02:40 +0000
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-9693bbb962eso369286241.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 03:02:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786528958; x=1787133758;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CR60h/fVXoId0NfC1qox1rIsZX7Vdp8o1eA32koeHU0=;
        b=j91vj3uBHXQAeIviCyX1PwTVL5XF6YbLPaZoONIHp1CnwxrIWfe3g2jjzAtwT9ojGp
         JzLl5Zd3vZL8J6yEdQPZrSKZq0Ek4ejp67ib84z/e5Poo9K8sivH65Vafsk5m2FnFxlj
         Q5pMKUmb9nzv9GHSYltmAznuS/511E8OpYFrkae2rObDw88jOlsglBQQCGRfOltoAcig
         Mkb1ZhRGjaN5CwbBvb51H6Lb4xWNnMqzZbWW90vUfdfNdDU03LPYO/u4DE/NILW9Q12t
         L+JvcMCdETeg0Ji3WLmglS57iyag0pcNyVEagUxRk4W2ihxPTkAxbn9MT2Uo4c5x2+Wk
         pXFg==
X-Forwarded-Encrypted: i=1; AHgh+RqEs0h546D/gcdB7Peh29lwobmACTmtwU8oVABwiHgJdhQF2TdNSIDiMTRKh39Gj9j4nAWJ8tzpyi74lz51JUKT@lists.infradead.org
X-Gm-Message-State: AOJu0YxsoMw3Ja2Juozehnmn7KqN4rE3tkNnvEnYF+pne7f5sEqtALj5
	UVJSKHXGk5RROw4uu3aKY1kQSe898Ksk/RVQB9pu09wpXNUlauyEsNCprTpf8AFw
X-Gm-Gg: AR+sD13e3aVQJzgVkK7ITTIzy4FJPKUfx+/ZtjuT7Ce0nUeMn40Y0a46VwP9rL9TmfS
	08I7YRWhNIkmQ6VvTFu0BVdOWvMjmDK9oQt87MjcTxp5yjqhaQ31UcmT1YKYS3uvqkOsFTjXJ5Q
	TOkWQqA9zu7usdrNlSJEQFkbxzfQ8E5Yw7kW8ADrxmywkZun8B5BbnEZMHsRHF7JjtdHMyEdu1Q
	a80LJf2e1PLsyH0odC6NJOO8l8QW+0f4OM+K4BkhDoZAQyunXR8ZfCqHPKY93qfPiip7KH5BWfN
	YlZYOSFPnr6lYcy3M0CZXMgsdWa6XFL+fZiOWTZuSPs2HGaIwklQY8M3x3oGqSxcc27Azsnv2Uh
	lwY55jVAsNIplQFCribqDvrXuR3qTeYs90ZxctYAg3J4yEPxZ3mxsDBDFA/TklmgNw6w+pi3yRT
	G/snYC17Ys6wC/YpUNCqqwLFjmbDvAgRdH359L/EheDdP9JmuX5Sae7knteh6zRtq7JQ9jHtPIn
	c3rWiQaNsx67XiwDj9h4wcY2Q==
X-Received: by 2002:a05:6102:1481:b0:738:6994:eb8 with SMTP id ada2fe7eead31-76c8a264471mr937445137.0.1786528957914;
        Wed, 12 Aug 2026 03:02:37 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-97a3cc0da87sm1240237241.7.2026.08.12.03.02.36
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 03:02:36 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-97723f98735so392330241.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 03:02:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rqr5zkBp5CDUtX1jmYwJH/gbCg0Kp0ZbBKGV5zZUWdNMVVv/Dtky2r6XoZF1M5IAr5AFvTJfmiT+5pLcXyN1w11@lists.infradead.org
X-Received: by 2002:a05:6102:3fa3:b0:738:531e:a43e with SMTP id
 ada2fe7eead31-76c8e62eb86mr823119137.7.1786528956520; Wed, 12 Aug 2026
 03:02:36 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1783505329.git.geert+renesas@glider.be> <49726acff0fee1c3606e83c4f242ef6aad25b4b8.1783505329.git.geert+renesas@glider.be>
 <20260710-adventurous-burgundy-chimera-b2fff9@quoll> <CAMuHMdV=ckONBbTYELPJU8YWoNzdu3PJ95VR8cz+f_7dUeiPUw@mail.gmail.com>
 <20260716214924.GA1477674-robh@kernel.org> <CAMuHMdU0ss6wUEdjC+OYa3iQS439aJ8b_d9M2ws7Ayn4_kOyMQ@mail.gmail.com>
 <20260811163334.GA2354701-robh@kernel.org> <CAMuHMdWbzg-QpFBzzDa2hC3HzAmWUkerESC5O-cSVxmWX3_PkQ@mail.gmail.com>
 <45dfd858-9d59-47e6-91e0-ef9e6e909af6@kernel.org>
In-Reply-To: <45dfd858-9d59-47e6-91e0-ef9e6e909af6@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 12 Aug 2026 12:02:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXJFdJQP1GVXrOWRuYO8Si_WF5X+vpzmAgTZY+tQstR1A@mail.gmail.com>
X-Gm-Features: AUfX_myt-2ep2N9UFFpinQmtMeTX8Y6aB554SNFoItehXn5f25ET5eoahbFPK1U
Message-ID: <CAMuHMdXJFdJQP1GVXrOWRuYO8Si_WF5X+vpzmAgTZY+tQstR1A@mail.gmail.com>
Subject: Re: [PATCH v2 05/10] dt-bindings: clock: renesas,r8a78000-cpg: Add
 firmware property
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	Ulf Hansson <ulfh@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
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
X-CRM114-CacheID: sfid-20260812_030239_447410_AF37DFA4 
X-CRM114-Status: GOOD (  37.00  )
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

On Wed, 12 Aug 2026 at 11:51, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On 12/08/2026 11:47, Geert Uytterhoeven wrote:
> >>>>>>> +  firmware:
> >>>>>>
> >>>>>> RPi is doing similar, but I have doubts. It looks way too close to
> >>>>>> generic "syscon" which is disallowed.
> >>>>>>
> >>>>>> I think this should be vendor+purpose specific, e.g.:
> >>>>>> "renesas,scmi-transport" or "renesas,scmi-firmware"
> >>>>
> >>>> If you can tell me the resource that a 'firmware' provider provides then
> >>>> it is fine, but you can't.
> >>>
> >>> It provides a firmware API, which is not available until the firmware
> >>> provider is initialized.
> >>
> >> I don't know what "a firmware API" is. What does it provide? I know what
> >
> > It can provide lots of things (everything we are no longer allowed to
> > touch directly from Linux ;-)
> >
> >> a clock, GPIO, reset, interrupt, etc. provider is.
> >
> > A clock is an object you can access through the clock API.
> > (s/clock/.../ for the other cases).
> > Firmware is a service (virtual object) you can access through a
> > firmware API.
> >
> > In all cases, the consumer of the object or service needs to know
> > which object or service to use (there can be multiple).
> >
> > In all cases you cannot access the object or service until it is
> > available (initialized and registered), for which we have -EPROBE_DEFER,
> > and/or "[PATCH v2 02/10] of: property: fw_devlink: Add support for
> > firmware".
> >
> > Thanks for your understanding ;-)
>
> I think that's the difference here. Clock is not an object, but a signal
> on a wire or within IC coming from one device (provider) to another
> (consumer). Firmware is not a signal, not a wire, not anything which can
> be provided from one to another.

Oh yes, it is a service provided by the secure world or a different
CPU core to the application core running Linux.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

