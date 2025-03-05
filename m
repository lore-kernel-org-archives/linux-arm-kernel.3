Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0925DC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 21:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wnuSDIhdx9q4u4ea2GT9aTgUR+DURbh9gXiW1kwt0oY=; b=BygfjVL964anvkM5k9Th3wyj/p
	CGeBK3BNw7S0SdWHpY2sfVy+ZYlCXdEujEurtiVE6gfWMwGANk28Z/yfcKjBdWlohyKi295Vb5JLK
	h8f8Y2Wj7lr2v4lFmdIe4qQlP1RJMKnFaqrFzlN5x75BUVifiovf0qhBstpGjEmRdkTwNWUf4ZZSw
	dxhtYHixLX/jEL7XTxCDV0DIEyOvbjJrxH5pwJN4xiDwdczpCqVeLTaPuJ0P/iEfJTpN3aHcGTiNs
	4M78zBBi9u0nLDLdGmWhG90q9HiRQ9Ebn0+3+QCgqOHpLjLDsTPtvwawg2gTx2pI2SLC3n7KjkIMO
	CfGGOF5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpwcU-00000009PRp-1njd;
	Wed, 05 Mar 2025 21:49:38 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpwWd-00000009OL7-1MsI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 21:43:36 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43bd4ccc4c8so971305e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Mar 2025 13:43:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741211014; x=1741815814; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wnuSDIhdx9q4u4ea2GT9aTgUR+DURbh9gXiW1kwt0oY=;
        b=h7ZWXxx2zStY2TtB/AdxrGwON9AljRU9yOLKZHlLOQFYMO9WL5T6E+cmRnK6C/Ynra
         PpKcmrDu3Iol6Dil2lrS+5vLYmAFfkvG3Ho/Y8SGs+OShCXIn4XP/M7+6kUWvX/nyG37
         qMvoH+JKw3a4MMAo0zc68Kj3HzidlzBQnF7xWiD5Tgwg5rz4Ksn86AiunUUZEmHJjTRo
         53fzojPqlCPGG7AYGHeWbD6oqu8AJBg6HfdOfTxvEzzrQ8OmMmjD6b69DYKf6mik2PQ4
         Em5m387JHWNCT6+0bEaNKULwhbFd9Y60XzWw7PBMQiozIWtnbhH3PVhIhEPcVn4q2SmS
         HZgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741211014; x=1741815814;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wnuSDIhdx9q4u4ea2GT9aTgUR+DURbh9gXiW1kwt0oY=;
        b=SGAQf5rS04s+bNAh03dIp8mMSCcGWoq9731z6QDOSwCGhXJVrMWsgZSOrti6zTPNTS
         8BdMQnN9yU0kh6baBNBJ20LkhyI6IPcZWBCpQimFxk8qIAshs30voIBGa5av4bnD93/F
         qvDqhpO+Zn7v4c8RgYlCp/+OZ/VYLlkr+THDUM1Uf4R5ZBkFGIkvDUTp5h6GxcxX6TrZ
         EVMe2hKnXASm0tkVPO99rJGnuzC48RL9/44CCtI7FsiQhtqdXUbtNPpmQDTqElaxLuaD
         +MU04KeA5zTLeGwiaZO3RF+KgKAKdU8F1hu1mUWRv/uuNLv6GCUGX1o2tSURhNiPGFNW
         pHxw==
X-Forwarded-Encrypted: i=1; AJvYcCWGSJCWJNdha/GZjtYegfP77R5S/xh57cgNsFhYPp6SFfpSRapHvmZvGWBN6ZxaI14uXZmQM5exjESFijgkmRLC@lists.infradead.org
X-Gm-Message-State: AOJu0YxFA2eDvjZJCg5aztsJcNAf/AYj/yOTPE7a7JKpQ4qXiHIBOHMW
	nQ8Vt9eeIz5dbpnlVwq7naBCChUUvfg22MvtQJY9SliqoGrNptjNQkaxENKYawU=
X-Gm-Gg: ASbGnctGMq5I7p0rMYlqi4o2Z6UGr5DFSEAE/y2AUQtky0FurRXF+m2Ty8iApJVzYas
	b+wd76U45mn2mKG3PhuayQ8ZyZavFtSXGvqlyMM/8Ye/g3CqVaZgD0hc9SGZ28D/4awuWwPw4sR
	o+HaZUdPcyTgasqYTI9Vh1/CjkUZL6p9lBOu21qnBUYCB5c46LV6MkkUJG6cuk8qobUvFOdDnjY
	sBxAZGf/+yJQ0CpGqjAeHNUBdaSC4fN6plOEu93UuqTHmVXXc0RVWsiqTHnvUZEx5TFUZ9+Fm5i
	t0ss5KmeNzVcdQWxcosRdL5TeGzMShj6M4DJcUU1oitoshD+m3Hwts/O09C07upf
X-Google-Smtp-Source: AGHT+IFTRhoadsRhvhzPZMsjeOlJxQcH+ODbUFB0KQURKtxHX7crNHnSBHgTDlv6V/4yM7NXfZlnJA==
X-Received: by 2002:a05:6000:4026:b0:38f:2ad4:6b1b with SMTP id ffacd0b85a97d-3911f7cba35mr1471411f8f.13.1741211013625;
        Wed, 05 Mar 2025 13:43:33 -0800 (PST)
Received: from [192.168.1.20] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4796522sm22309061f8f.11.2025.03.05.13.43.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Mar 2025 13:43:33 -0800 (PST)
Message-ID: <d54262ca-2229-4230-bd2d-6d9efa7257a4@linaro.org>
Date: Wed, 5 Mar 2025 22:43:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/12] clk: samsung: Use platform_driver_probe() to avoid
 __refdata
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250305-clk-samsung-ref-init-data-v1-0-cd144b4fe31f@linaro.org>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20250305-clk-samsung-ref-init-data-v1-0-cd144b4fe31f@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_134335_372211_963B7910 
X-CRM114-Status: GOOD (  10.63  )
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

On 05/03/2025 22:42, Krzysztof Kozlowski wrote:
> RFT/RFC because testing needed. I tried to do the same on exynos5-subcmu
> and it caused weird oopses which even KASAN did not narrow. Probably
> because of multiple exynos5-subcmu devices?
> 
> Switch registering platform driver to platform_driver_probe(), so the
> 'struct platform_driver' can be properly discarded after init and there
> won't be need of __refdata to silence DEBUG_SECTION_MISMATCH.
> 
> The change requires using subsys_initcall instead of core_initcall,
> because no device drivers would bound in the latter, as required by
> platform_driver_probe().

Forgot to set prefix and I aborted this send. Please ignore, new posting
coming.

Best regards,
Krzysztof

