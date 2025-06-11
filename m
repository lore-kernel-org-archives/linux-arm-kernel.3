Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA22DC71141
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 18:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Onw+F7Njzqx9qJlT9wI5+vJ8uzypmHxvVhvYZXMTUQc=; b=Y5UCq8+6PDMaLqd66w4UgoUGYY
	xF8rnMuBjNVMWtjjurVByGDsPINN0kg1luozxf7IzGSuVemGVQ9zi3MiAsfzh34xO8tSQnbrG2x85
	JXS9gXPSVgs8bycduUmSfJUxbLmFdxtJcCo9HlzMQZCjipUS1zob1SHCBYKRJDe0cma9gwUaDVKV1
	NCDkAiUhYkgK9UmFhuflB7Tzvj0VzXb9UrTGQny34kS1GF8Pw4d0UHoHodvFADTDCFHNJl76MsRHN
	qkGtvwW06aec4dDfXLO5LYmK0TN19cPvtwTiW+MZ5g7W5RrKdayxr7+ie9gbhhUKMV/hOzpLE8Mle
	aptKZbeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPPk9-0000000Ame1-1J2S;
	Wed, 11 Jun 2025 18:00:09 +0000
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPLxP-0000000A1Pt-16h0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 13:57:37 +0000
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-408d7e2ad03so4234236b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 06:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749650254; x=1750255054; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Onw+F7Njzqx9qJlT9wI5+vJ8uzypmHxvVhvYZXMTUQc=;
        b=ZdMiUc2elY15BzK8mvZE2AS2Xr2Ebjm+gwqzNbo/xYjQp9zyJLMH3cv3mVdB0AAiYA
         zkwHYkelhXzPhEZHI5TGpbyLbPRMei3jPv35jixR+f0yNK3f4k4Kro4TwS6rsr6fYyAK
         45VYYwIPoDUF74/WMgtsbBxwAojn6/ncwton1ERouXLm4EZxWz+1XfVxg5DBpbYLUYsM
         EygCjo7/xjCgACZDZRcGbGJ31vm3cqLIdwlqRYFseGEVkwC2SSinLb3WAJQehxir8CAX
         PkXa/xTHeS/7htKwQGZVsIMFyifM56+VYoT6HVsxUb0d1S8tkOKzVNJk/Y6a4Idg9Iuz
         NH1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749650254; x=1750255054;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Onw+F7Njzqx9qJlT9wI5+vJ8uzypmHxvVhvYZXMTUQc=;
        b=qJACFRcx6lDIdSOB+VAnsCyZf25VhP3a7D7jmuPCs+QgZl4aGu1yyp+Tlf6Uh9SY+q
         otbjQaBr9u//Z8EO4Fpqon6wn5b+smhITEgK9QSSL9iY1vFMclEF/1pd8+j0PqQq83+o
         gzWWgPRnlAtFgaML+lewIbApNmQWFaNU3IdNGELJhur002Mo3/erZHpo+k1NAO7jvfyS
         lt7EQZ4O+bpE0f8qZHT/POiZEec2t3CCK9c/JAh9QvHtEmMrrtaPbtNCkpKTngJNWoJ0
         5Vtj3GuR96PXaS8miSNWuL4k5sPpW62PhRJF6mrSIhSkcpCg/+DGBmegMMWZBZMBXdf4
         yucA==
X-Forwarded-Encrypted: i=1; AJvYcCW6HeDaM4dPWrIUzZ5r8UvBPAhLiWfNcRTxWMvvVL4qbiIx42ZOFZhpj3gKyjbn3JqDEcrtDD5vu7pENYLVHGlw@lists.infradead.org
X-Gm-Message-State: AOJu0YzyLmlbSz/7LXn4zZmJZDtf3xhgKTYaodr/+o+2a9I2yBCuORWO
	vBngtRsqATF4HMPXb6TGr4jTqe6aaPHOUYinrKMHg21Wzu+g2CAB/OCpIlO1YVmMs/s=
X-Gm-Gg: ASbGncuRd7MocFDhPnIdCC+B6tVNFpGTUG0hAgowY9Q6cnoMIYLieWyUIJL6EDAAwve
	MgScmN5FCPFW4hyBSenDd3VPyHabp0kXjsWgBer0y/x5ZNYJwLhlqWYITp98CmBhECFJP+DbKkC
	FczgSYnXKtjc7dMVk+el+CKTOGFBa8M5kTlzRxbZ7gM2pogjbJOOQt0wFbvGIKYf6rYjv/uIwPA
	dDFEEtvM7aLlLkJURylfvE5E6Mz8tS3M3vUcGmTuOuONFSyJQ80z+1j8m1WgiNXJQTZ/WyzPP59
	JE6BTWcivHzEACC56qLv8u4g5FG4bs5bt2SVMwZPjdKHo/GUjyQhqMayiJ2UHveFEax7p2ni/pu
	uNO10spt3TV2c91KlnfxhSjElsZJXTJV+9Ad0
X-Google-Smtp-Source: AGHT+IHHOJ7UPUjqfa7Ax2DODQaNiUV5DY9O1oiua1yOw8frXqBPksX3fFK+2Qk20HoobYMoNjVxXw==
X-Received: by 2002:a05:6808:21a4:b0:3f8:3eeb:11a3 with SMTP id 5614622812f47-40a5e0a6824mr1694522b6e.11.1749650253782;
        Wed, 11 Jun 2025 06:57:33 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:eb6c:30d1:632b:494? ([2600:8803:e7e4:1d00:eb6c:30d1:632b:494])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40a5d941cbesm333645b6e.24.2025.06.11.06.57.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 06:57:32 -0700 (PDT)
Message-ID: <0ec0fd5e-8fbe-43c4-8aad-f36d2872f280@baylibre.com>
Date: Wed, 11 Jun 2025 08:57:30 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iio: Use dev_fwnode()
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>, linux-kernel@vger.kernel.org
Cc: tglx@linutronix.de, Jonathan Cameron <jic23@kernel.org>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-iio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20250611104348.192092-1-jirislaby@kernel.org>
 <20250611104348.192092-9-jirislaby@kernel.org>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250611104348.192092-9-jirislaby@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_065735_410869_BDDDEA95 
X-CRM114-Status: GOOD (  11.79  )
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

Subject should be "iio: adc: stm32-adc: Use dev_fwnode()"

On 6/11/25 5:43 AM, Jiri Slaby (SUSE) wrote:
> irq_domain_create_simple() takes fwnode as the first argument. It can be
> extracted from the struct device using dev_fwnode() helper instead of
> using of_node with of_fwnode_handle().
> 
> So use the dev_fwnode() helper.
> 

...

> @@ -421,10 +420,8 @@ static int stm32_adc_irq_probe(struct platform_device *pdev,
>  			return priv->irq[i];
>  	}
>  
> -	priv->domain = irq_domain_create_simple(of_fwnode_handle(np),
> -						STM32_ADC_MAX_ADCS, 0,
> -						&stm32_adc_domain_ops,
> -						priv);
> +	priv->domain = irq_domain_create_simple(dev_fwnode(&pdev->dev), STM32_ADC_MAX_ADCS, 0,
> +						&stm32_adc_domain_ops, priv);

In the IIO subsystem, we still usually wrap at 80 characters so
wouldn't want to unwrap the lines here.

>  	if (!priv->domain) {
>  		dev_err(&pdev->dev, "Failed to add irq domain\n");
>  		return -ENOMEM;


