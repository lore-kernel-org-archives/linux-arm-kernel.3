Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07163E77173
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 10:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JK+YHbwbzYxN2fA6jQpylORDnONEVEdYkbUHx87yE3E=; b=VyRKvz27eZGSH6Dntu+X7VdQWW
	2OCZRbB/DfKJebR8zNulxMUCrWJUJvVrpjLRgD3URnVqmi/2CiyaAwWrplOsqHBTdkC2AODvY6Fi9
	U5obkJU94O3vEswK9GJaG2SoSwtfig20zxxW3D2IYuDNzNnxxKvV0XebGYgFqDxJlIeSJG2Sc7UVA
	XnrGN1GtZ9mTu/LCx5ZVSVSIv7T2JFpgAaD2dbkHiQA3JpkeiRKv1yX8MuIp+C+V1pdt1Gt8yCGpA
	q3AJKaNVimNfNIO7ydKGixt6fNOpfsZwY8PXWgjaT73/L4AoSv4kyoz4neDa9Ui5RGeTe9ss3F106
	912HSf+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKb4V-00000007Irs-1z1y;
	Mon, 09 Dec 2024 10:32:59 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKauH-00000007GeS-20BQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 10:22:26 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-725ed193c9eso583254b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Dec 2024 02:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733739744; x=1734344544; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JK+YHbwbzYxN2fA6jQpylORDnONEVEdYkbUHx87yE3E=;
        b=jBotiQUmACjsmbADGmkowVDYyhoExsx5teSaGPdWo8+tm/EbNoMPmuo1SO1O0uLqlN
         w7EIwpsMdx+xESIOnYJ57413fO2yUFe+yoaq1ifu6tNsAXZQSV4LxiP1uE9mOJBMx9/O
         aTYXqFqNl3tn6I5w1ZKjSCpdm/xH0Ulw5FrMLpGOsWEXVNLXfM8dEQt20L+ExEr0u0jh
         jKVwQtjuaaNrWAWZB1iFP901a98QlbMeMdmjj/kYBPEVoYBKW1KUxpGNqr7LEVoGE4qc
         IEi8Wgi65KM+fqzT1Vny1sfx9U0nRwQz232/Ze3xmshIz5rQxCS3sPEOmSe60DEImD0F
         5UnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733739744; x=1734344544;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JK+YHbwbzYxN2fA6jQpylORDnONEVEdYkbUHx87yE3E=;
        b=lTW+pG/eIDXuLO2Cc0RUbY5u23PztZH6X1TaRAtj9N+FzaehSQ7R4UBd8BQbne/FOA
         sGB8X2ur3m4qh1EbzJKX7OC8CvCrnzVLQ9bKQ4kab5xqoTrsKM4qD+H81VNfYzLAKJUY
         YcZCymw/oq+1VwA/a6Q1+wg3n9eD2BfCZBfKHlXNvgEHie9+LExrNeoqhWCNsxo5z9Ry
         fdXK9EN7QjllW5cnXGGkrZpSUO7uoPGPavB9qj0SDJaMjVfj4rakrTDnC6O1W2Ye0XQF
         KWdvlnuqyuvNInsLNWzvCZKx3Jn159bbINTUSib3rhvGTf0oLqIKTXWCL0I5g25PeNWm
         rb2g==
X-Forwarded-Encrypted: i=1; AJvYcCUV15WQckH2iN2J7pGRz+xhp0CCXHA24K3a8gWbjyVX84SsqEcsJqo79zYuKuQ2iqxLIJf7QeHJBQr3WaV6F2Zc@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4MLWlQGqE+5MyNY346tstt6e5a5Qmq3wkyk5vXK87sHytM7MJ
	fbioIZEuefqFTOrlS3KXaNfo/YL4yvJwWF6sllfOII30o9nkHI0f
X-Gm-Gg: ASbGncv8IHDutFrTO3yosJDd0qWJz5Cg6RN5gNZYkjFH+3/z/XsGGvh+myaQ7oPQh0O
	J49P3jpNGfaWb5GUKRPGDFw0SYOjgzVfjFO8A7INwDbBvbNSiOGniCY4cDXvNJJJ7ZS20PAG7Om
	Y/A6Moae/qj9orC/LM3KHfqFwuEIVbDt27aJvDTVW+LqlLkPSpHUaGBBQ9EmVPVd4ow3XfmAyLW
	Az2cwcKtcx8wiRaDIlGZfyrZF9wuucQwFIkKNYSdv7Yq1kDLP4Y7GXH0QXWLT+Edr2Q
X-Google-Smtp-Source: AGHT+IGIMaQLW4wct1dsitCDskJol1qDWg2mfuDdPh8GMuIT847eTTcppJMdsxFJj7Ut8lRt0yTYLQ==
X-Received: by 2002:a05:6a00:4fcc:b0:71d:e93e:f542 with SMTP id d2e1a72fcca58-725b820b43fmr19800743b3a.21.1733739744446;
        Mon, 09 Dec 2024 02:22:24 -0800 (PST)
Received: from [192.168.0.115] ([59.188.211.160])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725d6856bf7sm3620294b3a.192.2024.12.09.02.22.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 02:22:24 -0800 (PST)
Message-ID: <e06c5d7c-de3c-46ff-b2ee-8ed794577e70@gmail.com>
Date: Mon, 9 Dec 2024 18:22:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] backlight: dwi_bl: Add Apple DWI backlight driver
To: Krzysztof Kozlowski <krzk@kernel.org>, y@krzk-bin
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, dri-devel@lists.freedesktop.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20241207130433.30351-1-towinchenmi@gmail.com>
 <20241207130433.30351-3-towinchenmi@gmail.com>
 <bqn4tddl3kgle7zlamgaqlh45pizw6gf5qjwlmcsbkb6fx343l@tf5w63xursi2>
Content-Language: en-US
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <bqn4tddl3kgle7zlamgaqlh45pizw6gf5qjwlmcsbkb6fx343l@tf5w63xursi2>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_022225_516736_26125CDB 
X-CRM114-Status: UNSURE (   8.63  )
X-CRM114-Notice: Please train this message.
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



Krzysztof Kozlowski 於 2024/12/9 下午5:22 寫道:
>> diff --git a/drivers/video/backlight/dwi_bl.c b/drivers/video/backlight/dwi_bl.c
>> new file mode 100644
>> index 000000000000..d4bfd74b3129
>> --- /dev/null
>> +++ b/drivers/video/backlight/dwi_bl.c
>> @@ -0,0 +1,124 @@
[...]
>> +
>> +	dwi_bl = devm_kzalloc(&dev->dev, sizeof(struct apple_dwi_bl), GFP_KERNEL);
> 
> sizeof(*)

Ack this change as well for v4.

> 
>> +	if (!dwi_bl)
>> +		return -ENOMEM;
[...]

Nick Chan

