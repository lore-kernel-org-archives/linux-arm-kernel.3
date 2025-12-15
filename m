Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4D54D41D74
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 09:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pMgRQp2NAuNDw0Pr8DKsFpJ1DQmsliJUNJj+b1nHdRA=; b=JeUAkPwy1wJGvoE1lDU8BoIVJ6
	mFFJHI/kdS141HrJPt6yHIoUzqQG1qV1YYyWvewgSYNgK7M3CvCj1FOIQQzVPbNUmbIKPfxeGYLg/
	JxXuVMBV7vHVUmi8T1904E/X2Bk1LQMlYRvdIb5h8bgPSjACMu1snPoa7c1NMKrNVrjTK2Pn4XhG6
	2DhD+4wI63+0uVC/8oBzMXAdyxgUvPPGyP1Zf8QH7GwPrP13t/VqLtFD9e0v9BWJ4h9HEBqGxoqs2
	OZJIq1SvE1uUzCY1lTIW+Y6qOg3lfbqAcBYwuKEwkdijZiHO0dSiu14w9prrTJet5/KtRnwXEigMb
	htHPRUdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV4wM-00000003MuQ-2Qt8;
	Mon, 15 Dec 2025 09:32:28 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV4wJ-00000003MsV-0Akp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 09:32:25 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-b7636c96b9aso532132566b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Dec 2025 01:32:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1765791140; x=1766395940; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pMgRQp2NAuNDw0Pr8DKsFpJ1DQmsliJUNJj+b1nHdRA=;
        b=v+jRZTxLvTGSVT/0y6Jq7AneAa681sqw5oZY7DtjWvhM6XrjLbKUlV4PifVeyqrJhO
         3jT4dv3QANlStT8q7JCsh26rBipMWkQYuVKk1QGSvopIw9z3H7kvM8SJrVcpnjMHFit/
         pZo7ZE4zyMz/mrPh7CK2Fw45zE+VnkLtkuGQdMJVt/UrJ0MD9JV0px62cL294nqXVl7t
         O6e92NTbUxKeFIcO+lcb21+aX6qSK2gT0RglEbrMblvsiSkPKSWMi7xIcSAQWQCX04NJ
         2ff1+8jKHbwAgv8uK+s1Lp5yDsyybckv0Mp/25d+DRCXt6tKQxKWIA+vLjv6vAxRFGq0
         2aXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765791140; x=1766395940;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pMgRQp2NAuNDw0Pr8DKsFpJ1DQmsliJUNJj+b1nHdRA=;
        b=C+83CzVXFBDJMEmli3G1Yrgvr7C9WYdTfBWWbKzB+blqxwyjIW2kHtMc76Jr0OnyZy
         EZv6lCF3Bn9vXH2S1+FjG+OinhV4pq6SaYMobXLgHz9aIJiX0Nlf17k3iSdkpMjG0Ek9
         I7HlFLt19ZGKsBOgYWbjVr+dV0hALsEZdb4EMkm1+jSVZw0bqs+UlXKtoukbO9UAQK1t
         I1Qwe41K56HyeIRSizaqsmzoEovUcsAqgalgWaNJzOQSFRn9LEDkyAIfXHc1OiwyT+Y4
         VkSTnJoCaiqgz+f/HJjN5nJgGmCp57UulKmBosyFJdzZpanstJ0FpEXxpN4R97X9lQ4S
         Ze/g==
X-Forwarded-Encrypted: i=1; AJvYcCWhtC72bXb8w7aXQiqD/aohbajFP0Zem+3LSqRQD2m4GHUAd10Da3qopAb/paW+vm9I5lqHFmrXZMin4IQDLhaZ@lists.infradead.org
X-Gm-Message-State: AOJu0YzjDIjO88mx1esbTlIVshlLG7RMDvjXb8bv81j6rRUvMJWYeCvN
	X92AdmEkZB8lQs9oJfQ2R21eFXtADzktc7rYOQgvUNFZE5vDT/xKhCtrlc5+Xi8ZE+U=
X-Gm-Gg: AY/fxX4+j3FK9+uUz65qN7G7Wf/gFhPJqIxr63JVqS1JqwBQESzOINcDcekQ4JiNVzb
	FKzLhEUH1oJJKxBY/OGdfQyc0MQLuyf+4JuqAI3i3ZqOUkfuKO8+UbQDRUfnDQY33YS8GPedrWI
	p79JBGrpDUF626g2rWq7wn0obckjBh5OcJQlShWLXih94zdwcnJMls5/UhNxbhK/gp0I8ERrX4M
	a74suDxsFKHMINabhHKmblx6qN5bJBclCvBem/+kL9FxeKGSYiPRtG3+cll94HSFRZ56HXLRnha
	zgmoCrWmHYqoHy5rQubJudYZWqa+O1H4MXTYaZU6SuDlSmTf89n96ZRiasqdu+HZpKeiaptrFQR
	93OiKOs2/De4haKnX7J0JzNGthtonPiGq6d4Dk9v6vs9DTfRVTkDrBlJZ9O42LF1bp/AzVtO2ye
	ADkoNiz3zvbc45WUobJ2j8pe+Nibn1wrECUYf9Cg1wqBnGS+HyurGv1lJB21XQV6oigmmhcNvex
	fs=
X-Google-Smtp-Source: AGHT+IEaCg0quo15SNx/nGnta9oq72ocRWkg5l3SHsMTaK2wohhdkzDoQR/uDt0uWt8Scz8Vq184Fw==
X-Received: by 2002:a17:907:1c0b:b0:b7a:1be1:984 with SMTP id a640c23a62f3a-b7d23a912c7mr930197866b.64.1765791140272;
        Mon, 15 Dec 2025 01:32:20 -0800 (PST)
