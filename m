Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC54BCEDDA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 14:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KcIjluc6CF4ch514Lk0ctcAIz2wl4W9d5ngSIs1tzo4=; b=mYVkIsYQ2LCIY1R+eAuU2V8ipM
	5EsbUGV2HpjHJI11M3Ae1EdvhJmDwQv0uA1z5veI3dGdvVdsYwyi3PiCz/kKCMzc+w8aAqUXsw33S
	tEgUWNWe5LgdnnzHY+TDsUih/qEgqNXyzcTX/fPE7ft+YE6xvm9dr2FuIrnz+qBpLzS6VYskwx7zR
	LvwrbyOfwd+RvqGJTpuNxj28XLBtFjKxG3FwY0I5+MBaSpDNjuA1nI66uXxm8FyByiH9SoLQlM994
	anLwk3Z8T1ue3JR/+NM/trS9FFnSvsRz96okXpx/MHbxzGBtEzIKVyAawwJFS2Di3L70lvmltq5tH
	NvKPdHeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLMur-00000000ZWA-23a5;
	Tue, 18 Nov 2025 14:42:45 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLMuo-00000000ZVk-0Z76
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 14:42:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763476961;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KcIjluc6CF4ch514Lk0ctcAIz2wl4W9d5ngSIs1tzo4=;
	b=cr8FfgwQ5uzpsFki8BpcLW7kSOoy4+6vpd+haAu3sTkI95e5P8DyFhtp2B6pMbMI/yweiA
	LNYNPnIzqvLvBRsTtM7GS+0oJPAsOjNX8r/iAZTwq3cA3dWxmlUryODsh1Izbe8v5+MNOv
	VaGVagx1QNKzr1pux5jCFY15crCno0U=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-152-6qXAUpFCM7CO2ypsgKsn6w-1; Tue, 18 Nov 2025 09:42:39 -0500
X-MC-Unique: 6qXAUpFCM7CO2ypsgKsn6w-1
X-Mimecast-MFC-AGG-ID: 6qXAUpFCM7CO2ypsgKsn6w_1763476958
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-42b2ad2a58cso3021153f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 06:42:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763476958; x=1764081758;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KcIjluc6CF4ch514Lk0ctcAIz2wl4W9d5ngSIs1tzo4=;
        b=IoKY4bBq4+hquksePaJXK1OQ/Nl6axH8nToX2zFQQunvmCDEFB4gYwe/Gp335Z/ld3
         zbiyMEVOjzTbFCB2isORmHZIkuUh5L0xbh9v9rJNbYvdAgSZnuukkCXYMz4OmdR5taUJ
         WBx6eaGZPxBG89TD6uANYhlEoVqvjrnzjLA7/Y2iIj0O7SEk8mMD+2crn8EawloBCUzy
         SGeb/vXDbY8azO4yJ0JtxiWcwSzpWeKs47nfQAyPyojtYh1feXEogBr4jRghdWKHtGo5
         UQ9L/6/OLheaY3z7xM6djA3JY/M+c+ovLYrl0Ckc94Loxx2ZrOe9JQC7jg9ZuoX7tTcl
         prAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXKX053BQzH0o/4wx+tfP8Zv3c0ueRbF3JiAnz2z9cQG1Wa95vsyOBt7NZ165u54XtfBMG5jAtoNIxkY9iGg9L@lists.infradead.org
X-Gm-Message-State: AOJu0YzX18EH/ZTD9nzwKj6MsMx1+IeXuDuO7DC44fI3+QoXJtqBQvOx
	Hc/DBPxklpJpavJbeizYv2XQkMv0RkXM4f7pmANII2Q4C57UdQyURxYH1qyNSPs8lTkctEa552L
	FiAeTG7ggRu+N3yQ6gW5XeSU9r2D1I53d9JMwWjCDnNBBljgNUtb2P9aMr4yuRvIyXjtQS7jZjl
	vs
X-Gm-Gg: ASbGncu1OrB08IVRKdU3o9ZLQLAN0/LvdiMZPDOM3Q08aceaFrfYVF+iPtlB04808wJ
	qE+8qGcZHYnGA6CVzqMHmN13p9ucC7WXojF9OKg0kExxfSq9oefvxvth9HfdDWi8lklJs6BHh0J
	4FlisgCXR10fnXK2Z7lA62WS80fSOo8lWbveY55RdkekErZYFY34i2u7KaRDZalNPoxvNJkg1BY
	P3s3cCUNO+4LU5+pGe2h2qQYolxGqCkNTrcrbwjoCRWql7bYwYNbO8Nk1bnu1X8VMZOA/UHvU/J
	W3fPMRdBt+lXz4Ij4bvXB+6yAlcMFee82csv+xTzNM0jwX8m8UX7ZzyZN0XXUSWqaQOBXZnJ3DP
	Cv5LgTIJPDPgH
