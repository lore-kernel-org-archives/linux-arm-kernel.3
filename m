Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15595CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 12:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5TVVAycESmEEhj5tXHazMG2YgT7j35yrk8K3ETkT928=; b=sv7+Lqapv/4vm5bTKfPBOd7Ct0
	Z5SKs/wVjvDkA9Lef41UOGu9vuJMNr7TChvgcU7sVa6rtrX8qOoZkeXkP8CoDC1ThdP5s/+BTe9NS
	Iy79EHypBWFGnNtT69k1Tu4XtnxBOa1bP1tSWSI1uYtBB67s6nDSvyK9fvYDhfMUdMF69ZCfFL9g0
	3etJNnh1E3OSU/ZNS/zIQHErWLjcu2UTFONnHPH5JZ7/rG5ItxlOhE4xJmRhtfbRPeMgsxEatLKqy
	eqEfXsvZmG8uaXHMG0x9OZSPGd6B+u6WqBs2isak4uQ27xnAlbMfhreTv6FPWWSPUnmmkbzdls/o7
	lxBzwXIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7Bvz-00000008P3f-3UA0;
	Fri, 10 Oct 2025 12:09:19 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7Bvw-00000008P34-440D
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 12:09:18 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1760098144; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dA7yAX/vP+3sun5ZXeCK2uinkx7VxnyIrLK/qFVhnYkyIFMtM7d0mDDrS+TVtokDdKLyrYnAAwSizRXhvpbRLgf2TDGGByKbFmsqPa6nviQqfy4lrZk6kcd0Ae7HWo39fKmeIXVQXcXiYB37IGKBh2MKy+Z7YhgN03NwLj9wa0Q=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1760098144; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=5TVVAycESmEEhj5tXHazMG2YgT7j35yrk8K3ETkT928=; 
	b=LrRKByWE0juU2zdLzyEYdDD1mp9eVTrWVGP1NeYLCrsE0o38GKgbGP08xo0GlCT8Cc1Cofa+1c2eId5d3DQtwywqTNOjUuWeTQx4F7dsZJ62uZjwLStFKhuEdDXO2nVowLYnkS5SGG9WHyYd5Szo6DqN3gpyDQhcAanBlNNLICg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1760098144;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=5TVVAycESmEEhj5tXHazMG2YgT7j35yrk8K3ETkT928=;
	b=e++32knteoigBVHQgzqdtxzmswEgQW44+hGhNEU0OeQ+GmGQTqbxF29o9ndVlZw3
	q+VPMupP2hE/k9JBfai0xY/xICZijegXN+IN+7AcgZrFIMxvzzRnoLEmnPD5oHubILE
	q0ozm8UE6yix73c5DQeKYJY4j46i0QaDOJzImgw0=
Received: by mx.zohomail.com with SMTPS id 1760098141718220.0272880217807;
	Fri, 10 Oct 2025 05:09:01 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id 8F261181905; Fri, 10 Oct 2025 14:08:53 +0200 (CEST)
Date: Fri, 10 Oct 2025 14:08:53 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Saravana Kannan <saravanak@google.com>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-pm@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Heiko Stuebner <heiko@sntech.de>, 
	Sebin Francis <sebin.francis@ti.com>, Diederik de Haas <didi.debian@cknow.org>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Jon Hunter <jonathanh@nvidia.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] driver core: fw_devlink: Don't warn about
 sync_state() pending
Message-ID: <f7zspguplzerupaorr4ex4xnpeyrcdcid473u3tx3ekbvcj233@wgle5id5z5on>
References: <20251007094312.590819-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="o7l652o277il7yvz"
Content-Disposition: inline
In-Reply-To: <20251007094312.590819-1-ulf.hansson@linaro.org>
X-Zoho-Virus-Status: 1
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-1.4.3/260.58.11
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_050917_064689_D36EB663 
X-CRM114-Status: GOOD (  26.73  )
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


