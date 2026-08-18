Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB76DC5DF70
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 08:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q+Aet+yk5wErYuGPUVzhzsTqySNhCGJLGb9Ej6EWM+c=; b=ecUIyYmM0Z3241unBuWuZsCsDX
	j+0f+4azmGNdwtB95B4INhJJAsAPBJyVJn/80BzGstGHLUdFmHMcetmWLM3kAsKpuC/OSeqnZbHm1
	0pJJo19XSFDBN3LZRGIccyhHQBWpnjsBHePPkgo3qDRrbkMkAxuKbkGvwaKY4sEqXE1S7caX6idF1
	vvz63esjUUVO44A3Y5eBzWr7ECfbMR4L0vKda8V0GouyZ7m3pt/nvDri03Z/WCfmxd/mHxqyq/xqL
	pvBLc/Yez36qzSgJX9HtaOFglnmM2uVKFzHg4/Tyapn0i9NEmthHRUgo9F7kgHudHaoMQu72vYtDV
	dP7PLmEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwFf8-00000007Ykb-0MsV;
	Tue, 18 Aug 2026 08:59:14 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwFf5-00000007Yjr-11rN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 08:59:13 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-496bb7cdf51so54075535e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Aug 2026 01:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1787043549; x=1787648349; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q+Aet+yk5wErYuGPUVzhzsTqySNhCGJLGb9Ej6EWM+c=;
        b=b5OyF6axHLoLj1IdWBfFp+3QbSbvEJWkEDZA/DCbi9BEHslrhBQgTDjyIS46ybI5qN
         Jp0LN9zdc8bcxFTpE9q71f0hYnlwY0ScymjQXnVahx/qL6izNjDUcTMQn2FEmDxw0Syt
         iWxbh5ue4w6+3t/OJ49Wr7I8miJcCxNC4Du08zZUo6bdcZiecstrrJY0Z3OHvVyk3MXf
         Wil6AMoUKJXPZ7jOQ8LZv3FqbmDeAXbvzFR1ZjF+ed8IELQhcstqGOJ4GTBWCndzEDDO
         IkxZENT1Vk3BaGQiEL73mTNUgqgzcXc2DlzUwbCObye7nuLyIsKAjQ9psj4i/m5n2477
         ruKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787043549; x=1787648349;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q+Aet+yk5wErYuGPUVzhzsTqySNhCGJLGb9Ej6EWM+c=;
        b=XyYt/oDygitE8mULEQFbf1SKp/iisSq9NXuYbjQB/YjNjY+9PHmGlW0PeecNKLAgU9
         eSKB3BV7+WnWqgrBkInTTCq/SNiDuIz/oCj0y62YM1oZAccqNH9FgGcPPSK9si/GNwct
         hOito2rgE/07eKyZAhdE115B/7AI5PMzeJn4aPinLojz9njIN6JcV6coHzo9DBhFgxUJ
         omZm2eKw4Hw/NbylyKLE6vlGqbyEaEjBnX4M/VkBHBNQLVKb0dnR+fxQrsw+c0Iny0oD
         BtsfSjrdMRILl+oXKVrGSy/JJ2DHeGLshax5laHoP2CY1Uc3Ec2goCc2n5SDYG8an9ZC
         49cQ==
X-Forwarded-Encrypted: i=1; AHgh+RrU1A8I1RpY7/+wSEZQF9FSrXmJ3tAUII9vD0UNj21VZvoph0ubdSV+wySzgqREgwB/wj0d3l63lTTa3FRlD+mL@lists.infradead.org
X-Gm-Message-State: AOJu0YxJTEQ8sELG37jNrAZ2cQooXHJRrdqQXUqu9qT5Szvz+2G6iT5a
	i9+zXvHbGSDFZLanJPyLeI3sL/LHsCIRiIINTdhlAdOUNLUD+HeLxzLXpJWt7hGI114=
