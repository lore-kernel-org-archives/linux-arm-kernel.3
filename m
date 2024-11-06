Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D695D59F78
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 21:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QjjSL7xGMbGQLoV8YriEpVvErS/0ruqAmljcQbzctPY=; b=G/GquPUjo434lEQ+4TxQ/oEJfy
	deORUmEsJwrvQpY5AKaNVdbeWE5aQONAxHRuo++g2qe0TxGynbsFwypgdzw3ODBtk+RjDdhszIhYh
	gNSzwY8NIB+xRvVcdoUISYfFBmmIKNEYWcefMqn3NDarX4+7r0rwaR7cQNm9BqQgpRsm98BGhQe6C
	g6Xwkws7/1FyTq3UPje9+pwCsgzrclVwV25IyA0TW0mvk/0xDZnfnN3yZ4rKQ6zXo+NWi9YXJ3fe3
	rJ94vH+rWV5iOgGwt98eXKDlmoZnLVF6k4jS3aTpvbIWODhPWV75a+Asg8VvrLNF1UvQ6uNyY52Cg
	yhkin2Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8nzR-00000004qcP-1Ywr;
	Wed, 06 Nov 2024 21:55:01 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8nxh-00000004qKJ-0AuC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 21:53:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AD75A5C4CB6
	for <linux-arm-kernel@lists.infradead.org>; Wed,  6 Nov 2024 21:52:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08EF5C4AF09
	for <linux-arm-kernel@lists.infradead.org>; Wed,  6 Nov 2024 21:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730929992;
	bh=vBUNYW41X8j9KVkVJ9SID98oI09XWTwBRYeK0M5j0TQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XvJ8i+GuO0FBfeWdP1EP8PFsB3mhJ1SkIwubJeAPaHNg0Gxx1bFvGcBs6g7gEktgg
	 Nc9JVIlBMyyzwrKz0FCiLZ7d35xt8z15/YtTxzeCGrV6nQh+zARjhMg1MZF8abfqDK
	 kxpJ6iZSCIVgsk5+l2BbrFfKdvwI0Sd7eCue9CosGF+wB0kru5ZBM3i9DrHVHMjVWQ
	 JR9WSTgBlB6VYTVtlIzhczXIz1SVE6kbU8irfZ0sVjOSOtAvvXoJelj2Ai/mpG7DiW
	 huEKCFtpJ4vNbJbogwfAEPPuYlIC+fpWVfPc4UTknMNnOn98UFZTq0tBI6/sU9xqls
	 QeHijuDF3pbHg==
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e28fa2807eeso278017276.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Nov 2024 13:53:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUj+OA0W6uPeUSADYI5hvkQ/qaP004iKPnblhbyRqNd3gBDGK9tpE2210wg1uD4Ci3kPNvl4r4b9No7hLKhXl2Y@lists.infradead.org
X-Gm-Message-State: AOJu0Yzo0ZJgYxy3bZG5kEsLeP6CN8hTwbL55umz5OHAkGQKK731H5tf
	RLgSrVd/Kitg8rt/aY37ZXi74xragGm6AK736ca19ggwmlFg5bx7D3esTTojn2YNTRIFE6fOrj+
	LrD5Hvu7KdBIAR8tk5P/lTOFqkg==
X-Google-Smtp-Source: AGHT+IFGsz0bjZks3SaX+0VdpO9QyxD6TF9jMNKPDx0ikEy137YNiUqssnlxpQt2OV0tyDlj1GpHTCW3MDe2kVYzq1g=
X-Received: by 2002:a05:6902:1142:b0:e2b:b9bf:fe5b with SMTP id
 3f1490d57ef6-e30e5a0226emr23814007276.8.1730929991130; Wed, 06 Nov 2024
 13:53:11 -0800 (PST)
MIME-Version: 1.0
References: <20241014193528.1896905-2-robh@kernel.org> <87r07p8x12.fsf@BLaptop.bootlin.com>
 <0A5AFF77-D888-4151-9C15-15A408709857@fw-web.de> <CAL_JsqKfpVVVh6L0PLmieBO3qMFpcDfWFwd+5=qzH_MbeZt31Q@mail.gmail.com>
 <4aa7f13e12646722d859ead240177eab@fw-web.de>
In-Reply-To: <4aa7f13e12646722d859ead240177eab@fw-web.de>
From: Rob Herring <robh@kernel.org>
Date: Wed, 6 Nov 2024 15:52:59 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJbYW3mpcjHb5YazUviVOmJEgjaWrbK0XYjR7xVQEb2+Q@mail.gmail.com>
Message-ID: <CAL_JsqJbYW3mpcjHb5YazUviVOmJEgjaWrbK0XYjR7xVQEb2+Q@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: marvell: Drop undocumented SATA phy names
To: "Frank Wunderlich (linux)" <linux@fw-web.de>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, Andrew Lunn <andrew@lunn.ch>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, frank-w@public-files.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_135313_249420_D0A4B0DB 
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

