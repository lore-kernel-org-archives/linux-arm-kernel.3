Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27E54C54F51
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 07:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J96GiC3Lu8OCM/Ebd7ATNlWx75x2wiMwCn6WDtv6ToQ=; b=OeRXWsdjpsBAXl4W2dxZxS5i53
	t7Mks3buQi5mxTq4vrSBCoL0WRuXGk/n50Pt8kB56cpPTQAqNEu+0lOmCZz/oXjNFrZMtzCosSUB4
	tZ4WYXKxVeaBKzSMwbocKffe49XIWsnIs+Lb9wXb8NmrDqBr08ZptWDaSSjLf+BFF+FwaO/mfu0r3
	c3MMkCP8vjjAIdqnEZqBKlzBdacOCPcDmF7QphRjMQO3/Rzk1oJEaEn4RsNL8XLU55ItvbmejaP5F
	GIZ9tJ1pDko9zRj54V61Zyma3QUSVbGgGCqRCRXC6UADetYz89ueWVhqp1JW98CQobFgQOmpOOaeV
	ETHIBIaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woyoS-000000078SK-40p9;
	Wed, 29 Jul 2026 07:34:49 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woyoO-000000078QI-2CpT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 07:34:45 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-4728c12ba97so407098f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 00:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785310482; x=1785915282; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J96GiC3Lu8OCM/Ebd7ATNlWx75x2wiMwCn6WDtv6ToQ=;
        b=FqsxxVlCGKwrAufuijOgag6qWJbOqYmvI4eSs12vbv8kQMTDdcjF5VmCYLAcCIEfwV
         XzaCKe/6c5FJdd+t0pH6unzUKFlXZj8bGPKAKP3DvMRVFDeAGrpJSJMziFnOqEpXs4vm
         6nAx3xm6rc/Ap5M1pDJZbHMpxn2NXhGK8yrOg+RJkU6S5MpHYTmhwJkKFmw0Y6QckXKE
         QJSG2lcMh6vaSBqHyNUDAzf7fwrHfTySFyAnbur9VaNjh84ZemAbzxVvWHHlwrVwEf57
         6kq8UslNqhFLeKMEgG/d0dtyYBOQjAAEhNN9QkEgGJItY613ofc5GQ5JHGpP5IPc1blS
         C0+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785310482; x=1785915282;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J96GiC3Lu8OCM/Ebd7ATNlWx75x2wiMwCn6WDtv6ToQ=;
        b=kK6uvKy2R5m6KRVsirnag85H12COM2W9PFnLaTUzPK/MAq269pQzja+Rq48WZm3bwo
         gchKEPtAE7dhuO9dG4g0trp9Wqak9oqPp3lOIc/Ds1IDhNcKAtSH7jLrWA4CBcpawIWQ
         vaPkEK722XqjdpM7mhvTTU4BLXHgTed6wG6blrCEwkI8n4RVON7qdM50Yx16mVuhvZsP
         WFQ8WYdS5qD4PWYxQ8Hsl7hfKx/yLrEwOvTMZs034A+jicq1oywzLb+MI8Gv/mvwf1Wi
         qcs3iZA76iRky52B6UktUrvbgQWAaZn42Z/mde4B9UtgOwdVZXeRtuuCsDyah0DQKdyx
         3MCA==
X-Forwarded-Encrypted: i=1; AHgh+RrrXx8SvMgPp/OhZV1y0YwlS9bqPR1JdDMx6ijqTnCZIUp36ZQH9tOoqKnvS7i3kQfwl7y6o+KohtzJvjCRPhCu@lists.infradead.org
X-Gm-Message-State: AOJu0YxhWp67aPABqJh0GjnyhYY/0xugwWiGB/YsDF+N6/2v2g5i63od
	dqSWT8+haEF5eVY8JeZDvZesSna1zkV8OrfSigQCGQn42VUuL2Kksvks
X-Gm-Gg: AR+sD13+87CCtlAS2WoCQCJy0j9qNnIA95FSQGgi3TxgngxzCrbV6U0SzExY6Cn0BfW
	zNBh2gqfBsusaUsucfQMtO1jgsOAUg4rxKP2qjSOPXS1/3n08ePSERQ0EbFCUUEf09uASbFkOu8
	AbxfTVi4LGCB7M5/v+KUI9Yr19euI3knNFeaiDTHyYrPy1oW/iZW2Zg4JlnX4dorZIER3LFbmkJ
	Hw1RXorArrBRKhVQoYmfzk/9Up7VQ1HReMI4X1TpJCToaRETXED17bZcX/eqfSYTVI0DLitDwID
	jej8GaRUqhw+MtuataQ6+GnZBc8IJZLgHy18a4eWImwpl4WARWa396qfSQMV5iNz+W4UCovYPU/
	oNpekUNiLkvUP/GqVqlytPZ2njAxKau0FEKUHT68kfPW1R+MVcOn4KCaMI6IaJIt0lzB9iE/fYm
	9tyKfEdFRjPfFSly0RYXbRGw6qLrApOvDohek4yMt8002D6NQU5+6+/6MPVNLF2ZnriE1ZYU0Ds
	IpXXJ0N4GyXXSD1dKFsP5dhNNEXBXE/cAM95R9eS855PMDIkVAFtrayF9k/BWYNODMbO7K4sEIi
	3XUwcASITMXRBc/+vhsmZJoKiHnKJmr94UNnvHBwPg4cs+adGzYcuBUqVdpGngmfq2VmMrbyB+N
	R8G/6422iOkdvXOjBCCfHt7DvyyhkGbq5wbmNKaNt6mcnuy9olBDALXjsWq4QdDPyHv9tELs=
