Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C38F5EE3685
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 13:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HUxxqBz3jOTMwO/v0XklbtGC8c413o3aUlrwycDgd5k=; b=3tcS3ruMSDfdf2HMDj+tVAUVMA
	Icl2P7OKYLw0LB5gO31ElfX9zgAx/s7sFz/+KoFD5WzP9yKfqQXgQWTi2bYMQMSxNYRAmBH1xLt0I
	1yqpe+y/XxEmCZ2/i6Cq1ZKyWWLpxZh4bimnzcz44Ixf5JMNo7dffS3X6CtJwgj8xpNpdnbDD4aos
	2OEI596BixZZfZCUEpkiB5+lRmBoFH7/Ki69u32K9SyQipcLxqqfI9IpsbPY15Kx/KOvM3rUPmQDG
	pT1Gvocw07hCQlHcSf3Xn4ljepIaJchNW6GECV6l2eJGeTSKPdFaa6cDyg7ZEOvCWug1mZAWp6QkJ
	DETdgFLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqX4g-000000029Zt-2zEQ;
	Thu, 12 Feb 2026 13:49:42 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqX4e-000000029ZT-10y5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 13:49:41 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-59e64657f0cso943995e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Feb 2026 05:49:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770904177; x=1771508977; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HUxxqBz3jOTMwO/v0XklbtGC8c413o3aUlrwycDgd5k=;
        b=ljPcdkP4y+UexJQVLDoYvsDISC+Hpw7uD+ZjQQc1K+EM/7Q6VwjsVKHywK4G5BGjvY
         BZGVjb+7Yvg0QLd7uaQ1CP5ygXpSCbTf8cMjCqBprJBcv0HAPJSADyHjWVDqcqhegrL5
         H1Pf/FLZLmw6VfcFKrwvLBEeJttmLJtIjDYJlFNuoTqzbfhhhBlx2qkAfNza6VKmn09I
         Tj/d3hiVqXO+lape9b8G9NJ6vhgLYldombzBXgJ5k0EuZey4vac2zMbgeEIyi8nxot0m
         U67IdyOkq4lWHhdbBj5M4CORj0LT0yctl99n0sjL6bloY5tMluG/W0ikfVaaXVl98ZPx
         iZew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770904177; x=1771508977;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HUxxqBz3jOTMwO/v0XklbtGC8c413o3aUlrwycDgd5k=;
        b=fgqxjGSwOg+CZE83Pcn7Lwt0vL7eFbaJEf4Vv1wbAwedG18m3y/bNopHP+cSV/ZlUk
         SBrUI+dXAvFsvbWQ2vCQ9v/6ngDmEZclgUeIHeXQBzl0llxZNUCAO7G3DdzE9neVPR1q
         zaOuXuL7zXacQzMH0Jg9soE3flvy7koy/NpQu696H+m20m8JjVgIoUDpcuMBzW6vTOMh
         3mPdeumMhZAezYxMSLM5TcijuKTLH/FaWjjXUgipoT7uRdp0lLB1kOdzbHe/NsAxQY03
         7i8lkCVn/NJU2ok60K59sF7Fmj9m5CfnPoPW4Kcw6YimH5Rn8nSfvSC4zWMWOANrqGtk
         FXWw==
X-Forwarded-Encrypted: i=1; AJvYcCXKfZSinMdnLUHr9IcaUWm0Pr11RaSks9BDnt7VB2JNHnQ2uLSVqYVLGR2qKQs6bddf8m/DgqmPAxAzkmEdz/YR@lists.infradead.org
X-Gm-Message-State: AOJu0Yzd5HsnkcCIkl7uZHJ1ax75PXDGAnqApAyPO9qFHk42czqOOEQp
	oTTcAc/yDiD2Yfl7v4nk3SZe1MqYGa9rP6jEbOLfpC/Hff8KvGJqDdCK
X-Gm-Gg: AZuq6aLyQx5S0XOZSdTBcEjxg9dc5ofYolFKeY/qZ7YyNlJuyQnwrEkT3+e04Cm31un
	pO4lpJY8sHvlSF12LxPwsdEsefoSFAjzyFDGxEVmCCfR7oGk2r31fSMdmGKV8yXu6rl9tinK8Lj
	gSp3hv55XYjNn1+UBbIeA5d0NrKxfjo9i30Zq2EoHkcbxsAZMxCczVoioNf+hOOXV1cHenXYs2e
	pAbwhoJYP5M6+PiCncLkPl71lTenFuABJe7uiiFrYxyrfRmj7KdQqmd64Qz/v53fK2qBCcsQUty
	b6ywtO3N93gJ6qRbwgs7UQB57s1a3yZAflWkurlq8dDwKERb0ANrR0J6zpLLWowp0G/O5WDIgDn
	1OiHN8iObj0vbyBas9C9RqTrvb4AgDYrWKuRX50hGfkcRUt2jXrAh09HAT8nEeA+Xx2FhrKRk2O
	hqTBrUh7hhyuqgZKJc6J1O4d1ULCXwskBJ0sYFQg9o4SEwQsYM+88sKR18BnRs
