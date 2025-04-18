Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86B64C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 08:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H338YpIXIN0Gvnxx0CNTxMSFWd6J6lOzxWOZLc2fN3E=; b=WpyWdrIMWHmDegyCT3ZmOg1+lB
	2jCgi518mksesrhGLA+CxKvYjlTI9oz9jXQT3ki9Q9KiWkdqKoldAcbtOmcj2mjrMzd0Uz3QUBnHo
	nXetvVqelFGRRtUm1KLCKL2d8VSLiFgqxsWMhKaRfz4G/6pfatjenYoImfwkbhs12iQm09Zzr4rwS
	2UArrIOyKTJjHupKU/5Gx8UfZCMtEz+/N/Oegx+E8RM//2aDsBFZZWyAWetYQ/2QkXCs43A3dQViP
	A0bFR2PPF7rya14TxaI+c4ht9uDxGLYbrWTMaKz15KmV4CZoak1SKn4cj0LKvq6EfeKnMIZEydjHX
	C4Gq8F6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5hQn-0000000Ffwi-2GzP;
	Fri, 18 Apr 2025 08:50:41 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5hEE-0000000FdsE-2PTA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 08:37:43 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43ede096d73so11374625e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Apr 2025 01:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744965461; x=1745570261; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=H338YpIXIN0Gvnxx0CNTxMSFWd6J6lOzxWOZLc2fN3E=;
        b=Mmgr1SK760oaxWXqUp/6CAWKiqr6K+lDMaMDt5ieCcuyVEw2AhkJ/nzqunrPeISydK
         m2bX1J1Ia63itmJ573y67KmeV7j0YKJGSsZW+ALamP24nh8fGIMO/+EgnWyS2ZBQuFLq
         h+99OoaFDBaaRJsCR/OlMw+JZ4ee2ADs2MPpEf+B3ocPnjMmdDB5yGMAtHoPfnn1fOW9
         oBYvWv9qqox9UcSkHP3Cnl84YTLjHgmc5G4DDI1juk7D+wo7g83oQtVcV8kDpA2QmZ3V
         i/MyJGNsBmcQel7ZkEtYVfq29TfWwkt2QXWjFD4Sc8Y5T+YTrF5Jk1l1poJLiusph+Aq
         WyzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744965461; x=1745570261;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H338YpIXIN0Gvnxx0CNTxMSFWd6J6lOzxWOZLc2fN3E=;
        b=IRqnBR4IW4j6XJ8N/H8Db7MO+9o71rywbmmVUsk97JZCo7bIZ34o+r6U+xiN5qJJgK
         RoNOd0YjgHxYhNNY60peumkm2Yqs49GONXtYAYRZBryAuw7pQC5a/uZBUmNuqiuhKIFm
         kMzj+Nk9II3jh61bZuD7i1UPSPkab+bXHAtTarVIhWifKTS+T2TXAWevzg+M3gZezYI9
         0rF6ci7PJ6DCLCBhiB4gEzbGPLwnj1CuW00OBCd8GHMhVeWdEa6e4VWHV4jIK7qwrueL
         QMTAxgBqm1pYZGhCgZ8bHG6oW0jhcUeL8CUNkmCc8KK5z+xdXeRMtBnt5E3PaD1u+QJW
         TWpw==
X-Forwarded-Encrypted: i=1; AJvYcCUJuLbIYyCt4bhZrx5WCRUvu+G5/ENtKgC04tVGAOK6KNS0DTolaFeKqgeN3k13AcQ698T1KKlI6XpYyKJv+AdH@lists.infradead.org
X-Gm-Message-State: AOJu0YxkotqE+R6NHJVKhtLA8Hwk+UzYMHRnXOecwEdOfgZn6ZC6qqwP
	4l+NwKZGEa71Ll6Xh2SsYxn0NCAjufOsfAbqXNnenfA0boiPWLE+CWm8x0Q+V20=
