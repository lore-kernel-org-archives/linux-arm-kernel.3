Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72316C5DF94
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 12:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MHbWNJk5cOn3r4GzbI0kltGoUU2l7AC2RyCAmVHKUJU=; b=qKSoc4j5oCP6McVYF03p/Wnsms
	3rlRT+Eq9MKGZgrIHvywFaS93w27Rwttv15DMitiAE3rWWZwXt0CD/jzx06MqO5TIcyBIti2Flgi6
	ZIJi2kUvhDCSg/grTfO4e7tXCE4Pkrc0vpjCMhzCT+YAfoc8WuQz8va4KDhsC1onOnclSH3N3lRwO
	4YM87p3uEjGrzcWDBNeUKwYB1eW2Oa2xA/wef1nXpENz10VoIdSYZ3fFCJGNPj+M0M6xgd7etGcOR
	pHgmys8BLU84ZPA0j2vEj85wOUNFZuFBx5FWvfMyKXlWU1oKkxV0AmK0itvK2scdOOLV/tLRPUaQS
	HTKKGiNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyThE-0000000Gb1A-3eHc;
	Mon, 24 Aug 2026 12:22:36 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyThB-0000000Gazj-1tB6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 12:22:35 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-6a0a4aa99bdso5741625a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 05:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1787574151; x=1788178951; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MHbWNJk5cOn3r4GzbI0kltGoUU2l7AC2RyCAmVHKUJU=;
        b=NBiaEBdYXmta6bs5dnBX4xwuUrM6WBrS7dgSFM3o80iRDE2ZibbwPCA9/ISy7nUYhs
         EVN4wwZnsOg5XOyBGgl09AmIB8pcgTZQ2PDdh7wG6mWP1Q/Gts7U7t5uWgyxCWfNSZGE
         sMLDK+wxt2RxNVI4rv67QHz0BGY8VNHbthoIsir2bptuuexLT2Gl6simCe3MaNlEAzud
         YdufhXV8MH1fQYV2AvjG9USQLms+MOQCJsQpDEKtpHl0SlGZK18QQMbbMbQ80IA48F5+
         dKUS3b2h9mHtel6A/+Det/rnxo92/lQxA+G71sS4cO5cwTTq8jHUAvZMi6hrPx6fh6ho
         Fmew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787574151; x=1788178951;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MHbWNJk5cOn3r4GzbI0kltGoUU2l7AC2RyCAmVHKUJU=;
        b=b71T48n9/ss+ykVGzHaXPUs93pyRP7TDHXJ0xQ3+IPp21FG71BJ+Fbj9vE/KF6Khgu
         pHubdQbFzDrFEw50OhOboH5dHk2zV3HoyisvI4u8PNiACHoj1BJxM2b99bWiJerv8Fsr
         MIDiX7OaciN+GSup4rAPwcmKlgs2DCVyzBer3B2CyhWaWF6hlExWy2Gtlva/pBLFMhtj
         8Ln2gzye31El28a+cTsuIMmb5u0lp/pnZsoFqpiNVmsf8e2da1cDBFytL+gQeYMriJ4L
         +fHkW23OlsNC2h/3SLEJ63+3dMwl6ZN9uv77PRqJItYtnbOrB+azKsFf9ir3GRyUTQh7
         g7lQ==
X-Forwarded-Encrypted: i=1; AHgh+RocSP3/V3bvuQdEb3S9NUCcM5AbwIBciw9vYP91mU5oXCYPzo0mCJlmJPLwaPCxePCSU035UBji4acXupM0i6Z0@lists.infradead.org
X-Gm-Message-State: AFuF++nVZ+e3r8tEaZp+Hpw8dwNAooB24P+O1Kw5XPcp4yKNwsi5HZ41
	xrzTOeS5Imzryp6r3Hl0rm5Y2aGbNmPHePHuDrZHmYTBbZozqBXnK9kNY4UQ7Rsv9ck=
X-Gm-Gg: AR+sD129Alp/bEfeQliA4ZXUowzWzEdJ7khojBcTy+ugm6sKBGhbj5uti1WLcmTj7b9
	M+p7P+VuTGG/rLeScB2kI6RxNimV4sKdSxpWVnoO8vQzt4fHhBGJsMLaOB9b8KZriQgAUwxlRa4
	oJOlTpG0PBhfxAljSWBeSRJNrQXiKJT4hk0Dl9smZQsslsKKLZg+XYxfzrxbZJDCve+HERNvATW
	GChumtMHzY//OE0SI+OO+NrsR+lRhVVI4mbgzw2BugShv4xpZOf7qUdGsQFG1nywJ17ftgfgGUA
	uuA/C/7oqbt6MgkMfF79DAEX4v4OsrFzQls/d5RVJNvPvAK3ppNwz//aFqi8E2YfHQs3Vyx3RZx
	edx9NkrkmoteZtNOT7i5QsQdDBTlfVsl1sqWFphuCMW3qle9qL5QGLgU1tpm7XTUxSB5eLEI8c0
	HEnnvBVstRJZZofGkSeZvyxtbLycRPoMgSLsujZJl3idI5a8/XgiZ6lz8JqOdolofVdO6pIzHol
	+3YcNH0r7HZNIq+juouk+jaAWXHehMKnElsqrilV+IzUnwepJNn
