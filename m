Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D4ACC369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 13:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/l1/Z/GDToMdcTKnifTgVrARzg4LIJ5t8Cqie4h54Ws=; b=crNRSA06ZuqsWBKAmI8Bvb9BXE
	Trl3d64Ur+z6BcjI1QJ/OfAFMlL9M4sxbDkUnrC+N3PHphI5MniQ3O7E10k2XMz3gApD6wLwK4eyq
	+zXegXvftqdoWQPtY1Fz5kzusmFEDzKnxyAdjXHQEdROWzsk5Gz2O2LfuGRrqBjBCaOE7uMAAEYgi
	KrAWENIXDAzAHGLwDSIWNSh36r18fUfH2b8cvoOAl7QbMulEb0vz8HuTDVb5a6eQ9m4/A+HRLzQkg
	C7OiB4h1L1yEvbgWNRfmrqs2LGEpLDiohg8pn2q60EhSMBw0oy5dabIt2ae15LfCSfKcedZLaX44y
	ydNHwyww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Zn5-0000000AX6Q-0kol;
	Wed, 23 Apr 2025 13:05:27 +0000
Received: from mail-oi1-f177.google.com ([209.85.167.177])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7WfR-0000000A2W8-2llf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 09:45:22 +0000
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-401c43671ecso399299b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 02:45:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745401520; x=1746006320;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/l1/Z/GDToMdcTKnifTgVrARzg4LIJ5t8Cqie4h54Ws=;
        b=saED4+O8QBvHYkKexjXcxM4VthCjnqLmcWoH9fYnkPECsvCLSvh9oYhw6ZzdYfj8N2
         thLU8gn2dRAwm73psLpQGyJZ0XehakFNgd+RgSkC4Fxh2UPNCwQf464jU1RIv3vDoaLv
         aWHu+U7UHsKnPC53PTSmwv+R7NQ9AWIDZSphVuHG0ro+G/OIHR5VKuJMs+8xA2tVJloj
         8BmoncifDBNDtVwJDzz3kCBNc5mibCi9sFPg8KxtpBTYtQqnJzPHn5m0iubbIx2n37cZ
         jeKYaHaPTYShZKse+KqyVm9jQA/ngB/p3x1CZ5z/J5MnzRowQoqeuDvqqxJ6VFHpMVlP
         /cbg==
X-Forwarded-Encrypted: i=1; AJvYcCUy1yitlSnQmdX0LcmRr9zZh656ZqL6eyWXBlhdXzqUWlRWr0TCk+AqTnczGfdCTM/TIAPybNZV9LAlvMmzQDS/@lists.infradead.org
X-Gm-Message-State: AOJu0Yyymw86n0RPwJQ7l8OOgwvaeX4RrEDQVp/R6++s2pteJoF1ewqm
	x169t3fe4wO3fmY7u80+Ii0G/R+pmF2i4Afb/RVuHp5xfq6k+Uus3l2NvQvYJPw=
X-Gm-Gg: ASbGncsZ9JaS4PdS6ACUmbpAWrAbZKHht7w43MzdDirgQhk+vsnCSxNQVjmAvjmz64N
	aQQISt5xlJHS4DbJiZhbogcObwom1wdTPVNtbk3Id9ho/SAUEVMR5rSfnZtLjNWNonx69cCkFbN
	8QCPDYjwfR5fi49QB68Pt0La/l2CXE8FogkuboIMTzCGdUh3Y7kjMQ210VRYk9KnBvd4nI2pRZk
	R5i+3UgPFaoIzq2k7oqN4rNwpbuyjVxDhrBE+4tMwFO1NMMzYO6NOgjXjJ9lyPBxq5S6sqsyHFK
	mHVtdAwffCblrn4ksDTQpsYVct42NpLAE3WNXnWxiBxcJonrgDrRMqN/46qrk6VRI256GLpoT5i
	+Z9vzm8w=
X-Google-Smtp-Source: AGHT+IEyPnGXxTgxeeVzV0c3GdTnrFKKkx0rt4+4jbvpkeA9EWjjZLXP8Jr7rbjQV+1bxUlv9ftRcQ==
X-Received: by 2002:a05:6808:178d:b0:3f8:bbf3:3a18 with SMTP id 5614622812f47-401e41731f3mr1089665b6e.16.1745401520172;
        Wed, 23 Apr 2025 02:45:20 -0700 (PDT)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com. [209.85.167.182])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-401beeaf403sm2563758b6e.7.2025.04.23.02.45.19
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 02:45:19 -0700 (PDT)
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3fea0363284so588067b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 02:45:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV7JHoC+jMtd54xG3WiH8AHiEzWYX2PbiIoyTdvEEat5N3qs53nGgtJSJKmsczoCtl7dBo2F5DCxhea03ejGtdw@lists.infradead.org
X-Received: by 2002:a05:6122:2029:b0:50d:39aa:7881 with SMTP id
 71dfb90a1353d-52a69ee4ed3mr1464819e0c.0.1745401133893; Wed, 23 Apr 2025
 02:38:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250406144822.21784-1-marek.vasut+renesas@mailbox.org>
 <20250406144822.21784-2-marek.vasut+renesas@mailbox.org> <20250410204845.GA1027003-robh@kernel.org>
 <40c400ab-8770-4595-9a4c-004e6157c348@mailbox.org>
