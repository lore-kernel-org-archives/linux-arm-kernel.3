Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F1B4FD2D64
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 12:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UGYa5Q4cyUckI5eNtSwyfOWNmMFs0j1Kmh9C/7v1S9A=; b=IBMwI+6d+jvY7uO7akRqQmtj2R
	hDSR28Wca9K4kznXtl5F6ysgTgTYQa4NvvfjJ10pbY4pi4QpRbQOH0VNw0EoRs//EHx3og5FEkYeX
	qp/McY79ss0XtIpxCXxW4c5t7RctQxRht9Y52872PpW396uKh7nHjhxuirFp422KL/Y+m0kubd/WZ
	8wXwuhrM05LKT8VPDg9gcD+0pbzhtolI60nXWXiOIZOLJxfuHidStx+0nSBNQ50e3VAPlyk3+Ekr7
	MKMYbyK3vKlYIcbsDOK2nhFgpxz3bLXRbAcA6W2DRbMP6FmWxGDjok2RthCwiSL1cniEYJAsz/1yJ
	ryNn2wYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzvpt-00000009RrU-332e;
	Tue, 10 Mar 2026 12:05:17 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzvpq-00000009Rqh-20QB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 12:05:15 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4853e1ce427so21677675e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 05:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773144312; x=1773749112; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UGYa5Q4cyUckI5eNtSwyfOWNmMFs0j1Kmh9C/7v1S9A=;
        b=vFODbYob/C3vZO4s8wRG4m3uiokkJ0oklezCWos3FloHDDbiRVpDxQsjeA4p9he9DJ
         MxN5C31a9rEvyHvMwOZsJ4/GT6iIAH6Cv3XabqDscn4w4UqiJpLXnmoY7Op5+Vxor9jj
         /sD8X4C6X//3Yp6cXHhmfCJ3LQNT8tmbCFjKG/+TKQAat2AYKwMbWXsXs0X0yu35Zmqf
         iMMHdvlCpZaDM8KxwoADjyFsWGq4VCmnbXJJL6ZS+RnTs+/EolOMd6m690HyT7L6xyQK
         h9FQlOK5zAdKcfUwPgakVTA98oAoJQMYebeHIlLsSmhhP8RCbxRQmpNJEBBpYq+cZwpL
         EUJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773144312; x=1773749112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UGYa5Q4cyUckI5eNtSwyfOWNmMFs0j1Kmh9C/7v1S9A=;
        b=JAvbejWnDaQHGIopbs+wTDTkgJseSL4V59HAUzw1vXHYh6ucdCBqXogeY/GZL89Y2F
         RDGxMgRZ44c87uvt5RFjSZE+jX7jGYhHAC+FgUuEXA+noMYWGxmGjf4y4sT0ZU92b02W
         ExS4TbeXPTFpaNXa2LDNbe9pdpHem3sTPV7LC2ZEBD2COKx9PsEfJHJQv5aCWZihCkUK
         h5ZKnlqPx/dWYEuh7Nchvt6uQByQUEdQl9mfqBb/sKVAXUWA4Yibr0uiWz1wssEO6vXU
         jFGWcGb8UFpJWSAQcwuBBmC9iBwrcFzj0VqzCAAvSOZSUjzFB1HGhDqcJ8DG37UNj8X6
         agNg==
X-Forwarded-Encrypted: i=1; AJvYcCVezQOSGiz+OiFLOzDVm4dzHLLW13B+CalKujE8QAEwhYMUDoJw3tV8fIuZ7WBVqQHWQa48I+pMMMc6jTsTfqLY@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3Ybm2S/xo8strCze1Pq/DPI7B7f1HYyu8L4BSsg21UxqAWVOG
	Gnj6ogIQMlgPLyf6uKOJheaOPkxm4KIfL1X703EAGLq9kNygwzNGakvGahpAAV/dcbc=
X-Gm-Gg: ATEYQzxPyuJ0kpfuArywmbcjKdo/g6W1HsjAp3l1nFH0MZB3B9N4H9W6v1kKMsxpJ1x
	qHJ1UqvhY2tdReLVEYdYtc3eALOp72Q6L7qNsgMVvaeFaNgUB04TZmTWgCytGDx34VrUmuH1Y7a
	P6y3QPAaVE1TzcHn7hR+W2AghsItH2RUutUAm/1tzZScxhNNaMLCZkJ0ZRciNUjABXOUG2H8RBt
	4bMCT9zJ9ooj2hDJfKN8rjFKXstvw83Ty1rt4fKsTgNQqiOtCQgbKXCP0LHxtEDAPGrm6M8P7hh
	HYNDw3+vqfjUd8GYguAqIASDE4F1DxDWHv5+MY6Zlm8TDWdGiBv1dKwFiqIDgGZOOEsyDikPC0j
	L80eAb+HY9j2Q/WubsjGGGpXTbJ5LnDyfNXaTWX8jjGcnHKDhlVkWdoyRSNQWlE1fn0A8nVpFMZ
	jEqJSxX4AyYoQSgl1MiUlSixKAPoruUQA=
X-Received: by 2002:a05:600c:64ce:b0:485:3ca4:4ef4 with SMTP id 5b1f17b1804b1-4853ca451d9mr96446965e9.9.1773144312371;
        Tue, 10 Mar 2026 05:05:12 -0700 (PDT)
Received: from [10.11.12.108] ([79.115.63.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485358cd26bsm133729565e9.8.2026.03.10.05.05.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 05:05:12 -0700 (PDT)
Message-ID: <fe5c34fe-9ddb-4a7b-ac2e-5854c624abaa@linaro.org>
Date: Tue, 10 Mar 2026 14:05:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT] mailbox: exynos: drop superfluous mbox setting per
 channel
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Jassi Brar <jassisinghbrar@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260309074210.2279-2-wsa+renesas@sang-engineering.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260309074210.2279-2-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_050514_558883_B96E97FB 
X-CRM114-Status: GOOD (  18.49  )
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



On 3/9/26 9:39 AM, Wolfram Sang wrote:
> The core initializes the 'mbox' field exactly like this, so don't
> duplicate it in the driver.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Tested-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
> 
> Only build-tested. Found because I made the same mistake in my
> to-be-upstreamed driver and then looked for that pattern. Testing would
> be still much appreciated!
> 
>  drivers/mailbox/exynos-mailbox.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/mailbox/exynos-mailbox.c b/drivers/mailbox/exynos-mailbox.c
> index 5f2d3b81c1db..d2355b128ba4 100644
> --- a/drivers/mailbox/exynos-mailbox.c
> +++ b/drivers/mailbox/exynos-mailbox.c
> @@ -99,7 +99,6 @@ static int exynos_mbox_probe(struct platform_device *pdev)
>  	struct mbox_controller *mbox;
>  	struct mbox_chan *chans;
>  	struct clk *pclk;
> -	int i;
>  
>  	exynos_mbox = devm_kzalloc(dev, sizeof(*exynos_mbox), GFP_KERNEL);
>  	if (!exynos_mbox)
> @@ -129,9 +128,6 @@ static int exynos_mbox_probe(struct platform_device *pdev)
>  	mbox->ops = &exynos_mbox_chan_ops;
>  	mbox->of_xlate = exynos_mbox_of_xlate;
>  
> -	for (i = 0; i < EXYNOS_MBOX_CHAN_COUNT; i++)
> -		chans[i].mbox = mbox;
> -
>  	exynos_mbox->mbox = mbox;
>  
>  	platform_set_drvdata(pdev, exynos_mbox);


