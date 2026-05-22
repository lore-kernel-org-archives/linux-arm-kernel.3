Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A224CD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 08:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=USopUhbYAD9H+P5jY922wxECkr8a746/WdiaOhzpN58=; b=5GdPFj1cL8P4dQMnnA9jv2ObuY
	SK7FvxfCgWXWlC5XQzrkm08XS9CB8KsFGQesBge6kKMT/IvNpQxizopHoop1vCqHs3NaosvdEJNj3
	B+1yZZI2479OieCnfxiPcykdyRhwriURr/Wi2Dh95XIobnbAxdGI5kkalOcrMg4YeRqtebA8Ot3/l
	V8Bqn3ap38baEcpZLnS5tdS/Lf2a3xfVtYgQAsxfOqGMCVFO24f+FcgrkW5ytBapyf4BzbImVYP1J
	xdNR14RROnAAMM24UgbEsch1/nFYYOFpJvvZWJPd8w7afDiNYf7ebAFtjzeGVPhX1gd5ItJ4nxc3D
	6DullViw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQL6J-0000000AB9M-1OKT;
	Fri, 22 May 2026 08:19:23 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQL6F-0000000AB8j-3YWm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 08:19:21 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-449de065cb3so6623361f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 01:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779437958; x=1780042758; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=USopUhbYAD9H+P5jY922wxECkr8a746/WdiaOhzpN58=;
        b=KyqB3jYv9ThJgEIDRdm9PPd5y7dytiOXEINqCQZM3vhHljiex8vLFuOICMHlu8jce2
         v9VUngV+/Xxn4r7/i/yvV2F+SFUYzpazbkuxfNoVmrk41CQ79k2TyjVr3j0fkUNhk7Q1
         JH+kgmMxakn2BTJOczAhNe0GN2VU0ZTUUkqawWFllRPrHjxVIIlYy1X85xRCERppSj44
         7udGx08drlhqE4a61WlpznnH5lgr84N3hezK7TZrz3eHn5RJAWTuVgTpRd6wId/TNwTU
         dhKG9+cSeQrcA+lIHtK/mURYXyjr/lUylrjvFvf5jpZz/26CQwUOxrHkDKD2N8Mc8gkC
         rVYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779437958; x=1780042758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=USopUhbYAD9H+P5jY922wxECkr8a746/WdiaOhzpN58=;
        b=G9X1j96cba3svGFlHD8dWFlL/JUcE2m3Col7OknAdXtW3SdWjxTQnG8OWyoTs2vutq
         +SRKKyzmRhYCNsjUEi4lIMyEIN7ugKYM+mfVlRJKAJ+LzWlohsYwZG7BNyXlHOt9Y1UF
         cAeFfyx22Dub7wGMtUN4FnyOJFTFCfMBrAMdLEBcqV05hFl0/ZCl+8XIet25EKiXknVc
         qgZTrkQgsBomzsIrXdF4stY/2aFuHDVWrvq1CPErPlkv1GbkXIjEVnjiMjBm5RmTpZy7
         xmCmGq9MpNofms/tyqJpegJwJnS5CwTtl4cMINnsiAJauXvE86NKYlkVVdqa8b/vTOTE
         Nifw==
X-Forwarded-Encrypted: i=1; AFNElJ95Qq47tVi7GWPCG7+7zyAf86irCw2x7wIEOfYGYtVIbacDSWUP7o5QoHPhHcr3sbWNU3JfVjevWPsytLLSGFl+@lists.infradead.org
X-Gm-Message-State: AOJu0YxgLBKiv+W4dE5oNixf2vu5vQbWgXaUh2SVB1puW1CotDCAVx22
	IqHQiQCkVuvvWsrSMDWUyHnReJdT89yPN+lbwyjSjcn8nvuI9lTcubMW
X-Gm-Gg: Acq92OHRIYO7Ti2fDBHh6QP+Xp/xIxoPxjNoIUfl52zmsyDhmYjyhWvYTineTWTvukY
	vXITaKjTDvMUR6qRkgpKGnpglGqe1cUICe6whmXA5M3yxwybeJLsZFeyNHF/G8zqQ7APS/3REOH
	b4GDuV8YFmVvQJFMDYI6JjwdjkxWu6Pzscii25FWV+tsfiNPMg0KD3yH8pfS8lV7f9bOyirNA7V
	cpaBsiWy9Roib2bhzVifgpNFZWQr16x2xCV5fbF79r1K3wx+mfBGdeOohy1D70c43PCef0gZ3YU
	dEB4ZSx+Dsu05Pn9fDRMLDAZyP70wGfaleF7bM/x1vxCtQdt1pYwPsSqJogQpVSSm3oFfmEzPAF
	MXjihRUAh09/IMOCmr85BT5l0/SLAJU/q0XL1Dgplmvtyzn7cTQp1e+dFP7ETPvXtPIkPj1Zh+c
	l8qe3fyM/yqNATD95vmKqsaVK8ddv2iFvHAAPWHk3UjSweRhyZrK02s1PedmDvWEva
