Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0D38CAC59B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 18:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W1IJjyM9OVaQcEmkWiSOUFeaD6n08j4ucNHzBhm+qQk=; b=t2JhHrGhkW28x9UhVXRRyLvCy+
	bVOkOVT4gIFnqVf48RARWycZ8p41dH1YTzyid1TCJVwEbnqSpmkZCifmy8HYr6A8g4eaY6IrvNg8X
	wLcnC3Xw6TiBnDz0W3WajiZA/0p283CASUwy89hL6qA/RACFO9eTgf/PEqWkAl00Ws/XXDemb9B+6
	gKH8TgNRkpE4hiFp/9CQYGmRXRYR/kVog7BAVo61m2fwM6LeCnqDmCi/36gcb51/AXcworeVNFp/O
	eSCl0y0Ye0lFVj3M41h/iR6hH1/a8FHLmorNA7heyFmvUfPX0m/wBRcmaIYZfNzc+q7IGPxSt/g8b
	NBioIDkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyajX-00000008ni1-0ayM;
	Tue, 16 Sep 2025 18:48:55 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyajV-00000008nhP-14qv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 18:48:54 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1758048524; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=hOuaNoXZZWfOlDgsV2mcJcyWbXI/sr+t0ff/wa0U7GsR+e0TVEgktNcbPzROFLZ2pAOQ6ZbgwGFPCp/zHVrO+DEMxaT5q9s1QWhHPwQROuBBIFJvIRf7yOEretvcV1X3lqMLj+/vmAQ/SR3M21vfuOyygmCZjxs+qSw9omg7wjs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1758048524; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=W1IJjyM9OVaQcEmkWiSOUFeaD6n08j4ucNHzBhm+qQk=; 
	b=kzAxViRb7tuY3qv8/NQnlFlrN3pTBinQXT635SjNgoLkDaxb7hfr8mjrPScuiMioOGNM1vLXvu2QJPuoZN6eEcKPXZTIu9zyx+HFX8jghq+g1p7eubni4Wi7QflOcVwl630AbNVYG3xQq9VdnGk6HlYlG5hLmev5YmLWG/WOSCk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1758048524;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=W1IJjyM9OVaQcEmkWiSOUFeaD6n08j4ucNHzBhm+qQk=;
	b=Q3fPokB2GbhR+Ki4vWnQlVuwEGsS8+e7CSRgdDHTTQcMVPQbytMgCS54D0cOWQVa
	mE8Tg7As2IUdbVHd29/Fag4+ZGZkxLRKF2+SK1uowiapF/WArH6my1D5CA4B8aAh1lf
	dbv7WVwbQDPHZZ5gwNQa3Vk96OSU5zEuKR0V3KzM=
Received: by mx.zohomail.com with SMTPS id 1758048522298948.311304452888;
	Tue, 16 Sep 2025 11:48:42 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id BACAC180733; Tue, 16 Sep 2025 20:48:13 +0200 (CEST)
Date: Tue, 16 Sep 2025 20:48:13 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Sudeep Holla <sudeep.holla@arm.com>, Souvik Chakravarty <Souvik.Chakravarty@arm.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andy Yan <andy.yan@rock-chips.com>, Mark Rutland <mark.rutland@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Konrad Dybcio <konradybcio@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
	Vinod Koul <vkoul@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, 
	Stephen Boyd <swboyd@chromium.org>, Andre Draszik <andre.draszik@linaro.org>, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	Elliot Berman <quic_eberman@quicinc.com>, Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v14 02/10] power: reset: reboot-mode: Add device tree
 node-based registration
Message-ID: <in6bqvemnscvuxbumpxogxiiav7odmsc3iazktifninh6iqen7@qwhrhdidcx7y>
References: <20250815-arm-psci-system_reset2-vendor-reboots-v14-0-37d29f59ac9a@oss.qualcomm.com>
 <20250815-arm-psci-system_reset2-vendor-reboots-v14-2-37d29f59ac9a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="czj77t3nras3pevm"
Content-Disposition: inline
In-Reply-To: <20250815-arm-psci-system_reset2-vendor-reboots-v14-2-37d29f59ac9a@oss.qualcomm.com>
X-Zoho-Virus-Status: 1
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-1.4.3/258.4.7
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_114853_330044_7A21EED2 
X-CRM114-Status: GOOD (  29.67  )
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


