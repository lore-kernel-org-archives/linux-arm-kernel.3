Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E6F4C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 21:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=km6GgyUtBYWlPDyGMWfcUJBELXq839o82rzSdqdT8ck=; b=GAEEv1Uxa9O+AzXygWwulhOsM7
	HGtppjbUIqpYu50CT0lv32kFaZhUbuPJyYOkkXlbJijO99dxerTHYjN1H62gFqN6FIR4mlc4hq/ZQ
	O8Mpi8s1/HoBrVJDscP/mdr7DlMkDunThvLjYaITa2mg5KJgy1DoLosuYqjdo9VAdUz8z/9J4ya+v
	xnmLB7QiNmHyQ5RSqgauPsUNtHDzBfScTJi60jAG75e858J7wF/TeIDNdnadRdD8Vsi8elUcVcL9j
	E56Pyz1n7XATBY6MRiJwmUNxWneX2c1J6DHGZzx8KM0MB5pXsSnmWX8zn1Ww22WqeKnrz4B7slUp7
	Q1TAyoOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn2PF-00000001XDN-0wIV;
	Tue, 25 Feb 2025 21:23:57 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn1mb-00000001Q9A-1nuL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 20:44:02 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4394036c0efso38777605e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 12:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740516240; x=1741121040; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=km6GgyUtBYWlPDyGMWfcUJBELXq839o82rzSdqdT8ck=;
        b=k1eiAM+rtHvaD0MOvR5LuW+ZPDkBhbDxWsFStkLLsaILFTb8zZv3Qr3WPDzrRb3pZc
         VpFpAOwtGYckHoFIIW23uttrmXGEZte8lah433won3zvbG26ikmv4oOBiztw5+hhzYv+
         ww8IfVtoY7yulECi97mKh2pwgayD9Pr/Z17XKhFrpIOLfeZA6snuTjeYpyL6VjcnSzDC
         9r+a4w0c0jWSrWsLi5/1vUlEfVa2qQHq4NLT5SAeZn0JwsXrV9XVUtjssYfqYmUb5UEe
         q1GmHkja0T6P1qvZJGHk+Z0d+q2gi7JcN26RsHqFv1xie/gHZF6w5T51igJLesEAtPfP
         H0Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740516240; x=1741121040;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=km6GgyUtBYWlPDyGMWfcUJBELXq839o82rzSdqdT8ck=;
        b=UuW1W8H0IoKKQTEya9X9EIYy19scXXyw3hMWMSZGfu8pjvI49kLEdGi87yVooNlOqV
         GHkMEZtBRaiPTrDpsvc3rsGb7Tw0iqwdvSvCqjZe901R5dNh5ziWqeuu/G1AwZdQ2EsP
         SUVrbMQS5ty9b5XHN3t+qY3YQ63+RupY7pqKrunYp3xSEfzMf+18KzAJjaR7V4vB3ca0
         diaxWr9zB2fBiCcOVrSYemZXxz42iWhgyITgpB8xyChanf5T/TanKdrFjUTWvQIMu9Lg
         pxPbqfBIqguFgDz9aZ3naDGZMaAyCVq7xcKIJJXTjiXwKL4HZyHe4RaXkcwC9xnGkQz5
         nFBg==
X-Forwarded-Encrypted: i=1; AJvYcCXEOEGqegetQygiO21XU4kY9Fk0Rfczccgb/IZ+khc9Fycq1+1nJbaSRetTp5K5ob//fNcjCbjY5I+unC7cC/P4@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6Pi03KyFvRNjMxvX+VsT/WTTQAZQWnHRrKal3DwYZmQwEZk3u
	5MfktbAP90rkAb2yNByP1UfcSupXi0uKuyop5cJGfSY9dKu4mlee
X-Gm-Gg: ASbGnctTaVnaSp9jKEstGUrnlMFh974LZGipaZ9XB/qlujYpXi1i00SGTqka7XUohdz
	J7z6PMYFw4JxDx38+8wx1HCsZX1MMWocdT/aWXG54uoYFrZMV8maiKClO12qCpqKBGXYDMEE94B
	RTDuhxokSf848IG85LJ6yU9/0woq1pIdZhJO9S1B2AnNtBEv1WtBR13OGSZnB5TktaIZNqWcm6Y
	LeWNmvFnSeJ31wYyA4BhAJ1eKGJXPRI+r6gK39F5yChHxhhnqTSqk23ApbjJcZexpvngrZmmm/m
	qSx0XAvcgP6zFUE1sOct2adQxrwHh+FAB2jONdUY66TKPSV+F+ZtSq5Qzo+WPVNi3LU/Ncx7emI
	QJ1hy/cxtKlWS
