Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 745A2D715E0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Jan 2026 10:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f6KeuWtNDinjaFnZinUuAvPa1zdf4IDBNYyQ0smSyMs=; b=WHYOQpD5skwusFQ0wKksXGq/6M
	BO71uKjExf7f8d+KIpovXJQbQ+64UbJTFwegAUKSjjAVI45f7M8Z46EaaRFidR0DvNJzyllXRPKQC
	Q6MR3lzi9XAhzeYcsLqV8rEovJqXX8HtiG6TwTvjAKpx4F17kewkS79KyKJOkmEbQYi/20Uuhirau
	E/E4/UhounqDRovNhcG0OojnXI6KorkP2UXfx59kO/qSLrnJJ5PUmvB10c+ORLKXQbdbflZqWxzX0
	l6NNMUiOgjRDS71ADC+Q9sJ0uHeo6oOPo3cdogU2ScTQgVqMpcwEel5j2Inss1BcjdAGqh/oIhCNh
	iqiON0iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjaoq-0000000A9xE-2Nt5;
	Sat, 24 Jan 2026 10:24:40 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjaoo-0000000A9wu-0IpS
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Jan 2026 10:24:39 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-47f3b7ef761so21505735e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 24 Jan 2026 02:24:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1769250275; x=1769855075; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f6KeuWtNDinjaFnZinUuAvPa1zdf4IDBNYyQ0smSyMs=;
        b=hQ19rdm+wKUNgjzhcbrZrkhurq7gkBMmMUVUbV0fy9ypNsSOOzQCgY2I/oKBXAKKF+
         xVR9fKWe4+Mg68KAxyr2cOPeDh9QAYmfKgyfTV1E9vDU1cEQevLpvZVSrtzjActRVF7D
         yAzr/LacziJFU1E8cseJ3mgNQcD6vGv3myf31WCmgXJb2CTLLMAXNkS4cLMYyayHfU/y
         ZDOmMbnrV4uCV0L4S9p2uIoeCsUIpnRmOsjpzXZ/bD1/KMaX6h6iCsvldd1hONrj2rmF
         hrL/Px3Xe6JKkw0B/9oUy3oIxAC9rQWnvKsN9n44qE8+5SLq5MAn5gNlujCr7knAV3Uo
         8spQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769250275; x=1769855075;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f6KeuWtNDinjaFnZinUuAvPa1zdf4IDBNYyQ0smSyMs=;
        b=noWrXE7RVCb3t02N5bGjUT5Ek4zWiwOVh1AOa7dIC+V+Wq5nVSxLoKUjAm0O9P3mg/
         2IXpLHXcpVfS1na/txpOqkOfD+8w+J7mNexbCzqEDVSrHpylDLycJy1A21z9/SwKZZ+J
         FJFpgS3cVI5VzACoHiLShHaiGMU91iEookX4REmVASSdmxzSegho0ZB+MPlNlEg2JZf9
         /a5feR/hGeH+YsdZGfHjooPz9ry22wAe7ak63RhyDIocSyS7HlXaEZSWc5ZjNz8SYx7X
         L+07hu0Ae0I1e6A2e7xt9Wzr2QEQ3wT3QnhgGcwY08CITtIeTE6wrg2bvL8vnf5rcyJW
         Uz3g==
X-Forwarded-Encrypted: i=1; AJvYcCVCJektbOVfe/6If44lgGwH14mRP1nIKNmpBCT7C7GvDK0GCaLpC3JsEBFi1H5Hqy68CI5LRpl9CanZIJyQnXdG@lists.infradead.org
X-Gm-Message-State: AOJu0YzPSnbWHUpYRJVhMDLng/DmolycIbr5UvSAgH/t22G5L/3SZPxr
	QXh1Zml0MNyGTAIfjbPa6WYghH/tPSKmP1eKEnfNGp2e6RbXCjO1I2BLoOdeDHBKUso=
