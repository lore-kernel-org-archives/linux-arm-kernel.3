Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F2B9C87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 16:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+bR0VckSoN9YaJX4wlOvB009sshe3mAwoA7HDDGUCpI=; b=Tt95obFeAJXnotWK91UunngLD8
	p713MfWZNLtumQ/FSCmkwOSsum9GjnadeXjGikDyvHWh9kAQLvGXGOMFv2KbMTQcdTM/tJFOBCdbQ
	K4aAICH3TWHi7DV0Y++xBPb4E8IcWxG6IHG8ag5SiD8PISPRytdtlWpJFVyLjZ/HlEnO850Q0rvWe
	KTCowIVpP0tul5zIO8x0lGHg61HrPXDZ9MiFZ6lWE0zD5hKW3A+BFn13OR2TWA0V2Ky1U0X9PnWGr
	uJGCyfTmhkVz9RRPs4nkiz70f33gq/PRKdXiwlYqoYz5d4pH4emFUalt4Mp3i2vk6iNA/RKAL1l/B
	9TAYqG7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujKYL-0000000DIkr-1z6t;
	Tue, 05 Aug 2025 16:30:18 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujJX8-0000000D8Rc-02Va;
	Tue, 05 Aug 2025 15:24:59 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0C703438DF;
	Tue,  5 Aug 2025 15:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754407495;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+bR0VckSoN9YaJX4wlOvB009sshe3mAwoA7HDDGUCpI=;
	b=Ci72ZknI4OXBeJS8vhqNr/IUn2BHA2NeY694ItlWgUdkWtdHx0y4S+KYkdzppkzW0cVwpK
	kBWY9e4b29rek3ZdCzZtlIDgwHk2MrV68RC64LfmiSIGG4/gUaU9VxnMia3Eex+wdt6Ajv
	7C/i0N3DLleoUJldMMTEZo2//+zf0J3VSHMdvICfy3CDa/kx4h04G8zaSwi0CFbqMOTcXe
	xRTIuc98AQ/k1S4UiVqS+29CX/A37APSl6fsKJPEE7IoIgDgpp6hFu3qmGCM0633s2TWU/
	bd2sGoZvfT09zx0Bl0XsrBSsKBQs783ttrhMwkeZDgxWkV4h0TrSJrs+GRR/zw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Lorenzo Bianconi <lorenzo@kernel.org>,  Ray Liu
 <ray.liu@airoha.com>,  Mark Brown <broonie@kernel.org>,  Tudor Ambarus
 <tudor.ambarus@linaro.org>,  Martin Kurbanov
 <mmkurbanov@salutedevices.com>,  Takahiro Kuwano
 <Takahiro.Kuwano@infineon.com>,  Cheng Ming Lin
 <chengminglin@mxic.com.tw>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-spi@vger.kernel.org
Subject: Re: [PATCH 1/4] drivers: mtd: spi-nand: fix direct mapping creation
 sizes.
In-Reply-To: <20250804192132.1406387-2-mikhail.kshevetskiy@iopsys.eu> (Mikhail
	Kshevetskiy's message of "Mon, 4 Aug 2025 22:21:29 +0300")
References: <20250804192132.1406387-1-mikhail.kshevetskiy@iopsys.eu>
	<20250804192132.1406387-2-mikhail.kshevetskiy@iopsys.eu>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Tue, 05 Aug 2025 17:24:50 +0200
Message-ID: <87sei5hjul.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduudehhedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedugfeuiefghffhiedvveejuefgueffvedugeevjeejgeetgfefgeffveetgefgleenucffohhmrghinhepohhppghtmhhplhdruggrthgrnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudegpdhrtghpthhtohepmhhikhhhrghilhdrkhhshhgvvhgvthhskhhihiesihhophhshihsrdgvuhdprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhtoheplhhorhgvnhiioheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhgrhidrlhhiuhesrghirhhoh
 hgrrdgtohhmpdhrtghpthhtohepsghrohhonhhivgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhuughorhdrrghmsggrrhhusheslhhinhgrrhhordhorhhgpdhrtghpthhtohepmhhmkhhurhgsrghnohhvsehsrghluhhtvgguvghvihgtvghsrdgtohhm
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_082458_693211_9556374B 
X-CRM114-Status: GOOD (  17.13  )
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

Hello Mikhail,

Thanks a lot for this series!

On 04/08/2025 at 22:21:29 +03, Mikhail Kshevetskiy <mikhail.kshevetskiy@iop=
sys.eu> wrote:

> Continuous mode is only supported for non-raw data reads, thus raw I/O
> or non-raw writing requires only single flash page mapping.
>
> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
> ---
>  drivers/mtd/nand/spi/core.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
> index b0898990b2a5..b42c42ec58a4 100644
> --- a/drivers/mtd/nand/spi/core.c
> +++ b/drivers/mtd/nand/spi/core.c
> @@ -1103,9 +1103,6 @@ static int spinand_create_dirmap(struct spinand_dev=
ice *spinand,
>  	};
>  	struct spi_mem_dirmap_desc *desc;
>=20=20
> -	if (spinand->cont_read_possible)
> -		info.length =3D nanddev_eraseblock_size(nand);
> -
>  	/* The plane number is passed in MSB just above the column address */
>  	info.offset =3D plane << fls(nand->memorg.pagesize);
>=20=20
> @@ -1117,6 +1114,8 @@ static int spinand_create_dirmap(struct spinand_dev=
ice *spinand,
>=20=20
>  	spinand->dirmaps[plane].wdesc =3D desc;
>=20=20
> +	if (spinand->cont_read_possible)
> +		info.length =3D nanddev_eraseblock_size(nand);
>  	info.op_tmpl =3D *spinand->op_templates.read_cache;
>  	desc =3D devm_spi_mem_dirmap_create(&spinand->spimem->spi->dev,
>  					  spinand->spimem, &info);
> @@ -1132,6 +1131,9 @@ static int spinand_create_dirmap(struct spinand_dev=
ice *spinand,
>  		return 0;
>  	}
>=20=20
> +	// ECC reading/writing always happen in non-continuous mode

This comment does not sound helpful, at least I do not understand it?
(and the comment style should be /* */)

> +	info.length =3D nanddev_page_size(nand) + nanddev_per_page_oobsize(nand=
);
> +
>  	info.op_tmpl =3D *spinand->op_templates.update_cache;
>  	info.op_tmpl.data.ecc =3D true;
>  	desc =3D devm_spi_mem_dirmap_create(&spinand->spimem->spi->dev,

May I suggest to use two different dirmap infos? One with a large size
(for reads) and a page-sized one for other cases (including the fallback
you're introducing in PATCH 2).

Thanks,
Miqu=C3=A8l

