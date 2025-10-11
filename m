Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54DC5CCA476
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Oct 2025 10:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2I91w0Qs2bshI+j4YNRRyIMhvWlTFvUnbZnwMWPdg+Q=; b=nd2BLVfL5UdHq+3c+FbIbxbSrq
	ajdrl0f00Q8bKBdqD0TbHCTMYoPXWLGpVs3ns8UR61RZg8fAMjJ49ujf2Aq9u7yrr8w+ypBliXLNY
	3kk3/r4jnxXNeFND+lGiXx9ACDzlyRY0J4skQvIaqKk2RYk4dhHxzfsxKRyShbPWElE+iMpvRhwaN
	hGPibeTU3iBtXIBVDGL86CQq//j7EzIKmeO0vXSxwjm2LW6hV0qIWNSRv87PySwk40lzZFtAwyjdS
	lymnrCOvNqOD3DwTZo6hjWxT+wtJAn6ZDkKai5DH5wvrnrN/4aSfB7jb6rnldjdWAwbhnO2+14C+x
	IeJnSC2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7X9l-0000000A40C-3HOY;
	Sat, 11 Oct 2025 10:48:57 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7X9j-0000000A3z3-1GoW
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Oct 2025 10:48:56 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-631df7b2dffso6580486a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Oct 2025 03:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760179733; x=1760784533; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2I91w0Qs2bshI+j4YNRRyIMhvWlTFvUnbZnwMWPdg+Q=;
        b=i/tOQ19I0xuXE8FgD6fB6ljHENq4ua3F1ICLu0pHCjau6kCIvql4aBdYAbt6OhsFcL
         suLIp2HahLKCJHjXROYzMvuNQBGxTS+zBS/ceHsuu47QM9Wmg/38ZH7ZXMR0joNlafyW
         D/4R4OUnLW9zwVY/46eRZUnTMwD3iTnVo0/xrV1I1RcIV2/luyfnYdIKAQTlxBrp5dBa
         pLSykB4/ymmhdtyEGXa62db+d29XVM6z3dLlvDPHMDooy1gvwI8ODCoiqUzX8xil1rDa
         kfIC4EJxsLu5/Y2MeoW/XilvCoA5Aj4+lg7oQ/SGwqJgmir+eicMAj6saw/pSkjOMb7g
         vNig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760179733; x=1760784533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2I91w0Qs2bshI+j4YNRRyIMhvWlTFvUnbZnwMWPdg+Q=;
        b=dKkYtwYjf6wh/Beb8YIzv6RCs97DwUgcbVpOUTHJxTUH5lgS2xVZ4oqcbEt72DhjWc
         K7WcqeCvhWW9AWPVwuqC2oBUs0iY6JGEu5aNOZ3NbA2fZIJ0Hp1olcxIDuda3iQiqxM5
         dbpIwiqss3nzmRTQhKTbjT3nuLYBhSCd28UotQvZPTwWuG4A6PdKmiC/raa8FrHsgmi7
         fY4NInV+bv1djckwigeE+HEcx10HN/Gm/zTtxcNFpxmVQE4XwMOh/obd+MxclfTQoHLD
         n2ahiewb8XssFfzvwO1Dr/VYE/S7FA9uIGenuIrhmXLiEhQk8w1Hyz93cGPsChOaIZAp
         ngmw==
X-Forwarded-Encrypted: i=1; AJvYcCUTH3Mkh0BUTO6HEGFmP9zfSc4IBMzWC7W7YnGF0daG/cRRHxOEnTB1jJA/+fepzi9SuWTMqiWnmYHRaQqfXbLL@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/XKCuaqOkcfnkk1W4h15yTSJ3IaYsJbfjhloEd+zdD9RYtkCD
	XYXi3sGqzLsd1UBcpS2Q3QFkzna0QhrD9jrA7BxJ2IgbY5u62NTrkPDl
