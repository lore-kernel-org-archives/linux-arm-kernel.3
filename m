Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCA12C5DF94
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 12:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IJ2S2NN5RmqVB8PHkfxAhd8Zl5dVEhVpefrqaDYB2O0=; b=aDsOPCqidWrW8OU42VjuZLMxdx
	yI1LOjYUZx+xKI3tSJjIRLKyirpDUf6WoZcKc6t3Vsp52OcRZy2YZ2XMvjGms9u/Ew05wjD79AGKG
	S/XoCDfyh83lQ03Xs6oDO7RReTvSMFwz4Qs4+b2NhqgbVgm9YUTmZ4VvawMBim9kmfOGBGuzaogTS
	83qVqfQTc7/mWtothWRtQxsy1O3Nb/EDHzR2tTTAsa8la2UT6IH6LMVuutXxoIRGXi5gHbhPZx1rv
	ZkvNxb4ImyVkK7R0i4/pMss8dRK6Ov179BHsawAHdAzzDXqBNUoyc6QdkTwOZEGvUyDH4yEEjoj3u
	O/aszlnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyTZc-0000000GaPl-3Jz6;
	Mon, 24 Aug 2026 12:14:44 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyTZZ-0000000GaOc-0xUt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 12:14:43 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-69c108fee7fso5431225a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 05:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1787573679; x=1788178479; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IJ2S2NN5RmqVB8PHkfxAhd8Zl5dVEhVpefrqaDYB2O0=;
        b=P870vhPCs5v+lfMCcf09JIjHQIBtUAfyzyePVWC5PckPz+9lUZwYQWl8hZZR3Icx12
         gFLwhLhELIJNmeHPWhxR/+x232mGg8VK8QhNYjYQXnmBE9q20F3KIVCI6wb6jgCRgQHB
         /wJwMe8ycL/TsphOKTlADHaGlVUw3TpgG+lHGf4FuTmxMargv6SKnsXYsDjOslpbfGbC
         oMvcl7mKR0l1WFvqhtnvTQRk0grpylhY9KhaJ75heppfLZwIS4H9B4nVWhb8iYigIC/8
         yU5I0S9Ai1KJX5UY9c3gh7L5vpeTxTaMdeUok/B72YzhunGiKcDx13YkCTxhNVtGAEb3
         GHrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787573679; x=1788178479;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IJ2S2NN5RmqVB8PHkfxAhd8Zl5dVEhVpefrqaDYB2O0=;
        b=N2vbvha9j3f+jhhFSE8WGCYfKRn0x9i0cqj6zMQUX4lvRJG8BpVMNnq3UwFi7mr0GU
         QfysRs3Kbt2GgZfDWwdjk6a4lzNj04StxiEft15fMgLNlCCmdX3mA7qgWuE8i8Kol294
         M6QPfhEKf/GIRFzwYLANXJPpy4xEDBxP7Nyu66GHNGYI1Wq37bfLgFbTrvAW3xaAxITd
         7iR2EjQ9ocQJGk0Wr3y1z84V27/TkUZ2PVWwJJQYK0WG3BeID2h+5gKkWrqwzOB63kow
         UyXfe+WJgEK4Uteje27i9Q/wAMo96jBCcBSiDPbEkO1R36Na8WmLJSDGsCHja/fBrawP
         7IGw==
X-Forwarded-Encrypted: i=1; AHgh+RrVeOW+E62014xF+XoJ2Ebw2eQwh+Y/LNANoSyD3pbbBCoZZ57v/5so7mc7w0/HDLxqSSBeSr73GgXIzCLN+tWt@lists.infradead.org
X-Gm-Message-State: AFuF++masmlGvRXShq+OU1aRRz7x0Asv50PZ80B69Zfz3vpR89O62l+m
	buFKptbnSMcGNnfWyyeMXoG5BGeTienogxP3PmVub/jxv41lybl5ht4g/qWQS7jd0X0=
X-Gm-Gg: AR+sD10MjkRSovNTVXdzxmp8SRz2qb3tPx2Q4rocAM7JrQ6dz/HTpgoqL7VGakURqg1
	QXBZ+aSYYcf4arA5vc6UhI30JUdlK7j3tnlA11zg3kPZJIigLlShLWi/NuFJh6h8vn7OSO9OSL+
	SF5WKTyPf5cZb4/hlsy24cUC0e3yKe7Z0MU0XRmdkpiimPUK+w+gGn9SlHvSLBNBVhzByPu4zcO
	Bd/Ewwo7nM/3vzXnYYaxmD0YEwUez5J2j17bTMT0Gdb8ntPP1+tQltt9wshpWcZTSyGgPQBY6U/
	bI49OtkRQTzU9KP6kk2pLqGmOlWd1gaOFmdtAsSueepJlXR923GAEVmg/AEF5d0m0Drk/3o3yaT
	p3vtM6d1nZua0fkf30t/BDBeICsKAPZa1IFXJDRj75dfzMNdhgL1nlw3axRBfv69WYj4NYxynPN
	pi2llF2ZMH0Gd/ifk/qRWG3YfIdXUGWzRarJ7KsRgnygXOu1teePKfYkaytftN9uTBFKeTbqRwj
	yjGd/8XYpHnX90Pk3PPnQOam8FNmNT9Lz0QJoNWuPTWjd3m20x3
