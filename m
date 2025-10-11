Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEB94CCA476
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Oct 2025 10:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OqyDNC67ubeb2tHQvs3zOoppHPgwgyf6ppd+sV61gUM=; b=Yh/3dUQojBmUD5FU+fyxKIIOrg
	ZaeZf0uk8VezGbtX2r2LmRYCHLOVAuSTXTUblbykw8uTWokQ+GtcsnRORtbcWwf7QQjqxO4MMnkQH
	yuPB8qi02BVbINkoO/8tcztDMuJOSdhWECihjn2M/vDSKirr9udMbZoDGnukxLMX/vhJD6LPsl5by
	8TyFeQQm4L8OlMq9ubA2M3nyJHUg2g7SLb+zyCaMe0pKQoRk4F2JWDKSQVSHbJYgaISu5RbrEcuSy
	cXfOccPyZ2EnreUaDsgorSXY8tSit3Qc7UbWwnrfQB+LQNkqHua1/piMlb2BhZLulnhEQo5F4wfq1
	vrOai6gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7X35-0000000A31g-3lhE;
	Sat, 11 Oct 2025 10:42:03 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7X33-0000000A30t-0gEH
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Oct 2025 10:42:02 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-6394938e0ecso4583548a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Oct 2025 03:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760179319; x=1760784119; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OqyDNC67ubeb2tHQvs3zOoppHPgwgyf6ppd+sV61gUM=;
        b=lVo53pO00co/CuMIjaulH/CrkaF2jGCE9a8YN6PjOjmOzkWLSiThzXfy/Azke+Gfeb
         rlRUJEWGdoe9QLDk7exn8ODiFSS8eSFWZomkKX4/L0yplUIbEXXCEQoN96Tb13uHeyuo
         xyixldb6Gy8YBsPr7DM7nvA+TuT80Qc9EOqfS1SrKafsORkzhpTRUKdRK+aPCGKEnvLl
         9iFumU4VcCvAsXE6do6p20B5Ws8zDkjK96cxJST98sZ6G+mtYkJLCWA3ukSeuaxDDjMW
         ixFjOXqyVgqsm5TjMeU0uXTrOBejw4CM6zwAAmo5Jq6oyBBdDwmehDFevk3Qa2O08AYc
         neUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760179319; x=1760784119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OqyDNC67ubeb2tHQvs3zOoppHPgwgyf6ppd+sV61gUM=;
        b=c0xYeuyrmQaJ1tg+3G/WulXTkd6M654tdIB02rE2p7ZVLug8BZYUHHhUpbmWx3UOzL
         7sJczOXt73kDC4cjhL5RdnR0UiPDsJUFl6ymsVfjwiLzOpdaxtcdF9ib6gDkxiWESEOe
         uMVljzMWW9Wh8SqDTEFifC+IR3jqsrQtswDLG36O8fEvwCbwuaTGNYupU6SF/y0JfdUS
         AWjCrZWETaRxXb+ksP0R3D2+jbKVIxF/kG9SZkWWrveYQ8bLJECtBtIv5oBEdIS9SyKT
         ytmyZrEDRozPXqdnBsiQByFNWv7aZHrySlfxOoXYwFbypqj5MFz4A0md3+6aNeoD5kK+
         nqpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgA+sgGIXsousoaa+HmlSmJpPv2e8Al7cASABS+xRX/QRfLpetfjshbE6DAZVYVF9uFNiGN3y4yk6wnH1c1Dnd@lists.infradead.org
X-Gm-Message-State: AOJu0Ywg5w3jpYo8KTnnS9swIegCG1NsDHTZlnrlUuM4NPEr4H8MJLNX
	9Bu3GUYLN+SQpQyjSH9qK+DNf7qAJfUDWqc4v5JjDKoq6Px7EIUZkAPw
X-Gm-Gg: ASbGncvFBEiL5icpL/hEtNaBuRdy1BHQ6MH2YcAOQDW6Z/Dbar4H2QFHKb27xMI41ST
	YibHGxo9qBS+/o2Lpt87oyR2ZTDHnPR+oGsARfQpjDmjDzcUz9TGU7vFXX7yqNqSLJc2pgXrkYG
	O85Drxo6+C+BWFBmYPXsGgGeCvgYb9ADxK5MPNSJodBObe/cTOQmxvUI0+G1fUG658CVVHNI1Ts
	ksAfQeZ3UqOcsiq3MYT3FdXe25lCPxGZqIO1wR9QchFx+C1m29OgEknIV8zhliASTpH8+daMb7f
	XGWJSW9VENrk/I9ytG+hQP/kdiVFLq2ReqKRAE8JP7EADarcxf4FWB79nGzxSynN7wYyLmZXYoy
	+vPNgqOQgrrVTWkke1QSV7VI4ro6Q3ut5N1Uoui/5g7mUggEwssi+/n0J8JvvhE8=
