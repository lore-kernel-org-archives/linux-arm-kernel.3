Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10E9ECCA476
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 21:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hDJssHW/G49N1bctBMwaYMSUbzS9ng1oTayUPFPGvKw=; b=vQEiPJtopPXeUAPIeGf72v+J5Y
	8M7JkR1fmiJqj0M42CnCw91gCz9/yxo52/bNCeoUAAm/bblNgROQk90JGlkGMZW8UBd0YQbNLxN0h
	ZWly3bXClEnIQ73lfy/lS18SC33FSgU7GVIw1fAmcjpu0zKWvvXhBrkvGOdN4tcOb78elFikcv+yo
	EP7yp7AA9nWp3zbr74U/xyGw5ygzvo1vMvvOoxH1eR7fHfSpCdj2d/wwXNHF1oLKO/X4DCvjHjiCH
	kVd7TeQ3AJyG7aN02Qn2WHvc3cOsGMZEos6Nqf8WVHvsVd+65GOO0jRA+P47goGuZsad865jqT+Fr
	onsrJGEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6Esv-00000002nAq-20dl;
	Tue, 07 Oct 2025 21:06:13 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6Est-00000002nAV-23BT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 21:06:12 +0000
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-42f68a0a89aso1587545ab.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Oct 2025 14:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1759871170; x=1760475970; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hDJssHW/G49N1bctBMwaYMSUbzS9ng1oTayUPFPGvKw=;
        b=GxwSEJXruyDra13y55KYrR3zrejZNfJfgj75ep2TdadMwKtHw01KhEFKtq0q2HNzHV
         hi/QNjwpXBIR0fJ121L2r2XrXpFC7Zg5pOpiHyfe9UMg6XNgz5d2j4Z+afSK4UGyEgMr
         fLuiF/7KzeRyhdzAm0IIYDyxH/gysPEZ43fIE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759871170; x=1760475970;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hDJssHW/G49N1bctBMwaYMSUbzS9ng1oTayUPFPGvKw=;
        b=KIOJ+DBpQHQvpPTlfqX85GWA+mfN1jejVh7knPSuMCFx/e06aNr3etqBCKEUN9eD4C
         o8pygaDO3K4RwFR4qeD3MpcZsYEwRhywaG1rZ7hYTNLYt0f1lpjVWrBBca9ZyC/unIEP
         FRf49aEy9s0YWf9OUZINscThIj4FwPBafrY0F6OXvl8U30yzmAYVPrXTSrTMKKbfZn4r
         8zyDTzRifvsuEKKYxc/nD4Q+ZVMvx804xrMhfFgkST68bShOGVmEwMRI5bFx7J74tWQt
         OA/jsUT247O8Xe4BI2vFGsSNxc8W6gNCmZqe/CJ+cPYlTiUbj37m8FR9zPIH9QGj9XnT
         FyqA==
X-Forwarded-Encrypted: i=1; AJvYcCVTmKekZrH/JiUCPA6yerf0btd8CagErTrl0P+fssSUiwIvjxnXdEdP31GmOJzNGjcZV/jl7EppQqUN+NGXvqLY@lists.infradead.org
X-Gm-Message-State: AOJu0YxFYycVySBSTzzevE3WEqpxU6AO1IcGKX7J+tXDKHCVtv/9mFM+
	7/6Sfn9TPEEuxwvTFux4Lq6VWl+e0sjswX5GoOuTUg7t+1sHgncVQAEYlOh0cCTdsoE=
X-Gm-Gg: ASbGncuqJ8CuojWcD0ewzHThZRtfrfgl0pLzaT4ATNWYHD9RQTqO/iBfgVFDBTdAfb/
	ZhTL7mqXQPGxsVo0CKAwPgURvDu6Y55Vym/fngNsWAcHBbBmaLrj4fpiPV4p6bBnrTv560BIBjB
	OFzo1pB4zF0C6yrk/M4/QMEJl0hshQhBY1ejV+Jj4odZQCVbRsYAvHNJ/WSmOq/k+vo+Fb8aqSv
	u/4E0xqVDV16+8ON3Rf6KEVwZd2ptOR0T1aIAnwG+KB1Z6xmn9BRaRS3DWOtm1vjB4/suNRtLnK
	xZ7rT3sI5bbY0aM/EFDLsbwWcV9oNzTc95pmsZBJMEKLThwYgkVyp3U2LBdwAo5Akvh2GCd+WN5
	zSFttNBC3MvtB/u0oS7TBn9vJLriCZRsgpY9kBFrwsoxQOjwH2eWEF8I9uhaXbCIZbjfBow==
X-Google-Smtp-Source: AGHT+IHJS9tRfCPlCMJwh844fS5buPRYb19l+/WQy1lMrZF9u3+w3MuGpV9DibTiaEiM0xpOHSxg7g==
X-Received: by 2002:a05:6e02:17cb:b0:425:8134:bcaa with SMTP id e9e14a558f8ab-42f7c2d49a8mr65232375ab.0.1759871169924;
        Tue, 07 Oct 2025 14:06:09 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-42e8a0bb405sm55081635ab.12.2025.10.07.14.06.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 14:06:09 -0700 (PDT)
Message-ID: <c87d45dc-d545-4359-9e2f-11e43a45859f@linuxfoundation.org>
Date: Tue, 7 Oct 2025 15:06:08 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] clk: at91: sam9x7: Use kmalloc_array() instead of
 kmalloc()
To: Sidharth Seela <sidharthseela@gmail.com>, mturquette@baylibre.com,
 sboyd@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
 varshini.rajendran@microchip.com
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, david.hunter.linux@gmail.com,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250924145552.55058-1-sidharthseela@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250924145552.55058-1-sidharthseela@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_140611_548435_EF4F40B1 
X-CRM114-Status: GOOD (  13.92  )
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

On 9/24/25 08:55, Sidharth Seela wrote:
> Replace kmalloc with kmalloc array in clk/at91/sam9x7.c. Refactor to new
> API, for cases with dynamic size calculations inside kmalloc().
> 

This following line doesn't belong in commit log.

Can you add details on how you tested this patch and also how
you found the problem to begin with.

> Resend is to correct previously sent patches mailing address.


> 
> Signed-off-by: Sidharth Seela <sidharthseela@gmail.com>
> ---
> diff --git a/drivers/clk/at91/sam9x7.c b/drivers/clk/at91/sam9x7.c
> index ffab32b047a0..0c0a746a183d 100644
> --- a/drivers/clk/at91/sam9x7.c
> +++ b/drivers/clk/at91/sam9x7.c
> @@ -748,9 +748,9 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
>   	if (!sam9x7_pmc)
>   		return;
>   
> -	clk_mux_buffer = kmalloc(sizeof(void *) *
> -				 (ARRAY_SIZE(sam9x7_gck)),
> -				 GFP_KERNEL);
> +	clk_mux_buffer = kmalloc_array(ARRAY_SIZE(sam9x7_gck),
> +					sizeof(void *),
> +					GFP_KERNEL);
>   	if (!clk_mux_buffer)
>   		goto err_free;
>   

thanks,
-- Shuah

