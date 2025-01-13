Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35B76E7719E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 11:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kvoFJS6F9wk4jz44qoey7Q8fjFA+Q2ZM9VARRWQtXsA=; b=Wq/5c4UlwEOqVZFkYzv+0W8ceA
	+UROz7/+jdob+iOqL2t90EjNBu2/lpv9CgY/2E5NYzisMS6ObUqDT6Sksa4gEchmXooN8RXahfOC7
	kPPrNEKyLIfFXzX+lRM2LZHmXJSz6PS05ITzxp4gMG0AlzKUbKIIVrUSWlLJorLcrxDCg7Lx5uElC
	ISZWPMzgMEHHeZxu1D1WDIUeHrFhZf6mDMNpQeixU1jEjNpO2gGfHMJv3ibqnC94GdSJPYVcVXxuO
	eNEJJpzsjvicjvUoHrpvOk5OoOJphYs7uaFbslzLNC5Dmrjn2PPEmO3ed/+bMDaaXbUHebybkvkBV
	urMGdZDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXIMb-00000004rpV-2Fuz;
	Mon, 13 Jan 2025 11:12:09 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXIJC-00000004rLX-0z8v
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 11:08:39 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43658c452f5so3792225e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jan 2025 03:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736766516; x=1737371316; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kvoFJS6F9wk4jz44qoey7Q8fjFA+Q2ZM9VARRWQtXsA=;
        b=KvsehgUPlYuQGa7otG1wOR3u4j2zYDuyxXA2CiOZV0yhhGVgCEF2l15AwQjHK/4yMb
         jiCqhLLa9+p+GDQCDQzqAlsLCAv/+Cnxc4vStyCBbbunxESQK+9qhyVOMnJrvWflh2Do
         XX5H6EEejDSbTePWiRa7rVeEcpZhhHTuxepfUDhha00uWIGzhenV1zk4WeHsI3v+lpFH
         CIQh7/A4xIKoA4wdaSBoCzdbA957mKeIuSnRIx8e8eZNY+JRoy4G/jnKfTHp+PHtTf6S
         1pqi0ma120lzUD5M/SZ9SF4gJ6KNs+mvF8HY7muIUOrPb1qH+J/aqVr27fLBFWV6loDX
         JO5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736766516; x=1737371316;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kvoFJS6F9wk4jz44qoey7Q8fjFA+Q2ZM9VARRWQtXsA=;
        b=Fdc2d/RCLJ6atFwUzC6mXs6uf/72hE4tqLFQ3wt8RtfDYu61bCAqGPNRlca9zydZkc
         VEpm537W4cwUGa6Ejr4wCwSZgYpLBYAhZYVQX/ErrGcbUlLne/+b/O/46mWz/oUgt/md
         siKZk+NtcsePMJxogufKMDY8OqtUy9VX2HJvIl5CIiIjrKSEFRQmfb2dIvm5XEvZRKR3
         3bV+Ad/RqiBsTGZxEAcJ68LuCuHN5wonQZzOCLBCQ5otASOEzXhCOshdHwOckKdGbdPp
         ycy9o+UFt2S9uEmZ8aBvyjOe82XvnZ8+pOStsDPmqJbqwVK9nuQMBdBLzC3FVOsGF0kU
         2tRA==
X-Gm-Message-State: AOJu0Yzr/eWqoytFLk+snz4fW37PmQZgHFCynXeCNxCfZrpr+jcqs00i
	+zHN3UoVqiHA0WySlSxuAedh+2b5qWLs0PUeILV1Q5sXpotmiuapM4mnWzG3tXU=
X-Gm-Gg: ASbGncvmYGrREqCk5uXhLqnsj3FxkWUqJJ4HoUsAf3NXqa+1DPes1pDc4ynWEWDMG0K
	z7bBW4az42tXrf0qMEGKHMHB7ncjBp+U9oV5vncrF1gbqFupfS8kwsblGEo1sCcyI2oPb4/LjpI
	iTHC7rTJ8EdPRm6/fvpLS36VrDLh208DiWoUuItAt1MPMQz2SW76LZ1NIoFErT+uJK8CLfV6SDG
	55QqmP7dFlUze7Mnuwo1uGmX9uGf/wRSj1CzoaGJcumVYKFgTHAguITan+5fy4BGx5a1POfWOsd
X-Google-Smtp-Source: AGHT+IEtKtLo/TYcYGUtHWrN3Y4wjZbk9HsbQfFeClkVRV79rZvw4FVq+Cj27cVFDaCibTRx/n3qjA==
X-Received: by 2002:a05:600c:4f03:b0:436:1ada:944d with SMTP id 5b1f17b1804b1-436e26ff7famr73442685e9.4.1736766516543;
        Mon, 13 Jan 2025 03:08:36 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2da6271sm173554635e9.9.2025.01.13.03.08.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jan 2025 03:08:36 -0800 (PST)
Message-ID: <249902d2-5a03-4c9b-a7e8-61dcfa9b5029@linaro.org>
Date: Mon, 13 Jan 2025 12:08:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 5/5] net: stmmac: stm32: Use
 syscon_regmap_lookup_by_phandle_args
To: Yanteng Si <si.yanteng@linux.dev>, MD Danish Anwar <danishanwar@ti.com>,
 Roger Quadros <rogerq@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 imx@lists.linux.dev
References: <20250112-syscon-phandle-args-net-v1-0-3423889935f7@linaro.org>
 <20250112-syscon-phandle-args-net-v1-5-3423889935f7@linaro.org>
 <5d97dd34-f293-4403-b605-c0ae7b5490fd@linux.dev>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <5d97dd34-f293-4403-b605-c0ae7b5490fd@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_030838_290912_C1CAD686 
X-CRM114-Status: GOOD (  10.73  )
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

On 13/01/2025 09:05, Yanteng Si wrote:
>> -	dwmac->regmap = syscon_regmap_lookup_by_phandle(np, "st,syscon");
>> +	dwmac->regmap = syscon_regmap_lookup_by_phandle_args(np, "st,syscon",
>> +							     1, &dwmac->mode_reg);
> The network subsystem still requires that the length of
> each line of code should not exceed 80 characters.


Please read the coding style regarding this issue, before you nitpick
such things.

I see you send comments like:
WARNING: line length of 81 exceeds 80 columns

which is not really helpful. That's not the review aspect necessary to
point.

> So, let's silence the warning:
> 
> WARNING: line length of 83 exceeds 80 columns
> #33: FILE: drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c:307:
> +							     &dwmac->intf_reg_off);

Unless networking maintainers tell me otherwise, I find my code more
readable thus it follows the coding style.

Best regards,
Krzysztof

