Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D39ECE8D6B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 11:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5PmAE4/SlQNnA4RBQKLIAp7T7uRex/v+oYXbbVoL1Es=; b=0/WzSAra8yVoetzpPjrKlcm10q
	Pqj9XuKGUiKEbzrIyNKtCm1CvYSpNhdVsZlnFNuBx7oj8+3Q9bL+gJF/dtQs3Plw0lMJpmwWUx2j4
	UK8J43RIoPPKGU8fLWelKwQW/3clmO+Alx+IJB90vbV6A4pWBzcPieelMz66KEWp6wZp4vdJBqUJB
	Js+hiWHyOqRq/g0pXTz98LtyMYqI2M2kGNw/bHfLNegIfeS5LnKm17Ug75j2KIixQalNtuhCwZoij
	kmuoXoyQupbtyI/b9chLNQ8GhkR9Qz/fcPb9R796JgP7wGmNSqLjTyrdbOmFi1Xy5Fgn47L3hGost
	VFagFZgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKxh6-0000000G0KY-17ED;
	Mon, 17 Nov 2025 11:46:52 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKxh3-0000000G0Gq-2KUk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 11:46:50 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-477a2ab455fso8760085e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 03:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763379986; x=1763984786; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5PmAE4/SlQNnA4RBQKLIAp7T7uRex/v+oYXbbVoL1Es=;
        b=lZ3w6MPc1BJFAWTSoKF6X4ByhIKuA+7osM441mES9JOm7WQoXEv9xD/7/XO8yc0u7c
         8Sxi6Dj4qmvocoO+zI2r6QjtenWoqLsy8UtKfH+z9aIY9xQicYtD5ibCm08MjiAbE69w
         rVoemXakqBGDUOd+E1vxSBH7D8ZiO+UoGurKjAicH9oMuKyy92FJ8spr8TTvtr/5UnxI
         GFwi867W0WTLstcKueIGubFDG7kqNMJJWFpS0V7zG6uuloqIEqL+xrz1PRifpWn2Xg/M
         Fs1QIPdA4yjO2EivWSZpUmnez50xLCuSGUekw4gEEI+Hd+PkVptcFzmYWbxBv4U/zpPv
         6XWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763379986; x=1763984786;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5PmAE4/SlQNnA4RBQKLIAp7T7uRex/v+oYXbbVoL1Es=;
        b=sPbM3kK3vtwmTUHsaA7OrVnNQ2slvysTABAtIwcKzdrYYH1Iz3k05Jz4+vkTXAWlji
         CBBNPSikLmzOQv/vZgIg9PvfofsYVUizFs5ksDVFuevizihOvikfcI/Knb6JnI8jDsmV
         XTWgthIf4sojSVubnYuovK+f7XMHmc7iQedYzcVVO3GGV+HUqT4SyoyfVZFDA7nbBDJE
         kOv1yb1k/jex+3RWz2woG6Ul+cIolgX2rkSmHXxshBJURVthyB8h/+MosWgdqMxGewcP
         xlXR+7rX+qgJJbIosiVfpC2885f6erYeZ53nZWk3IepzM7bbcowW1MBjjiYmv/FKoT+p
         XmYw==
X-Forwarded-Encrypted: i=1; AJvYcCV4uZFupIekLZNIpANnM9W39jECPHmdaQSjKiJ8cvn301cMzfarMbhJ00/1F0CuZVkAGnUDuMNvBRD9p6U8JAwx@lists.infradead.org
X-Gm-Message-State: AOJu0YyLwRbCWLeVMybRqc3aAwdU+c+WkhQD8K/IV39omgDT8fAz4QxO
	VR7DY0exrOXIMKD4XxOPEAulfFR2TZZ91DA37VxVaUo4I8lf/JUVXXunEGoTGCkDFU0=
