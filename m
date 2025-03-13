Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D51DCC35FF3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 15:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yt2liAs3aMHm+KHHmdHu8tTJ1pcBVxGtNnpneo2Ud6Y=; b=OCSoJCJRktVictSO0FzIGKPxwN
	9mjneD4ICnHC4+O//dFlUBneXUoDALaVsr+OOwLMhDvA3QNF60LBZOPp2FEOfqO54dDY3JhEChfAV
	P1ra3Vu+GJisp3zZYnmqdUdsccYAFzI287Rtzl/J6cEiXJ0eVhPSZD80CJceZvgUUXVwknRhW9LK2
	EEngody2n+ooe42XQIL4ayN+xf3d+FleUaYGsTJOXB00ULlMWbX6XxUVqZjiagJ5dOUSgTgrfeVy2
	0TcK2kAhnp2tujEQ02j9IGEW6cHLN2CJhCH/ldIQYXTTlPuq3/u8b9oMsix8NkyVF1Df9YYX2iESh
	gr6r8rRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tskbE-0000000Bfnq-40u3;
	Thu, 13 Mar 2025 15:35:56 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsjVP-0000000BWkZ-0D9T
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 14:25:52 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-22355618fd9so20683075ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Mar 2025 07:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741875950; x=1742480750; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yt2liAs3aMHm+KHHmdHu8tTJ1pcBVxGtNnpneo2Ud6Y=;
        b=COC5cDTIdA6UZXuKaPQaA92PvAL23ITTpqUGnhvsJ/iuwfoXVtMGub074MhYaWOK0s
         KhUAE0m9Da2Z5JOECwZypi/ole54Ol8asKsEXWEHnYKZH+XNMZUpJhD4EEJpznQTfAeO
         xuo1uVHMNxwC3QyGhWSzBx6SNKrDgvW30ayENJSKoduiv9hGNn6TNaXTtfCSSnThjiWJ
         B/ianbv9scBS7n9B4ww+YhPhnnnKjj6DjwL2s+mVuUFILCsmMi/Pb7PNevj/DXB+KZLd
         YI4K1tDC/zhEO13ItzMjdhxi3Dt5WVG8MTIwemj6RXtWrLRHy90XEj8P1qbzDsQxEHaK
         iooQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741875950; x=1742480750;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yt2liAs3aMHm+KHHmdHu8tTJ1pcBVxGtNnpneo2Ud6Y=;
        b=kexMXpRiwtxx+XTlWq1LmXtMuGIOCNLqWm1BqKWHdjqoW7VWW29RsgykspDATyiS1G
         HB+1DzP6h10IEc+A4QU7dEAIK/bnM13T3befRhYijS9c2eNyoJb7CnLdtzXdRiRdEkZY
         F//pLS6ACgXQsG2AqLeoaEwphfJOl88C3RDbSzNukUNbYiwnKiRJ+JGL/QUe7B+EiT4d
         TTcTsqotbOt4YycKehTeI/eO6yslJrRyxoKSPG8Q76pbsYWzhnF4xDTGBf1+SBBZzo48
         bl3GiqM8MwdxcdOmomguNDfu15vaqT+Dv9L1stYGZ+kWgHVI6aUtlAif1VCPLBwtflMN
         sFYw==
X-Forwarded-Encrypted: i=1; AJvYcCXRg241IufpmFujawP9aD0o09F15kgK4EHiEsO4KPIKANMMSxHyMOkiioGJijKCTjKJ0XqbBoUzLZFKoIOspq8w@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3XtrhkLtPiVRFwBhmYAqUYqnD6ZCtf53TlN0VU+ivvD4Ak7FT
	2BFOKc4vO5Zepnm1vaxUOa8tCrdaw1foAtxd3mQMuZUChsWAmSmq
