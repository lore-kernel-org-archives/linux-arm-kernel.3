Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BA1ACCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 19:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xs3IJsZszZbg8RTJIDmhoqjNZ28bmmKOdR37EWAGl0U=; b=0YYcBWcECN4rCY1zDL67S9et/I
	fkE7EnBCEfcgveI0f6qR2GnJDMuAr3hRrIMLQ13NggVjmVNmBSQJY33gWvCWFNteo5lUsLNNONVj9
	rOx3Op+VnOjTZNWO/r7cOoy0vSkrCmjiJgTB992KO5RL40zZR7OK1youaRP1qPjqi9dpj9F8I16u5
	sOrUoaswg7Kopy7xpW37uGSVcYN5/vN3mIeTPHmzyTP82DqiAgi4q73X4TS130IOikdyIXmrlx00w
	JOIpu1F9I3EUMDWZTSrzOBE4JRB+HnM5519yWeTaRDZT962//nz0kfz3WlmrCfStZox6DYRQKq3Dw
	K8f7kDRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH5QV-0000000G9jT-1LZQ;
	Thu, 06 Nov 2025 19:13:43 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH5QT-0000000G9id-08bS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 19:13:42 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-b70b40e0321so16752166b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Nov 2025 11:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762456419; x=1763061219; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Xs3IJsZszZbg8RTJIDmhoqjNZ28bmmKOdR37EWAGl0U=;
        b=e5ERuDJpudojivRHS+fwKlE10yxGxZcqVO2G/5A09CDWGxWUmQeF+if4OVhJiZvTjS
         5DpELzyk56XmgD98uMEWSErs75/88Dt7yaeqbSMw7UVRS//S5oPxG1rjYlYX6ul+kNO4
         WytPzToBKMoQYT9lYtj8upPjI5w8ySFH3bX61hyBnzrKFcGxnNry+o+LirgfHOtQL4Yt
         dWAizYQ+ABvsKzqNjbR3orieSk2MTnsyR7BzniiCkeQiRC/KmK6xmt27kWdoCHyvr3Ed
         LNkDoTutxCRW53Ulsj5eVaasjv/FcBYlO4JoBGgbElgYcC0ytXqg3S/7tI7eUqLGYmjD
         rHNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762456419; x=1763061219;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xs3IJsZszZbg8RTJIDmhoqjNZ28bmmKOdR37EWAGl0U=;
        b=UchVpqEzuzqE0UTJY3+PyeAL5u0Hcet+fUKC8oo0DZyTLOWLZF5KQqPKRlrI6R1wgZ
         sGDafsilRT16os3mDIE/LnFF9At1jbovJSvUyuD5haeyUhU/4iVMxGsVvLp3q59BS8w9
         1ZKg/GYUe4XB2J6o7dde8AUOzc5PIHq9PViO44Krh8WhaWYCEzoGmwWBrV1BPz64CLl+
         DYqSqi8l37smUyIj1dULdeMkdVj5Xdb/jsrVeOrEmKfI2/0EcN4E6akWRQDG6SIELHuG
         t/pBEgH4aGz9A6tSlLmuOfqSPE9fUJT4I0tNKEmKYxEnk+qEEa+VT02jPSDCSXpMkTjL
         ZtPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUP58GDBDMqkDNREbUjzJeTj8zuQiQpbV1JCdl7xoBKH1qT0ULGYE27diKVLKMdrfUy8rRbZm9u24P/S2fbPSfF@lists.infradead.org
X-Gm-Message-State: AOJu0YzSQcci62N2Mn9rnZnFYDfKUSOp+A5PqwExqQHZh5ZoDGCvdcJ7
	4rclY9W6GOq9a9svGM2m79tOtyA+szKbc8Rk/44tsY3B9unec59N4dzFpsyObg01C1k=