X-Gm-Gg: ASbGnctGt6G8rYlXbUSbhgI+rUy99n0dKMVBk7/BrzBI18CQWY+tZzN3TK3ozJ3die+
	hVAAfm4y8AuSndGr7GCZl7tMAF2ayfCfGkHsGBB5M3tb5WcjDFdwRf33kb5YT1sktjOtYULisr5
	Q27oDF7CiqCjbK7shHjoQwAR/F8wwiQS2ab//JK7EODLS4fwT3P6Bv9uuZgWLYfpx3Kc7TpVsZy
	acT0pmGABiABqO6JUjs9FGNAzXqhATumR6WOJF8g/WgkBmnu/CWAd14qGCl8X8Vz6fQizYAuhHQ
	qB6mV3+0g4CqM+iS/fzOzi29L9T0JrlN50Lv3ToYqSLsvvY0bBpc7pZbpeeENFoCZVoho/Bqml+
	Ubr+Z8KBc6FChskGOIdglIAyjwch5q6edtLoXM8cmxmpqTU1MyYqJRClsf67VkTRHaFcwWj3Y1A
	ht3jIJY3hXH+F6fEioaqWedy5XjBuM2yDlc2a6ZCUkTnEhAovPTmAkpQs=
X-Google-Smtp-Source: AGHT+IFNvzfA8+IBQKGT5ANa4HDP2N9QX+3VtWlf5b77T6VzgwZ3FHSemKzoXYJh9ES00ThV6nFG0w==
X-Received: by 2002:a05:600c:1f12:b0:45d:5c71:769a with SMTP id 5b1f17b1804b1-4778fe9aedcmr115869275e9.26.1763379986306;
        Mon, 17 Nov 2025 03:46:26 -0800 (PST)
Received: from ?IPV6:2a05:6e02:1041:c10:b121:89be:2e42:dd71? ([2a05:6e02:1041:c10:b121:89be:2e42:dd71])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-477a81c567bsm901765e9.9.2025.11.17.03.46.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 03:46:25 -0800 (PST)
Message-ID: <f1c5a4b6-3e75-418d-b7d8-7899dcd28ca3@linaro.org>
Date: Mon, 17 Nov 2025 12:46:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/7] clocksource/drivers/exynos_mct: Add module support
To: William McVicker <willmcvicker@google.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Ingo Molnar <mingo@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 Youngmin Nam <youngmin.nam@samsung.com>, Donghoon Yu <hoony.yu@samsung.com>,
 Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
 John Stultz <jstultz@google.com>, Tudor Ambarus <tudor.ambarus@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-samsung-soc@vger.kernel.org,
 kernel-team@android.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251023205257.2029526-1-willmcvicker@google.com>
 <CGME20251023205319eucas1p24eb9821bbcb2d59e2cb1e01c4366faab@eucas1p2.samsung.com>
 <20251023205257.2029526-7-willmcvicker@google.com>
 <40d3f3c9-7526-440b-9dbd-7ead22c8562a@samsung.com>
 <aPuhDFKINM9iXOKb@google.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <aPuhDFKINM9iXOKb@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_034649_624425_E84C5114 
X-CRM114-Status: GOOD (  17.87  )
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


Hi Will,

On 10/24/25 17:53, William McVicker wrote:
> On 10/24/2025, Marek Szyprowski wrote:
>> On 23.10.2025 22:52, Will McVicker wrote:
>>> From: Donghoon Yu <hoony.yu@samsung.com>

[ ... ]
>> Sorry, but this still won't work on legacy ARM 32bit systems with MCT as
>> the only clocksource, which needs a driver available very early (that's
>> why it used TIMER_OF_DECLAREmacro). You need to make it conditional
>> under CONFIG_ARM:
> 
> Can we rely on the bootloader to setup the MCT timer and then hand-off at boot
> once the driver is initialized?
> 
> Daniel was working on a solution to transparently handle calling
> TIMER_OF_DECLARE() when a timer driver can be configured as both a module or
> built-in here:
> 
>    https://lore.kernel.org/all/20250625085715.889837-1-daniel.lezcano@linaro.org/
> 
> Daniel, do you have plans to finish that? In the meantime, can we go with the
> `#if CONFIG_ARM` solution?

I have a plan to finish that but it is low in my priority list. So I 
guess we can go for the CONFIG_ARM solution in the meantime.



-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