In-Reply-To: <40c400ab-8770-4595-9a4c-004e6157c348@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Apr 2025 11:38:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU0U8RjJwgMs1gqaKUXj+aP=gMZRgO6Ni5gPHr3yFa_Hg@mail.gmail.com>
X-Gm-Features: ATxdqUEdpJzlYJJPC9uQQHl7BMlq_ah4RVyU1yK01V61iQt1LxPiUJbnjP-RWIo
Message-ID: <CAMuHMdU0U8RjJwgMs1gqaKUXj+aP=gMZRgO6Ni5gPHr3yFa_Hg@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: PCI: rcar-gen4-pci-host: Document
 optional aux clock
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Rob Herring <robh@kernel.org>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	linux-arm-kernel@lists.infradead.org, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Aradhya Bhatia <a-bhatia1@ti.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Heiko Stuebner <heiko@sntech.de>, Junhao Xie <bigfoot@classfun.cn>, 
	Kever Yang <kever.yang@rock-chips.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_024521_701434_0B55C5BA 
X-CRM114-Status: GOOD (  27.58  )
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

On Sun, 13 Apr 2025 at 11:29, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 4/10/25 10:48 PM, Rob Herring wrote:
> > On Sun, Apr 06, 2025 at 04:45:21PM +0200, Marek Vasut wrote:
> >> Document 'aux' clock which are used to supply the PCIe bus. This
> >> is useful in case of a hardware setup, where the PCIe controller
> >> input clock and the PCIe bus clock are supplied from the same
> >> clock synthesiser, but from different differential clock outputs:
> >>
> >>   ____________                    _____________
> >> | R-Car PCIe |                  | PCIe device |
> >> |            |                  |             |
> >> |    PCIe RX<|=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D|>=
PCIe TX     |
> >> |    PCIe TX<|=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D|>=
PCIe RX     |
> >> |            |                  |             |
> >> |   PCIe CLK<|=3D=3D=3D=3D=3D=3D..  ..=3D=3D=3D=3D=3D=3D|>PCIe CLK    =
|
> >> '------------'      ||  ||      '-------------'
> >>                      ||  ||
> >>   ____________       ||  ||
> >> |  9FGV0441  |      ||  ||
> >> |            |      ||  ||
> >> |   CLK DIF0<|=3D=3D=3D=3D=3D=3D''  ||
> >> |   CLK DIF1<|=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D''
> >> |   CLK DIF2<|
> >> |   CLK DIF3<|
> >> '------------'
> >>
> >> The clock are named 'aux' because those are one of the clock listed in
> >> Documentation/devicetree/bindings/pci/snps,dw-pcie-common.yaml which
> >> fit closest to the PCIe bus clock. According to that binding document,
> >> the 'aux' clock describe clock which supply the PMC domain, which is
> >> likely PCIe Mezzanine Card domain.
> >
> > Pretty sure that PMC is "power management controller" given it talks
> > about low power states.
> >
> >
> >>
> >> Tested-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.s=
e>
> >> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> >> ---
> >> NOTE: Shall we patch Documentation/devicetree/bindings/pci/snps,dw-pci=
e-common.yaml
> >>        instead and add 'bus' clock outright ?
> >
> > Based on the diagram, this has nothing to do with the specific
> > controller. It should also probably a root port property, not host
> > bridge.
> How would you suggest I describe the clock which supply the PCIe bus
> clock lane (CLK DIF1 in the diagram) , which have to be enabled together
> with clock which supply the PCIe controller input clock lane (CLK DIF0) ?

I think Rob wants you to add clocks/clock-names for this to
dtschema/schemas/pci/pci-bus-common.yaml.  Then you can have pcie@M,N
subnode(s) with num-lanes, clock, and clock-names describing the PCIe
endpoint(s)?

git grep "pcie*@[0-9],[0-9]" -- $(git grep -l num-lanes -- Documentation/ )

Does that make sense?
Thanks!

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

