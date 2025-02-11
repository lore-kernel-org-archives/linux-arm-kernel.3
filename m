Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 579E5C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 12:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x+/rKU8hND2RosjvAKGWInz1qgNkLNHLXSblj/1XFjg=; b=128gLNz+SioTTfhm2cP85N/BqY
	5gQ+53y82v6yxw65fM8e28un12ZYlsA1JmqejwVEAGt34I4paT3rBHlTMknEJKR8oi9mB6YoIvcya
	Gv8w4mTnEPG3RmXQIzQJkps3tIcgq+xR+Mlv8a4SxEOvHQb1bfX/zlkYLR3txHhqrsHKYlAVjJeg3
	RAPk7URj4fNFkYlRQIFlsZgGstyJXmkc2350sqpVtiS5rAUbSalfFSnS2X7TVoLNRlW+iqlNgjuK8
	lwBwWmYc4XjQOmqdzZoaGokO80tcdLmnaumBeSclmITPOKatrO0kqCxF49UKAo9VI3B2WkrhjfjvG
	uVlIGbmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thphy-00000003pjv-1eqx;
	Tue, 11 Feb 2025 12:49:46 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thot6-00000003fOW-0fqu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 11:57:13 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-388cae9eb9fso2837829f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Feb 2025 03:57:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739275030; x=1739879830; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x+/rKU8hND2RosjvAKGWInz1qgNkLNHLXSblj/1XFjg=;
        b=zREGfVq1xUXF0QHhgI0jGyKcnyUDQra8OwrUYM7iiMxWS78BAX45G+XgNvrC0fG4SF
         PtW4IvwkoiP9GfVjFLXmxWqSa90+b3kbmYjcdzxSFx9RTrOd3+BjVgZd33T0Vi35tx2c
         oht1azm5bcwgwpSrVdfCImnvirxOmZRxWt1YkO4ovPaIYhMD8KXj3crMbETicPl54PJO
         KCDYA/0WjAKwQBwLBsC2RkXvmgOgFH27+s81q1IeA4s4p2562qe0Q1fkTsxPa42RZI/R
         oOPmtZ18SxEBZejhQ2uNLAxTkI9xgK6YZqVdr1CaWTj/hhisSuJ+avySX8rto3AuMwxd
         KESQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739275030; x=1739879830;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x+/rKU8hND2RosjvAKGWInz1qgNkLNHLXSblj/1XFjg=;
        b=fpws2O1+CXUxXDJ3mw/RFDdd5cSyH74dW3a6MmP2A0WbdmQ6nyUuLGIAyiICHbkkvS
         e3vj83yp5EgqU34MxbP2LckLU10CsMSzWsJLqDwtiqynS8nxQ1rV6t8T2MiXmKPqKBoq
         w5rt7fMri6rkCIe4oTTTArwjaMJRWtVa7dgK03TvmfhkL/CbYDzP83Xphf0cB7OF8gTx
         /ZTtsprHWLxQ2HG32TY+sHZ2W3nq3Y2dF9pf8kNDoKPznzuBTmSzvTK3g5MV1IOlXMhN
         XV7Cuid5bQCzUX+6+yZDNZjHqgdN7xeff/+nGzTqq3aXsvdxrd2gTR1PfikowDDQNrgj
         xNrg==
X-Forwarded-Encrypted: i=1; AJvYcCU5fKT/4zYCWOeyoxsKK7y0jNEbcLnStSWC+Be6UpIzeKLLQBCmbHMTBoHxeMT44jSjLUFliZiPluZTVqj8EHjc@lists.infradead.org
X-Gm-Message-State: AOJu0YyvgNBPQ3UUmlyIB0rMOSm2WjyjsScrSxFinr0qUImzkQ6x0FkA
	YyQmUY4vjnL3lljODybaYyv5ZnLtcw6jbKGDCikuckDcPHtF0GGoKVZM30Eu488=
X-Gm-Gg: ASbGncsFzQOUNKvsNl5cLNV+3JnoaRpMbUjaCrG6JJojA8xt0N2sFFNlp29QuNbXugG
	8ie52qGvDfTuiltwghJikDpnQjUE8yOQaO5qbJih4hkb6XMon062vueDwb6+feEWFaSoEABE4dC
	9oeFg0ALsOzT2wvrfab2qOGIQGSYCPTeSGxos7JDguvGyHm8qAHcs+6SF/UR+52enkSF42J8/6o
	vOHUbcRA+UeLSexXafIO1ipqwFyixHy78YTnp5mnhddIeZaLZ/3Iy2mAelOi41oO+6DBwPyjVSp
	/1aSQD8oHaCBI6vL967lVlD1
X-Google-Smtp-Source: AGHT+IGEDbZ4F+KtHnkoF3QqtYj/Mv0BkaXQoyniQIaUjtGof6BuGlXWqpwnecn1thdzCU0aThGJqw==
X-Received: by 2002:a5d:64af:0:b0:38d:d0ca:fbd5 with SMTP id ffacd0b85a97d-38dd0cb6a75mr11977488f8f.22.1739275030079;
        Tue, 11 Feb 2025 03:57:10 -0800 (PST)
Received: from [192.168.0.14] ([79.115.63.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc0c5a894sm14314088f8f.95.2025.02.11.03.57.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 03:57:09 -0800 (PST)
Message-ID: <bad87f30-0483-48c1-b263-02cc752c77e6@linaro.org>
Date: Tue, 11 Feb 2025 11:57:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/3] dt-bindings: firmware: add google,gs101-acpm-ipc
To: Diederik de Haas <didi.debian@cknow.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 andre.draszik@linaro.org, kernel-team@android.com, willmcvicker@google.com,
 peter.griffin@linaro.org, daniel.lezcano@linaro.org,
 vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250211-gs101-acpm-v8-0-01d01f522da6@linaro.org>
 <20250211-gs101-acpm-v8-1-01d01f522da6@linaro.org>
 <D7PJTD3PSP78.27N2S94J2CNZG@cknow.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <D7PJTD3PSP78.27N2S94J2CNZG@cknow.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_035712_206035_5F5A82AC 
X-CRM114-Status: UNSURE (   7.90  )
X-CRM114-Notice: Please train this message.
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



On 2/11/25 10:36 AM, Diederik de Haas wrote:
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> Shouldn't this be ``(GPL-2.0-only OR BSD-2-Clause)`` ?
> 
> AFAIK it's the recommended form since SPDX 3.0:
> https://spdx.dev/license-list-3-0-released/

It should, it's a copy-paste error.

Looking in the driver patch, I shall update
include/linux/firmware/samsung/exynos-acpm-protocol.h to GPL-2.0-only as
well.

And then I shall s/MODULE_LICENSE("GPL");/MODULE_LICENSE("GPL v2");/
everywhere as "GPL" indicates [GNU Public License v2 or later].

I'm going to respin everything to fix the License mismatch in the set.

Thanks!
ta

