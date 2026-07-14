Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60DCCC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 21:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tG5xu9XUyqIVx9AETRBq9Z5/aY+YTJq5pdj8yqHRqpU=; b=td56AF0sM/nnZpu7elxholaQwc
	npQ37bfs72gmZBynoElQ4Sn0RmsAgXo0dBtlYIOkT1+zDCjJpJuLOqSvppspOFVcMwjMTVm0k0lzY
	Z+8opThR7BTQCQkibBNKJq0L5Vgcc86mDL/4SDMWc1iX7LbwuIlbSxLEN0Ixr1+wAgVUlC9fKX62N
	9h6vCCbt/DMmM/LvMhZhi0LVfJjs89w7ty5k23dUIP6MaRfwfrc0lSdhQ4VNelqkaNJCuhtDbFcSL
	4Yh9eTug3mxP6DR7M1+tOLutV5YVgdcHMmNedJ/whrGkTAAB7hvmszoI6LVUwT2+z4l1J5yYsQEkz
	eAS5NWZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjkhU-0000000DLqO-32Ue;
	Tue, 14 Jul 2026 21:30:00 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjkhQ-0000000DLpj-21Kp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 21:29:59 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-47c6e9a694bso2621311f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 14:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784064594; x=1784669394; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tG5xu9XUyqIVx9AETRBq9Z5/aY+YTJq5pdj8yqHRqpU=;
        b=cod3T6r8/QQDySYWK+IfktexfK6jnyycHVAYiMFWoqkHTXECQlasrT+3ad6NbBiAmx
         OFiETzLAaUNA5vRc07DixwPTyrp03qRfVXPGciAPfy3SJ9lfF7ZAm1UUKwU9HG6cdnPE
         zHqb5z0DEjotPK/Y0UWOVYt+aegeKOBhp1oU14gJ7R3RhqzbxYuZ9VQngHg/aaTrhQAR
         RcFU4wAcF6cqLENKYz81soy4T4PC8AwMULp5mEgV+foktDysG6wuzIGaVvruWqYZP/8Q
         /6hdCD5boZ1FURIkByWxjQSFZD/DZozg4b8RU+vJ2eERTtC9OYQ0koFk9CsTfQYNVKvW
         OYBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784064594; x=1784669394;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tG5xu9XUyqIVx9AETRBq9Z5/aY+YTJq5pdj8yqHRqpU=;
        b=riV/PTy3BbV6/6x3AgXp6SWNkHXwbLQ+i0qnz0CWxyDx5fho3xQrKNDYlW3TC3ZTJl
         5moZO17DIAvflLEiiGWDqG2ZMb0c3XHt1ouxXi12SOluk110X0+cKfmnDne9bui/JxAS
         nN9ONjTD4wOd1ao+ezRStFYxsxbsU7AwUpHD/CQwmfHYEtPJDHM6UHFnPBXoE93ZlnOc
         o5syRUP+giChsIjSSYZZoVBWK10PEnZtL06bfVqsfCfzDkiOgIlyS8k5xwOIo3vkwMN6
         iviWGCUHMvJnWJol7R319pujZmUgsxdFLNofvIBIF12/iUwMG5i2QRBEc6fSR26raPvq
         03oA==
X-Forwarded-Encrypted: i=1; AHgh+RqpOqlwdZbPnYg57X66AeCyBsUX/jvBSgLVvS9RKiW7lRyPjWyP1T5b2liSywKv9LfM/VGU1grwMdvzTRwtn5cF@lists.infradead.org
X-Gm-Message-State: AOJu0YzagHbR9RVfPtqmeTUHAX2nTAu535GmN7RqRPN1PFOdFheIURb6
	XKwt/6mvtnwAGHYNRjVct4It/2uEYO7SXfwe5/o0UBU1x7xjhqkNvV1jFC/CWGyKqE8=