On Wed, Nov 6, 2024 at 3:17=E2=80=AFPM Frank Wunderlich (linux) <linux@fw-w=
eb.de> wrote:
>
> Am 2024-11-06 19:39, schrieb Rob Herring:
> > On Wed, Nov 6, 2024 at 12:34=E2=80=AFPM Frank Wunderlich <linux@fw-web.=
de>
> > wrote:
> >>
> >> Am 5. November 2024 17:28:57 MEZ schrieb Gregory CLEMENT
> >> <gregory.clement@bootlin.com>:
> >> >"Rob Herring (Arm)" <robh@kernel.org> writes:
> >> >
> >> >> While "phy-names" is allowed for sata-port nodes, the names used ar=
en't
> >> >> documented and are incorrect ("sata-phy" is what's documented). The=
 name
> >> >> for a single entry is fairly useless, so just drop the property.
> >> >>
> >> >> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> >> >
> >> >Applied on mvebu/dt64
> >> >
> >> >Thanks,
> >> >
> >> >Gregory
> >> >> ---
> >> >> Cc: Frank Wunderlich <linux@fw-web.de>
> >> >>
> >> >> There's also this 2 year old patch fixing other SATA errors[1] whic=
h
> >> >> was never picked up. :(
> >> >>
> >> >> [1] https://lore.kernel.org/linux-arm-kernel/20220311210357.222830-=
3-linux@fw-web.de/
> >>
> >> Hi
> >>
> >> How to deal with my patch pointed by rob?
> >
> > I believe it will conflict with mine. Can you rebase on top of
> > mvebu/dt64 and resend it.
> >
> > Rob
>
> i have rebased my patch [1], but it seems there are much more errors
> there (which i tried to fix there too).
>
> To be honest marvell is confusing to me finding the right file to patch
> because of many dtsi files included by each other mixed with some
> macros.
>
> at least some properties have to be documented in yaml:
>
> arch/arm64/boot/dts/marvell/armada-8040-db.dtb: sata@540000: Unevaluated
> properties are not allowed ('#address-cells', '#size-cells',
> 'dma-coherent', 'iommus' were unexpected)

iommus should be added to ahci-platform.yaml.

I think the others are just a side effect because sata-common.yaml
fails due to phy-names. When phy-names is fixed, they should
disappear.

> sata-node itself seems to be defined in
> arch/arm64/boot/dts/marvell/armada-cp11x.dtsi (adress/size-cells and
> dma-coherent are defined here)
>
> iommus seems to be added with
> 83a3545d9c37 2020-07-15 arm64: dts: marvell: add SMMU support Marcin
> Wojtas  (tag: mvebu-dt64-5.9-1)
> which seems not be documented in txt before i converted the binding.
>
> so something like adding this to the binding:
>
>    '#address-cells':
>      const: 1
>
>    '#size-cells':
>      const: 0
>
>    dma-coherent: true
>
>    iommus:
>      maxItems: 1
>
> dma-coherent was there in my version and seem to be broken with
>
> 6f997d4bb98b 2022-09-09 dt-bindings: ata: ahci-platform: Move
> dma-coherent to sata-common.yaml Serge Semin
>
> but maybe i only get the error for it because of my call with my yaml
> only
>
> ARCH=3Darm64 CROSS_COMPILE=3Daarch64-linux-gnu- make dtbs_check
> DT_SCHEMA_FILES=3DDocumentation/devicetree/bindings/ata/ahci-platform.yam=
l
>
> adress/size-cells is strange to me, i'm sure i tested the yaml against
> the example which also contains them...i guess it was defined somewhere
> else.
>
> and this one:
>
> arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: sata@540000:
> sata-port@0:phy-names:0: 'sata-phy' was expected
>         from schema $id: http://devicetree.org/schemas/ata/ahci-platform.=
yaml#
>
> i guess it is taken from here:
> Documentation/devicetree/bindings/ata/ahci-common.yaml:107:
> const: sata-phy
>
> if i understand it the right way then if phy-names is defined in
> sata-subnode it has to be value "sata-phy"...so basicly somewhere in the
> chains of dtsi's a phy-name is defined to another value..am i right?
>
> it looks like it is in
> arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi...if i drop the
> phy-names for the other sata-ports (below cp1_sata0)
>
> seems dropping them were missing from your patch as you remove another
> one in same file (&cp0_sata0)

Humm, not sure how I missed that. I was probably looking at warning
counts and the others registered higher.

Rob

