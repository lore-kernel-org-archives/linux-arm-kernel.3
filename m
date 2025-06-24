Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C8E0C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 14:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sOKIm9/dJcTZ6ipUeMx8GILyup6CNf+4evU6I00WnKE=; b=KDHSXqhbPGKmOzVLvx6G7vwYKT
	uFuwL3LMOyK4WdDZ+d423S4NsMmshS06yQAPqsKsekW4bRURRKGy2xHRkAcnzgxGrkoNWD2Gbsr6W
	u2b+9Jb1ZMvNGrPTRQPKu0pcAlieNbTBnxpH7B2+g36U50qBgONbxd/XjSLzTQfUN9it+/Vf204Gt
	KNAdTh6PH6hm9M7YFHH8yeLnyHMfYgHr/n1qTeZilIYbmsfe4GTQHdXU5ka4Dvaa5PwI5t4n+Ds/K
	Haj0cmNZYa9lLlw4WqL6Za6Qo6BlRBP+TERn3hmL5vGlT30xXIPCazLJ6M5Uem9Zyn92KOhpXql7q
	TsdlrJCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU4U8-00000005sTT-0nfi;
	Tue, 24 Jun 2025 14:18:52 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU40k-00000005m19-2P1I
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 13:48:31 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-45310223677so40757785e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 06:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750772909; x=1751377709; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sOKIm9/dJcTZ6ipUeMx8GILyup6CNf+4evU6I00WnKE=;
        b=EgO3rg9t/eRe6rWDZNGLgnay9knBnu89xPC0rwo0iuxSRAEuSFFkTShn0TDKKH4KXW
         usU8gXVxp5YRkIlsRWKfFuhwWUvb+UBxJi256p1a2QxTxtLnE3xh6sBiXPKPUvrnOpf1
         PJuhTGLGTMntjSh25RRjcmKQL3HXJIJMmGV7KiovQeN9cRlWx1toaKddM/pQ+QDXd1Zc
         S30ADYZH99i8rChePSOu8Gp8AnuT9FNCk6MLV/JSDNhfTEwvag7vrHcxDLYk7LCkyUJj
         V7vusdTuch2tznzlHrC8aP0o3s5CqeMDf7v76u0kAKokfTRHV96NwV8in6QA5OpYEwfS
         +A6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750772909; x=1751377709;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sOKIm9/dJcTZ6ipUeMx8GILyup6CNf+4evU6I00WnKE=;
        b=F2CdwkniKJh1RMJUVOW3E9SecSbVK2wcJ4nt3vPN3aayFHfUYTioEc1yXz6FaYYwK1
         nispTZUPfY3eMeNjC58LZOHNUu8VB2e40kLthXCstatfvs2M+Max5RIQrtgz4OojIYFk
         QAU/mRj5AvEcaXnCpLclOtN48un4LfIeO/PMo4LPUf4ljuEKXefXc1e0vHOPp5KC4hZP
         lfFbnMN8qzFIbd4uZrpZcIaOn+fc10gt7tjxxgJEwZwdAliueOpfw6UfVefDKvXMEpe0
         6Y3GpCvYFXsvuS8tAOPFwRmqPc2mCsfP6SQh+lbkP1kK2yOgCUfqVXiuZda9czg1YB9E
         NIqA==
X-Forwarded-Encrypted: i=1; AJvYcCVob5m+lqZLC1fdrfBiwmHcux3QbVws+LeuHN7aspc6Lc0JIQIjhWYyOmyByw+/lHL14E6dv1JVzbZtXIPop9YW@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9180dzG9p+AZHMuXsO/X3Lm9dqMC5nZy7ZcRCAzCij5Y//3Ho
	YbIohEXzi46DqPeH3gR5K3T1NOciBpU6pJLkflTvKO3cZRKk/FnVJNbLrIeIpuqNB6E=
X-Gm-Gg: ASbGncunrBuUyNbWE/1nTtBE0ZHN9wmlPcMgSF+bzgOEdhYjuCpdiHj5K62G1KzBue/
	tDCcrr8R1AVVUc+MHpZBWRlBnKPkT2uUgFeSJzZ+qz7zEg1/OH5I2kvQ1HmRFG/4Z5S9bV209v6
	Fnlnv5ttnDPWwsqqmQxx3Jx9aWVOgPYtg5HDPQAa+Px0v7zLvxOEqeu0maNv5SdwA4RB9uWSJH9
	kMHBzzuhG88VFJ3WObMY8Z2vRuEGvAafzC7KkYsHsP5vQFdnrRWDhUemyrgb7TegEg1lsUCYiVO
	Aw7jgM2SiT4ouI4++pYxpIHs9v8+zpOf5yL/lk5awrV/bg4BIsJhQtBbsuonsK2Eqp5oloPvN/T
	sZ9o+n6JyNIqpGbgQxOAK1+S/