X-Received: by 2002:a17:907:845:b0:c20:fed2:898b with SMTP id a640c23a62f3a-c2492782dbemr1724856766b.23.1787574151309;
        Mon, 24 Aug 2026 05:22:31 -0700 (PDT)
Received: from localhost (p200300f65f19a904efa8a94b704adaa2.dip0.t-ipconnect.de. [2003:f6:5f19:a904:efa8:a94b:704a:daa2])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-c24962a3c13sm1308598466b.26.2026.08.24.05.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 05:22:30 -0700 (PDT)
Date: Mon, 24 Aug 2026 14:22:29 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/3] module: add SCMI device table alias support
Message-ID: <aow2GFAfy84k-N2B@monoceros>
References: <20260820194850.459739-1-johannes.goede@oss.qualcomm.com>
 <20260820194850.459739-2-johannes.goede@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2tfcczky2nyuuvxm"
Content-Disposition: inline
In-Reply-To: <20260820194850.459739-2-johannes.goede@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_052233_516768_5644AA53 
X-CRM114-Status: GOOD (  17.22  )
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


--2tfcczky2nyuuvxm
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v3 1/3] module: add SCMI device table alias support
MIME-Version: 1.0

Hello,

I just replied to v2 and only then found out there is a v3 already.
There is something wrong with my mail filtering, sorry.

I'm forwarding my review comments to here (the part that still applies).

On Thu, Aug 20, 2026 at 09:48:48PM +0200, Hans de Goede wrote:
> diff --git a/include/linux/device-id/scmi.h b/include/linux/device-id/scmi.h
> new file mode 100644
> index 000000000000..4150481524d4
> --- /dev/null
> +++ b/include/linux/device-id/scmi.h
> @@ -0,0 +1,19 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef LINUX_DEVICE_ID_SCMI_H
> +#define LINUX_DEVICE_ID_SCMI_H
> +
> +#ifdef __KERNEL__
> +#include <linux/types.h>
> +typedef unsigned long kernel_ulong_t;
> +#endif
> +
> +#define SCMI_NAME_SIZE		32
> +#define SCMI_MODULE_PREFIX	"scmi:"
> +
> +struct scmi_device_id {
> +	__u8 protocol_id;
> +	char name[SCMI_NAME_SIZE];
> +	kernel_ulong_t driver_data;

Please use

	union {
		kernel_ulong_t driver_data;
		const void *driver_data_ptr;
	};

here instead of the plain driver_data member (or don't add driver_data
at all if not needed). This yields better type-safety, see e.g.
https://lore.kernel.org/all/cover.1780048925.git.u.kleine-koenig@baylibre.com
for an extended explanation.

> +};
> +
> +#endif /* ifndef LINUX_DEVICE_ID_SCMI_H */
> diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
> index a397213bedac..d241421c36aa 100644
> --- a/include/linux/mod_devicetable.h
> +++ b/include/linux/mod_devicetable.h
> @@ -49,6 +49,7 @@
>  #include "device-id/pnp.h"
>  #include "device-id/rio.h"
>  #include "device-id/rpmsg.h"
> +#include "device-id/scmi.h"

Please don't add new includes to mod_devicetable.h. That header is ugly
and each include makes it worse. Just add <linux/device-id/scmi.h> to
the modpost source.

>  #include "device-id/sdio.h"
>  #include "device-id/sdw.h"
>  #include "device-id/serio.h"

Thanks
Uwe

--2tfcczky2nyuuvxm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqMN4MACgkQj4D7WH0S
/k4yMwf+N+KJ5sPPSlOgLDa7K8R0+3z3wNZSXpKG1mfo73lwlNuUQ0o9mdIVnCSh
HjOljqygnPT1KDnD0tyk4aBt8VyDQ7dC93v2tUbPE2EFoHWT9BR9lAcDJY3TqVqz
tjL9DZtz1eAcw4OY5tm7FW6fBRLJTlGAgyzkcgBHxrB/6dIPZ2BaHa+eoJFUN6xU
dBhVHRKQFKBn79sVAVD5tTw46v3SHrs1nbvdIsEtAeVZ+RE+fI+LWfjIknQiSaZ3
4Nlmi2JnGiX9tgfeDp4HEArbnCzrtXLfmr4z8sEMjKzmk6yTKI5AxNXgwRVyD7Eu
UpZzkHPe9Uo1jawnTLk7PSsbMrZ2/g==
=yxWM
-----END PGP SIGNATURE-----

--2tfcczky2nyuuvxm--

