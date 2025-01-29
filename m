Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61733C02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jan 2025 16:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wPGGfc1qwmOrQZGLlJNOWgBoAZRzR/BbTbOKRT5al8k=; b=2ak1hybXfvqdl/GJcpgvRK9d8Y
	sSSEIPnB6w7poVdkRf7Vtw0CCl4q1FDHeCX34GfpapLitHdBlq7Bshvf+4wshl7bMpZNF4lZz4Q2E
	LRz/NyFnSu+57dfGnVNDLKkxPcbH8ZEY1p2PDN8HVSOiZ6ephSFvLPQ8IX9ourg/3EKHUn8nUt9s2
	QYoVhpinmVuqWFrfi8GNuXrCCtCbPTtZDvEtQrzbuiEJc/MJ64isU05tRGqqjNpQTBtY3+K/IrD/q
	0a6FdFJjTEQCzu7XguoztiAEcmGt9UbSGQdPUrH4H+bxOIPS1k1/hDv+lnSW9Glj6R5CbK3rAKaEq
	i/YtSNPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdBJQ-00000007QfY-3dCh;
	Wed, 29 Jan 2025 16:53:12 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdBHJ-00000007QIb-2zyw;
	Wed, 29 Jan 2025 16:51:03 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1738169451; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UgrcL6rMN/4wU8bq3QwCfqoUIJD14WOSBWTAEdNDTNn2oXvmKKlCeC8wFspeGiQad5gFf6LED4uJb/SNP0VFW90337Whkh/4SK4PYFrS57uGRnirxsXGfFsQbCtNCxu3yvP+pDXZibjUgKevgz89uDnByim6O8HrWIsez/BVILQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1738169451; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=wPGGfc1qwmOrQZGLlJNOWgBoAZRzR/BbTbOKRT5al8k=; 
	b=NG7AtYb2a2Q5uo4vpFBu/10e+848SICc0+d/3SduQISEn8qKRlBI1j7E1wi3ijsWsd4RICHqZybgQYOoIqJUPX5XlWeQznaAn6LF+wDPmUNfCDLAFge0Y+/kH6OAjfkVJ090In9m2yAC4XYDDKIU194LOeGIpen1EXTtjyb+sV4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1738169451;
	s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=wPGGfc1qwmOrQZGLlJNOWgBoAZRzR/BbTbOKRT5al8k=;
	b=Z1AkDh9apOD+PwP6D7Nj3dw6dqAoxWhEZZpoE5MTrY+XFHQCP9YIKzk3aDle8Zw3
	Igc8acgOSzr2oLLACUvyF3DZ48n/hhVyo6eUi6KajltJ7gnrpSFAIkWISzEhoajoj+w
	hneSRZi4L/It/R0udbKYbQ+V4OfqoE1V5VU13v3A=
Received: by mx.zohomail.com with SMTPS id 1738169445054994.6577657400422;
	Wed, 29 Jan 2025 08:50:45 -0800 (PST)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Cc: linux-kernel@vger.kernel.org, Diederik de Haas <didi.debian@cknow.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Dragan Simic <dsimic@manjaro.org>, Alexey Charkov <alchark@gmail.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Andy Yan <andy.yan@rock-chips.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 1/3] media: rockchip: Introduce the rkvdec2 driver
Date: Wed, 29 Jan 2025 11:50:43 -0500
Message-ID: <8541055.T7Z3S40VBb@trenzalore>
In-Reply-To: <CE4343FE-94AA-4F84-8C43-8366013AED84@gmail.com>
References: <20240615015734.1612108-1-detlev.casanova@collabora.com>
 <5969581.LvFx2qVVIh@arisu> <CE4343FE-94AA-4F84-8C43-8366013AED84@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_085101_801034_39F5E440 
X-CRM114-Status: GOOD (  20.83  )
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

Hi Piotr,

On Wednesday, 29 January 2025 09:48:51 EST Piotr Oniszczuk wrote:
> > Wiadomo=C5=9B=C4=87 napisana przez Detlev Casanova <detlev.casanova@col=
labora.com> w
> > dniu 15 cze 2024, o godz. 21:44:
> >=20
> >=20
> >=20
> >=20
> > Yes, the vdpu34x decoder on rk356x socs should be supported by this dri=
ver
> > but I don't have boards to test that unfortunately.
>=20
> Detlev,
>=20
> Just FYI:
>=20
> I done some tests of rkvdec2 on 6.12.11 on 3588, 3568 and 3566
>=20
> For enabling rkvdec2 on 356x i:
> -add 356x compatible in rkvdec2.c
> -add dtsi nodes like this:
> https://github.com/warpme/minimyth2/blob/master/script/kernel/linux-6.12/=
fi
> les/1078-arm64-dtsi-rockchip-rk356x-add-rkvdec2-video-decoder-nodes.patch
>=20
> With this i can say:
> -on rk3588 i have some hevc 4k decoding perfectly but some others are
> failing -on rk3566/3568 only subset of 3588=E2=80=99s samples is decoded =
well. (but
> is works then works perfectly fine) -when not failing on 3588 sample fails
> on 356x - is see errors like:
>=20
> [   95.666669] iova: 0x00000000f2e80000 already mapped to 0x0000000037378=
000
> cannot remap to phys: 0x000000002f8c0000 prot: 0x3 [   95.745082] iova:
> 0x00000000f2f46000 already mapped to 0x00000000372b6000 cannot remap to
> phys: 0x000000003a403000 prot: 0x3 [   95.822012] iova: 0x00000000f2ee6000
> already mapped to 0x0000000037126000 cannot remap to phys:
> 0x000000003a803000 prot: 0x3 [   95.896802] iova: 0x00000000f2ec6000
> already mapped to 0x0000000029fe6000 cannot remap to phys:
> 0x000000003a403000 prot: 0x3 turning-off iommu makes above errors disappe=
ar
> - but sample still fails.

I suppose you tested with my hevc branch, which is not really ready yet (So=
me=20
ref frames will work but usually, it won't) Can you confirm which branch/co=
mmit=20
you based your tests on ?

=46or the iommu, do you see those errors like that only on 356x or also on =
3588=20
? The hevc branch should have the iommu patches to fix that kind of things.=
=20
(but note that hevc support is really new, so it may have bugs with buffer=
=20
allocations)

> If anybody hints me for way/tool to analyse of playing/failing samples to
> catch: what encoding specifics makes given sample failing to decode  on
> rkvdec2 - i'll be more that happy to provide details=E2=80=A6 (doing simp=
le
> mediainfo <file> shows no differences for me=E2=80=A6)

=46ew features are supported for HEVC as of now:
 - No scanlist support (only default 16x16 blocks will work)
 - Long term reference frames are also not configured yet.
 - hevc 10 bits is also not supported yet

These are specific to the encoding and mediainfo won't really give you=20
information on that, except maybe on the 10 bits format.

You can also checkout YUView (https://github.com/IENT/YUView) to get=20
information on media files structure, but I have had issues with HEVC suppo=
rt=20
lately.

Regards,

Detlev.




