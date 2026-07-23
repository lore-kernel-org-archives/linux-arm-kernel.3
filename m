Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA28EC531CB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 06:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YX5OGenWV0xhnlGLLMQnc7kob7nrOP85c/FXvIqG0JY=; b=joCgnyqA1hC9DjPjFRh4C1ESot
	yxh4udlVBT/PZuyt+FEjqLSPOM+3ziC/9X3kn2FxE65JZoz3ZpmwkOJ6Rq0L2zJJXYvD1I98bNf/4
	5ruUC73LDvh7CiqsKORzfoBSX5zGoNtFi/jalDJgxFA0lt6gqXede7DL5dNs/cCdAFDZUPm1ac4Qw
	/vJEoRgyky/AY3JNBGe5b78DkGEh/OpowKVpsJe1X2cfALuVLOl+y6/+6D3xeCGFNiH/avRBWnKY0
	DU2Si8bTfZ5JNhN25q79iTWMI0au8fx6riaHKpPJOmajcicryOZOg/xpPRoX+BWp/l/8NjqczMEDH
	H43o9nag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmmzV-0000000DYBA-1fLi;
	Thu, 23 Jul 2026 06:33:09 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmmzS-0000000DYAQ-13z1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 06:33:08 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-49557167508so2323815e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 23:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784788384; x=1785393184; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YX5OGenWV0xhnlGLLMQnc7kob7nrOP85c/FXvIqG0JY=;
        b=B4Gnpm/8fGOcMUTCG278L+QIzHf1PA6DB3inqxhNB+4BtZ2BABISB6W/XXwPL4P5aV
         ig+VXtrXK6//KyFtMWQOqYxHiQVrvMwO0MRoA0e5/k1Vx8geT3yi0ZrMrQiVYMCqdShq
         fyV1Paai0p8/ftzkcxP0t9vbLJ08L540Kyvc/4ApAdlB2XsaatU0V6aXzJ6rX55sQ0wd
         mCkFYEiJQyEBWZAKoKGkPXY7BWw6hhgcBPSFyYzy66SjTgMp06u5BCsXVY7NjmkKo6zy
         7X0VpRNDeu+d89bQrovE7SGWNkvUghPcSCRI91fwfSnmY3b8dU4LduXAELNZSU94Fxdh
         mZEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784788384; x=1785393184;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YX5OGenWV0xhnlGLLMQnc7kob7nrOP85c/FXvIqG0JY=;
        b=r4e1xiEo0LXEUvVZhrbM7hFqrUB1j+X/6SfYGO39Ul9G+qWgWwS88rP93g05yFr2Cs
         QFe086CVg7ob1w8HvBJJZXm+LD5gP0m58PNVUyMCXsuU2HK3SRrJDxJ7vMEp8uIaU7jL
         T37wH0r4HgYE6Os7nvg7amOSYgew7/zoAY4xa9wN/7xBIi9gIyKpkk+7Z5ftxNEM7f0c
         aLTn2mGEszazfxdqGDjIx2uL9Tx/z/kCpb4slZGYOrm8JmoGOQr1iA3M05U04deHC6ex
         NOCNgTk+5srybuIChhS4Q9jFEfyk0e1tx1lzBGPFxEFbvRFxwo73Ow10VW2gKNoaetAs
         db3A==
X-Forwarded-Encrypted: i=1; AHgh+RoP+vLDfkZdnNJ0jjcOCfhkvYcLs1af3KmHCeC29uYrGL+SSDKdpZsfvoneNy+mL4fVFfxEKoWWImJZ/9QCGiNf@lists.infradead.org
X-Gm-Message-State: AOJu0YyWC4lk2VPsR2Ag/Lj6u5wTkaBYTYUjQflISCo+lx5BpCH1Uyf3
	dXcWgoygv32XUMr8u9x0oPQZdBKDPFpwp4411x/iJFDMw0RJLYQgVAlCxNVsvryedlo=