X-Received: by 2002:a05:6000:1848:b0:45e:73eb:2a75 with SMTP id ffacd0b85a97d-45eb367fb1amr3404088f8f.16.1779437957497;
        Fri, 22 May 2026 01:19:17 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6ccd04dsm2451454f8f.9.2026.05.22.01.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 01:19:17 -0700 (PDT)
Date: Fri, 22 May 2026 09:19:15 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
Cc: <clg@kaod.org>, <broonie@kernel.org>, <joel@jms.id.au>,
 <andrew@codeconstruct.com.au>, <linux-aspeed@lists.ozlabs.org>,
 <openbmc@lists.ozlabs.org>, <linux-spi@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <BMC-SW@aspeedtech.com>, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 2/2] spi: aspeed: Replace VLA parameter with flat
 pointer in calibration helper
Message-ID: <20260522091915.65dde4ad@pumpkin>
In-Reply-To: <20260522071621.102507-3-chin-ting_kuo@aspeedtech.com>
References: <20260522071621.102507-1-chin-ting_kuo@aspeedtech.com>
	<20260522071621.102507-3-chin-ting_kuo@aspeedtech.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_011919_905991_6971FA3F 
X-CRM114-Status: GOOD (  20.36  )
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

On Fri, 22 May 2026 15:16:21 +0800
Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com> wrote:

> aspeed_spi_ast2600_optimized_timing() declared its buffer argument as a
> variable-length array parameter (u8 buf[rows][cols]), which causes a
> sparse warning. Replace the VLA parameter with a plain u8 * and compute
> the 2-D index manually. The corresponding call site is also updated.

This code is all a bit horrid.
The 6 and 17 (which are also used in the array declaration) have to match t=
he
TIMING_DELAY_HCYCLE_MAX and TIMING_DELAY_INPUT_MAX values used for the loop=
s.

In any case the code would be more obvious if the 'run length' of test
passes was counted during the initial loop.
Looks like it wants at least 4 ones, after you've got that many
(and a fail) there is little point continuing the delay loop for
that hcycle.

-- David


>=20
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202605180441.uD3toFRJ-lkp@i=
ntel.com/
> Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  drivers/spi/spi-aspeed-smc.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/spi/spi-aspeed-smc.c b/drivers/spi/spi-aspeed-smc.c
> index 808659a1f460..027caa2eeb5c 100644
> --- a/drivers/spi/spi-aspeed-smc.c
> +++ b/drivers/spi/spi-aspeed-smc.c
> @@ -1467,8 +1467,7 @@ static int aspeed_spi_do_calibration(struct aspeed_=
spi_chip *chip)
>   * must contains the highest number of consecutive "pass"
>   * results and not span across multiple rows.
>   */
> -static u32 aspeed_spi_ast2600_optimized_timing(u32 rows, u32 cols,
> -					       u8 buf[rows][cols])
> +static u32 aspeed_spi_ast2600_optimized_timing(u32 rows, u32 cols, u8 *b=
uf)
>  {
>  	int r =3D 0, c =3D 0;
>  	int max =3D 0;
> @@ -1478,7 +1477,7 @@ static u32 aspeed_spi_ast2600_optimized_timing(u32 =
rows, u32 cols,
>  		for (j =3D 0; j < cols;) {
>  			int k =3D j;
> =20
> -			while (k < cols && buf[i][k])
> +			while (k < cols && buf[(i * cols) + k])
>  				k++;
> =20
>  			if (k - j > max) {
> @@ -1541,7 +1540,7 @@ static int aspeed_spi_ast2600_calibrate(struct aspe=
ed_spi_chip *chip, u32 hdiv,
>  		}
>  	}
> =20
> -	calib_point =3D aspeed_spi_ast2600_optimized_timing(6, 17, calib_res);
> +	calib_point =3D aspeed_spi_ast2600_optimized_timing(6, 17, &calib_res[0=
][0]);
>  	/* No good setting for this frequency */
>  	if (calib_point =3D=3D 0)
>  		return -1;