X-Gm-Gg: ASbGncsptgnZ3I07sJ6ba8ZG8SzmtHQN7nm+WiBtvVUMTc3pM/nqc12MJaNSAF9rtON
	tr9o3tYOTQc7j2spS18C76ojuKKsUDGKWInrTg4NZvBfVoYxpnM5k2H3eHc7G3wEHrwNqU8TI3J
	pL5Lo8NPB7IGDb2o9ptumJ2p9lkmdg2WpQ8W1OEIzHz8g+UZmm66do1gTKe/8bsXz8doV2gw7cQ
	oAtj2XDmGe9nWeB+CZRfJMRN3bBTJIrBdd9t50Clv+TeW1YBjXvdSsgVo2CumnaISE6it/kEzrb
	rVv7PwLdGt3svXleZM47G0+wrpLnTHLb0XG7si2MEtEkAskmdmET7DyAAyg+OKl+td8NR7afe0m
	y0Cyb5YcsD6AWLqDdE+uOl4cDUFlyjRhpw/DvB1ndfzUnHXSQouZTbJoe/bHLimu/bSkNWmRVHA
	Bjkrn4/VJTCleTIFJE4Vgw
X-Google-Smtp-Source: AGHT+IHph4UVtkfqqcOCpm0MSxBkSn+jtLUIbiXMRaQcHydRVPc0JgGsJTlozwoQzK/2CK5O3tSVNg==
X-Received: by 2002:a17:907:7f29:b0:b46:6718:3f1f with SMTP id a640c23a62f3a-b72c0b02375mr20083266b.7.1762456419105;
        Thu, 06 Nov 2025 11:13:39 -0800 (PST)
Received: from [192.168.1.29] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf97ea95sm27718966b.44.2025.11.06.11.13.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 11:13:38 -0800 (PST)
Message-ID: <cf23070f-8a3c-4c13-a46c-dc95f044c936@linaro.org>
Date: Thu, 6 Nov 2025 20:13:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] gpio: aspeed: Simplify with
 of_device_get_match_data()
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
 Srinivas Neeli <srinivas.neeli@amd.com>, Michal Simek
 <michal.simek@amd.com>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org
References: <20251106-gpio-of-match-v1-0-50c7115a045e@linaro.org>
 <20251106-gpio-of-match-v1-2-50c7115a045e@linaro.org>
 <CAMRc=Mchtho0yDsSp+wwBt=yBGg1+3i8ifkUrip1MJaq-uk+0g@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <CAMRc=Mchtho0yDsSp+wwBt=yBGg1+3i8ifkUrip1MJaq-uk+0g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_111341_119647_174B3F62 
X-CRM114-Status: GOOD (  14.83  )
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

On 06/11/2025 17:23, Bartosz Golaszewski wrote:
> On Thu, Nov 6, 2025 at 5:16 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> Driver's probe function matches against driver's of_device_id table,
>> where each entry has non-NULL match data, so of_match_node() can be
>> simplified with of_device_get_match_data().
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  drivers/gpio/gpio-aspeed.c | 7 ++-----
>>  1 file changed, 2 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
>> index 2e0ae953dd99..3d675b63936c 100644
>> --- a/drivers/gpio/gpio-aspeed.c
>> +++ b/drivers/gpio/gpio-aspeed.c
>> @@ -1305,7 +1305,6 @@ MODULE_DEVICE_TABLE(of, aspeed_gpio_of_table);
>>
>>  static int aspeed_gpio_probe(struct platform_device *pdev)
>>  {
>> -       const struct of_device_id *gpio_id;
>>         struct gpio_irq_chip *girq;
>>         struct aspeed_gpio *gpio;
>>         int rc, irq, i, banks, err;
>> @@ -1323,8 +1322,8 @@ static int aspeed_gpio_probe(struct platform_device *pdev)
>>
>>         raw_spin_lock_init(&gpio->lock);
>>
>> -       gpio_id = of_match_node(aspeed_gpio_of_table, pdev->dev.of_node);
>> -       if (!gpio_id)
>> +       gpio->config = of_device_get_match_data(&pdev->dev);
> 
> If you're already doing it, just use device_get_match_data() here and
> elsewhere in the series.

That's not exactly equivalent, but I guess it does not matter if driver
probes only via OF. Sure, I'll change it.


Best regards,
Krzysztof