X-Gm-Gg: ASbGnctoUJgAd8rTz2rk56vS/qLJ7wNKBZucKKcGkzOraejNP4xNFhFocYhQvAlNT9P
	yg0cWpRctLFjipM8p5XHWOPPZmVXLGDMCi1I73iHPLqywmXPoFgzdUDpK/TOqn3graM1ooWQRHG
	OspCPa7WsreIUiHvyi//ppvnjHZqWKCL/Q+Z3fzNuo7tRFsnTGYYFQeFi60RupcAd2m+di1pZu0
	TFywK66YiIjkK2MqOnH/M3frRXH7ODeEUbe1KDDstPfJpq77J74orOMsBsiXdG+HtCmx8ZEm48p
	eWNyKh/7XE3xsfUAJsucOOXN2wIh93p8h2xDRQ+gY+bCF2U3We9Dl0SN/lkj2lHcvtQROs4rbJx
	qdme/RKtFUrXHcKhpeicQWy9s3MvvFWQnbDv2bO3rEHkf6O+RD8y+FTUPyIavEVs=
X-Google-Smtp-Source: AGHT+IFP5/4Tzd0trGXX0JnOU4Fhkm8XDoJ2gR7XxP4LMoc1aNDyuHK+ENXSYJWjGXz+Zc2MO378Yw==
X-Received: by 2002:a17:907:94c1:b0:afe:159:14b1 with SMTP id a640c23a62f3a-b50bd049ba7mr1631347666b.9.1760179733213;
        Sat, 11 Oct 2025 03:48:53 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d951ceb4sm453411166b.72.2025.10.11.03.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Oct 2025 03:48:52 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Richard Genoud <richard.genoud@bootlin.com>
Cc: Wentao Liang <vulab@iscas.ac.cn>,
 Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Richard Genoud <richard.genoud@bootlin.com>
Subject: Re: [PATCH 15/15] mtd: rawnand: sunxi: Add support for H616 nand controller
Date: Sat, 11 Oct 2025 12:48:51 +0200
Message-ID: <3373475.aeNJFYEL58@jernej-laptop>
In-Reply-To: <20251010084042.341224-16-richard.genoud@bootlin.com>
References: <20251010084042.341224-1-richard.genoud@bootlin.com>
 <20251010084042.341224-16-richard.genoud@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251011_034855_493271_F14E85B6 
X-CRM114-Status: GOOD (  34.84  )
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

Dne petek, 10. oktober 2025 ob 10:40:42 Srednjeevropski poletni =C4=8Das je=
 Richard Genoud napisal(a):
> The H616 nand controller has the same base as A10/A23, with some
> differences:
> - mdma is based on chained buffers
> - its ECC supports up to 80bit per 1024bytes
> - some registers layouts are a bit different, mainly due do the stronger
>   ECC.
> - it uses USER_DATA_LEN registers along USER_DATA registers.
> - it needs a specific clock for ECC and MBUS.
>=20
> This patch introduce the basic support, without DMA/MDMA.
>=20
> Tested on Whatsminer H616 board (with and without scrambling, ECC)
>=20
> Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
> ---
>  drivers/mtd/nand/raw/sunxi_nand.c | 182 ++++++++++++++++++++++++++++--
>  1 file changed, 174 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sun=
xi_nand.c
> index e81d74c6633a..1e1185f8d980 100644
> --- a/drivers/mtd/nand/raw/sunxi_nand.c
> +++ b/drivers/mtd/nand/raw/sunxi_nand.c
> @@ -49,17 +49,40 @@
>  #define NFC_REG_A23_IO_DATA	0x0300
>  #define NFC_REG_ECC_CTL		0x0034
>  #define NFC_REG_ECC_ST		0x0038
> -#define NFC_REG_DEBUG		0x003C
> +#define NFC_REG_H6_PAT_FOUND	0x003C
>  #define NFC_REG_A10_ECC_ERR_CNT	0x0040
> +#define NFC_REG_H6_ECC_ERR_CNT	0x0050
>  #define NFC_REG_ECC_ERR_CNT(nfc, x)	((nfc->caps->reg_ecc_err_cnt + (x)) =
& ~0x3)
> +#define NFC_REG_H6_RDATA_CTL	0x0044
> +#define NFC_REG_H6_RDATA_0	0x0048
> +#define NFC_REG_H6_RDATA_1	0x004C
>  #define NFC_REG_A10_USER_DATA	0x0050
> +#define NFC_REG_H6_USER_DATA	0x0080
>  #define NFC_REG_USER_DATA(nfc, x)	(nfc->caps->reg_user_data + ((x) * 4))
> +#define NFC_REG_H6_USER_DATA_LEN 0x0070
> +/* A USER_DATA_LEN register can hold the length of 8 USER_DATA registers=
 */