X-Google-Smtp-Source: AGHT+IFn60vNyjvN8suXWrn3N7MNMCvoYB7tyLvf0VIb/vaa4GNGBrrZf3vgpHtm6zuKbQT61XRnPw==
X-Received: by 2002:a5d:64e9:0:b0:38b:f4dc:4483 with SMTP id ffacd0b85a97d-390d4f421e7mr518360f8f.29.1740516239496;
        Tue, 25 Feb 2025 12:43:59 -0800 (PST)
Received: from orome (p200300e41f187700f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f18:7700:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390cd86ce49sm3473823f8f.36.2025.02.25.12.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 12:43:58 -0800 (PST)
Date: Tue, 25 Feb 2025 21:43:56 +0100
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
Subject: Re: [PATCH RFC net-next 5/7] net: stmmac: s32: use generic
 stmmac_set_clk_tx_rate()
Message-ID: <x56yik7opvpr3o5vjlxoxzxdicrz2pimsh4lkpxol7c64r6irs@t7dfqy7ybn2a>
References: <Z7RrnyER5ewy0f3T@shell.armlinux.org.uk>
 <E1tkLZ6-004RZO-0H@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ofk7odbwikmdng6s"
Content-Disposition: inline
In-Reply-To: <E1tkLZ6-004RZO-0H@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_124401_474279_57300A2C 
X-CRM114-Status: GOOD (  14.03  )
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


--ofk7odbwikmdng6s
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH RFC net-next 5/7] net: stmmac: s32: use generic
 stmmac_set_clk_tx_rate()
MIME-Version: 1.0

On Tue, Feb 18, 2025 at 11:15:00AM +0000, Russell King (Oracle) wrote:
> Use the generic stmmac_set_clk_tx_rate() to configure the MAC transmit
> clock.
>=20
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

I wonder if the clk_set_rate() call for gmac->tx_clk could also be
removed from s32_gmac_init(). Comparing to the other drivers that
doesn't seem to be relevant since ->set_clk_tx_rate() will be called
anyway when the interface is brought up.

But it might be more difficult because somebody would actually have to
go and test this, whereas this patch here is the equivalent of the
previous code, so:

Reviewed-by: Thierry Reding <treding@nvidia.com>

--ofk7odbwikmdng6s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAme+K4wACgkQ3SOs138+
s6G4pQ/9HAe8mzGeYLufQVT2wUZVpeDW6XeOv6EOFIvwsgTf+44yqDw3xiulERM5
tTs3b8w6d4j3xO1PLdXoIlx3vANG5xRtGEcxXY3sB8HjmuSGWWig1zuSTAOJegbs
we7h3FfZwYlMaSJAfvQNZsX/rDN/auA0R8opcByCxOqFAqRwwJSEH+avYvvVgKEZ
Mmzov1YSzCyzB0pEEsAkdaB07XMdwl6Ee+ShlKaXzk88WS8KhxZKhYHWNFaAmqLo
1jyGoa08Vz/Y1WMhLPLCMPrjmWjrMcVjhjCNp9xmCffiJHDAec+eRfV41Cwmp6HC
wjh85xTUS/4hGh+Md5EWO8bxv9aTGHOkGwI4qVxl6xZVFJRkwZkAgrO4teY2RXy1
/flh/cJcM9x88N9LAemunvF+RuPBv5mHV8VWgnJW2a91p7hWKZWV2gxcbzEL4L8p
oKBcQDleR7I9gCunuLnQRiQlwSyw4oKX/96IQ86Dbr8th4/4pKsWtxfDPjHtqzo0
XzbRtT+vlLIFlTprG9nh5PLO/Lxs9OzJ0kiqhJh24nAwMNxbXS/msQ+m8PRWT3C/
/okF5ojWT+0ZijDIGhWi5uwBNWxiwav1tElTfJGEHIyz2qOiFZyFhUH7oi5E9iB4
rin6SAkxYbIF5XDT+zuqAifn/g0BNDr2moVdUvgImYtAMQUCLmo=
=c/GH
-----END PGP SIGNATURE-----

--ofk7odbwikmdng6s--

