Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98F23C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 05:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y6LD7rCa/Fp6CP9+jmeqeUp1auE+4ZYcET61cTZi1mk=; b=opN5M1Vs2tvrqfFDwxE3NM5+rB
	JfE6jn75MiSO7As3u0fU3tFdt2VTHClpYtnVztdZgE/bDFixY3oaLhjMzUFWOrnCKWdplVcPQQKHF
	hsf//rhJl8e5Qim/QUnkzMkjiAyArrk8SpYJwICqOw9cBonjF249nac7i8lIbb9FO3XbJh6HaxuJH
	9tVCictFa2QPPS2P2gkbfZ5QUZq3ae8AbbBks5j1yBJazieWBX3sYVXWHe3FedU3qVna0nhhU9Drg
	wv7HK4jY7/vjR93iAEThFxK7HD1drJ5eum9Gf/kVzP7NC2rUGb6aKW/po0O1hhiIDaagFo3EtNrLd
	BZtPXyGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwv2q-0000000ApmO-3vyD;
	Thu, 20 Aug 2026 05:10:28 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwv2n-0000000Aplp-1rNz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 05:10:27 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-481412f1828so681157f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 22:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1787202623; x=1787807423; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y6LD7rCa/Fp6CP9+jmeqeUp1auE+4ZYcET61cTZi1mk=;
        b=og0hKcl9pC9DOUWZ+gWHIPZZhHp9pyERr6lbw2Yzi4ZfgH6ty/O8SO/g6v1W5YWrsH
         9OKEq+JKSDYlu8uXnJ7o0nRNoY623ZP20ZxiHFe3d8ODxryAp8QGYPwGeEzQuh2kYmrv
         KC7Ftcpnlozvc8P962FVsMagoPEdGOujqEEDlSwa5H8a/KpJyxajJn8nCoa9qyBDJBVQ
         7OxR3a8g8Zdl4FuoKdfUTiNNnIcDf8N6o+/D/j5uRJWSTdzewxE0p/32PtLiDEaztSQ/
         tDsCcuNzKDIQlr8c4wKXD5DNDKW/6vnl+nJtm3QSTNqG3ALz81YiUh0PZtdGK0x4AYN5
         Rn0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787202623; x=1787807423;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y6LD7rCa/Fp6CP9+jmeqeUp1auE+4ZYcET61cTZi1mk=;
        b=r8FVMRCXExG7byQ1ZQCPrefn4bHG2l2+4hNBk8iA521NXYYcMsxAUBkhlqvw5iR7Od
         doVFiSlgStnC/bgvSoVWVFoUPBZyHStdbXCqXXjkSZ8VBN6LOvo1Ie9MP9PjBfiU7Rfy
         na6KyebaZxau7R38hOSD2w7IusJ02LmL/r3r2xPrlMyfddy4+ZRG//xxAt1s5Rg5zVwE
         0eV7qaA83AYArKgE7x+nzfPXRnjvpxacRuPJ7YcRPtEQ059PX3UlJwXA+N6IpIDDFm4S
         tAO67WDslIN6ut6ymdLbWc/22CYPss3sBsJaEQE/3xvwNUeXsSONgrtoQR1V6JrzDBfh
         C4sg==
X-Forwarded-Encrypted: i=1; AHgh+RpWmBmiy6SJqKQNF2JSHjLg3C6OpyI9L/HOeGndKvAkhCeAosu0uVL9LqV7QLmvPKMnLfhLOrJA96QI2ddDeXuP@lists.infradead.org
X-Gm-Message-State: AFuF++nyp89phvB4CmqH9oZ/qvxp6xxj/gZYsEJnWUbmLpSyGKWED5kQ
	miauj80hBVdRJi8x/Ex+oMEEBKLiDXduv7RixFpmIOX/pd6iL3cTpHSMOLBQIlRIH+s=