Received: from localhost (p200300f65f006608181e6e27368f7e86.dip0.t-ipconnect.de. [2003:f6:5f00:6608:181e:6e27:368f:7e86])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b7cfa56a7f9sm1329836266b.51.2025.12.15.01.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 01:32:19 -0800 (PST)
Date: Mon, 15 Dec 2025 10:32:18 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Sumit Garg <sumit.garg@kernel.org>
Cc: Jens Wiklander <jens.wiklander@linaro.org>, 
	Olivia Mackall <olivia@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Sumit Garg <sumit.garg@oss.qualcomm.com>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Jan Kiszka <jan.kiszka@siemens.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
	Michael Chan <michael.chan@broadcom.com>, Pavan Chebbi <pavan.chebbi@broadcom.com>, 
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Mimi Zohar <zohar@linux.ibm.com>, 
	David Howells <dhowells@redhat.com>, Paul Moore <paul@paul-moore.com>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, 
	Peter Huewe <peterhuewe@gmx.de>, op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-rtc@vger.kernel.org, linux-efi@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org, netdev@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-integrity@vger.kernel.org, keyrings@vger.kernel.org, 
	linux-security-module@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v1 00/17] tee: Use bus callbacks instead of driver
 callbacks
Message-ID: <dhunzydod4d7vj73llpuqemxb5er2ja4emxusr66irwf77jhhb@es4yd2axzl25>
References: <cover.1765472125.git.u.kleine-koenig@baylibre.com>
 <aT--ox375kg2Mzh-@sumit-X1>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yi4htjinth7u7w6q"
Content-Disposition: inline
In-Reply-To: <aT--ox375kg2Mzh-@sumit-X1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_013223_349702_EF53A0EB 
X-CRM114-Status: GOOD (  36.42  )
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


--yi4htjinth7u7w6q
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 00/17] tee: Use bus callbacks instead of driver
 callbacks
MIME-Version: 1.0

Hello Sumit,

On Mon, Dec 15, 2025 at 04:54:11PM +0900, Sumit Garg wrote:
> On Thu, Dec 11, 2025 at 06:14:54PM +0100, Uwe Kleine-K=F6nig wrote:
> > Hello,
> >=20
> > the objective of this series is to make tee driver stop using callbacks
> > in struct device_driver. These were superseded by bus methods in 2006
> > (commit 594c8281f905 ("[PATCH] Add bus_type probe, remove, shutdown
> > methods.")) but nobody cared to convert all subsystems accordingly.
> >=20
> > Here the tee drivers are converted. The first commit is somewhat
> > unrelated, but simplifies the conversion (and the drivers). It
> > introduces driver registration helpers that care about setting the bus
> > and owner. (The latter is missing in all drivers, so by using these
> > helpers the drivers become more correct.)
> >=20
> > The patches #4 - #17 depend on the first two, so if they should be
> > applied to their respective subsystem trees these must contain the first
> > two patches first.
>=20
> Thanks Uwe for your efforts to clean up the boilerplate code for TEE bus
> drivers.

Thanks for your feedback. I will prepare a v2 and address your comments
(whitespace issues and wrong callback in the shutdown method).

> > Note that after patch #2 is applied, unconverted drivers provoke a
> > warning in driver_register(), so it would be good for the user
> > experience if the whole series goes in during a single merge window.
>=20
> +1
>=20
> I suggest the whole series goes via the Jens tree since there shouldn't
> be any chances for conflict here.
>=20
> > So
> > I guess an immutable branch containing the frist three patches that can
> > be merged into the other subsystem trees would be sensible.
> >=20
> > After all patches are applied, tee_bus_type can be made private to
> > drivers/tee as it's not used in other places any more.
> >=20
>=20
> Feel free to make the tee_bus_type private as the last patch in the series
> such that any followup driver follows this clean approach.

There is a bit more to do for that than I'm willing to invest. With my
patch series applied `tee_bus_type` is still used in
drivers/tee/optee/device.c and drivers/tee/tee_core.c. Maybe it's
sensible to merge these two files into a single one.

The things I wonder about additionally are:

 - if CONFIG_OPTEE=3Dn and CONFIG_TEE=3Dy|m the tee bus is only used for
   drivers but not devices.

 - optee_register_device() calls device_create_file() on
   &optee_device->dev after device_register(&optee_device->dev).
   (Attention half-knowledge!) I think device_create_file() should not
   be called on an already registered device (or you have to send a
   uevent afterwards). This should probably use type attribute groups.
   (Or the need_supplicant attribute should be dropped as it isn't very
   useful. This would maybe be considered an ABI change however.)

 - Why does optee_probe() in drivers/tee/optee/smc_abi.c unregister all
   optee devices in its error path (optee_unregister_devices())?

Best regards
Uwe

--yi4htjinth7u7w6q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmk/1ZQACgkQj4D7WH0S
/k5/qQf+NMGu64faecGn5WH+D12Iy/zqcfwRwh4Jv5/z/9n8f9SRKuXtH6kM3hvA
3qOp/DbN1aDIomzFdgcPUq9OJEeC51ry33uJW7UWHl5lUk4UawAR28vX/1R3nV7t
tz6suQjR2YkY2a/sAxZTSKZZ/A6RTGDxePvozHzuElCmEYDDbNhZpHsvgsLqs3T+
Cso9zyEM2is8g673w2FcAnlW3JL/8jKClvZfcm9JEIRlx48uP6uCqbWeRcYS3rrt
JBUGmWSMNEfYbD3cQbhybixsTPLzfKqkGrbJSyVRkJ2AUAQuRS14sbv7uSGhFw3B
QWGugzTdTxcSdC0SqkOUZrCXgVUKmA==
=VNEB
-----END PGP SIGNATURE-----

--yi4htjinth7u7w6q--