X-Received: by 2002:a05:6402:2b98:b0:6a3:6d6d:2296 with SMTP id 4fb4d7f45d1cf-6a582b0cfe9mr21318328a12.5.1787573679054;
        Mon, 24 Aug 2026 05:14:39 -0700 (PDT)
Received: from localhost (p200300f65f19a904efa8a94b704adaa2.dip0.t-ipconnect.de. [2003:f6:5f19:a904:efa8:a94b:704a:daa2])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-6a59e00129fsm10155492a12.1.2026.08.24.05.14.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 05:14:38 -0700 (PDT)
Date: Mon, 24 Aug 2026 14:14:37 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Hans de Goede <johannes.goede@oss.qualcomm.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Guenter Roeck <linux@roeck-us.net>, 
	Jyoti Bhayana <jbhayana@google.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Ulf Hansson <ulfh@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, 
	imx@lists.linux.dev, linux-hwmon@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v2 1/2] module: add SCMI device table alias support
Message-ID: <aowz8Tcf-ZvVf38m@monoceros>
References: <20260618-scmi-modalias-v2-0-8c7547c1be21@oss.qualcomm.com>
 <20260618-scmi-modalias-v2-1-8c7547c1be21@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2dhawfj2mm2jx7wk"
Content-Disposition: inline
In-Reply-To: <20260618-scmi-modalias-v2-1-8c7547c1be21@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_051441_294676_6C2B034C 
X-CRM114-Status: GOOD (  17.10  )
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


--2dhawfj2mm2jx7wk
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 1/2] module: add SCMI device table alias support
MIME-Version: 1.0

Hello,

On Thu, Jun 18, 2026 at 03:56:34PM +0000, Bjorn Andersson wrote:
> diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_deviceta=
ble.h
> index 3b0c9a251a2e..769382f2eadd 100644
> --- a/include/linux/mod_devicetable.h
> +++ b/include/linux/mod_devicetable.h
> @@ -473,6 +473,17 @@ struct rpmsg_device_id {
>  	kernel_ulong_t driver_data;
>  };
> =20
> +/* scmi */
> +
> +#define SCMI_NAME_SIZE		32
> +#define SCMI_MODULE_PREFIX	"scmi:"
> +
> +struct scmi_device_id {
> +	__u8 protocol_id;
> +	char name[SCMI_NAME_SIZE];
> +	kernel_ulong_t driver_data;
> +};
> +

Note this won't apply since commit ad428f5811bd ("mod_devicetable.h:
Split into per subsystem headers"). Please create a header below
include/device-id for scmi similar to what was done in ad428f5811bd.
(And don't add an #include for it to mod_devicetable.h, but to the
modpost program only.)

Also please only add a driver_data member if you need it. And if you do,
consider using

	union {
		kernel_ulong_t driver_data;
		const void *driver_data_ptr;
	};

instead of a plain kernel_ulong_t driver_data member. I'm working (less
than part-time) on changing the existing device-id members accordingly.

See e.g.
https://lore.kernel.org/all/cover.1780048925.git.u.kleine-koenig@baylibre.c=
om
for an extended rationale.

Best regards
Uwe

--2dhawfj2mm2jx7wk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqMNaoACgkQj4D7WH0S
/k4jGgf/c9brV06dZI0ixNsgSDxInOAAwxzw0Va6pEilBFWeD/1x8NZxQxIb86eu
ERFi9ET7K8J1CkEXpSDumSzKSUdfMylIEURvojgjfnQEsYGjKUB3lgyc6ZMvZJE8
KVGIQQhfXJzgdOen9ivFrmp13avoOEZecODfflOtBiCVBT9yqo9G8cB98iPlfN0n
/20yUKuCi9BVxfitySRFAt3h5YGf8mWqJYyRGszONcDeatlQ3hYxcZRc6nWohvA6
Pj79A4QISdBE4jbZiuZ4B7Tqk88TXQ1mLTCo6WZ0jaoWxESWjauNoBJPyj55WW4m
FOrbj1Kew7KV7tsLQ07HGfCNIJuI9A==
=DfdU
-----END PGP SIGNATURE-----

--2dhawfj2mm2jx7wk--

