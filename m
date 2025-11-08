Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DCF3CCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Nov 2025 10:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HfKm+sCMoLv848O0IaBXkyVHVooRGLLewfD9ZUo50nE=; b=0eaJZsoS/qgNrRt4K/RLGb/D6H
	cDmgJCqgakV1SQa2I/idtBkteGfmjKpQmx9fa45zJE1z4UhahvET2Dj4FEx6bk5YCqVIGc64WfhTP
	FgexM/ZO38q4eFDtq/n7jwzUeo2E4yXQ0GezqHMuxWWXmtKTzvbGnpsyP8uRYwgtNUrp3vZmmta6O
	K4YCWTT+opOCr7iH4KfwX2pAIItX+HkSNA082dkidGsbt/zkbgmbu9rb3e94Wt16sK3APG+dTwJmV
	nmCeuFSnQoZIVKNbMK6ij9LnHPFG0Tsg3CklNaNAZL9Cihi/9fisBup7O8uhZqamtoOZ4AOYUp9AW
	X5lJlRHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHfjv-000000030TH-2UMo;
	Sat, 08 Nov 2025 10:00:11 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHfjq-000000030SQ-2Txt
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Nov 2025 10:00:10 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4710022571cso15162155e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Nov 2025 02:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1762596004; x=1763200804; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HfKm+sCMoLv848O0IaBXkyVHVooRGLLewfD9ZUo50nE=;
        b=BkYG9aI1KyCzMo9o8T8TE4rcAHrM+ylzGFnMV9+sdWFqFE8RJR9M/Qk4N+00LR6LRw
         gGZLJj7LvJ5s7bwIm4/0/FosxgJ4gYOseV1rh0rs5dHY5dxMSS41o3H/ilMH937mVuro
         KEeVBryd4kELOy0Gonw3+wavY+mGYl3HfNRCCNLP8Sod+HngHcwNQnwZKhR1vvdL/7Iw
         Nz1q9PywOYbBTAzZ+Jyc8NPK/eBmyU/1yOjsgkUbE219tG4ftB2A8hKdJOmSrC8RoISC
         LSxNYe2AyZJbyVD/jQEv/mlSQu8hvvmji7trsaQdRlMTe+yrA+t002f9Dz3E1wJbA6cE
         OIPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762596004; x=1763200804;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HfKm+sCMoLv848O0IaBXkyVHVooRGLLewfD9ZUo50nE=;
        b=xBy69cuhbxXTJaWq2LH8LUZDAk+1fR8X+gqUBvUVNvr3rP7VOeRKFgwCJ589i7FRrL
         MAQexM11/6eu6eFGYv+Fx7o5wRbDrlrSgYbw7kKbs6P9h9gQXWu2rFbAZH+Ho1KFofY1
         Jh5DnnvuAqSVd/eKBdz7KJDdq3asZyba+eMwGbkyZRblVrOx66OBx7tdAunIzzGFg2mH
         2ML7Up8wdZavcGyjg6muN5YdXWdTbJBAP/lTVF4a5D5iHuRX1zJmYhhtx3OKeRkN3t9T
         275qC3G4+D01/WtU91KnDfU20Wth+OLU1CEkmBIQjtZ13kzYyydxQbgRTyAdCc1NmtKx
         r1JQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1AiVkqozyQf/I83ZnFRSNO0xQ9exFIAfNBHmkeq7nedzBlb8OaM0xqGTEe7NixCiz2aCD333cpU1Wf/bLvwFw@lists.infradead.org
X-Gm-Message-State: AOJu0YwOdilrlURnd1jjRvqaADrIhKIG1BndGsOFM0CJXQA+QsFmbeJJ
	eO9o6/+EJLFXSe0rS+SWk1prD9W07SWP1BIui0mARRuo2hLm4ETHSOnZwIEVC7yTUknMkIT+u1c
	20xlG58Y=
