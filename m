Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E60A3C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 06:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0tHwYlbjNv+IOAqOwfpjCekQ4CCu0rh6z3eMye582FE=; b=rv6uGR/vXGnWx8vMI0QoGYVtjE
	Rb6NDQUtmeGp+Vm8h6KIDsDjFBUXa5YNuO8NNWMXAkIs5e4IQL13v9HTDfC1EZG3BjlbGJmU4bt6j
	kgYRilyv3ccFHuaWj9w2AT2pgBc1e/tb9q6ww6R/zsuaV6dsdVKKN69UEAW/63WZIbBbZbg8543is
	jY8IIwxM37WNsPSXNMPkYsoMQIagXvMmipyy7Rx7nH3yVvHXgtsBXo1TlkhodBCGR7bcHry9VDWxA
	r5EHj9aJwnzYd4IkzqerY2MCTUJhnGQljXO0GR+tHyMtLgevo5uKhw1s60F4b+Zyfj7v1/cg6r8jz
	uBlYBi/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujub6-0000000HPXb-1sfI;
	Thu, 07 Aug 2025 06:59:32 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujuYY-0000000HPCU-1qgf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Aug 2025 06:56:56 +0000
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250807065647epoutp043a844cdfa92b73be14129d2b4335c090~ZacDkQ6ud0084900849epoutp04U
	for <linux-arm-kernel@lists.infradead.org>; Thu,  7 Aug 2025 06:56:47 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250807065647epoutp043a844cdfa92b73be14129d2b4335c090~ZacDkQ6ud0084900849epoutp04U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1754549807;
	bh=0tHwYlbjNv+IOAqOwfpjCekQ4CCu0rh6z3eMye582FE=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=YIPPEn/6tzYnoC0dr0ncPgF6DHzVE5UwPkucWuTHP+PvLngOhnXKfFpvzOJNvsTEc
	 2EtCMCs9m59R9uGm9EagqckaCdcjNv08McNBsfcd1YANyyn8nVMZXu9/xvhWxLqXNt
	 BSpxbf7A8MKBigow3FVNEoa1e8aVZaRPHmYas3CU=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250807065646epcas5p17687f208b8b43806346e6bc2c9967e99~ZacCrN9OP0038200382epcas5p1W;
	Thu,  7 Aug 2025 06:56:46 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.92]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4byHyP0GMqz6B9m5; Thu,  7 Aug
	2025 06:56:45 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250807065644epcas5p125fc65c6d04e995d92f2afd90b7b1ade~ZacA7TA-d2200722007epcas5p1A;
	Thu,  7 Aug 2025 06:56:44 +0000 (GMT)