X-Google-Smtp-Source: AGHT+IFniI0WsDXjo4z3UaAWm2jZN00980pqXioaMnWWaQ/4U3UhS7uWYQBxdSYInHj9x0mV1hCBAA==
X-Received: by 2002:a05:6402:5106:b0:634:544b:a756 with SMTP id 4fb4d7f45d1cf-639d5c59407mr12973844a12.32.1760179319203;
        Sat, 11 Oct 2025 03:41:59 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63a52b10072sm4482832a12.16.2025.10.11.03.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Oct 2025 03:41:58 -0700 (PDT)
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
Subject: Re: [PATCH 04/15] mtd: nand: sunxi: move ecc strenghts in sunxi_nfc_caps
Date: Sat, 11 Oct 2025 12:41:56 +0200
Message-ID: <13861163.uLZWGnKmhe@jernej-laptop>
In-Reply-To: <20251010084042.341224-5-richard.genoud@bootlin.com>
References: <20251010084042.341224-1-richard.genoud@bootlin.com>
 <20251010084042.341224-5-richard.genoud@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251011_034201_248960_B5CC3B9B 
X-CRM114-Status: GOOD (  20.12  )
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

Hi!

Dne petek, 10. oktober 2025 ob 10:40:31 Srednjeevropski poletni =C4=8Das je=
 Richard Genoud napisal(a):
> H6/H616 has more ecc strenghts.
> This commit prepares the change.
> No functional change.

=46ormat looks weird. Reword message to something like moving ecc to caps w=
hich
will allow expand support for newer cores.

Also, there should be empty line before "No functional change."

Best regards,
Jernej

>=20
> Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
> ---
>  drivers/mtd/nand/raw/sunxi_nand.c | 20 ++++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sun=
xi_nand.c
> index 10a48e0d361f..198dd40f9220 100644
> --- a/drivers/mtd/nand/raw/sunxi_nand.c
> +++ b/drivers/mtd/nand/raw/sunxi_nand.c
> @@ -213,11 +213,15 @@ static inline struct sunxi_nand_chip *to_sunxi_nand=
(struct nand_chip *nand)
>   *			through MBUS on A23/A33 needs extra configuration.
>   * @reg_io_data:	I/O data register
>   * @dma_maxburst:	DMA maxburst
> + * @ecc_strengths:	Available ECC strengths array
> + * @nstrengths:		Size of @ecc_strengths
>   */
>  struct sunxi_nfc_caps {
>  	bool has_mdma;
>  	unsigned int reg_io_data;
>  	unsigned int dma_maxburst;
> +	const u8 *ecc_strengths;
> +	unsigned int nstrengths;
>  };
> =20
>  /**
> @@ -1619,9 +1623,9 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_=
chip *nand,
>  				       struct nand_ecc_ctrl *ecc,
>  				       struct device_node *np)
>  {
> -	static const u8 strengths[] =3D { 16, 24, 28, 32, 40, 48, 56, 60, 64 };
>  	struct sunxi_nand_chip *sunxi_nand =3D to_sunxi_nand(nand);
>  	struct sunxi_nfc *nfc =3D to_sunxi_nfc(nand->controller);
> +	const u8 *strengths =3D nfc->caps->ecc_strengths;
>  	struct mtd_info *mtd =3D nand_to_mtd(nand);
>  	struct nand_device *nanddev =3D mtd_to_nanddev(mtd);
>  	int nsectors;
> @@ -1645,7 +1649,7 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_=
chip *nand,
> =20
>  		ecc->strength =3D bytes * 8 / fls(8 * ecc->size);
> =20
> -		for (i =3D 0; i < ARRAY_SIZE(strengths); i++) {
> +		for (i =3D 0; i < nfc->caps->nstrengths; i++) {
>  			if (strengths[i] > ecc->strength)
>  				break;
>  		}
> @@ -1666,7 +1670,7 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_=
chip *nand,
>  	}
> =20
>  	/* Add ECC info retrieval from DT */
> -	for (i =3D 0; i < ARRAY_SIZE(strengths); i++) {
> +	for (i =3D 0; i < nfc->caps->nstrengths; i++) {
>  		if (ecc->strength <=3D strengths[i]) {
>  			/*
>  			 * Update ecc->strength value with the actual strength
> @@ -1677,7 +1681,7 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_=
chip *nand,
>  		}
>  	}
> =20
> -	if (i >=3D ARRAY_SIZE(strengths)) {
> +	if (i >=3D nfc->caps->nstrengths) {
>  		dev_err(nfc->dev, "unsupported strength\n");
>  		return -ENOTSUPP;
>  	}
> @@ -2167,15 +2171,23 @@ static void sunxi_nfc_remove(struct platform_devi=
ce *pdev)
>  		dma_release_channel(nfc->dmac);
>  }
> =20
> +static const u8 sunxi_ecc_strengths_a10[] =3D {
> +	16, 24, 28, 32, 40, 48, 56, 60, 64
> +};
> +
>  static const struct sunxi_nfc_caps sunxi_nfc_a10_caps =3D {
>  	.reg_io_data =3D NFC_REG_A10_IO_DATA,
>  	.dma_maxburst =3D 4,
> +	.ecc_strengths =3D sunxi_ecc_strengths_a10,
> +	.nstrengths =3D ARRAY_SIZE(sunxi_ecc_strengths_a10),
>  };
> =20
>  static const struct sunxi_nfc_caps sunxi_nfc_a23_caps =3D {
>  	.has_mdma =3D true,
>  	.reg_io_data =3D NFC_REG_A23_IO_DATA,
>  	.dma_maxburst =3D 8,
> +	.ecc_strengths =3D sunxi_ecc_strengths_a10,
> +	.nstrengths =3D ARRAY_SIZE(sunxi_ecc_strengths_a10),
>  };
> =20
>  static const struct of_device_id sunxi_nfc_ids[] =3D {
>=20