X-Google-Smtp-Source: AGHT+IHZM/Db3rJ671u0WvDIe/VvY5UdAh5v59kB6hTOoptlOF4+lnhl6a+lk700LR1ins07EJj9kg==
X-Received: by 2002:a05:600c:34c4:b0:450:30e4:bdf6 with SMTP id 5b1f17b1804b1-453659dccb8mr147036145e9.19.1750772908848;
        Tue, 24 Jun 2025 06:48:28 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453646cb5ecsm147323495e9.8.2025.06.24.06.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:48:28 -0700 (PDT)
Date: Tue, 24 Jun 2025 15:48:26 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Will McVicker <willmcvicker@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Donghoon Yu <hoony.yu@samsung.com>,
	Hosung Kim <hosung0.kim@samsung.com>, kernel-team@android.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	John Stultz <jstultz@google.com>,
	Youngmin Nam <youngmin.nam@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 5/6] clocksource/drivers/exynos_mct: Add module support
Message-ID: <aFqsqr7i7cdR5-I0@mai.linaro.org>
References: <20250620181719.1399856-1-willmcvicker@google.com>
 <20250620181719.1399856-6-willmcvicker@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250620181719.1399856-6-willmcvicker@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_064830_618165_47D0D9FE 
X-CRM114-Status: GOOD (  21.54  )
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

On Fri, Jun 20, 2025 at 11:17:08AM -0700, Will McVicker wrote:
> From: Donghoon Yu <hoony.yu@samsung.com>
> 
> On Arm64 platforms the Exynos MCT driver can be built as a module. On
> boot (and even after boot) the arch_timer is used as the clocksource and
> tick timer. Once the MCT driver is loaded, it can be used as the wakeup
> source for the arch_timer.
> 
> Signed-off-by: Donghoon Yu <hoony.yu@samsung.com>
> Signed-off-by: Youngmin Nam <youngmin.nam@samsung.com>
> [original commit from https://android.googlesource.com/kernel/gs/+/8a52a8288ec7d88ff78f0b37480dbb0e9c65bbfd]
> Reviewed-by: Youngmin Nam <youngmin.nam@samsung.com>
> Tested-by: Youngmin Nam <youngmin.nam@samsung.com>
> Signed-off-by: Will McVicker <willmcvicker@google.com>
> ---

...

> -static int __init mct_init_spi(struct device_node *np)

__init_or_module

> +static int mct_init_spi(struct device_node *np)
>  {
>  	return mct_init_dt(np, MCT_INT_SPI);
>  }
>  
> -static int __init mct_init_ppi(struct device_node *np)
> +static int mct_init_ppi(struct device_node *np)
>  {
>  	return mct_init_dt(np, MCT_INT_PPI);
>  }
> -TIMER_OF_DECLARE(exynos4210, "samsung,exynos4210-mct", mct_init_spi);
> -TIMER_OF_DECLARE(exynos4412, "samsung,exynos4412-mct", mct_init_ppi);

Are you sure this is not going to hurt the ARM platforms ? Here the
timer is enabled very early in the boot process while with this change
the timer will be available later.

> +static int exynos4_mct_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	int (*mct_init)(struct device_node *np);
> +
> +	mct_init = of_device_get_match_data(dev);
> +	if (!mct_init)
> +		return -EINVAL;
> +
> +	return mct_init(dev->of_node);
> +}
> +
> +static const struct of_device_id exynos4_mct_match_table[] = {
> +	{ .compatible = "samsung,exynos4210-mct", .data = &mct_init_spi, },
> +	{ .compatible = "samsung,exynos4412-mct", .data = &mct_init_ppi, },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, exynos4_mct_match_table);
> +
> +static struct platform_driver exynos4_mct_driver = {
> +	.probe		= exynos4_mct_probe,
> +	.driver		= {
> +		.name	= "exynos-mct",
> +		.of_match_table = exynos4_mct_match_table,
> +	},
> +};
> +module_platform_driver(exynos4_mct_driver);
> +
> +MODULE_DESCRIPTION("Exynos Multi Core Timer Driver");
> +MODULE_LICENSE("GPL");
> -- 
> 2.50.0.rc2.761.g2dc52ea45b-goog
> 

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