X-Received: by 2002:a05:6512:2244:b0:59b:7c03:f2ec with SMTP id 2adb3069b0e04-59e64149398mr1135497e87.41.1770904176750;
        Thu, 12 Feb 2026 05:49:36 -0800 (PST)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f568d95sm961995e87.30.2026.02.12.05.49.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 05:49:35 -0800 (PST)
Date: Thu, 12 Feb 2026 14:49:34 +0100
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Peter Rosin <peda@axentia.se>,
	Michael Hennerich <michael.hennerich@analog.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 0/5] I2C Mux per channel bus speed
Message-ID: <aY3aboaHYNPbXIbr@gmail.com>
References: <20260128-i2c-mux-v4-0-dee49ce276c0@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2rS0NZa0G0VvGsej"
Content-Disposition: inline
In-Reply-To: <20260128-i2c-mux-v4-0-dee49ce276c0@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_054940_337655_23E625B3 
X-CRM114-Status: GOOD (  28.48  )
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


--2rS0NZa0G0VvGsej
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 28, 2026 at 10:54:26AM +0100, Marcus Folkesson wrote:
> This was a RFC on how to implement a feature to have different bus
> speeds on different channels with an I2C multiplexer/switch.
> As no major complaints on the design came up during the review, I
> decided to submit the series without the RFC tag.
>=20
> The benefit with this feature is that you may group devices after
> the fastest bus speed they can handle.
> A real-world example is that you could have e.g. a display running @400kHz
> and a smart battery running @100kHz using the same I2C controller.
>=20
> There are many corner cases where this may cause a problem for some
> hardware topologies. I've tried to describe those I could think of
> in the documentation, see Patch #5.
>=20
> E.g. one risk is that if the mux driver does not disconnect channels
> when Idle, this may cause a higher frequency to "leak" through to
> devices that are supposed to run at lower bus speed.
> This is not only a "problem" for changing bus speed but could also be
> an issue for potential address conflicts.
>=20
> This patchset has been used and tested heavily the last months
> on a custom board based on a da850 (DaVinci) platform.
>=20
> The implementation is split up into several patches:
>=20
> Patch #1 Introduce a callback for the i2c controller to set bus speed
> Patch #2 Introduce functionality to adjust bus speed depending on mux
>          channel.
> Patch #3 Cleanup i2c-davinci driver a bit to prepare it for set_clk_freq
> Parch #4 Implement set_clk_freq for the i2c-davinci driver
> Parch #5 Update documentation with this feature
>=20
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>

Hi all,

A friently reminder to everyone out there who might be able to review this
patchset.

The patches has been tested and used for a long time on a custom board,
so I feel quite confident with the implementation.
It also should not affect existing code that not make use of the new
feature.
But it needs reviews.

Thank you in advance

Best regards,
Marcus Folkesson



--2rS0NZa0G0VvGsej
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmmN2mgACgkQiIBOb1ld
UjJyyA/8DQfVswJwLs4RPMdXzmUPcI98CHFFZ+0g2p3hplUpfq27qmT6pENvo0PF
vsx3QLtpxTWAdSTRwjRda6sW+11AVYLb4PxjJ6KKsAQH6EO6Yht+HwPhjh+2L2D5
fjsMk7DkVL4pHnJj64UP5bHr3MxyTVM/7olk7M7g3Gbj2Qge0IeKVNn/i/AvM1yl
jOAYKEcAFXX0ZofMaJ3L/irlGqV/NwfNWbOXt6ztY0XzK30EWU5CLbY43QBUCNUQ
8HbzbuoarlXoesg33sZnuoFl6rCJIkF4wow99ssbdLMQq/NSXlUdzn611kdBXgiy
ts7iESn/P/tQ45QyzyjksSssHHU9hN3U0NdAx4dRekcJIB0cP07t8wDXIByEK7ig
yRu43LdaGU8vGYyWh3salssI4aHyetyS/p00CWS4ww05X9IKVMNtIFDTm6Tt6ydL
OIi+ORTZjMifI+n5VSKEZZOZO9q7vhB1320W55FP/cPDkqGzKC1xOkXwl3OLyT1t
C32MkUJ3ywBKJZders6aGgjUHGmXr0flLCeYrZOHSDQoxIeTaPRU0TRh2DxMTBHb
dcAj0DpCVM8egl6P21MmLgqx2lHEBIwIpdJG/CipdnpRigDjTD++i/4g478KSuYE
tPU73QKRL3OWKwHIExyMQIn2SjjdySAOpakgzKXRd4jSdJPIjNA=
=d6VN
-----END PGP SIGNATURE-----

--2rS0NZa0G0VvGsej--