X-Gm-Gg: AZuq6aJXBwURb4LBJCru2vnRqtEG66VDFnaJe5DzAWwNfOZSSPz5FXLOm2ey/F06gjd
	FHtoZgac2V40Tj9ZE5Y2cWYAKr0dowwDGOqGR8UTVpPciYyUIG+UAs4Tv90KCN7fQeyBPEHFV21
	BVeAccJdhmzXqMomPKgHbSMqt1+tPReNnZTe99w8fmffY7OHRjc8C/Y38vFBAJL4T0EgaFidxPZ
	EBJO00d5IetI966a9iZe87LQK3mt69+w5z47CwU8O4mvad6lu5JpBUj+esubR2xK+IX68SL/+RL
	pYv2QjukvI6zJkeKMfoXJsQtVjE2Jd9I+TO6NRraTCBLtDne7b8XH+xpq4HAaC5jiCNqx3BSvFB
	xZzXYKyc4oqUUgagTwZeCQDof4vyFeDs7fiHaahA0qZX26+r1kwMwzZ+Wr5gF0HSSefgo+W5Bva
	vfzSJh572FzNRg9DdAkBFPC77P5SiXsxGGhC93ZhOMu24k0WnN6SuN93p2OpbJMouTOSljsV6E1
	nRU+0DfrlD6XJ3M1VljrMNhB4vXZWjzcyb1WAZ/IA==
X-Received: by 2002:a05:600c:5308:b0:477:b48d:ba7a with SMTP id 5b1f17b1804b1-4804c9b834amr88128575e9.32.1769250275201;
        Sat, 24 Jan 2026 02:24:35 -0800 (PST)
Received: from [192.168.3.32] (cpe-109-60-82-187.zg3.cable.xnet.hr. [109.60.82.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c02cd8sm12647198f8f.8.2026.01.24.02.24.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jan 2026 02:24:34 -0800 (PST)
Message-ID: <55f7c157-c624-4b1f-ac07-f70aa3668b34@sartura.hr>
Date: Sat, 24 Jan 2026 11:24:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] i2c: pxa: fix I2C communication on Armada 3700
To: Gabor Juhos <j4g8y7@gmail.com>, Wolfram Sang <wsa@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Andi Shyti <andi.shyti@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Russell King <rmk+kernel@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>,
 Hanna Hawa <hhhawa@amazon.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Imre Kaloz <kaloz@openwrt.org>
References: <20250827-i2c-pxa-fix-i2c-communication-v3-0-052c9b1966a2@gmail.com>
Content-Language: en-US
From: Robert Marko <robert.marko@sartura.hr>
In-Reply-To: <20250827-i2c-pxa-fix-i2c-communication-v3-0-052c9b1966a2@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260124_022438_135813_7360681C 
X-CRM114-Status: GOOD (  18.22  )
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


On 8/27/25 19:13, Gabor Juhos wrote:
> There is a long standing bug which causes I2C communication not to
> work on the Armada 3700 based boards. The first patch in the series
> fixes that regression. The second patch improves recovery to make it
> more robust which helps to avoid communication problems with certain
> SFP modules.
>
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> ---

Hi, I see the series have not been merged so far.
Without it, I2C is completely broken on Armada 3720 if I2C recovery is 
used, and
without I2C recovery, certain SFP modules will also cause the bus to hang.

Regards,
Robert

> Changes in v3:
>    - rebase on tip of i2c/for-current
>    - remove Imre's tag from the cover letter, and replace his SoB tag to
>      Reviewed-by in the individual patches
>    - rework the second patch so it does not need changes in the I2C core code,
>      and drop the first one as it is not needed now
>    - Link to v2: https://lore.kernel.org/r/20250811-i2c-pxa-fix-i2c-communication-v2-0-ca42ea818dc9@gmail.com
>
> Changes in v2:
>    - collect offered tags
>    - rebase and retest on tip of i2c/for-current
>    - Link to v1: https://lore.kernel.org/r/20250511-i2c-pxa-fix-i2c-communication-v1-0-e9097d09a015@gmail.com
>
> ---
> Gabor Juhos (2):
>        i2c: pxa: defer reset on Armada 3700 when recovery is used
>        i2c: pxa: handle 'Early Bus Busy' condition on Armada 3700
>
>   drivers/i2c/busses/i2c-pxa.c | 35 ++++++++++++++++++++++++++++-------
>   1 file changed, 28 insertions(+), 7 deletions(-)
> ---
> base-commit: 3dd22078026c7cad4d4a3f32c5dc5452c7180de8
> change-id: 20250510-i2c-pxa-fix-i2c-communication-3e6de1e3d0c6
>
> Best regards,

