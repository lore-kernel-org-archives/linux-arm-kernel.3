Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65CCACD5BC9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 01:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2voxwMi0ctbkvCbmI9saWaf7WWfi0CrEFmlwsKP+cUo=; b=2IOwmc7pWUTuoVa35xed78/RD0
	3H7S+OGIHgoq5oHfHfNIYFwKlJaameViLvfq5Ze4+1t03T7PNlqoWohN5CNOb48gCYGki3a/aqjoP
	zPXkk8WSvqU4eGLYlmqMq7LYcHAT4rBae387YUwGiKOPiJogXEmY6TsW1okfK8cl+a7ynooXrayRD
	iK5ck1qB9DZOJnJTbeXoNM2/DZ5x9sMOrY8etC2C3BrxR8RWOCLCcvdItzxwbaUqSGMCvBGt7z7za
	djUVcAkIu1+BnCrsjYnqC07flSAZ8HFKHuPrlL98tyPRSnDy5nQ0xHte4UJMAAi/F5gwIb+YeN65Y
	jUIu2KLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSPLa-00000004vq5-1Vj2;
	Thu, 28 May 2026 01:15:42 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSPLX-00000004vpl-3JFp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 01:15:41 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso105653985e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 18:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779930937; x=1780535737; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2voxwMi0ctbkvCbmI9saWaf7WWfi0CrEFmlwsKP+cUo=;
        b=RK7+S9i31Iz3ofCehQgeSqbvfU2USK3Q+z/BR8jTYTQIDxfOmYrtaAo5mbJE6yxIWN
         8hTdXL03bWT2qqUvyJWxemxKzJnvdOorDN7WBoxfyPcHWxuOr0bAl6n4mNKGhaOtdK5W
         fW1cBT22JxBKa3gh3wtRhJ2L6LGS1MngnhEJUC7GcbVCrFJeUJyQU/CoaRRdy7a06X2p
         bMYacR4jXcRGz4MSTYRKWptrdDUJIajetChmA9pKUcfQKOoKsHdz0bAWzfdKOFCHpqNT
         VZJ/iUOeTIOrv2jbPLNcieUft3EV6mD1r3KZQnldAufseEoRLRrT/xs5NgjHwi1/jFPb
         0Xtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779930937; x=1780535737;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2voxwMi0ctbkvCbmI9saWaf7WWfi0CrEFmlwsKP+cUo=;
        b=ds0hXk9Kaz1DOL/zKwgH4q4/ig+PWNowUNr9yX9Zt2d1O+Osbj1+TmjLl5RIfZQMvN
         XiLofGCn/ebfgwP0n7zxcwQJAYrgG56A82gelgV6RRcS9ISvQC3XAM9ChVba87iKdr+K
         pyCaqBmQBMHw0MSk9crB+XXS9s+0+JrQZ+4qK+7r2R1pCvJccB/Pd1Osb8wo+U5ORyin
         YPu/bkPuOyTvRD/4zynbJb6xlgbryBG9+eJNu9lO48XNfCDAXmIDzLyZUHfulYM0N2yx
         Gk+uLThPQ52dOwCYNUTg9OxT19TSz1TpH3Loy2e7ZbybYUttFpv7pwivyTcOLpY8Hhwx
         adpg==
X-Forwarded-Encrypted: i=1; AFNElJ8oBobVRpS29Bvb3l4aosonwiOmoo0kcX67vGgz7T6xtGDKnEDN06pGEPyYYGBtaZj4ya9vKfI1o3Kd3/jgmaFZ@lists.infradead.org
X-Gm-Message-State: AOJu0YxgjofSH5rtmHCdGWgGSA5n3DqCsAv4kzZL6SjGK290rTq2RPNo
	hk+28eYyXL20pV3HiBialHe4wzwS0fN7PyGgCqDQ+Isaa2rQHZp3ebhX3Gx3aUGWGzM=
