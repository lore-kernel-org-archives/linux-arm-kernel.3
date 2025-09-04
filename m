Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95464CA1015
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 19:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DcDEKKNnQTPrirM2TKss0tLgkg6+UenJjOFVj0kydUE=; b=A3gjsl2SyBF8BUIuO5O8b5WDcF
	ZNrbaKHIPRWcgxYAKIhIqa5BofBWRiAOpvmZY84n6nR+5stTHI2I42W/wZMBhvRegfOjAyjKq6ZW0
	12WBlz7xSrb5n9IgGFvBoRJ6TNP5ruSApli8QUmm5WTbXOA6NWIo4VEerf18cAigODBhyOaWDgNiU
	HUF/9DPM6WVCiC94rCXLzUtn1dO85c1GLTc0vArUBmpeONYsICof0SmyTXzfh+w4i5F5t56TfthrQ
	Tacin7x+QqB62DO9OzllJy1+hyQT12DEcqP+IB3GC6O6IvH+Xykcu51i1tDFf/bq3aWvGGn9JqoGX
	DW6EEMWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuFzT-0000000E1GZ-2WnR;
	Thu, 04 Sep 2025 19:51:27 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuAwp-0000000CDH1-1sbI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 14:28:24 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-45a1b065d59so7445795e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Sep 2025 07:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756996101; x=1757600901; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DcDEKKNnQTPrirM2TKss0tLgkg6+UenJjOFVj0kydUE=;
        b=UBk0bWIEIv14jiUGj3NY1lYFkppM35s02FI6LiWv+cII4gth9lCINF3oCgMh7GdeV6
         dtsXtX8E3Ry+wzez6clSRtaM0LoF/LaRwNJQPrnS1yxemfce4h6S2vmdYo/l62hX1Pkc
         RwxP6hs9mDwCGeBIX8sRqydWySV8Lx+nUgXqUQGiVuVjvKPU0KV3JvThUIPb1VsuxbjT
         7olSSUzWL5MQgdSW7pFHNDuLkmH/SbTmkv+4DaX1dUKq/wwjutZcCw5iwwPLVSjkPI08
         eKiH4MhJ9tbP83x2XsczvNj8r3AtmmYqYf8D3zgSO1V4fixsZBIc9UZxriuv+PSqB+QF
         +sDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756996101; x=1757600901;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DcDEKKNnQTPrirM2TKss0tLgkg6+UenJjOFVj0kydUE=;
        b=qYI4Z6MAqXF23O8s7rZ5WZnJjLhWMASKhIn3btI0DVmK2/50nX2aEAghHoC+s4MQVB
         QhUzMbGGaGWuELKvn8wq0sOzc2Id72MmAq6JbQ2yx7mx0DeGWFhIrnSruyKhjFKVkux8
         DsVjAHU07vAe7m7e6e8Nf2H/hb6ST1urzJngAz/SzysPzsZSRDZXHsY+VpMleyHIEWmL
         EliJGuldklMwrQm2Sbo1L2HjGOPKPDzW2Cr8KilIC788UFWSRGWLm+cy/V8InCVtkEad
         T1SkQJCMGXE7RAxlnUZHpHmPo/r3P2tNs8ZasTP918rcE3xaKGj1n1sK3qN4bhpwD0d0
         FLQg==
X-Gm-Message-State: AOJu0YypzAef9nosTKm9sNksuSmUI+zZsMw0J1Z6rK6oZpZj/TO3qI4y
	RdMU2WMMWyav7W5p3pbvKBGtWDfXnr5twJC6PKySH2mNgtQJi0hW9QF20hCCK/ZF7nw=
X-Gm-Gg: ASbGncvtBn6PdCfw78UnVSe22H4PKJQ8DG69ekidCO4jp29kuum63xvTEC0HqOyo288
	zabhB6woEYXWRZu7csLQ36m5XTsQQEhhwlacRYdIblEWYkuabAOF3/bcki1KZpIpyiYVrOX5S9v
	eUim/cqmzAoVwbQmWAuPm5pT7UjobHU8GnNms48Z+YkTeQIR34PrMufENaF9RFj6OCgYv6hmlC2
	RXtH+uJpTY8JVSaOC19zBXK1MSvLbZ7JU7XaOfAmT2/MDMxCpnEjaZJ/XemVSUUIFOIvFKtJYoO
	P8bFy3WzYioqKfQrGRk+QTiHjIjcFw0i5e2q4K0QIsDGH8RTH7BTEK32cNlWg3gdgAUppMntu7a
	QSxsBBJhd5KAmM6hFLgFnczaAwfs53KxE
X-Google-Smtp-Source: AGHT+IFMpG6ZWacwiwSPkZLZJzyjsT25qjvuify+8jgJtfkFvC5YMwDloMKDY1OfWLbskoCZF7jJRw==
X-Received: by 2002:a05:600c:8b23:b0:459:d5d1:d602 with SMTP id 5b1f17b1804b1-45b8553f3ffmr156662065e9.3.1756996101466;
        Thu, 04 Sep 2025 07:28:21 -0700 (PDT)
Received: from [192.168.0.251] ([79.115.63.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45cb61377a7sm79031275e9.13.2025.09.04.07.28.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 07:28:20 -0700 (PDT)
Message-ID: <3cc48a65-5d08-4469-9ed7-f836a2210702@linaro.org>
Date: Thu, 4 Sep 2025 15:28:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] arm64: dts: exynos: gs101: add cpufreq support
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Catalin Marinas <catalin.marinas@arm.com>, willmcvicker@google.com,
 kernel-team@android.com, Will Deacon <will@kernel.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Peter Griffin <peter.griffin@linaro.org>
References: <20250903-acpm-dvfs-dt-v3-0-f24059e5cd95@linaro.org>
 <175699523574.4060004.693479596122414416.robh@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <175699523574.4060004.693479596122414416.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_072823_490880_43834BA0 
X-CRM114-Status: UNSURE (   8.45  )
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



On 9/4/25 3:17 PM, Rob Herring (Arm) wrote:
> arch/arm64/boot/dts/exynos/google/gs101.dtsi:10:10: fatal error: dt-bindings/clock/google,gs101-acpm.h: No such file or directory
>    10 | #include <dt-bindings/clock/google,gs101-acpm.h>

That's alright, I described in the cover letter the dependency on the patch
that adds this bindings file. Thanks!
ta