Received: from INBRO001561 (unknown [107.122.12.6]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250807065638epsmtip203f2ebd5a413ef0d6985fa5abfd83190~Zab8DqqO-1646416464epsmtip2T;
	Thu,  7 Aug 2025 06:56:38 +0000 (GMT)
From: "Pankaj Dubey" <pankaj.dubey@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, "'SeonGu Kang'"
	<ksk4725@coasia.com>, "'Jesper Nilsson'" <jesper.nilsson@axis.com>,
	"'Michael	Turquette'" <mturquette@baylibre.com>, "'Stephen Boyd'"
	<sboyd@kernel.org>, "'Rob Herring'" <robh@kernel.org>, "'Krzysztof
 Kozlowski'" <krzk+dt@kernel.org>, "'Conor Dooley'" <conor+dt@kernel.org>,
	"'Sylwester Nawrocki'" <s.nawrocki@samsung.com>, "'Chanwoo Choi'"
	<cw00.choi@samsung.com>, "'Alim	Akhtar'" <alim.akhtar@samsung.com>, "'Linus
 Walleij'" <linus.walleij@linaro.org>, "'Tomasz Figa'"
	<tomasz.figa@gmail.com>, "'Catalin	Marinas'" <catalin.marinas@arm.com>,
	"'Will Deacon'" <will@kernel.org>, "'Arnd	Bergmann'" <arnd@arndb.de>
Cc: "'kenkim'" <kenkim@coasia.com>, "'Jongshin Park'" <pjsin865@coasia.com>,
	"'GunWoo Kim'" <gwk1013@coasia.com>, "'HaGyeong Kim'" <hgkim05@coasia.com>,
	"'GyoungBo Min'" <mingyoungbo@coasia.com>, "'SungMin Park'"
	<smn1196@coasia.com>, "'Shradha Todi'" <shradha.t@samsung.com>, "'Ravi
 Patel'" <ravi.patel@samsung.com>, "'Inbaraj E'" <inbaraj.e@samsung.com>,
	"'Swathi K S'" <swathi.ks@samsung.com>, "'Hrishikesh'"
	<hrishikesh.d@samsung.com>, "'Dongjin	Yang'" <dj76.yang@samsung.com>, "'Sang
 Min Kim'" <hypmean.kim@samsung.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-arm-kernel@axis.com>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
	<soc@lists.linux.dev>
In-Reply-To: <ef3b8e12-0677-4e49-bf2c-b8136c9a6908@kernel.org>
Subject: RE: [PATCH 00/16] Add support for the Axis ARTPEC-8 SoC
Date: Thu, 7 Aug 2025 12:26:27 +0530
Message-ID: <013301dc0768$6f58dc40$4e0a94c0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGJY/8wx4BImu0YLFPVfwpfqUmFNgKXZrJuAgeQag4A83Fv2QHBXkcOAZGX7yoCWvFQXwHgUMUuAOJp+3+0i+6vkA==
Content-Language: en-us
X-CMS-MailID: 20250807065644epcas5p125fc65c6d04e995d92f2afd90b7b1ade
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250721064006epcas5p4617b0450e69f72c94d2b3ae7b1d200e7
References: <20250710002047.1573841-1-ksk4725@coasia.com>
	<847e908b-1073-46ea-93f3-1f36cc93d8b8@kernel.org>
	<bfdc2eddde554e1d1808dd8399bc6a693f681c9b.camel@coasia.com>
	<CGME20250721064006epcas5p4617b0450e69f72c94d2b3ae7b1d200e7@epcas5p4.samsung.com>
	<99977f38-f055-46ed-8eb0-4b757da2bcdd@kernel.org>
	<000501dc06ab$37f09440$a7d1bcc0$@samsung.com>
	<e334f106-d9f3-4a21-8cdd-e9d23dd2755d@kernel.org>
	<002001dc06b1$540dc980$fc295c80$@samsung.com>
	<ef3b8e12-0677-4e49-bf2c-b8136c9a6908@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_235655_132941_8B8F686B 
X-CRM114-Status: GOOD (  37.74  )
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

> Subject: Re: =5BPATCH 00/16=5D Add support for the Axis ARTPEC-8 SoC
>=20
> On 06/08/2025 11:05, Pankaj Dubey wrote:
> >
> >> Also SAME strict DT compliance profile will be applied. (see more on
> >> that below)
> >>
> >>>
> >>> Given that ARTPEC-8 is a distinct SoC with its own set of IPs, we bel=
ieve
> it's
> >> reasonable
> >>> to create a separate directory for it, similar to FSD.
> >>
> >> No. It was a mistake for FSD to keep it separate why? Because there is
> >> no single non-Samsung stuff there. I am afraid exactly the same will
> >> happen there.
> >>
> >
> > I am not sure, why you are saying this as a mistake, in case next versi=
on of
> FSD
>=20
>=20
> My mistake that I agreed on that, based on promise that =22there will be
> non Samsung stuff=22 and that =22non Samsung stuff=22 never happened.
>=20

I am not authorized to comment on FSD's non Samsung stuff at this moment.
But I got your point.

> > or ARTPEC is manufactured (ODM) by another vendor in that case, won't i=
t
> > create problems?
>=20
>=20
> No problems here. Non-Samsung Artpec/Axis soc will not go there. It will
> go the top-level axis directory, just like artpec-6
>=20

Okay, understood. I assume Axis team will be fine with this approach.
Let me align with them internally and address all the review comments in v2=
.=20

>=20
> >
> > For example ARTPEC-6/7 (ARM based) have their own directories as
> =22arch/arm/boot/dts/axis/=22
> > These were not Samsung (ODM) manufactures SoCs.
> >
> > But ARTPEC-8/9 (ARM64) based SoCs are samsung manufactured. What if
> the next version say
> > ARTPEC-10 is not samsung manufactured, so different version of products
> (SoCs) from
> > same vendor (OEM), in this case Axis, will have code in separate direct=
ories
> and with different maintainers?
>=20
> It will be the same with Google Pixel for whatever they decide in the
> future. dts/exynos/google/ + dts/google/.
>=20
> I know that this is not ideal, but for me grouping samsung stuff
> together is far more important, because there is much, much more to
> share between two SoCs designed by Samsung, than Axis-9 and future
> non-Samsung Axis-10. And I have =60git grep=60 as argument:
> git grep compatible -- arch/arm64/boot/dts/tesla/
>=20
> and point me to any Tesla IP. Zero results.
>=20
>=20
> >
> >> Based on above list of blocks this should be done like Google is done,
> >> so it goes as subdirectory of samsung (exynos). Can be called axis or
> >> artpec-8.
> >
> > I will suggest to keep axis, knowing the fact that sooner after artpec-=
8
> patches gets approved and merged
> > we have plan to upstream artpec-9 (ARM64, Samsung manufactured) as
> well.
> >
> >>
> >> To clarify: Only this SoC, not others which are not Samsung.
> >>
> >>>
> >>> We will remove Samsung and Coasia teams from the maintainers list in
> v2
> >> and only
> >>> Axis team will be maintainer.
> >>
> >> A bit unexpected or rather: just use names of people who WILL be
> >> maintaining it. If this is Jesper and Lars, great. Just don't add
> >> entries just because they are managers.
> >
> > AFAIK, Jesper will be taking care.
> >
> >>
> >>>
> >>> Maintainer list for previous generation of Axis chips (ARM based) is
> already
> >> present,
> >>> so this will be merged into that.
> >>
> >> Existing Artpec entry does not have tree mentioned, so if you choose
> >> above, you must not add the tree, since the tree is provided by Samsun=
g
> SoC.
> >>
> >
> > OK
> >
> >> OTOH, how are you going to add there strict DT compliance? Existing ax=
is
> >> is not following this, but artpec-8, as a Samsung derivative, MUST
> >> FOLLOW strict DT compliance. And this should be clearly marked in
> >> maintainer entry, just like everywhere else.
> >>
> >
> > As I said this is tricky situation, though artpec-8 is derivative of sa=
msung, we
> can't confirm
> > if future versions (> 9) will be samsung derivative.
> >
> > But this would be case for all such custom ASIC manufactured by samsung=
,
> so I would like to
> > understand how this will be handled?
>=20
>=20
> I suggest to do the same as Google and when I say Google in this email,
> I mean Pixel/GS101. Google was easier because there was no prior entry
> and Axis has, so you will have two Axis entries. But I don't see how we
> can add clean-dts profiles to the existing Axis entry, if you decide to
> include Artpec-8 in that one.
>=20

Okay we will have separate dts profile aligned with Exynos DT compliance fo=
r
ARM64 based Axis SoCs which are manufactured by Samsung at this moment.=20

>=20
> Best regards,
> Krzysztof