X-Received: by 2002:a05:600c:c177:b0:471:13dd:baef with SMTP id 5b1f17b1804b1-4778fea3048mr167899295e9.26.1763476958171;
        Tue, 18 Nov 2025 06:42:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG0CCY6x+8bA07W4MfE2Q3iuNu7PIm0BhBaWtRwjXdbvpokwwW2evCf1FYfJCFjxSD0LjK6Ug==
X-Received: by 2002:a05:600c:c177:b0:471:13dd:baef with SMTP id 5b1f17b1804b1-4778fea3048mr167899055e9.26.1763476957729;
        Tue, 18 Nov 2025 06:42:37 -0800 (PST)
Received: from [192.168.88.32] ([212.105.155.41])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a9741cbfsm19503645e9.6.2025.11.18.06.42.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 06:42:37 -0800 (PST)
Message-ID: <53b3ac97-830a-47fc-a83c-3d12dac2e21a@redhat.com>
Date: Tue, 18 Nov 2025 15:42:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2] net: stmmac: add clk_prepare_enable() error
 handling
From: Paolo Abeni <pabeni@redhat.com>
To: Pavel Zhigulin <Pavel.Zhigulin@kaspersky.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Inochi Amaoto <inochiama@gmail.com>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
 Rayagond Kokatanur <rayagond@vayavyalabs.com>,
 Giuseppe CAVALLARO <peppe.cavallaro@st.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 lvc-project@linuxtesting.org
References: <20251114142351.2189106-1-Pavel.Zhigulin@kaspersky.com>
 <4a3a8ba2-2535-461d-a0a5-e29873f538a4@redhat.com>
In-Reply-To: <4a3a8ba2-2535-461d-a0a5-e29873f538a4@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: sG_L_zBepMs1xELO0SdsVNF8XuV9fZOC1BUOYfcp3Pk_1763476958
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_064242_269877_FC499A7B 
X-CRM114-Status: GOOD (  18.27  )
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

On 11/18/25 3:30 PM, Paolo Abeni wrote:
> On 11/14/25 3:23 PM, Pavel Zhigulin wrote:
>> The driver previously ignored the return value of 'clk_prepare_enable()'
>> for both the CSR clock and the PCLK in 'stmmac_probe_config_dt()' function.
>>
>> Add 'clk_prepare_enable()' return value checks.
>>
>> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>>
>> Fixes: bfab27a146ed ("stmmac: add the experimental PCI support")
>> Signed-off-by: Pavel Zhigulin <Pavel.Zhigulin@kaspersky.com>
>> ---
>> v2: Fix 'ret' value initialization after build bot notification.
>> v1: https://lore.kernel.org/all/20251113134009.79440-1-Pavel.Zhigulin@kaspersky.com/
>>
>>  drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 11 +++++++++--
>>  1 file changed, 9 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
>> index 27bcaae07a7f..8f9eb9683d2b 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
>> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
>> @@ -632,7 +632,9 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
>>  			dev_warn(&pdev->dev, "Cannot get CSR clock\n");
>>  			plat->stmmac_clk = NULL;
>>  		}
>> -		clk_prepare_enable(plat->stmmac_clk);
>> +		rc = clk_prepare_enable(plat->stmmac_clk);
>> +		if (rc < 0)
>> +			dev_warn(&pdev->dev, "Cannot enable CSR clock: %d\n", rc);
>>  	}
>>
>>  	plat->pclk = devm_clk_get_optional(&pdev->dev, "pclk");
>> @@ -640,7 +642,12 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
>>  		ret = plat->pclk;
>>  		goto error_pclk_get;
>>  	}
>> -	clk_prepare_enable(plat->pclk);
>> +	rc = clk_prepare_enable(plat->pclk);
>> +	if (rc < 0) {
>> +		ret = ERR_PTR(rc);
>> +		dev_err(&pdev->dev, "Cannot enable pclk: %d\n", rc);
>> +		goto error_pclk_get;
>> +	}
> 
> It looks like the driver is supposed to handle the
> IS_ERR_OR_NULL(plat->pclk) condition. This check could cause regression
> on existing setup currently failing to initialize the (optional) clock
> and still being functional.

I'm sorry, ENOCOFFEE above, ->pclk is not NULL nor ERR when
clk_prepare_enable() fails. Still I don't stmmac  code depending pclk
being successfully initialized, and the eventual regression looks like a
real possibility.

/P