X-Gm-Gg: AR+sD11lNA9rHJHWPKrv92B/VnVw1tZSJ1xgB4QR6FLeafKLMXVuiN3L5dOKn/fch3d
	AibkrIlL3KOsc1xMb8jaFkSdSiJZBMdsAkPZFONZWli6jsswb0K9lYVMqWIZeVNcpY51ToJYM30
	DY39LgXgf6BAppZjJgnQcv2D7PQXAsrHdG6kR07HMZJWrXKhNWlTTaQD+vHH+L4zKBjpHx/h1/g
	nGvz1ao5MK12WiAkvjs3suNu3ma3h2Jg2InhUU+SOu0eQSWbtyddnLxVo92gRTWQPd3vkR8Tein
	DzQiY4wY8eMUkgRnRtLfxLTevTwJDFLwGTLTZhDD2tCgHVI3FKFrz4TrMCmCoEeFfi6hTL65gr3
	n7IeMuKPdNhnWCJKUITk4Cjvjc2tXceeNlzTA5aodNjFPrpt8QYO9nclTcDvrwSHC05vs98PxZJ
	OApjT9DjVy2nBPCrNdRz74+/SktC07ticbz3E51pR/XEwMf5b6pw6/biNgBEHtCh0j9w==
X-Received: by 2002:a05:6000:4a06:b0:47f:e886:6dff with SMTP id ffacd0b85a97d-482b1e8441dmr19088264f8f.4.1787202622544;
        Wed, 19 Aug 2026 22:10:22 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-482b14415ecsm9857566f8f.7.2026.08.19.22.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 22:10:21 -0700 (PDT)
Date: Thu, 20 Aug 2026 07:10:20 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Li Jun <lijun01@kylinos.cn>
Cc: sudeep.holla@kernel.org, cristian.marussi@arm.com, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] firmware: arm_scmi: pm: use DEFINE_SIMPLE_DEV_PM_OPS
 for pm struct
Message-ID: <aoaLBNkkSynoGH5M@monoceros>
References: <20260820021718.2454014-1-lijun01@kylinos.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="64mgobiinqdcer6v"
Content-Disposition: inline
In-Reply-To: <20260820021718.2454014-1-lijun01@kylinos.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_221025_501087_77C3114A 
X-CRM114-Status: GOOD (  12.20  )
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


--64mgobiinqdcer6v
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] firmware: arm_scmi: pm: use DEFINE_SIMPLE_DEV_PM_OPS
 for pm struct
MIME-Version: 1.0

On Thu, Aug 20, 2026 at 10:17:18AM +0800, Li Jun wrote:
> use DEFINE_SIMPLE_DEV_PM_OPS for scmi_dev_pm_ops,and add the value of
> .freeze .thaw .poweroff .restore.if these address are null, may cause
> error in s4.
>=20
> Change:
> -Replace SIMPLE_DEV_PM_OPS() in v1 with DEFINE_SIMPLE_DEV_PM_OPS() for pm.
>=20
> Signed-off-by: Li Jun <lijun01@kylinos.cn>

The things I wrote at
https://lore.kernel.org/all/aoaFlNcXC8zfS0j5@monoceros/ mostly apply
here, too.

TL;DR: Wrong placement of inter-revision changelog, missing
pm_sleep_ptr(), and maybe most prominently the request for patience to
start with a single patch and learn from the feedback for later patches.

Best regards
Uwe

--64mgobiinqdcer6v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqGjDoACgkQj4D7WH0S
/k72yAf/Xemjdc635zCuZFUG//Sy+vXuZ9veArfR+8cm4wu1BmIGSXXCH80VU63b
X/hJh3utR5VCmn7t5qP2jbKooon7mfghtKW1EyNvByfsbWhxZ2g+fPBKRfef8aCG
BCscpFWVfEgjG8cEKBSJCY2+ufqAztavvGOfKWE7sNFomTP2cxySPUKm+eZ2Aoz+
TeR0+45yRxzKk5747ALvDo6N4XWeKpJPxNRE5/c8mI0ADF+5S5bqkQxOC5coAgok
rLhBbkLGQ8ci2KCsrYv38BSn1yuIQg1W8M3k+G28pHb4OLrhU1pZ9TZ8EyDtiHjJ
f3ltyL2zRkpIm7nqqOEYlD7501KxwQ==
=rYU0
-----END PGP SIGNATURE-----

--64mgobiinqdcer6v--