> +#define NFC_REG_USER_DATA_LEN_CAPACITY 8
> +#define NFC_REG_USER_DATA_LEN(nfc, step) \
> +	 (nfc->caps->reg_user_data_len + \
> +	 ((step) / NFC_REG_USER_DATA_LEN_CAPACITY) * 4)
>  #define NFC_REG_SPARE_AREA(nfc) (nfc->caps->reg_spare_area)
>  #define NFC_REG_A10_SPARE_AREA	0x00A0
>  #define NFC_REG_PAT_ID(nfc) (nfc->caps->reg_pat_id)
>  #define NFC_REG_A10_PAT_ID	0x00A4
>  #define NFC_REG_MDMA_ADDR	0x00C0
>  #define NFC_REG_MDMA_CNT	0x00C4
> +#define NFC_REG_H6_EFNAND_STATUS 0x0110
> +#define NFC_REG_H6_SPARE_AREA	0x0114
> +#define NFC_REG_H6_PAT_ID	0x0118
> +#define NFC_REG_H6_DDR2_SPEC_CTL 0x011C
> +#define NFC_REG_H6_NDMA_MODE_CTL 0x0120
> +#define NFC_REG_H6_MDMA_DLBA_REG 0x0200
> +#define NFC_REG_H6_MDMA_STA	0x0204
> +#define NFC_REG_H6_MDMA_INT_MAS	0x0208
> +#define NFC_REG_H6_MDMA_DESC_ADDR 0x020C
> +#define NFC_REG_H6_MDMA_BUF_ADDR 0x0210
> +#define NFC_REG_H6_MDMA_CNT	0x0214
> +
>  #define NFC_RAM0_BASE		0x0400
>  #define NFC_RAM1_BASE		0x0800
> =20
> @@ -71,6 +94,7 @@
>  #define NFC_BUS_WIDTH_16	(1 << 2)
>  #define NFC_RB_SEL_MSK		BIT(3)
>  #define NFC_RB_SEL(x)		((x) << 3)
> +/* CE_SEL BIT 27 is meant to be used for GPIO chipselect */
>  #define NFC_CE_SEL_MSK		GENMASK(26, 24)
>  #define NFC_CE_SEL(x)		((x) << 24)
>  #define NFC_CE_CTL		BIT(6)
> @@ -89,6 +113,9 @@
>  #define NFC_STA			BIT(4)
>  #define NFC_NATCH_INT_FLAG	BIT(5)
>  #define NFC_RB_STATE(x)		BIT(x + 8)
> +#define NFC_RB_STATE_MSK	GENMASK(11, 8)
> +#define NDFC_RDATA_STA_1	BIT(12)
> +#define NDFC_RDATA_STA_0	BIT(13)
> =20
>  /* define bit use in NFC_INT */
>  #define NFC_B2R_INT_ENABLE	BIT(0)
> @@ -100,6 +127,7 @@
> =20
>  /* define bit use in NFC_TIMING_CTL */
>  #define NFC_TIMING_CTL_EDO	BIT(8)
> +#define NFC_TIMING_CTL_E_EDO	BIT(9)
> =20
>  /* define NFC_TIMING_CFG register layout */
>  #define NFC_TIMING_CFG(tWB, tADL, tWHR, tRHW, tCAD)		\
> @@ -107,9 +135,15 @@
>  	(((tWHR) & 0x3) << 4) | (((tRHW) & 0x3) << 6) |		\
>  	(((tCAD) & 0x7) << 8))
> =20
> +#define NFC_TIMING_CFG2(tCDQSS, tSC, tCLHZ, tCSS, tWC)		\
> +	((((tCDQSS) & 0x1) << 11) | (((tSC) & 0x3) << 12) |	\
> +	 (((tCLHZ) & 0x3) << 14) | (((tCSS) & 0x3) << 16) |	\
> +	 (((tWC) & 0x3) << 18))
> +
>  /* define bit use in NFC_CMD */
>  #define NFC_CMD_LOW_BYTE_MSK	GENMASK(7, 0)
> -#define NFC_CMD_HIGH_BYTE_MSK	GENMASK(15, 8)
> +#define NFC_CMD_HIGH_BYTE_MSK	GENMASK(15, 8)  // 15-10 reserved on H6
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
> =20
>  /* define bit use in NFC_WCMD_SET */
>  #define NFC_PROGRAM_CMD_MSK	GENMASK(7, 0)
> @@ -150,6 +186,9 @@
>  #define NFC_RANDOM_DIRECTION(nfc) (nfc->caps->random_dir_mask)
>  #define NFC_ECC_MODE_MSK(nfc)	(nfc->caps->ecc_mode_mask)
>  #define NFC_ECC_MODE(nfc, x)	field_prep(NFC_ECC_MODE_MSK(nfc), (x))
> +/* RANDOM_PAGE_SIZE: 0: ECC block size  1: page size */
> +#define NFC_A23_RANDOM_PAGE_SIZE	BIT(11)
> +#define NFC_H6_RANDOM_PAGE_SIZE	BIT(7)
>  #define NFC_RANDOM_SEED_MSK	GENMASK(30, 16)
>  #define NFC_RANDOM_SEED(x)	((x) << 16)
> =20
> @@ -165,6 +204,9 @@
> =20
>  #define NFC_ECC_ERR_CNT(b, x)	(((x) >> (((b) % 4) * 8)) & 0xff)
> =20
> +#define NFC_USER_DATA_LEN_MSK(step) \
> +	(0xf << (((step) % NFC_REG_USER_DATA_LEN_CAPACITY) * 4))
> +
>  #define NFC_DEFAULT_TIMEOUT_MS	1000
> =20
>  #define NFC_MAX_CS		7
> @@ -224,9 +266,11 @@ static inline struct sunxi_nand_chip *to_sunxi_nand(=
struct nand_chip *nand)
>   * @has_mdma:		Use mbus dma mode, otherwise general dma
>   *			through MBUS on A23/A33 needs extra configuration.
>   * @has_ecc_block_512:	If the ECC can handle 512B or only 1024B chuncks
> + * @has_mbus_clk:	If the controller needs a mbus clock.
>   * @reg_io_data:	I/O data register
>   * @reg_ecc_err_cnt:	ECC error counter register
>   * @reg_user_data:	User data register
> + * @reg_user_data_len:	User data length register
>   * @reg_spare_area:	Spare Area Register
>   * @reg_pat_id:		Pattern ID Register
>   * @reg_pat_found:	Data Pattern Status Register
> @@ -238,14 +282,23 @@ static inline struct sunxi_nand_chip *to_sunxi_nand=
(struct nand_chip *nand)
>   * @dma_maxburst:	DMA maxburst
>   * @ecc_strengths:	Available ECC strengths array
>   * @nstrengths:		Size of @ecc_strengths
> + * @max_ecc_steps:	Maximum supported steps for ECC, this is also the
> + *			number of user data registers
> + * @user_data_len_tab:  Table of lenghts supported by USER_DATA_LEN regi=
ster
> + *			The table index is the value to set in NFC_USER_DATA_LEN
> + *			registers, and the corresponding value is the number of
> + *			bytes to write
> + * @nuser_data_tab:	Size of @user_data_len_tab
>   * @sram_size:		Size of the NAND controller SRAM
>   */
>  struct sunxi_nfc_caps {
>  	bool has_mdma;
>  	bool has_ecc_block_512;
> +	bool has_mbus_clk;
>  	unsigned int reg_io_data;
>  	unsigned int reg_ecc_err_cnt;
>  	unsigned int reg_user_data;
> +	unsigned int reg_user_data_len;
>  	unsigned int reg_spare_area;
>  	unsigned int reg_pat_id;
>  	unsigned int reg_pat_found;
> @@ -257,6 +310,9 @@ struct sunxi_nfc_caps {
>  	unsigned int dma_maxburst;
>  	const u8 *ecc_strengths;
>  	unsigned int nstrengths;
> +	const u8 *user_data_len_tab;
> +	unsigned int nuser_data_tab;
> +	unsigned int max_ecc_steps;
>  	int sram_size;
>  };
> =20
> @@ -268,6 +324,7 @@ struct sunxi_nfc_caps {
>   * @regs: NAND controller registers
>   * @ahb_clk: NAND controller AHB clock
>   * @mod_clk: NAND controller mod clock
> + * @ecc_clk: NAND controller ECC clock
>   * @reset: NAND controller reset line
>   * @assigned_cs: bitmask describing already assigned CS lines
>   * @clk_rate: NAND controller current clock rate
> @@ -282,7 +339,9 @@ struct sunxi_nfc {
>  	struct device *dev;
>  	void __iomem *regs;
>  	struct clk *ahb_clk;
> +	struct clk *mbus_clk;
>  	struct clk *mod_clk;
> +	struct clk *ecc_clk;
>  	struct reset_control *reset;
>  	unsigned long assigned_cs;
>  	unsigned long clk_rate;
> @@ -764,6 +823,53 @@ static void sunxi_nfc_hw_ecc_get_prot_oob_bytes(stru=
ct nand_chip *nand, u8 *oob,
>  		sunxi_nfc_randomize_bbm(nand, page, oob);
>  }
> =20
> +/*
> + * On H6/H6 the user_data length has to be set in specific registers
> + * before writing.
> + */
> +static void sunxi_nfc_reset_user_data_len(struct sunxi_nfc *nfc)
> +{
> +	int loop_step =3D NFC_REG_USER_DATA_LEN_CAPACITY;
> +
> +	/* not all SoCs have this register */
> +	if (!nfc->caps->reg_user_data_len)
> +		return;
> +
> +	for (int i =3D 0; i < nfc->caps->max_ecc_steps; i +=3D loop_step)
> +		writel(0, nfc->regs + NFC_REG_USER_DATA_LEN(nfc, i));
> +}
> +
> +static void sunxi_nfc_set_user_data_len(struct sunxi_nfc *nfc,
> +					int len, int step)
> +{
> +	bool found =3D false;
> +	u32 val;
> +	int i;
> +
> +	/* not all SoCs have this register */
> +	if (!nfc->caps->reg_user_data_len)
> +		return;
> +
> +	for (i =3D 0; i < nfc->caps->nuser_data_tab; i++) {
> +		if (len =3D=3D nfc->caps->user_data_len_tab[i]) {
> +			found =3D true;
> +			break;
> +		}
> +	}
> +
> +	if (!found) {
> +		dev_warn(nfc->dev,
> +			 "Unsupported length for user data reg: %d\n", len);
> +		return;
> +	}
> +
> +	val =3D readl(nfc->regs + NFC_REG_USER_DATA_LEN(nfc, step));
> +
> +	val &=3D ~NFC_USER_DATA_LEN_MSK(step);
> +	val |=3D field_prep(NFC_USER_DATA_LEN_MSK(step), i);
> +	writel(val, nfc->regs + NFC_REG_USER_DATA_LEN(nfc, step));
> +}
> +
>  static void sunxi_nfc_hw_ecc_set_prot_oob_bytes(struct nand_chip *nand,
>  						const u8 *oob, int step,
>  						bool bbm, int page)
> @@ -858,6 +964,8 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_ch=
ip *nand,
>  	if (ret)
>  		return ret;
> =20
> +	sunxi_nfc_reset_user_data_len(nfc);
> +	sunxi_nfc_set_user_data_len(nfc, 4, 0);
>  	sunxi_nfc_randomizer_config(nand, page, false);
>  	sunxi_nfc_randomizer_enable(nand);
>  	writel(NFC_DATA_TRANS | NFC_DATA_SWAP_METHOD | NFC_ECC_OP,
> @@ -968,6 +1076,8 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct n=
and_chip *nand, uint8_t *buf
>  		return ret;
> =20
>  	sunxi_nfc_hw_ecc_enable(nand);
> +	sunxi_nfc_reset_user_data_len(nfc);
> +	sunxi_nfc_set_user_data_len(nfc, 4, 0);
>  	sunxi_nfc_randomizer_config(nand, page, false);
>  	sunxi_nfc_randomizer_enable(nand);
> =20
> @@ -1100,6 +1210,8 @@ static int sunxi_nfc_hw_ecc_write_chunk(struct nand=
_chip *nand,
> =20
>  	sunxi_nfc_randomizer_config(nand, page, false);
>  	sunxi_nfc_randomizer_enable(nand);
> +	sunxi_nfc_reset_user_data_len(nfc);
> +	sunxi_nfc_set_user_data_len(nfc, 4, 0);
>  	sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, 0, bbm, page);
> =20
>  	writel(NFC_DATA_TRANS | NFC_DATA_SWAP_METHOD |
> @@ -1344,10 +1456,12 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct=
 nand_chip *nand,
>  	if (ret)
>  		goto pio_fallback;
> =20
> +	sunxi_nfc_reset_user_data_len(nfc);
>  	for (i =3D 0; i < ecc->steps; i++) {
>  		const u8 *oob =3D nand->oob_poi + (i * (ecc->bytes + 4));
> =20
>  		sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, i, !i, page);
> +		sunxi_nfc_set_user_data_len(nfc, 4, i);
>  	}
> =20
>  	nand_prog_page_begin_op(nand, page, 0, NULL, 0);
> @@ -2148,18 +2262,36 @@ static int sunxi_nfc_probe(struct platform_device=
 *pdev)
>  	if (irq < 0)
>  		return irq;
> =20
> +	nfc->caps =3D of_device_get_match_data(dev);
> +	if (!nfc->caps)
> +		return -EINVAL;
> +
>  	nfc->ahb_clk =3D devm_clk_get_enabled(dev, "ahb");
>  	if (IS_ERR(nfc->ahb_clk)) {
>  		dev_err(dev, "failed to retrieve ahb clk\n");
>  		return PTR_ERR(nfc->ahb_clk);
>  	}
> =20
> +	if (nfc->caps->has_mbus_clk) {
> +		nfc->mbus_clk =3D devm_clk_get_enabled(dev, "mbus");
> +		if (IS_ERR(nfc->mbus_clk)) {
> +			dev_err(dev, "No mbus clock specified\n");
> +			return PTR_ERR(nfc->mbus_clk);
> +		}
> +	}
> +
>  	nfc->mod_clk =3D devm_clk_get_enabled(dev, "mod");
>  	if (IS_ERR(nfc->mod_clk)) {
>  		dev_err(dev, "failed to retrieve mod clk\n");
>  		return PTR_ERR(nfc->mod_clk);
>  	}
> =20
> +	nfc->ecc_clk =3D devm_clk_get_optional_enabled(dev, "ecc");
> +	if (IS_ERR(nfc->ecc_clk)) {
> +		dev_err(dev, "failed to retrieve ecc clk\n");
> +		return PTR_ERR(nfc->ecc_clk);
> +	}
> +
>  	nfc->reset =3D devm_reset_control_get_optional_exclusive(dev, "ahb");
>  	if (IS_ERR(nfc->reset))
>  		return PTR_ERR(nfc->reset);
> @@ -2170,12 +2302,6 @@ static int sunxi_nfc_probe(struct platform_device =
*pdev)
>  		return ret;
>  	}
> =20
> -	nfc->caps =3D of_device_get_match_data(&pdev->dev);
> -	if (!nfc->caps) {
> -		ret =3D -EINVAL;
> -		goto out_ahb_reset_reassert;
> -	}
> -
>  	ret =3D sunxi_nfc_rst(nfc);
>  	if (ret)
>  		goto out_ahb_reset_reassert;
> @@ -2226,8 +2352,17 @@ static const u8 sunxi_ecc_strengths_a10[] =3D {
>  	16, 24, 28, 32, 40, 48, 56, 60, 64
>  };
> =20
> +static const u8 sunxi_ecc_strengths_h6[] =3D {
> +	16, 24, 28, 32, 40, 44, 48, 52, 56, 60, 64, 68, 72, 76, 80
> +};
> +
> +static const u8 sunxi_user_data_len_h6[] =3D {
> +	0, 4, 8, 12, 16, 20, 24, 28, 32
> +};
> +
>  static const struct sunxi_nfc_caps sunxi_nfc_a10_caps =3D {
>  	.has_ecc_block_512 =3D true,
> +	.has_mbus_clk =3D false,
>  	.reg_io_data =3D NFC_REG_A10_IO_DATA,
>  	.reg_ecc_err_cnt =3D NFC_REG_A10_ECC_ERR_CNT,
>  	.reg_user_data =3D NFC_REG_A10_USER_DATA,
> @@ -2242,11 +2377,13 @@ static const struct sunxi_nfc_caps sunxi_nfc_a10_=
caps =3D {
>  	.dma_maxburst =3D 4,
>  	.ecc_strengths =3D sunxi_ecc_strengths_a10,
>  	.nstrengths =3D ARRAY_SIZE(sunxi_ecc_strengths_a10),
> +	.max_ecc_steps =3D 16,
>  	.sram_size =3D 1024,
>  };
> =20
>  static const struct sunxi_nfc_caps sunxi_nfc_a23_caps =3D {
>  	.has_mdma =3D true,
> +	.has_mbus_clk =3D false,
>  	.has_ecc_block_512 =3D true,
>  	.reg_io_data =3D NFC_REG_A23_IO_DATA,
>  	.reg_ecc_err_cnt =3D NFC_REG_A10_ECC_ERR_CNT,
> @@ -2262,9 +2399,34 @@ static const struct sunxi_nfc_caps sunxi_nfc_a23_c=
aps =3D {
>  	.dma_maxburst =3D 8,
>  	.ecc_strengths =3D sunxi_ecc_strengths_a10,
>  	.nstrengths =3D ARRAY_SIZE(sunxi_ecc_strengths_a10),
> +	.max_ecc_steps =3D 16,
>  	.sram_size =3D 1024,
>  };
> =20
> +static const struct sunxi_nfc_caps sunxi_nfc_h616_caps =3D {
> +	.has_mdma =3D false, // H6 supports only chained descriptors

H6 or H616?

=46ix the comment.

Best regards,
Jernej

> +	.has_mbus_clk =3D true,
> +	.reg_io_data =3D NFC_REG_A23_IO_DATA,
> +	.reg_ecc_err_cnt =3D NFC_REG_H6_ECC_ERR_CNT,
> +	.reg_user_data =3D NFC_REG_H6_USER_DATA,
> +	.reg_user_data_len =3D NFC_REG_H6_USER_DATA_LEN,
> +	.reg_spare_area =3D NFC_REG_H6_SPARE_AREA,
> +	.reg_pat_id =3D NFC_REG_H6_PAT_ID,
> +	.reg_pat_found =3D NFC_REG_H6_PAT_FOUND,
> +	.random_en_mask =3D BIT(5),
> +	.random_dir_mask =3D BIT(6),
> +	.ecc_mode_mask =3D GENMASK(15, 8),
> +	.ecc_err_mask =3D GENMASK(31, 0),
> +	.pat_found_mask =3D GENMASK(31, 0),
> +	.dma_maxburst =3D 8,
> +	.ecc_strengths =3D sunxi_ecc_strengths_h6,
> +	.nstrengths =3D ARRAY_SIZE(sunxi_ecc_strengths_h6),
> +	.user_data_len_tab =3D sunxi_user_data_len_h6,
> +	.nuser_data_tab =3D ARRAY_SIZE(sunxi_user_data_len_h6),
> +	.max_ecc_steps =3D 32,
> +	.sram_size =3D 8192,
> +};
> +
>  static const struct of_device_id sunxi_nfc_ids[] =3D {
>  	{
>  		.compatible =3D "allwinner,sun4i-a10-nand",
> @@ -2274,6 +2436,10 @@ static const struct of_device_id sunxi_nfc_ids[] =
=3D {
>  		.compatible =3D "allwinner,sun8i-a23-nand-controller",
>  		.data =3D &sunxi_nfc_a23_caps,
>  	},
> +	{
> +		.compatible =3D "allwinner,sun50i-h616-nand-controller",
> +		.data =3D &sunxi_nfc_h616_caps,
> +	},
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, sunxi_nfc_ids);
>=20





