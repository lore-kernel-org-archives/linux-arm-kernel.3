Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F09FFE77180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 05:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=30N3dpTqK5V8COXXpuZJSP5AzG71obIsHJ9sl+Iv05s=; b=kWzTw04rhY+JhC
	MhHZyPS+bN0hCbmwDkxnWXXy7DHzC/3LBVKDaI8V7ZH2sx40sK/JAfuyOfBV2jN3EgUl96d15isMr
	AYJyWDStemAqY/UzYBoMkjQCmep1I7sfNLsREvT3D7mISZe5Qlo6qs7I3UrnEmq93WefkVMj2h4EE
	ig+apxiNJ/hgjHfUfGKMuXcmHGZWIoGbLQA0RubGuF0/ryEP8046umRGG2wEt1ET2iklifomMfo20
	+xL5Pv1Ypdq+sIZcXFbg6A4eKtetACuOuZ72rNQ3kwoSoVYWAKM4VUNs4FJ5IirPkLntwPfTPSZTp
	bIFSZ4pFw26JPPgO3HGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLF0H-0000000Dnyg-0Rr3;
	Wed, 11 Dec 2024 05:11:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLEzD-0000000DnrL-2F7b;
	Wed, 11 Dec 2024 05:10:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EB5375C62B9;
	Wed, 11 Dec 2024 05:09:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19464C4CEE1;
	Wed, 11 Dec 2024 05:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733893809;
	bh=YdX1dc6xsEAC92Xthg31J1U7TalgtZEvoo0qN6qkuRY=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=Krq5QyUjf0EEDOcYntNfcf80ez+thWwtLj9n9hk958Ra4O9siL3nA5Pl422U1BnkO
	 PDTfyQZfZNf2j37VR/Gqp6GtY10s/DB7Vo8OOwnqvqN2ZVR6+UfLMOIGfhTD7un6L1
	 iIsLH18Wuy46+8gGFu+x7GjchFROyL+aVk7JOZ5gkIRYbXrAoA0WhCU2mO0TMSr2eE
	 P0bVwxOtLgcG7Pd2stswbU/WnAFcD6PjAp5WafJ3m+P6X9BdeNmwJzqZbi5+pN0BNU
	 jomzrEkdjjPbPJWuIx0poiGw9LuozeaReYS79yYq6jWf6zJEuFU3vb4Q1P0k+f23KW
	 hJxlr/TtS1CNA==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30227ccf803so24179621fa.2;
        Tue, 10 Dec 2024 21:10:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUrf673ohZmpPYVnYo5GJ5HoslNKOmAZo6RulNysXGjRjKBIAlNhMOtWgfoUck/NVaoXkuxRQkSNz4GbM5YcNY=@lists.infradead.org, AJvYcCVOsL9bk3cQNRbp7VEmrqD6ORMj23SSl19j7zEntaRwn+EzHJujir+Tg3khM9bs87q8HyMUWdzTcmPAVmDZ+kve@lists.infradead.org
X-Gm-Message-State: AOJu0YzzZ8AY+OZZ9IIJF0BWz8IqMwQkg87VPjEpXfHLFRiU8IKlmkPo
	uJderbO1it9EpMLX7VJebEy5iNo+/ty0WmUgHIoTtHoRNX8se892/9/2g22gvVTrUN9Psi3/OoC
	XEJkmdguWIBkBkDaR+7UhxHv8ZC0=
X-Google-Smtp-Source: AGHT+IF6N4Na/k+b/kefNQKbmVXbyAnVl/Bv7G3C8f7c+yra9jFGmNFSnmVvDOEzo13KT4U9uvLIdgjGdQPdboaPjQY=
X-Received: by 2002:a05:651c:b2a:b0:300:3a15:8f15 with SMTP id
 38308e7fff4ca-30240d23617mr5158551fa.14.1733893807383; Tue, 10 Dec 2024
 21:10:07 -0800 (PST)
MIME-Version: 1.0
References: <20241210092614.3951748-1-wenst@chromium.org> <173386568696.497617.3727087837255802552.robh@kernel.org>
In-Reply-To: <173386568696.497617.3727087837255802552.robh@kernel.org>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Wed, 11 Dec 2024 13:09:54 +0800
X-Gmail-Original-Message-ID: <CAGb2v65D9cdTRoEwwpTUcRZBnrdJ+6UZ-osN1vpUP_JxtJMr8Q@mail.gmail.com>
Message-ID: <CAGb2v65D9cdTRoEwwpTUcRZBnrdJ+6UZ-osN1vpUP_JxtJMr8Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: mediatek: mt8173-elm: Fix MT6397 PMIC
 sub-node names
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_211011_667860_82BABD5F 
X-CRM114-Status: GOOD (  19.48  )
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, Dec 11, 2024 at 5:43=E2=80=AFAM Rob Herring (Arm) <robh@kernel.org>=
 wrote:
