Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37F0FD10399
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 09:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JPZr/XNvb8iNxFUbgomB4BCl6EzqteQOa6tv7krwi+o=; b=yBo+QQbPQn9NE+qQxxbq/DfD/9
	SyKHTmfTKyJa28MqCNYv3zU9YKJ0mL64PlJithVCus060RylV64h50vVHI5kUyqWnfKBHqBFiDIv6
	9gSYhqY2XhKyY/2hbcPB1SQHAPup+gFSei2pYeVctUrXOF0NNcwPQxqHrz/O0AY6korFuKtpEqTn5
	Tqwasr5vAzkHPQYNTNwm0ZxXiXMBGtfyZmih27jNNYuIolxxFD4LoyAOm9S6rl34FawdsU46enw5O
	b4rpgNBpQl4KWEE5Vphl6B+T5h+apSVPsuShzoRdBtw3u29tOpC16qA3zT9keGkP4uqc0wnsARnxV
	QJTyzhFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOBib-0000000EhXu-1mHH;
	Wed, 26 Nov 2025 09:21:45 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOBiY-0000000EhXU-09Md
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 09:21:43 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4779ce2a624so56625485e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 01:21:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764148899; x=1764753699; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JPZr/XNvb8iNxFUbgomB4BCl6EzqteQOa6tv7krwi+o=;
        b=sfac/yThg6GyQOm1bL6tuR2Bmb3dN5925wPrxQJ7emWiurqICkJNuUDOHLs2dH3KnE
         o4HOku78wg0Dn/XRczJa6f3AfWcvLDxRxg4ZN78uiEtebGhbM5dW26SXOmIYoP+5Eey8
         hz6o73kyS64HVJltNVtI3ZxRRvqcCAZjKRjRuK6+/GTot7R9QiFdiVhusos0liYw4Y8A
         6fw1GzmnVL8Wqofeylr4tfulz6Tdlu+wh2Kf0gSDaglBdpmeh4NQMgZyINiXKBDgDc5R
         NJr6v9GsJPPC27jz036CG2jnSy0jydLggO447d68S+6FHchIJetZkhvVHY99Y9wRX9p5
         30XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764148899; x=1764753699;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JPZr/XNvb8iNxFUbgomB4BCl6EzqteQOa6tv7krwi+o=;
        b=DIdy4Uldfxqbaw72Qn8JzTXtlojelhaYrzj4D7ozAjtUodqmS+vhMCkx1x0pc25g9F
         NAkR1LIZYDcgIO8xH4cvh+Gxm9fBdahObzHQJ8ZooztA12PFWvfL7Mo/JY+HPxm07PNo
         OmptqTGGCz437nZdGl6SgYOMdUnzHiE5mcJYApyGfEJ08+dy8KuSOtI990oleBqgGRV/
         oK3ivA69dm7l1A3BneAiFJjjP8TSSq2cqu2RAsqISq38m1xdIh1jHugtUjPqeyZ2rtfq
         fKIqrWfg8QQTQgePoSR+DFqpa9UWWuAoCd8wseUzA8jzHsYqEstB9Tcyyn199DaxM5gP
         TVZA==
X-Forwarded-Encrypted: i=1; AJvYcCWhIUDp/FI+fKDJL640+WWBNshQ0x1rYEn5C/rTUUKHoC7DvdPRybWAi5D8O/xCER4pRFOOz6QsR20tDvXTcmwq@lists.infradead.org
X-Gm-Message-State: AOJu0YzvL+9J+1AnOS3F9srGeNnXTwaGznQ8Ipi5oqiPmMbaiZaz09+i
	WbCkv/9pb3xABpvGfvUOd0kTeby8BpskGlCxTRqu7BlbK07H0z1XTzwz/iY9tFfCAxw=
X-Gm-Gg: ASbGnculChZDXwaO3E4x7PnZxpqYSegtuqPKhcjWFPBkgdu87Nr3UtV91N1REvs+aO3
	VHn323AE6gifflTlXsd5VMnbmtKtW57X1KtTHEsMAEkWdp7FnR1yp9G2tUqxiybYGTW62crCk/+
	zbSbBssrduxy6118aFvwXmY+g5CZXt4IUhri/1fa/n5kv6N0bKVF05W4BE5WI/bsp5lTLyGTX02
	Slu0akjGhR7LH96VT4hm+3p/YlKINPbgl/OGcPQQ7B6CnsYh1u9IjiGC5v0Y2BnncJ584oixH4g
	JLinkrL4RzPtT9Zath92I3IV7OMpxLfQCjqMs/OFQoBW1Bxi2p5KyhDfgt4Yd92TRZLsWC26sxq
	i5E7HpF0VmavHKJvCw9Cpck5U+KZXNWNfjBEnhn9PI2UxQ7tKO2rHEO1sZerjLFAgc1FR2g1WJs
	KF4GQY6e85rNHsZI1+