X-Gm-Gg: Acq92OE94r2UQK8kkCj2BdhoeNW6Qpz8oMV7ahALfwZJovT3d7jCjvbcRjVJg7aVkkx
	bXOBcGKYf2urrrjkp0zDvM25eQQ5VXciaZDOQ64Nif4YCii9WAg2vlK9TNYxUwVcnhGQa9PYMXF
	JRl4DGJto7n3lRp42noo1aOqGonIJauml3acsS+LgwX8WmlX28RGAoNDS6h9FzUSoirHQkXNlWJ
	ZJo9Wp8kORs7RMMY7yyQ13QqNLmNDNDkJrq3j/t/8qOEQ9djjBk2iKSdfJAMeWtXLr2D01fPGfs
	FGYLDGNoD0K9WOSJ+Pa/pBQuU8GMFjfNneKzcGVPFFqRGEePbgLh/vqcHPuuJibFImIdKr7TZkx
	S4HExYkQtrMsMgEamQoj3q65VgyZy/s0NtPPwS6Nq8cikrF7+pSqF+IoHKwKigh7DlG0/NgzU3e
	0xWKRM+rlGHNQitYLij/bpVsIQfuLR3gt6QuidjMi37eTFmdXT98OCvws+YTxPF5KOwSffxhA9M
	phoXgM4BhZ4aVCL59w+/7S1cylaSNsTooY=
X-Received: by 2002:a05:600c:3d96:b0:490:5429:1513 with SMTP id 5b1f17b1804b1-49054291bbamr369303675e9.6.1779930936735;
        Wed, 27 May 2026 18:15:36 -0700 (PDT)
Received: from localhost ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45edb5c44e4sm9654900f8f.36.2026.05.27.18.15.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 18:15:35 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 28 May 2026 02:15:33 +0100
Message-Id: <DITWUUN7L160.5VKMP4HONZ4@linaro.org>
Subject: Re: [PATCH] clk: samsung: exynos5410: fix refcount leak
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Alexander A. Klimov" <grandmaster@al2klimov.de>, "Krzysztof Kozlowski"
 <krzk@kernel.org>, "Sylwester Nawrocki" <s.nawrocki@samsung.com>, "Chanwoo
 Choi" <cw00.choi@samsung.com>, "Alim Akhtar" <alim.akhtar@samsung.com>,
 "Michael Turquette" <mturquette@baylibre.com>, "Stephen Boyd"
 <sboyd@kernel.org>, "Brian Masney" <bmasney@redhat.com>, "open list:SAMSUNG
 SOC CLOCK DRIVERS" <linux-samsung-soc@vger.kernel.org>, "open list:COMMON
 CLK FRAMEWORK" <linux-clk@vger.kernel.org>, "moderated list:ARM/SAMSUNG
 S3C, S5P AND EXYNOS ARM ARCHITECTURES"
 <linux-arm-kernel@lists.infradead.org>, "open list"
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260526061321.6123-1-grandmaster@al2klimov.de>
In-Reply-To: <20260526061321.6123-1-grandmaster@al2klimov.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_181539_861715_B03BF6E7 
X-CRM114-Status: GOOD (  16.30  )
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

On Tue May 26, 2026 at 7:13 AM BST, Alexander A. Klimov wrote:
> Every value returned from of_clk_get() is supposed to be cleaned up
> via clk_put() once not needed anymore.
>
> Fixes: be95d2c7d918 ("clk: samsung: Add support for EPLL on exynos5410")
> Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>

Reviewed-by: Alexey Klimov <alexey.klimov@linaro.org>

> ---
>  drivers/clk/samsung/clk-exynos5410.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/samsung/clk-exynos5410.c b/drivers/clk/samsung/c=
lk-exynos5410.c
> index baa9988c7bb7..0cd9b0392cf5 100644
> --- a/drivers/clk/samsung/clk-exynos5410.c
> +++ b/drivers/clk/samsung/clk-exynos5410.c
> @@ -269,8 +269,12 @@ static void __init exynos5410_clk_init(struct device=
_node *np)
>  {
>  	struct clk *xxti =3D of_clk_get(np, 0);
> =20
> -	if (!IS_ERR(xxti) && clk_get_rate(xxti) =3D=3D 24 * MHZ)
> -		exynos5410_plls[epll].rate_table =3D exynos5410_pll2550x_24mhz_tbl;
> +	if (!IS_ERR(xxti)) {
> +		if (clk_get_rate(xxti) =3D=3D 24 * MHZ)
> +			exynos5410_plls[epll].rate_table =3D
> +				exynos5410_pll2550x_24mhz_tbl;
> +		clk_put(xxti);
> +	}
> =20
>  	samsung_cmu_register_one(np, &cmu);

Best regards,
Alexey Klimov


