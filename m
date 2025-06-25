Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B5A8C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 20:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uWKkFAFg9O1FS34EdKG7yTUZEGesEzF1QQfwKchWpik=; b=wGf/oyZgBOmVmlT+4V1hX1TaGB
	DgaYmC4DQjttLTvooEznyx/dueqtk53Qg0dHq8bvh0u+wcyyoXS154nN/+/nCQU2/SY3168ItPJde
	1pvDtQw1ToyDNAFz1EaXIO6DByd/C06zcSKWK0ZY66/Vn2UG1jbDIatLWV3WG+VQ74S3bP+Mu0hrB
	LhZ+FuR8Enh2fTyCTxb6rxlNqWebB+dqueWZUgbY9gp6O9lFDk7eOEHmEEH8Y9FXnK/Fs8MFDtAtA
	ZBXDzNhLj5B5yXHHC/DtVbLfFOzkAWh0cdj4qj1lTmlcxnrbvBREAZAn6fNfVRJkS+hwjJy9CveZD
	cgpSj9vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUWIL-00000009ne9-1vNF;
	Wed, 25 Jun 2025 20:00:33 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUSc6-00000009DZx-0tzn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 16:04:43 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3a6d1369d4eso1257495f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Jun 2025 09:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750867480; x=1751472280; darn=lists.infradead.org;
        h=in-reply-to:references:to:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uWKkFAFg9O1FS34EdKG7yTUZEGesEzF1QQfwKchWpik=;
        b=CORx8j7CXUCdAmRgLiAT3lFmRVWv7uyk7EJrdH6dVEe9b67IixWYaUI5hHXIR0PwiR
         /PqHi1IEPQZ4ZzWsxyQe3keR6cPpxVzVNbWtoVcboTNO/W37ZX9z0rpmNU8Dra5a8c2Z
         5VAWq1gHh3GHYVlerKpCbcBX6FaKW+2jCoLj2yzTnBD8KmwoOXyJkA77M+TVCLdCDwLM
         myL+e7tkep6kv5OE3hIDndcH0bId674ERIVORTWOnBh56N2ol1kMrxXP1nrDsfPg1poU
         MtImhuySmyJerj4OG/7hPhDJVuvGMLcjJEC2EZ/j/70OklZyXrVyCNEiQ7Zri+g4zsCg
         NW5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750867480; x=1751472280;
        h=in-reply-to:references:to:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uWKkFAFg9O1FS34EdKG7yTUZEGesEzF1QQfwKchWpik=;
        b=vAp/wMtssbYeSlFuyTrsLoXPIwxqQAFBMr7AXevqgXVLhrmXwLU12b9SNSHg4rD5Jr
         Hklrc+aEhk0Rm3b6hZKxNl4Pwf2GpQU4fw00xYBtT2dcIBGRDBWWoAtOz13icGFCpOIZ
         c5B3A85twI5OObQ7Rk3ZUcY3Hp055QdEr2Yx3OIcT42/4H7YBIBkfKgurxoAunnJRTBw
         oOjy/EIQ25wPCQe6eCgevK9ytohGa5ONE6JK7RU9hIftjtpcMsShBPOtK5EKDiupHZRf
         40K2dcA8g1xij2NaSdUcAe/B5xPBUL8KL8Gm7T/7uMtPxg8RmSQQLlNeghd/S04zBc+4
         /O5g==
X-Forwarded-Encrypted: i=1; AJvYcCW+R/8z/UaFjr8AHNLF65lOcBplMIlJjrB/rRZ67MwMdktX39slJA8YRVu92eZeeKNVmJKYkpgvEDzjA40v6Cuf@lists.infradead.org
X-Gm-Message-State: AOJu0YxkziG3Y3/cDGLf68ab7ofZm9Es4Va1Y9oR0g9sofX5feh+Q3nI
	xnMveFYj/EwQ5nMNdq0rppFa4GAizGd5aOgJuStBaYLolyHA9aj+UsLS
