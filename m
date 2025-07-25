Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D159DC83F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 09:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sPxG6yqZoSGKmuHcBvDbXuEQ79jKCTtksMME9UcXBk4=; b=48x+JixmDq6egbBZwzqi477nWz
	tR+1GEWDvM4Wj/wxjm3x9Xk6cCYVaUXu0W6xGY8cOtGC+/PkYoKUyN1qPbow8rurDM+v1F2HMCAps
	qzGeGHvwYH5wbO63HutRYKnfd93zCR+lO5mWv2jjRUnfe6A9twgqRLSJKWy3diOewBDaS8b6PUQQA
	BTJXho9daUXukehBBLEYSr5vAC/00/SlvsPCXFUSc8YJdgQIX4/K6Nx7TV9jt4zvpmMhX1KNH5Hs+
	NEcmRi5q+mo/pUcU0DQPGdbUOWRgmN3gho+ccjgnGEOPi8JumymE3+RWSLiUynozunNgBuglS1MGH
	JZj3TjRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufElR-00000009SR0-0mdY;
	Fri, 25 Jul 2025 09:30:53 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufEiy-00000009SIq-06pG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 09:28:21 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-455b00339c8so13100565e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Jul 2025 02:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753435698; x=1754040498; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sPxG6yqZoSGKmuHcBvDbXuEQ79jKCTtksMME9UcXBk4=;
        b=uhO4N946M6It3SDfP7lJg5Tk0a5wtwq+RH+D7rjCLrm/eV3vDOZpgAgcbbkZK3qhO5
         zZfRaAKmHipRv7uXIIz+yMHn30L6GGEiJD4agjLVJgixkGAgcdemnrdsD9GkfunfV0ni
         98o9h3d4KS1dxlda/jeACF09Id8bKh6Se4BBHt83JJE3y17Nw3/Bu+64VetMe2mAWMpk
         3LFTkE1qJtxl9dpdLF13TM3MmwhOiez8fL6+w6xFMU6mWPJ4C2KxfJBjvQq3/Ypx9+UL
         wCayoNwesIc+YyulbE+p8oKXyaaaPMDfXpnLdsyqre89+zAmglNNli75X4j+M40JNHTg
         VwkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753435698; x=1754040498;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sPxG6yqZoSGKmuHcBvDbXuEQ79jKCTtksMME9UcXBk4=;
        b=ZB9v5Z+acwvGTdUgNrd1Gei+GgD5axQNzrXRSv5BkcjRG17llniFK3+STFLXMkVLip
         nUOEwcgDS0cx1j69P9H4h7L05sDNBekyQAe/2Rf4pCO+JeV46sYDkYISozHCoTlYgdZk
         chHihsrcst3gNtoVahDCQFtnOgZG4Nd+yhMv5zvIlp/KA1s0P8GaoPh3+ozTQT4iw/sZ
         +MSRDd9Ic9qDcrHTPaHH4RSXV08GkFSKmBTntU7+jfT4Mp0cJxlY8zUsK2PFB0GGDcD+
         NoA8I4oDaaJRgnGqybBYs2BC+W1C0vgUKVCKJvq2M2DgBwcAMddN+MSHUPn/RWWx2CiE
         5mxw==
X-Forwarded-Encrypted: i=1; AJvYcCU7W3JeXoYnzKRivYG36aWfhCNb7LRVuTmie6xpQaBMQJOIp+qiXzXsX8ZtBZJyEJ3L5ooH8QAu3msxqr9Cl1Kb@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6bMxO8Ao3VYnMcoz+ma+VaTe+AMJf7EwgqO8VJaGNrHCzzIaG
	1fF+APYN3E6iAheZW3Is6DTMKhreaYwrKNUvYYWRZ7OcgIe9nlWLg4VNfNgeufQT3YE=
X-Gm-Gg: ASbGnctbiLYWhz7a02CvuInA6Ir7W+2AT4ucK72XLFr0PQPCuf80vjGcynwXHGBsgWE
	15/HYO8Fr6BgBqvFIbZ91i7T2KH93LwLIYac8zDViTNQlbNL9gS6CvAppjosxiToihIZ/R8mNm5
	1vL1jRq2o5e/drkpvnkOQUtkNXzihXTcVVLDQfzaDx2Axn7h/9MZq3QJ4+WzlRNzkY1YRHOrkQW
	52P/kJ0/OdjiGGxFT6DpRpUhjBYOB4ZKvIW6lK03x7d5vi9G/Se3rdgvmv63EiHktkByxq1AUBw
	galPOykV3UelR0Ex8+DzOW3nQeAh3JckUfZ4Sigx+IAkij3sGRGGg8eh8mq9eqrWou+jkuZE11v
	F4i+zcff7iGUKgKRhB3pJraZcq4ToR0FupNUyhSLpf4spjTjCMC1JmpanaekeYw==
X-Google-Smtp-Source: AGHT+IEeWJ8pfIjF/cY4SpBJkCsGj7FjJWr60xEqhoo9idhozX/YBHCc5KuXapjBXZszZJJIzMrhzQ==
X-Received: by 2002:a05:600c:4f0d:b0:456:201a:99f with SMTP id 5b1f17b1804b1-45876442808mr10203155e9.18.1753435697965;
        Fri, 25 Jul 2025 02:28:17 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-45870577987sm49752235e9.31.2025.07.25.02.28.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jul 2025 02:28:17 -0700 (PDT)
Message-ID: <63a6d253-305d-4ffd-9954-7cd665bd332d@linaro.org>
Date: Fri, 25 Jul 2025 11:28:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clocksource/drivers/exynos_mct: Revert commits causing
 section mismatches
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Will McVicker <willmcvicker@google.com>,
 Youngmin Nam <youngmin.nam@samsung.com>, Donghoon Yu <hoony.yu@samsung.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org
References: <20250725090349.87730-2-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20250725090349.87730-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_022820_067498_28A1B618 
X-CRM114-Status: GOOD (  12.70  )
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

On 25/07/2025 11:03, Krzysztof Kozlowski wrote:
> Commit 5d86e479193b ("clocksource/drivers/exynos_mct: Add module
> support") introduced section mismatch failures.
> Commit 7e477e9c4eb4 ("clocksource/drivers/exynos_mct: Fix section
> mismatch from the module conversion") replaced these to other section
> mismatch failures:
> 
>    WARNING: modpost: vmlinux: section mismatch in reference: mct_init_dt+0x164 (section: .text) -> register_current_timer_delay (section: .init.text)
>    WARNING: modpost: vmlinux: section mismatch in reference: mct_init_dt+0x20c (section: .text) -> register_current_timer_delay (section: .init.text)
>    ERROR: modpost: Section mismatches detected.
> 
> No progress on real fixing of these happened (intermediary fix was still
> not tested), so revert both commits till the work is prepared correctly.

Please don't claim the fix was not tested. I reproduced the section 
mismatch, tested it and figured out it was indeed fixing the issue. I 
just missed the error because it sounds very close to the first one 
reported initially and I did the confusion.

The driver is not supposed to be compiled as a module on ARM32.

The option tristate "Exynos multi core timer driver" if ARM64 is 
misleading. From this change, the defconfig on ARM can do 
CONFIG_EXYNOS_MCT=m which should not be allowed.

Before getting wild and revert everything, let's try to find a proper 
fix for that.

Thanks


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

