Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8E65CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 17:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c5PKKDWSujsQQD/ZWb/LSNZsX1wV9B1TZv7vRfE49q4=; b=e4YvJr4Z5ci+fL5MxlM+k3nBWZ
	fzRiPmh1Bembum382mVh/khSd/LnIeLjKkMz0UiZ5KsHnpuq7oUM44vYGr99c86RZmrPoW3tt+vCC
	OD2jrRllBxFy/ZD7JdxuHw+W8wMkuX0PbDlD4LmZw+T/2ocYC72fOiqi2aQLf2To0cT8PDG7Qp3XF
	iLuvCkWJyGYUJrTe7jJtNWvBmAzE9fsWEEC0bRPR+9OZpSrz8MBQOH/Vzus7vyVM5/7SEex4LCOQI
	q+mtWH98vz/flxhDpmjsTFklkUNS72E7Do8cAG3lTFFpn+Ag0O1gg/Q4x4ZcySK91dUgtaIY3EBT7
	XSTHPTzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo3iN-00000008AKJ-2NmP;
	Mon, 18 Aug 2025 17:32:11 +0000
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo1kk-00000007v0M-1HUf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 15:26:31 +0000
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-30ccec9af01so1983594fac.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Aug 2025 08:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1755530789; x=1756135589; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c5PKKDWSujsQQD/ZWb/LSNZsX1wV9B1TZv7vRfE49q4=;
        b=lis6B5BXvJu2MTVURBhnqIW1p3ij5gwm5ObhRamxl/wDDkRGGQ6t9mkxeestX1HkgJ
         q9euDZO6CnDj0zRmSMfH6/vBMW7j7RgXguIjjjKUqC2hCccywrTDOgolCyhcJtIqH3sP
         8O+gjNQ/UJ5U14N7Z+ouOIa40c6MgePW4daVp899QR6Gz3sx31n8hfZzWbax85B/rOCR
         uEfxUmuwjRj/9Qbu3Voj4mQvrjHAaPs1KpheZeVsRxFvS3W41b5aJbjkKpvsAObJqoXO
         OtImbfVKtha3Fvdm+jmTtu+aaTvzqD2OcrZ8cSN0SA97ESR/nvgp1FuZqIJpQIX17fth
         qlIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755530789; x=1756135589;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c5PKKDWSujsQQD/ZWb/LSNZsX1wV9B1TZv7vRfE49q4=;
        b=SkUuB96OmfXZ5lMHpmQRobvcHUCcvGd//FJ9M6BE7FP5zttsOSW5h0BjkrHLufWIZ3
         sRqWC5wYi8fpLLXmXfGgGInQqal0a1Aetd0qB7LZmijjxZRotIBHZb21E8kYsYmuQYrp
         Y/9PvfFeeSvFsRB+8Ln2CppLWqggl8baOmHWFDrc27DqdYot+S4c13hoVBgPTK+xTKtv
         TGCrtqzvr5guTJuuyvcQW3Ra1biECt6QlTxBwbaH+iSmoxA6XG4vDDOqF+73L/6u5+ZC
         A0hnO9KU6m400TalyvWNJUCmUIMahcRW/SbkhT03w8FKm9odkyf5VtjF2P3iET7/jhZA
         yR1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVRNxrvZ1D0lvJ0HImqXVUK2IzuNfuEi3aAPqOdDUlCjAz5YY02hbrq5+PRbxSFmMMXwFMl7nH2/L3rzEURj711@lists.infradead.org
X-Gm-Message-State: AOJu0YymQyPeIeZ+aujgyYQkoRxeKJLJAle/2wgfGqpiP5mhamwiKZkK
	kTrrwOxrebtHfD2QzNj1JLZnPazAxSN3/yE8SJlXk+N+DBHZ0rmbNionntubHddzSwU=
