Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAD48D72372
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 10:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/cJzMSeJBm/TCcIoSkUUB8qr/tXilSOEhL8O9TYXtqM=; b=htGxZVhXUxGAl2vi/pFtg1DyeP
	Hr6s9mYRecaconHVqh13Syzslydu1PuKkRm6hHd9Qrw4vEP0oh8ljJam2syvcLR4sl8tuASyhW2tO
	0uB+Q6xDMk/in/HFP5kmHKfVOxi4uuxvub3zIGj8HxIIqzUJhf3NR4ic+LV3JSPGNaY4mUqCete1k
	FBNfyNhMLc3WE7TbEBfP7q4Rnq1ER94Doa1tKSHlPyy9e1eoduNBpVB8+r+z2WW6x0VhDzBdhwH2Z
	9O5crRZXR8oUqi1SP7HEy/YE0lPvSY2vgnx0uhyktEbC+rhOx4I9dgK3PJdvkt4371DV5KhhjhDfn
	Do4Z4uOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjEcx-00000008kWK-38r7;
	Fri, 23 Jan 2026 10:42:55 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjEcu-00000008kV1-05a0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 10:42:54 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-82311f4070cso677113b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Jan 2026 02:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769164971; x=1769769771; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/cJzMSeJBm/TCcIoSkUUB8qr/tXilSOEhL8O9TYXtqM=;
        b=kWmHkPymOEpKLl2nkDH4jOVqFP5kUDk0BZ/7mm0FlJgMBLMVevfI8rWMaqceGnOGbS
         9oFvKlO+WeH9NkeQD4E+nJ2/mQP2ReJ4vpkR9BoTMLXiYvQCdSUD2ehSNYHV5pjnQ3Y5
         aPm00ShGXG89qjc/kv7OxT7OVqNCszrDrPUvSnQ72OVIJDRz1C3viGT6zzZwOOX5+zYm
         cyptZT4DKkszOLefGw8A/aNtXgFUjWONgPbtoX9FQsciyGKqIc25Q96N/5pqp6v84R4L
         DshrzKDxErqt7S5GjCUEpe1+guiA3/DMlG8YknSUQXePJbKMKQnJtS0uYAKdgEJQQlRy
         T6lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769164971; x=1769769771;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/cJzMSeJBm/TCcIoSkUUB8qr/tXilSOEhL8O9TYXtqM=;
        b=BgzP0we6kKFmi6bgIqEkFU+f6QOk98Vsza2SFE+awUfIv5mRNVrTSncRqjYA82voD0
         FweRzYdviGb7DZZ/QeOERLTxtroghMkiadXTdincqsugOz5ReKb4Jcg0W2bzB5WcgV8l
         GxSokOG4Z5BvELrJb3pqVaN0ySxnxOzFIUCMGFOujJ2OeR8d3O1a5MyltTv0p9vcUPvx
         WfVVg7hVDy8CfWa2cH/oRoK1sq/sKxkavldF3S/9Z46vrXICO+ANlml0hDKGveIIC+p+
         zdjhOt6qXrTFK1WpCaKh9PdD98IIkBlPrhF7I0vKYyJadEvdwxhaM54BQubSA+/v7v16
         bacw==
X-Forwarded-Encrypted: i=1; AJvYcCUIqB88fxIivpGvLvNh0aGMAx9NVQPWbcnHKV3I5sULjpqABbmWGg1257aWVmzsVTjONo7vwikuUcrL4mfTdTD+@lists.infradead.org
X-Gm-Message-State: AOJu0YwnzyP6umuFIgX1mJGxV350Tt1sLcGRfoLaWTaxUfP5s3hU5pMw
	/2CFAlXkHdKQVen/tjKXQl8XFOFr6sfbXFOwLpRNlqAzDd0vYwqVEaXq
