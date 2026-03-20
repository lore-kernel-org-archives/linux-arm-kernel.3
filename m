Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D151C1098787
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 14:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hWgkyHieI+lx6uZjlbxnNfikaImkXlaHPtGyHRNFVhw=; b=MQDvQloBiXqK/l+ahqdLBskhXR
	jNlaRhNZ/PGVIA3MJPAmlbcnvklrVDV5s8e6ioFpdD1BtK9Ky+8VfkbY8ON1MkRSD1L4VPhDmWuaz
	0B5vXFzZWBk2X/ACkOedvUQsqTM8Sfp5czXCod2QMrfjRnIDpXTL3BkrJU1YFRcxIZInsEj7ppbU+
	z+s7pbr9rRakMf5GK14fgQGYzhOp++egEQ3jhvGyr0pYCOCzcvDnqlhZERzeCu2bjIUPmnG2Y6+bL
	jccXOFpD0THbEfJJX+KRgZ7GW96ae5JvOrn+szI/pyg6aMkyMbhosNaHXZDxKCI3mD2q8IVzDwRDr
	1X2clLbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3aUs-0000000CuJf-2Fgs;
	Fri, 20 Mar 2026 14:06:42 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3aUp-0000000CuJH-1Ye3;
	Fri, 20 Mar 2026 14:06:40 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1774015588; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Wr9FbiYdbxLUWCL9K7rYZTrOQKOpu9kK+amZrXcg3V/3dA7MhRwi4q1dMjrnhbO9vp/iDphZtG4QPo4ZSFQ4WPedmabCfwULB+KEu29IwZimOWorIWFqFBOgI/YbAxrtwFi4jbqkkkoTPkor7e+mZh90+AS548pTVG0fSxpeqCE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774015588; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=hWgkyHieI+lx6uZjlbxnNfikaImkXlaHPtGyHRNFVhw=; 
	b=Up3hbl2VH50Vli4WhIUpalEprB++a4eLM18qmYa2MNfb03rVZHHVoaHqRh2nB9m688S1QWByjhR0Chot7vWBAsSgY9mjFFE54Yh+B9qXwUVTLrmjW6JPovTRxnAWX2w+JhoNW+GOYAN4KDthE5y5Y39OoStSjxsqh/TCYpCdVKQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=louisalexis.eyraud@collabora.com;
	dmarc=pass header.from=<louisalexis.eyraud@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774015588;
	s=zohomail; d=collabora.com; i=louisalexis.eyraud@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=hWgkyHieI+lx6uZjlbxnNfikaImkXlaHPtGyHRNFVhw=;
	b=PvQmJThlSKXxXoG1gYCgwyJkw7EO+zihVPm2ShJ1cr5TIwG4J9X+MS8i7xC+VXJe
	Rysi6qqqX55sU2Ko0WlJB5cz8Bp/TsX2GEYn76k7suOZ476X9SvrRVi981QUk5Ue/B8
	XUVEz+j0SttDunBcKfkhFVt1iZq4hWEt00ubfBBU=
Received: by mx.zohomail.com with SMTPS id 1774015585746684.6715664799156;
	Fri, 20 Mar 2026 07:06:25 -0700 (PDT)
Message-ID: <32a03f60a50fc0fc3e9a3b5bfb2c06ce694054cf.camel@collabora.com>
Subject: Re: [PATCH 3/4] arm64: dts: mediatek: add device-tree for Genio
 720-EVK board
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
To: David Lechner <dlechner@baylibre.com>, Greg Kroah-Hartman	
 <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, Rob
 Herring	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley	 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sean
 Wang <sean.wang@mediatek.com>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Date: Fri, 20 Mar 2026 15:06:20 +0100
In-Reply-To: <23778b52-9aa2-49fc-946b-e858b99fc3c9@baylibre.com>
References: <20251203-add-mediatek-genio-520-720-evk-v1-0-df794b2a30ae@collabora.com>
	 <20251203-add-mediatek-genio-520-720-evk-v1-3-df794b2a30ae@collabora.com>
	 <23778b52-9aa2-49fc-946b-e858b99fc3c9@baylibre.com>
Organization: Collabora Ltd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_070639_460834_CBC49C8E 
X-CRM114-Status: GOOD (  30.03  )
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

Hi David,

On Thu, 2026-02-19 at 18:09 -0600, David Lechner wrote:
> On 12/3/25 7:59 AM, Louis-Alexis Eyraud wrote:
> > Add support for MediaTek MT8189 SoC and its variants, and a device-
> > tree
> > for the basic hardware enablement of the Genio 720-EVK board, based
> > on
> > MT8391 SoC.
> >=20
> > MT8391 SoC is a variant of MT8189 SoC with a difference for the Arm
> > Cortex-A78 CPU core maximum frequency (2.6 Ghz for MT8391, 3 Ghz
> > for
> > MT8189). MT8391 hardware register maps are identical to MT8189.
> >=20
> > The Genio 720-EVK board has following features:
> > =C2=A0 - MT8391 SoC
> > =C2=A0 - MT6365 PMIC
>=20
> Is MT6365 PMIC ...
>=20
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8391-genio-common.dtsi
> > b/arch/arm64/boot/dts/mediatek/mt8391-genio-common.dtsi
> > new file mode 100644
> > index
> > 0000000000000000000000000000000000000000..744641916952111a4b389cf6a
> > dbd27c429b6eff2
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/mediatek/mt8391-genio-common.dtsi
> > @@ -0,0 +1,555 @@
> > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > +/*
> > + * Copyright (c) 2025 Collabora Ltd.
> > + * Author: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> > + */
> > +
> > +#include "mt6359.dtsi"
>=20
> ... really 100% identical to MT6359 PMIC?
>=20
I did not find any info in the LKML archives if this topic was
discussed in the past.

The MT6365 PMIC seems to be more a rebranded MT6359P.
They have the exact same buck converter and LDOs, and features.

There are several boards based on MT8370, MT8390 and MT8395 SoC that
integrate the MT6365 PMIC and whose devicetree, present in upstream,
use the mt6359.dtsi for this PMIC support:
 - Mediatek Genio 1200 EVK
 - Mediatek Genio 700 EVK
 - Mediatek Genio 510 EVK
 - Radxa NIO-12L
Probably a couple more.

The Genio 1200 EVK board devicetree was the first one that used
"mediatek,mt6359" compatible for this PMIC.

As far as I know, there is no known compatibility issue.
The MT6359 regulator kernel driver, in particular, does recognise it as
MT6359P (same identifier) and the MT6365 datasheet shows it has the
same register layout from what I compared for the buck and ldos.

So 100% identical? I cannot say it for sure but I don't have any info
telling otherwise.

> Asking because I'm working on this in U-Boot and would be helpful
> to know that this is correct. Would probably be a good idea to
> mention
> it in the commit message too to show this is intentional.
>=20
>=20
> And I wonder if it would be a good idea to add a compatible with
> fallback
> just to be sure.
>=20
> &pmic {
> 	compatible =3D "mediatek,mt6365", "mediatek,mt6359";
> };

You're right.=C2=A0
That's make sense to document a proper compatibility in the dt-bindings
and use it the devicetree, not only for pmic node but also but its
subdevices (auxadc, codec, regulator, rtc, pmic-keys).

As the Genio 720 EVK is not the only board concerned,=C2=A0it would be
better that I send another series to do such cleanup, for instance one
that adds a new mt6365.dtsi before using it (instead of mt6359.dtsi) in
the Genio 720 EVK devicetree.

Regards,
Louis-Alexis

