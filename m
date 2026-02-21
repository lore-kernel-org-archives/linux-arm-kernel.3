Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0608CC61DDE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Feb 2026 09:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1SRt4pEujAjZL7YcRKGKgR1k7mcODZZuIAG7QjvJr7M=; b=nGXHnyXQ1YB/h/2aM2RIRwnFfI
	96cDf1sVq0uOuk5ARPbZXEcs9lSwZoDzX7Tj6A5XCdgnwXobLVPIrTzFRcUEv9mQVj68XTIN7KRNb
	sxmxoElQt2+TzH9GkGO7I3LZvx4hUAE4e5kED3urX5WugsTIoIwiTUbSfydqfZxrICGAIdNmlAHgB
	g8b9uMv298iOUKfE/OSNQywejSCarSKI76rIUgTjIFxVYVNGPBK6nv6YpqWu/IZ+NkrALSpPSvi06
	kMpJTg/BsSDh0obj+1hMV4wxMscSXiQzh9hCe53ggZmA/uzq9fcFi12xc2pNnWMrx0H5TrSu0XQOo
	VzPKd0iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtjT8-0000000Fwfe-3zhF;
	Sat, 21 Feb 2026 09:40:10 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtjT5-0000000Fwck-1Eaw
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Feb 2026 09:40:08 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4837584120eso20480335e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Feb 2026 01:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771666805; x=1772271605; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1SRt4pEujAjZL7YcRKGKgR1k7mcODZZuIAG7QjvJr7M=;
        b=PuCvvZoy/caE4lDDbQgG/6EqTu23boHe6m+Vv2R+OTqA60Le4kuhEOT9MdKTQscchR
         qA3BxBuZ+oYleYU7ZbmcWJV6/BGCehSFP0Rg8VfMF7sHX8XkmDh88UUw1m0GVcIYieAb
         OTiLPJrrB57uljelwkLlibpAL9E2k7cnQmmf0tQppy7vEwpDPYFAHNirEUbVsXNabKNQ
         y5PVmNBSGZUYbof6BiOkLnU8FFCPUPZ4/ueIRT/oxrpmUFd4HGSZ9GREM5yFrSOBzWsQ
         iQAFZgXBzlblXsKFxeHkqjOnKeIBIkQZpQmVzC3FAaGNZao8ZcKPhiJjMi7ShA7BRn8a
         WEDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771666805; x=1772271605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1SRt4pEujAjZL7YcRKGKgR1k7mcODZZuIAG7QjvJr7M=;
        b=O3XCUdbynN9ybSr9xeA2wg8eB8X5T3FlpOEGaGE/6iWrZ4sInLBN/bTthx7QBXxkSD
         Ojn4DAfkWYRhNBOUgECpNGRDe/yLsGnzF3jYUmUwh7LiquqtevbWFX9v2IoHaIMW0pEd
         Mz0cyZWvDTH8RruIunlAOwPtMsYb242gQLmKSl3g1dbJtAeUTOxFHJI97SoQ34RZmF2P
         FOzaBhagsF5YriFm9gDL5hMWu6eLWeUGAXR3medD8mPi85qXbneszwr1o3i0TFqjVNaF
         S5fUw42epEvxnk/g/h+EFSmvdQ8a826hEezan276V1NAA3FgvxRSRSeJ7bvSZAHFBOTu
         7cZg==
X-Forwarded-Encrypted: i=1; AJvYcCVifYRXq7lKMGFkdCZm135D4oU7twOu0IB1qe33PRudu4gJu9gHRLGOHqZ7eQicAtMsX6tnnprlHcpoOVFOJTyq@lists.infradead.org
X-Gm-Message-State: AOJu0YwrTrHJSoW2ddbDwmK2aXL/4GuWEpk9AYxBc/CetZQvHuR6sXAR
	vcQLRd8k5frpHoASMA3hQ/uRSl7OjOEZk8iAdj1AC68z5qW/SzhrUazI
