Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3F25CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 05:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Eil33dYZ2kqEFHYeERb3SkCrv/7mpVOIyPnTh2fbPSE=; b=Of9NRUnjW8p3Davh42TpbZlhbF
	951r1+G6uRrLRcBIcwjgjsg9nBqe2q+ED28spN7hfetpJhYDXOJyhPo3ACDBeZ87pcHHihUhOmCsq
	SRxgqmzzrPObl54oTLVWg1Zie7cXQCMw9MyomKnSCv8dyqLEa6jgkWP4gE7PdHX05++AbwaaypvcE
	EhguFeOUun8oVt4zjuK0u5J4wZR7FyzzZhe1fE5HDAk1kgFvsITgM67K02ATFU1Zc1fmHcC/mzaY0
	PRzDSuMzcy9zBtzDWuEmpH853qLsaFYHBW9/EkfzngIdad/gyjDHn4gzMLPciMnmf1YbsP5lpW30p
	4Fe0EF1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uobVq-0000000CQW1-0dqi;
	Wed, 20 Aug 2025 05:37:30 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uobTC-0000000CPss-1r1F
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 05:34:47 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3bb30c72433so2048607f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 22:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755668085; x=1756272885; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Eil33dYZ2kqEFHYeERb3SkCrv/7mpVOIyPnTh2fbPSE=;
        b=E8pbKXqvB4c7sNyT59U8+z4TwhmduUruJMqvQTs/sNLZaPZca+u31qHnACHBEuSwQP
         5mCMMV+ZylveKLsxGbB9pKZVCwPTMU2aXi4NCg7WOR1lA+Ex9Up/Nh+CtrL7AXjURyOn
         Q/sOclIAdKpc4zAoKxgvFTkr0zXfddVGnPr62P8Bd9isvr85i7e8WkWeYMWLWJskiKjX
         YUyQy1iV8Tkp/GDNqvXh187784/ebUcQWZAQCKretvm5mz3CBmFjAagMZ47QZJNJ5+nr
         nAIUPqlD4ptMm6xsG5YwApQ+sLznlv1zCT81Eq3Oeun8lqAxmDwYRp56x9uTqf1f+F2Q
         4Zbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755668085; x=1756272885;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Eil33dYZ2kqEFHYeERb3SkCrv/7mpVOIyPnTh2fbPSE=;
        b=ROxMH6RyLd8i+6l4yUXVZ2IFm017Ij7+BuBF3qAELE3TqpYLmTlA5YlM5Qa4OmYtUn
         hOyTElOpe+LloP/JBil/JNlcon/WhfXPbDew+9x5DmYEeJ//v01jt9kBnuL3Nyf4lsNF
         vTkmLdzhcW58bZtO1y+d8w8b1ddUMY3eT6Hrr3LQy/TOlTEChzLWS7tt+SoFencT+BnF
         tQxmUR9g4HYXMcoRpYADg1WWDYylu7Yu3TyQJxzk5iPx0dzOxGxumRUI0XZ3O98ApvN5
         o1jwZUwRZ/04Q6FICkTQBCT4XBiLuIYKYpipHtP7Zpi4Uitr7SGNaUoFuFCQ19hrEkG+
         9tDw==
X-Forwarded-Encrypted: i=1; AJvYcCXCF/25u/NousprhAR63sjb1zK+flj8sWpt+c06cK3SGhgKV+p2OmcE44n3cxtRS8rWhETTuEOTPdzxbWEWgNTs@lists.infradead.org
X-Gm-Message-State: AOJu0YxC0SljGPu1BjAeWx6fYoshelw41NJXRBviwEUgPXeXp7qoQ8js
	RwrFboHyyJdB1YpW+/nxhrw01EIWbIp8grzRmacJ74Z6VV+gHRE6ASRVstpZ7z1yeMc=
X-Gm-Gg: ASbGncsfuX4ojAVp3jZVApeLQVNRJs/mupxS3/zzcib92krUuEz5sILLwKnUgcidcfd
	jZbfNTcQzudvgPTWDmfe27ZbLyPdGx/W/GnydyYpUekZJBzoTuUT7PKoasV0aowiDWWz6oVo7vs
	stXSMxITzulFYUiM5RYxv9TPxQPyJlTGlp/+aIdqPWM/BFmN1hnMrZrV0djn5GXcjk5cRya5yst
	kIr453PqDdjRjmOl3SY2F7nyiuMo4fOOE3QlDfdA0SWhRHscB0b6tPKzef+tnZJLzoet/rIVWas
	KPr58cxkXzMyAG1jrFwyLPn1OK70p2ulrwmfNbPnd89bf2ZhkaaCih8gZw99UY95T9t9XJItaZU
	lnquNCOiRhGz58y1PvgnOyWl7JXWusw==
X-Google-Smtp-Source: AGHT+IFWjACp5DWGBY5B9uxqsY3tmY8UgIQcJsPet9ECXaI1irpOud50Gju5d9X1c0y9aS4zy+fv0A==
X-Received: by 2002:a05:6000:40cc:b0:3b8:d08c:cde5 with SMTP id ffacd0b85a97d-3c32e6fe6ebmr776353f8f.43.1755668084871;
        Tue, 19 Aug 2025 22:34:44 -0700 (PDT)
Received: from [192.168.0.251] ([79.115.63.6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b47d096e6sm15117535e9.19.2025.08.19.22.34.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Aug 2025 22:34:44 -0700 (PDT)
Message-ID: <e0f7f062-dd12-4aba-a1af-5626746059f0@linaro.org>
Date: Wed, 20 Aug 2025 06:34:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] arm64: dts: exynos: gs101: add cpufreq support
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, Will Deacon <will@kernel.org>,
 kernel-team@android.com, Catalin Marinas <catalin.marinas@arm.com>,
 Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 devicetree@vger.kernel.org, willmcvicker@google.com,
 linux-arm-kernel@lists.infradead.org,
 Peter Griffin <peter.griffin@linaro.org>, linux-kernel@vger.kernel.org
References: <20250819-acpm-dvfs-dt-v1-0-4e38b95408c4@linaro.org>
 <175561687189.581847.11419028447160198230.robh@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <175561687189.581847.11419028447160198230.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_223446_491310_3EAE7B1F 
X-CRM114-Status: GOOD (  10.75  )
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



On 8/19/25 4:22 PM, Rob Herring (Arm) wrote:
> New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/exynos/' for 20250819-acpm-dvfs-dt-v1-0-4e38b95408c4@linaro.org:
> 
> Error: arch/arm64/boot/dts/exynos/google/gs101.dtsi:75.32-33 Error: arch/arm64/boot/dts/exynos/google/gs101.dtsi:75.32-33 syntax errorsyntax error

Thanks, Rob.

I should have been more explicit in the cover letter. It fails because it depends
on the clock definitions that are introduced with the bindings in:
https://lore.kernel.org/linux-samsung-soc/20250819-acpm-clk-v1-0-6bbd97474671@linaro.org/T/#me3cbe2a97485d19eaf505ad23202f20a21305dd8

I chose to have the bindings with the driver patches as the clock definitions
are needed in the clock driver as well.

Krzysztof, please let me know if there's a preference on how to deal with such
dependencies, I'll note it down and respin if needed.

Thanks,
ta

