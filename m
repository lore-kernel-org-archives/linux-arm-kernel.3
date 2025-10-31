Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE6C0CCF9FF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 12:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5zTIt+rAoBvPMQKP7EcQfAbiSRLViWy6hR5zucTP3Kg=; b=gOLLxwgv3Vpb52sxHtYJCawaYK
	CeTH5wyXchzblneJa42fe/L5vTl30LPGt3TIjBFyk82yP+Wlk1YIOvcxZCyB9RbRpWtAojbpoVvPe
	/1pwWFx8dsFWdBNzVoQhf/T6Yr0gUtjEXx6FUMWtjqMI/fmBu6ZuMq4np5f9JgKG3fLdiIs30Isri
	JgwESv6zWpHMKl12FZYyAQEaqZaeXQEW4Lq+R7ZAhZlUTto8eFhqGtlgt4yhU0PND6DFEvAM6n5N0
	XKxHihAjWdTDRTN4DPZlHH5qxUNLth7AmRVKMAfpi5gGp0hp0KG7qltwOLgEG3xwSdCawpwArU6dS
	iDfXbGxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEo7r-000000064JI-0pwM;
	Fri, 31 Oct 2025 12:21:03 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEo7o-000000064If-1MBd;
	Fri, 31 Oct 2025 12:21:02 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1761913244; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NYrVCdrwtfSvlZFvJ04ri1DzX5zX+b3GD79h1D4eMLRK+QMF1d9Gjbk8uTIAj+zGkoAJb4xaZTd/j1SKn6x8IK0jf3mmTSZh9ocQNSkaoj8VVjZyc7G3isqnk3DQmngoLqesqxv0omMYcrVZgkFvc1SYkhP58fLyamktkuJfyOY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1761913244; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=5zTIt+rAoBvPMQKP7EcQfAbiSRLViWy6hR5zucTP3Kg=; 
	b=AgWKks5HGuNLTYPTjTAo5RCmaBhczJXzyVAtAdFgJz8BxzBx+cwzJHjph843CcGQXnWeWPtf7Q8W0SlTY33D8w9KfOJwvB7zcWpzLy6AQXNq1dkKkUCC6zJA7KFpDOgpSvpjaFh7Eomwvdcc05286lfR8CLt+2MNKlx2YyGs6C4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1761913244;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=5zTIt+rAoBvPMQKP7EcQfAbiSRLViWy6hR5zucTP3Kg=;
	b=A4UWeNPA23M7lsIukrsOH7bMGSKligZV1HnaAwV2DdWV6EclFAbHWF/fr7a0+yW4
	pdvNPakawyFW5CNuDHtiQm/hXB/U1P5eEW3+7psTi3EP3NA138ZJQRXZv9sVLSpjS3H
	44DG+udYIh/AlEO1zDtzVvp5ZbKgIWSirRZCQXm8=
Received: by mx.zohomail.com with SMTPS id 1761913243469405.4251213598277;
	Fri, 31 Oct 2025 05:20:43 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <ukleinek@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Lee Jones <lee@kernel.org>, William Breathitt Gray <wbg@kernel.org>,
 Johan Jonker <jbx6244@yandex.com>
Cc: kernel@collabora.com, Jonas Karlman <jonas@kwiboo.se>,
 Alexey Charkov <alchark@gmail.com>, linux-rockchip@lists.infradead.org,
 linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org
Subject: Re: [PATCH v3 2/5] mfd: Add Rockchip mfpwm driver
Date: Fri, 31 Oct 2025 13:20:37 +0100
Message-ID: <3598089.ElGaqSPkdT@workhorse>
In-Reply-To: <16341fe2-7d2b-45a6-a861-93950c1bbd1f@yandex.com>
References: <20251027-rk3576-pwm-v3-0-654a5cb1e3f8@collabora.com>
 <20251027-rk3576-pwm-v3-2-654a5cb1e3f8@collabora.com>
 <16341fe2-7d2b-45a6-a861-93950c1bbd1f@yandex.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_052100_431951_F3D5720B 
X-CRM114-Status: GOOD (  39.62  )
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

