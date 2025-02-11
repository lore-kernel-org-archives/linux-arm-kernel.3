Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7399BC0219D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 10:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ubGyYqooXI2P+wuwvYT/UUhmQ3sN+skqfbeQAf8g68Y=; b=M6pXd5FVrmsBlxBTgvs8Z+OW8W
	Am/HFj4vkLoveyERk0gdsMzhYXWljiPitRAM8EwRVxM1K+7NByTI7YcA5YMWrWDJTeF/VOZlgM54Z
	13RLcAqvHuhSEYkFqT4fJiIl2USTAJr1I/H5wI+H23QUTRxWbx96Ibkv+Ydmyso/I988H1YDSmtLn
	ThPQfwkDm7s50PKIQycWfytWCw23ywCzQZ9gyY7/ZDJPP95MnIhvU7gCDhFT0cBWd2TliQuxiOWqt
	IK2x2niSqFydEJ6NwkA0mQ6+nME7wK24LAbwLNnfnfTtzYABReVt3SPPDvmlj9kraJ4txxtjqae8R
	ZZyBbTqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thnx7-00000003Rac-1h1T;
	Tue, 11 Feb 2025 10:57:17 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thnhy-00000003OPe-1tgY;
	Tue, 11 Feb 2025 10:41:40 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1739270477; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=mwi82a1VC0WX0mnkqDaeehyMyVFVEj4t2oX7L/TCjiHtiYB7UuceU1o9V2Ch+9o4zltsPlBcFb4fdv8+rxktaJqW1Q8KlkTen/Pl17gSNMmtpT3i5htGY8dXAf2WkG4GGKwdDWWeVOjh+pE52ItcHz34mNoIxmLMbpGojBEc8Z0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1739270477; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ubGyYqooXI2P+wuwvYT/UUhmQ3sN+skqfbeQAf8g68Y=; 
	b=hvrvbf2+7wqF6YKXbMOoA/8Fm226wP6CKc6c07oHoi3h1cFXfFFfUlfdpJKJngVl9fWOTWP3KrxISu6OnsJyunORWMiMXnH22HKa8b0CDmCNSKP1eJYnqF2j/gTJ+zkOIuXa+neWu9/k+JQn+BRGxrGrkNYvOC07GBHsY/heGbU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=louisalexis.eyraud@collabora.com;
	dmarc=pass header.from=<louisalexis.eyraud@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1739270476;
	s=zohomail; d=collabora.com; i=louisalexis.eyraud@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=ubGyYqooXI2P+wuwvYT/UUhmQ3sN+skqfbeQAf8g68Y=;
	b=kdfpqRdkVKeQAH/5Y/EIwAFtun58/BS9O8u/eV3wKOEEf1FlqYJra//v0lxwoJH5
	20h03YlS242c/15r/A9nSKaKwa/NLDqqRIYbiAjPanT6Le+XYjPs8Zbtnq8dPOlgiry
	IavDHj9UzJSxa7CtNcyEmGo4eYBjg9rp5zxBgpuA=
Received: by mx.zohomail.com with SMTPS id 1739270473078530.12461900681;
	Tue, 11 Feb 2025 02:41:13 -0800 (PST)
Message-ID: <0ea21f4f22a4814278f9fb68c1417594c7817c06.camel@collabora.com>
Subject: Re: [PATCH v3 3/3] arm64: dts: mediatek: mt8370: Enable gpu support
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Krzysztof Kozlowski
	 <krzk@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard	
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
	 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring	
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Boris
 Brezillon <boris.brezillon@collabora.com>, Steven Price
 <steven.price@arm.com>, kernel@collabora.com, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Date: Tue, 11 Feb 2025 11:41:08 +0100
In-Reply-To: <9cbd03f7-c3e4-433b-96ee-3b9683fccdd2@collabora.com>
References: <20250207-mt8370-enable-gpu-v3-0-75e9b902f9c1@collabora.com>
	 <20250207-mt8370-enable-gpu-v3-3-75e9b902f9c1@collabora.com>
	 <20250211-nice-boar-of-abracadabra-f696ec@krzk-bin>
	 <9cbd03f7-c3e4-433b-96ee-3b9683fccdd2@collabora.com>
Organization: Collabora Ltd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_024138_576559_DB98CF45 
X-CRM114-Status: GOOD (  28.48  )
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

