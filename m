Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19321C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 10:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KboW8T0LwmdQHDzhaLO8y9T+QaLii17k/39YhKZ8oxI=; b=rLdIO0JtIJuwliwFLCKLqDn7eH
	b8ByVG0HhaNugzyF8cEJJFX6rNdj/X/lnDgZk54K26Bpc4Z5PUFf34/rT0EWoYANNeXjBiBHsOb2v
	cDwNU6dKsbDKRIHmJfe14ZBu6R7yLm74fbAfdDboo808dlbyRGZ5Ky+SsRjcqnZqTHP111J8rurSu
	ZLikFLr/VsOTpu8ZFfqkky8xD903BfbFZeO1M8XRAuD4qL60dWlpJpYDH1jhpyvdPEb0680ZfshWU
	ak6wiKrO3pFk9wwU2DKRABUCO49tXaxFEGuNqWcbt4wa/jZJ2h5vEdVTCLv+TjwJgUgjRJ07g+8ze
	HeE2V3wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5MCw-0000000CZAK-19DT;
	Thu, 17 Apr 2025 10:10:58 +0000
Received: from mout.gmx.net ([212.227.15.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5MB5-0000000CYx0-2dcg;
	Thu, 17 Apr 2025 10:09:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1744884535; x=1745489335; i=wahrenst@gmx.net;
	bh=KboW8T0LwmdQHDzhaLO8y9T+QaLii17k/39YhKZ8oxI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=U8pl/SFwG4FteTqjHlyBNWNeoj/6Cg6bgUncQSCwQitCyBL4N0vL/R4jQtd26i3B
	 GrTZeWZMwrVhLBkjd26/ClIUm5mfPDdzucSaOJLqZYY9yTrwl7NMwhmCYz1pn8QQE
	 pnN9+6qDC79tO6JoI9YQ/uN1n04OfWwObfiGrPLaEWKLH9SyfjqNQG9GZ/7InCF7p
	 R7a0BMcEBFFbvBQlnU5RDq27MqbypErqHZU1RdudZSSKwQ6/D4yS6/Ytd9G/b/ntG
	 LeftBAqZ+8eeAinoLFMf2/b1tU76CNdvIVbICJuFQrFElfaxp4bNuFvwJcwut4K0d
	 FZcmcLvkA+ScL4dNvg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.107] ([37.4.251.153]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M5fIW-1uCUmL3Avy-009VWA; Thu, 17
 Apr 2025 12:08:55 +0200
Message-ID: <14654c19-fa26-4d37-8f0f-9cf092982b67@gmx.net>
Date: Thu, 17 Apr 2025 12:08:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] clk: bcm: rpi: Add NULL check in
 raspberrypi_clk_register()
To: Henry Martin <bsdhenrymartin@gmail.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, florian.fainelli@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com, popcornmix@gmail.com,
 mripard@kernel.org, u.kleine-koenig@baylibre.com, linux-clk@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, nathan@kernel.org,
 dave.stevenson@raspberrypi.com
References: <CAPY8ntAFHW3kiqCnXjFtzL9FnRoQ69v8+3yJ+jR8_W8Bb+6d8A@mail.gmail.com>
 <20250402020513.42628-1-bsdhenrymartin@gmail.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
Autocrypt: addr=wahrenst@gmx.net; keydata=
 xjMEZ1dOJBYJKwYBBAHaRw8BAQdA7H2MMG3q8FV7kAPko5vOAeaa4UA1I0hMgga1j5iYTTvN
 IFN0ZWZhbiBXYWhyZW4gPHdhaHJlbnN0QGdteC5uZXQ+wo8EExYIADcWIQT3FXg+ApsOhPDN
 NNFuwvLLwiAwigUCZ1dOJAUJB4TOAAIbAwQLCQgHBRUICQoLBRYCAwEAAAoJEG7C8svCIDCK
 JQ4BAP4Y9uuHAxbAhHSQf6UZ+hl5BDznsZVBJvH8cZe2dSZ6AQCNgoc1Lxw1tvPscuC1Jd1C
 TZomrGfQI47OiiJ3vGktBc44BGdXTiQSCisGAQQBl1UBBQEBB0B5M0B2E2XxySUQhU6emMYx
 f5QR/BrEK0hs3bLT6Hb9WgMBCAfCfgQYFggAJhYhBPcVeD4Cmw6E8M000W7C8svCIDCKBQJn
 V04kBQkHhM4AAhsMAAoJEG7C8svCIDCKJxoA/i+kqD5bphZEucrJHw77ujnOQbiKY2rLb0pE
 aHMQoiECAQDVbj827W1Yai/0XEABIr8Ci6a+/qZ8Vz6MZzL5GJosAA==
In-Reply-To: <20250402020513.42628-1-bsdhenrymartin@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Vp3a+37uaw4BVeCxFEXatGI5F4P8nElZTeg0boA2hoAHEK14seC
 yQF09nylKm//RzK80Ccl1Nxq5xx+AXMmnju2sSrSL6/Xd0A3KTGWeA0gAcs0RGhEkhFZU79
 pKrs8ZnayWwIslZqi1R1HDP1936LRCb1l7TQJlsh0r9izdjT4kwqc1tudY2OAK1D+YIpe7r
 6UZT+IMtS59ieG7LFSePw==
UI-OutboundReport: notjunk:1;M01:P0:7FDxd8SGR7E=;gMwnoXSoReXFUKsr4zsYdoIONYG
 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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_030903_974875_C43F60C4 
X-CRM114-Status: GOOD (  13.74  )
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

Am 02.04.25 um 04:05 schrieb Henry Martin:
> devm_kasprintf() returns NULL when memory allocation fails. Currently,
> raspberrypi_clk_register() does not check for this case, which results
> in a NULL pointer dereference.
>
> Add NULL check after devm_kasprintf() to prevent this issue.
>
> Fixes: 93d2725affd6 ("clk: bcm: rpi: Discover the firmware clocks")
> Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Stefan Wahren <wahrenst@gmx.net>

Just a note, please don't send new patch versions as a reply to older=20
ones. This makes them harder to find.

Thanks
> ---
> V1 -> V2: Correct the commit hash in the Fixes: tag.
>
>   drivers/clk/bcm/clk-raspberrypi.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-ras=
pberrypi.c
> index 0e1fe3759530..720acc10f8aa 100644
> --- a/drivers/clk/bcm/clk-raspberrypi.c
> +++ b/drivers/clk/bcm/clk-raspberrypi.c
> @@ -286,6 +286,8 @@ static struct clk_hw *raspberrypi_clk_register(struc=
t raspberrypi_clk *rpi,
>   	init.name =3D devm_kasprintf(rpi->dev, GFP_KERNEL,
>   				   "fw-clk-%s",
>   				   rpi_firmware_clk_names[id]);
> +	if (!init.name)
> +		return ERR_PTR(-ENOMEM);
>   	init.ops =3D &raspberrypi_firmware_clk_ops;
>   	init.flags =3D CLK_GET_RATE_NOCACHE;
>  =20


