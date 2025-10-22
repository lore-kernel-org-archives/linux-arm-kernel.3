Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F100ACCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 09:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LNEtH9lG/yvOebKMsji3DJq4oD0CU5SvCjoqyEyuZJY=; b=o8DeeAk7+22KFDb0KTBAPmRliY
	RY9+ubRzNPfFNIkvNQSDhoOduDmxKStbxCS9D2iosGYkhGkWLdcrywpPHiJu5eR+KbabRLle4OmWW
	RZAeC1/dhgRvWmmax1jr4MPU1xiRFS8rS+ZqcmqNBYlitPA7h9480FEP7yN2JBJ/wrDMvWZf4e3rf
	EgaOGmC4ghez3nbqsVubnO2yATFwf08zl/wNB5eWQx73fBNZglQfd47g4IHPzSR/OZEVXybaADRdx
	qzSpm9ZCFn/gg6rGniA7qX1/6op/21GOloYcRtY2+BN91GuqFbvxyuGUOVQBN17EZnW6yIwEfUgYt
	Nz+P8vmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBUzG-00000002Ew1-0uSr;
	Wed, 22 Oct 2025 09:18:30 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBUz8-00000002ErP-3REt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 09:18:24 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 69785C0B8B2;
	Wed, 22 Oct 2025 09:18:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1FD07606DC;
	Wed, 22 Oct 2025 09:18:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BB8D8102F2424;
	Wed, 22 Oct 2025 11:18:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761124698; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=LNEtH9lG/yvOebKMsji3DJq4oD0CU5SvCjoqyEyuZJY=;
	b=OF2J3E5AqsRwJZUe/GRi6I4GRKXFbvqbO/tcH7qL3QxWQQyacXCI2N81rs8SHmBRk42pei
	mDcgLvkOpYtZ128tfw0QgBcbY/E2k4MUV7t/gHmWJHKhdVhNl+2JV4byn2kuJ3Fb38Zsif
	wpRUDMbFz+ApprQLi2TiA/7Lx9AvfUPkrFwOFsBlUEtUARyAwZIjKZ2yNUEO0IVZruZaFf
	6hL7qd09YkaJz04E2Nuj0oSbPtlR8xHZsN9HavVDoyhWhsS2LPUifxn/pvZzIR5unzRj2j
	YtuqYc8IuOEKk7cQUYupHAyPUGw8jaHFhFGi667+wSvG5a5gvBhR5n9ZA2yHfw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Genoud <richard.genoud@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Chen-Yu Tsai
 <wens@csie.org>,  Jernej Skrabec <jernej.skrabec@gmail.com>,  Samuel
 Holland <samuel@sholland.org>,  Uwe =?utf-8?Q?Kleine-K=C3=B6nig?=
 <u.kleine-koenig@baylibre.com>,  Wentao Liang <vulab@iscas.ac.cn>,  Johan
 Hovold <johan@kernel.org>,  Maxime Ripard <mripard@kernel.org>,  Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>,  linux-mtd@lists.infradead.org,
  devicetree@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-sunxi@lists.linux.dev,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 13/15] mtd: rawnand: sunxi: Add support for H616 nand
 controller
In-Reply-To: <20251020101311.256819-14-richard.genoud@bootlin.com> (Richard
	Genoud's message of "Mon, 20 Oct 2025 12:13:09 +0200")
References: <20251020101311.256819-1-richard.genoud@bootlin.com>
	<20251020101311.256819-14-richard.genoud@bootlin.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 22 Oct 2025 11:18:07 +0200
Message-ID: <87ecqvthv4.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_021823_070570_09C10E80 
X-CRM114-Status: GOOD (  21.22  )
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

Hello Richard,

On 20/10/2025 at 12:13:09 +02, Richard Genoud <richard.genoud@bootlin.com> =
wrote:

> The H616 nand controller has the same base as A10/A23, with some
> differences:
> - mdma is based on chained buffers
> - its ECC supports up to 80bit per 1024bytes
> - some registers layouts are a bit different, mainly due do the stronger
>   ECC.
> - it uses USER_DATA_LEN registers along USER_DATA registers.
> - it needs a specific clock for ECC and MBUS.
>
> Introduce the basic support, with ECC and scrambling, but without
> DMA/MDMA.
>
> Tested on Whatsminer H616 board (with and without scrambling, ECC)
>
> Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>

...

>=20=20
> +#define NFC_TIMING_CFG2(tCDQSS, tSC, tCLHZ, tCSS, tWC)		\
> +	((((tCDQSS) & 0x1) << 11) | (((tSC) & 0x3) << 12) |	\
> +	 (((tCLHZ) & 0x3) << 14) | (((tCSS) & 0x3) << 16) |	\
> +	 (((tWC) & 0x3) << 18))
> +
>  /* define bit use in NFC_CMD */
>  #define NFC_CMD_LOW_BYTE_MSK	GENMASK(7, 0)
> -#define NFC_CMD_HIGH_BYTE_MSK	GENMASK(15, 8)
> +#define NFC_CMD_HIGH_BYTE_MSK	GENMASK(15, 8)  // 15-10 reserved on H6

Wrong comment type :-)

