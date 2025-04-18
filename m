Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28A36C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 08:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hBAVQUSIG8/FVcTA2w6Be8v3FlriNZP6ZHZpLpZIhIc=; b=ZRsKM+mS2go/VqkN+kq9lHhGYq
	39j86CvizjKGehAN2e/5WY6GIqWD0u10iUcFvyha4NXFU2tThdT/J66FsG/10USG7LrNztt2IEQoO
	I2pa88+lnxRIiutspETkCfw2Z0jsfcMJoFeo3+zEGOq5CNLnosV3G+jwLiyoR86bx3DMQvYgmYhs8
	Bln8gt2lsMf9VPoSsbZy+WyQjInj0/+6lWgzbmJuEUXdgiyMUJV1/FP0S7v8K3BNVgFoRHrsahha+
	b+YKiWXDJPj0EyVBpUXDkt+Q77QhrJs56xzNAhcd7J6j4Z6oVHreD1yukcKmrp/IxQRw0z+QYf6KB
	LoSTG8Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5hDu-0000000FdpI-1r1A;
	Fri, 18 Apr 2025 08:37:22 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5goi-0000000FaAt-0jvc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 08:11:21 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43d0618746bso11574425e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Apr 2025 01:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744963878; x=1745568678; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hBAVQUSIG8/FVcTA2w6Be8v3FlriNZP6ZHZpLpZIhIc=;
        b=DLwHJf0hKkFcebVIoSoMTVgZWQlaouAqAqMtTyofdFHT/l1NIcUvAgPZKiLUSYW2CR
         LWb2FomurGeJkfE3i2PflTIEoo3cVZp5lWJmp72q2HTI8fconBH3zXNYZ1rDjx/UNxsA
         CefbbEBrgufsy16q++XLcjPvMp/KrHqbkVhPbRKADuAF44OZffji1Wv/qzRTpSs84IV/
         ttaKSvs94nZmprO3UjB0Qel6pSzwBL0KOi6NdsZ2u3gUP8jwjX4K8y/Ci79mfQkEZ/3e
         0Vp2en7J44pJRRicVy4iRG/ufTIYdpXPYm0lN1Q6NXxCpCuu9qORZESScvwgo9e3qpNO
         /0+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744963878; x=1745568678;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hBAVQUSIG8/FVcTA2w6Be8v3FlriNZP6ZHZpLpZIhIc=;
        b=jKnJl5ZZk88GwQ4H+d1060vCUov3pQiqEbiPZNo+nmLyVLtD8GbJG3+fOPBSaGw0GP
         6HjIz2dpNOCQkrldktVatXMMOz0G0oS6XLIR+K1XgBNYIMx9w2Qr2wGt0TwEZZf3IoMU
         EnBZX8szdCx4iGj4RKeacrSztH1dnJQp6ojAwtLguCrG3zDN3aBV/w4U2MAOQWtl0sHN
         1FsYC872HpzHK4H4mW+grcwO009M33WUIVT2zoWcEzlZQoJTmuNmp4IZOXQrUnfrI18f
         oVjUOiolp44jkAw4uxAHodtH2yz2SJvVuS/Nd1RNSHLhwAS6yitP5P+dX6qs4FnPmvYX
         m68Q==
X-Forwarded-Encrypted: i=1; AJvYcCUs7R/OAg8pygghtACpgWwaenrG8zOwBysXVRG00yk54UdyRSmlu+8nIqcWCSF7JkZ8L/nHeIY1lbH+SG4yEUBs@lists.infradead.org
X-Gm-Message-State: AOJu0Yysf+Abd/do21Zy/wdrK3FHEIWCxHnPmJyGEDCZuxJBJiZOrKeM
	P/HukANzk/XhO6J/CDwITudfZVdjbWs2LMPccqW/7TjK8B8dEmgoM2AUzeiqGP4=