--o7l652o277il7yvz
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] driver core: fw_devlink: Don't warn about
 sync_state() pending
MIME-Version: 1.0

Hi,

On Tue, Oct 07, 2025 at 11:43:12AM +0200, Ulf Hansson wrote:
> Due to the wider deployment of the ->sync_state() support, for PM domains
> for example, we are receiving reports about the sync_state() pending
> message that is being logged in fw_devlink_dev_sync_state(). In particular
> as it's printed at the warning level, which is questionable.
>=20
> Even if it certainly is useful to know that the ->sync_state() condition
> could not be met, there may be nothing wrong with it. For example, a driv=
er
> may be built as module and are still waiting to be initialized/probed. For
> this reason let's move to the info level for now.
>=20
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Reported-by: Sebin Francis <sebin.francis@ti.com>
> Reported-by: Diederik de Haas <didi.debian@cknow.org>
> Reported-by: Jon Hunter <jonathanh@nvidia.com>
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

> ---
>=20
> Changes in v2:
> 	- Due to discussions on v1 and because the default Kconfig is to use the
> 	FW_DEVLINK_SYNC_STATE_STRICT, I suggest that for now it may be best to
> 	keep the warning level for the "Timed out.." print and only change the
> 	"sync_state pending..." message.
>=20
> ---
>  drivers/base/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/base/core.c b/drivers/base/core.c
> index d22d6b23e758..c62e428b95b0 100644
> --- a/drivers/base/core.c
> +++ b/drivers/base/core.c
> @@ -1784,7 +1784,7 @@ static int fw_devlink_dev_sync_state(struct device =
*dev, void *data)
>  		return 0;
> =20
>  	if (fw_devlink_sync_state =3D=3D FW_DEVLINK_SYNC_STATE_STRICT) {
> -		dev_warn(sup, "sync_state() pending due to %s\n",
> +		dev_info(sup, "sync_state() pending due to %s\n",
>  			 dev_name(link->consumer));
>  		return 0;
>  	}
> --=20
> 2.43.0
>=20

--o7l652o277il7yvz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmjo91EACgkQ2O7X88g7
+pomMhAAgIOiXn/XY2FB+L5+3ENCR0BvsBVlK+rVbqoS/fUE/D7K/rUt4yv/2O+p
bt9dweSC0hd9Z0Zb11SMW9Txh1ChIxByF0g+OuoqvG2BtoQhdNVqkhATO9hDT6yX
P7h0znsMPWh3BqxBn7r/kEyTY2fnUb8GPAD0LUx4ueKZtDBXBrGX/5P9idorPLkY
lclBxSg6VAFOIgcFW8SEAMn1ZCvCF+5stTLuR7Mou68+M2Qfd61t+Yj0drYzCgAG
joUXON246lHT8zLcSTKpkNro6KTMlL8SHtM5SPdJDnO7pS9dNI+B3MqD7TK9link
s5j7Xyr8crIcpb9+iqcnIRcWe3h6VxJVNTf3TkPFz2svNmjrLOzH2Wdpy2V9zeGz
rTI7ZuG74S/OiDI6TpVu7Hk+VKDfevhos/vyV1IgXU9LdCUHDisytirZc0j3t0tE
DYdQQpCA83ZIFz6imfBJaTg+stf9FAwcFKpzpPe7w1w0RxXqt+3Sut8kUb3lLo3l
H2F/q6mFL7Cemwo90QXtrDK6PKLa/WVS3IQB0/pyWqEHMGnsvXqT7lXwzRhiCc7L
4kToIWU3haS2yG8vB+of3kOl6hPYhUJSMBy6Q/49qKn8ktDriMDC5+HeOUrPL7kl
5He8aqTNVKGgRSzNLF0oVO9FyyKCQPcQCUKOcunDvPXD4f6y9Rw=
=iRpS
-----END PGP SIGNATURE-----

--o7l652o277il7yvz--

