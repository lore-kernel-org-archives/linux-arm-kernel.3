Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A8E0CEBF84
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Nov 2025 19:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SBUMvmH/FE2NkP+rH9gUjMt6Dd3cDonURWl8AiaS8Jg=; b=g+bLDQOWkJptXqcnu2u0zM09zV
	X37udxgU5C3Ax24NHvnGCTUfpQgZpJiAWFzPOmMtj04iodO7scz0LfGd+0SWJfuvGczj+arqu5FvZ
	kgBt6fYyyM8mUTij9LgvxzjEGrdDdImmh17hDhwSKVPdAASkL3EPikmonVt2ppX89Ly3sk5r7ml7h
	ycrEUg51Lsck/c6deyAmU40YBrYnfiCQ/NLqN8fqmfP8RkVvW3ErTBRdOTp53ApC8ZUvcI4PX71SG
	yb8rtWvHhLdHh6O2uVxel8NrUcJWvCOHehZg/qs5LTO1oq68gPqBJzlLQziM0pBpCY8Ox4JPz/0ED
	U7qWun3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKMMS-0000000E2Gr-2hXG;
	Sat, 15 Nov 2025 19:55:04 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKMMR-0000000E2Fq-0CQy
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Nov 2025 19:55:04 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-42b3b29153fso1684925f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Nov 2025 11:55:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763236500; x=1763841300; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SBUMvmH/FE2NkP+rH9gUjMt6Dd3cDonURWl8AiaS8Jg=;
        b=d9h6sNy6won37XIqcGhE+NaezmYwO5Xkcc0sxepjaCMwZZJIkhj1d9KYZ858stGEDV
         5g7C/kFfG0Z6QRne9ZlRQKf1Ze2VxWiPvGaghCt54yvht6hBypy7sv75zOHRSRcjzQXP
         h8gqmDnRm8FucLHk+OorurZuVixhJlwjbCLj7o99N3fmlNN5BjAtiNemAkV+cugEAyyw
         NE8JjLZxMXFRBPPK9VB7AIhuNCx5Zkrw9k1z0+2NP65NrvWA1q1yCCna26JDy/iDRNs9
         vXiN56JIFLntEPGebo57dFoY38dV+LSoP7PeW7vTLLcLgzjV57F1ieoXvJ1nsZafC9+I
         iAiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763236500; x=1763841300;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SBUMvmH/FE2NkP+rH9gUjMt6Dd3cDonURWl8AiaS8Jg=;
        b=Ku3cNUvnpxk/qyP/LQyN467x5QkyYKwuDfXuG7J6djJWy3GKrTTQv7O08zxAPKATbr
         vl2tDsTjRxWFHeulQ60yAtefLfOrtJGA5ma+34YA+4ShzrS2+X8xLdKW17fbh7i16Cty
         /GK2obxU0LdMMboi9zAoQxB2PGVNKTCPnerIpy3DZUskuIsmv1lkWxfRSJ0Cwea4I0SM
         iqfcUHRPlqj6VRzIEcNccNjV/vbhS8WWyk4PU3uP/YAudR3FEgUw8BbyZsLcYhL5W22e
         Mb699HvJxO83VJpEVpNfwAr4m53zZRC9jfZ31u+2CYpgDgvRbcziBDZ1lGPq6KrglshT
         jpTg==
X-Forwarded-Encrypted: i=1; AJvYcCWMepedlohljzTHsCHXQS42SfIWeGMoICpAUM64AL4OEyZ2OC1z8uwy0pXbSci7g3oBREL67YY0rRy3EiBwqO64@lists.infradead.org
X-Gm-Message-State: AOJu0YyyZHBooe0perpyubeYj4c9SPTY36S6vKRCZYgw3fXc/FlDRk47
	1hzVWhqAUlNvj4i0Zox2MGWL1sfGaT4DHFai4o9PhFNaFSEXMh0DEzwM