On Tue, 2025-02-11 at 10:28 +0100, AngeloGioacchino Del Regno wrote:
> Il 11/02/25 09:31, Krzysztof Kozlowski ha scritto:
> > On Fri, Feb 07, 2025 at 04:18:32PM +0100, Louis-Alexis Eyraud
> > wrote:
> > > Add a new gpu node in mt8370.dtsi to enable support for the
> > > ARM Mali G57 MC2 GPU (Valhall-JM) found on the MT8370 SoC, using
> > > the
> > > Panfrost driver.
> > >=20
> > > On a Mediatek Genio 510 EVK board, the panfrost driver probed
> > > with the
> > > following message:
> > > ```
> > > panfrost 13000000.gpu: clock rate =3D 390000000
> > > panfrost 13000000.gpu: mali-g57 id 0x9093 major 0x0 minor 0x0
> > > status 0x0
> > > panfrost 13000000.gpu: features: 00000000,000019f7, issues:
> > > 00000003,
> > > =C2=A0=C2=A0=C2=A0 80000400
> > > panfrost 13000000.gpu: Features: L2:0x08130206 Shader:0x00000000
> > > =C2=A0=C2=A0=C2=A0 Tiler:0x00000809 Mem:0x1 MMU:0x00002830 AS:0xff JS=
:0x7
> > > panfrost 13000000.gpu: shader_present=3D0x5 l2_present=3D0x1
> > > [drm] Initialized panfrost 1.3.0 for 13000000.gpu on minor 0
> > > ```
> > >=20
> > > Signed-off-by: Louis-Alexis Eyraud
> > > <louisalexis.eyraud@collabora.com>
> > > ---
> > > =C2=A0 arch/arm64/boot/dts/mediatek/mt8370.dtsi | 9 +++++++++
> > > =C2=A0 1 file changed, 9 insertions(+)
> > >=20
> > > diff --git a/arch/arm64/boot/dts/mediatek/mt8370.dtsi
> > > b/arch/arm64/boot/dts/mediatek/mt8370.dtsi
> > > index
> > > cf1a3759451ff899ce9e63e5a00f192fb483f6e5..2f27f7e7ab813b97f869297
> > > ae360f69854e966e1 100644
> > > --- a/arch/arm64/boot/dts/mediatek/mt8370.dtsi
> > > +++ b/arch/arm64/boot/dts/mediatek/mt8370.dtsi
> > > @@ -59,6 +59,15 @@ &cpu_little3_cooling_map0 {
> > > =C2=A0=C2=A0				<&cpu3 THERMAL_NO_LIMIT
> > > THERMAL_NO_LIMIT>;
> > > =C2=A0 };
> > > =C2=A0=20
> > > +&gpu {
> > > +	compatible =3D "mediatek,mt8370-mali", "arm,mali-valhall-
> > > jm";
> >=20
> > It's up to platform maintainers, but IMHO this is discouraged
> > practice.
> > If you ever need to override compatible, this means the node is not
> > really shared between this and base SoC (base DTSI).
> >=20
>=20
> That's true, indeed, but this is a special case, where the GPU
> actually is really
> architecturally and generationally the same, difference being that
> one core is
> lasered off from the lower binned silicon.
>=20
> I appreciate you pointing that out, and effectively we shall not
> create any
> misunderstanding on this practice, which shall remain discouraged.
>=20
> Speaking of which!
>=20
> Louis, since you anyway have to send a v4, please add a comment
> before that
> gpu node override saying:
>=20
> /*
> =C2=A0 * Please note that overriding compatibles is a discouraged practic=
e
> and is a
> =C2=A0 * clear indication of nodes not being, well, compatible!
> =C2=A0 *
> =C2=A0 * This is a special case, where the GPU is the same as MT8188, but
> with one
> =C2=A0 * of the cores fused out in this lower-binned SoC.
> =C2=A0 */
> &gpu {
> =C2=A0 ....etc
>=20
>=20
> Thanks,
> Angelo

Hi,

I understand your concerns and I agree with you.

Adding this warning comment in mt8370.dtsi file seems appropriate to
explain why it was done this way, and make more cautious those who
might read this override code and inspire from it.

I'll amend this commit with it in the v4 patchset.

Regards,
Louis-Alexis


