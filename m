Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98EECC54E65
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 20:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PuAh/cVwcjGlNjM6sVg7/AGVhkSzmkw4qVGPWu8mueQ=; b=nl5FE8ATo+C0lrsxhivd/D18fA
	UhlTbSaz4iGbsYaQ8bI9igdjIrxwA3SHo7qoCKHlYfxYghT+LKynM2B0P+5Y48nxhzugFJvSv2lsx
	CGlQeIVSZsma+WnRWHB33Up0YjvgKkH1RbcdcKgOgSEAICCt2FzHqLWupdcSbVRquZd2cFnMD+ARB
	AMT3sZbCEPy0klGHNT4Oc10YCDq2v2Zx0g0OUf6Lw/AVBctZRaflNJLKC24F6+mksiF3K2aSC/IJk
	T2CMIiMi7dFuckJ1ByFwW9pHmcCT5z4+hbW6vTMYz3q+Y2KVPhi5qAGsn6lW+ix1Te7bd6cxxsqa7
	nPAqPr8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHphY-0000000GlfO-1xtM;
	Wed, 21 May 2025 20:06:08 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHpfO-0000000GlYT-07f4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 20:03:55 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-7398d65476eso5585841b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 May 2025 13:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747857833; x=1748462633; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=PuAh/cVwcjGlNjM6sVg7/AGVhkSzmkw4qVGPWu8mueQ=;
        b=GPZS6i5CBxwxicVooYEikt+m3U0oRKyQ+8MsEbDvMTqglD2wuDmbe9LpM5TrOYQzf9
         biXl6ikaDPNYPyn7YYVOLY6Qa0wqABiW6ModahUaSy6xd74NPHmKxp/0m23re3KKv1YY
         CSuo4Qzmpz3xCWg2NtMf1RdYS6NVjdJzOW3HcHjohTKYhPhJbDN77q6aUET5OffYstr0
         wzmf12zxDsA38bRKC+ltboquGYQ7iQmUCzxpAdn0o/yiZxIoTQdG8dLQOVzwKfy/sRfO
         npIPy2OQAWxedJ+A6ssCWD83jLm7BzRCof4OK9xrqSbqKHMq5E+V1XKeTY2xLRBhucPz
         LpcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747857833; x=1748462633;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PuAh/cVwcjGlNjM6sVg7/AGVhkSzmkw4qVGPWu8mueQ=;
        b=TT2PCPW3AtpXTNCChtIOCU7VGPSZaajrISI9I0GLdLelpQ5DuWBQb1mngZqx/fLfEf
         FVDpAmQNPxallvESvt9sNQ6DDgRLuidoV7HMP15ivqtZzRrynQ2itjD3+yMbQzSsQ4hX
         8Wqpqbi0RMz9WnCGfZrsCf7+BGWYH3kiztB7/A+B7OpHGGti5l/dJraLNvm0tw9WyuWr
         j03AXXfqY8wy2AzbkX64OvUqylAqXLOjtdDcgSm+qZRLTVKv6itv/ocTjTsdo2iTFA7h
         5FZr9fygqq6gYuQGIbUrsvp+QXoq5a1qiRhGgDYCo7gqk8UoCMsTfvPcxS4SMRsN6Ndy
         qfoA==
X-Forwarded-Encrypted: i=1; AJvYcCV9h2S+P5N5+d+ABs0xk4QKR/mN6e+Ne6ehPrHDSBQNwe7nLncZ25iT24wIiAkH94RLe4cRWBCB05ILZsAfpmrm@lists.infradead.org
X-Gm-Message-State: AOJu0Yzirc3KRAIHTA0o4kKs8mNYah2AjqUVpQuPedxjJ2fivk7n8JuA
	HFZVkZZqWav2dYzdnXNcPnlqeF4VXtL34Mtb7xD8sGlyrdjw0vtJrLxgVViMeOR2
X-Gm-Gg: ASbGncvBD91PN0DHstyq0zh1rW1cS9sor3g1v25S2G2brgdoNi8+y1YeQNBi3EImf/i
	uML/bbVqLGTjyQFLG5qLoGWoo0EQtIuYsnzbVaXgTPEck0KX9b+3Mh1XHSYjAhs1VuBsK4StyH6
	mq7vbi1A54REKShUx4OZRsOp/MKS32Ao9qe8OsObpgQ0ciIC889EnHbazlZHA5/1Rth7C+vQdUN
	k8CcBIGVXgErNCL1dVuUPy4dtkqQYOwSIbiDsHgZmmTYoU8JvuRkeJPGw5+quygMERfYyvlLAqU
	4ZIGR16St4oBmUlkv1LoFJkTpbWW6RYW173zvODzhqER6eGyDxcyB6/ipT71hPKsnGuRuHrjgIR
	Ozdw+FbvV7HS9o5f0SQlTdiTYGK4Dd4UJA7E=
X-Google-Smtp-Source: AGHT+IE5qI3OCQC0RFp50HBwRXh1dBkNWuu3BPeN4cVEvgfhjKB7R0dk2rPodvgX0SpkUdswAFsztQ==
X-Received: by 2002:a05:6a20:9f03:b0:1ee:5fae:8f6a with SMTP id adf61e73a8af0-2160d5b1806mr42214315637.1.1747857833079;
        Wed, 21 May 2025 13:03:53 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eaf8e114sm10115471a12.44.2025.05.21.13.03.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 13:03:52 -0700 (PDT)
Message-ID: <26ee624d-ac64-46b7-837d-550df3fa7ab1@roeck-us.net>
Date: Wed, 21 May 2025 13:03:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] watchdog: Add support for VIA/WonderMedia SoC
 watchdog functionality
To: Alexey Charkov <alchark@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20250521-vt8500-timer-updates-v4-0-2d4306a16ae4@gmail.com>
 <20250521-vt8500-timer-updates-v4-4-2d4306a16ae4@gmail.com>
 <38df2f02-efc4-465b-aa64-4c9e2c1919d8@roeck-us.net>
 <CABjd4YxZVQSuavEYojc8U4AqwUN3GkweiNNHqn=NDTE70xZm8w@mail.gmail.com>
 <ad056ba1-8fce-4735-b71e-f22c22eacc18@roeck-us.net>
 <CABjd4YxE4eDYt7MEZCrqHK7G9SuziBYEtWSK35DEUxsMmW60tA@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <CABjd4YxE4eDYt7MEZCrqHK7G9SuziBYEtWSK35DEUxsMmW60tA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_130354_074309_E70EA60B 
X-CRM114-Status: GOOD (  12.44  )
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

On 5/21/25 07:15, Alexey Charkov wrote:
...
>>> Do I get it right that the core worker will try and do its last ping
>>> of the hardware at exactly max_hw_heartbeat_ms before the user
>>> specified deadline?
>>>
>>
>> Where do you see that ? In the watchdog core:
>>
>>           hw_heartbeat_ms = min_not_zero(timeout_ms, wdd->max_hw_heartbeat_ms);
>>           keepalive_interval = ms_to_ktime(hw_heartbeat_ms / 2);
> 
> This comment [1] which follows the lines you've pasted: "To ensure
> that the watchdog times out wdd->timeout seconds after the most recent
> ping from userspace, the last worker ping has to come in
> hw_heartbeat_ms before this timeout."
> 

Ah, yes. Sorry, I misunderstood your question. This is absolutely correct.
If timeout is, say, 10 seconds, and the maximum hardware timeout is 8 seconds,
the last heartbeat must be triggered by the kernel 2 seconds after the last
userspace heartbeat request to ensure that the actual timeout happens 10
seconds after the most recent heartbeat request from userspace.

Guenter


