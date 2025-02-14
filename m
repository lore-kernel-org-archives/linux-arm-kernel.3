Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E06B5C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 06:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RS4NhYdSKIq0ZCVoddU4UM3ba+/5N5wTfgewbJrHpVM=; b=MEy5xf1+FKuv2FeuSMapmZff51
	fqWH+MudbqZD8PKmvbkhbLZ0F0DgQHMnUi1T+zLtfxg3m7s8DFGITUEf0AsXE7jQRuK1PIGc7TQw5
	K5nM45EqpgDf8LpxQGPUqlro+GRqcr0wFBVj2RDpqS6H0H47c5ZIwRAnfXBhgvRa8wcSodlBM5gXR
	hxFrBIak4lFKsa16l8oKuV4bkfNPtdQhwZclHiAUhYa4UdjuTyY8JUoptPnOPWHeT5nGnavx2qBm5
	f373AGWLwwk56U/+yw4AavspdVUFJJKL/f1QkvzWRluSixFIo40Hc83grvAf27pSz/Mj8XsZSKrPN
	XXL03hzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tipG8-0000000DpoA-13Mi;
	Fri, 14 Feb 2025 06:33:08 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tipEP-0000000DpXK-2Uvs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 06:31:22 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5de3c29ebaeso2079719a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 22:31:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739514680; x=1740119480; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RS4NhYdSKIq0ZCVoddU4UM3ba+/5N5wTfgewbJrHpVM=;
        b=xll360Ad3N0vQEllnLH1IE0UzWXr+t3klbwpvXmhw0L41gaVXMAdvsfPfCG/8QGpsh
         cY99erJALC7en3+McQOkR4hyxaDWGsnfyZXe6xiRQcr9AKbs5LPHP+DH4V8bpFwfiXvh
         FuneShSURWErwPdMfrxquLp1CA4bboZGZit770/WIWuhtJknB1ki/XmBemtwlZwgkMRC
         LIsvshi3d95D55f8kBelQkk5zhOxWZA/MGeRy/LUrTbDGWYCgzVrkF7aISqnm8AXlTiH
         FHucmhWfhiW7bqJNSsEcI0R5cb01ZmskDNxvp09vYAdLrPvLY5sknEgYi201z/c6Juve
         3NBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739514680; x=1740119480;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RS4NhYdSKIq0ZCVoddU4UM3ba+/5N5wTfgewbJrHpVM=;
        b=aK+LRR5CAXw9xJ/h6RgUUkUTVwdBiUswg1RTNdGE37x7DAQGjK+/XkaKIxWshCu7RV
         /U1RPXsAgIlWyjJHjbRuU+5sBN9H7uf39NXV7cawTOBibbGHabDwNpnAL+8uCZ42cwgS
         crqYoa7r0ShsVXAHsC5NtVIdtj/XAPJKo+imCym7+t+qqitW/3UgNzSixZ9gUrc+YsSh
         cwBxjOd7UN3waztXGD0xbD6kA3uxZRfuM0Zc4y+iWtwiiLeC2gG3btZi/7az5QO14XM7
         qOFRDxQSRQ4Y+OdlOScH9zsu7vU6MjI76fwlZrs3laU7p8EmQvCDDNlGkStg70pe34Zc
         AFcw==
X-Forwarded-Encrypted: i=1; AJvYcCUA3GFDUJCDYeoVx2I3yZ4AtsB99Sw3MCgFrQeVIlHqCGHLj2olsTZnJwJ9+KUNwp+YkPEUJHLzParxjFZq9B/q@lists.infradead.org
X-Gm-Message-State: AOJu0YyPBA5g/nyetW1wZ/+5CIGRG3mhFjy0Rv8oxtOxnZfVCrjSvaRN
	8TgmstawqDkQiwGd49SaSj/96ugeKP8niMCxyukEDnEIkxpdRx+zX635wfpr3RI=
X-Gm-Gg: ASbGncsybvacjTAEEzd9kKDxm8fg++kIqut50TE9mn1/rstPQH5kwDP3yOTs0iXiIwI
	+k1SCn7WlAqt2dOkSbQL4H1RqmJwwNSuF4PhpUoWIsDf/uNSwibtJDQHl1h6nlohpKU5EwB6hj5
	1NadIa4gXvjihQ9mK6dlUwDiCjA6M/nNAZTSUCaWPQhqURLm1XqVknh+QeqT+l1V+2bnQ0ve2LJ
	TyEDfprUr7aAjICr9NpMIxdx6Sxpct3ZNPWSGHQ6GWQsQlRmlcEeG7snzQy/dFtgnvqGPLUsxXX
	KpczvMuttiomd/KvW1rgY3he
X-Google-Smtp-Source: AGHT+IEN/RRE5hxQ5xNZNtT7rJsPTV3GPjWwm8qrFkScK0MAqhU1b09AXyINMIOW8g0Zg6OABiY4tw==
X-Received: by 2002:a17:907:3da8:b0:aa6:79fa:b47d with SMTP id a640c23a62f3a-ab7f336d454mr924285066b.1.1739514680163;
        Thu, 13 Feb 2025 22:31:20 -0800 (PST)
Received: from [192.168.0.14] ([79.115.63.124])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece288e38sm2350948a12.79.2025.02.13.22.31.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Feb 2025 22:31:18 -0800 (PST)
Message-ID: <49ce4bf7-fec2-4d1a-aff0-e342b31c4f57@linaro.org>
Date: Fri, 14 Feb 2025 06:31:16 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] spi: s3c64xx: add support exynos990-spi to new
 port config data
To: Denzeel Oliva <wachiturroxd150@gmail.com>, andi.shyti@kernel.org,
 broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, alim.akhtar@samsung.com, linux-spi@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250213204044.660-1-wachiturroxd150@gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250213204044.660-1-wachiturroxd150@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_223121_641731_A8ABE11C 
X-CRM114-Status: GOOD (  10.28  )
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



On 2/13/25 8:40 PM, Denzeel Oliva wrote:
> - Added a default "fifo_depth = 64" to prevent crashes when "fifo-depth"
>   is missing in the device tree (avoids divide-by-zero issues).

no, you shouldn't use fifo_depth as a fallback, it's misleading.
fifo_depth shall be used only if all your SPI instances use the same
FIFO size. If that's not the case, as in yours, you specify the FIFO
depth via DT.

You need to determine whether your IP works with 0 sized FIFOs and if
not, make the the DT fifo-depth mandatory and check that its value is > 0.

If the IP works with 0 sized FIFOs, you need to update the driver to
allow that and let the fifo-depth property optional in DT.

