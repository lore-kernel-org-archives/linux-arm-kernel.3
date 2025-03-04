Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FD67C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 12:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uLskld3j/+jGE72aUEs0X5g8/a3WioUWDpwH6b83L3Y=; b=hPJqTEZyi37/GAQpw2tKUcVz8e
	XXbuYCKMKdBtaGO6h6YvQlOwpsJ4D0yO5/PSckcyT9NEYug72noHBoEYZM1cK75/WwXmFMXYKR1jQ
	dA4xTS4leMNVxcHEiAcuMN0uKDVdWAiUDHcj8jItKPwsMpvXeCTPKxdayQkHLqOqCQVFz6sUTWAIO
	b8cPvS5jB/NbWsIuJ1bSnocCcHuzqwuVwrFyAHNr35TnVsSoKZHVjPIzxKbjJxNAo0MFsqp1lUosf
	r7gb+beMmR5csVJ1ydvwbp5H3p/ZhPTavsI7e317FjHH6BfsULocF83N1tVq6y3IEYfzQVcn21ZJ/
	Tw5YZpMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpRZ1-00000004fLN-10VX;
	Tue, 04 Mar 2025 12:39:59 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpRXR-00000004f7w-0hig;
	Tue, 04 Mar 2025 12:38:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=uLskld3j/+jGE72aUEs0X5g8/a3WioUWDpwH6b83L3Y=; b=U7pImbBWMCBcZdY6HtiTtG9Qiv
	hZXAmQxGGxL/wpSqvoAJwLfkxmNxFLX+PcRZEIGYFMb+ZXPB3I81woBaKSNTKEflxFq7DmnkjjfBE
	iveMv0iQMn8SOl5LgaPTzBfaFt/dd5iewtIhxh1x+3GYQpkxHP0csVelI+awuONwDwW5ckcRx8+PW
	MYejp09LT3p4Z4uhEow8TMa4M3rJ7Q+YldTLPjm0PgvrP/oRrf43ofpBPsilCrKc7Ik/N5ZRC5PeT
	hMWDTE06C+kXl13B6KjhFNw/2a29T+HXHXzMOsEgIgz9jYAGg999K3n6unNhqJJ3g/qfEJuupm6Mg
	YwAhTPZg==;
Received: from i53875a38.versanet.de ([83.135.90.56] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tpRX9-00037w-P6; Tue, 04 Mar 2025 13:38:03 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: andy.yan@rock-chips.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: Re: [PATCH v2 2/2] drm/rockchip: lvds: Hide scary error messages on probe
 deferral
Date: Tue, 04 Mar 2025 13:38:02 +0100
Message-ID: <9817880.CDJkKcVGEf@diego>
In-Reply-To: <0e54f70a-0b07-4ead-96fb-add2bbdaf787@cherry.de>
References: <20250301173547.710245-1-heiko@sntech.de>
 <20250301173547.710245-3-heiko@sntech.de>
 <0e54f70a-0b07-4ead-96fb-add2bbdaf787@cherry.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_043821_203820_DC8FB0F9 
X-CRM114-Status: GOOD (  18.69  )
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

Am Dienstag, 4. M=C3=A4rz 2025, 12:46:59 MEZ schrieb Quentin Schulz:
> > @@ -465,14 +464,14 @@ static int rk3288_lvds_probe(struct platform_devi=
ce *pdev,
> >  =20
> >   	lvds->pins->p =3D devm_pinctrl_get(lvds->dev);
> >   	if (IS_ERR(lvds->pins->p)) {
> > -		DRM_DEV_ERROR(lvds->dev, "no pinctrl handle\n");
> > +		dev_err(lvds->dev, "no pinctrl handle\n");
> >   		devm_kfree(lvds->dev, lvds->pins);
> >   		lvds->pins =3D NULL;
> >   	} else {
> >   		lvds->pins->default_state =3D
> >   			pinctrl_lookup_state(lvds->pins->p, "lcdc");
> >   		if (IS_ERR(lvds->pins->default_state)) {
> > -			DRM_DEV_ERROR(lvds->dev, "no default pinctrl state\n");
> > +			dev_err(lvds->dev, "no default pinctrl state\n");
> >   			devm_kfree(lvds->dev, lvds->pins);
> >   			lvds->pins =3D NULL;
>=20
> Should those be dev_err if they are not breaking anything? After all,=20
> the device will actually probe? Maybe dev_warn would be more appropriate?
>=20
> Maybe a separate patch since we had DRM_DEV_ERROR already, so switching=20
> to dev_err in one and then lowering the log level in a second would make=
=20
> "more" sense?

I did debate a bit whether to ignore here and go directly to dev_warn,
but opted for DRM_DEV_ERROR -> dev_err -> dev_warn, to keep the commit
description intact. Otherwise people looking at this patch alone might ask
if this part was forgotten, when the commit message indicates "all".

So expect an additional patch in v3 :-) .


> > @@ -593,7 +589,7 @@ static int rockchip_lvds_bind(struct device *dev, s=
truct device *master,
> >   		lvds->format =3D rockchip_lvds_name_to_format(name);
> >  =20
> >   	if (lvds->format < 0) {
> > -		DRM_DEV_ERROR(dev, "invalid data-mapping format [%s]\n", name);
> > +		dev_err(dev, "invalid data-mapping format [%s]\n", name);
> >   		ret =3D lvds->format;
>=20
> nipitck:
>=20
> ret =3D dev_err_probe(dev, lvds->format, "invalid data-mapping format=20
> [%s]\n", name);

you're right of course

=2E..

> >   	ret =3D component_add(&pdev->dev, &rockchip_lvds_component_ops);
> >   	if (ret < 0)
> > -		DRM_DEV_ERROR(dev, "failed to add component\n");
> > +		return dev_err_probe(dev, ret, "failed to add component\n");
> >  =20
>=20
> Should this rather be drm_error? I believe this is related to the=20
> Rockchip DRM main device?

I would group this more to general device error.
Component_add happens way before the component master binds anything.

drm_err is supposed to also point to the main drm_device as its parameter,
which does not even exist at this point.


Heiko



