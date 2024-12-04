Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8F85E7716D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 16:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=avsElWR/fKi9kOjnFO0ifEAxNLupFUHqYpFEY06aggo=; b=FFEZtG+hKtS++9VziYj0CpGoKp
	7amFyuZFgKXWbi0yloZ5+yXKPtkd4t0OLBe2FzNKUfr9txkIHkfIADiyyaTRsqK4qKzzDVqwSSdtP
	8JKdTpWR6NKwUuMaC2FSWnxNxkuO2+cIRwg4mlnP+/btSBmNHiRXfekp/5rKTDmXcImirJNNK1D3t
	L4tZf3l0Rhjtqny/N/mBOoTAQmDShed1X9WuTHHFh8/IPUvGnTAeOG+m9bM2CgVyTze3/3wafnAcN
	UzNLPPED79oCIOC+AN1Y4lxDN45OQm672hZGdjJxfaNMxI+5ADi1mIWS9Dh/3j+IQhfqLjm4CSx2d
	sLOp9s7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIsDl-0000000DBU8-0BfE;
	Wed, 04 Dec 2024 16:27:25 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIsCZ-0000000DB95-002U
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 16:26:12 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2ffc016f301so74813361fa.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Dec 2024 08:26:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733329569; x=1733934369; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=avsElWR/fKi9kOjnFO0ifEAxNLupFUHqYpFEY06aggo=;
        b=Fg87Mtwrlr4p8KpyL+N+KR/79pNeMpO7gA10O71pZg40ezmOF4ZH9a3w6nXk24fjC2
         RUa3o5yM49u+/Fyrfi0719sbkHzGAv8wlkZGtZWsy9lw/dhjjPKj6KPdrSqo65iTNIzB
         Vd1gLzjb5h5WL9FcPOE+8t7NAF/JnMtk3X4NyXb2T2BNydjqF6AybKvPzY7KOiVgXkvJ
         FyQTkrz+oqh1A0cDHfwF6v0vhur4PwTJLG5XKmUcyYxGSHbbw6lxLb9sw3p/8UaVTs4C
         Yfi8ci3W4/G77hLQr+81AGz9olYsOwb/arBHxST/ut+f3HxWG6nCiU539Z9cw45XR4nm
         qLHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733329569; x=1733934369;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=avsElWR/fKi9kOjnFO0ifEAxNLupFUHqYpFEY06aggo=;
        b=GnQMh78hiRnoSnyb+EhedBtGiOKeKIP/rgaJdrk5ezmR4guNqPmk3tkcwWzj8gZTNM
         LfHPXG+aU0kAqjpeHgbtg7pM3jv3rJV3SHWD745VFk9z5LSujUrPigkmQYIQ2UrHFZqq
         w15emrQuhJGGPEKWRN+Cdsl7z3E1F41wd4edVtYi1AwTfICU3mxTMPrYLFfGbTTTQ9lQ
         7S1ig7ZYOsGPkezyhAQtpZyZ0nDBshIFYn2psgzPlFjAHinesG3OovuRzkrdrOHZEhhT
         jvE0uJ6gI6Mq2SdL7vtcIp8hYLp4b9Tvp3aUUtLGJn/2WQ0TfFZLK+YJZbHd6jHAK3V3
         visA==
X-Forwarded-Encrypted: i=1; AJvYcCVX87daqQiubL3wSl2s7Ws43HzkUe60CEV2XRet0fw73boN6d3RzJDlPuvi9JdcZzeqSDu2ZqVm+xEfkFyGUwI+@lists.infradead.org
X-Gm-Message-State: AOJu0YxMg6dwjXWWD4wN057fzIYM9rOnrY8t4EFZffuQpdhfeULTDMrQ
	unSC8Z/GnNFZArOUfi377jFl14B3Y1Td/b0sFAKSd8RZ+R0CLHlP
X-Gm-Gg: ASbGncuJD/Us00TDYhZ4YRiaHsyOPVHB5Zqy1bFzD82weMXf8qVVlHBRNfiChJ1hM5E
	0o40R6akAGuZ7qNXG1TDkbQAVEV5jRrF1Rl4CXEZVEyyw3BvZUIzWAuRL06CoYwkvx4Z1hTukBr
	0J2hPcu35GhwEnXGFjtvo0Zam0MA8qqlpj/Ise5HrGEjzju/zg6P5W8GzX1WP4XTqDEIbYW7WIt
	vNC3Aw1ycO4sTleb+1WvY7eAIzLYAVt20rovFEEfmsTktn/6QJ957TNdCN1h5UItKH1PEgKLA7e
	M5/bDNU6Vdg=
