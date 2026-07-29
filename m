Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 739C8C53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 12:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HbiqMD+wNgf/uak20PPJVEhWm20pEqxlGI705rh+Bvc=; b=tN+qsUio9kQlsmxmNXq8lOqEJl
	2oKtwtT6yKQxVj0T1hbMwvYwaTsw4jRuH2vVmseXHjVRasVgQSUZXO5ipsUeIWBedv/JuRHBCJB5D
	v15ia3XKsxRyRhDdkyKihbJcIGS5fhit9RNclEDR2vI8n2/xjxNhUftJ8kledvs2bGJVgiIQgCwyf
	B97/UGvlseVY0ncBa+Sqic+Psvnu7/SV/VgV/d3vIiqf0YSHdtQbmcDsM0/wtRTb8Nr3nMiNyAtUQ
	PVem+ozjV6bosdkWJRo7ZMuzey1ldP74tDHFpH+iwFCqCWoqmTY8aG5gCjdnD13zDjvnz4kGH6Tkf
	iMJs/uiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp3YP-00000007vyG-04UT;
	Wed, 29 Jul 2026 12:38:33 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp3YM-00000007vxX-1uHM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 12:38:31 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-49558ce01afso6227485e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 05:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785328708; x=1785933508; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HbiqMD+wNgf/uak20PPJVEhWm20pEqxlGI705rh+Bvc=;
        b=EIbS1gMuiEvxzMHoCpa4Hj2r8x2SZafsYKNHuHsLHHiTE9K2Y7G5PL+X/z/JzQiAP4
         zeyGww8hrc65pMhDnGR8nTBfvMPojLJ1t9pjlY7liOcND/xndmBy6kGA9xESwfyRHTM7
         bgBLnGSWGbxza9R1MoBBfrju9c4bif8J6QVg/+KFBmghsbb+3an7VaKg2GkE2IMxZ2eZ
         UFECiE7M6BtCzQtbQSNuzUazXey6B2iSDU/9c+WMvsouTXd+i2WFWu7I9A9q+pcWmc2e
         00QOl9KizJDa6TOb9Ipw9Wr1gru8e2CQzwXtZCsFvaVTHxUg7y2Bbjhykoe0J7wfGfZ0
         Ut9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785328708; x=1785933508;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HbiqMD+wNgf/uak20PPJVEhWm20pEqxlGI705rh+Bvc=;
        b=ixHGZxks6/sPsqI9USX3Y2VWhxnGPKZ/u/A+EN9JWy63LBs8Vi7k1uhigacj+bvVE5
         aNM43QmclxK+NVYA6ssCinIaDz4cogc7Z/yREnZdaBxbqCbShlWIMlQT24EQVGPXKP7c
         g0WI7vi6fHDou9tMbW3bhSGeXJYoH74D0pwzTHD9SBqyXy8f7Ji6hSfy5/RUp6fztpZn
         orPG3w2U1hOpkfBVaKU8VDzqc0yxUqKn9qee6Byx6tbVU7jUSB3rsLk8fRD69lsAHaoJ
         3fxui1xXcglXbYc3k8vGYt7H5Gn2pXp1P9DsvEEkOGcL5uA97cX+HuRuPlPfQejC7DJI
         SuHA==
X-Forwarded-Encrypted: i=1; AHgh+RoqKmXFxPl9+yNSqyIn82c+2eGHBQEmDFoz4DoKvWVkvfZ+b0eogoPIBGUMXapVJyXDgGvhU6Wkbp3pI3MqRPr6@lists.infradead.org
X-Gm-Message-State: AOJu0YxjCxKdolNO45qh1XCl06IOZGNdxk3qGRm5Z0Al8yVtZAqCyEjL
	S0IjcRG/fGqdUybie6FHdgAEFw/JceReyiM+z9pPhNoEJVYaYHRk+AaEDZIZ3f87Ri0=