X-Gm-Gg: ASbGncvVlgis9CcExxb7K8oZPwa/db5AxRSfgfDk4N94yrlPseyoHXcTH+djszsX68q
	gNSGXQXupJK1BVaX4loqRkDHpCnegcNxDoHd4JfON1387B1Azcfu0XSaeGA/45ytMl74Wu3bn2L
	XUUKL3YFnIrUkLZkhMQ4RxHn609gP2i0hy0DSHriF/o59TtpllPiDT8dyfFjMST/11D0eSTLvkI
	LRl6WOFowegKuo10glF1/7GrIxGTDUXOopgyTajiYHg7omcRbYEGgAdVzLjJnO6SLVmFXg+E1Bu
	G/EEeagsG6l0DIaYZNlANbNiujBfbrb1uRmBxGOGtz0ESQt+RJJsb6MchRCud+6bLShlqwpASXX
	N06HZ54dRa2vIViAlzAd4FjaW
X-Google-Smtp-Source: AGHT+IGwdBKEOpjpvucseGnRqSYsFTVnLPoA4uCi0Dyrn7S/hacATqeX4eEhHO0U4z09yQRUY40vHQ==
X-Received: by 2002:a05:6000:230d:b0:3a4:dcb0:a5f with SMTP id ffacd0b85a97d-3a6f2e8e330mr249814f8f.16.1750867479407;
        Wed, 25 Jun 2025 09:04:39 -0700 (PDT)
Received: from localhost (a95-94-245-170.cpe.netcabo.pt. [95.94.245.170])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a6e8109e1asm4934842f8f.84.2025.06.25.09.04.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 09:04:38 -0700 (PDT)
From: Rui Miguel Silva <rmfrfs@gmail.com>
X-Google-Original-From: "Rui Miguel Silva" <rui.silva@linaro.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Jun 2025 17:04:37 +0100
Message-Id: <DAVQPZC0K30N.308T7KKXHN7N1@linaro.com>
Cc: "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>, "Martin
 Kepplinger" <martink@posteo.de>, "Purism Kernel Team" <kernel@puri.sm>,
 "Mauro Carvalho Chehab" <mchehab@kernel.org>, "Shawn Guo"
 <shawnguo@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Fabio Estevam"
 <festevam@gmail.com>, "Hans Verkuil" <hverkuil@xs4all.nl>,
 <linux-media@vger.kernel.org>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH] media: imx8mq-mipi-csi2: Fix error code in
 imx8mq_mipi_csi_parse_dt()
To: "Dan Carpenter" <dan.carpenter@linaro.org>, "Frank Li"
 <Frank.Li@nxp.com>, "Rui Miguel Silva" <rmfrfs@gmail.com>
References: <9b6c7925-c9c4-44bd-acd5-1ef0e698eb87@sabinyo.mountain>
In-Reply-To: <9b6c7925-c9c4-44bd-acd5-1ef0e698eb87@sabinyo.mountain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_090442_252778_34EEBDD3 
X-CRM114-Status: GOOD (  14.59  )
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

Hey Dan,
Thanks for the patch.

On Wed Jun 25, 2025 at 4:22 PM WEST, Dan Carpenter wrote:

> This was returning IS_ERR() where PTR_ERR() was intended.
>
> Fixes: 642b70d526ab ("media: imx8mq-mipi-csi2: Add support for i.MX8QXP")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Rui Miguel Silva <rui.silva@linaro.org>

Cheers,
    Rui

> ---
>  drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/medi=
a/platform/nxp/imx8mq-mipi-csi2.c
> index 6501843ae72d..3a4645f59a44 100644
> --- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> +++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> @@ -966,7 +966,7 @@ static int imx8mq_mipi_csi_parse_dt(struct csi_state =
*state)
> =20
>  		base =3D devm_platform_ioremap_resource(to_platform_device(dev), 1);
>  		if (IS_ERR(base))
> -			return dev_err_probe(dev, IS_ERR(base), "Missing CSR register\n");
> +			return dev_err_probe(dev, PTR_ERR(base), "Missing CSR register\n");
> =20
>  		state->phy_gpr =3D devm_regmap_init_mmio(dev, base, &regmap_config);
>  		if (IS_ERR(state->phy_gpr))
> --=20
> 2.47.2




