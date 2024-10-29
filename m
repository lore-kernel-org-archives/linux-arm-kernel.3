Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B27D1D5B840
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 01:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7NqPbYxXVoStVB+VHiCxCoEHhw26j77NLuPqeD7DmUU=; b=tXYkgWMaLSay5yfMNg9RIr0eHm
	G4CP9byDUVUd+cF9wAERYJfZCjf7hi9tP3GnKabTRd5aEuWA3nBpAvoABDR4VUIjZY7QPBw+7J64d
	MXKR8Cjc5DhRGOShc9QdqUbNrvbEvNgYs/4IotkmW6piPa/zYlhwworyyzT1dmR7nDYP1M4Zp8QI9
	sIpi6c/4LaqHfXoNN2zucf+X3NK8NNBvI23/18i9k/VBfoCmCKJ7Ob3+7oBsy7uEyWC/+tXWeiiFu
	L1GYHQqJy1V/KxEE/JIz9Xo90itZhks0FKQ4FbwPB/7HGjq+STxotDJ/ZLeNzahRGClyDTh0yf6uB
	qfDqtsBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5azb-0000000Cr3y-3RlT;
	Tue, 29 Oct 2024 01:25:55 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5atN-0000000CqKh-2tz4;
	Tue, 29 Oct 2024 01:19:30 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4315abed18aso47267885e9.2;
        Mon, 28 Oct 2024 18:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730164768; x=1730769568; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7NqPbYxXVoStVB+VHiCxCoEHhw26j77NLuPqeD7DmUU=;
        b=fUtNEoDIVsZyDrugLnRevNhPOMzjo44hym5U67iTea7Yi15onA88BMLPYVOS1+kJnW
         D3HcEDsk839tVcm1YQcyn67ul9H9eQnYdRdU4+ZUZvuvO37fyI5rqN9QESoHqkPY+1dl
         OlROqGjT6IAriM2Eo+tJ5S0dp5m1qQfnV2S7BBwYB/hIhNA5Sy17Ll1nYhEXoicCA3gZ
         3+loCL23jNosPveo/04iT0JmTFzsciwgrgJQLG/GT0LVpuTbcCbnAEjanTPYIOXDW4rv
         rVBzV6hj9SjSFqTOXW7WNSGj0tCB9pOpSMTTgH7Va6KzLtSk+9AgeceBnx5JG7kmsyjl
         ONxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730164768; x=1730769568;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7NqPbYxXVoStVB+VHiCxCoEHhw26j77NLuPqeD7DmUU=;
        b=LrgtuTT+2STIGgg9yWgi5Ka2ObAFhrHp6wBxlGgiDu9QCJTrH3/FfEpSTXt9TFWLtg
         dTPY7Dx3O7OKEwk929Ot1JaQEDry/ugw6ovh2XEDBMQdb5iX3O6hw7BcgY4PHddP2zv4
         W7mtQGTUZ0ajiSz8cbJzwGv6vVu5wvSfNiR6CUbYqS72m/+DHQ+QLxk+jNJINMV0TcxU
         M5sJizWktVGXllEP7qH5P9kMVU7QsI0R6COUO+AYN1eDU2dkS69Mv15EYBC3sPGK/7KW
         UgDP3D14qwhfGaO88QZDggAC09eRI+0T9ABx1/ATFVuhHVisQZZR6O4fn/Xoi60WLtTn
         Vyxw==
X-Forwarded-Encrypted: i=1; AJvYcCWGPPAr+mj98gELv9DQv7IgPSnEERxhqOgBWFwBzZTdP7AwgBh+Jow5Poo73H8P/+kYbo8T+GdBdZcMy4rXPp1n@lists.infradead.org, AJvYcCWO1EQpIvdYk5uNoUAadeI3ZRC8ELpAlTWRbjtZNCwRWtwolnTuRTzFb7kwTpeyzWkSazKr5paWMZpbTW8OurE=@lists.infradead.org
X-Gm-Message-State: AOJu0YyGtR/UM0RI2Nr4hEr7wRFAuxKN2vTraBmHF4lG+z3AAxd9v+x0
	/FQoC9iN4ViiKs47rCp8xkaOXuWJS705IU5WZ8Z2DHbMhJo6rVZ5
X-Google-Smtp-Source: AGHT+IGh9hDA6CEELzgUa44edYR6yHqgHJb+fWAXCUGYTW3Jt1sdl1iGkGNeWV7z4UjUW1sl8AlI6g==
X-Received: by 2002:a05:600c:350b:b0:431:44fe:fd9a with SMTP id 5b1f17b1804b1-4319acb8a7cmr84141915e9.19.1730164767820;
        Mon, 28 Oct 2024 18:19:27 -0700 (PDT)
Received: from [192.168.0.2] ([69.6.8.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b1333bsm10920565f8f.14.2024.10.28.18.19.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 18:19:27 -0700 (PDT)
Message-ID: <e825de58-c75c-412b-8ec8-f5792f480a51@gmail.com>
Date: Tue, 29 Oct 2024 03:19:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [net] net: wwan: t7xx: Change PM_AUTOSUSPEND_MS to 5000
To: wojackbb@gmail.com, netdev@vger.kernel.org
Cc: chandrashekar.devegowda@intel.com, chiranjeevi.rapolu@linux.intel.com,
 haijun.liu@mediatek.com, m.chetan.kumar@linux.intel.com,
 ricardo.martinez@linux.intel.com, loic.poulain@linaro.org,
 johannes@sipsolutions.net, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com
References: <20241028073015.692794-1-wojackbb@gmail.com>
Content-Language: en-US
From: Sergey Ryazanov <ryazanov.s.a@gmail.com>
In-Reply-To: <20241028073015.692794-1-wojackbb@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_181929_766057_BD3A0E65 
X-CRM114-Status: GOOD (  15.80  )
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

Hello Jack,

On 28.10.2024 09:30, wojackbb@gmail.com wrote:
> From: Jack Wu <wojackbb@gmail.com>
> 
> Because optimizing the power consumption of t7XX,
> change auto suspend time to 5000.
> 
> The Tests uses a script to loop through the power_state
> of t7XX.
> (for example: /sys/bus/pci/devices/0000\:72\:00.0/power_state)
> 
> * If Auto suspend is 20 seconds,
>    test script show power_state have 0~5% of the time was in D3 state
>    when host don't have data packet transmission.
> 
> * Changed auto suspend time to 5 seconds,
>    test script show power_state have 50%~80% of the time was in D3 state
>    when host don't have data packet transmission.

What negative outcomes of putting the modem into the suspended state? 
Out of curiosity, is the chipset capable to comeback from the suspended 
state on receiving data from a network?

> Signed-off-by: Jack Wu <wojackbb@gmail.com>
> ---
>   drivers/net/wwan/t7xx/t7xx_pci.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wwan/t7xx/t7xx_pci.c b/drivers/net/wwan/t7xx/t7xx_pci.c
> index e556e5bd49ab..dcadd615a025 100644
> --- a/drivers/net/wwan/t7xx/t7xx_pci.c
> +++ b/drivers/net/wwan/t7xx/t7xx_pci.c
> @@ -48,7 +48,7 @@
>   #define T7XX_INIT_TIMEOUT		20
>   #define PM_SLEEP_DIS_TIMEOUT_MS		20
>   #define PM_ACK_TIMEOUT_MS		1500
> -#define PM_AUTOSUSPEND_MS		20000
> +#define PM_AUTOSUSPEND_MS		5000
>   #define PM_RESOURCE_POLL_TIMEOUT_US	10000
>   #define PM_RESOURCE_POLL_STEP_US	100
>   


