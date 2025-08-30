Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02B00CA0FFF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 16:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aDZ1phRAEk3zIW1PFqiad/v15RHmZHAjGk3sbt/9HL4=; b=nX4MSsrNnaIdzwr+Yv7JQuob06
	MH7nF8qx85R6tcAf98NvX/NMpAesHPtwC9XB1hmEbxC2DphaVmZ10xiIXPzftWdFXbCUXwKE9xza9
	itpRUdFiYyO6zrirf0PioiFBUEquSo75IzluoW2Sy78U772/Omv61whMppupVUJW41/4dMkp951r4
	B2V6tTJid4oH1SrPjfRBXJij6NvTwVO1PKwBqjy4kw6S/kd5nIuUafs3iIgs9e8pfi9DmdkUm5bI9
	oSH/U3aRsB1resjga6954StVIzhoBFDCC6Clk+KaK4QL2AMKadmfhOvBqc9qCuI7lYgWYaf6Xsrwh
	eH6otUtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usOkX-00000008A5L-1kfh;
	Sat, 30 Aug 2025 16:48:21 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usOSj-000000088cn-0RUo
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Aug 2025 16:29:58 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-b041264542eso3300966b.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Aug 2025 09:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756571395; x=1757176195; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=aDZ1phRAEk3zIW1PFqiad/v15RHmZHAjGk3sbt/9HL4=;
        b=qCMIRDAalBJswBsbId06TIXdsbQwEpfiCzoaopd0LBMYfYi/S3tVOW1lPYccTlLmu7
         TdK30wg/d1demrlmARRZSMar5HefSN6lQhLvz1pk0JYUB5bsq7UjcEhJUzkvE8za0yqL
         e9nPAQ2vvsy4p17spwFlF6GlWum95gEEmniXqc8qeo+1o1L91ofzKxRX7df5qt+M/zcW
         4Bp6dpWNaPqj6c0UaV114scli02r1g6KKllm7K4r65B9I8NPR1btJa1pEACGzwu8/69C
         IjrzDJHL+u4/8E+rtH8UmaWpnauOXk+FbyRtO90f/SKYpHE8Ss/Z+CpPvTFU7yN77AFv
         L1fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756571395; x=1757176195;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aDZ1phRAEk3zIW1PFqiad/v15RHmZHAjGk3sbt/9HL4=;
        b=QA+P35KClpjlth6h0bXn3BqpPsL/qz0f07yijYSNIgFE0ciIp08P5fxBGgOEjOulue
         ZwbJvxpDDBfcMDuqn+MbUrUfGrv9VoGlL6FAPXFKH/jnNtlHD4WsTmb0rA7HP60Ke1g5
         /eDRcl3N6j5UMw+vXZRgW83OsviofP9UhpJo1FwPkqpLLH81fna8/cS11uzasN2cpi+3
         /ECl/WsJqtsGLWZObDG8kjTaDDgjiZbJ1/ziADKPdhgoekR/i8dIiznVq8/oZs19AXt2
         L9dEDbrGk9Pkv6DwLOvBylG1i38DBq2eJKsRSEH8n1RwZRMgMLagf11VQSOrdbpNtfYS
         mW/w==
X-Forwarded-Encrypted: i=1; AJvYcCWS4sKsstJiKRdHc44yAb8V80mVH+QrhRIkMf1AMNcwp6GLu9NliU/Z6ASmG8OXkw0CVCqGMm4y6S0q6X3g7mIc@lists.infradead.org
X-Gm-Message-State: AOJu0YwgtxHEDVAIOUPkqNDusq9TLXa0hr0HEb42sJnqUGqxZQt/y1tb
	PShrJU6JwBhGgXi1WDuFduzXjdSnEfdUHUdn72VTcY+MiS+wdtyalAQa6ANJzccmokI=
X-Gm-Gg: ASbGncsYrQMJ9VmxM5d3121AUBVnnmG25Xp4/s9QE59ts88vEh7kG2MbOUkw+7NKVU3
	bCs0rUOb7/qJwDus1JCtgCMx+RB+30ugVRO+jm5izr9ezGYYqqMz+0EPaNnlkqIOYh3rEhKMkex
	AxGvysHqgGB/iBRYzBMt/k3fJsavHG5VCgtNfFMcEio1hrJ2y+UWNCVLdFcdbQn/1fSz7JpaBJ8
	hD6+6nfekm0JX+QI+9cq2eQm+L/NiIy7Y4RaJMMbMY6k3KKlW/wH/HOsvOXvZSqmfW9ik61ihLS
	rB/LU6PxiJjqPfSbeVNARF3GZatjACMzuZMyz1fibZhIlR0ZV74zwF3MF0xv4ogZ4EsPqIzqA/a
	syvepKBa8NOayVaXujq16ZAV8Jj+q4im0+0pyDhD0nPY=
X-Google-Smtp-Source: AGHT+IHl8ruWEBHE6w89eG7vWUcWSOoBbbR5fr+SYB9KV3qmIErp5onySpmrDg8O9rfNho2DchGeeg==
X-Received: by 2002:a17:907:808:b0:af9:3397:ee9d with SMTP id a640c23a62f3a-aff0ee1731bmr196795366b.3.1756571395394;
        Sat, 30 Aug 2025 09:29:55 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afefc7ee972sm460428366b.1.2025.08.30.09.29.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 Aug 2025 09:29:54 -0700 (PDT)
Message-ID: <95f73965-5ba4-4c02-8dc2-09771952ab1b@linaro.org>
Date: Sat, 30 Aug 2025 18:29:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] usb: ohci: s3c2410: Drop support for S3C2410
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org
References: <20250830130101.142934-3-krzysztof.kozlowski@linaro.org>
 <fc4ec548-9a1a-44c3-9958-b6778e37d910@rowland.harvard.edu>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <fc4ec548-9a1a-44c3-9958-b6778e37d910@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_092957_159837_39B12961 
X-CRM114-Status: GOOD (  14.62  )
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

On 30/08/2025 17:25, Alan Stern wrote:
> On Sat, Aug 30, 2025 at 03:01:02PM +0200, Krzysztof Kozlowski wrote:
>> Samsung S3C24xx family of SoCs was removed the Linux kernel in the
>> commit 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support"), in January
>> 2023.  There are no in-kernel users of remaining S3C24xx compatibles.
>>
>> The driver is still being used via platform code for S3C64xx platforms.
> 
> This title and description are a bit confusing.  I gather that while the 
> S3C24xx chipsets are not longer supported, the S3C24xx OHCI controller 
> is still being used in S3C64xx systems.
> 
> So what the patch does is drop support for S3C2410 _systems_ while 
> retaining support for S3C2410 _controllers_.  Is that right?  If so, can 
> we change $SUBJECT to say "usb: ohci: Drop DT support for S3C2410 
> systems"?
Yes, true. I'll adjust the subject.

Best regards,
Krzysztof