X-Gm-Gg: ASbGnctnY4EwPrzKDhzWSJDJ6v9bqzFuMroKGf5Iy4CWBYPtmcqufMfPc8u0TRtVoNf
	ithyoTdrM7qh2jwWlzCxnrq1NwNmLxM+g9JtHSal7cHyQz3WZmDBdlx+CnISr9uT+o9THG18kuE
	CHM7CNfwJy47TkuqZXaVSDsWnZmb4OhzG33Xs1VG+gFdRe4HAarsks/plhnqY+XtvNAsLTXGVzF
	WYpjknLLJvTbSks6FU+Pl6G3sOLpLuQtS+BE6yng0KQtanzCbT2l1CCFK71MmYRSLjX7glHV5z/
	dDye4dsMCoUxy94pYC6VaiTq5r6i1oLu+S1GLH1PMtXErX8w2zME1REgSPVNq+tiLfttDupBcwK
	8DxFOjWRlS9sKT3aLObS0uA==
X-Google-Smtp-Source: AGHT+IF6eAtFOSwvFOI4Gm40tsebSeGzoaBQCU7pRdsE126LhuSwKSdaUakjB7uJmyjpQif4VQKq2g==
X-Received: by 2002:a05:6a20:9f0a:b0:1f5:7eb5:72c7 with SMTP id adf61e73a8af0-1f58cbc5d79mr17800801637.29.1741875949583;
        Thu, 13 Mar 2025 07:25:49 -0700 (PDT)
Received: from ?IPV6:2409:4081:1112:2682:8c5d:7e25:b34:fa93? ([2409:4081:1112:2682:8c5d:7e25:b34:fa93])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56e9e195asm1318840a12.25.2025.03.13.07.25.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Mar 2025 07:25:49 -0700 (PDT)
Message-ID: <70cab705-c656-48bd-9b65-841f68c41d40@gmail.com>
Date: Thu, 13 Mar 2025 19:55:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: pwm: Convert lpc32xx-pwm.txt to YAML
To: Krzysztof Kozlowski <krzk@kernel.org>, ukleinek@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, vz@mleia.com,
 piotr.wojtaszczyk@timesys.com
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250312122750.6391-1-purvayeshi550@gmail.com>
 <b2f6a357-a468-4526-a1b6-69ab2c643b2c@kernel.org>
Content-Language: en-US
From: Purva Yeshi <purvayeshi550@gmail.com>
In-Reply-To: <b2f6a357-a468-4526-a1b6-69ab2c643b2c@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_072551_093617_E6A0BE3B 
X-CRM114-Status: GOOD (  18.43  )
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

On 13/03/25 16:34, Krzysztof Kozlowski wrote:
> On 12/03/2025 13:27, Purva Yeshi wrote:
>> Convert the existing `lpc32xx-pwm.txt` bindings documentation into a
>> YAML schema (`nxp,lpc3220-pwm.yaml`).
>>
>> Set `"#pwm-cells"` to `const: 3` for expected PWM cell properties.
>>
>> Signed-off-by: Purva Yeshi <purvayeshi550@gmail.com>
>> ---
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> 
> ---
> 
> <form letter>
> This is an automated instruction, just in case, because many review tags
> are being ignored. If you know the process, you can skip it (please do
> not feel offended by me posting it here - no bad intentions intended).
> If you do not know the process, here is a short explanation:
> 
> Please add Acked-by/Reviewed-by/Tested-by tags when posting new versions
> of patchset, under or above your Signed-off-by tag, unless patch changed
> significantly (e.g. new properties added to the DT bindings). Tag is
> "received", when provided in a message replied to you on the mailing
> list. Tools like b4 can help here. However, there's no need to repost
> patches *only* to add the tags. The upstream maintainer will do that for
> tags received on the version they apply.
> 
> Full context and explanation:
> https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577
> </form letter>
> 
> Best regards,
> Krzysztof

Hi Krzysztof,

Thank you for your review! I will include your Reviewed-by tag in the 
next version if no significant changes are made.

Best regards,
Purva Yeshi