--czj77t3nras3pevm
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v14 02/10] power: reset: reboot-mode: Add device tree
 node-based registration
MIME-Version: 1.0

Hi,

On Fri, Aug 15, 2025 at 08:05:07PM +0530, Shivendra Pratap wrote:
> The reboot-mode driver does not have a strict requirement for
> device-based registration. It primarily uses the device's of_node
> to read mode-<cmd> properties and the device pointer for logging.
>=20
> Remove the dependency on struct device and introduce support for
> Device Tree (DT) node-based registration. This enables drivers
> that are not associated with a struct device to leverage the
> reboot-mode framework.
>=20
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---

Please use fwnode instead of device_node, so that the same thing
can be used with non DT setups, if that becomes necessary. Otherwise
LGTM.

Greetings,

-- Sebastian

>  drivers/power/reset/reboot-mode.c | 37 ++++++++++++++++++++++++++-------=
----
>  include/linux/reboot-mode.h       |  2 +-
>  2 files changed, 27 insertions(+), 12 deletions(-)
>=20
> diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/rebo=
ot-mode.c
> index 42bb99128ed3846d4bff62416dc31135ddeaeb90..9bb97bcd33cd3d58c75c791e9=
b568024e810e5b0 100644
> --- a/drivers/power/reset/reboot-mode.c
> +++ b/drivers/power/reset/reboot-mode.c
> @@ -3,13 +3,17 @@
>   * Copyright (c) 2016, Fuzhou Rockchip Electronics Co., Ltd
>   */
> =20
> +#define pr_fmt(fmt)	"reboot-mode: " fmt
> +
>  #include <linux/device.h>
>  #include <linux/init.h>
>  #include <linux/kernel.h>
> +#include <linux/list.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/reboot.h>
>  #include <linux/reboot-mode.h>
> +#include <linux/slab.h>
> =20
>  #define PREFIX "mode-"
> =20
> @@ -75,17 +79,21 @@ static int reboot_mode_notify(struct notifier_block *=
this,
>  /**
>   * reboot_mode_register - register a reboot mode driver
>   * @reboot: reboot mode driver
> + * @np: Pointer to device tree node
>   *
>   * Returns: 0 on success or a negative error code on failure.
>   */
> -int reboot_mode_register(struct reboot_mode_driver *reboot)
> +int reboot_mode_register(struct reboot_mode_driver *reboot, struct devic=
e_node *np)
>  {
>  	struct mode_info *info;
> +	struct mode_info *next;
>  	struct property *prop;
> -	struct device_node *np =3D reboot->dev->of_node;
>  	size_t len =3D strlen(PREFIX);
>  	int ret;
> =20
> +	if (!np)
> +		return -EINVAL;
> +
>  	INIT_LIST_HEAD(&reboot->head);
>  	mutex_init(&reboot->rb_lock);
> =20
> @@ -94,28 +102,28 @@ int reboot_mode_register(struct reboot_mode_driver *=
reboot)
>  		if (strncmp(prop->name, PREFIX, len))
>  			continue;
> =20
> -		info =3D devm_kzalloc(reboot->dev, sizeof(*info), GFP_KERNEL);
> +		info =3D kzalloc(sizeof(*info), GFP_KERNEL);
>  		if (!info) {
>  			ret =3D -ENOMEM;
>  			goto error;
>  		}
> =20
>  		if (of_property_read_u32(np, prop->name, &info->magic)) {
> -			dev_err(reboot->dev, "reboot mode %s without magic number\n",
> -				info->mode);
> -			devm_kfree(reboot->dev, info);
> +			pr_err("reboot mode %s without magic number\n", info->mode);
> +			kfree(info);
>  			continue;
>  		}
> =20
>  		info->mode =3D kstrdup_const(prop->name + len, GFP_KERNEL);
>  		if (!info->mode) {
>  			ret =3D  -ENOMEM;
> +			kfree(info);
>  			goto error;
>  		} else if (info->mode[0] =3D=3D '\0') {
>  			kfree_const(info->mode);
> +			kfree(info);
>  			ret =3D -EINVAL;
> -			dev_err(reboot->dev, "invalid mode name(%s): too short!\n",
> -				prop->name);
> +			pr_err("invalid mode name(%s): too short!\n", prop->name);
>  			goto error;
>  		}
> =20
> @@ -129,8 +137,11 @@ int reboot_mode_register(struct reboot_mode_driver *=
reboot)
>  	return 0;
> =20
>  error:
> -	list_for_each_entry(info, &reboot->head, list)
> +	list_for_each_entry_safe(info, next, &reboot->head, list) {
> +		list_del(&info->list);
>  		kfree_const(info->mode);
> +		kfree(info);
> +	}
> =20
>  	mutex_unlock(&reboot->rb_lock);
>  	return ret;
> @@ -144,12 +155,16 @@ EXPORT_SYMBOL_GPL(reboot_mode_register);
>  int reboot_mode_unregister(struct reboot_mode_driver *reboot)
>  {
>  	struct mode_info *info;
> +	struct mode_info *next;
> =20
>  	unregister_reboot_notifier(&reboot->reboot_notifier);
> =20
>  	mutex_lock(&reboot->rb_lock);
> -	list_for_each_entry(info, &reboot->head, list)
> +	list_for_each_entry_safe(info, next, &reboot->head, list) {
> +		list_del(&info->list);
>  		kfree_const(info->mode);
> +		kfree(info);
> +	}
>  	mutex_unlock(&reboot->rb_lock);
> =20
>  	return 0;
> @@ -178,7 +193,7 @@ int devm_reboot_mode_register(struct device *dev,
>  	if (!dr)
>  		return -ENOMEM;
> =20
> -	rc =3D reboot_mode_register(reboot);
> +	rc =3D reboot_mode_register(reboot, reboot->dev->of_node);
>  	if (rc) {
>  		devres_free(dr);
>  		return rc;
> diff --git a/include/linux/reboot-mode.h b/include/linux/reboot-mode.h
> index b73f80708197677db8dc2e43affc519782b7146e..98f68f95c9e8460be23282c51=
ef7fcbed73887bd 100644
> --- a/include/linux/reboot-mode.h
> +++ b/include/linux/reboot-mode.h
> @@ -13,7 +13,7 @@ struct reboot_mode_driver {
>  	struct mutex rb_lock;
>  };
> =20
> -int reboot_mode_register(struct reboot_mode_driver *reboot);
> +int reboot_mode_register(struct reboot_mode_driver *reboot, struct devic=
e_node *np);
>  int reboot_mode_unregister(struct reboot_mode_driver *reboot);
>  int devm_reboot_mode_register(struct device *dev,
>  			      struct reboot_mode_driver *reboot);
>=20
> --=20
> 2.34.1
>=20

--czj77t3nras3pevm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmjJsO0ACgkQ2O7X88g7
+ppfBQ/9HMIqbVJuvwZzQo3EipYpGXXdP/CdOeC6oZnYrfQm8LfZS8TcF83agJhf
CNUrAY2d3YH5Do+/xl+2KA2kgYHMgoDDX3f2/DWjpTadO5P7zW6vYcDNP0w0wR4S
IdHfOPa5Ov0ybtsepYCFX5QlMzevP1Izppg76+ERDoWPSUCT9IT449rM8J7aRScT
48JePKqtUCacNqV4zwEGcG7M2q8FVsv2xkpulVuF9XXicdSoQxvxeAMX+/E5HsWl
+2DAfSHs+gdGWrWacr9IYceQvCQUzb6nX69ax1Jqo0tGxY8CbO6dhQjw5OFpxnXt
RqB7W0yenJ9fNtDSWd7UEv1OtWUtN9MLb5ZDvMcjpCWWHIP8oqL7IIUaXVESEDxg
EhJ3/ekmVpdW2oIvOyDAsT294qBpiPsZngU2SweijEZrcYTpIrjqTM7eTzB6hQbL
K2A+VAq8+4T6UBM6Dq9DJddGtKWyG86e6aUPnnwB2pzqRH0D9kYMpv72AF+7Kcx1
HLmvKxQrF2wKvXINw8uSN1GokRWVZOeUt00dhiWjpXcXBd+xxf4vU5ZGeVZaLuBS
gvMF93kzoC9QTcpjw/Qa/12NY2xTD4U0oqWOklNhVjWB5vgAeEV+EylpTsb9tFXq
gD/QuzyhxxxjrG6t0jCLYsII8Jz+aibFgJK0RGzLK3ey9QzQ9Mc=
=5SRf
-----END PGP SIGNATURE-----

--czj77t3nras3pevm--