X-Received: by 2002:a5d:5d0a:0:b0:47f:9260:4bc9 with SMTP id ffacd0b85a97d-47fb1f10855mr6272310f8f.29.1785310481628;
        Wed, 29 Jul 2026 00:34:41 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6aa3a32sm5852689f8f.2.2026.07.29.00.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 00:34:41 -0700 (PDT)
Date: Wed, 29 Jul 2026 09:34:39 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Babanpreet Singh <bbnpreetsingh@gmail.com>
Cc: William Breathitt Gray <wbg@kernel.org>, Kamel Bouhara
 <kamel.bouhara@bootlin.com>, Jonathan Cameron
 <Jonathan.Cameron@huawei.com>, linux-iio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] counter: microchip-tcb-capture: Fix DT channel
 validation
Message-ID: <20260729093439.00007440@gmail.com>
In-Reply-To: <20260714042910.7-1-bbnpreetsingh@gmail.com>
References: <20260714042910.7-1-bbnpreetsingh@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_003444_659035_C7D3987E 
X-CRM114-Status: GOOD (  21.63  )
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

On Tue, 14 Jul 2026 04:29:10 +0000
Babanpreet Singh <bbnpreetsingh@gmail.com> wrote:

> mchp_tc_probe() reads the devicetree "reg" cell - a u32, per the API
> contract of of_property_read_u32_index() - into a signed int, so the
> bounds check "channel > 2" fails to reject cell values at or above
> 0x80000000: reinterpreted as a negative int, they compare below 2 and
> pass validation.
>=20
> A malformed devicetree can therefore drive a negative channel into the
> ATMEL_TC_REG() offset arithmetic, making the driver access syscon
> regmap offsets outside the TC block's register window, and into the
> "t%d_clk" clock-name formatting, where it truncates clk_name (sized
> for "t0_clk".."t2_clk").
>=20
> Declare channel as u32, matching the API contract; the unsigned
> comparison then rejects everything except channels 0..2. Adjust the
> format specifier to %u accordingly, which also resolves the W=3D1
> warning that exposed the gap:
>=20
>   microchip-tcb-capture.c:520:56: warning: '%d' directive output may
>     be truncated writing between 1 and 11 bytes into a region of size
>     6 [-Wformat-truncation=3D]
>   note: directive argument in the range [-2147483648, 2]
>=20
> No behavior change for well-formed devicetrees: channels 0..2 take
> identical paths before and after.
>=20
> Fixes: 106b104137fd ("counter: Add microchip TCB capture counter")
> Assisted-by: Claude:claude-fable-5 [gcc W=3D1]
> Signed-off-by: Babanpreet Singh <bbnpreetsingh@gmail.com>
> ---
> Note: struct mchp_tc_data's channel[2] member stays int =E2=80=94 after t=
his
> fix it can only ever hold 0..2, so converting it (and the QDEC-mode
> comparisons reading it) would be churn beyond the minimal fix. Happy
> to do that conversion as a follow-up if preferred.
>=20
>  drivers/counter/microchip-tcb-capture.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/counter/microchip-tcb-capture.c b/drivers/counter/mi=
crochip-tcb-capture.c
> index 19d457ae4c3b..e53a8390756b 100644
> --- a/drivers/counter/microchip-tcb-capture.c
> +++ b/drivers/counter/microchip-tcb-capture.c
> @@ -483,7 +483,7 @@ static int mchp_tc_probe(struct platform_device *pdev)
>  	char clk_name[7];
>  	struct regmap *regmap;
>  	struct clk *clk[3];
> -	int channel;
> +	u32 channel;
>  	int ret, i;
> =20
>  	counter =3D devm_counter_alloc(&pdev->dev, sizeof(*priv));
> @@ -517,7 +517,7 @@ static int mchp_tc_probe(struct platform_device *pdev)
> =20
>  		priv->channel[i] =3D channel;
> =20
> -		snprintf(clk_name, sizeof(clk_name), "t%d_clk", channel);
> +		snprintf(clk_name, sizeof(clk_name), "t%u_clk", channel);
> =20
>  		clk[i] =3D of_clk_get_by_name(np->parent, clk_name);
>  		if (IS_ERR(clk[i])) {
>=20
> base-commit: 3b029c035b34bbc693405ddf759f0e9b920c27f1

Makes sense.

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

--=20
Kind regards,
Joshua Crofts

