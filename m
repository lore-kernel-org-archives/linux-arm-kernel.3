Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10021E77184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 09:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T49MJOLV8ESyJTCSjrdtWjc6wkPEGcbyfLqIvLotXMo=; b=43BnzAmwK8QnVD/R/aNbEMS1wz
	HUdlRpzEDp3TGG+jIMFXqN5dIn0j2tA9z2TpUUKMxvC9toki3oAKd/5wAYAcmYGfWRVioYWaQfpxB
	rXCkdblkOje73tjfomeQSDD1CfZchgHey8GoGrdKqqu6BPI9InZvz1mnsMPRf0psxBFf27PVPeFbD
	AjK+mCF2S6idX1H2KPhhfhX17xFxvTv7Y8BcjNpeZzGPW58CjJu1ZVLVIpA1h0/wW2TcX3db82i6n
	jjMMBXWBffSOWIRbFnTEvmxrWKRTF+hZ9h23Paa1qo0W11u80aKmzvSwsM+Kztx0HEct47KKJD6yt
	DkVuI2fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNUKI-0000000D1DA-0vWv;
	Tue, 17 Dec 2024 09:57:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNTvc-0000000Cw3E-0MMY
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 17 Dec 2024 09:31:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=T49MJOLV8ESyJTCSjrdtWjc6wkPEGcbyfLqIvLotXMo=; b=YkuzJrT7ZRWaqQs1bq62BvchTO
	j7Kx+dNBdbql+pssdpaG/GtSxjOebpGWGh6N6NdFayGnUu1nOg2jVTxjMOIz+pIayyTfKTF+0B3Z9
	pdoQbQSMPVlzdHrRjZm4dBxTr4YEtNzLy6d4ZdL7sv59qKTnV918W37oD0zB+o3HzJx0p3IPvcSlp
	x0UP36OjfNmVCTikEFdde5BzOlPMsV4QbP4pkdz86bVrFgoWFLkoNQpvXfrBjO02NOX00uKoKmnXR
	m94ZIJVYGJraVIS5qREFk8TAuYv4uroMBXARVPidos+xCRyIqqtlKJrNMWaPhwl6G/qz0rLCiXzpX
	sZlPujNQ==;
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNTvW-000000053OS-1yqf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 09:31:42 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4362f61757fso38341275e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Dec 2024 01:31:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734427894; x=1735032694; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T49MJOLV8ESyJTCSjrdtWjc6wkPEGcbyfLqIvLotXMo=;
        b=PcgxaSnrH5jUt3pAU5YdlHEnk7ilxeOM6TI3+dj/ydBo0Oy7VV70uHK4MziZXCXmeM
         5Vs9jcztJpL/HrGiSEZtf3bcPk0pFRMH1IOT9+d8aDXBIdBDz8VQ8OmUBP7nM/pP1IXZ
         g+RnrmIEmsm5bkWCN5TXDGqsgkkFzYZwuulPEvVm9Im7kPGWZRTlpAT/anV2ZZpbofPm
         v7Xsn5iQRHW4aJK/DO3GvlihGrPb5sdFuVS9Dl1P1R6LcL24JM/yFFb1e4Aciu0jd84l
         S7889R4V61UhY7HOGThuYxglaIShCioC+jm8ceaVlH3JkTchX/OmEdBfg+yigErBBm2j
         ReRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734427894; x=1735032694;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T49MJOLV8ESyJTCSjrdtWjc6wkPEGcbyfLqIvLotXMo=;
        b=QPeRv0MNqCRo2wr1otnpt65kPrVFD/Z0Wv5EhiIVNmMkea87Pd0vQL/PYud3sb1vGO
         rskZl5ZLKjEd6snnA5uXiZdrThBciL8xfJndNRGOXm+gbb+FF7m2fsL7qUZFOcQpJYqv
         TkJMo3Kw9wMOZdY9kLY2omfeMMZnwu/0fJLQIEKXhyMksP2pLhP4cHAmHWmEdIrXswAb
         GxaNyiV8HGB5oPx96GfuSo00QvV5UTcCe4GfOWcxjW2oIQgjfUUByHcclPJq/v8wP4Aj
         YPV8m0mEQC+9Uuh+74xBqcAEaE2Kmjh7O0pE7JQmgZiioPfYYyslJD/1fCD9SnZBdNzt
         bh+w==
X-Forwarded-Encrypted: i=1; AJvYcCXvYAW05PKOzZlzi6M6/F4Kmr37+7+3dTprVVGh1C+/fNctafG4aAIM+dvwyqnGpA9loaOZ7vdOVPVKd5koN3eB@lists.infradead.org
X-Gm-Message-State: AOJu0YyMh2As+R2oVMUNiKROUIEc/cM06WfoNFb8DBpm8dYPWhi3mhlm
	jKxgumGnk2xkyl3RTTxs8r77KD+tcR4i+63AXPDWUCJeIbxZ8it1
