Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6394C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 10:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dqsCWWkSmH25LiinfK2WpeOAAuO01FXzi3yUfsrVLMM=; b=h+vLH866mhn8q6nJc39fjd0N8I
	DFdz8nF1GWDcKwyFBzucdWOCHH1e9zkjiQ2MkFIz2LNnURvxZo0/vHdRy7IJL9NMRYTrY8DYVeSvc
	pZrMtCXxCiJmGEVeDSdpWoB7iaMs7pwKk/7A8WSrXyg22XTa0hPrkuvoV2mdcKOFlikFnKqQ5U4gR
	cJMK0e+4Mc3L97ppReXZuDC1uVbDbLQ9GPu2WA9wZImpvZHoNIyhzrfJ7D4VU5coh2QapnKeR0nMh
	7sGp+JAhs0atMnWHfJc7m2FD0t/GP1TbO6gbxQzZXIjjnQGEdYmqPgF2nZccTHkGGSwIFANas/hSY
	KU942ZHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkhZx-0000000CDSA-2SNb;
	Wed, 19 Feb 2025 10:45:21 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkhLH-0000000C9fe-3jnk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 10:30:13 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-abb892fe379so510321466b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Feb 2025 02:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739961010; x=1740565810; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dqsCWWkSmH25LiinfK2WpeOAAuO01FXzi3yUfsrVLMM=;
        b=TyUhXrk99JCsCLMCUxzt6vQCkhE63jnck4s9gZ6ZPlTI7GBDxozQP/U/Z8XDBYVJvk
         vSSt4Z1I/l//nwGAUzjQv/KbjGRmvalnE0dzrwI/J7/XNkrVvrVRs3MCq9y2rc2LtldF
         tzgDxoGKY48ry6Y6v2m4D8kz/X6pLTzLJv0NANQqyKClarDYItInWEDL2VN76J7zvq/e
         RVDtLMqkgfixkyLJSgB8nComCFUxfQhkM7maUTbAanFSK8a7ZPs8ncys084GZQjEcmSp
         BwK1ePu0rGl9jAIKd/aNEs4zunn4ZjMJM9kUbtgbnYxiyKFy84U1370GIyr78qOSDlso
         mimQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739961010; x=1740565810;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dqsCWWkSmH25LiinfK2WpeOAAuO01FXzi3yUfsrVLMM=;
        b=Z8yHy6A702oRp+AhdX6jqlS44q1Cj/NpuYt0GbECtkcia0VztTG7scLC+DiM7RP8yz
         3i/ZotpVEiX6cEeoSeAFh0NrxdVzGP9iZCtp1nFV3vMc6mIep/dHB+3n0nILTi/fN5ze
         9505wbcbD/CFJwT6KwVOiU1ZTfbhibmsuqVhx1ADKu9YcrbD4JbS5ZnMl+Bt3o+bucbd
         uGSmyHJwGt5+rdfN9fVOa0IRoUpIaq8UjmWJDOUXJvcETg1l12HIgvXtS7ui1KE+Ni60
         bFVaUu6niT7/cQqBoeHkVrRyg3TsZB8sOF/0PuP+xpKdlfFK7lW4kYDc0ooxkTDnykMY
         tT5g==
X-Forwarded-Encrypted: i=1; AJvYcCVq6fIPfQq/Q1plHUappjWz6YDkpDrqJ5HTb1yVwGHosRT11vW0vYj6ZOI+hmJiMPK6u9G5AnSz4ErQJkYO3AXt@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2A81nY6F5Uo6gXLm0RY11cpgs6Ph4vX5I1pb0XUsTZAJI/B5D
	eeGDrvZxUG8Jjjc5phhzyOcTvCrP450Xnchlr9WyqmrQGQ7T6oHD
X-Gm-Gg: ASbGncvznEAdQpumlv60/PDVhEPPpLvmQV+sAsfrD+nPF95O6JwAIHznXLTgTuiPe4b
	jUpXni0ObBRHck+FZ/JD08qLsw5uAlm8CNdUdMqEKeTnN3ixS4ySfmSshddZNvwZPJpAmdX2cVR
	2bEvfe6JshZqhe93Wdn7dQ4AZW3q9CxeF+pEeJvZYOS/jLcyd6LMcDjRh46/xdrZunWuBySamtY
	2bA2ERxyQJmJn11bJXHUKGTjKF23riTk/zqqs59gcgZuPBbqB8K/6PrFWAMB1sbKYXO66vpuNnf
	JHeK0RiSTLICnE/IbifAm7MM8CJL2SESsTuz//etj+rFltiHif+zBPLg
X-Google-Smtp-Source: AGHT+IGMRnJbqZGcoPSmmMe5Vij/8eD1w+eN1gparuJBfqUiWqQu7i9iee9bfZFQ1AHQ3VeOe6iFJA==
X-Received: by 2002:a05:6402:3710:b0:5e0:7cc4:ec57 with SMTP id 4fb4d7f45d1cf-5e07cc4ee69mr14087611a12.31.1739961009458;
        Wed, 19 Feb 2025 02:30:09 -0800 (PST)
Received: from [172.16.20.186] (62-73-104-42.ip.btc-net.bg. [62.73.104.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abba358ec3asm483479766b.35.2025.02.19.02.30.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Feb 2025 02:30:09 -0800 (PST)
Message-ID: <c39e6058-0649-452f-9a21-d9d5a28ccc06@gmail.com>
Date: Wed, 19 Feb 2025 12:29:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] dt-bindings: arm: samsung: document g0s board
 binding
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250215130500.170738-1-ivo.ivanov.ivanov1@gmail.com>
 <20250215130500.170738-2-ivo.ivanov.ivanov1@gmail.com>
 <adbbd60e-c72c-46f3-87e5-198ab1d49d9f@kernel.org>
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <adbbd60e-c72c-46f3-87e5-198ab1d49d9f@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_023011_938717_007663CF 
X-CRM114-Status: GOOD (  15.38  )
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

On 2/19/25 10:35, Krzysztof Kozlowski wrote:
> On 15/02/2025 14:04, Ivaylo Ivanov wrote:
>> Add binding for the Samsung Galaxy S22+ (SM-S906B) board, which is
>> based on the Samsung Exynos2200 SoC.
>>
>> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>> ---
>>  .../devicetree/bindings/arm/samsung/samsung-boards.yaml     | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
>> index fab29f95d..bb3f6a0e1 100644
>> --- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
>> +++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
>> @@ -45,6 +45,12 @@ properties:
>>            - const: samsung,aries
>>            - const: samsung,s5pv210
>>  
>> +      - description: Exynos2200 based boards
>> +        items:
>> +          - enum:
>> +              - samsung,g0s                     # Samsung Galaxy S22+ (SM-S906B)
>
> What does g0s stand for?

Samsung started codenaming their S series like that since ~S20. I'd actually
much rather use something like samsung,s22p but since 990 devices upstream
already use the weird codenames, I've decided to do the same.

I'll mention G0S it in the commit message next revision.

Best regards,
Ivaylo

>  Sound a bit cryptic and you did not use it in
> commit msg to explain the origin.
>
>
> Best regards,
> Krzysztof


