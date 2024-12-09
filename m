Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D28EE77173
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 08:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xQiaE+JvK4g7UWmvAk+qy7K9dS4ykwXQnbxiADZaYvI=; b=OnJ1eBzKdjDD1UYqRQsxgYPCPG
	RudMqc3p7hJ45zMZ3BfmmEzAxIpCgsanRX5V3W78rvYwVbGD9b8DVcmdJWgT2xvQG2xm3D5i+SGcc
	eT3YzxNKY9XvK3Bqlr0UCoTQeYTfAG4vtmh1MgB0exBE/gwkTsxlIWgbzwN6TLEUBGKrwZBGw01YV
	7tYKHy+RfdlOtZIwqPuAA7zselEoRb6gXU6dT6GyiDIwq9Pr4T1GntF2AfsxuooFMoBlgfHhBOzvv
	wrpe7N4qJPjjxdfRkRU8odPt1w1u8biit2rQAMNYfox4z9PCCpOMscLqlkg5e/b0NzAJv0itvTLH9
	PO2gkXAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKZ0u-00000006szC-2WGg;
	Mon, 09 Dec 2024 08:21:08 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKYzT-00000006sfo-11pH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 08:19:40 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-434fa6bf744so2456895e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Dec 2024 00:19:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733732377; x=1734337177; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xQiaE+JvK4g7UWmvAk+qy7K9dS4ykwXQnbxiADZaYvI=;
        b=qDwfchxPCKSs8OkbiaHRR3S3XHhJHZw1HS0DUBBhPklt0YzggtZ4w+M+Cj0AvJpCCv
         BnBIWvFwdxP/yCq3UnaoBSZ7ktUD2R8bawCAs40QnaeylHjJq8N3W7zULfSBKrS4hv0U
         4lutmYCigjAe2dsXZZV11Vf/5BC+tL3jPEPrIlLShg5qOE+Zwyc0/KXw05L2RSvVHP0N
         W0yG/4/w+db6ENaeWBW2fX15zv43lTRxli0ESmH1vrAdBgsDEbpcZHrjdAkD41NOtzXV
         iYWBLrVJutFuRGPAS99PPaac30fcFe/v4LSdxbzGwCgY0ZuyfKmsoykc9IcMtTf7J/05
         INIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733732377; x=1734337177;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xQiaE+JvK4g7UWmvAk+qy7K9dS4ykwXQnbxiADZaYvI=;
        b=hbDiJMuwxLcxPQe3H0/HfDi9snar/ua01Ch6ULOIVQw1HB6hbM966ridMGu/PdKwi7
         VYyWPd6dopxjTxFWs2UHiQ0Z4gYbPtfiBK8fu6950ERWtb6ZLIqLhthkDGx04lDyQUea
         fAA3t5rBXC8OTHyz1h1QAsSp5SkoRX1i7kigIRn4Lg07ksLT8y659aeX8HSc8Vjz8RMn
         kHlMYzcjqzBVTHVOnJyeS0JJmHraihZSaVqY9u/03a/heaXNRyQ+oc9qI0WXY2pSb7h4
         zux7iroRwY/Ld7+946SkWqB1KfNB/3wTxh0SQAdLQ4tVxa3F4sJdykzQG48XV6tQ+PEe
         y9AQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJX05AE4FFDgn3pTkj1ypnVwqu8PwsXsf5rkNflvRHWAYWCvdbT3CPRYEBOGft6vMrKYsRg2hfFdjoklrt3Me1@lists.infradead.org
X-Gm-Message-State: AOJu0YzY36XrJ5z76kWx6H5D1wvuqzeD0in/tU5xVjAcvhlWmVGnEPZ8
	SUwq0gtUx/rxmHGoCycQpxg+loaa6b1KEyYeLOHN8xmJuglMgPNlPaJkiqdo/7k=
X-Gm-Gg: ASbGncvCn3OGLyYbGL5aMMSZDAOhLhYckB62YJfdsgIiwHPbD0zc2StMkz6pI19p1U0
	TrGyVbfEhRg4fDypv7Igta5YqObBLXSzxCWdb3x62s3Akj2vuzsGSvmVaosOHy0Iu30MeE4ArFY
	9YIjg5pvNaVTJkMvtYhlOFQdOXhmtWc3MVVsn+eh3FllgxmlsXI47epfM2Efh2+geO/Je6Z3uek
	U7Bf/3WGuJBQxvV7sIlaeHRFPoJen5KP6GoyR0iHJuoJZisjIUWPjANKw==
X-Google-Smtp-Source: AGHT+IHbzDErJOZQABXZyJP5tU7I2SyjaZPz5Bn/mEn+KluRKuUJnEKdIGQOObo2GOY0FS81Gw2PTQ==
X-Received: by 2002:a05:6000:1846:b0:385:e8b0:df13 with SMTP id ffacd0b85a97d-3862b3d5c9amr8412126f8f.40.1733732377593;
        Mon, 09 Dec 2024 00:19:37 -0800 (PST)
Received: from [192.168.0.14] ([79.115.63.27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434ea1ae415sm76326735e9.33.2024.12.09.00.19.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 00:19:37 -0800 (PST)
Message-ID: <e36da496-04f3-4f00-aab1-f52aa0c1450f@linaro.org>
Date: Mon, 9 Dec 2024 08:19:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: firmware: add samsung,exynos-acpm-ipc
 bindings
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 alim.akhtar@samsung.com, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, andre.draszik@linaro.org,
 kernel-team@android.com, willmcvicker@google.com, peter.griffin@linaro.org,
 javierm@redhat.com, tzimmermann@suse.de, daniel.lezcano@linaro.org,
 vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de
References: <20241205175345.201595-1-tudor.ambarus@linaro.org>
 <20241205175345.201595-2-tudor.ambarus@linaro.org>
 <k2pnpu3ef2rgy6wre2qrearwmetzb4v4meiyqpy7oyg45hohlp@kmnzulhbmdk6>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <k2pnpu3ef2rgy6wre2qrearwmetzb4v4meiyqpy7oyg45hohlp@kmnzulhbmdk6>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_001939_331371_1FAA971C 
X-CRM114-Status: GOOD (  11.60  )
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



On 12/9/24 8:03 AM, Krzysztof Kozlowski wrote:
>> +  initdata-base:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description:
>> +      Base address of the configuration data in the shared memory.
> If you really need this, then it should be rather encoded as part of
> shemm phandle (phandle-array with describing items, just like syscon
> phandles are done).
> 
> But OTOH, I don't see why this is needed at all so far - compatible
> defines it.

Indeed, I shall move it to compatible. If firmware ever changes, and
uses a different offset to the configuration data, then I can introduce
a new compatible.

I agree with all the other comments as well, will address them in v4.

Thanks!
ta