X-Gm-Gg: AZuq6aJ+yvt7za73QIX3V8oLV9FCKEn5dCb0r7FrBG8+4gVXujelsFnfZytIjDieqg3
	SniDE7QpXwLOymWzhucnvAbWU+vATaAC51b1dwlPS4f1p53O8nR1ptR7yYD9g4pwGTEWf1o410+
	7OwrcP/eIMJCOtdr/OraA5ZTslKSUHSg6ZTl4GNuAGz3UxCVu6cAnhHLlp3EpT4gPU6dnunv+wH
	Sz1JQ19x6sDJfTjOvX7EJWhViYE58A71HhwYi1x89OnHeQXINgblma4so6gI9geen8UfduH9Ydt
	eNnAZK8QDzApWP3ZwgWhYThbQT2n+iW0li2L9VDK0o6RObD84EdJqVUfmy+JzyfjpW+XkUC98V7
	Xz1ShplTVAwy/aokVz+IvC9S/L8KPQgYMXz+8ooSFo2f8/2QIFhhCclj1Oy1BhrvFJCDELjgP2s
	ZEjcF0poDXAjxbtQpcp4w4rFU87URtRZElUOPwzGHR5rX+GBwZ1NiEP6ayjKFdY/2E/4yNpMg8s
	3DqLPeMtU7WKbT7RoU=
X-Received: by 2002:a05:600c:608f:b0:477:7ae0:cd6e with SMTP id 5b1f17b1804b1-483a95bd7e8mr38778385e9.5.1771666805222;
        Sat, 21 Feb 2026 01:40:05 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-126-118.dynamic.telemach.net. [86.58.126.118])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a9caadd4sm41900045e9.11.2026.02.21.01.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Feb 2026 01:40:04 -0800 (PST)
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
Subject: Re: [PATCH 4/6] mtd: rawnand: sunxi: replace hard coded value by a define -
 take2
Date: Sat, 21 Feb 2026 10:23:33 +0100
Message-ID: <13952574.uLZWGnKmhe@jernej-laptop>
In-Reply-To: <20260220161011.999642-5-richard.genoud@bootlin.com>
References: <20260220161011.999642-1-richard.genoud@bootlin.com>
 <20260220161011.999642-5-richard.genoud@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260221_014007_346201_DBA6C65F 
X-CRM114-Status: GOOD (  18.37  )
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

Dne petek, 20. februar 2026 ob 17:10:09 Srednjeevropski standardni =C4=8Das=
 je Richard Genoud napisal(a):
> The user data length (4) has been replaced almost all over the file, but
> 2 places were forgotten.
>=20
> The user data is placed before the ECC, for each step.
> So, in sunxi_nfc_hw_ecc_read_extra_oob(), the offset of the user data in
> OOB is indeed ((ecc->bytes + USER_DATA_SZ) * ecc->steps);
>=20
> And in sunxi_nand_ooblayout_ecc(), the offset of the ECC chunk in OOB is
> the same offset plus the current user data size:
> section * (ecc->bytes + USER_DATA_SZ) + USER_DATA_SZ;
>=20
> Fixes: 1be7ac78b72f ("mtd: rawnand: sunxi: Replace hard coded value by a =
define")
> Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>

This doesn't really need Fixes tag since it's only refactoring.

With that said:
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/mtd/nand/raw/sunxi_nand.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sun=
xi_nand.c
> index 99d305bbda53..5d925b59b618 100644
> --- a/drivers/mtd/nand/raw/sunxi_nand.c
> +++ b/drivers/mtd/nand/raw/sunxi_nand.c
> @@ -1051,7 +1051,7 @@ static void sunxi_nfc_hw_ecc_read_extra_oob(struct =
nand_chip *nand,
>  {
>  	struct mtd_info *mtd =3D nand_to_mtd(nand);
>  	struct nand_ecc_ctrl *ecc =3D &nand->ecc;
> -	int offset =3D ((ecc->bytes + 4) * ecc->steps);
> +	int offset =3D ((ecc->bytes + USER_DATA_SZ) * ecc->steps);
>  	int len =3D mtd->oobsize - offset;
> =20
>  	if (len <=3D 0)
> @@ -1747,7 +1747,7 @@ static int sunxi_nand_ooblayout_ecc(struct mtd_info=
 *mtd, int section,
>  	if (section >=3D ecc->steps)
>  		return -ERANGE;
> =20
> -	oobregion->offset =3D section * (ecc->bytes + USER_DATA_SZ) + 4;
> +	oobregion->offset =3D section * (ecc->bytes + USER_DATA_SZ) + USER_DATA=
_SZ;
>  	oobregion->length =3D ecc->bytes;
> =20
>  	return 0;
>=20