X-Gm-Gg: ASbGncsCHTMB8ANTCnYljHW6DtvziZGcE8bh0M6qmTbsNSxOfTF8L8JeM+eaAsgQIqd
	elrkBH/mwMqB43EKMn4rUzzXZwzsZR6zeHbWtizzmh6o1ovyGQSIBQZCNio64pwg/Smy6Oz5mgS
	B5q2H+j/ywgQdRHeH20BfS5rk8IpFdn0Sj6OebzY3tzQpUjNSOv9qLcEtg10l5U1J08ezr5DPrK
	QBcUaH8r5ooQ/Sw6bF3qr+6Dt6ikZo9tBdH2bonoJqUWNFeXb8e4bLKq8RR4l+XU0RrgzDleWPb
	fEREGWjPkJeWRXA0ui+Qwg==
X-Google-Smtp-Source: AGHT+IGsXtjvTI2iQZt474j852R5W0w8BTFwUgVheZ+H6j7bDyIn+pg0qTpB+H2pDDr2MYOaChXPXg==
X-Received: by 2002:a05:600c:1e8a:b0:434:f5d1:f10f with SMTP id 5b1f17b1804b1-4362aa52fa7mr148788375e9.17.1734427893553;
        Tue, 17 Dec 2024 01:31:33 -0800 (PST)
Received: from [172.16.20.173] (62-73-104-42.ip.btc-net.bg. [62.73.104.42])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4362571776asm164546165e9.40.2024.12.17.01.31.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Dec 2024 01:31:33 -0800 (PST)
Message-ID: <17fbfcdd-8b79-4907-a4c8-798da0ef0526@gmail.com>
Date: Tue, 17 Dec 2024 11:31:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] dt-bindings: i2c: exynos5: Add
 samsung,exynos8895-hsi2c compatible
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>, Andi Shyti
 <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241214220419.723100-1-ivo.ivanov.ivanov1@gmail.com>
 <20241214220419.723100-2-ivo.ivanov.ivanov1@gmail.com>
 <0ebc12ed-fe91-4c8a-a626-b735b0eeecf1@kernel.org>
 <007559c5-f566-4625-99b7-e761a916fba3@gmail.com>
 <cccca881-dd59-43c0-9072-dcd91d01671d@kernel.org>
 <6e93d59d-71e5-4c09-862f-55b5504121aa@gmail.com>
 <69fd1dbc-a29f-488c-a30f-7e5ea8f01a23@kernel.org>
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <69fd1dbc-a29f-488c-a30f-7e5ea8f01a23@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_093140_391421_402E438D 
X-CRM114-Status: GOOD (  13.87  )
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

On 12/17/24 11:26, Krzysztof Kozlowski wrote:
> On 17/12/2024 10:08, Ivaylo Ivanov wrote:
>>>>>>        - items:
>>>>>>            - enum:
>>>>>> @@ -94,9 +95,28 @@ allOf:
>>>>>>          - clock-names
>>>>>>  
>>>>>>      else:
>>>>>> -      properties:
>>>>>> -        clocks:
>>>>>> -          maxItems: 1
>>>>>> +      if:
>>>>>> +        properties:
>>>>>> +          compatible:
>>>>>> +            contains:
>>>>>> +              enum:
>>>>>> +                - samsung,exynos8895-hsi2c
>>>>>> +
>>>>>> +      then:
>>>>>> +        properties:
>>>>>> +          clocks:
>>>>> Missing minItems
>>>>>
>>>>>> +            maxItems: 2
>>>>>> +
>>>>>> +          clock-names:
>>>>> Ditto
>>>>>
>>>>>> +            maxItems: 2
>>>>>> +
>>>>>> +        required:
>>>>>> +          - clock-names
>>>>> I don't understand why do you need second, same branch in if, basically
>>>> Because, as I stated in the commit message, we have HSI2C controllers
>>>> both implemented in USIv1 blocks and outside. These that are a part of
>>> On Exynos8895? Where? With the same compatible?
>> hsi2c_0 which has a clock from BUSC and hsi2c_1 to hsi2c_4 which use clocks
>> from PERIC1 (CLK_GOUT_PERIC1_HSI2C_CAM{0,1,2,3}_IPCLK). Why would
>> they need a different compatible though? It's functionally the same i2c design
>> as the one implemented in USIv1 blocks.
> If one block is part of USI and other not, they might not be the same
> I2C blocks, even if interface is similar. If they were the same or even
> functionally the same, they would have the same clock inputs. However

I see, so in such case I should make samsung,exynos8895-hsi2c-nonusi or
something like that?

> user manual also suggests that there is only one clock, not two (for
> both cases), so they could be functionally equivalent but then number of
> clocks looks incorrect.

That'd be weird. Both according to downstream and upstream clk driver,
for the USI-implemented i2cs we have a pclk and an sclk_usi.

Best regards,
Ivo.

>
> Best regards,
> Krzysztof