X-Gm-Gg: AR+sD10Z/sljdyi9y5I35t90YaCSrPyuBN3+/ToXs+UBwVOHZaXSzMuwab1NoRAPyOp
	f+Vq4UGw2jlO2E6nz0I4Eaj46cELkqv/KZ/aPth/uE9fyjWp3WUiLafwTVNP/s8G/ozPnhW4P5e
	D3VeojcCWJIQN3p15Z8FemBOZ4cYSlbYhwtTUf1shpxBWQimkCoao3zMd7zUQUYxQE7AEcTg1wx
	vFz7sahtPYHUwbTPTAije7HS0PPel5Oh+B7HcqgweeC9FKdlCtEaH+q1XRzJPn/Sxyg8e3ghzBe
	Mn5hXQsMUQ7pjGUKcwazup8iDAQpl+KWay/freC4DvKZIZg7LUBpwaIFe+co49VQJHRtzAeEPao
	w5O8KjmYmXZI/MiBI24yupgIz23//qR+4z6lxmwBi9BKTmawxXTSW0KM1aXHNxi7UH0GQSWliZB
	5rityGzwZ+DJBN6WSXij4DodkDNov8oO3KJ1ZS+za2KpXafVoMRDFUb3rY38wXqFBGk16g0Tz8F
	M3XVNiMIqOkUxHSmGNoTtZZPhDHUyOk0/872h5MQ6P+ifKkhTrt
X-Received: by 2002:a05:600c:848e:b0:499:8156:cd3f with SMTP id 5b1f17b1804b1-4999fb3f78bmr112284285e9.8.1787043548729;
        Tue, 18 Aug 2026 01:59:08 -0700 (PDT)
Received: from localhost (p200300f65f01710416869d85a644e839.dip0.t-ipconnect.de. [2003:f6:5f01:7104:1686:9d85:a644:e839])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49987b278fbsm215087975e9.2.2026.08.18.01.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 01:59:07 -0700 (PDT)
Date: Tue, 18 Aug 2026 10:59:06 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jiaxing Hu <gahing@gahingwoo.com>
Cc: tomeu@tomeuvizoso.net, heiko@sntech.de, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, joro@8bytes.org, will@kernel.org, 
	robin.murphy@arm.com, ulfh@kernel.org, p.zabel@pengutronix.de, ogabbay@kernel.org, 
	zhangqing@rock-chips.com, royalnet026@gmail.com, chaoyi.chen@rock-chips.com, 
	diederik@cknow-tech.com, alchark@flipper.net, dri-devel@lists.freedesktop.org, 
	linux-rockchip@lists.infradead.org, iommu@lists.linux.dev, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 10/12] accel/rocket: add RK3576 NPU (RKNN) support
Message-ID: <aoQdns-GHS3fg5BJ@monoceros>
References: <20260817113603.1436067-1-gahing@gahingwoo.com>
 <20260817113603.1436067-11-gahing@gahingwoo.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uvayaecgmyelikx3"
Content-Disposition: inline
In-Reply-To: <20260817113603.1436067-11-gahing@gahingwoo.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_015911_304967_1AC12848 
X-CRM114-Status: GOOD (  13.00  )
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


--uvayaecgmyelikx3
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v8 10/12] accel/rocket: add RK3576 NPU (RKNN) support
MIME-Version: 1.0

Hello,

On Mon, Aug 17, 2026 at 11:36:01PM +1200, Jiaxing Hu wrote:
> diff --git a/drivers/accel/rocket/rocket_drv.h b/drivers/accel/rocket/roc=
ket_drv.h
> index 2c673bb99..0096c4ab1 100644
> --- a/drivers/accel/rocket/rocket_drv.h
> +++ b/drivers/accel/rocket/rocket_drv.h
> @@ -6,10 +6,12 @@
> =20
>  #include <drm/drm_mm.h>
>  #include <drm/gpu_scheduler.h>
> +#include <linux/mod_devicetable.h>

Please don't use <linux/mod_devicetable.h> but <linux/device-id/of.h>.

The former is a mixture of many subsystem specifics and thus a
dependency-hog.

Best regards
Uwe

--uvayaecgmyelikx3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqEHtYACgkQj4D7WH0S
/k4U9gf/aUhrYYFY54POvnsxnelsCZk9pbdIP6pqEh4NpwVQM+NfUIh1SYqcLXIf
NqdrFegte49P8wGlByYbp2BP8P+Vh/KdPn+VPTi15o5ivhF6/lS1s3Smp5hwDS1N
lDMzlLblQBoye2bS2VSkmaaJyzaZEARrJK3GOBpmc8PXGkMOFRFgF+ZgXiyEC91u
E3rOSqRX153lKJWaHX3SH4yO0RUjN22sW6htFUwQZTm4iLRG6IzaP2+BM2cpWnCe
I4RwXW6GaPue9NnC/Bf/659cN68fjK7fUU5JJn80cMtfO47GjXmA3ceX28vIB/rm
WKAMBlhKd47VGV36uZrPNREsoz3v8g==
=ee9u
-----END PGP SIGNATURE-----

--uvayaecgmyelikx3--

