Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC00FC3ABB6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 08:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c8qy8x2VM4E33zP+Ul3MQgzUGob/DpDmmEpO6CEf26s=; b=YeXk12tfKmOaY/0Oy4lD/X2kDy
	s3M/ozWHCRIQZGOdrpK3VGnAFxHsjbXJS6pke1zJrsjZzietpVUxlmC/POXGAUHtc/o47PCxUkQf7
	ZnlBMzKCXdIEa+pAZK4CUao3QvFgwTQGNMaa/nnE4+5wp6pvgvHXFJfxXiMQmyOb5Y4xW35m0FX01
	XYWzjsHbcC9YY6WCXMZ+Vcd7JP9ODBh9z/ljclNC6u2AOj2S5NWH9jy3wa57zNJSEmX6xq9FxHSsT
	ujEdCUyI7CI5lXkncO1CMG4wSqXTZviW2k2EVQFaqsLDIidHGGv8itzuWLW5uPpZJlsM9MlRavsXB
	99hx93Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBqlv-00000006ivU-1etl;
	Mon, 05 May 2025 08:01:55 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBqil-00000006iPS-1LTv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 07:58:41 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5f4ca707e31so6353097a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 May 2025 00:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746431917; x=1747036717; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=c8qy8x2VM4E33zP+Ul3MQgzUGob/DpDmmEpO6CEf26s=;
        b=zQSJxRaz5L5T5JpvWe9VzZzX71rFC/Rl5SLbjq2eRx6ki8r4ulVnxn9YCbfgOrbx2I
         odAhzDIdR9fdVF4FUT1lfJCVETLxy03DFnVHMCUfe3og0/5Y+oxmkUR3U1286ui9iLAM
         NRxhd5RRkFpu1MskuDiFsKG27x8pnTqJGCzIcw8pn8x+aVquRXYpO8JTLrZhd5eoY4v2
         7m/dWVYJpFU4jk+mgalelO4ZmJ4iwzQU9+wN0sclMweV6w7Me0YVSadmgcYgoagiZwph
         7Xkvm/OPCNnk5fAUPYg3eSC/Stj2BTVzuYO6qnKvLmrN1gqF3PHf0qhzfuUU+iERfWYB
         HjKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746431917; x=1747036717;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c8qy8x2VM4E33zP+Ul3MQgzUGob/DpDmmEpO6CEf26s=;
        b=Rgg0W9uSefOmdIHeUKeG0CPNYMbUifmO44ARZ3EU+MPlCOBxUhAT+tdMTXYmzc1XhO
         5sanf8F4NYFz8brRpj1bRL00QSDjb+5CyjsaLS+raISINLR2fV32J7tklKSKHZ7IE0OS
         ckqkyud/urUIg+n4kMLseCrEtP/0FpVcsCEifSlfRPnwktJZKwqdEWg5M0HGV058YmGR
         +i+o3UBC62mXcTYoqJA7tEa9F7Htrju86f0KkP3LTy6nUQ+auguvjaS0TNAuwdkkzs5i
         i5f5NHjJ7x82lJ1/Z4Jdmf7ybyzsZDbkKGFvexzfcR9ulh5sXW47OFXwZ6LAHEyje85M
         EuZw==
X-Forwarded-Encrypted: i=1; AJvYcCXfXUA7UpxFWw5n5EvjHnauu8XbFQdHDVBZ9OwMLfMoPC1N0QiBGAtPQBCfpEhEQT2XdQF6ThUezWJevVqXKatq@lists.infradead.org
X-Gm-Message-State: AOJu0Ywu+YAaapd3q0AzC5TP1d+JBF00giPLZmYEls/837MvQEhyy2Ux
	yucxUaaEyM/ynupyj7tFbC50WCquiCoySe+ATB8H8dPy902voHw38uNaXjk9oWU=
X-Gm-Gg: ASbGnctc6NvUmiBxd05sx439M/i1/N8TgxlsDXLBgN3e2VEqkqmmGZ90dK7aYORZSBH
	sP6oWJY20wOXuZG0+l5g4A54eYGAmSzl9fiYUUmmxcq88dru+cZ3RxmJgX7Q0y5ocdd4UYFcd0L
	Ec8UaeDgfPqedapb1T357/bEUHwrF8gT5RmyFr+evSDbosZs5Tqmnv+A8DoiAWQ9DD0FpfX9dJw
	KpQDLeFW7Jp75TzXfqHuVPX/Cz25KZbyjoBSW+Az0Y9/kNa1Br5/5QbbVqMveLHJEX41f7vEZG/
	qde0UBDqJtB7XJD1GHo7GHarSyIFqrMt4KRFAfMPtfubDaccCfHKWk2+1KcTf1Yx6rflTDbTiVn
	mAS7RdwwCzQ==