X-Gm-Gg: AZuq6aIHGwz1lyEgdkoXz1K/O3qUEUpRk1SVzigbqHtSfL4VdvAIR1wJCBgWiItcMf7
	nqWxf2acfR690S63jMnAwsOgLpQDpbdTNRssqWI93+2ciisqsx8YMkS31Sh1rlG96k6gYCIeSvC
	9k5zUKm1kelgiCVJycq/bbO2PegYm6hMGlPhxw0MYYYLcGBPxRrZFNEgJEC9IFOR380MzeujWV2
	LVZuhhGbE46cffLMusUHJUmwYCfrrudwumNZcZWb6Pw/+NQ73lK2juRpKIF+3g5yc/RUkla6HRn
	XjR87H6cMLbZOLNPw1LB3ZzN7C4dgi/LTvG9RGMKnAcpcRRMrmfRjsWESa8DqsjnohRjHYQ73T7
	kPxVYGh2Be5aoun2a/Ufp0l3PX1sRNVbvg83UgCYpoURR+J76MuWmiExq8IXR0MyYu+tvzOSU/k
	iKxN9FEdT47x+9yA==
X-Received: by 2002:a05:6a21:1507:b0:354:dcc0:8c0f with SMTP id adf61e73a8af0-38e6266c26bmr5654764637.12.1769164971008;
        Fri, 23 Jan 2026 02:42:51 -0800 (PST)
Received: from [192.168.1.131] ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c635a141fc4sm1743148a12.8.2026.01.23.02.42.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jan 2026 02:42:50 -0800 (PST)
Message-ID: <43923bf9-6202-4147-8eac-5bd7bb653fd4@gmail.com>
Date: Fri, 23 Jan 2026 02:47:18 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] dt-bindings: ethernet: eswin: add clock sampling
 control
To: Krzysztof Kozlowski <krzk@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 =?UTF-8?B?5p2O5b+X?= <lizhi2@eswincomputing.com>
Cc: devicetree@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, netdev@vger.kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 rmk+kernel@armlinux.org.uk, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 ningyu@eswincomputing.com, linmin@eswincomputing.com,
 pinkesh.vaghela@einfochips.com, weishangjuan@eswincomputing.com
References: <20260109080601.1262-1-lizhi2@eswincomputing.com>
 <20260109080859.1285-1-lizhi2@eswincomputing.com>
 <00b7b42f-2f9d-402a-82f0-21641ea894a1@lunn.ch>
 <308b676.2d03.19bb0caebed.Coremail.lizhi2@eswincomputing.com>
 <59cec617-0189-4dc3-bc3f-6346155a62ae@lunn.ch>
 <4e2a55e7.3662.19be8cb9c3c.Coremail.lizhi2@eswincomputing.com>
 <c5c0bfdb-316d-4796-afa0-f6f018ceb414@lunn.ch>
 <abf12a3f-9cdd-472d-a02e-af4da594b84f@gmail.com>
 <e6f7da45-3dec-4af6-a5b1-a72210bf24f4@kernel.org>
Content-Language: en-US
From: Bo Gan <ganboing@gmail.com>
In-Reply-To: <e6f7da45-3dec-4af6-a5b1-a72210bf24f4@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_024252_067568_CD0506A9 
X-CRM114-Status: GOOD (  12.89  )
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

Hi Krzysztof,

On 1/23/26 02:07, Krzysztof Kozlowski wrote:
> On 23/01/2026 08:39, Bo Gan wrote:
>>> I assume the address of the interface is fixed. So you can just key
>>> off that to distinguish the two instances.
>>>
>>> Since this is an internal property, not a board property, it is not
>>> clear it actually belongs on DT.
>>>
>>>       Andrew
>>
>> IMO, they should be in DT to provide maximum flexibility. The SoC .dtsi
> 
> This is not the purpose of DT. Please rather use arguments in terms of
> DT rules (see docs, presentations).
> 
Any examples? links? Thank you for your patience.

I'd say if the board .dts never overrides the eswin,rx-clk-invert, (E.g.,
the SoC .dtsi has rx-clk-invert, later the board /delete-property/'s it)
then yes, it can be treated as something inherent to the mac, and then
"use arguments in terms of DT rules". I was thinking about use cases like:
https://lore.kernel.org/all/20230714104521.18751-3-samin.guo@starfivetech.com/

> We really do not care about maximum flexibility.
> 
> Best regards,
> Krzysztof

Bo