X-Gm-Gg: AR+sD10drX11PbWV9+AVR+AjatpUR5fBPEOzQNfXHByblcdwySvN51yonL8oUAE2ydC
	u2vUGydS4YdqsjNxaEItV7xifoL9gouzuU2gxTj36XygWUeIQ13spLC2wspaJ/HR0AaSeN1OAC6
	Cpoqs9C7TnN+4/KoDbXl3MxCQE8R4sGxkkh4imbcqTeOHmdB4pbqJETOfkDQ7C41nl5rwGqM0KW
	0X9FwB8hjQnYrLFh/FvEM4456Y0y/LcxbsqwskyQeN7gLH+Fs9CzrIlOqbZI9jywn8yNNjMZPtL
	x+FaLJB61jBPJqWOru9/dwj4cWYRPJ3hpP5HLOQfcU35OVYU4iWl9RaXX0xon9p2YWQ/yZmVpVX
	vTIVGs+soWofdoOyGXKrrlr/CJhZrlcIlGjI9cCfkPAcAuQhmcMTrbPIJxmxyOp0FSt8qmBlCMa
	vv8lEL1Yz9A4x2Yg0Vfy4t4DBe/J+8fKtLL4Urad1bkpGk1sIOz9WQJebYYqW5APcRq5/EM1evU
	xrcI/mIdLrpznvaHvfo12TnGGl7XNmxeIG7Gx3G60ucQQSTJmJxPFoxj0tHow==
X-Received: by 2002:a05:600c:470d:b0:496:c249:dd9b with SMTP id 5b1f17b1804b1-496c6431be1mr70896085e9.13.1785328708527;
        Wed, 29 Jul 2026 05:38:28 -0700 (PDT)
Received: from localhost (p200300f65f47db0401da7fd03a16a046.dip0.t-ipconnect.de. [2003:f6:5f47:db04:1da:7fd0:3a16:a046])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47fb6b2768fsm7708739f8f.37.2026.07.29.05.38.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 05:38:27 -0700 (PDT)
Date: Wed, 29 Jul 2026 14:38:26 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: "raghav.s" <raghav.s@samsung.com>
Cc: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com, 
	peter.griffin@linaro.org, alim.akhtar@samsung.com, mturquette@baylibre.com, 
	sboyd@kernel.org, bmasney@redhat.com, robh@kernel.org, conor+dt@kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, hajun.sung@samsung.com, 
	is.gandhi@samsung.com, ts.amit@samsung.com, pokala.reddy@samsung.com
Subject: Re: [PATCH 03/13] clk: samsung: exynos8855: add block top and peric
 clock support
Message-ID: <amnz5qkX_zeeVUjU@monoceros>
References: <20260728121111.2077860-1-raghav.s@samsung.com>
 <CGME20260728115251epcas5p19aaf5fc01e0f847bc2adcec67bebda3a@epcas5p1.samsung.com>
 <20260728121111.2077860-4-raghav.s@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="upw3ihnr2pijnj4s"
Content-Disposition: inline
In-Reply-To: <20260728121111.2077860-4-raghav.s@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_053830_511415_CB585BFF 
X-CRM114-Status: UNSURE (   9.13  )
X-CRM114-Notice: Please train this message.
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


--upw3ihnr2pijnj4s
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 03/13] clk: samsung: exynos8855: add block top and peric
 clock support
MIME-Version: 1.0

Hello,

On Tue, Jul 28, 2026 at 05:41:01PM +0530, raghav.s wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

<linux/platform_device.h> already makes sure that of_device_id
is available and <linux/mod_devicetable.h> will go away soon.

So please don't #include the latter.

Best regards
Uwe

--upw3ihnr2pijnj4s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpp9D8ACgkQj4D7WH0S
/k5ORAf/Wc6gzSRyNn1+1FIXBR6MXs+6IigrmrQ45vjkC74pGi8j6I1XeucCzzuf
1MhDeQy6g8vGye7y9b0BY3nTOx4Lp71Zbgl5eF30pEKPBi8A29Nz6y0yfEjFfbS7
Vprcpq2dl7yiq22DXzzRBG1/XXhrjG3Pq2NPlpq6GSDvCMlZi32b2L3soaUWPgKX
0sjawB7A1voa8wd+tXglN4kpRiLsPK9aRac8r8SPIhAu47zAJTlbfNWLR43a6vsa
VFQzmBIw5G+rfDjtBYaLwxNtvlan+97F/lQzGWG3JxTwuEg58TM7GmSdnJ92jWRP
Tyk6i+iZlV8rbsX9EW8g/KllvAmioA==
=kgeI
-----END PGP SIGNATURE-----

--upw3ihnr2pijnj4s--

