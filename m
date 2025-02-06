Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92798C02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 09:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZPzy1Z8VbxCdd+MyKxJcvToGmvpLxSPc4zUEljsmwWY=; b=cj1UgobP5bjKdVaB81vZtkb3ac
	b2iAcN5vUEf9/j00jFfjoCGjF4CfWfw43OGbOSdQcU8ygbyeXUT/CZVgrdtX7tESbBKGupnBG1xAp
	hfyZP8sB0Ie9yde43dvsnrUY30Lnw+hPjOyuyGXu7b1OuI18jVvZM7SuvBoARv+MbowJAbo4mWnql
	REG7pe3mss4iE3ic6LTn8fxUtS3A9hn0ig+7F5pw6S1kre8RqJAifjlIy+FbdjcnUBrMoKqsHTeKZ
	x8/5w9tDmkmQ0R+Piqrhsqr0lCycV4WUIVQCRGzeq/hX1wDkIy7fpTNZhT2BlfkdrIzr1Bf0nookA
	Y9AUB5dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfxnS-00000005n0i-1eos;
	Thu, 06 Feb 2025 09:03:42 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfxm4-00000005mQz-38Gc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 09:02:18 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4361f65ca01so6133305e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Feb 2025 01:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738832534; x=1739437334; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZPzy1Z8VbxCdd+MyKxJcvToGmvpLxSPc4zUEljsmwWY=;
        b=gnznNDb4B94XfgAKOCbuTB5fyqnkDt3O73FUlv6uY+Nvly9zYpN8eXy9KDz3eBJvsA
         WfkS7P1sepzmHg3yucYGhoAGCjYWsrHcElOnYAlHhj7bmmM0Qo0tDBHroBV3AbQPdHc8
         xliCeuXQs+4FHYst952M5jRYCUjl8X3F/NOWGNY7fLtj+gWGNADLF9rWGS3df9lJE1f9
         dJoo2jk1+3/96uQkYZH10UCJJPWnU881Jg0iSGfXQ1lJPuVMp25LRUY0uY77Yu1iGh/7
         gZy+0hN/TpW8+R/OanQiWQGJJ6hM2mInhg9SryVPb1SNJXweVG091fpXnBJgF12TiVU3
         N+jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738832534; x=1739437334;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZPzy1Z8VbxCdd+MyKxJcvToGmvpLxSPc4zUEljsmwWY=;
        b=EXADDcgwE69G/XIR3NpWCSQZonF8OTkzej5iEm12NehI3hRTVdv1W1HpmVVGSdwB1K
         lRuuMEDoOl9yZEnUPWHRz+fdiPyfgjsxVMjk2SPb2+iK01/n5BybgxlvpIawpn0Rg1nT
         xnF8on8xpOGQGigiSzbOxEIfDZ8/gqHpe8phd8w6th+nyhwM63d/9AQBpk7ztV1Zk6K3
         TjsR6+BaIhJmNrvpJDZR/bZhp6Lsyi6AJoEfwlrmfm5G4RPQeTV9pQTQv2pzVkhGHoYR
         rHIqLWa9DqP/SPIsTzpb2iB/4/0PSeStmCJWDFkGEU1YCsQ6aGGjDQtlafBO1Xx52IM/
         SNGw==
X-Forwarded-Encrypted: i=1; AJvYcCWM4vSIDWbcMDwP8lQH5aDzwDY72Sx/4zIi3lnRXINVqYFgMpID/jFi4tq6TiCoWTMcjaC4OJ2Rr1xo5y119dXm@lists.infradead.org
X-Gm-Message-State: AOJu0Yxx97ctxg08VfKKr3FRPlsDB8UKBJ3MrhI7GdThhCZoP8UAp2YW
	CPkocUy/uPDbgpkCZrO2xXgJkRhH0Y/pA+e9cEB2LkQ5HGFwE2YrI6mKVVfq6Qg=
X-Gm-Gg: ASbGncsT+YRp+On7jt4+1kJjjTjt2Z8tw35az7Bwq45CXkDuU8TiKaSwD1wB/HMy9DF
	waRxgaiEFGUJgePVcLxUrHaKyfdYk9enZN6Ieow9O8wJtiC5+oQy4sMnxpUTYdcgVmvcckA4j+1
	TaSKiMajV8RT+chSRDH70WcRrn+GntverZayen/bniLNNH3UZws9+DQ1ZQq3IEEhPILQDyWGyqg
	f4c+5w6FP9C3UJUfVqoocsOTFNKzvPWfvpLcmVz6VbNkv7yR5X9Po7z0Ldle4BiW11XbAvOEGT5
	nzZEK1KlBvonDW1Cwc7r7jrl
X-Google-Smtp-Source: AGHT+IHb4g4QZ/ozYPa6vvDOHmEuKFym5OBNx5m4o6Nj8tDENoav/RWlv4fqN6xllweSDexUwkeGoQ==
X-Received: by 2002:a05:6000:1a8b:b0:386:407c:40b9 with SMTP id ffacd0b85a97d-38db48d247amr4779823f8f.28.1738832534542;
        Thu, 06 Feb 2025 01:02:14 -0800 (PST)
Received: from [192.168.0.14] ([79.115.63.251])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbf6e4a4bsm786590f8f.92.2025.02.06.01.02.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 01:02:13 -0800 (PST)
Message-ID: <1fa54c76-d82f-483b-b577-79322908fabc@linaro.org>
Date: Thu, 6 Feb 2025 09:02:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] firmware: add Exynos ACPM protocol driver
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 andre.draszik@linaro.org, kernel-team@android.com, willmcvicker@google.com,
 peter.griffin@linaro.org, daniel.lezcano@linaro.org,
 vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de
References: <20250116-gs101-acpm-v6-0-e3a2e1a3007c@linaro.org>
 <20250116-gs101-acpm-v6-2-e3a2e1a3007c@linaro.org>
 <f83ccdb0-4d22-441f-9311-d9a2c8cd3493@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <f83ccdb0-4d22-441f-9311-d9a2c8cd3493@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_010216_803416_5A3E41BD 
X-CRM114-Status: GOOD (  13.76  )
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



On 2/5/25 4:52 PM, Krzysztof Kozlowski wrote:
>> +static const struct acpm_handle *acpm_get_by_phandle(struct device *dev)
> "by_phandle" takes the name of the property with phandle as an argument,
> because otherwise you do not have here phandle part at all in the
> interface (see syscon API).
> 

Indeed.

> Other option would be by actual phandle - see of_find_node_by_phandle().
> 
> I would propose in such case only acpm_get() or maybe better of_acpm_get()?
> 
>> +{

cut

>> +	np = of_parse_phandle(dev->of_node, "exynos,acpm_ipc", 0);
> You need bindings for this somewhere and fix the underscore->hyphen...
> and vendor prefix. It really would not be accepted that way so please
> post consumer bindings anywhere.

There's no consumer upstreamed yet, I don't know where I shall specify
it. How about keeping the function name and modify the declaration to

+static const struct acpm_handle *acpm_get_by_phandle(struct device_node
*np,
+						     const char *property)

This shall be in line with the syscon API and doesn't force me to
introduce bindings for the consumers now.

Thanks!
ta

