Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB4FBC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 21:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Ervwt0Iiaz8TlPYAI0hebTCzxJKg0dTs5t3Xq8VOzk=; b=fMTuvMwxyWUm18GdBNcR7WI82S
	9isu/drs/Y/oib3e/D1B62t+oWEvjpz++2+NZcBaWku5g4dOWQ9tB5RPchgHW9QLfHI8PKfCo/GlG
	mHhYCEjuTKKOOHjMeKWet0FSeg8/HqrD+4IeY0QNHWg0KkC/y6Hws2c8PJ8MaF5Jo0ZI9EGoox7f4
	aLW+3Z6kJJryas6iR3+p5HCdTOPoFc5mo9g9p4rU7rxIkyL+DknXg9vr7x2CL96tudJhvetR4IKjd
	CWmivrmr2CRJVVLkLDT2vb5gwgI+e4rC48oB466wXocz5rIa75wmooqvXINJGtnSZuqEZZKT4igyj
	vVeQQBvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn2JB-00000001W13-3iLS;
	Tue, 25 Feb 2025 21:17:41 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn1dG-00000001Nwd-26fM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 20:34:23 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4399deda38cso37571575e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 12:34:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740515661; x=1741120461; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4Ervwt0Iiaz8TlPYAI0hebTCzxJKg0dTs5t3Xq8VOzk=;
        b=lUUjp00bH6cY9pTGEkr0CLD/FhZep/XdjN57eqWhHcwTcBgRyY9wmbQ3b97EPBSfHF
         RMkZelWFHdVFUezhbDYXn3hMs2e2WxU1nD1jdfwcDfESUfr2I6fR6fqW+8kjP4ub27cZ
         D0ltKheaymB+kDyNi2w5SrJP9wpjXguE6a4rR5jjs/ryJ0WMBKIz3ngMZdiX8UAWxaXl
         3PTnzor8YzeFb2fQ/VKtiZ/gqCeky67bCLpxSiP6r33mJERs6T4pADLzeIie71J6Qfw+
         F0Ycmoh8d7MzvycZGoEwtgxXE5JkZmy5KScHQQMfOrPp4jziq2gI4pP+BQd1+vKw7ZmO
         vTjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740515661; x=1741120461;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Ervwt0Iiaz8TlPYAI0hebTCzxJKg0dTs5t3Xq8VOzk=;
        b=mJKSvidlV9PxHRrf8rfN7fQmQu+ibk7Hb4CaJFlEUO8ViG3KRCBwlm+grANYdy28r2
         +XmXSww9DccGd7rI0z0FLsloPVjbwyXOG0WinRy0HUSO0dvZw43EpsQFKwD2pjCSY/hY
         88CmkfCVvVZaMfopxvQL1pUfnxa3PaUbfXgtMqpv0/r9DT1KmoOTzZWGIU8iGskIUjDS
         tWVZ23N7xnUxELDQ+VLjiG6miShRAO1TMGtv5mPowlffKVtLyWu30EjAjuCv6m36sbFI
         d69QpNA+kxp9ndNuUoGWOJOfgNSW6AHRCCP8K+97iw7QHLePSwrKki4EzqXNdhx3IAzI
         0kSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSSczrdaxLJSoyoiG7ZeSLn/CRiqww9Gw3utI9OU/3lcvTytyo2JFy8Hct7wt7ZxeE64VAx/wyDL4/01kKs9l9@lists.infradead.org
X-Gm-Message-State: AOJu0YzMZT/l0onT1P0cgCFMdI0+sDPVt5VjxPU6/nW++iakqmJUpzx3
	RuwIcXHTFglRzoCiRDB/b++VA8KZLdt4dT6+aDW814ffb7I1yxXG
X-Gm-Gg: ASbGncvf0p5d0NAO+YIXqdqMSeR8Vq2Wn6cWFzVe6lHxUW2KVTBbk7dKMAlPsiA0T2G
	awe12q6r+1CDRRgQdlIIhc7lHtzxyPqFioGF3V2OYjSr21aMo7+Rvm2+Pu0o5dMvxlNR9wAUKP9
	swI42687wjJ5YdGKDOnpp7cl45jIZg9pcZNakc0XXrHcconZBVi2ASuuRQs/EhM+u2NfPtXzWyj
	E/z3ut2oje3ZVYqugrbfh56zcAjOJ5nuVjpMO+dT71pCovGO4H80s2MfdFV60Om97eMdF8aRPXG
	CKrEycwkquvwHxopTIxfOS6kq1pxZKM+2Z1rxJOCQFLCUjWPv9/dqn3nZDPmE7xq6JkJSf7BGy1
	TAjdtFJBab3qE