> +#define NFC_CMD_ADR_NUM_MSK	GENMASK(9, 8)
>  #define NFC_CMD(x)		(x)
>  #define NFC_ADR_NUM_MSK		GENMASK(18, 16)
>  #define NFC_ADR_NUM(x)		(((x) - 1) << 16)
> @@ -122,6 +156,7 @@
>  #define NFC_SEQ			BIT(25)
>  #define NFC_DATA_SWAP_METHOD	BIT(26)
>  #define NFC_ROW_AUTO_INC	BIT(27)
> +#define NFC_H6_SEND_RND_CMD2	BIT(27)
>  #define NFC_SEND_CMD3		BIT(28)
>  #define NFC_SEND_CMD4		BIT(29)
>  #define NFC_CMD_TYPE_MSK	GENMASK(31, 30)
> @@ -133,6 +168,7 @@
>  #define NFC_READ_CMD_MSK	GENMASK(7, 0)
>  #define NFC_RND_READ_CMD0_MSK	GENMASK(15, 8)
>  #define NFC_RND_READ_CMD1_MSK	GENMASK(23, 16)
> +#define NFC_RND_READ_CMD2_MSK	GENMASK(31, 24)

...

> @@ -858,6 +967,8 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_ch=
ip *nand,
>  	if (ret)
>  		return ret;
>=20=20
> +	sunxi_nfc_reset_user_data_len(nfc);
> +	sunxi_nfc_set_user_data_len(nfc, 4, 0);

I'm not sure I understand this properly. Why isn't this a fixed setting?
Also, what is 4? It is not obvious to me and my require either a comment
or a define (or maybe a sizeof()).

>  	sunxi_nfc_randomizer_config(nand, page, false);
>  	sunxi_nfc_randomizer_enable(nand);
>  	writel(NFC_DATA_TRANS | NFC_DATA_SWAP_METHOD | NFC_ECC_OP,
> @@ -968,6 +1079,8 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct n=
and_chip *nand, uint8_t *buf
>  		return ret;
>=20=20
>  	sunxi_nfc_hw_ecc_enable(nand);
> +	sunxi_nfc_reset_user_data_len(nfc);
> +	sunxi_nfc_set_user_data_len(nfc, 4, 0);
>  	sunxi_nfc_randomizer_config(nand, page, false);
>  	sunxi_nfc_randomizer_enable(nand);
>=20=20
> @@ -1100,6 +1213,8 @@ static int sunxi_nfc_hw_ecc_write_chunk(struct nand=
_chip *nand,
>=20=20
>  	sunxi_nfc_randomizer_config(nand, page, false);
>  	sunxi_nfc_randomizer_enable(nand);
> +	sunxi_nfc_reset_user_data_len(nfc);
> +	sunxi_nfc_set_user_data_len(nfc, 4, 0);
>  	sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, 0, bbm, page);
>=20=20
>  	writel(NFC_DATA_TRANS | NFC_DATA_SWAP_METHOD |
> @@ -1344,10 +1459,12 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct=
 nand_chip *nand,
>  	if (ret)
>  		goto pio_fallback;
>=20=20
> +	sunxi_nfc_reset_user_data_len(nfc);
>  	for (i =3D 0; i < ecc->steps; i++) {
>  		const u8 *oob =3D nand->oob_poi + (i * (ecc->bytes + 4));
>=20=20
>  		sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, i, !i, page);
> +		sunxi_nfc_set_user_data_len(nfc, 4, i);

Here you use it differently, maybe a bit of explanation in a comment
could help.

>  	}
>=20=20
>  	nand_prog_page_begin_op(nand, page, 0, NULL, 0);
> @@ -2148,6 +2265,10 @@ static int sunxi_nfc_probe(struct platform_device =
*pdev)
>  	if (irq < 0)
>  		return irq;
>=20=20
> +	nfc->caps =3D of_device_get_match_data(dev);
> +	if (!nfc->caps)
> +		return -EINVAL;
> +
>  	nfc->ahb_clk =3D devm_clk_get_enabled(dev, "ahb");
>  	if (IS_ERR(nfc->ahb_clk)) {
>  		dev_err(dev, "failed to retrieve ahb clk\n");
> @@ -2160,6 +2281,22 @@ static int sunxi_nfc_probe(struct platform_device =
*pdev)
>  		return PTR_ERR(nfc->mod_clk);
>  	}
>=20=20

...

>  static const struct sunxi_nfc_caps sunxi_nfc_a10_caps =3D {
>  	.has_ecc_block_512 =3D true,
> +	.has_ecc_clk =3D false,
> +	.has_mbus_clk =3D false,

As you want, but setting these fields (and below) to false is not
strictly required as they will be set to 0 (which means false,
automatically).

>  	.reg_io_data =3D NFC_REG_A10_IO_DATA,
>  	.reg_ecc_err_cnt =3D NFC_REG_A10_ECC_ERR_CNT,
>  	.reg_user_data =3D NFC_REG_A10_USER_DATA,
> @@ -2242,11 +2383,14 @@ static const struct sunxi_nfc_caps sunxi_nfc_a10_=
caps =3D {
>  	.dma_maxburst =3D 4,
>  	.ecc_strengths =3D sunxi_ecc_strengths_a10,
>  	.nstrengths =3D ARRAY_SIZE(sunxi_ecc_strengths_a10),
> +	.max_ecc_steps =3D 16,
>  	.sram_size =3D 1024,
>  };
>=20=20

> +static const struct sunxi_nfc_caps sunxi_nfc_h616_caps =3D {
> +	.has_mdma =3D false, // H616 supports only chained descriptors

Wrong comment type :-)

LGTM otherwise.

Thanks,
Miqu=C3=A8l