>
>
> On Tue, 10 Dec 2024 17:26:12 +0800, Chen-Yu Tsai wrote:
> > The MT6397 PMIC bindings specify exact names for its sub-nodes. The
> > names used in the current dts don't match, causing a validation error.
> >
> > Fix up the names. Also drop the label for the regulators node, since
> > any reference should be against the individual regulator sub-nodes.
> >
> > Fixes: 689b937bedde ("arm64: dts: mediatek: add mt8173 elm and hana boa=
rd")
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> >  arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
>
>
> My bot found new DTB warnings on the .dts files added or changed in this
> series.
>
> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> are fixed by another series. Ultimately, it is up to the platform
> maintainer whether these warnings are acceptable or not. No need to reply
> unless the platform maintainer has comments.
>
> If you already ran DT checks and didn't see these error(s), then
> make sure dt-schema is up to date:
>
>   pip3 install dtschema --upgrade
>
>
> New warnings running 'make CHECK_DTBS=3Dy mediatek/mt8173-evb.dtb' for 20=
241210092614.3951748-1-wenst@chromium.org:
>
> arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: regulators: buck_vpca15: Une=
valuated properties are not allowed ('regulator-compatible' was unexpected)
>         from schema $id: http://devicetree.org/schemas/regulator/mediatek=
,mt6397-regulator.yaml#
> arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: regulators: buck_vpca7: Unev=
aluated properties are not allowed ('regulator-compatible' was unexpected)
>         from schema $id: http://devicetree.org/schemas/regulator/mediatek=
,mt6397-regulator.yaml#
> arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: regulators: buck_vsramca15: =
Unevaluated properties are not allowed ('regulator-compatible' was unexpect=
ed)
>         from schema $id: http://devicetree.org/schemas/regulator/mediatek=
,mt6397-regulator.yaml#
> arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: regulators: buck_vsramca7: U=
nevaluated properties are not allowed ('regulator-compatible' was unexpecte=
d)
>         from schema $id: http://devicetree.org/schemas/regulator/mediatek=
,mt6397-regulator.yaml#
> arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: regulators: buck_vcore: Unev=
aluated properties are not allowed ('regulator-compatible' was unexpected)
>         from schema $id: http://devicetree.org/schemas/regulator/mediatek=
,mt6397-regulator.yaml#
> arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: regulators: buck_vgpu: Uneva=
luated properties are not allowed ('regulator-compatible' was unexpected)
>         from schema $id: http://devicetree.org/schemas/regulator/mediatek=
,mt6397-regulator.yaml#
> arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: regulators: buck_vdrm: Uneva=
luated properties are not allowed ('regulator-compatible' was unexpected)
>         from schema $id: http://devicetree.org/schemas/regulator/mediatek=
,mt6397-regulator.yaml#
> arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: regulators: buck_vio18: Unev=
aluated properties are not allowed ('regulator-compatible' was unexpected)
>         from schema $id: http://devicetree.org/schemas/regulator/mediatek=
,mt6397-regulator.yaml#
> arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: regulators: ldo_vtcxo: Uneva=
luated properties are not allowed ('regulator-compatible' was unexpected)
>         from schema $id: http://devicetree.org/schemas/regulator/mediatek=
,mt6397-regulator.yaml#
> arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: regulators: ldo_va28: Uneval=
uated properties are not allowed ('regulator-compatible' was unexpected)
>         from schema $id: http://devicetree.org/schemas/regulator/mediatek=
,mt6397-regulator.yaml#
> arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: regulators: ldo_vio28: Uneva=
luated properties are not allowed ('regulator-compatible' was unexpected)
>         from schema $id: http://devicetree.org/schemas/regulator/mediatek=
,mt6397-regulator.yaml#
> arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: regulators: ldo_vusb: Uneval=
uated properties are not allowed ('regulator-compatible' was unexpected)
>         from schema $id: http://devicetree.org/schemas/regulator/mediatek=
,mt6397-regulator.yaml#
> arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: regulators: ldo_vcama: Uneva=
luated properties are not allowed ('regulator-compatible' was unexpected)
>         from schema $id: http://devicetree.org/schemas/regulator/mediatek=
,mt6397-regulator.yaml#
> arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: regulators: ldo_vmc: Unevalu=
ated properties are not allowed ('regulator-compatible' was unexpected)
>         from schema $id: http://devicetree.org/schemas/regulator/mediatek=
,mt6397-regulator.yaml#
> arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: regulators: ldo_vmch: Uneval=
uated properties are not allowed ('regulator-compatible' was unexpected)
>         from schema $id: http://devicetree.org/schemas/regulator/mediatek=
,mt6397-regulator.yaml#
> arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: regulators: ldo_vemc3v3: Une=
valuated properties are not allowed ('regulator-compatible' was unexpected)
>         from schema $id: http://devicetree.org/schemas/regulator/mediatek=
,mt6397-regulator.yaml#
> arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: regulators: ldo_vgp1: Uneval=
uated properties are not allowed ('regulator-compatible' was unexpected)
>         from schema $id: http://devicetree.org/schemas/regulator/mediatek=
,mt6397-regulator.yaml#
> arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: regulators: ldo_vgp2: Uneval=
uated properties are not allowed ('regulator-compatible' was unexpected)
>         from schema $id: http://devicetree.org/schemas/regulator/mediatek=
,mt6397-regulator.yaml#
> arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: regulators: ldo_vgp3: Uneval=
uated properties are not allowed ('regulator-compatible' was unexpected)
>         from schema $id: http://devicetree.org/schemas/regulator/mediatek=
,mt6397-regulator.yaml#
> arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: regulators: ldo_vgp4: Uneval=
uated properties are not allowed ('regulator-compatible' was unexpected)
>         from schema $id: http://devicetree.org/schemas/regulator/mediatek=
,mt6397-regulator.yaml#
> arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: regulators: ldo_vgp5: Uneval=
uated properties are not allowed ('regulator-compatible' was unexpected)
>         from schema $id: http://devicetree.org/schemas/regulator/mediatek=
,mt6397-regulator.yaml#
> arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: regulators: ldo_vgp6: Uneval=
uated properties are not allowed ('regulator-compatible' was unexpected)
>         from schema $id: http://devicetree.org/schemas/regulator/mediatek=
,mt6397-regulator.yaml#
> arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: regulators: ldo_vibr: Uneval=
uated properties are not allowed ('regulator-compatible' was unexpected)
>         from schema $id: http://devicetree.org/schemas/regulator/mediatek=
,mt6397-regulator.yaml#

Ack. I already prepared another series to address these.

ChenYu

