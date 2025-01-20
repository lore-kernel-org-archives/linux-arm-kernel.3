Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CF23C02181
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jan 2025 15:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S+pJffbifsvMAzRQtBsX5gh9buDbEATG1BAUYCdsR04=; b=Gf8ZluIaCY0JxIhL/qI1CjL2JR
	ch6OnNkREvDiIBrMFwrLPTT7Q/OTkbUNq0MZEiE0ZiCQ6Rm9TOB4V+ifYEm5xGtqsxNigFa1uUhKj
	PaecQ/H4Lid1ZOrSaiLVU9anBD6DnYtj51PHIVSE5NDspqfg4Rz5NOMSH+PobqefnfNSn49aWO6eg
	kjb4VKbXyJNtbyzWxQ5ZPYnXfdpQzzMKwkZgLtgsoTScFMFJVKGT1USYjSdkCEwgxvln/acIkXh1z
	kvkgxOnRU6xQwEkiViwhg176KIno4fwbvB3s2YbTTZyAwClECR45cjzW8G+TJ21/cNnOFeJytvepp
	0HQd0x+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZtGr-00000005qqM-1RJ1;
	Mon, 20 Jan 2025 15:00:57 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZtFY-00000005qkc-2kTV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jan 2025 14:59:38 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43634b570c1so32812885e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jan 2025 06:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1737385174; x=1737989974; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=S+pJffbifsvMAzRQtBsX5gh9buDbEATG1BAUYCdsR04=;
        b=aLp0NtrCUZBnghF8PzDlVq/W7AgZW0ATOiSDFmtGrsWZ7ccMSim86+ywIbeY4ejgxG
         o/5JUwc2LM6lqPfFw4mebPr+Tpm13YifBhrmvhE8FcgSOOfbss3uKXJ8Wju+wqOwTnTV
         lVN7wEc4Chc/FHz5zh+SOGhaRu4J4LlO5bXXLrYApzrxTZ655zboQoDG96dzdgkVkA3W
         6GDCsbCv4cZNkER045LJTh+vWBZ6huUR8PyKGZG8yWnLoGfTsn4vPZOD5kdXC6mzldYg
         hbwezMAAIW7ZNbMoh123+paYSOucYJ1SjBbTtl58AOW7diucLrcil3/LHE4t4FuMP4FS
         9C9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737385174; x=1737989974;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S+pJffbifsvMAzRQtBsX5gh9buDbEATG1BAUYCdsR04=;
        b=Yr4vOfewsBru280BlC+hBHlLJE/x5BBHKKy+gJRQVY060G2FPoTubGOnyC0kJEn90J
         7lY7DueN9hcisTyrDAEr1u4RxNNycNFxMTzOfC57osI1aJhPRrey99li5H97+Uck6VhU
         A7TDQmvnNA4CGQFqZwFDhXwKXcXcpYmP+fGFa6RN3mNsKF1AY0GJ6bsXanrKP6bRPAr7
         MV/WwiN5TSp6HnDU3BPlvm/gmQLY5HgDn3ny7Zu/2+uHs2BLKfZZumidwDkyATOhh3TN
         MoojqadBTFRPN5Xf/h9Lssk2XpMcRgRdcwQ5tBtGmZi/aZZDZspG7K3d1vREQKnYJoI7
         7IQA==
X-Forwarded-Encrypted: i=1; AJvYcCUwRnXpfllZdYC8iB3SWBnnlM3eMDuj2qh6fnXJuyi+llYSX3nnkwyWOA+iNu5AxbHTcYUKF0Vgz9MMwJLDVYAv@lists.infradead.org
X-Gm-Message-State: AOJu0YxSz2eUEf8zqor+388WvCLu+CQySkhPSKBG6ksAYUg1vaflxYJW
	QY8jwWDw7tzUY7zqnd9KdLfQfxRyTHSCkaaq7HIXmM2FXBDpLAyym11E8PS7bG0=
X-Gm-Gg: ASbGncvsKaUpLvqPJ2fF9SQYp7y1clFPh5G5uryLBs32FUl0USn+azv4NeKZq+5fRcJ
	+lOUFOprLTQIWgygg77ytymma1//dvMwczgz9KQA2MYbxqz1A5F5KIgv4lKwPUFS2ELXmrE9Wry
	CaGcUnZBBtXBavxMmLyUjNVc2a83RQ9NLhdPDmyN+TvP+Jq2+YSTMIde4xyegfLTEozpkBo8tyP
	rA9RbfT+atyY7WnIQmIxNPRLQUSUUeg1X0nyHQiOSFdWeVacmrBnQZFNix5/xFMSwbU465zD+Kx
	p8s8n6z5nps1LR1Mka+gxnj1+kAb7shriuhv
