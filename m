Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE830C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 15:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xpHCM0iE2esEzIC122AELBh0E5yUB3wABaM/lIaa61Q=; b=TjHJTduDm6lRIp9NRromERwdCx
	kn8CU6bUsHEJwywf3s7pSHzizjCZfT/Sit3eZTfN9qC1VsmI10jbX73LYlkvFSeROFU3ZZFwweyv+
	EgSnozTz6RRypD1KsLDf5Cltcx100qBFlaGAgVy8biC1iP8RUnlU+hSyIowpjVRAxH+uN1wi3Begt
	gWj868kllPe/sQaVvYEtNh8Qfz84xE1FfviVDjBJZ13QKznQlQaGnPOCelUxUKk3jfTxyICsswaC1
	QELJAC1+Bes9tU7cHlXEbzXzH5Soe5DgrRgnPvy6BkyJW7ownxGgfrLY1mhjS5VP7i842Yrd3Uc6U
	y39ElYwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9lV9-0000000BRrU-2cB3;
	Thu, 24 Sep 2026 15:36:47 +0000
Received: from sender6-op-o11.zoho.com ([165.173.180.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9lV7-0000000BRql-1oR3;
	Thu, 24 Sep 2026 15:36:46 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1790264193; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=avEIboCA7whGHLn5oj39qSTIrGRfMJV8ZiqxKNhqRMdlnAl9laOyKXZRMmDZGxAtqsOnI3KNvBup4aRqDeDGqAGSTxMBP3YIpLoFYceDvCnpHw6KRBZCd5Pi55cmpyk7ytvnBrur4jWrt7Gkrw9pDA7zTbKIKA26vOyisPURA8A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790264193; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=xpHCM0iE2esEzIC122AELBh0E5yUB3wABaM/lIaa61Q=; 
	b=IGLIylyyEAOON9rdg0yA4hqUjiuq6Jqrl1jUNsPi/mNalOeB2EAYnEMZck+mj4p3YvS2lLKf1QUKxyyz8iE2fudVRUpg0YzJfd72WOB1ombH24l3MvMc6CIuoy6PRSPAbZmGBT0mhrYy9CoyX0YJhYc7E3qBx+PV2G4C1kFgBec=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790264193;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=xpHCM0iE2esEzIC122AELBh0E5yUB3wABaM/lIaa61Q=;
	b=LeGGMk8wl/AL71GOyYLhJRlUUDzBlpFLWqtDay16AcCmgywF2N0TZJvNyycTamoh
	e/LbcaLUo5dg0Z+buiTWVA5YujHT7M6thspb81LXzpJjAHSC5yZ7O/WOTV5aXtF+X3W
	ZRjh6q31BvSv5IY0K9S718XkXmfZRTBhOzbFjsfA=
Received: by smtp.zohomail.com with SMTPS id 179026419157669.64049589350486;
	Thu, 24 Sep 2026 08:36:31 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id C4383180EDC; Thu, 24 Sep 2026 17:36:26 +0200 (CEST)
Date: Thu, 24 Sep 2026 17:36:26 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-phy@lists.infradead.org, kernel@collabora.com, 
	Igor Paunovic <royalnet026@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: [PATCH 2/5] usb: dwc3: rockchip: introduce glue driver
Message-ID: <arVB7k5QRcwYfZEO@venus>
References: <20260915-b4-rockchip-dwc3-rockchip-glue-v1-0-763bb546824e@collabora.com>
 <20260915-b4-rockchip-dwc3-rockchip-glue-v1-2-763bb546824e@collabora.com>
 <6eacce65-5636-413f-8213-10910f3a7ee8@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vu4syrqui7xkgy6d"
Content-Disposition: inline
In-Reply-To: <6eacce65-5636-413f-8213-10910f3a7ee8@oss.qualcomm.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/290.230.26
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_083645_524409_975FDE9C 
X-CRM114-Status: GOOD (  29.68  )
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


--vu4syrqui7xkgy6d
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/5] usb: dwc3: rockchip: introduce glue driver
MIME-Version: 1.0

Hi Krishna,

On Wed, Sep 23, 2026 at 11:23:01AM +0530, Krishna Kurapati wrote:
>=20
>=20
> On 9/15/2026 8:47 PM, Sebastian Reichel wrote:
> > Introduce Rockchip specific glue code for the Synopsys DWC3 USB driver.
> > For now this handles things identical to the default glue.
> >=20
>=20
> [...]
>=20
> > @@ -2448,11 +2448,26 @@ int dwc3_core_probe(const struct dwc3_probe_dat=
a *data)
> >   }
> >   EXPORT_SYMBOL_GPL(dwc3_core_probe);
> > +/*
> > + * List of compatibles, which have "synopsys,dwc3" as a fallback
> > + * compatible, but have a vendor specific glue driver that should
> > + * be used instead of this one.
> > + */
> > +static const char *const dwc3_compatible_blocklist[] =3D {
> > +	"rockchip,rk3588-dwc3",
> > +	"rockchip,rk3576-dwc3",
> > +};
> > +
> >   static int dwc3_probe(struct platform_device *pdev)
> >   {
> >   	struct dwc3_probe_data probe_data =3D {};
> >   	struct resource *res;
> >   	struct dwc3 *dwc;
> > +	int i;
> > +
> > +	for (i =3D 0; i < ARRAY_SIZE(dwc3_compatible_blocklist); i++)
> > +		if (device_is_compatible(&pdev->dev, dwc3_compatible_blocklist[i]))
> > +			return -ENODEV;
>=20
> Would it be better to split this patch into two ? I see core changes are
> independent of addition of the new driver.

That's true from a pure compile time perspective, but the new glue
driver is effectively dead code as it will never probe without that
change.

Greetings,

-- Sebastian

>=20
> Regards,
> Krishna,
>=20
> >   	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> >   	if (!res) {
> > diff --git a/drivers/usb/dwc3/dwc3-rockchip.c b/drivers/usb/dwc3/dwc3-r=
ockchip.c
> > new file mode 100644
> > index 000000000000..62f2a03b08a2
> > --- /dev/null
> > +++ b/drivers/usb/dwc3/dwc3-rockchip.c
> > @@ -0,0 +1,106 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/* Copyright (c) 2026, Collabora Ltd. */
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/pm_runtime.h>
> > +#include "glue.h"
> > +
> > +struct dwc3_rockchip {
> > +	struct dwc3		dwc;
> > +};
> > +
> > +static int dwc3_rockchip_probe(struct platform_device *pdev)
> > +{
> > +	struct dwc3_probe_data probe_data =3D {};
> > +	struct resource *res;
> > +	struct dwc3_rockchip *dwc_rk;
> > +
> > +	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +	if (!res) {
> > +		dev_err(&pdev->dev, "missing memory resource\n");
> > +		return -ENODEV;
> > +	}
> > +
> > +	dwc_rk =3D devm_kzalloc(&pdev->dev, sizeof(*dwc_rk), GFP_KERNEL);
> > +	if (!dwc_rk)
> > +		return -ENOMEM;
> > +
> > +	dwc_rk->dwc.dev =3D &pdev->dev;
> > +	dwc_rk->dwc.glue_ops =3D NULL;
> > +
> > +	probe_data.dwc =3D &dwc_rk->dwc;
> > +	probe_data.res =3D res;
> > +	probe_data.properties =3D DWC3_DEFAULT_PROPERTIES;
> > +
> > +	return dwc3_core_probe(&probe_data);
> > +}
> > +
> > +static void dwc3_rockchip_remove(struct platform_device *pdev)
> > +{
> > +	dwc3_core_remove(platform_get_drvdata(pdev));
> > +}
> > +
> > +static int __maybe_unused dwc3_rockchip_runtime_suspend(struct device =
*dev)
> > +{
> > +	return dwc3_runtime_suspend(dev_get_drvdata(dev));
> > +}
> > +
> > +static int __maybe_unused dwc3_rockchip_runtime_resume(struct device *=
dev)
> > +{
> > +	return dwc3_runtime_resume(dev_get_drvdata(dev));
> > +}
> > +
> > +static int __maybe_unused dwc3_rockchip_runtime_idle(struct device *de=
v)
> > +{
> > +	return dwc3_runtime_idle(dev_get_drvdata(dev));
> > +}
> > +
> > +static int __maybe_unused dwc3_rockchip_suspend(struct device *dev)
> > +{
> > +	return dwc3_pm_suspend(dev_get_drvdata(dev));
> > +}
> > +
> > +static int __maybe_unused dwc3_rockchip_resume(struct device *dev)
> > +{
> > +	return dwc3_pm_resume(dev_get_drvdata(dev));
> > +}
> > +
> > +static void __maybe_unused dwc3_rockchip_complete(struct device *dev)
> > +{
> > +	dwc3_pm_complete(dev_get_drvdata(dev));
> > +}
> > +
> > +static int __maybe_unused dwc3_rockchip_prepare(struct device *dev)
> > +{
> > +	return dwc3_pm_prepare(dev_get_drvdata(dev));
> > +}
> > +
> > +static const struct dev_pm_ops dwc3_rockchip_dev_pm_ops =3D {
> > +	SET_SYSTEM_SLEEP_PM_OPS(dwc3_rockchip_suspend, dwc3_rockchip_resume)
> > +	SET_RUNTIME_PM_OPS(dwc3_rockchip_runtime_suspend, dwc3_rockchip_runti=
me_resume,
> > +			   dwc3_rockchip_runtime_idle)
> > +	.complete =3D pm_sleep_ptr(dwc3_rockchip_complete),
> > +	.prepare =3D pm_sleep_ptr(dwc3_rockchip_prepare),
> > +};
> > +
> > +static const struct of_device_id dwc3_rockchip_of_match[] =3D {
> > +	{ .compatible =3D "rockchip,rk3588-dwc3" },
> > +	{ .compatible =3D "rockchip,rk3576-dwc3" },
> > +	{ }
> > +};
> > +MODULE_DEVICE_TABLE(of, dwc3_rockchip_of_match);
> > +
> > +static struct platform_driver dwc3_rockchip_driver =3D {
> > +	.probe		=3D dwc3_rockchip_probe,
> > +	.remove		=3D dwc3_rockchip_remove,
> > +	.driver		=3D {
> > +		.name	=3D "dwc3-rockchip",
> > +		.pm	=3D pm_ptr(&dwc3_rockchip_dev_pm_ops),
> > +		.of_match_table	=3D dwc3_rockchip_of_match,
> > +	},
> > +};
> > +
> > +module_platform_driver(dwc3_rockchip_driver);
> > +
> > +MODULE_LICENSE("GPL");
> > +MODULE_DESCRIPTION("DesignWare DWC3 Rockchip Glue Driver");
> >=20
>=20

--vu4syrqui7xkgy6d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmq1Q3oACgkQ2O7X88g7
+pqNww/9EHGMcp537E32jHoRUriW7+ZRqiKtCJUEczh/NpGV7a9xXNuE+bkz7LVq
8UvGrp0IAOp4D25D87IBZIwDPnw67hIbvheZ0jI1RSFoEfccO2RDqEJuwgr7TqdC
g0d427lgmozamZMyUVzI09/4Utnl3DSa8uWwYIq9/qRf6b5iqraovAoySq+KmKOY
5hss824MlBk2PKv5Zo8O0dd9CwcSyZuwxDgRoBToCZxQbHJdnAoHtJJN2VmLzZVx
N5IeQwKnqfLMS2lfiX5xSoRNotkrA7Ui5iKFvsKsLU/gARuQ6LHhChy9SE8aBww+
chxvuSCF2s+FGF71RIHfUpVyq4+jMUdlL3ptA0mLVQrrUQsfinFAIuDtzQdTflBb
ap3t6hwgj5zfBq/BueWKWUDfh8WurhILCEk45ALEKePEDKa7D5Dh1KEdwYBtTMy/
G7FflOWk8J5oA9DiPHVGD5Bnu92PmD/yCxIEIDCWz03nK1cDJTl2+ahxrKrVKQa8
1PmUSIabWXinh1fiptThR0Egj/dzscArNESi2IvoxtGBLyAVZ0aesZgGdURhV7w1
lUxmBBlwcpDZr9TDgDakKW70TgPsuccXeCsgxLkMNm5ydtqU7l/gH5kDun4FrbWz
0xZWpKVyrZvU0zEoz56h56Rbd+Hcas6pXZIFgJH1+tnZMCVfD7U=
=yBxX
-----END PGP SIGNATURE-----

--vu4syrqui7xkgy6d--