X-Google-Smtp-Source: AGHT+IHZ1hSLNbyVNKzBWLLPkHij7c2uDQguaytbWO4jC4VLwSaGA+Z10qe03u3qav3/qIqYzj4nJg==
X-Received: by 2002:a05:6512:3b83:b0:53d:d41e:b1a8 with SMTP id 2adb3069b0e04-53e129fdd48mr4338645e87.20.1733329568568;
        Wed, 04 Dec 2024 08:26:08 -0800 (PST)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df646f19csm2252958e87.150.2024.12.04.08.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 08:26:06 -0800 (PST)
Date: Wed, 4 Dec 2024 17:26:04 +0100
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Russell King <linux@armlinux.org.uk>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dinh Nguyen <dinguyen@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 5/9] ARM: mvebu_v5_defconfig: rebuild default
 configuration
Message-ID: <Z1CCnGZvuBLZ2k2P@gmail.com>
References: <20241204-defconfigs-v1-0-86587652d37a@gmail.com>
 <20241204-defconfigs-v1-5-86587652d37a@gmail.com>
 <303c44ca-879c-477c-a96c-9741bf3bf31a@lunn.ch>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kilpMY/xPkg/Gz5s"
Content-Disposition: inline
In-Reply-To: <303c44ca-879c-477c-a96c-9741bf3bf31a@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_082611_035521_2E1CC4D9 
X-CRM114-Status: GOOD (  14.21  )
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


--kilpMY/xPkg/Gz5s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 04, 2024 at 05:04:25PM +0100, Andrew Lunn wrote:
> On Wed, Dec 04, 2024 at 04:56:47PM +0100, Marcus Folkesson wrote:
> > This configuration contains obsolete configuration options e.g.
> > CONFIG_MTD_M25P80 which is integrated into MTD_SPI_NOR.
> >=20
> > Rebuild this configuration by run:
> > make ARCH=3Darm mvebu_v5_defconfig
> > make ARCH=3Darm savedefconfig
> >=20
> > Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
>=20
> You probably want to wait until Arnd big removal patchset lands,
> because this is going to be immediately outdated.

Thanks for the info, I wasn't aware of this.

I will give it another shot when his patchset has landed.

>=20
>      Andrew

Best regards,
Marcus Folkesson

--kilpMY/xPkg/Gz5s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmdQgpcACgkQiIBOb1ld
UjLPcA//Y76oK6kUD1ojWaB5BoNve4LYgzpwUuIeHXLEpw6zWShBHmqs6RM3dzs9
13xOZUPx4wFAWbYi06fdTM33ep0akpMgVwbNG6z12mI3W3MbRsz/CZ7cM8oVTTIo
NViHeU9Jk8EZVX1udBAFToQIOeO5v1TICeBQF8aWhaNv5MgUNL6H2hQ/AaHxpjmv
P8Trltk+r3A4d6g0ZcJ7LvQcIdePls3jPwnHMNHcb8YkfPCwTAo3mqWm3N9mT/SO
CdRsblLyGHBqu+c/9bgqAZglgyAi4xjIhWJVBwdqVn9AgHRsKwmxBkX6Pa3dqr4l
5P+PBnoqv/CAtlO9nakNDPu4NyeYJ8M6MkKU/5wjcVIuTNnsz9ntcdsJimmC48y9
F9HI8xvUpJjiRtd5VnrCbU0fbw1nh2G6kpCArhsgmpq4Th5EAZxhOBV6yV3ClzJJ
5zXckqwRG9XbFZMQ5nuC9J+qIzyjqTEfIKEgOB+ZlbAs4in0H25z02z7wmUVvkNS
yj6neRSyB2xea+W7wkSdIcxH+1WFH24AdV6nxyYtzZjrLAT87yIf+EUQUJZztk7H
plJs5NLilJBeeKsgC0Sj67Z//MtLLv+3FQZmyOTZg9eI0qvVd3A1SKRQLopTE2vT
oF2TutNMWmnnauYXBXta/Kk2yC0ubur3Ne9bYG4sKni3yEI6WE0=
=vnf8
-----END PGP SIGNATURE-----

--kilpMY/xPkg/Gz5s--

