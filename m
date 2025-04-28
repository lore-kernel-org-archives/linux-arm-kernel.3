Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8138C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 16:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XV4yjXWpsfgvi2gIF5WipGrZ8nMjBf4R4GhF3QGKVo4=; b=uey0zfJOskThikgXGH+ePKyMlj
	KBOTnn+CJJeCE0/W4FLBsL6zl6Pm2mtl09jDaLRb82QbH71i4pv06nQPjLT95dTGMbBmYgn0r2DMl
	u6RSwj4vIF45Hcv8OeAjBBvB2UM06qo4mhH10LFQhE9v/7p6+XCa7S4gVCrBDsqGa3R98UBgPN61E
	N7hY/5fSSnWt/EXzpRGNmKOvpzgd+GSSl38otBSmyUdEqezstzeyfkeTchjUn4ZQYFGpjY36HAOYj
	YijilghuEDin3iWIXEbfrGZBSw+PybPczmOKhOn5bO7s26BkUoL8bQoqbmzj/USuPgbTq2625QwUH
	N440VIIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9ROX-00000006wTp-1xs4;
	Mon, 28 Apr 2025 16:31:49 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9RJA-00000006vU5-2ITR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 16:26:18 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso31768185e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 09:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745857575; x=1746462375; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XV4yjXWpsfgvi2gIF5WipGrZ8nMjBf4R4GhF3QGKVo4=;
        b=fuaCuTozgB7TVpMX+PiP+RXvLHM2FiZaymVJj40U/ZOSBTciB+0oKgavSaUE7zoCBU
         HtLXWZBKXILJhO9XdV9u1raHO2tcQO2Ovyqro8cCDBf9u587uTxPB/57p09z5MDXCdDx
         EsTIrWnK/5nh+DH64ULA3qpNG1FQLESCSNohgSYR1aXn5h/16/8n22dAYWpai5YjHfKI
         /6ueXyCj39q6MDKVocC/J5FMR25ZnvNVx4V4DeSI5rqOCfK8lYvwwdnXFONVcTx2o6uW
         9JlbibCW+4jerhZxBBpbrUxUjTDrVMdhGQKghMxysVSHf41DgdexJSQtWtgxnPv8EOsX
         ceyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745857575; x=1746462375;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XV4yjXWpsfgvi2gIF5WipGrZ8nMjBf4R4GhF3QGKVo4=;
        b=F8IosVFw7ORGYiNWVebSnx6ML15caHgxgG0jyLPYuLfFrmHX4Gua1DndPD+sr610WB
         WwHSxzoyfasiyxCj0HFvqD+5AsNfi5O2s5uHDRmRjRMZHyGef3OeinGidesVf8683MX+
         G4hWsJ6MhYd6QPpiFzmzPJ530lK+t3QVDpb3eD36bf+NCXhyktNpBKdHHv6juKgBep02
         +kZhOcDleQAtXDQEcGuKaG6dPDsu2TaS2dS0962MiCTn90zMUlI2W27+bV0ptwXuA1+j
         NWroSQwlWHAwK17TRBXSyKeN2Bc6bDiuMwnxxGiAVUrugmIS7YtaLma01Vbn38ZEsEEo
         gA+A==
X-Forwarded-Encrypted: i=1; AJvYcCUOsr75OXZ8Pn+m8Sv3KJtPPxgt7v1iW75IB47DxiBcij6xPdLhiUSOsV82cx5SAesu3Gr9woU3NzcUC5rNXai5@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1t7ZzuoXFF07HESMeZBvKhNCpN4ZFUCZc0oNpIAHFvXT0j26c
	ApMLB6L2gpcbaQqIpHqpoxb3nHoGepgXR8mTh0Ri5BfhY7vW2SksNlHICZO6xJU=
X-Gm-Gg: ASbGncuFU4/6QKf4mR25R5lEbuuy7+oHKMIk9gTky+m0OpSw0SClee27DSyx0MD1n2T
	y1bdIiiAodqpl7NxG7T7weJRUHGaC/+Q59C+EYuu8elb7F+obuZF5bGsDiNjETQAGkde5qJlSYO
	cqAgmW4vl+7gOu05J0QKsZmGm1geTsC016KVuCjnUnvTocdl9OB/PgxYL7J8lsLj/4PoOo7h5pw
	QRLUT5yy17XCHpqt0gg4dECyBdkBfJBLoTdrDq3mvHGZdKMZOcl9nZDbUkusaZAZYAAOIA0Qlp/
	zQh41nh88dAbARsnH50xrmZTglnCPHohA9o04tM57HeQSy0LH5k5J5FV4A9hQzmrPZLVW+KJk8b
	beeievdg=
X-Google-Smtp-Source: AGHT+IEP8H3aiAFda5s5dKpOrFeQRMJEIdcZabiUZJB78eZVPzFrS+hWt+HhXg2/aWcVvb4/lTgz0g==
X-Received: by 2002:a05:600c:55c7:b0:43b:4829:8067 with SMTP id 5b1f17b1804b1-4409c4615e0mr119997455e9.6.1745857574733;
        Mon, 28 Apr 2025 09:26:14 -0700 (PDT)
Received: from localhost (p200300f65f00780800000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f00:7808::1b9])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-440a5310a8fsm131672255e9.22.2025.04.28.09.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 09:26:14 -0700 (PDT)
Date: Mon, 28 Apr 2025 18:26:12 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Eddie Huang <eddie.huang@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: mt6359: Add mt6357 support
Message-ID: <darxi3ojg6c6uhzyzb3224sb4lmpqcwx72pvoaam5qn5b6v5du@36zqss6i46ig>
References: <20250428-rtc-mt6357-v1-1-31f673b0a723@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xvyefmwg7jcr7kfx"
Content-Disposition: inline
In-Reply-To: <20250428-rtc-mt6357-v1-1-31f673b0a723@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_092616_853040_C898F386 
X-CRM114-Status: GOOD (  12.92  )
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


--xvyefmwg7jcr7kfx
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] rtc: mt6359: Add mt6357 support
MIME-Version: 1.0

On Mon, Apr 28, 2025 at 04:29:55PM +0200, Alexandre Mergnat wrote:
> The MT6357 PMIC contains the same RTC as MT6358 which allows to add
> support for it trivially by just complementing the list of compatibles.
>=20
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>
Tested-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

Thanks a lot!

Uwe

--xvyefmwg7jcr7kfx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmgPrCIACgkQj4D7WH0S
/k5uzggAkQji5a5MAOBNxwmFwsge9xxOpHA0xqM5HwRUZBCYeca34VWPG6n6U0GA
bVXWEN1KWJBrgdsv/505roy1O5c3HcRRroWFLF4euSrMAl7kKfPvKbCb92TMLNwt
KO/BFcz7rRZ60I3Re6vmSTR+tW8915S5vXOV6PNh/YgvNMCnGCtIH2lCzdE8dc49
F2tW/utynBHpBiUnDE0UgFr18FyM3PQtpSCJWVpUaGwp54yVfozTDv19k4p9e4sP
XdJBBDNhi8yhT/855addjBUKSFWAW7cxCx64lq7Agwx7yZMcaaoEgdEOq75R+8Lg
SZ4wlhsxQ3BXN7P43l5g6dm94TzLZA==
=TwLE
-----END PGP SIGNATURE-----

--xvyefmwg7jcr7kfx--

