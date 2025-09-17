Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81B96CA0EE8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 06:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IVMvvCgA6ljcoCpqlgL1xSnREs4/fST5OPFbRQTwtdA=; b=4pj7/KpqD75pEVSfpfY+rYqBUs
	VZcRMjq+2Tp0RRr3pl+Bvr2wGwwFl/wIwPSKYO8ife7O250c5NvoV14gPucf5T3S+/E+bEYrP3A8t
	6GSd26sgmixDaLPJwtnslq+wslKDJea0cr54uhVo8pKJbeLgLHvZJ07P9p1mKA/w4BOczMnDp4Isf
	58CemqgcNcVB+g70cdOlWG6aO3NuzCMAXDUyIyu3951+mrSFzwlohfSfkJzCNJatQ/uDt97NACkZ7
	8JjpgBMV9SKzYMJLvi+0eCgSdY6E9weEao0gJl+c7SkM/jkU0FaY6FXXg+uPcvGSQSSp0jqB1RsE9
	lm0kcUvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uylzO-0000000ANGG-2bmo;
	Wed, 17 Sep 2025 06:50:02 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uylzL-0000000ANFd-36XG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 06:50:01 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-45b9814efbcso3518735e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Sep 2025 23:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1758091797; x=1758696597; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IVMvvCgA6ljcoCpqlgL1xSnREs4/fST5OPFbRQTwtdA=;
        b=BcKawkJ2QHBOG4QoclGWyffroeZ3oI5yk+lsqJNg1UNXbvk1Ir+Y05keeWoIuQZAgN
         fzoCMCHAwFgEcq6SKF0Jrzzt8+mWqywyBucZo9bR85a3jZLCzxwXGlsKiCwwnAZbQfgS
         s3RcmaI+zze08Lab6hYQPvlFRA0XOpNf19/fmiSgw8wqsv1O+GBMNTnxAudgMI3mKbxg
         v8oQDVi7nghNRzgQLkl5Q3/pBQmKGUTwdrC3PSlBS2VegWoVpOxjhs+m8eb6TReT+KxD
         ks55/YOpBWZtYnMYCue/MlaxB+LpMo0KEiKUlM+N6qOCkNa08ufBkV87Ycqaj362Oay/
         VEDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758091797; x=1758696597;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IVMvvCgA6ljcoCpqlgL1xSnREs4/fST5OPFbRQTwtdA=;
        b=dxizozK3mj/XYVJ84yGjbJ4GGZpinA4IXIiFOcyORwiz+WU9hdceVkOaGTKUASamAF
         BkzYVQGDv3S8gsdnJK02D/BjszbBMzNvSwA1DwUI5QXCylEZ6NN/JKW9Y64Yw6QdcbfJ
         gwGM6YgwR0z3l7S8eQrv/JjIC0C2dqFI3+ffuX+GUIt0AlKUVBlQCn4vNVF7Fmi7Mc0W
         kj5zWPDMlSRcIdsF1x43DG95w7smPztpknbvBhDSrn15kEANDMxO55b56rK+Uje36y2S
         9Q331oVylCneuxKHJSFyVjqx29WO2KyxhzJIXILCF9BEGnQnGL22rC1YPGfSUcgYO6VI
         6onw==
X-Forwarded-Encrypted: i=1; AJvYcCUNWvwoPTn2eCNPH3wxH217Moo/SkMRJHzFKIImQxLqEU4cbRTepHKBqg/CXcU5PrdJYzPOPfJuAUBVRK6ksIkY@lists.infradead.org
X-Gm-Message-State: AOJu0YwwJWdBBBgKxrnb85LVjoQ9sN/q9Yx85mMWD1nfdJQmQhqoxwRk
	K4x5a0oogr46qsBKduGR0ZCw3xFh0Dr6GfVA+YTgMNQ8C+UzjZTDYeXd8YOKdWwdbJo=
X-Gm-Gg: ASbGncvzqoMs5gNlgZ1W3xooIH+1l/fnpML4KELajxtEHTwvdq59bf1un7Qb/8uofyU
	dEnLBPBdtXAK5rowwQa+qwkgmDzJYHvXLQ8r9/i4vuXHyeAYyWoZXOtziX+Pwo2rU2JRYb+O+YQ
	bZ8EpK68vzkYJZQayhMvg5bNsVOLGT8mNaXYOsgG5h63PeTuyKLYKIHZ2WtiG26GPShtDIueKii
	KicG7RbLYqS/0FSuQW+Czo+Ax3XSDH9gXzVW3Ag7Emspmcq+zz3KtecFNWm6Apfc70z7kUS4hOV
	eyzJLe44Vn2BLHtiWHT17LOWxSLS9nVDWPqJtHUJJ7ywr+VqZeiilEf0Ip2yuJOHgIKLQSbHwW/
	PWZWXpo4HL8FCMHPYV8Np7GkBXlPLo2M=
X-Google-Smtp-Source: AGHT+IEVFBb8u1kVGqedyodsw2F2aUQecKI0dQqbLqdRcPRySNRrawE71TWdhxxTWe9V1uTknu0h/Q==
X-Received: by 2002:a05:600c:1d25:b0:45d:dc6c:9e30 with SMTP id 5b1f17b1804b1-461f94ae963mr9866535e9.14.1758091797412;
        Tue, 16 Sep 2025 23:49:57 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.153])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-462d525fdb2sm983345e9.13.2025.09.16.23.49.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Sep 2025 23:49:56 -0700 (PDT)
Message-ID: <d2c1d736-689b-452d-8031-2cf76288dca1@tuxon.dev>
Date: Wed, 17 Sep 2025 09:49:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/32] clk: at91: clk-master: use clk_parent_data
To: Ryan Wanner <ryan.wanner@microchip.com>, mturquette@baylibre.com,
 sboyd@kernel.org, nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com
Cc: varshini.rajendran@microchip.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 robh@kernel.org
References: <cover.1752176711.git.Ryan.Wanner@microchip.com>
 <4b404eaaab4062464a4142e95aaa76d5cba866f0.1752176711.git.Ryan.Wanner@microchip.com>
 <95e19f49-d0df-4d3f-bd7d-8b58b60f1f7a@tuxon.dev>
 <61cfc570-6632-4e14-9e2b-2bd5d2ce1690@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <61cfc570-6632-4e14-9e2b-2bd5d2ce1690@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_234959_936116_EA09FCCB 
X-CRM114-Status: GOOD (  10.41  )
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



On 9/16/25 20:35, Ryan Wanner wrote:
>>>       td_slck_hw = __clk_get_hw(of_clk_get_by_name(np, "td_slck"));
>>> -     md_slck_hw = __clk_get_hw(of_clk_get_by_name(np, "md_slck"));
>>> +     md_slck_hw = __clk_get_hw(of_clk_get_by_name(np, md_slck_name));
>> Please use:
>>
>> i = of_property_match_string(np, "clock-names", "md_slck");
>> if (i < 0)
>>     return;
>>
>> md_slck_name = of_clk_get_parent_name(np, i);
>>
>> Same sama7d65, sama7g5.
> For these SoCs the clk_hw struct is still needed since it is used later
> in the driver and not changed until a subsquent patch later in this
> series. Would it be better to hold this change untill then?

OK for me!

Thank you,
Claudiu