X-Gm-Gg: AfdE7cnwILB9DjlhL7BMO4pD9KaZPRwLV6acrqLrE3kfa85muqGSvuS3/GdhAov5ojf
	yc3nm7gK/SAGptwe587LXDFUr98b0FW/e5PeRx+QDWh41Q8HhDNCtGT0/JxjNLzs/Uv+mLTVB9B
	67zwRwLsZXUAXsZF83yldIafmHgRPdMImQajQOQaEBnKVAJGFtxIDxudTfMUTi1bvrKWGDJ4B03
	SnNkR8YJYKH7K/VWM3OamWZgPGO+gv9HI3tF9LstsbQnUECRQfpnvpIEXww6iuPLFWsNZVbSK2i
	49QJ46sErjFXtXJ/D7dnmfv9A1y3AsUIB6IOtcxyrTW2R5R0gEXHTZQYo8//G4VQLFUBShgbt1x
	w3rAzX501Tk+OpMmOt7a29dv5gkoLR0ook3uUQT0oyVkrmI9gKgDeh7VxJJLNG9Ggz/v6cRQHh+
	WTuIvybsta0xl9EQekCA==
X-Received: by 2002:a05:6000:2c04:b0:475:f100:3603 with SMTP id ffacd0b85a97d-47f4fcf193emr108406f8f.50.1784064594560;
        Tue, 14 Jul 2026 14:29:54 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47f464a974csm13070062f8f.18.2026.07.14.14.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 14:29:53 -0700 (PDT)
Date: Tue, 14 Jul 2026 23:29:52 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: MANNURU VENKATESWARLU <v-mannuru@ti.com>
Cc: krzk@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, n-francis@ti.com, s-k6@ti.com, bb@ti.com
Subject: Re: [RFC PATCH 06/22] memory: ti-ddrss: Add MR4 temperature-driven
 refresh rate driver
Message-ID: <alaojVmBNqua82_t@monoceros>
References: <20260714125557.3304305-1-v-mannuru@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2mkn4dfbhj25cdbs"
Content-Disposition: inline
In-Reply-To: <20260714125557.3304305-1-v-mannuru@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_142957_663367_FEF162D5 
X-CRM114-Status: GOOD (  15.06  )
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


--2mkn4dfbhj25cdbs
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [RFC PATCH 06/22] memory: ti-ddrss: Add MR4 temperature-driven
 refresh rate driver
MIME-Version: 1.0

Hello,

On Tue, Jul 14, 2026 at 06:25:57PM +0530, MANNURU VENKATESWARLU wrote:
> +#include <linux/mfd/ti-ddrss.h>
> +#include <linux/mod_devicetable.h>

Please drop this header. platform_device_id is provided by
<linux/platform_device.h>, so the explicit include isn't needed.

The mod_devicetable.h header will go away soon.

> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> [...]
> +static const struct platform_device_id k3_ddr_mr4_id[] = {
> +	{ "ti-ddrss-mr4", 0 },
> +	{}
> +};

Please make this:

static const struct platform_device_id k3_ddr_mr4_id[] = {
	{ .name = "ti-ddrss-mr4" },
	{ }
};

> +MODULE_DEVICE_TABLE(platform, k3_ddr_mr4_id);
> +
> +static struct platform_driver k3_ddr_mr4_driver = {
> +	.driver = {
> +		.name		= "ti-ddrss-mr4",
> +		.dev_groups	= k3_ddr_mr4_groups,
> +	},
> +	.probe		= k3_ddr_mr4_probe,
> +	.id_table	= k3_ddr_mr4_id,

I'm not a fan of aligned `=`. These tend to diverge over time. And
sometimes they are not even aligned from the start ...
If you ask me, just use a single space before the `=`.

Best regards
Uwe

--2mkn4dfbhj25cdbs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpWqkwACgkQj4D7WH0S
/k6Ahwf/b81Vv5hkw4FybxhsgdUe5wRo3ENmjomE25XcR89z6XUIZtiVMfJFPkpo
ob3KI0c4+bTcA4ClDIDTS/g1H9V6RTolyo1OF6lQKz6ZZ+IP2oKBdIGXIKCqk/x5
okV1ajvlpDT+DN9RXTy1ObvjXfLCbkPL4a+CSqONktVR69fJWkRsG9kCT2tug09p
9PBYVy0Vy10Ti1ZnNvZw/+9+LdlXFAxauM2/Mcq/1IvRkWP/YJJrLlttziAbYGg0
BqKW9p2CZzWVYkv3c/erWIe9ZOdgI2C7zlP+Nn9pBxXtHlpTaNFqK8AEKlfB4yJH
gG5rmrbz6NksjCfJ12/W3ew91DesPw==
=CCWW
-----END PGP SIGNATURE-----

--2mkn4dfbhj25cdbs--

