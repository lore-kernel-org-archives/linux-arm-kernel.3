Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB0ECCA0FEE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 14:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Eai2SOVFyKY7uDjz0RBz4QRcfaX15jQWQ/bFhzOuBu8=; b=nd0Yiw0MtON6hco9R+0B1BwEg6
	GIXI1MGRMJVyyHj7nb+qZIKF+eESbAHY4NZ+DwMITeeJOglGI2usvjljWxe3riVY91HKHzp9GI2H7
	i51l3G+pOLrRbMdw3WP4zuVoeH0AT/z3oHas+xAEEqMcRJFgic4/aq8+s5ArZWI4vQkqDVBmZ6N40
	SGc/rb3wXcENScje9BvyYmy+JPqBI1P3XHQyVQUjTOUJPZFq0vI4DemV0MmvTla1r6f6FpmXg9LzU
	rONM/MLEU8AW0g26MpRM5JQL02FDDb2y0Fg8MPQN2c6Idm9SwI3TDD6JjTe1VR3IpAWebuoiACPQ8
	ANiZjqMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqYer-00000008L4b-2G8H;
	Mon, 25 Aug 2025 14:58:53 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqWKU-00000007v0c-17L0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 12:29:43 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-45a1b004a31so32992125e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Aug 2025 05:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756124981; x=1756729781; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Eai2SOVFyKY7uDjz0RBz4QRcfaX15jQWQ/bFhzOuBu8=;
        b=I+OWXiw0n2cZHEYYOEftEJ1uyPZco6hLkfAvR4DYLA+Qw0LchajKdHGc98A3Ky8sny
         +t1NKulDMnrsV6ghOVPRN4xreuAWyCVWrS8hL0ayAZx+SQmNfCw+q5FX//3NWXmW8UsF
         v0qXmQlMuEvGCOHo5dgBPxlAGzGCES4zuNctO3kDaVVI0MlNWw6k/Vr8BDFGjaDmNI+d
         rSJevhF6Y5C57T8EDccK7ES59bFBNhjMLqomFOk0qfwNATre5VtVOLdIjhbBEMUMDJVs
         NJC4BsSC/D1bXESFsj/gcCw2AdCPUmxOMPuElIY0yfMwu/QZACZ51m+SXTXWC/ZjbSN5
         cxwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756124981; x=1756729781;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Eai2SOVFyKY7uDjz0RBz4QRcfaX15jQWQ/bFhzOuBu8=;
        b=xCydfBeEFW2xSFsxhxQ5x5zGeqSFqFt2xonTQceLlv6bLk41/GYLOBohkytXPDNcU7
         YZKMaSYy+/0lt/eLv+ICgkK4sY+c3Bgia6pEXjfPyfP5rAmpbRBu0gJq2fMHBFFPKx2D
         dA9Nz1SdgFEl0indLB7u9/3hPQHQwFrYj86HH0WfHplqqO4hiiyCTU3fk67EY0Qm+D+T
         lvGKXVNJ8d7+hBFTLmVyZyyqP9l8LCq3PtQPoMmkHhqJGL4go77iPMoMP1DzomETOqB5
         GbBvN6K01koCUn8aJHgV7c5kIv2oAPO8mxE9MfIGmocZvnTXupWHUnwUEyeWGWnxIMJd
         sThw==
X-Forwarded-Encrypted: i=1; AJvYcCWLW3MAZcSv5+BVCKGiPe3YGEJi9AsFLOq53mMUB4NbEikJ2QUpPcZ4SPA403ayOSNeLuZIP7/JK9n7YNqTJDWa@lists.infradead.org
X-Gm-Message-State: AOJu0YxlLeQr7cia+BNTGckAi8BPfyAdBof4N+oLkpsC1Ge9aMKfoVhp
	8DF+7dWBAGf3jlsliI1sytQVANSiWUTakOs1Myrokrp5HS476eElPbnsYVig+L/avgg=
X-Gm-Gg: ASbGncuNnzVLU19kM7JgoROBccNqDmjK5un0qtyEF097mfjei+GT2mwrISHsln+inAJ
	KDL6yvqkNOTyERWgzhn2OvG9R+NGNn90clGz0hy1sCYwqTeyA+OFKvKckpBYoyPQJa02Vt2PlQ4
	ab/Dw/FjJZGljRaVtE+qzuqmBSEIEqnqPBOQWvLcK8hAdeXv+oh9a5s1gR99XG0zZj2ntn6r6yS
	1B9kUtjDKnT81er6EIRcmnEQ6Jg2eL9x+pCbvOeyzKgCGqdCGbhTRRc830x9c73q5ORwueI2Oe2
	xs5hwAn3RsKhOhBl8Z+6nPH3Tcy2+wbvI35JrQhjkqSyF20CChQ19OM/2Jm6ZrcFWR8YhFit+3F
	IlBaBt9gjc8WKLqz/dK2jrwjEbrB/bmg=
X-Google-Smtp-Source: AGHT+IEv1kH6bqyVtAllBNsNRCwow2nM6JC//3mmwEWBmo85Nw3V+P3tVEs7CQiOJz1KhUJg0ZYTeQ==
X-Received: by 2002:a05:600c:3b95:b0:458:bda4:43df with SMTP id 5b1f17b1804b1-45b517cba02mr109565765e9.17.1756124980706;
        Mon, 25 Aug 2025 05:29:40 -0700 (PDT)
Received: from [192.168.0.251] ([82.76.204.34])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b5753b77dsm113994195e9.10.2025.08.25.05.29.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Aug 2025 05:29:40 -0700 (PDT)
Message-ID: <c89c7670-01c6-4002-a269-08cf19e1abcd@linaro.org>
Date: Mon, 25 Aug 2025 13:29:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: defconfig: enable Exynos ACPM clocks
To: Krzysztof Kozlowski <krzk@kernel.org>, alim.akhtar@samsung.com,
 linux-samsung-soc@vger.kernel.org
Cc: peter.griffin@linaro.org, andre.draszik@linaro.org,
 willmcvicker@google.com, kernel-team@android.com,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250819-acpm-clk-defconfig-v1-1-70f5963ef90a@linaro.org>
 <aafe8482-7017-47e8-b035-7adc49e69a06@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <aafe8482-7017-47e8-b035-7adc49e69a06@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_052942_313174_490B5125 
X-CRM114-Status: GOOD (  13.22  )
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



On 8/24/25 6:00 PM, Krzysztof Kozlowski wrote:
> On 19/08/2025 14:21, Tudor Ambarus wrote:
>> Enable the Exynos ACPM clocks driver. Samsung Exynos platforms
>> implement ACPM to provide support for clock configuration, PMIC
>> and temperature sensors.
>>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>> ---
>> The patch should go through the Samsung SoC tree.
>>
>> The driver is proposed at:
>> https://lore.kernel.org/linux-samsung-soc/20250819-acpm-clk-v1-0-6bbd97474671@linaro.org/
> 
> 
> Please send it with above patchset - it target's same maintainer: me.
> 

I noted it down for the next time, thanks.

