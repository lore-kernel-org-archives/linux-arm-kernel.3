Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA584C61DCB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Feb 2026 09:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6OTrcGA+pe/I4LHNfKbWhQqpu2uqCStywvB3RV+xvsk=; b=o2ngOXLSW6rLZgai6+vgq8LLMV
	JQ8qpM86pq743IAsPs3d3HrRWbsgVzUQyXt1X/o0L3Dr02Fle2ns6VkgW34YBlErncMAR1Ej2bzCy
	wW3gPyQDxKKOacMWr9/AY3QvonAS72QsQyamRbvNWZa0PfLzrO8sGb2bTQQpO97fEr4QhuxGM8yz+
	QBP73TIJPcjEPNIoVOcQkD3wWyR2zjH2eK7RQN/6BERuZKX7RcWGnL/wDWf3fm2I/KeW4/KCsGmRH
	xzcJ9wqTihdnOk158l/i4UtQwtjMDGRSZVpHZL/d6CzZeeFdenfubwSkX6mGMqLyqRqYz8XXyhcb4
	aRjUheiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtjTC-0000000FwiB-2EyF;
	Sat, 21 Feb 2026 09:40:14 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtjT6-0000000Fwdy-47xe
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Feb 2026 09:40:10 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-48375f1defeso20119115e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Feb 2026 01:40:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771666807; x=1772271607; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6OTrcGA+pe/I4LHNfKbWhQqpu2uqCStywvB3RV+xvsk=;
        b=l8/IxdnHTwaAjwFnDewrf/Tg7p1Z4CubhW8CKDuxocuFQw6ZPcBnLqLUNwT2NJIO7I
         m+hlhd5reqAOAq2ZHQFrWgigQKU/iXJfA7JsX5UqENPpE3KYzYtXpwpjMv++gfd30BmQ
         sS7zLl5krvFjAYTmfOmKuLh3rNTcdgUNVgbPNrQZLZLE6BzwSxoqF4R58VLT1keFy5oW
         jQ0IGffS92NKgRg/uLyaFL6U77uAyYFdXNljcRle9yKD8WaD/dTvwBZoZQ0h9ODS7ejB
         0C11V/UVsKKgExotKwKXnFpA/fPoZAB98vtHioeSwkfmoTD8FxjwMOJGhux+85NOHVYo
         jX7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771666807; x=1772271607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6OTrcGA+pe/I4LHNfKbWhQqpu2uqCStywvB3RV+xvsk=;
        b=M75qjJABe5kdNvRoyc05hRaP3fWVp9+2D+cHrwg6VZMw0tQ07XJhJUB2Fxq15knFra
         MtaTkaRNdfDAqj6r9Xh1lztjaRaMcQ+mXLO2RItzzT3NK5UmgVyWCLkmIdbGUjOvejXt
         KA/ooCp+V9b+MkrUDyQ3ueB1ArDgeOlKgfkFGHqKRBAeQZQ5AZUCR4Zmp9NPHDHH/yh9
         sQ6LqaXqWbW+jDOaGGfYzFBm2WhaFU62g1ZeNWYfaWuBHPjUUKcvcU/+c8rAgjT8eaeH
         lRZRuZYTdcusUbnwRfnSRuV3bFrxzut19Of00LmMgOwBygTtT6qe4gq9JQTi4Jq9Pia+
         zP+A==
X-Forwarded-Encrypted: i=1; AJvYcCU3MlYE1uFlb5UL48itzSZtPBdqJle00ibuBbovVdaOmneK+j7IfuaGLKjngXLwqJ9hsDRHcNM6BMz2OuETq3Kb@lists.infradead.org
X-Gm-Message-State: AOJu0YxGDvkpbd548FLMsNKHuekLfElCCyGx+1E1tV2tr3PtEAo0gBZN
	3j9bXqq1q8cfexQtqe0aP2f1j66yDo8DWHsCnA2sewEZHzfQHaKNJhfG
X-Gm-Gg: AZuq6aIZ1mSQJxnjUBpvvrtcMlifnrkw1PSrUfMklRlrLAAu+klDa3fpaJvAl+9HuVV
	vcUNK3LV0pW0mhiPGSZ4ZpicwGPQGRWzdlKgZfiTRTKsGyUZ2kPgE9akbV1ul5FyLSCPrxyY3Zm
	sXOixShJy43STXRwhMNk7M15I0t2ypIzJcYCpu1l2SjPUkyaeUipk4b3Qdxg3HsqMMkCbmD6Nu9
	U9QvppAZ6YTsGOu4Uknaw9k2bHW86SJIGYgZMIN1aAjIIRLNG//uYtHRqQghsjmWpfKmzEler3/
	39L6OcPS3MuFPhwqyMrmAKwwDuZ+7ipAB1bc9gBJL0G87L9orZ26LccSh3tsHTMu726D2hW5e2l
	2X+Zf7ES4Qx27/P6S+O4XC4a+5mySpM6L+wl38ez7nBIVQquuJryqJC+YiC7Ly1+bfBzTnKCKMN
	Cz3rz2CuggoBXlof2+3HRoCa98NdGZR+BrmIeY+bSiGg42JKyVkORSyMC000aMKnpkxVPxDLdBu
	bbbaWf2