X-Gm-Gg: ASbGncuaeItLaMmvW1BArCI00HIRyG1YJT2m4aiKT107zvooX44Yo7MSmvOs7ibypC2
	Qrb0fj3HbXQmIuJ1yxsDhJ+tPBl7x6sTqKfFKeTZrQG02vsludFAe3As7Uh4JTbN/38pOz80NM2
	rIOI1TMvWpmITa8ZXEGCbtgLR52JicU3k+zdXQlu+9i5RhyBAidEEJS9FV1fevpIKGg/KSt6VGb
	zH8sPun+6RsM3s8QkpOVsITftSyNg7JC21CEa5KggDxU+YEckMzx0JgH8FH/kwc+ESrVMtuaqey
	9eybv35YcJV/fP4gTkUkgjnrmPU6wtqqh1L6XpAX+DiiRCoLNIyLOb4Am1Alj3ZAFlCHFNHtp6W
	CcbxJbL5MtXAlIunNd3oxbkpyTW6WM0N2V0KQGChOSHDO7ZpfBePvXriNMQn8q+jgYllT5T79NF
	g=
X-Google-Smtp-Source: AGHT+IFi/cSOB5tF/taIVc9lB6VMcKGQulO1RAaOqvo83CjeGYWHvjFUzL4pihQB+kHoyN+pQ++BZw==
X-Received: by 2002:a05:6871:7283:b0:30b:c9ed:7f91 with SMTP id 586e51a60fabf-310aaf7bd7bmr7722267fac.31.1755530788952;
        Mon, 18 Aug 2025 08:26:28 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:ee1a:f057:94fa:9a73? ([2600:8803:e7e4:1d00:ee1a:f057:94fa:9a73])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-310ab953af1sm2652680fac.16.2025.08.18.08.26.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 08:26:28 -0700 (PDT)
Message-ID: <95b6d60e-4709-403f-8127-c50d40c7d8c4@baylibre.com>
Date: Mon, 18 Aug 2025 10:26:27 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/9] dt-bindings: spi: Add spi-buses property
To: Sean Anderson <sean.anderson@linux.dev>, Mark Brown <broonie@kernel.org>,
 Michal Simek <michal.simek@amd.com>, linux-spi@vger.kernel.org
Cc: Jinjie Ruan <ruanjinjie@huawei.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
References: <20250616220054.3968946-1-sean.anderson@linux.dev>
 <20250616220054.3968946-2-sean.anderson@linux.dev>
 <ded7ba99-089b-47a7-95b9-ca6666dc3e29@baylibre.com>
 <0a3b69b8-e868-49c8-a0ca-c448ee3cd488@linux.dev>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <0a3b69b8-e868-49c8-a0ca-c448ee3cd488@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_082630_350058_C348D493 
X-CRM114-Status: GOOD (  20.44  )
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

On 8/18/25 9:56 AM, Sean Anderson wrote:
> On 8/15/25 11:49, David Lechner wrote:
>> On 6/16/25 5:00 PM, Sean Anderson wrote:
>>> From: David Lechner <dlechner@baylibre.com>
>>>
>>> Add a spi-buses property to the spi-peripheral-props binding to allow
>>> specifying the SPI bus or buses that a peripheral is connected to in
>>> cases where the SPI controller has more than one physical SPI bus.
>>>
>>> Signed-off-by: David Lechner <dlechner@baylibre.com>
>>> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
>>> ---
>>>
>>> Changes in v2:
>>> - New
>>>
>>>  .../devicetree/bindings/spi/spi-peripheral-props.yaml  | 10 ++++++++++
>>>  1 file changed, 10 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml b/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
>>> index 8fc17e16efb2..cfdb55071a08 100644
>>> --- a/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
>>> +++ b/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
>>> @@ -89,6 +89,16 @@ properties:
>>>      description:
>>>        Delay, in microseconds, after a write transfer.
>>>  
>>> +  spi-buses:
>>> +    description:
>>> +      Array of bus numbers that describes which SPI buses of the controller are
>>> +      connected to the peripheral. This only applies to peripherals connected
>>> +      to specialized SPI controllers that have multiple SPI buses on a single
>>> +      controller.
>>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>>> +    minItems: 1
>>
>> Finally have some hardware to test this series with using 2 or 4 buses.
>> I found that we also need an absolute max here to make the bindings checker
>> happy. 8 seems sensible since I haven't seen more than that on a peripheral.
>> We can always increase it if we find hardware that requires more buses.
>>
>> 	maxItems: 8
> 
> What is the error you get without this?
> 
> --Sean
> 

I don't have the terminal output anymore, but it was something along the lines
that there were too many items in the array. Like it had an implicit maxItems: 1.

Overriding in a separate file didn't help as the checker seems to consider
each binding file separately. I.e. sometimes I saw the same error twice.