X-Google-Smtp-Source: AGHT+IHu5mjVSJftAmmd8mkUWGgVLFw7C7td0QXt6C37n/EMphfyxyx6zRNAnmmqGIwLaBqQANGUSw==
X-Received: by 2002:a05:600c:6287:b0:477:7bca:8b34 with SMTP id 5b1f17b1804b1-47904acae5fmr50881635e9.6.1764148899568;
        Wed, 26 Nov 2025 01:21:39 -0800 (PST)
Received: from [10.11.12.107] ([5.12.85.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479040b3092sm39152885e9.1.2025.11.26.01.21.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 01:21:38 -0800 (PST)
Message-ID: <401ed9b9-19a4-4a19-b397-0f353e9f0c97@linaro.org>
Date: Wed, 26 Nov 2025 11:21:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 RESEND 2/3] thermal: exynos_tmu: Support new hardware
 and update TMU interface
To: =?UTF-8?B?7IaQ7Iug?= <shin.son@samsung.com>,
 'Bartlomiej Zolnierkiewicz' <bzolnier@gmail.com>,
 'Krzysztof Kozlowski' <krzk@kernel.org>,
 "'Rafael J . Wysocki'" <rafael@kernel.org>,
 'Daniel Lezcano' <daniel.lezcano@linaro.org>,
 'Zhang Rui' <rui.zhang@intel.com>, 'Lukasz Luba' <lukasz.luba@arm.com>,
 'Rob Herring' <robh@kernel.org>, 'Conor Dooley' <conor+dt@kernel.org>,
 'Alim Akhtar' <alim.akhtar@samsung.com>, youngmin.nam@samsung.com
Cc: 'Henrik Grimler' <henrik@grimler.se>, linux-pm@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 'Peter Griffin' <peter.griffin@linaro.org>,
 =?UTF-8?Q?=27Andr=C3=A9_Draszik=27?= <andre.draszik@linaro.org>,
 'William McVicker' <willmcvicker@google.com>, jyescas@google.com
References: <20251113064022.2701578-1-shin.son@samsung.com>
 <CGME20251113064044epcas2p1b87addb21473eca7cc52052e4e2e9237@epcas2p1.samsung.com>
 <20251113064022.2701578-3-shin.son@samsung.com>
 <5a6a749b-b2b7-41bb-bcb4-a2342e7f4e98@linaro.org>
 <015501dc5ea5$0c7dd460$25797d20$@samsung.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <015501dc5ea5$0c7dd460$25797d20$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_012142_106523_88CD3347 
X-CRM114-Status: GOOD (  15.24  )
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

Hi, Shin Son,

On 11/26/25 9:19 AM, 손신 wrote:
>> Looking at the exynosautov9 registers that you described and comparing
>> them with
>> gs101 I see just 2 differences:
>> 1/ exnosautov2 has a TRIMINFO_CONFIG2 register, while gs101 doesn't 2/
>> EXYNOSAUTOV920_PEND register fields differ from GS101
> TRIMINFO_CONFIG2 doesn't exist on eav920 either; I simply misnamed it.
> However, the PEND register indeed differs from GS101.
> 
>> Given the similarities, and considering the EXYNOS9_ registers rename from:
>> https://lore.kernel.org/linux-samsung-soc/20251117074140.4090939-5-
>> youngmin.nam@samsung.com/
>> would it make sense to use the SoC-era name instead of specific SoC, i.e.
>> s/EXYNOSAUTOV920_/EXYNOS9_ and use the latter for both exynosautov9 and
>> gs101?
>>
> First of all, as far as I know, EXYNOS9 is not the same as exynosautov9, and exynosautov920 also differs from exynosautov9.

See also see this patch, or maybe the entire patch set:
https://lore.kernel.org/linux-samsung-soc/20251117074140.4090939-2-youngmin.nam@samsung.com/

It's not just autov9 and gs101 that have similar TMU registers (with the two
exceptions AFAICT), it's also exynos850 that seems identical with autov9.

All seem to be part of the same "Exynos9-era" SoCs. Let's think about how
gs101/exynos850 TMU addition will follow. Shall one use the EXYNOSAUTOV920
registers? That seems misleading. Shall one redefine the entire register set?
That won't fly because of the code duplication.

Thus I propose to use the EXYNOS9 prefix for the register definitions, and if
there are SoCs with slight differences, that can be handled with compatible
match data and specific SoC definitions, but only where things differ.

> So while sharing a common prefix is a good suggestion in general, I believe it's not appropriate here
> Because the register definitions are not fully compatible across these SoCs. Using a common name array may introduce confusion later.

Please reconsider this. Maybe Youngmin Nam or others can intervene.

Thanks!
ta

