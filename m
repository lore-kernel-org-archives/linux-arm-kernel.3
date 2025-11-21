Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B255CFC279
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 14:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sSqjmw47egF/N94mEdR3iEsMh8hAGTJSLEFFawVJke0=; b=BmnPFNlqDcVRYnLFgysqeFA/Dq
	UbNxAjYKvLpMkFxQCEmWt83WQ/YTbX7X8Njei7PrLkwgC5QslSR/J84BMHYctJiJ18D0Nzz4BeWlh
	JKh2Tp764nyOitTSfnYvmojdYhPHAq7o3dmHjF7FcuWogHtMggm2g1Y2S5h682uE+Yll+I5Y04zcf
	55zRPNu9iqzH9nqR7vpbm85yWt9NZBM5FFZWfrY7R9YLCwWNvAlk6ohZcswMMIvkS/y9XjJ+uBMOs
	nUGMrn5Ar/C7lPg21pljzma83Kz0dKoAM8+nhW5P8JrezEFk6mp6A4e53UzwqqymvT29ULELyECsI
	w4w2iEZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMSGh-00000008XDk-0xyC;
	Fri, 21 Nov 2025 14:37:47 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMSGf-00000008XDA-28nK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 14:37:46 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-477a1c28778so23949515e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Nov 2025 06:37:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763735863; x=1764340663; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sSqjmw47egF/N94mEdR3iEsMh8hAGTJSLEFFawVJke0=;
        b=Egg71fUOpc5o7hKvQ/dhN1Gnk9EGTQp1YQaJ7GejVOi4CH9yUn+Q/NJ6PKHWU5fj9Q
         3AGjDHIeKLg0auffQ2r8vV6eBy7I/8nmHcY+gZY0GPdoXGpPPTuwTCABNBOZ08uVinL3
         gAWlAcIa4Bs/eScAhO+2Iew89/hx0o1mCsqn+bJ75SJSiBKc4Rbv2d4Mg9rMXz4n5wZW
         X8s6jShmCu/FSFLf2Hb99C18CFqVShl9BgS2sF6SkaRHm2atWXHV0YK8d/4Hu9NG9RUv
         cQ7I+fL55DLZKi+CcITlc5b5EzXbsFTlpFbXG4kJ1Fd1R9kTkANCPso8RPkg+mRtv0cr
         afSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763735863; x=1764340663;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sSqjmw47egF/N94mEdR3iEsMh8hAGTJSLEFFawVJke0=;
        b=en/e+kFMMYUV2DqDU0tMS2BcF5mW+BKF1u2lKoPx0IYwjd8Z2z8hTbjq7rT7cg0jrY
         sWVu8ygTWy1FBADb7GYc2scmqT/mC2YmSI0BRohQ6Uv1DZ5fEwPl9WZgU+nDMHCvjrA+
         5w7ZdfAczyHDndMH9R3lu5f/xhEUF1I9Y+KOsu4Bjz/d8L7fWd0ZizLgWsi9HoG6ul9G
         /tsVXOs6/R4s5tUIWJ44ajfXsBpWEIXY1YPMF5au60C0U8YC0hl4ePZlpuJ2Hvl7ESQa
         LVvIAw9iar2w1HdQyfyqJYBHV2J7jjWLSGoGbYuoaYS2QKWQC4/r8/YmERFtrX25kaBx
         WElA==
X-Forwarded-Encrypted: i=1; AJvYcCU6ubluu6ww/fZ3cpw2fY0rWnzqos7/xyDNruBMjatpajLSrWfQlaG2EV8a6CkvUCts7hJHO+FZtXPgObdjY4NG@lists.infradead.org
X-Gm-Message-State: AOJu0YwhBozb93q3osrd0iSCGRM4gTIaKv4QfOwuz8TlkYZNMx/cF0S+
	vLMqlKEuNARcLeXDwjbTRMTu+OOkWdKoUuR+MSa1cr8VaqrBxm8sp5j1/kzQRX+WetE=
X-Gm-Gg: ASbGncsjhzLrlayZMBYPSyyiSdGXQRKihbYT9mpR724C4iJOoGPA5q8N/78tFAz5Vtt
	VIXvp2PoHuMDehsjiGn8rfEqbCYuks1NK8I7mj+5x5vMedFfQ3/b3YCW0TYxNJ3y95Anrmu05bc
	99kJVVmXpjb8PrFrY569cMlmOaEZ+HiTH+ZNrfkC1hnSZzCmvDlvTT3Uzrq/rzVJBm+7X44g7ia
	5rJc5L19euQDuJmlfh511AcGhXj2qRx6K6uM7Xl9EAbm8US1c3VawRzM27otywjS1vBDzAh++Ii
	EKOMAhNI4y40VGXcftp383mURmEd51cnqsP/fn1kAJZDe+EfOzvE0LREuh4FG/Hk4lWBVssbzdz
	u1RuBNUIeeJLt0/0xgN5pkVu1OvD+QloJMEXjNnjP3t1zjGEJUQ5/pITA7b20cekJFYSRsd6CLh
	+ggdBw6r6DpRlysiJyyKmx3WDqTJ+JvDVatYAbDy40i8YKfDQP/qQrWGTCkSI1qbpDOX/BiAkEW
	rxt
X-Google-Smtp-Source: AGHT+IFD1wPtEuNTYpQ8xE6F8oI1MRv/OML7G8ADOWBdJfI5P969OqsJ7Zy8eXH/iFI9OqcudodJig==
X-Received: by 2002:a05:600c:190c:b0:477:5c58:3d42 with SMTP id 5b1f17b1804b1-477c017d879mr28676045e9.10.1763735863512;
        Fri, 21 Nov 2025 06:37:43 -0800 (PST)
Received: from ?IPV6:2a05:6e02:1041:c10:37e6:ed62:3c8b:2621? ([2a05:6e02:1041:c10:37e6:ed62:3c8b:2621])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-477bf22dfcesm46879155e9.13.2025.11.21.06.37.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Nov 2025 06:37:42 -0800 (PST)
Message-ID: <79cb0a99-1431-4a3e-9ec2-f70b4154b41f@linaro.org>
Date: Fri, 21 Nov 2025 15:37:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/6] ARM: make register_current_timer_delay()
 accessible after init
To: Will McVicker <willmcvicker@google.com>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Donghoon Yu <hoony.yu@samsung.com>, Hosung Kim <hosung0.kim@samsung.com>,
 Rob Herring <robh@kernel.org>, John Stultz <jstultz@google.com>,
 Youngmin Nam <youngmin.nam@samsung.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-samsung-soc@vger.kernel.org, kernel-team@android.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251120184242.1625820-1-willmcvicker@google.com>
 <20251120184242.1625820-2-willmcvicker@google.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20251120184242.1625820-2-willmcvicker@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_063745_571171_7809F58F 
X-CRM114-Status: GOOD (  12.04  )
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

On 11/20/25 19:42, Will McVicker wrote:
> The function register_current_timer_delay() is called from the
> exynos_mct clocksource driver at probe time. In the event that the
> exynos_mct driver is probed deferred or the platform manually unbinds
> and rebinds the driver we need this function available. So drop the
> __init tag.

Is this change supposed to fix an existing bug or is it a guess it could 
happen ? If the latter, I prefer to not pick this patch until is proven 
it fixes an observed issue.



-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

