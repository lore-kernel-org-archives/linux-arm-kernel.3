Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFE1EC88E75
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 08:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pKTzsHsh+KOl7XVkDAfUJy4MbfFG1awKeay+vTS1O6M=; b=j0+OYtna7QXNgnvZemQO/8m0iG
	RlebQKa4UonSBOWRpEQW70hmd6gjuHau1dlQpBK7oH/5XAT9OkjtWo1HO1BYwJQHRPtzEfI64gngd
	ps9shietIzCtERyWCiO8+MRwg2xnobvvMf/nsNfapnl5Abd20mdnW9hAuLf4iXlfbTaJYkuhRsW7s
	mmHaeiBQkrDmaSdBt2nLA81C9V/Qd6++RpFj1CcWzWGr5S9ZiJPhoghL86JHCQ71WrAfp+XE97Aeu
	BwEBNzB3aEshaSRagwgIIG02wgN3FIMNfNYOKDC49+rEKX7rV7ry5Rf7OhusGNg2n3BM5tl8RGyHa
	g9bh/qDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7U1p-0000000Dp5h-48Kp;
	Fri, 18 Sep 2026 08:33:05 +0000
Received: from mail-ed2-x0f.google.com ([2a00:1450:4864:33::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7U1n-0000000Dp4z-1Y8D
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 08:33:04 +0000
Received: by mail-ed2-x0f.google.com with SMTP id 4fb4d7f45d1cf-6aa1da63791so587794a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 01:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789720381; x=1790325181; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=pKTzsHsh+KOl7XVkDAfUJy4MbfFG1awKeay+vTS1O6M=;
        b=cTlugQFuL/TTkmzBQrVTCfh3hFkBqgYO2DRu2zslEA8UmDlmqp6WqOk+CeZd3fU+pf
         UXbrC/UutJ17lRg+UDPL61zidJQzbzN6PNQ1X4yGmycfa8B6vznRHi1JHdF7vswPxbBq
         ZAcJ1a0rwLutH3MxQTx+qd5w2YU7GBrSKURVElkKt3YVCK7AyZwq0hHofeeu/1TMvGPj
         HV3ssoIACeFQC0l8novKnWWcFBELG+RzhDfxAaNIhnHQQBzDkETRyOcJ3GQ8EMCthPgx
         Ggptjpy5SZDih0vHcMc82LvXhJ9GZuiC1cBAtQltuAS2646s+J8jTZwYjhmHCq7ElrZ7
         6geA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789720381; x=1790325181;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pKTzsHsh+KOl7XVkDAfUJy4MbfFG1awKeay+vTS1O6M=;
        b=feT3YSU0Wk8gyljWeybDtJG8N5qCb+0HyWQdllkjrIfykpp5zoDaB9jVbE1tGipYfb
         RZRezJ4+O6cdBixgJBIb0AZ/FKtzohjM70S3/uiAvV7qRgzbbnPqzz1lHtUMO4CHHLWO
         3gJjS0l5taVpjINIUMxVHOWfAHG6Q4AkzMU1FThiremzD6lXN5iMR413FUsjKh+zV+04
         BZyx4R/R7IuJcbyV0O+Oqvq3s46EWSnGxFOso2uqzR7iW/kQoJEY2rNkWD3Y3DFVzYxH
         oo2xCU828Ru/ENV5bBeYGO5dAEoEOxvD8ohlknXhKkTyuOeevi+wPJE4ouVDLOL8Qp/2
         iVAw==
X-Forwarded-Encrypted: i=1; AKwUvBwWQyDG4ARwaGoW/WiOpbM3pn40xN0v9v7O2r19jQDZ2e5hkCB//tt1PCZwCVeEQR6nL+ZsTDjryw/NQYolIqtw@lists.infradead.org
X-Gm-Message-State: AFuF++mi4k7h7axl3GjZ7MReXYyqWcKwwfLRBISDF7WgInBIUQxebt7p
	k05ymXPA2/MvCf9nqQz3nasAZ6nGAuob0MdiH178JnpLDSyvz0RTXVAr1NCPzoT7S9c=
X-Gm-Gg: AYBFou3Wd+2USpteffiKrLNgcfrZw2yISQhgAdcgD/Y/+6OVES1JBM3LqdHtX6BojKY
	1jL3xXkeewlkfCwPPuR6lVcp5NtuCNvLNTJrqqh43AnY52AldQ5QN7ttuhjWjpa/Vef1w5AJHta
	SkrVcccfMbmtmxN2l1yT6nMe9vx27o58Avp5162fwdyUxfbYAGITHBRaQmxXWtqIapsSPC6cReL
	0hDIGtB4kiEGWfWzdad4BPF0Ij4/ydzxYGFWoYCfvUr1tHYglmjqPOl29pa9izEKHzKGXmBleuj
	dLidKaGNqjdYZoCIok17nykL6/BQ7MGr6cLDbQGYzucJoD+JovLSe28iuJpk48ufOiIqjjQJk9J
	I/qPfEMceTIKTeQvhGmZ0MTe1dtDJN0oYQ3r5xbMtFfA6OOXTA2g/mvJtrnfWxwys39sv/q8PJv
	ggA8V2kWzB54n3jGaQB8DRAhSpsTWSFXvQoUGLW+2v3biLgMebkOwBRExpBSiNspwJty5bnECO2
	wM=
X-Received: by 2002:a05:6402:4026:b0:6a8:e223:fee5 with SMTP id 4fb4d7f45d1cf-6aa531ef01fmr709732a12.44.1789720381295;
        Fri, 18 Sep 2026 01:33:01 -0700 (PDT)
Received: from draszik.lan ([109.255.181.4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa59605618sm513138a12.11.2026.09.18.01.33.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 01:33:00 -0700 (PDT)
Message-ID: <950335110f9d9c22a026fa5174e492c4194299a5.camel@linaro.org>
Subject: Re: [PATCH] phy: exynos5-usbdrd: Use dynamic phy_cfg size to
 prevent OOB access
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Selvarasu Ganesan <selvarasu.g@samsung.com>, vkoul@kernel.org, 
	neil.armstrong@linaro.org, krzk@kernel.org, peter.griffin@linaro.org, 
	alim.akhtar@samsung.com, pritam.sutar@samsung.com, kernel@lvkasz.us, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: jh0801.jung@samsung.com, dh10.jung@samsung.com, akash.m5@samsung.com, 
	muhammed.ali@samsung.com, thiagu.r@samsung.com
Date: Fri, 18 Sep 2026 09:34:24 +0100
In-Reply-To: <20260831070309.158069-1-selvarasu.g@samsung.com>
References: <CGME20260831070349epcas5p4c62a4e46592dffe95723ddd51a6068e0@epcas5p4.samsung.com>
	 <20260831070309.158069-1-selvarasu.g@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_013303_454577_DB213375 
X-CRM114-Status: GOOD (  13.57  )
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

On Mon, 2026-08-31 at 12:33 +0530, Selvarasu Ganesan wrote:
> The probe loop currently iterates using EXYNOS5_DRDPHYS_NUM (2),
> creating both UTMI and PIPE3 PHY instances regardless of the SoC
> capability. Several SoCs (Exynos2200, Exynos7870, Exynos850, Exynos990,
> and ExynosAutoV920) provide phy_cfg arrays containing only a single
> element.
>=20
> On these SoCs, when the loop reaches index 1, the driver reads past the
> end of the rodata array, populating the second PHY instance with garbage
> data. Since the configuration structure contains critical function
> pointers (phy_isol, phy_init, set_refclk), any subsequent access to this
> PHY instance via exynos5_usbdrd_phy_xlate could result in a kernel oops.
>=20
> Fix this by adding 'n_phy_cfg' to struct exynos5_usbdrd_phy_drvdata to
> store the actual size of the phy_cfg array for each SoC. Update the
> probe loop and the xlate function to bound their access against this
> value instead of the hardcoded EXYNOS5_DRDPHYS_NUM.
>=20
> Assisted-by: Claude:claude-sonnet-5

Shouldn't this be 'Assisted-by: LLM'?

> Signed-off-by: Selvarasu Ganesan <selvarasu.g@samsung.com>
> ---
> =C2=A0drivers/phy/samsung/phy-exynos5-usbdrd.c | 17 +++++++++++++++--
> =C2=A01 file changed, 15 insertions(+), 2 deletions(-)

Other than that:

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

