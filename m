Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9760BCA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 09:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oaZcg39YpyHcUdKqFjifUizLNUJLVhGMD8cYB6Cwmg0=; b=EXvSTRWGSohmALKA64H0XZfxLy
	7ewE/4pB8iWiW0JVY/yzXXQQ7Qo4cW16apT1ccsEVb6JgXpRyMleuFJzZ5QE9vSd0m9UIvNCyNLUO
	KnAB8xvX3ZNOwRmyMe8M4Hdk4AJcXja0eufADz3yYL3Wx8YUUFaPERz2VfbfocX9rPI+/GNoMU1Ac
	rT8flBwt2ejPCC19gFTqkg8tcHBz1vxJtkbZOmN1j1REQuvaYnNOv661H40+iJpvOvcDkD5JRGDnj
	07Arbl8kEi3bIOmGHJyxRXjuoqrDvA0d/rxPXRPBkshqEwNQaoOLkDaeFhJEL0DeCFMocFNQxAr2L
	xxwwLZqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upkh2-00000004Xce-1H8J;
	Sat, 23 Aug 2025 09:37:48 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upgZK-00000003tA7-1jTV
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 Aug 2025 05:13:36 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-b47174c3b3fso1664682a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Aug 2025 22:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755926013; x=1756530813; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=oaZcg39YpyHcUdKqFjifUizLNUJLVhGMD8cYB6Cwmg0=;
        b=Iz+lFsjetmNAQFjblNtsPCvgwqdTfMc/0hKhyoew3FhVBtpOxi25iAvigeWsqFf6ji
         9GTc0rbsCR+QHG7ifyLdjjaBdiKYuQHiQh3U7z61ImaRxHvF2IWnRE4cs449pvUk00mV
         l4sbo8odEfjQXPDGVde2Izpx/VXwubT4fmeULhWSAGOc/8Z4h6b/dh2LQCOvnj61/cRZ
         MpKRji1fUsvGQlNIjPSK+URM5GhVerorcAPr1tNC/GcwZcKxaHjpVJPFPoHSu2TA2TT8
         +YUmartAJB8oCan6YGIhC+sM80+f/nECYn2/Nv66MUeJrrGlIBNRfqsQX74KZAILO1ap
         JbbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755926013; x=1756530813;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oaZcg39YpyHcUdKqFjifUizLNUJLVhGMD8cYB6Cwmg0=;
        b=OMbuQ3rtjf9afMG+s7dQnEOWtSKaO0wlWDQRfrztvdLtGBTnGTM6FMRVbnUJS3c6i+
         NZM7JGDTfA5QCJNNRy6f33QwqIzUg1D9ju9eyQ+jJnOcJdbarVH2S/iwf18HWlMSeUPe
         EILHjALBJOgPAbXw/dtU6+Pn8lyZrMcXkbt9w8U7EStGcEJNXOD7RcPczh+i08Pa4wtX
         tEZtzkw+qrD1g19Ue3AwaxuOfwj2tDJQ9wM1khYADvbwO0SYAmqCPhdWASknaz/KaJYI
         CKQI92aSVwrkFrsNfVAQmV/mwe/3zNAUZGC1nG5SmlaDSGfdQKnC65PcNYNk8Ok71AGZ
         7dEg==
X-Forwarded-Encrypted: i=1; AJvYcCUvkFT9TKFtTFIEeB/qbs6uhmNbFRy7Hj1kNNQN2xroes1hMIjluIdqTQdn4cIjLaxb2QHimLTOxGJoZtUDCOOr@lists.infradead.org
X-Gm-Message-State: AOJu0Yzth/Fu+Lu3k00E6fRx1K8XfeRlWKKfpJSD6UZChXaBHH0L62Da
	LZtkgL5Dm3pnkEFalExgPV11yOvoHYsXwX/xMjdLcz4fFADchs57QYtd
X-Gm-Gg: ASbGncvXUM34FrmtaOU1d5cZNXoxgDlnT+LqN9PymFSa7yv3RvndU2uc9vgMDI/5nqn
	ZG5B0PaEDNcKEwBW9HI0YeXsjMYeqxPtj31wSF5F0zUlgEeDJxp8ptDbWlEOxwYL71ddVil1mRX
	fl3E0UdwIMkcB6Zh3+iytWTHj1Eg/cn0OyNN8iuataUA8qHW32DQnrf+zkttx5PDS2N5p1n1DOH
	0GynsXzVu9ZMzFbrsylA9WEQvELh6u2tj7V8GxcnUQOJS6+PDk9dvj63ywCmInRB/GbiYn6xqro
	BdNL323aljo9e1MuaTj++AsTMXny+SAG198DF7doL1QhSvAhymSgILzlCu5XG8ScIFwHz/tg/u9
	F6kNN0OlI/pqkw6XXZnDHs/3ZYFkrAl7y/0QQiMRwAXcKsmmGofkAmQ/4Ss2QqZumbtfXlU7ADZ
	gj+aaLOw==
