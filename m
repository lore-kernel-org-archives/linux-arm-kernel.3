Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78AB9C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 08:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p5uMs6FkdhW0yuPSJiF5IsCQmeoDxyXFi4ZKMZV6l28=; b=zmbrQMzY5rIYUmG1t2sXMUKlq+
	GL8qJMUcpzWIoNp0MEieIdHVix/SuIB3WBq+zHzq8beWhImrYHi5xhdMqXpVKqs01JH+xvNLoHxh0
	XFtSU8+HqrfOJizSXgQQkJQoiSxORcw8lNO4mTqp00sl2VB2R0FjiyDm3UW7NQhVwaCCRF0nhz/RT
	eT48n/9VGq6yohKyWI8A/uKk3QYJWXBcCS0E5MJyomyUddPjP2XxFn3aexmTd/2oy4nDFMqfcFpOz
	6mF41c25YgUL0ZNUE3RniiPu0L+LF0uqaDfNtGca2wu6S3SXnouONQzliTFR89YqkzahEGrw4S0E+
	UsIKBqeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFqHM-00000002nkj-1rPk;
	Fri, 16 May 2025 08:18:52 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFqFB-00000002mgB-3YeO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 08:16:39 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-ad52d9be53cso122310666b.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 May 2025 01:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747383396; x=1747988196; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p5uMs6FkdhW0yuPSJiF5IsCQmeoDxyXFi4ZKMZV6l28=;
        b=eaRX8WC8jsmDBdgBapQQ8uFOYgLdydD1G3XoaKgD7fWxHd0M5mpuRHovnHv4dLpk1Q
         gqQZnoyE8aKPfgTemLLrNSv0SYatlxPoL38nBjM3XWjqWd1/OHSljavtClm7AwYOdh+l
         FT7AXZP4+WDsv+jwPmIZTfQLwLyrl9uOebesmNNIz2+kMZTPm/zUnUKjvzxHhto3uX2P
         zFXLaaphOjMbKFQFseEo0UKtlzl5S6J+jC70s2ZdWw7Khd8A2iodVrhDoudvKO3Rf7o3
         JyFkrZiy6Pk0kB2XcRhdmobI7h4rxP4lhyl7O58tSW9KDVV1Smh2T1igGoOZGaYRQY/F
         QW8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747383396; x=1747988196;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p5uMs6FkdhW0yuPSJiF5IsCQmeoDxyXFi4ZKMZV6l28=;
        b=wk9+22cx28awcUJ3m9JXOuAM2eMgBTJaT4Lo0G1eOwKLioV5asLuegEikRbMzcElgD
         NWeRqg7KG3hL/VZWErGHJefWMZT9bgV2LbNX/uX1JUC7aXFTXLbPMoW4nB9Mi5ZE/qB9
         l00xuAlCCC8wKYtnfxRcwiCIdQrsmETB5Urb6ZXe3BOhUU9Icp7ayJ5S7WjEs5a4GyIw
         raEw28xSmaIylR8BQto1l+8MhMhuORhMU316wCJZO7VLiVe8PRk1QdJhAX+YNM75ovgM
         fvJaSCvEeFs0MlBVFscpVbLpt1CF+AsWRnYPScu/NNf8b88FbIhjxkDWUWrAZSVSEKCB
         778Q==
X-Forwarded-Encrypted: i=1; AJvYcCXnUrMarYqN6j/DMs8ETXOnvNOtew6eC0V536RB3vzvBNEW9UkIRLHhubzOSzSUrMmFkoMLpY8mWoI8itVPIFYk@lists.infradead.org
X-Gm-Message-State: AOJu0YzjfOeMlr9id+Mj/8DDKgrVuFp8ewguMM6bjUs1LlIGcESPFpHS
	B0RB9H+fEG5lFCsbrtldM+/3tXmHW76CuklnD3wymgOGSfEFqF/BDd0I
X-Gm-Gg: ASbGncsYE7jojbFr72dBBwwBCkG++euixO9d51SvKD0xapFGe0oGlTheH0LngMm2uBa
	aKC+Be6KPQXhn4BPmwDo2uAHFtJ30cIKFndnL+xdVy6RXhHnahhCNFaU2vxOdMhv+QmP8JvX0FA
	Im50w3sGR+0dqyVyafUYyUe9n2S30oewBg2w5HjPT4oazwWy9Ezr4/iqNAviWbwebFu4UgKtiWr
	LOojR3hmglCC/wk8oJZbP6BSXd5uzLiocspepp/DSxKGbk7k+ux0NO1i3hxU812JrVyMPMRnub1
	5z7Hg+7TcOHYkqBrduUa3iKuuuscUAzVhirM96ipSGBknMu+KbNEczw1O7oe
X-Google-Smtp-Source: AGHT+IGUyQ4WvvI8Y54HOBmPIQUwWgTnB7hUofnygJIB5iOp5HSMPI4dclX6JAUQZWevtotWc6mVOA==
X-Received: by 2002:a17:907:9811:b0:ad2:3371:55cd with SMTP id a640c23a62f3a-ad52d46ae67mr221922866b.5.1747383395358;
        Fri, 16 May 2025 01:16:35 -0700 (PDT)
Received: from [192.168.1.130] ([188.193.103.108])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6004d4f1c90sm1016490a12.12.2025.05.16.01.16.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 May 2025 01:16:34 -0700 (PDT)
Message-ID: <e53f54ad-df31-4b1e-a2a5-2d14a138c9eb@gmail.com>
Date: Fri, 16 May 2025 10:16:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/4] ARM: dts: stm32: add initial support for
 stm32mp157-ultra-fly-sbc board
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 =?UTF-8?B?QsO2cmdlIFN0csO8bXBmZWw=?= <boerge.struempfel@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20250508143818.2574558-1-goran.radni@gmail.com>
 <20250508143818.2574558-5-goran.radni@gmail.com>
 <8e25c2e3-fbc6-4d60-8362-2b0fb3066821@foss.st.com>
Content-Language: en-US
From: Goran Radenovic <goran.radni@gmail.com>
In-Reply-To: <8e25c2e3-fbc6-4d60-8362-2b0fb3066821@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_011637_909130_83BA6C5E 
X-CRM114-Status: GOOD (  11.16  )
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

Hi Alex

that is great. Thank You!

Best regards
Goran

Alexandre TORGUE wrote:
> Hi Goran
> 
> On 5/8/25 16:38, Goran Rađenović wrote:
>> Add support for Ultratronik's stm32mp157c fly board. This board embeds
>> a STM32MP157c SOC and 1GB of DDR3. Several connections are available on
>> this boards: 2*USB2.0, 1*USB2.0 MiniUSB, Debug UART, 1*UART, 1*USART,
>> SDcard, RJ45, ...
>>
>> This patch enables basic support for a kernel boot - SD-card or eMMC.
>>
>> Signed-off-by: Goran Rađenović <goran.radni@gmail.com>
>>
> 
> Series applied on stm32-next.
> 
> regards
> alex