X-Received: by 2002:a05:600c:5020:b0:47e:e2ec:995b with SMTP id 5b1f17b1804b1-483a95fb29cmr44815955e9.9.1771666806876;
        Sat, 21 Feb 2026 01:40:06 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-126-118.dynamic.telemach.net. [86.58.126.118])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31efe02sm135100995e9.10.2026.02.21.01.40.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Feb 2026 01:40:06 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Richard Genoud <richard.genoud@bootlin.com>
Cc: Wentao Liang <vulab@iscas.ac.cn>, Maxime Ripard <mripard@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Richard Genoud <richard.genoud@bootlin.com>
Subject: Re: [PATCH 3/6] mtd: rawnand: sunxi: do not count BBM bytes twice
Date: Sat, 21 Feb 2026 10:21:55 +0100
Message-ID: <1947198.tdWV9SEqCh@jernej-laptop>
In-Reply-To: <20260220161011.999642-4-richard.genoud@bootlin.com>
References: <20260220161011.999642-1-richard.genoud@bootlin.com>
 <20260220161011.999642-4-richard.genoud@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260221_014009_058108_53A217F4 
X-CRM114-Status: GOOD (  26.25  )
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

Dne petek, 20. februar 2026 ob 17:10:08 Srednjeevropski standardni =C4=8Das=
 je Richard Genoud napisal(a):
> BBM is part of USER_DATA section, so we should remove it twice
>=20
> This was working ok because we are on the safe size, advertising that
> there was 2 bytes less available than reality.

Missing "in" before "reality".

>=20
> But we can't change old platforms, since it may lead to a different ECC
> strength, so, introduce a legacy flag for old platforms, and switch the
> new platforms to the correct count.

There aren't any users of H6/H616 driver, right? If it would be, ECC streng=
th
can't be changed, since it can impact systems, which already use it.

Best regards,
Jernej

>=20
> Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
> ---
>  drivers/mtd/nand/raw/sunxi_nand.c | 23 ++++++++++++++++++++---
>  1 file changed, 20 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sun=
xi_nand.c
> index 9c6e0625e34f..99d305bbda53 100644
> --- a/drivers/mtd/nand/raw/sunxi_nand.c
> +++ b/drivers/mtd/nand/raw/sunxi_nand.c
> @@ -281,6 +281,8 @@ static inline struct sunxi_nand_chip *to_sunxi_nand(s=
truct nand_chip *nand)
>   * @has_ecc_block_512:	If the ECC can handle 512B or only 1024B chuncks
>   * @has_ecc_clk:	If the controller needs an ECC clock.
>   * @has_mbus_clk:	If the controller needs a mbus clock.
> + * @legacy_max_strength:If the maximize strength function was off by 2 b=
ytes
> + *			NB: this should not be used in new controllers
>   * @reg_io_data:	I/O data register
>   * @reg_ecc_err_cnt:	ECC error counter register
>   * @reg_user_data:	User data register
> @@ -310,6 +312,7 @@ struct sunxi_nfc_caps {
>  	bool has_ecc_block_512;
>  	bool has_ecc_clk;
>  	bool has_mbus_clk;
> +	bool legacy_max_strength;
>  	unsigned int reg_io_data;
>  	unsigned int reg_ecc_err_cnt;
>  	unsigned int reg_user_data;
> @@ -1811,10 +1814,22 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nan=
d_chip *nand,
>  		ecc->size =3D 1024;
>  		nsectors =3D mtd->writesize / ecc->size;
> =20
> -		/* Reserve 2 bytes for the BBM */
> -		bytes =3D (mtd->oobsize - 2) / nsectors;
> +		/*
> +		 * The 2 BBM bytes should not be removed from the grand total,
> +		 * because they are part of the USER_DATA_SZ.
> +		 * But we can't modify that for older platform since it may
> +		 * result in a stronger ECC at the end, and break the
> +		 * compatibility.
> +		 */
> +		if (nfc->caps->legacy_max_strength)
> +			bytes =3D (mtd->oobsize - 2) / nsectors;
> +		else
> +			bytes =3D mtd->oobsize / nsectors;
> =20
> -		/* 4 non-ECC bytes are added before each ECC bytes section */
> +		/*
> +		 * USER_DATA_SZ non-ECC bytes are added before each ECC bytes
> +		 * section, they contain the 2 BBM bytes
> +		 */
>  		bytes -=3D USER_DATA_SZ;
> =20
>  		/* and bytes has to be even. */
> @@ -2379,6 +2394,7 @@ static const u8 sunxi_user_data_len_h6[] =3D {
> =20
>  static const struct sunxi_nfc_caps sunxi_nfc_a10_caps =3D {
>  	.has_ecc_block_512 =3D true,
> +	.legacy_max_strength =3D true,
>  	.reg_io_data =3D NFC_REG_A10_IO_DATA,
>  	.reg_ecc_err_cnt =3D NFC_REG_A10_ECC_ERR_CNT,
>  	.reg_user_data =3D NFC_REG_A10_USER_DATA,
> @@ -2400,6 +2416,7 @@ static const struct sunxi_nfc_caps sunxi_nfc_a10_ca=
ps =3D {
>  static const struct sunxi_nfc_caps sunxi_nfc_a23_caps =3D {
>  	.has_mdma =3D true,
>  	.has_ecc_block_512 =3D true,
> +	.legacy_max_strength =3D true,
>  	.reg_io_data =3D NFC_REG_A23_IO_DATA,
>  	.reg_ecc_err_cnt =3D NFC_REG_A10_ECC_ERR_CNT,
>  	.reg_user_data =3D NFC_REG_A10_USER_DATA,
>=20