X-Gm-Gg: ASbGncu/msfadDJnhquHidGkE5tUwrB5imfoj2HVZBrK/EFED5ZcTy/7nxFg3RYJiub
	2Z8KmjHOkaqfn4Xd7n2wmpqnG8HgWvvn4hgZD916e3Eyh/pgIgeYkREHVBmfiSxp5FpT83axs20
	rQDA2lRVAGvlatH9LOws5eNWyDdENHgtvVR4YPys8fui4jwZBLm5Zyu8UbjPTXeSqtaSmi5TGfS
	arWQgBCOXGqTZHsSZRtmxNyO6wL2aFiMBRRaOEMXNp4pRbYD4nZ9zjcZkd0AqlLSIYIy8J6FLhE
	U5ocx0EWCO+SbJ36z1qb5WVK1OOEU27PxllnpVsUyzCzPeO4QpDKeGTkyGkclhbhocV/JQgdGAm
	0axvt6yUbeLNptDnbjDzrLxgUca1MMJZIjIKMrzTQMY893PeKSnl3t3zUkHw4GCMyEVHWlCV3Ov
	n1yBY3Ur5cv6I0dTfVpT0=
X-Google-Smtp-Source: AGHT+IEa5HkAwCtUWAqywoBTOY3tVN9yf0jwTmnq2Cg9AjaVrXNzNWnrvkGMw6skKp8s7Y/nZrMCtg==
X-Received: by 2002:a05:600c:5253:b0:477:19bc:1fe2 with SMTP id 5b1f17b1804b1-47773228b73mr15623725e9.6.1762596004492;
        Sat, 08 Nov 2025 02:00:04 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4775ce2cde0sm213265715e9.15.2025.11.08.02.00.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Nov 2025 02:00:04 -0800 (PST)
Message-ID: <2aaf169a-3dab-4ddc-a095-396619983406@tuxon.dev>
Date: Sat, 8 Nov 2025 12:00:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] clk: at91: sam9x7: Use kmalloc_array() instead of
 kmalloc()
To: Sidharth Seela <sidharthseela@gmail.com>, mturquette@baylibre.com,
 sboyd@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, varshini.rajendran@microchip.com
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 david.hunter.linux@gmail.com
References: <20250924145552.55058-1-sidharthseela@gmail.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250924145552.55058-1-sidharthseela@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251108_020009_061040_6B73B088 
X-CRM114-Status: GOOD (  11.76  )
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

Hi, Sidharth,

On 9/24/25 17:55, Sidharth Seela wrote:
> Replace kmalloc with kmalloc array in clk/at91/sam9x7.c. Refactor to new
> API, for cases with dynamic size calculations inside kmalloc().
> 
> Resend is to correct previously sent patches mailing address.
> 
> Signed-off-by: Sidharth Seela <sidharthseela@gmail.com>
> ---
> diff --git a/drivers/clk/at91/sam9x7.c b/drivers/clk/at91/sam9x7.c
> index ffab32b047a0..0c0a746a183d 100644
> --- a/drivers/clk/at91/sam9x7.c
> +++ b/drivers/clk/at91/sam9x7.c
> @@ -748,9 +748,9 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
>  	if (!sam9x7_pmc)
>  		return;
>  
> -	clk_mux_buffer = kmalloc(sizeof(void *) *
> -				 (ARRAY_SIZE(sam9x7_gck)),
> -				 GFP_KERNEL);
> +	clk_mux_buffer = kmalloc_array(ARRAY_SIZE(sam9x7_gck),
> +					sizeof(void *),

sizeof(*clk_mux_buffer)

Also, this line should be aligned on the above "(". Please run checkpatch.pl.

Could you please update the other at91 clock drivers?

[1]
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/coding-style.rst

> +					GFP_KERNEL);

This like could fit on the above one.

Thank you,
Claudiu

>  	if (!clk_mux_buffer)
>  		goto err_free;
>  


