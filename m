Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04E27CF31B4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 12:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ANuLCsNtCUF8tPoNyJV9ss6Pl4S7P3c/OwbemWzc+jQ=; b=3szPD93BcVkckKuVMxVZHjgTZN
	lRlPaJnuDqacWUii0Hp9ier92P7MXPB7v2mfA7pp9nNcqbkhSfsNi3Qhsa6xUaUTwforkeOOxrC9P
	XBUUQArnJySiSOcg/b5oSRgNtAza8qEzxawLshAWRZZzHBJy9ZNBI3H1+DQrRZHx6SmILpUoHrFmP
	oT7I7XXhuYqj8W76TONoIZ8HQdSg9uJ7iRLTIXNyYyHoTiHLqnAfV6VW029sKQc+Enb7EKwTuuC+q
	GKP6YAYpiBlnS57BjU47QNs+md3SFy3puQfYXAjByZUAz9YibTbEg9Y911K423zmCMgWd5ntrTmU7
	CEEM4J8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLhKS-00000003A37-3dfa;
	Wed, 19 Nov 2025 12:30:32 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLhKP-00000003A2e-38cE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 12:30:31 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-47796a837c7so28158935e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 04:30:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763555428; x=1764160228; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ANuLCsNtCUF8tPoNyJV9ss6Pl4S7P3c/OwbemWzc+jQ=;
        b=wh23wbbYa1aXVVeym6OW5WpoAJOEHb/1qd2W1UOzEsD/OWb+Srw7P+HUYWNaSwH4DF
         RqikoWgCC8NuEYj+na8jtzw7XSI9TWSn+Tt1e4WiP3ENdoB6Ld/WvuGtyRIYboPTigi7
         62phFmAoIMVkkgPLAKv96WtYVjnMhFaYRocRWr6tCMS/pf2oCLSy72M63HJFQISWtGv1
         okOTCDuCzhQW/nwa5GuF2Mvg1ByKH1xtQh6xJjhir0mnyNMoLzOKHTLAl2tIMHXnDYxf
         V3KDAxBsX7TcKwgvD5tkP96OjFNHHImiHWJlmalINEok0pvCCkBL7dmNDdUQZeLy2jst
         bwoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763555428; x=1764160228;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ANuLCsNtCUF8tPoNyJV9ss6Pl4S7P3c/OwbemWzc+jQ=;
        b=pd4VrHEVgCmKkmPZpZuCajM1KI4mgY4uPRUFJU/kgwnM5hYGzAZoi4OMTFRv9xSGza
         nAGhnrSlAt6KtCflfhXE9f/DTrX9qqHJkGIxkb2d5YuzEg8OEpPJIRGYBhH08I7AGdU1
         VIkenuKb053cMgP1slFVrP/g6MwxEGl/E4f4K+WXbX3J4J0wBUENFhKP0VotVJCx/6eU
         UyWxMbrvMtQ7qrwO6FqZhqoToo1V94d7eF2j5Lik/jwf0LPM5yc8Kc/rpEyQq7BkKx1q
         xcpV0NXbsf/TR2mmu+aah2VSZ1rkC7HHD9XG0NCXjFr8VuBezXdlbK7ov8HKXfRBRmRO
         nqnQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGxNyM9Vjq6wRiHD7GlB+Iy8d8lYA97ZINv5J1YWxLFV27LAPbPCA+sqtBB8uOS9x8xRlNdB++5EtsneZB5SwW@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8tXkHur73IA4jEyGyNfMUCmwOiMlBcEgaO5spIE1z0aiNrKag
	s2iYBXjrb9huMVis77UQEnCh0g20ynUqMxziY/yolbAcBFqRNiSRjXy7JNObNSSOD9Q=
X-Gm-Gg: ASbGncvKRLd4C4WJT3hX+S6D3RV6Ra+QUkTOP7l1xgGdNmWPF8dVOiUKjefj0de3++j
	cdaqRJArKi/pcfC0uQwbDV4Jtq0Qsy8AF3AkAhwbpEbbgr97t40X0b2RvtXPLljHo/8ZqxjbXJl
	gbGI2AQrYKiCUeDbkodhpWIzhnlwFJkqgQULrlq8PTxCa+sLYsWae3aeFxKnWfMBUrkduZXIoXW
	i5jgPEpSPIa/GVyE3ECapy73xdW2fPFJ3iypMqJCuLJvE9B9C5ukYMZt1DNfp6IIxZDoPGioxfo
	Y0JmPunNZzUeegHqdHG0ksFDFlntSjyPNUBe4JekHkfdaNj3jQIPEuBY/XgdVPVQqG/zihMlbRg
	CAO6dV1bjz1iBjQWwBH3buqamphVWhtzjcZ1WjloaHAXjxzJ5PMTX0m1Fp/Sp2oIXws+DY2yoJb
	Wgc7U07KBHEZF0bJYOEJSOv4M3J/A=
X-Google-Smtp-Source: AGHT+IHqhbbvVZExNtwvyM5VtD1QzsNi1upkWPblMC3uEuvom1Rb/Pq0EdVbzlawrXFh3afQBP4jgw==
X-Received: by 2002:a05:600c:19cc:b0:471:1774:3003 with SMTP id 5b1f17b1804b1-477b19e248cmr19240965e9.29.1763555427738;
        Wed, 19 Nov 2025 04:30:27 -0800 (PST)
Received: from [10.11.12.107] ([5.12.85.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477afb54774sm23714085e9.3.2025.11.19.04.30.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 04:30:27 -0800 (PST)
Message-ID: <4a94884d-ffc1-45b7-b014-65f9724a820a@linaro.org>
Date: Wed, 19 Nov 2025 14:30:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] soc: samsung: exynos-chipid: use devm action to
 unregister soc device
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Srinivas Kandagatla <srini@kernel.org>
Cc: semen.protsenko@linaro.org, willmcvicker@google.com,
 kernel-team@android.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251118-gs101-chipid-v2-0-e9f1e7460e35@linaro.org>
 <20251118-gs101-chipid-v2-3-e9f1e7460e35@linaro.org>
 <e25b9f14-b583-434d-ac4f-364b962f0ed1@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <e25b9f14-b583-434d-ac4f-364b962f0ed1@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_043029_817796_5D2AD794 
X-CRM114-Status: GOOD (  12.13  )
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



On 11/19/25 2:13 PM, Krzysztof Kozlowski wrote:
> On 18/11/2025 14:56, Tudor Ambarus wrote:
>> Simplify the unwinding of the soc device by using a devm action.
>> Add the action before the exynos_asv_init() to avoid an explicit call
>> to soc_device_unregister().
>>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>> ---
>>  drivers/soc/samsung/exynos-chipid.c | 27 +++++++++++----------------
> 
> Can I take the cleanups before new GS support?

Fine by me. I'll send v3 then, to have the cleanups first.> 
> That's btw preferred order for all work. Fixes should be independent or
> first in the patchset. Then cleanups before features/new support.
I agree for the fixes. In the past I used to do the cleanups before new
support, and I got feedback that the cleanups might delay the integration
of the new support. I'm okay with both approaches, v3 will come.

Thanks,
ta