On Tuesday, 28 October 2025 19:52:53 Central European Standard Time Johan J=
onker wrote:
>=20
> On 10/27/25 18:11, Nicolas Frattaroli wrote:
> > With the Rockchip RK3576, the PWM IP used by Rockchip has changed
> > substantially. Looking at both the downstream pwm-rockchip driver as
> > well as the mainline pwm-rockchip driver made it clear that with all its
> > additional features and its differences from previous IP revisions, it
> > is best supported in a new driver.
> >=20
> > This brings us to the question as to what such a new driver should be.
> > To me, it soon became clear that it should actually be several new
> > drivers, most prominently when Uwe Kleine-K=C3=B6nig let me know that I
> > should not implement the pwm subsystem's capture callback, but instead
> > write a counter driver for this functionality.
> >=20
> > Combined with the other as-of-yet unimplemented functionality of this
> > new IP, it became apparent that it needs to be spread across several
> > subsystems.
> >=20
> > For this reason, we add a new MFD core driver, called mfpwm (short for
> > "Multi-function PWM"). This "parent" driver makes sure that only one
> > device function driver is using the device at a time, and is in charge
> > of registering the MFD cell devices for the individual device functions
> > offered by the device.
> >=20
> > An acquire/release pattern is used to guarantee that device function
> > drivers don't step on each other's toes.
> >=20
> > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > ---
> >  MAINTAINERS                        |   2 +
> >  drivers/mfd/Kconfig                |  15 ++
> >  drivers/mfd/Makefile               |   1 +
> >  drivers/mfd/rockchip-mfpwm.c       | 340 +++++++++++++++++++++++++++
> >  include/linux/mfd/rockchip-mfpwm.h | 454 +++++++++++++++++++++++++++++=
++++++++
> >  5 files changed, 812 insertions(+)
> >=20
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index baecabab35a2..8f3235ba825e 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -22372,6 +22372,8 @@ L:	linux-rockchip@lists.infradead.org
> >  L:	linux-pwm@vger.kernel.org
> >  S:	Maintained
>=20
> >  F:	Documentation/devicetree/bindings/pwm/rockchip,rk3576-pwm.yaml
>=20
> A question not so much for Nicolas specific:
> The yaml documents already have a 'maintainers' entry.
> However MAINTAINERS is full yaml entries.
> Could someone explain why we still need dual registration?
>=20
> maintainers:
>   - Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
>=20
> > +F:	drivers/soc/rockchip/mfpwm.c
> > +F:	include/soc/rockchip/mfpwm.h
>=20
> different file name and location?
>=20
>   drivers/mfd/rockchip-mfpwm.c       | 340 +++++++++++++++++++++++++++
>   include/linux/mfd/rockchip-mfpwm.h | 454 ++++++++++++++++++++++++++++++=
+++++++
>=20
>=20

Yeah, I forgot to adjust this when moving this to being an MFD.
I'll fix it in v4.

> > [... snip ...]
> > diff --git a/drivers/mfd/rockchip-mfpwm.c b/drivers/mfd/rockchip-mfpwm.c
> > new file mode 100644
> > index 000000000000..08c2d8da41b7
> > --- /dev/null
> > +++ b/drivers/mfd/rockchip-mfpwm.c
> > [... snip ...]
> > +
> > +static int mfpwm_register_subdevs(struct rockchip_mfpwm *mfpwm)
> > +{
> > +	int ret;
> > +
>=20
> > +	ret =3D mfpwm_register_subdev(mfpwm, "pwm-rockchip-v4");
>=20
> Not sure who came up with this name?

I did.

> In case we need to filter wouldn't be easier to order it just like the bi=
ndings: manufacture '-' function

It's based on the filename of the pwm output driver. pwm-rockchip.c
is already taken by v1 to v3 hardware. Apparently however, pwm
subsystem drivers then reverse the order in the driver name, so
`pwm-rockchip.c` registers a driver with the name `rockchip-pwm`.

So I'll rename my PWM output driver to `rockchip-pwm-v4`. The v4
stays, it refers to the hardware IP revision.

> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D mfpwm_register_subdev(mfpwm, "rockchip-pwm-capture");
> > +	if (ret)
> > +		return ret;
> > +
> > +	return 0;
> > +}
> > +
> > [... snip ...]

Kind regards,
Nicolas Frattaroli