X-Gm-Gg: ASbGnctBk7WrHy/FbAucIU+anmLxpGxEzVL/BLm7hFO3f7JdknWQCRRfJJZf9urG5VU
	UlfjN8eSXP9fDSJ9BWyUwEqNot9W3R0ON8nG56/fqBH5s/r7lSn+/F/ZoVbn8ClCxCvrsGnclI8
	6+YktoKtAo1E4tNsm1r3IEDHaTj3zrg5CHpMe0HqDbiv2xCzRX0XY7GoBCLm5z4ZFb/TwszGOex
	C5ZTrlaQc3jBRGXfzkDK6i651AkPohhIzPL3cKQS3BN4XPB2KiGhJrZIcLqihrGGs2zwAwewN/l
	4xwib+XAvGe6poGT/ifEat5E4n0WOpTW0CrzpB5xu3X+DBiOMG5j3GxtZq/YEve3k4q3zYgtZcQ
	kuBz1K7rxbZfL8Q==
X-Google-Smtp-Source: AGHT+IEqy72HPc2JLxk7cwyoLf4zIk+ZCEFJN86qbQUa/AJZooBD3mTTOHD22C31nQiUieXQmKAm3g==
X-Received: by 2002:a05:600c:4ecc:b0:43c:eeee:b70a with SMTP id 5b1f17b1804b1-4406ac0aec8mr10500975e9.22.1744963878336;
        Fri, 18 Apr 2025 01:11:18 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d5bbd12sm12743035e9.20.2025.04.18.01.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 01:11:17 -0700 (PDT)
Date: Fri, 18 Apr 2025 10:11:16 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Anand Moon <linux.amoon@gmail.com>
Cc: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	"open list:SAMSUNG THERMAL DRIVER" <linux-pm@vger.kernel.org>,
	"open list:SAMSUNG THERMAL DRIVER" <linux-samsung-soc@vger.kernel.org>,
	"moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Subject: Re: [PATCH v5 2/3] drivers/thermal/exymos: Remove redundant IS_ERR()
 checks for clk_sec clock
Message-ID: <aAIJJKGif3i3-97g@mai.linaro.org>
References: <20250410063754.5483-1-linux.amoon@gmail.com>
 <20250410063754.5483-3-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250410063754.5483-3-linux.amoon@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_011120_223669_A3191977 
X-CRM114-Status: GOOD (  19.58  )
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

On Thu, Apr 10, 2025 at 12:07:49PM +0530, Anand Moon wrote:
> Remove unnecessary IS_ERR() checks for the clk_sec clock,
> the clk_enable() and clk_disable() functions can handle NULL clock
> pointers, so the additional checks are redundant and have been removed
> to simplify the code.
> 
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>

Typo in the subject: s/exymos/exynos/

> ---
> v5: None
> v4: drop IE_ERR() for clk_unprepare() as its handle in earlier code.
> v3: improve the commit message.
> ---
>  drivers/thermal/samsung/exynos_tmu.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
> index 3657920de000..ac3b9d2c900c 100644
> --- a/drivers/thermal/samsung/exynos_tmu.c
> +++ b/drivers/thermal/samsung/exynos_tmu.c
> @@ -258,8 +258,7 @@ static int exynos_tmu_initialize(struct platform_device *pdev)
>  
>  	mutex_lock(&data->lock);
>  	clk_enable(data->clk);
> -	if (!IS_ERR(data->clk_sec))
> -		clk_enable(data->clk_sec);
> +	clk_enable(data->clk_sec);
>  
>  	status = readb(data->base + EXYNOS_TMU_REG_STATUS);
>  	if (!status) {
> @@ -269,8 +268,7 @@ static int exynos_tmu_initialize(struct platform_device *pdev)
>  		data->tmu_clear_irqs(data);
>  	}
>  
> -	if (!IS_ERR(data->clk_sec))
> -		clk_disable(data->clk_sec);
> +	clk_disable(data->clk_sec);
>  	clk_disable(data->clk);
>  	mutex_unlock(&data->lock);

To be replaced by devm_clk_get_enabled() ?

>  
> -- 
> 2.49.0
> 

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

