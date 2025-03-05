Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6005C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 14:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/8e1NK0iHuTNXsrRQMu1Rap5op5xIoO/iE7QbD4E6K4=; b=jUDuJbMl2OSTEX2lDM+WgPJtvF
	wtMDyMtXnwM8COYOobiGKqbrZXwZ0+9rSBr0q4dj2JawJ/u4M1NNeD15Kv/owRDNSd+9eU8AX8YKU
	fK+QKBE7PU71ahedcamJDCoWhhi5aPTis7PxV1Uoz6/EuN7ZQriat37+TT/v0GiSC0CE6TLIkjDsT
	ehylSM5x8ZdKEH2zS+lLqKvNx3JTmkJ9wtMa/m99c9BCDTbuntUbXvKY4Y/pBsC2Hg61kXJjnTXpS
	McPj/Hyw01TsiEqXZ/BiIwyuAVVo5LamCnh4zYY5W6LhtbAZ9OvL8q2/6YUCJy+kGwAyzWrkF3uZz
	TbY04wQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpqBH-00000008RKs-2mGw;
	Wed, 05 Mar 2025 14:57:07 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpq8H-00000008Qjg-30lh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 14:54:03 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-6f4bc408e49so62531927b3.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Mar 2025 06:54:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741186440; x=1741791240; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/8e1NK0iHuTNXsrRQMu1Rap5op5xIoO/iE7QbD4E6K4=;
        b=UsHyubA7w/YY4IysBxD8Yc0XQHi9DfI0aBrjOE2eJOtunWDLZ733YpaSqYBZo4pp2v
         9as4awnbpruKn8n1Lo86VNivO8nnag/qERJwo9aOFBUpU3zRJr9jeaDUe3+XBYnhxHgb
         kl0dAzsi6Rk/GFmNY8GuZrXkJT5raR1ejGUgrofomtOWoDBwH6OfaqQHSqiUDA+r8EgI
         d2DW2oUt81CkP/ZMESIdFfROuak2R1q29JdydgmyI029JEU8SDMmP+UsDP06Kxpk95KK
         34OdVYsicYBvjFPj+WRqJV00A5Oiez9kglnp/rgQDt4jeprNG4t0S0ismEneZ1v/5TzW
         cFAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741186440; x=1741791240;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/8e1NK0iHuTNXsrRQMu1Rap5op5xIoO/iE7QbD4E6K4=;
        b=G3PvCc04ymn+RZLerMzCd9CrEhlGdlAOXeiI+AOlad7kH8Qu1MuVQzCtgIHerTyY//
         HammU4WTswHW+pq2GNWYFRHAf6LsycDy+dJVw1oO/qvNpz38TWiO+wW1L0V+vKAcmYzM
         z3+Pce2JVvMoItUuwXTnU+mamWl73kjqw3ISr5fhZXwuEmJGu3BACkCbG+jLO+sye8lb
         rtIBvHx4ZBsU9UhTJ/kszOUO9WVMibn8BCg2ntdwxuhwUjWRyEMRquvZ5hsVmh/OuEwG
         oIDaHi8eh7CUJIZeeTXAxw3BfiJaIN2RtuRqbhPpGves+zen4Yru8Hf6JY2ikohd2CpK
         BxIw==
X-Forwarded-Encrypted: i=1; AJvYcCUpXIW/I2hY2WgukZGfNGzUv9Ks2gHV1tsYjD2Fo1YL7rkgSWpuRRVozx7ECt3OqEg001bBkpfbQ2Zv9eBT9pEe@lists.infradead.org
X-Gm-Message-State: AOJu0YznwZbisrmkcBahi69GLENNXECoFkj0fNbgG7J65hFsUJPd9Tdf
	jKJxU4z3pI/fFvUyp1YAwuPixe+Zc5/3Bw9k1QKYG1nxf4KOUFDqzHpTLPe1DaxH7UCLSC3f6oQ
	oMkyVFXokc4dmaYaDV+0F8LGq7GxfwhIymY4/Kw==
X-Gm-Gg: ASbGncvkbSEHY9K3/cgz6en+FNuV7BebgO4gyjkrtCGW/wqssEVuzlW27FmNshtO/un
	Zm5Gf86VKOr2wf5gmXqj6BjXC5mBA3ZH/AfLG+JMAqUVGdQuXsQ5M7Q9q0EHgYC0ZKnC1/ali1H
	NxQr50tzEONa8PZLCg6nulrMcfb7c=
X-Google-Smtp-Source: AGHT+IHVMDgrxpiMAMts0+d6pAHMmbs+DKlyOlsJcQRgBdUnM1Arh/L/Y1HIIcETYwiUqxFlkWz35mNO77MdJGM7YEc=
X-Received: by 2002:a05:690c:750d:b0:6f9:e609:6a4b with SMTP id
 00721157ae682-6fda30be95dmr42050127b3.23.1741186440140; Wed, 05 Mar 2025
 06:54:00 -0800 (PST)
MIME-Version: 1.0
References: <20250304142803.689201-1-arnd@kernel.org>
In-Reply-To: <20250304142803.689201-1-arnd@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 5 Mar 2025 15:53:24 +0100
X-Gm-Features: AQ5f1Jop9maVmyVlQa4pDNjDZNA9U2rexGCX4_vVPocLK9GIMh5i3XadhUynJ5Y
Message-ID: <CAPDyKFo79xyTOKxN7A52J2Et50++fifdosUpyb2mm3NMc+EC1Q@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: rockchip: add regulator dependency
To: Arnd Bergmann <arnd@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Arnd Bergmann <arnd@arndb.de>, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_065401_774907_1AEC93B6 
X-CRM114-Status: GOOD (  16.98  )
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

On Tue, 4 Mar 2025 at 15:28, Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> When CONFIG_REGULATOR is disabled, this pmdomain driver fails to build:
>
> drivers/pmdomain/rockchip/pm-domains.c:653:30: error: implicit declaration of function 'devm_of_regulator_get'; did you mean 'devm_regulator_get'? [-Wimplicit-function-declaration]
>   653 |                 pd->supply = devm_of_regulator_get(pmu->dev, pd->node, "domain");
>       |                              ^~~~~~~~~~~~~~~~~~~~~
>       |                              devm_regulator_get
> drivers/pmdomain/rockchip/pm-domains.c:653:28: error: assignment to 'struct regulator *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
>   653 |                 pd->supply = devm_of_regulator_get(pmu->dev, pd->node, "domain");
>       |                            ^
>
> Add a Kconfig dependency.
>
> Fixes: db6df2e3fc16 ("pmdomain: rockchip: add regulator support")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/rockchip/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/pmdomain/rockchip/Kconfig b/drivers/pmdomain/rockchip/Kconfig
> index 7e4f9b628f0b..218d43186e5b 100644
> --- a/drivers/pmdomain/rockchip/Kconfig
> +++ b/drivers/pmdomain/rockchip/Kconfig
> @@ -5,6 +5,7 @@ config ROCKCHIP_PM_DOMAINS
>         bool "Rockchip generic power domain"
>         depends on PM
>         depends on HAVE_ARM_SMCCC_DISCOVERY
> +       depends on REGULATOR
>         select PM_GENERIC_DOMAINS
>         help
>           Say y here to enable power domain support.
> --
> 2.39.5
>

