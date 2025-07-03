Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A866C83030
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 11:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PUMUxTQyz4Rw+I/k6r4nKllDMvLQcH1q/9NQSkvh/Tc=; b=KtnraXP1uae4l/U0mORtOAbIiq
	pqqafeEb80kNQh64ri6ZQZBKn3OrjrfIowdlHElmxb1F83Sr9Wi/e7L3WfhHfl7oeSygJH/LtkMag
	3ZSB9w8EXJZYA0x6utRmqMr2HjaDY26NS8eb7QgL/L4We/dtoHZwtvbgwiQV8w4R0t9sc7lLz44nM
	nYjIuSe51a+/ZEGpBClo7Dq+Rtc4mTutsRJzzfM9q7Hk+jkciM+AZxmk9t308l5qyH735d6Td98rN
	2vsnIVll6DYqJC5J/rt9f83j9iNNbnyM9skChM5fLFwYwjQSMaQa9KdPdOsNlje+CpY+otYZr3EVT
	TyXyRZmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXIVK-0000000BEJp-1Ita;
	Thu, 03 Jul 2025 11:53:26 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXHLW-0000000B1qj-1kVn;
	Thu, 03 Jul 2025 10:39:16 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1751539145; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=OGmTYjb87a/HQQfJ80nuoMM3J5giu9DFlFLheBZM1lWvnWDiOMp9wWhc6sM77tEy1ydXz087rntZgP0XRPFayh7/+6AIYl4/GsM1wkQ3n8qa6H0FCKLoRUVY6HRRJ61CZ9b1OB/QBYNTWJ3UA09pcCeMVrIaAE3yG/LAQMsMunA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1751539145; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=PUMUxTQyz4Rw+I/k6r4nKllDMvLQcH1q/9NQSkvh/Tc=; 
	b=gYW8iVfmd0xLbwpe/lltOymsMhP2xnfMuf9kG5gDgz4TIM77kd5B/HOrZYUOxLvR/HxU5dRuW5kbHKrZAECfrY4FR6TvgZRFrBMwIyVjXu0l4aNreUspfiSwGUYHgp026ULp0m84Y1wDGwJtZOeb9kzDr9ML2p9IyKB0j+jh7IE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=louisalexis.eyraud@collabora.com;
	dmarc=pass header.from=<louisalexis.eyraud@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1751539145;
	s=zohomail; d=collabora.com; i=louisalexis.eyraud@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=PUMUxTQyz4Rw+I/k6r4nKllDMvLQcH1q/9NQSkvh/Tc=;
	b=Ua4joRz7J0WXVyQAc9oiuwImuog9VPquGVoKz8hsGX4MlyXyvGKyYEWhXUMYSB1b
	bxWzSzqxKFQXqxPM/+iZ+zse3v9BlcQY/CYJ239YdacuajaqPPZhXqldqhvDkvEt+pJ
	elYxIhb16kp8exk5hBD/X4HuM6rC5REb8wCqfDBU=
Received: by mx.zohomail.com with SMTPS id 1751539143453232.01329008697712;
	Thu, 3 Jul 2025 03:39:03 -0700 (PDT)
Message-ID: <8958966b96140aaaae97b480b7a6c1698a6d2ae2.camel@collabora.com>
Subject: Re: [PATCH] MFD: mt6397: do not use generic name for keypad
 sub-devices
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Lee Jones <lee@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	 <angelogioacchino.delregno@collabora.com>, Yassine Oudjana
	 <y.oudjana@protonmail.com>, =?ISO-8859-1?Q?N=EDcolas?= "F. R. A. Prado"
	 <nfraprado@collabora.com>, Fabien Parent <fparent@baylibre.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Date: Thu, 03 Jul 2025 12:38:59 +0200
In-Reply-To: <r4k3pgd3ew3ypne7ernxuzwgniiyvzosbce4cfajbcu7equblt@yato35tjb3lw>
References: <r4k3pgd3ew3ypne7ernxuzwgniiyvzosbce4cfajbcu7equblt@yato35tjb3lw>
Organization: Collabora Ltd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_033914_519724_D033AAB5 
X-CRM114-Status: GOOD (  22.32  )
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

Hi Dmitry,