X-Google-Smtp-Source: AGHT+IFZHl2dy4J+tovJB10LLReM42ovfZPhO257ZgiPrn9c3pUOWsbvfuKWtuAGkwm+2riUzR0qbw==
X-Received: by 2002:a05:6402:35c8:b0:5f8:e07c:7746 with SMTP id 4fb4d7f45d1cf-5fab04bfa83mr4760665a12.0.1746431917138;
        Mon, 05 May 2025 00:58:37 -0700 (PDT)
Received: from localhost (dynamic-176-003-040-035.176.3.pool.telefonica.de. [176.3.40.35])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5fa77b8fbadsm5148712a12.50.2025.05.05.00.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 00:58:36 -0700 (PDT)
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=8941660c9a8c947b1652ed122688064937432aafddb64f2deaaf508477a9;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Mon, 05 May 2025 09:58:23 +0200
Message-Id: <D9O2FWGG83V6.L6IQOPRGZL68@baylibre.com>
Cc: <linux-can@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <stable@vger.kernel.org>
Subject: Re: [PATCH 2/3] can: rockchip_canfd: m_can_class_unregister: fix
 order of unregistration calls
From: "Markus Schneider-Pargmann" <msp@baylibre.com>
To: "Marc Kleine-Budde" <mkl@pengutronix.de>, "Manivannan Sadhasivam"
 <manivannan.sadhasivam@linaro.org>, "Thomas Kopp"
 <thomas.kopp@microchip.com>, "Vincent Mailhol"
 <mailhol.vincent@wanadoo.fr>, <kernel@pengutronix.de>, "Heiko Stuebner"
 <heiko@sntech.de>, "Chandrasekar Ramakrishnan" <rcsekar@samsung.com>
X-Mailer: aerc 0.20.1
References: <20250502-can-rx-offload-del-v1-0-59a9b131589d@pengutronix.de>
 <20250502-can-rx-offload-del-v1-2-59a9b131589d@pengutronix.de>
In-Reply-To: <20250502-can-rx-offload-del-v1-2-59a9b131589d@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_005839_397215_F85C802E 
X-CRM114-Status: GOOD (  22.41  )
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

--8941660c9a8c947b1652ed122688064937432aafddb64f2deaaf508477a9
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri May 2, 2025 at 4:13 PM CEST, Marc Kleine-Budde wrote:
> If a driver is removed, the driver framework invokes the driver's
> remove callback. A CAN driver's remove function calls
> unregister_candev(), which calls net_device_ops::ndo_stop further down
> in the call stack for interfaces which are in the "up" state.
>
> The removal of the module causes the a warning, as
                                   ^^^
Minor typo here.

Otherwise this looks good to me.

Reviewed-by: Markus Schneider-Pargmann

> can_rx_offload_del() deletes the NAPI, while it is still active,
> because the interface is still up.
>
> To fix the warning, first unregister the network interface, which
> calls net_device_ops::ndo_stop, which disables the NAPI, and then call
> can_rx_offload_del().
>
> Fixes: ff60bfbaf67f ("can: rockchip_canfd: add driver for Rockchip CAN-FD=
 controller")
> Cc: stable@vger.kernel.org
> Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
> ---
>  drivers/net/can/rockchip/rockchip_canfd-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/can/rockchip/rockchip_canfd-core.c b/drivers/net=
/can/rockchip/rockchip_canfd-core.c
> index 7107a37da36c..c3fb3176ce42 100644
> --- a/drivers/net/can/rockchip/rockchip_canfd-core.c
> +++ b/drivers/net/can/rockchip/rockchip_canfd-core.c
> @@ -937,8 +937,8 @@ static void rkcanfd_remove(struct platform_device *pd=
ev)
>  	struct rkcanfd_priv *priv =3D platform_get_drvdata(pdev);
>  	struct net_device *ndev =3D priv->ndev;
> =20
> -	can_rx_offload_del(&priv->offload);
>  	rkcanfd_unregister(priv);
> +	can_rx_offload_del(&priv->offload);
>  	free_candev(ndev);
>  }
> =20


--8941660c9a8c947b1652ed122688064937432aafddb64f2deaaf508477a9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSJYVVm/x+5xmOiprOFwVZpkBVKUwUCaBhvoREcbXNwQGJheWxp
YnJlLmNvbQAKCRCFwVZpkBVKU4zTAP0Yer+WBSFojQ6DiWBCD/1wd9ENW9dsLm7J
ZLeShRvCOAEAgIm8MmcoLnCEO11f0Kg+X9mgAKtZb7OpE86RubTnags=
=jybR
-----END PGP SIGNATURE-----

--8941660c9a8c947b1652ed122688064937432aafddb64f2deaaf508477a9--