X-Gm-Gg: ASbGncuqyjUx6LeayoEF/gq4A8MWlOMTRII7WevN6muKRoVnmTCTDSy5J9F/+1BJe08
	uR9xur0YAvv0d87KT8v2AkE1UnMQKhf9G07VG5G4S5ssN8ZmQAv6VCSBERQfKE3sovGhEyICVDW
	sYONc5UkS1hSX7d9+CHArH0zq7CkSci/og7cXKVyUkY/uoGf7G/Q4XrS3zKqN1TDzeHAuhM1PWD
	3inhYktsgNf4LjXCnD6y4eOZs7/8cMk4UnwOhtrljTtek52j/KvGgtOyl/EGFvnkDcP+GuvHSBK
	cfn6bTSUrYSK9WrYQ7rrx8ZQe5wDeAsQwDay8sBjH79g0h7TukzXF1ufZ2oQYt3V/eKE3X1fzq1
	qfek=
X-Google-Smtp-Source: AGHT+IHiLpagTJs2SbpQ7T/yPM+PTl/lUYMdfib3CeXF6j4CoViiiMG4uhTpPH8XNuL/o5PBHm8qrg==
X-Received: by 2002:a05:600c:54c7:b0:43d:683:8caa with SMTP id 5b1f17b1804b1-4407076031dmr2922635e9.15.1744965460792;
        Fri, 18 Apr 2025 01:37:40 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d5acec8sm13487175e9.16.2025.04.18.01.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 01:37:40 -0700 (PDT)
Date: Fri, 18 Apr 2025 10:37:37 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: iuncuim <iuncuim@gmail.com>
Cc: Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Subject: Re: [PATCH 1/6] thermal/drivers/sun8i: add gpadc clock
Message-ID: <aAIPUcS_cNRHoxwq@mai.linaro.org>
References: <20250411003827.782544-1-iuncuim@gmail.com>
 <20250411003827.782544-2-iuncuim@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250411003827.782544-2-iuncuim@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_013742_619616_3A6EF460 
X-CRM114-Status: GOOD (  19.96  )
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

On Fri, Apr 11, 2025 at 08:38:21AM +0800, Mikhail Kalashnikov wrote:
> From: Mikhail Kalashnikov <iuncuim@gmail.com>
> 
> Some processors (e.g. Allwinner A523) require GPADC clocking activation for
> temperature sensors to work. So let's add support for enabling it.
> 
> Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
> ---
>  drivers/thermal/sun8i_thermal.c | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/thermal/sun8i_thermal.c b/drivers/thermal/sun8i_thermal.c
> index 226747906..1f3908a60 100644
> --- a/drivers/thermal/sun8i_thermal.c
> +++ b/drivers/thermal/sun8i_thermal.c
> @@ -66,8 +66,9 @@ struct tsensor {
>  };
>  
>  struct ths_thermal_chip {
> -	bool            has_mod_clk;
> -	bool            has_bus_clk_reset;
> +	bool		has_gpadc_clk;
> +	bool		has_mod_clk;
> +	bool		has_bus_clk_reset;
>  	bool		needs_sram;
>  	int		sensor_num;
>  	int		offset;
> @@ -89,7 +90,8 @@ struct ths_device {
>  	struct regmap_field			*sram_regmap_field;
>  	struct reset_control			*reset;
>  	struct clk				*bus_clk;
> -	struct clk                              *mod_clk;
> +	struct clk				*mod_clk;
> +	struct clk				*gpadc_clk;
>  	struct tsensor				sensor[MAX_SENSOR_NUM];
>  };
>  
> @@ -417,6 +419,16 @@ static int sun8i_ths_resource_init(struct ths_device *tmdev)
>  	if (ret)
>  		return ret;
>  
> +	if (tmdev->chip->has_gpadc_clk) {
> +		tmdev->gpadc_clk = devm_clk_get_enabled(&pdev->dev, "gpadc");
> +		if (IS_ERR(tmdev->gpadc_clk))
> +			return PTR_ERR(tmdev->gpadc_clk);

			return dev_err_probe();

> +	}
> +
> +	ret = clk_prepare_enable(tmdev->gpadc_clk);
> +	if (ret)
> +		return ret;
> +

Why calling clk_prepare_enable() ? devm_clk_get_enabled() did the job no ?

>  	if (tmdev->chip->needs_sram) {
>  		struct regmap *regmap;
>  
> -- 
> 2.49.0
> 

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