On Mon, 2025-06-30 at 16:01 -0700, Dmitry Torokhov wrote:
> Do not use "mtk-pmic-keys" when creating sub-device for the keypad to
> make sure the keypad driver will only bind to the sub-device if it
> has
> support for the variant/has matching compatible.
>=20
> Reported-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> Fixes: 6e31bb8d3a63 ("mfd: mt6397: Add initial support for MT6328")
> Fixes: de58cee8c6b8 ("mfd: mt6397-core: Add MT6357 PMIC support")
> Fixes: 4a901e305011 ("mfd: mt6397-core: Add resources for PMIC keys
> for MT6359")
> Cc: stable@vger.kernel.org
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>=20
> This is not tested so if someone with hardware could try it out that
> would be great. I *think* it should work...
>=20
> =C2=A0drivers/mfd/mt6397-core.c | 12 ++++++------
> =C2=A01 file changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
> index 5f8ed8988907..3e58d0764c7e 100644
> --- a/drivers/mfd/mt6397-core.c
> +++ b/drivers/mfd/mt6397-core.c
> @@ -136,7 +136,7 @@ static const struct mfd_cell mt6323_devs[] =3D {
> =C2=A0		.name =3D "mt6323-led",
> =C2=A0		.of_compatible =3D "mediatek,mt6323-led"
> =C2=A0	}, {
> -		.name =3D "mtk-pmic-keys",
> +		.name =3D "mt6323-keys",
> =C2=A0		.num_resources =3D ARRAY_SIZE(mt6323_keys_resources),
> =C2=A0		.resources =3D mt6323_keys_resources,
> =C2=A0		.of_compatible =3D "mediatek,mt6323-keys"
> @@ -153,7 +153,7 @@ static const struct mfd_cell mt6328_devs[] =3D {
> =C2=A0		.name =3D "mt6328-regulator",
> =C2=A0		.of_compatible =3D "mediatek,mt6328-regulator"
> =C2=A0	}, {
> -		.name =3D "mtk-pmic-keys",
> +		.name =3D "mt6328-keys",
> =C2=A0		.num_resources =3D ARRAY_SIZE(mt6328_keys_resources),
> =C2=A0		.resources =3D mt6328_keys_resources,
> =C2=A0		.of_compatible =3D "mediatek,mt6328-keys"
> @@ -175,7 +175,7 @@ static const struct mfd_cell mt6357_devs[] =3D {
> =C2=A0		.name =3D "mt6357-sound",
> =C2=A0		.of_compatible =3D "mediatek,mt6357-sound"
> =C2=A0	}, {
> -		.name =3D "mtk-pmic-keys",
> +		.name =3D "mt6357-keys",
> =C2=A0		.num_resources =3D ARRAY_SIZE(mt6357_keys_resources),
> =C2=A0		.resources =3D mt6357_keys_resources,
> =C2=A0		.of_compatible =3D "mediatek,mt6357-keys"
> @@ -196,7 +196,7 @@ static const struct mfd_cell mt6331_mt6332_devs[]
> =3D {
> =C2=A0		.name =3D "mt6332-regulator",
> =C2=A0		.of_compatible =3D "mediatek,mt6332-regulator"
> =C2=A0	}, {
> -		.name =3D "mtk-pmic-keys",
> +		.name =3D "mt6331-keys",
> =C2=A0		.num_resources =3D ARRAY_SIZE(mt6331_keys_resources),
> =C2=A0		.resources =3D mt6331_keys_resources,
> =C2=A0		.of_compatible =3D "mediatek,mt6331-keys"
> @@ -240,7 +240,7 @@ static const struct mfd_cell mt6359_devs[] =3D {
> =C2=A0	},
> =C2=A0	{ .name =3D "mt6359-sound", },
> =C2=A0	{
> -		.name =3D "mtk-pmic-keys",
> +		.name =3D "mt6359-keys",
> =C2=A0		.num_resources =3D ARRAY_SIZE(mt6359_keys_resources),
> =C2=A0		.resources =3D mt6359_keys_resources,
> =C2=A0		.of_compatible =3D "mediatek,mt6359-keys"
> @@ -272,7 +272,7 @@ static const struct mfd_cell mt6397_devs[] =3D {
> =C2=A0		.name =3D "mt6397-pinctrl",
> =C2=A0		.of_compatible =3D "mediatek,mt6397-pinctrl",
> =C2=A0	}, {
> -		.name =3D "mtk-pmic-keys",
> +		.name =3D "mt6397-keys",
> =C2=A0		.num_resources =3D ARRAY_SIZE(mt6397_keys_resources),
> =C2=A0		.resources =3D mt6397_keys_resources,
> =C2=A0		.of_compatible =3D "mediatek,mt6397-keys"
> --=20
> 2.50.0.727.gbf7dc18ff4-goog
>=20
Thanks for the patch.

I've tested it with a kernel based on next-20250702 on both Mediatek
Genio 350-EVK and Genio 1200-EVK boards with mtk-pmic-keys driver
enabled either as builtin or module.

With the Genio 350-EVK, the mtk-pmic-keys driver probes OK:=20
```
[    0.601874] input: mtk-pmic-keys as
/devices/platform/soc/1000d000.pwrap/1000d000.pwrap:pmic/mt6357-
keys/input/input0
```
The keys work too.

For the Genio 1200-EVK, it fails to probe as expected (because
'mediatek,mt6359-keys' compatible is missing) and there is indeed no
kernel panic in the builtin case (the issue I reported with my patch)
```
[    0.459178] mt6359-keys: Failed to locate of_node [id: -1]
```

Tested-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com> # on
Mediatek Genio 350-EVK and Genio 1200-EVK

Regards,
Louis-Alexis