X-Google-Smtp-Source: AGHT+IH4PaS/thx0o4a7besZweYaotUTeodWY36gLy1s0OvXS5nmZXjt97njg+FlwYzzfUDwC/lzFg==
X-Received: by 2002:a05:600c:468e:b0:439:9828:c44b with SMTP id 5b1f17b1804b1-43ab0f3ccddmr50953145e9.14.1740515660513;
        Tue, 25 Feb 2025 12:34:20 -0800 (PST)
Received: from orome (p200300e41f187700f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f18:7700:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ab156a10fsm37694025e9.37.2025.02.25.12.34.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 12:34:19 -0800 (PST)
Date: Tue, 25 Feb 2025 21:34:16 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Emil Renner Berthing <kernel@esmil.dk>, 
	Eric Dumazet <edumazet@google.com>, Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
	Inochi Amaoto <inochiama@gmail.com>, Jakub Kicinski <kuba@kernel.org>, 
	Jan Petrous <jan.petrous@oss.nxp.com>, Jon Hunter <jonathanh@nvidia.com>, 
	linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Minda Chen <minda.chen@starfivetech.com>, netdev@vger.kernel.org, 
	NXP S32 Linux Team <s32@nxp.com>, Paolo Abeni <pabeni@redhat.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH RFC net-next 2/7] net: stmmac: provide generic
 implementation for set_clk_tx_rate method
Message-ID: <qnxvliijwsx7p7xht5mklsbpywgsx5kchsv4gagjmiuphwgoqa@tr2gidpfktxp>
References: <Z7RrnyER5ewy0f3T@shell.armlinux.org.uk>
 <E1tkLYq-004RZ1-Kw@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ub7wq6jvawxv6zt3"
Content-Disposition: inline
In-Reply-To: <E1tkLYq-004RZ1-Kw@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_123422_538044_4C077679 
X-CRM114-Status: GOOD (  12.51  )
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


--ub7wq6jvawxv6zt3
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH RFC net-next 2/7] net: stmmac: provide generic
 implementation for set_clk_tx_rate method
MIME-Version: 1.0

On Tue, Feb 18, 2025 at 11:14:44AM +0000, Russell King (Oracle) wrote:
> Provide a generic implementation for the set_clk_tx_rate method
> introduced by the previous patch, which is capable of configuring the
> MAC transmit clock for 10M, 100M and 1000M speeds for at least MII,
> GMII, RGMII and RMII interface modes.
>=20
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  2 ++
>  .../net/ethernet/stmicro/stmmac/stmmac_main.c | 32 +++++++++++++++++++
>  2 files changed, 34 insertions(+)

Reviewed-by: Thierry Reding <treding@nvidia.com>

--ub7wq6jvawxv6zt3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAme+KUgACgkQ3SOs138+
s6G1TxAAi/NDxcQZKCI10VHrxMsf1JqDQf5d16ugQYy/sfomsGLksVt7u4qo01eJ
56Nwsp31cLXit8KO6fh7kBhXbkKaozzFKpgvAeTCQyHM7KOmEKrIfrs7oo1fyFdR
brnyzTSp5r301ED3wgPNAwg1lbSOFDX0JhSHF4lrQwkIu7TB7FC0gMlrNVuX4ll1
6Jsi4x3YBtz+7zJh5KWFXlYnaGy2LCaYeR1JJsO5RxHtoL1QriSwcn0v8Z4GuaKN
euINPJQL8ERPhMWzGY9KhUbUyR8CY3q87LBq1+cWzCZ4G5oO7zCKe1nuWuaUMZUR
6eSfVvvpoa1DYRU7hlkllxD8WFE6adoOv9MR+5KUpMxDUN+fpGB+9kFfInnHJeOH
QagK5nVlC+2WiXyfdATHT4Kef8m++YGZPuDeEtBgzHnOZ4IK+zvlsyf69cONycCU
7oOrEmojJxKMK0A3o4/kFNccQNaPB3ZVdoRXJkZvdBjTuRZ2uvpKvYpoRb4bhAmE
CF0avGa67oZSPuTTSizHZinbOmwpUsl6RhBS6rnqsWBohLzE0gGLAtWHs7lkyI4+
wyEduelKoxYTYtcniJXK9RPPT59d5AajwDvEoA3uu3PLLfSY6FKP3Yg1eELMZS4u
0XC+px/bSRP76lDB7td0YPQFcgCAmpRW4bJgB1oK8/OGDNh1V1Q=
=85N8
-----END PGP SIGNATURE-----

--ub7wq6jvawxv6zt3--