X-Google-Smtp-Source: AGHT+IEr94dZ4ySjzw372E3rw2zQbIsEkno+z0zLtmEBFIbcwH0Zt3FOYHkNahPtxA8LJH9IMKXDlg==
X-Received: by 2002:a05:6000:4008:b0:385:f9db:3c4c with SMTP id ffacd0b85a97d-38bf5654f8cmr11521354f8f.9.1737385174359;
        Mon, 20 Jan 2025 06:59:34 -0800 (PST)
Received: from localhost (p200300f65f0afb0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f0a:fb04::1b9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf3221bf0sm10569472f8f.28.2025.01.20.06.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 06:59:33 -0800 (PST)
Date: Mon, 20 Jan 2025 15:59:32 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: bcm-kernel-feedback-list@broadcom.com, andi.shyti@kernel.org, 
	wsa+renesas@sang-engineering.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] i2c: iproc: Remove redundant error checks for
 bcm_iproc_i2c_init
Message-ID: <ikks6sk7bi5c4xkr63kcpgokqovbcp4rpcrcdjx76ofdo3jgum@jjrv5fed5kri>
References: <20250120090334.1705-1-vulab@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aomczayvdathuiyp"
Content-Disposition: inline
In-Reply-To: <20250120090334.1705-1-vulab@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_065936_699251_F6F93539 
X-CRM114-Status: GOOD (  21.10  )
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


--aomczayvdathuiyp
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] i2c: iproc: Remove redundant error checks for
 bcm_iproc_i2c_init
MIME-Version: 1.0

On Mon, Jan 20, 2025 at 05:03:34PM +0800, Wentao Liang wrote:
> The bcm_iproc_i2c_init() always returns 0. As a result, there
> is no need to check its return value or handle errors.
>=20
> This change removes the redundant error handling code after
> calls to bcm_iproc_i2c_init() in both the bcm_iproc_i2c_probe()
> and bcm_iproc_i2c_resume().
>=20
> Fixes: e6e5dd3566e0 ("i2c: iproc: Add Broadcom iProc I2C Driver")
> Fixes: 0ee04e91eacd ("i2c: iproc: Add suspend/resume support")

I would drop the Fixes lines.

> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  drivers/i2c/busses/i2c-bcm-iproc.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-bcm-iproc.c b/drivers/i2c/busses/i2c-=
bcm-iproc.c
> index 15b632a146e1..c683715093d7 100644
> --- a/drivers/i2c/busses/i2c-bcm-iproc.c
> +++ b/drivers/i2c/busses/i2c-bcm-iproc.c
> @@ -1081,9 +1081,7 @@ static int bcm_iproc_i2c_probe(struct platform_devi=
ce *pdev)
>  		bcm_iproc_algo.unreg_slave =3D NULL;
>  	}
> =20
> -	ret =3D bcm_iproc_i2c_init(iproc_i2c);
> -	if (ret)
> -		return ret;
> +	bcm_iproc_i2c_init(iproc_i2c);

If you change the prototype to also "return" void, that looks good.

Best regards
Uwe

--aomczayvdathuiyp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmeOZMoACgkQj4D7WH0S
/k6FOwf/R4270lXLYLFGFUpC3+b0T6bFYvKlCfJVUhR9qrIgeVBCTWWjAURbUfLv
+ycAb81QcQ6cUPv61Aa4ZpqV/yuQR8SLCncES4Hwf48Bq/I6v2ODcFKn8tvTwSYe
7s6+0ntiLgIMnZ5ZMkQ55+6KDGfAVVI4/f019zkd8QpVe2Yxc23hyub1yo4HamcZ
8s0JVPhHMsYvLomT0j5X7C4Nj8PBYiO68aFhpZMdgE/I9TgxBcreNmcJzJPJkNVS
wGhvZ2BXDmGcNYd1Ly0qXN1qb4r55tfrRlVfhtrkHjEXB8y/obgz0MNj5/E/kZ/6
XPnEfQxrgsdvlvey/jZloA7m7UrT0g==
=pH+a
-----END PGP SIGNATURE-----

--aomczayvdathuiyp--

