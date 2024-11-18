Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E43DD591A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 17:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1tIib4eNH4Bj55ytCO2SrDsnedFwF9aGSQvLrHzbjSk=; b=E7un8quioIa1jCp5HTSIun0AYv
	pUXCMI/FGd0cQeEdvbhyqDozhY5Dujrz6tS+L/GQxg70FrtqhxZK9jGu8ANmb2EnJvbKV4LBo2o0S
	y7xVcaEmvFTzdEWGryEKRouxTEX4tLD4N8DDtrzy5X1wk+E1jMBREe7IU/8krlOezy3mgtTk0vmXQ
	jqjUq1vOKQjhKbz7rWnDpCa+jbwNrZJ+pHfdNEm81dlqHggmKB1T38l+f7K7ebts7VfeXZvLM/kSt
	tszTtBLZ94JNsOO7RUUNYbsNmidaihkG9WsVsnDGBUOdVGvcwNNjTtNlqssbz3Csg6DbOMnek2Z/D
	JY0Pwtog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tD5kZ-0000000AEvW-2zEk;
	Mon, 18 Nov 2024 17:41:23 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tD5jc-0000000AEo2-3clL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Nov 2024 17:40:27 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4315df7b43fso39343185e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Nov 2024 09:40:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1731951623; x=1732556423; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1tIib4eNH4Bj55ytCO2SrDsnedFwF9aGSQvLrHzbjSk=;
        b=PNGldatg9asndfeO44dlNRI1QYRxASrXMSSGwyl+tv4JNvlq+6JTfWCOtJS5oJ/l+j
         ZPnY4sXJQqTwmF2y0XGNWrioPl4Ru3BkidfE66OM0DLyVGI+MemnLZmDDUrLiFXdvD6H
         sSJAcEWqYnKdEP0cJTuFOdtjuJ+UKaMbEmXamq/AoJAG6WcLPaj3lRax3/bOOY3WFXPF
         m4N2GkwPhQLQdb2cQEsE3ceh6xz4fPAcc1wcDeZJPDbimTE0jb5PuZVWNuTxeG43LvAc
         lZBC4z/WxMLpJtAkq9xKbM4umdymBJV7ipRmX8p0f9I6ZMpxYY/z8VDsdRHD13Hh6pq+
         FiHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731951623; x=1732556423;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1tIib4eNH4Bj55ytCO2SrDsnedFwF9aGSQvLrHzbjSk=;
        b=Dap/EqrfLENxme36rVtFh7y7l/MA6LuhmH16XRVoyurFMCtZnTd4kuENyE1z1Z+zis
         2oTJme2OBL9SdpeXP4WoXslcCA3CuoBbJtvpg6XTyVBJykGFojNVA/QBSB2bnsAxM48n
         xv8AwW9Bh/XgDSyRX+SnRedikvdLMczT+M6heHyKF4Q4J9HZTGZdy01Xj2p0Xb8PIDoX
         hPwNwbPVTT2QDn/OhSFxiiMdam6oOwH7cMgLRMgVul5iNOutWrMKW/d+bIHGbjgj50YU
         okhQvsiLdz4DNi2vKB9H8YfMk5mJ2U/OcezwPzoSdfCspjl3GNN1YZAgByWclv6GxIn+
         TtVg==
X-Forwarded-Encrypted: i=1; AJvYcCUU7SiMpiBe37sN+l2XS7tQRDCe1OFSTbktUJsfJHzoOQvxCxrbgZOlaqRnVv+qMTWQtTH72P1Mg2tvUAyUQMmg@lists.infradead.org
X-Gm-Message-State: AOJu0YysYsb6ivAvLim6v7Soj2++HdNchEZzpPBrGt7LyLMxuTyUJuj8
	lpqiW1NyKdF1prBtcU9zuyQkwdVXiLlGgin1K2cLSG78Pf5Vm6TLomzRQYH+3bA=
X-Google-Smtp-Source: AGHT+IF3nj2yHydrx7Ks+n+zytE68ZdQxoMq1sSNeM0Nynyzk3P/uHdIYwyssSFKYkQ+6vZqXuvURA==
X-Received: by 2002:a05:600c:198c:b0:431:55bf:fe4 with SMTP id 5b1f17b1804b1-432df78a99emr105241745e9.24.1731951622735;
        Mon, 18 Nov 2024 09:40:22 -0800 (PST)
Received: from localhost (p509159f1.dip0.t-ipconnect.de. [80.145.89.241])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432da298760sm166249345e9.37.2024.11.18.09.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 09:40:22 -0800 (PST)
Date: Mon, 18 Nov 2024 18:40:21 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Lee Jones <lee@kernel.org>, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	upstream@airoha.com, benjamin.larsson@genexis.eu, linux-pwm@vger.kernel.org
Subject: Re: [PATCH v10] pwm: airoha: Add support for EN7581 SoC
Message-ID: <kpbylpee46nmxxvzxfbylscfafrlkpzjt37lkfdt4vtoq3qvfc@5v7khvwwohty>
References: <20241103-en7581-pinctrl-v10-1-1990fb6996a0@kernel.org>
 <673b47ae.df0a0220.2187ad.bc2a@mx.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5bt3c2qqssojeolk"
Content-Disposition: inline
In-Reply-To: <673b47ae.df0a0220.2187ad.bc2a@mx.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_094025_160727_AD54CDCF 
X-CRM114-Status: GOOD (  12.94  )
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


--5bt3c2qqssojeolk
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v10] pwm: airoha: Add support for EN7581 SoC
MIME-Version: 1.0

Hello,

On Mon, Nov 18, 2024 at 02:56:58PM +0100, Christian Marangi wrote:
> since you gave revision for v9, any news with this? Is everything good
> now? It's sad if this last piece doesn't get through after all this
> efforts with the previous series :(

I'm sorry. I still have your patch on my radar, my todo list is just too
long to give feedback on a short-term basis. See
https://patchwork.ozlabs.org/project/linux-pwm/list/ for parts of my
queue.

Best regards
Uwe

--5bt3c2qqssojeolk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmc7fAIACgkQj4D7WH0S
/k6GNAf/Uv0TP2XG1eM5gVUAzPsO8nIbVqSQu0qVstgU2m0w4fwe4Sf5ikqykVsD
jeYs+uIgK1r055ifeUSf32mcXOb5nW1GPob8stTVfViOL0diAuv4d88kPzGnDi/D
vn+BwCd2pOi6dGopB+ZqtajsRasx7NNFvTf8ZRcq5V0/kpElLAcLQLjAJZGigjbt
a9d1Y1lnBUk+GeCg1rLvNDo5MPkL1t0xcRZgxr6qp+VVGBuO2SsL2IpW/eZz9HU+
M+evGLlT8hwlrNoBgZQ5vGvfZtda51JmcHTiF9b28iZC3pOnws8QiXpmznPlVhDN
5Jp1+kkmy5YbonA6ZlI/SncX7LzzKw==
=eBCO
-----END PGP SIGNATURE-----

--5bt3c2qqssojeolk--

