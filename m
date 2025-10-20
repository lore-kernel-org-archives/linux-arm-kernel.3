Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB0E8CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 07:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NeEefsjDjBTzkWLJQXyP/5aObcnLAGWfiU+nORhhDXo=; b=pkxWdjsRLZAsX2gYdv2/AKadUr
	snERKnFhDp2lUCG5PFfTTWEnXEU3Qp8vuub/XDiBVTldloFy4GhxPXP+lYCVUemCHJmQfJ+pbcj1L
	o/qxc8cbtUvN9455BiwaB1GUhTSpaE0d/DibvWbJRraZHnhemCaicj4uTUpd3FpGUWTnvnrtc5XLv
	x1K4A5xAP4SxB0ae0+nRy299LV00vhP9CkRnNvWKu4xWLlW/91xwnCCtz95yRDxa6vN2qX+6YAQsl
	GAYyTIZj3g4gx4AMkymsCf5pSjwWmwQ9WGjK2QpXntHNSUfWxj+XwXEsJTUXGH8oPAOYwoPWqhdJF
	AjfU4mig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAkal-0000000CFts-2PIN;
	Mon, 20 Oct 2025 07:46:07 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAkai-0000000CFtY-3aAm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 07:46:06 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-426fd62bfeaso1764045f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 00:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760946362; x=1761551162; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NeEefsjDjBTzkWLJQXyP/5aObcnLAGWfiU+nORhhDXo=;
        b=DXlJcX9Y2hjtnZ2iCafoBg3+a7YD9yNvVJN3W/F6/SmcGFJIQXDNnZ2bs20QX1/mmK
         QXoQu0SvvuvH4EMre242Bl+INGeKnci6Ru/nWcsk0GNGRv9TSUZMb4V3zmTR7qDRzODO
         zx6eC0K+HwVEj4oPeUC81M9ULBlIHe85A84iO4wzA+OUkx5cANz1wpMwy2yhlOAQ1UUY
         7mHc33h8n5YUxjx/uYxa5l+gIoGjMQmXqgMyBlvOhtBVeArVAYz5e32oMfDz3XMvW1sQ
         fCyb0K5Bu9HZUqkQ6AvObJudS4WZ/btU+7Ib127G+VVXcY2mF+3zPCuknT5VI5AAhP8A
         8G1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760946362; x=1761551162;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NeEefsjDjBTzkWLJQXyP/5aObcnLAGWfiU+nORhhDXo=;
        b=xDFaIX7C3zlFU1icC/sNoqLnU10UrOM+X33PLMdiGkEY9jRDCLw3rwMDLvR6Gjl3SX
         0240zwL58u2hYuTKL+QZ/LdPzI6/G4pKEIZrk8UFT4gwLwDfQYXt7nXR/HSphn8loGAU
         Ivc6GEuY8q44LB2wcm8WobdQsPFgyFQs/AtU1QEMNaKu2OSXbah5u77cQsFKdla2LDmo
         C/rGCrL0v5fQ54efYHtE7eBSZYhl4U3Z5oQ4bLwtd6RNEYfnM4IUhwQjPC8cGRbEFIpU
         uBDaIjZkvgICb+tPPRsq1g6BEE3xhHuc+8uMmQDF8mg5Zu04/R26JwZqR0n00Yc8cJ1B
         RJCQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0I2nUjtyvyVIMkucfsFGpvm+mN4LYzxQeY4jP3ilyVPY5Q/3xqbmMrq+LvRwMBdf20oM6RB0wYvQIWqyHkVGo@lists.infradead.org
X-Gm-Message-State: AOJu0YzjzmPYMfsvCq08NZ9f4AXOsYMfVr0RQxYk1pVhiEJahJvbMKvw
	Rj4B/rSNT6L8MF0mteIiVvJlEcdUnPaFFQYh8v1xOPltp4jiGm4UuYuWzIHotz8AMJ8=
X-Gm-Gg: ASbGncv+yQEWVYcZgTLHIBOfUzJ0z/MPe4mM4dW64buCdKXX4FljNLiWrqQvqQaaWTO
	GbQZmsJi7Yd39x3j+BXVNDtGQvOr/ECfPwPhkxRJeWmE+oYQfkdOF+q7ERZKLRRNaTz+gRY1MfR
	0fdC01IzaQ93IaQgnbdTjUGGEg9uSpprQbxAEYxyLnY2cYB9p/L/T9CWXpuba4fFmBSsW7RPM/u
	XmCbt8fs24mMreXd1FQV2D6NbTPjgnPC8SPvZHf4JlAJxxVzNbF+snjkXz+L6NHM3jVv5ddK2AI
	U9wG8NoKnU1NFRwD52iLSegb+zB0LE/dPbBkguAMz6uuFPq0vl92LBE63LUC1UdvCObmLK/icwd
	3/TcpGnJUAcMnWEKA2UBGBloPe2T9WEDN/Rq0wQP0ffytuTwC56AK/eo+gzeUwsKPx/gRy1ZnP7
	EpvyN6s1BDtiQYv8Nh2/c=
X-Google-Smtp-Source: AGHT+IElXYjtpSTA367NjPFbuT2cNOkeZqKtyb865DWWHqYMgZ9skD7DsDruCaof11OozJ+7TkNWCA==
X-Received: by 2002:a5d:5888:0:b0:426:d587:850d with SMTP id ffacd0b85a97d-42704d78d2amr6946088f8f.28.1760946361718;
        Mon, 20 Oct 2025 00:46:01 -0700 (PDT)
Received: from [10.11.12.107] ([79.115.63.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427ea5a102fsm14122755f8f.1.2025.10.20.00.45.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 00:46:01 -0700 (PDT)
Message-ID: <17695fcf-f33c-4246-8d5c-b2120e9e03b1@linaro.org>
Date: Mon, 20 Oct 2025 08:45:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/6] clk: samsung: add Exynos ACPM clock driver
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com
References: <20251010-acpm-clk-v6-0-321ee8826fd4@linaro.org>
 <20251010-acpm-clk-v6-4-321ee8826fd4@linaro.org>
 <92f1c027-bacc-4537-a158-2e0890e2e8ee@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <92f1c027-bacc-4537-a158-2e0890e2e8ee@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_004605_091367_E11DD95B 
X-CRM114-Status: GOOD (  12.48  )
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



On 10/20/25 7:54 AM, Krzysztof Kozlowski wrote:
>> diff --git a/drivers/clk/samsung/Kconfig b/drivers/clk/samsung/Kconfig
>> index 76a494e95027af26272e30876a87ac293bd56dfa..70a8b82a0136b4d0213d8ff95e029c52436e5c7f 100644
>> --- a/drivers/clk/samsung/Kconfig
>> +++ b/drivers/clk/samsung/Kconfig
>> @@ -95,6 +95,16 @@ config EXYNOS_CLKOUT
>>  	  status of the certains clocks from SoC, but it could also be tied to
>>  	  other devices as an input clock.
>>  
>> +config EXYNOS_ACPM_CLK
>> +	tristate "Clock driver controlled via ACPM interface"
>> +	depends on EXYNOS_ACPM_PROTOCOL || (COMPILE_TEST && !EXYNOS_ACPM_PROTOCOL)
> 
> I merged the patches but I don't get why we are not enabling it by
> default, just like every other clock driver. What is so special here?

Thanks! Are you referring to the depends on line? I needed it otherwise
on randconfigs where COMPILE_TEST=y and EXYNOS_ACPM_PROTOCOL=n I get:

ERROR: modpost: "devm_acpm_get_by_node" [drivers/clk/samsung/clk-acpm.ko] undefined!

Cheers,
ta

