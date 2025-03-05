Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AD11C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 17:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=alT+zALmOJxTVW5BnA8w1UfBmWenGfChKrkcnTMAdpQ=; b=uqBAdIPBy1c+SpEhWNUVvDhZUh
	C0m8dw+3Z0euRvXfkKP+SRr0PR6Le4QPDg2BnDtzRgR36xv7gXCDTb6rLCWCatdY4GcoNKvt+6AvT
	vN+8mbiuIbjGAwYLrPDjPNl+bCO9/kNoWqURVYxzmLi2FnZS6e5WcA47uwDPtBaJV8itahZtk65YD
	00FilCTyr3pBuRjsTS82v4U16LP0LJhSA4EAhJQYA972oqzFEDAd8W6ogHRvNIQUrBO8Hdvb/Luy3
	E7gVcHzu/DekgFI7qfa6ij8Yukk7UsWyE4ap4GNPv9RnbMm6cDOct7rSyTrlVh1ZQZKk0mdrtGqyF
	2XfohTbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpsUC-00000008nCU-3vZs;
	Wed, 05 Mar 2025 17:24:48 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpsSb-00000008n2A-0Cgk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 17:23:10 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43bcf9612f4so13990535e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Mar 2025 09:23:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741195387; x=1741800187; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=alT+zALmOJxTVW5BnA8w1UfBmWenGfChKrkcnTMAdpQ=;
        b=iY4LWKwGZMMckB9mmJn43T1rjTyPf8N2WT000YqV4WmqnN90zt4VCqqQvfXlyJXT9A
         Sgx1g1mOpnzjIgxlngpGDRIatawCIUk3L2lY/bF8hXyM2FvE7duNs/fJfQ4yAE54YdBf
         6BR7ipMOcKN8r+Ao5eG16mPag16B5lQgNfRUgNLgzJuskwHqJHwUKtIcWm3pZFSndutj
         Xtik/uEsawxMacMHsjuu3BEzB1912bYseAiXHnSrTn2CBYWTQ/ShDvByvshDEWPfkIIz
         2+ylbU8zIs88of/o4sPcV/R5RlOJ1gXDmPtyLkR+j4osaNL6QD457ODdunWX1Pu3FkmZ
         gU2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741195387; x=1741800187;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=alT+zALmOJxTVW5BnA8w1UfBmWenGfChKrkcnTMAdpQ=;
        b=qIErLyafarJ7BocmYipkdOhKeAJGQHoTeQ83P3dA3VUO6lGvkY2wjpuJMhNfFYXfd9
         IzRcjpoVOXq6RfBMYJIHTdpBQ364qnWyxwTKZg09u92LeC87wEo0nHCAabgq7Kz1b6MP
         KNeUbE090bMsL1zG3a6052PTRnP7xv9Zt2nBe6KV1fNZdB2Cbp3IcTJOlKHctrC5qdro
         vdaLYfnpfKF6yvYDZxxFBoDyXPDvqv60ZvCYnwLhFkXMvgC8xw8eea2hntW+26b8o7dj
         HaKbzOU/jTYtP+byDGyME46D6eW7EaM63qeZLhkREv4zETni0DjLGo2gcsX6G2Gtl0tG
         40uw==
X-Forwarded-Encrypted: i=1; AJvYcCVaQuzgr4VlVqnjzkhFKU8A3Sa+BtXvydGuy89TFh2zIAKQfUd97TKUSTXdsa6BptcXJxdck0n3UKzELVvHVRm+@lists.infradead.org
X-Gm-Message-State: AOJu0YzOEtmSuV2BM8JA2bjYuyzNjbOt1gsql+Wau5qjQaNVs0k0QLe8
	hHqb7SS/YAa86moVqhsIocwuU7tvYDsNejfkeLwohC1fye4Ja3+XJyTPYhAPQFvk5EQjeU8v7Y3
	wOWI=
X-Gm-Gg: ASbGncv06/ARXcPZ9TN/w6HGP1q6q6V9/0yY9MuSCr7oSVK9nESfZUnxtTSL0+lJzHs
	13xYVn8NXTL98ekx7wcSyGj+zR7Y4urW9w1JKFLCDqrxPZHgSF8H7x8R09movqOj5GPz0JnPR4K
	/QQIUavem3nExlVeSsCkyznRsEUiQmtOkqkzsSr5lIF1mZa0YIXtUVQi7+VTRVR5VK2fJ4hPbPK
	NnivyGSy0r+tmTa/GULV6EqkaFLRJBruKXfBc9oL7gOJ3L33ulsz0iI6LQ5EQQ4eovsInswRKn1
	Y0poXheCNie1iyzh9ugP2CUTLlCubwyhCS/GZCZB64PdndoI3YGUBREzKh2Zcj0V0v/VmSYr6NE
	w0dwyQ80B
X-Google-Smtp-Source: AGHT+IGpqFVx176QiSlOJSi7wc2dopFl/WDHZbSXP9T991xV1xy9GzI6/Dnmfiz+XboGhP5rub1OWw==
X-Received: by 2002:a05:600c:1d0e:b0:439:969e:d80f with SMTP id 5b1f17b1804b1-43bd2aefa41mr32049945e9.31.1741195387395;
        Wed, 05 Mar 2025 09:23:07 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43bd42c8050sm23402385e9.21.2025.03.05.09.23.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Mar 2025 09:23:06 -0800 (PST)
Message-ID: <a7489f16-ca31-4530-8ef1-33079b3c99a9@linaro.org>
Date: Wed, 5 Mar 2025 18:23:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clocksource: stm32-lptimer: use wakeup capable instead of
 init wakeup
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>, tglx@linutronix.de
Cc: alexandre.torgue@foss.st.com, olivier.moysan@foss.st.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20250305125146.1858978-1-fabrice.gasnier@foss.st.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20250305125146.1858978-1-fabrice.gasnier@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_092309_100661_58CEEDD3 
X-CRM114-Status: GOOD (  16.02  )
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

On 05/03/2025 13:51, Fabrice Gasnier wrote:
> From: Alexandre Torgue <alexandre.torgue@foss.st.com>
> 
> "wakeup-source" property describes a device which has wakeup capability
> but should not force this device as a wakeup source.

Is that a fix to be carried on ?

> Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> ---
>   drivers/clocksource/timer-stm32-lp.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/clocksource/timer-stm32-lp.c b/drivers/clocksource/timer-stm32-lp.c
> index 96d975adf7a4..f08baa6720f8 100644
> --- a/drivers/clocksource/timer-stm32-lp.c
> +++ b/drivers/clocksource/timer-stm32-lp.c
> @@ -186,9 +186,7 @@ static int stm32_clkevent_lp_probe(struct platform_device *pdev)
>   	}
>   
>   	if (of_property_read_bool(pdev->dev.parent->of_node, "wakeup-source")) {
> -		ret = device_init_wakeup(&pdev->dev, true);
> -		if (ret)
> -			goto out_clk_disable;
> +		device_set_wakeup_capable(&pdev->dev, true);
>   
>   		ret = dev_pm_set_wake_irq(&pdev->dev, irq);
>   		if (ret)


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