X-Gm-Gg: AR+sD10KR4EnFvvyQWgswU5Hf5ZW8ApoNnk6Xf6wMVqcMfqjRU1zk3fRAzDfvNv73So
	ccDvryMKWDJkXyhcsG6UnQttjGcvSZLcpVRkA/11ANUJtCQtSSxC699Dmge7fwa2KY1r+WYJv7U
	HxzaB1Ko8Kd39V9Webb5AslBm8nU5ptxC4HezI5A3gHIDpZXVYXfKC9KivQrYT/ARYmzjUDhA3A
	nLkohPqpALEeZYlCy498rLbbYj0sajL/FMf8XaTAB/C7Y9ZSdQJisa2xBsbMercCzCP2g7GhrLM
	r1YtTezqCGAjDMHwEAuv6+bcMDxxGqYr+b/7WsKp8Q+w5VLkHtCbljzvg5JNjv6a9H0QCprBuo/
	wpx0OwNMhaSsYBqwghZV1YBhXo2gqGGAVs9XFq0nopkyoDHs3NxHKG8ARezkckFqpNJueuRhrOs
	SMJDEuVUw=
X-Received: by 2002:a05:600c:c08f:b0:495:71fc:3a64 with SMTP id 5b1f17b1804b1-49573cfd688mr15528255e9.25.1784788384211;
        Wed, 22 Jul 2026 23:33:04 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47f85c531basm12160604f8f.19.2026.07.22.23.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 23:33:03 -0700 (PDT)
Date: Thu, 23 Jul 2026 08:33:02 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Shenwei Wang <shenwei.wang@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com, 
	Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, b-padhi@ti.com, Andrew Lunn <andrew@lunn.ch>, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v15 4/5] gpio: rpmsg: add generic rpmsg GPIO driver
Message-ID: <amG07XSER0tqQTDs@monoceros>
References: <20260721204704.400781-1-shenwei.wang@oss.nxp.com>
 <20260721204704.400781-5-shenwei.wang@oss.nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3tnjgjfvpvmj54rn"
Content-Disposition: inline
In-Reply-To: <20260721204704.400781-5-shenwei.wang@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_233306_313942_6CAE3E19 
X-CRM114-Status: GOOD (  11.43  )
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


--3tnjgjfvpvmj54rn
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v15 4/5] gpio: rpmsg: add generic rpmsg GPIO driver
MIME-Version: 1.0

Hello,

On Tue, Jul 21, 2026 at 03:46:47PM -0500, Shenwei Wang wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/rpmsg.h>

<linux/rpmsg.h> includes <linux/device-id/rpmsg.h> and thus provides
rpmsg_device_id already. So please drop the include for
<linux/mod_devicetable.h> which will go away soon.

> +static struct rpmsg_device_id rpmsg_gpio_channel_id_table[] = {
> +	{ .name = CHAN_NAME_PREFIX },
> +	{ },

no trailing comma after the list terminator please.

> +};

Best regards
Uwe

--3tnjgjfvpvmj54rn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmphtZsACgkQj4D7WH0S
/k7/awgAj2vySxmy5vP1QwUkRZfLQnnTNKmx1EuDKoXg/nw4qRoyCtymTNF6iUvm
bSf7sZlRAqszzyqHR6g/qzf5yiGVUiAQAfxOlSYgB3SkP/7geaQXcPhlxzHxYU/8
aSWjMJ047hhilAq0C6ntgCbsBuUbHyGKC354E+EZYMESs0gKbdk1cWlNuay34k4A
Akaf2SEW/aZ/E/X1znyI/vRJyIqv1QBeI4+coopWyFigk2eNA1adyWif2iunnxtt
Z7EV690/VGZmcpQwDl/IAevcLh4cg2nhiEh2J5iIpJsvbmiDLQng0G5V7BQxJ9OO
7GNNyk0IGXtulJ1RztaEG5a7Kvc/3g==
=H5Si
-----END PGP SIGNATURE-----

--3tnjgjfvpvmj54rn--