X-Google-Smtp-Source: AGHT+IGu/5kI4ubQtYHPYeTFeMmZ5BU9w4ewNepAWhcOc56b0ak2Ul5v+eBjgv4TH/lm8sl6SH5vIg==
X-Received: by 2002:a17:902:cec2:b0:246:163b:3bcf with SMTP id d9443c01a7336-2462efd9a6cmr60223085ad.55.1755926013089;
        Fri, 22 Aug 2025 22:13:33 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24668880bfbsm11992445ad.129.2025.08.22.22.13.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Aug 2025 22:13:32 -0700 (PDT)
Message-ID: <23146b25-5fac-4392-80d2-4090cb2121aa@roeck-us.net>
Date: Fri, 22 Aug 2025 22:13:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] hwmon: Add Apple Silicon SMC hwmon driver
To: James Calligeros <jcalligeros99@gmail.com>, Sven Peter <sven@kernel.org>,
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Neal Gompa <neal@gompa.dev>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Jean Delvare <jdelvare@suse.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-input@vger.kernel.org
References: <20250819-macsmc-subdevs-v1-0-57df6c3e5f19@gmail.com>
 <20250819-macsmc-subdevs-v1-4-57df6c3e5f19@gmail.com>
 <56e1f496-a4c7-46a5-bd74-0412c1fd7207@roeck-us.net>
 <5792171.kQq0lBPeGt@setsuna>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <5792171.kQq0lBPeGt@setsuna>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_221334_474554_8C6375E4 
X-CRM114-Status: GOOD (  27.02  )
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

On 8/22/25 20:33, James Calligeros wrote:
> Hi Guenter,
> 
> On Wednesday, 20 August 2025 2:02:58 am Australian Eastern Standard Time Guenter Roeck wrote:
>> On 8/19/25 04:47, James Calligeros wrote:
>>> +/*
>>> + * Many sensors report their data as IEEE-754 floats. No other SMC
>>> function uses + * them.
>>> + */
>>> +static int macsmc_hwmon_read_f32_scaled(struct apple_smc *smc, smc_key
>>> key, +					int *p, int scale)
>>> +{
>>> +	u32 fval;
>>> +	u64 val;
>>> +	int ret, exp;
>>> +
>>> +	ret = apple_smc_read_u32(smc, key, &fval);
>>> +	if (ret < 0)
>>> +		return ret;
>>> +
>>> +	val = ((u64)((fval & FLT_MANT_MASK) | BIT(23)));
>>> +	exp = ((fval >> 23) & 0xff) - FLT_EXP_BIAS - FLT_MANT_BIAS;
>>> +	if (scale < 0) {
>>> +		val <<= 32;
>>> +		exp -= 32;
>>> +		val /= -scale;
>>
>> I am quiter sure that this doesn't compile on 32 bit builds.
>>
> I don't see why not. We're not doing any 64-bit math on pointers, so we should

Odd (and wrong) answer. What do pointers have to do with 64-bit math ? Nothing.
val is a 64-bit variable, so "val /= -scale" is a 64-bit math operation.

> be safe here. Regardless, this driver depends on MFD_MACSMC, which depends on
> ARCH_APPLE, which is an ARM64 platform, so this driver shouldn't be compiled
> during a 32-bit build anyway.

Right answer.

> 
> 
>>> +
>>> +	ret = of_property_read_string(fan_node, "apple,key-id", &now);
>>> +	if (ret) {
>>> +		dev_err(dev, "apple,key-id not found in fan node!");
>>> +		return -EINVAL;
>>> +	}
>>> +
>>> +	ret = macsmc_hwmon_parse_key(dev, smc, &fan->now, now);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	if (!of_property_read_string(fan_node, "label", &label))
>>> +		strscpy_pad(fan->label, label, sizeof(fan->label));
>>> +	else
>>> +		strscpy_pad(fan->label, now, sizeof(fan->label));
>>> +
>>> +	fan->attrs = HWMON_F_LABEL | HWMON_F_INPUT;
>>> +
>>> +	ret = of_property_read_string(fan_node, "apple,fan-minimum", &min);
>>> +	if (ret)
>>> +		dev_warn(dev, "No minimum fan speed key for %s", fan->label);
>>> +	else {
>>> +		if (!macsmc_hwmon_parse_key(dev, smc, &fan->min, min))
>>> +			fan->attrs |= HWMON_F_MIN;
>>
>> Above the error from macsmc_hwmon_parse_key() results in an abort,
>> here the error is logged in the function and ignored.
>>
>> Either it is an error or it isn't. Ignoring errors is not acceptable.
>> Dumping error messages and ignoring the error is even less acceptable.
>>
> The only strictly required key for fan speed monitoring is apple,key-id,
> which is why it is the only one that causes an early return when parsing
> it fails. If we don't have keys in the DT for min, max, target and mode,
> then all that means is we can't enable manual fan speed control. I don't
> see how making a failure to read these keys non-blocking is unacceptable
> in this context. If this is about the dev_err print in parse_key, then
> I can just get rid of that and have the parse_key callers do it when it's
> actually a blocking error.

dev_err -> it is an error. Don't ignore it. If some of the properties are
optional, they should be defined as such in the devicetree description,
there should be neither an error nor a warning message. Plus, the above
should be explained in a comment so future developers do not wonder and
don't add error handling.

Guenter