X-Gm-Gg: ASbGncss2w6LKgydeL1kVradd+UDNbUcIRnptb81m86K6L9y33tTHzE+JS+jKLjVue0
	qrRwdZuHsCKivEIUs9VD2FqQqGjoi2V5g9zjCGg1ZT5kP0M/EyzBY63tlF6s7dGihB2d7NXfYGb
	JwX++yZt4tSZzm11b3mPJI88OCDT1LLtunv73m0vNV7KgJpx5/NxmeAvT0rzI4EnbzjNXc9Sx/U
	4BOVAsdxNfpQKIcIB0t5s5eaJ3wC5R1ueL7tJh6wGXhmWD8VS6eU9QSOFAE4VzOZMGJS2UA/Vi2
	sG6cdXEvgVfjAgrBBx4cP26Be3cNxQomCFBul3q/zpdxA3d+JNSN35NDUkiLwFdCaXms1CZUX5x
	zlmK2PAvZa6r0dHBSfoOjHhkwnhGuJvmBf8eMP6bseBvOgfBF3lUe+jLY+o29CdH+B25KLFT5bY
	YqR4oZVSI2oUi5vVk3F//5tnGVW+a2qg3W2YaIE5b93vy0Aw1nrrS/
X-Google-Smtp-Source: AGHT+IHSPwnyZ4YZke/ZsJzOSxMHljj18mEXOamqRXYe9YIBBAmYoQ9mxQRgJ1dWDU6O1s+9DDZ4pA==
X-Received: by 2002:a05:6000:2f83:b0:42b:3ee9:4772 with SMTP id ffacd0b85a97d-42b5937618emr6490889f8f.52.1763236499409;
        Sat, 15 Nov 2025 11:54:59 -0800 (PST)
Received: from Ansuel-XPS. (host-87-10-15-59.retail.telecomitalia.it. [87.10.15.59])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e7ae2dsm17786147f8f.5.2025.11.15.11.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 11:54:59 -0800 (PST)
Message-ID: <6918da93.df0a0220.10a972.69d2@mx.google.com>
X-Google-Original-Message-ID: <aRjajP6jIi8QQfJu@Ansuel-XPS.>
Date: Sat, 15 Nov 2025 20:54:52 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	angelogioacchino.delregno@collabora.com,
	Sean Wang <sean.wang@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH 1/1] pinctrl: airoha: fix pinctrl function mismatch issue
References: <20251115100000.177791-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251115100000.177791-1-amadeus@jmu.edu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251115_115503_121588_5E0365EF 
X-CRM114-Status: GOOD (  18.67  )
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

On Sat, Nov 15, 2025 at 06:00:00PM +0800, Chukun Pan wrote:
> The blamed commit made the following changes:
> 
> -#define PINCTRL_FUNC_DESC(id)...
> -		.desc = PINCTRL_PINFUNCTION(#id, ...
> +#define PINCTRL_FUNC_DESC(id, table)...
> +		.desc = PINCTRL_PINFUNCTION(#id, ...
> 
> -	PINCTRL_FUNC_DESC(pon)...
> +	PINCTRL_FUNC_DESC("pon", pon)...
> 
> It's clear that the id of funcs doesn't match the definition.
> Remove redundant #string from the definition to fix this issue:
> pinctrl-airoha ...: invalid function mdio in map table
> 
> Fixes: 4043b0c45f85 ("pinctrl: airoha: generalize pins/group/function/confs handling")
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>

Acked-by: Christian Marangi <ansuelsmth@gmail.com>

> ---
>  drivers/pinctrl/mediatek/pinctrl-airoha.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/mediatek/pinctrl-airoha.c
> index bfcedc7f920b..18c952e44229 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
> @@ -35,7 +35,7 @@
>  
>  #define PINCTRL_FUNC_DESC(id, table)					\
>  	{								\
> -		.desc = PINCTRL_PINFUNCTION(#id, table##_groups,	\
> +		.desc = PINCTRL_PINFUNCTION(id, table##_groups,	\
>  					    ARRAY_SIZE(table##_groups)),\
>  		.groups = table##_func_group,				\
>  		.group_size = ARRAY_SIZE(table##_func_group),		\
> -- 
> 2.25.1
> 

-- 
	Ansuel

