Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD59AC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 21:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EIGTeSFGl+y3lSh82LnuwOwDvyKO/NJTdsF2vBpDxJ0=; b=rKH4MdDWSjijECycaPrW5P5Wtk
	jQpZykTRmSx9lHhmIxjiEEgWcBeutYciOUK857Bahi64bFVOlatqG6iksudfFN5pnGJRosVomZaUp
	6yzb10lOPVwe7SgEeEEWN3f53z4bLl6CxXtJ7e1VsZuTyVle4cTzJbJYciKbhDKuOMRpV93U8VZ0s
	phiqNA5DlAN3lJGl1JImzEv5EW4r7pfrhSNVXtydcD274dpfFxgTpmZaPQrzk1y2l6Xi4OTTfG7W+
	88vuyNtsKJmhF9P1a+6kj2+d+dAmVZOz52aNssxJ0Nadcu0KHd1hyBHyEaoBMl5AfsnLgMaUFX2Cl
	Z9Cp207g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXRtb-0000000CfBX-2N0W;
	Thu, 03 Jul 2025 21:55:07 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXOfH-0000000CEpq-0r5z;
	Thu, 03 Jul 2025 18:28:08 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1751567269; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=EAwRzK/atLZp81y99CJDlb538jQm470pWJL4qPIlO8yDaz/DWV2sIUxttUGQHjEl44LLYuE4sHAVToGp3ItB4hvFekOq1tkPgSHMhWmyBO0b+edEooKS8kV0ovrSYr3icN1n4sMdmnLop98XqG7Sk9kEt8I1Ab6bAzG/USpdsiA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1751567269; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=EIGTeSFGl+y3lSh82LnuwOwDvyKO/NJTdsF2vBpDxJ0=; 
	b=oB0LfmZBG66ZUZ/wv2kO3rQ97NauunYjM3/lZhpzefJ4wUSNUf15RztBrKGu7NBuyE4lFC5hwuyj0wBCPTHU3df5Eiq/AV1roJVSMbp0NyYEYnzBRPBNR0yKbmGWAgK0ZHyWewIRMIjFESDHy9RjAEGPSiA7vsdR0h17mRUOduQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nfraprado@collabora.com;
	dmarc=pass header.from=<nfraprado@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1751567269;
	s=zohomail; d=collabora.com; i=nfraprado@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=EIGTeSFGl+y3lSh82LnuwOwDvyKO/NJTdsF2vBpDxJ0=;
	b=lB5lACBUqAuSqEfnmk/y2Ek/zH4biccP08KIK/ORsFGlJv/GtpNvLOKD96lJEfkC
	io0PymrNsahr9NRUjcE28owwMk57ai76yrZR6iFrzMzFSYWU6z6+jjXEMIOVNENEopU
	OUosdZjl2cu7sFBOMDJ6QRDtaa1d5+CmypeIdqss=
Received: by mx.zohomail.com with SMTPS id 1751567267207310.7183175991179;
	Thu, 3 Jul 2025 11:27:47 -0700 (PDT)
Message-ID: <5bfcd5e059e86a96807426bfc6543209d09b557f.camel@collabora.com>
Subject: Re: [PATCH 00/10] pmdomain: Partial refactor, support modem and RTFF
From: =?ISO-8859-1?Q?N=EDcolas?= "F. R. A. Prado" <nfraprado@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-mediatek@lists.infradead.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, ulf.hansson@linaro.org, y.oudjana@protonmail.com, 
	fshao@chromium.org, wenst@chromium.org, lihongbo22@huawei.com, 
	mandyjh.liu@mediatek.com, mbrugger@suse.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-pm@vger.kernel.org, kernel@collabora.com
Date: Thu, 03 Jul 2025 14:27:45 -0400
In-Reply-To: <20250703110247.99927-1-angelogioacchino.delregno@collabora.com>
References: <20250703110247.99927-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_112807_325660_924AA406 
X-CRM114-Status: GOOD (  10.65  )
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

On Thu, 2025-07-03 at 13:02 +0200, AngeloGioacchino Del Regno wrote:
> This series is a subset of [1], leaving out the Hardware Voter
> specific
> bits for MT8196 until the discussion around it reaches a conclusion.
[..]
> Compared to v1 in [1]:
> =C2=A0- Changed mediatek,bus-protection to access-controllers
> =C2=A0=C2=A0 as suggested by Rob (thanks!)
> =C2=A0- Added commits to document #access-controller-cells on all of
> =C2=A0=C2=A0 the access control providers
[..]
> [1]
> https://lore.kernel.org/all/20250623120154.109429-1-angelogioacchino.delr=
egno@collabora.com
>=20
> AngeloGioacchino Del Regno (10):
> =C2=A0 dt-bindings: memory: mtk-smi: Document #access-controller-cells
> =C2=A0 dt-bindings: clock: mediatek: Document #access-controller-cells
> =C2=A0 dt-bindings: power: mediatek: Document access-controllers property
> =C2=A0 pmdomain: mediatek: Refactor bus protection regmaps retrieval
> =C2=A0 pmdomain: mediatek: Handle SoCs with inverted SRAM power-down bits
> =C2=A0 pmdomain: mediatek: Move ctl sequences out of power_on/off
> functions
> =C2=A0 pmdomain: mediatek: Add support for modem power sequences
> =C2=A0 pmdomain: mediatek: Add support for RTFF Hardware in MT8196/MT6991
> =C2=A0 pmdomain: mediatek: Convert all SoCs to new style regmap retrieval
> =C2=A0 arm64: dts: mediatek: Convert all SoCs to use access-controllers

As already pointed out by rob's bot you're missing adding the
properties to

mediatek,mt8195-sys-clock.yaml
mediatek,mt8188-sys-clock.yaml

on patch 2. But other than that, for the whole series (since the tag
wasn't added from the previous version):

Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>

--=20
Thanks,

N=C3=ADcolas

