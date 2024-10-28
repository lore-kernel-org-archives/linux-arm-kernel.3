Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C8CAD13588
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 09:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H/iW3yVH/8NOxTz24X5gK/GWbyqWrPL3AoPPa5qKSu0=; b=koS7/YmyznAFPmeUmjQyzhNZID
	u1s+9uTVk8pMWCNo/iIRgHqApbRaA/ho4H4z2w8H1p80B4nsAPxo5hD95LDaYqrz5KAmHgerwrCiQ
	pkS8cNcfuogDlhobxsqCp/sR5gKLdqkot8y7InN73PcfnwHaCIyQiZxxCVzDi/nHzPgeP/XGO8kZk
	N4lxEX4uU7kcSeFcYXwvI6PdqczOvcODLga9SX/zDfsLw7XXjW3QSGah7cNKjjpQo9/KCV5zB1hmg
	lCgC81HdbmRUqhXk/1etBdNUjXed+6iE3deQeMaSKXrBtLE9vunkRwQKAcmnMmLhI83EX57aZ+0ZV
	8f1aOq4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Lij-0000000AApu-18Xh;
	Mon, 28 Oct 2024 09:07:29 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Lh7-0000000AAfy-2Gqk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 09:05:51 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-539f4d8ef84so4539929e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 02:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730106347; x=1730711147; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H/iW3yVH/8NOxTz24X5gK/GWbyqWrPL3AoPPa5qKSu0=;
        b=fOcaF1q54mjQjljFUeUe1Cg/D5BNbhtQsKYk60QNd1kVRqNdWHv3YRzoLcgpuV4SVZ
         IitUkl1CuOZq13aNwvqRS1qrQyRCz8V2jKd20r82yVh0LZFUd0i5zuQuXm9dOh71wtbW
         j51qWdm7sjAUW6ThIyAX7LnyktxHhwjxY0SUk3kMAKaYMIWYuAAoPYRwgzTG2/3NsX0Y
         jAefojuXHYkUiwPBt52GEjHDYGYZkxwJBL2ie4/Ox4tFZfrq/GFB96C+cWO4FIsUodFQ
         4HSvzb1gzO1TwzoHBf00M2+LNoFFvVyeqVb1HYD4IXCwqDo9FSNs5IeLPCLMkOfq8/1D
         rqHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730106347; x=1730711147;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H/iW3yVH/8NOxTz24X5gK/GWbyqWrPL3AoPPa5qKSu0=;
        b=mDgDkRfJ3gGNRSl8Jn3EDXKQDQnUy1kY+5TNISxIzO//d+zOpMUlykJRUCp9YOquqv
         bpTRtreojcyKqF7Gk5vxU62hNzWhhQg3mwEgGy0wgZvh9XnIvaFgDKYVJdged8CeVpbr
         wJjy1PHL3+h7mpSr/J3bvz8DDn+fcgC0f4LbT+2RW64FVR0g+BKhmuPasuhzLvqKv8rt
         EMSlywp/W1wNqVMe5WScfSm4UDlM6tw+Sef+/UnP4ROl7Zqmc5Kb2KNFINeu4hFc/Qfq
         OIXidj1MHejqXFdSZoSQWEM8COHGSrkj1eE2E+VGPz1s40WKknlb/+tONT1Vp3qy6bkP
         Aeig==
X-Forwarded-Encrypted: i=1; AJvYcCVd5pKt+9nxNixTneoVbxGpQaGyQuE6x738iOHkSP8JlWknWx3XzLgW7OgzbWQTwUFWIFThTl1K97CXZ/9Dyjzo@lists.infradead.org
X-Gm-Message-State: AOJu0YwpAG97IHKu99wrYDyIUxIscaOKYNO4vkZE8J+wBvDzQY/l5OwS
	ewemx0d4J+LzbtFA/dAGmA8j0ARN4mnh/UURi7xLqktry7Xz05lJYv01IA==
X-Google-Smtp-Source: AGHT+IHVmBa4H7k9JQ/o53S5M05CX0LrglesNv2ZgvT67Tu1yo4p3z8ZUDhwTdaMItW4S/l4znHmhw==
X-Received: by 2002:a05:6512:1389:b0:539:e2cc:d380 with SMTP id 2adb3069b0e04-53b348e53b9mr2411570e87.27.1730106346700;
        Mon, 28 Oct 2024 02:05:46 -0700 (PDT)
Received: from [192.168.1.105] ([178.136.36.129])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1ad9dbsm1012807e87.159.2024.10.28.02.05.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 02:05:46 -0700 (PDT)
Message-ID: <5784f869-9094-44ce-9d18-88015c29ed46@gmail.com>
Date: Mon, 28 Oct 2024 11:05:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/10] arm64: dts: exynos: Add initial support for
 Samsung Galaxy S9 (SM-G960F)
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa
 <tomasz.figa@gmail.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-gpio@vger.kernel.org, Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
 Maksym Holovach <nergzd@nergzd723.xyz>
References: <20241026-exynos9810-v3-0-b89de9441ea8@gmail.com>
 <20241026-exynos9810-v3-10-b89de9441ea8@gmail.com>
 <c3b757c9-3232-4429-9f3c-d57ec76fb26b@kernel.org>
Content-Language: en-US
From: Markuss Broks <markuss.broks@gmail.com>
In-Reply-To: <c3b757c9-3232-4429-9f3c-d57ec76fb26b@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_020549_636161_DD0AF791 
X-CRM114-Status: GOOD (  13.71  )
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

Hi,

On 10/28/24 8:50 AM, Krzysztof Kozlowski wrote:
> On 26/10/2024 22:32, Markuss Broks wrote:
>> +	};
>> +
>> +	memory@80000000 {
>> +		device_type = "memory";
>> +		reg = <0x0 0x80000000 0x3c800000>,
>> +		      <0x0 0xc0000000 0x20000000>,
>> +		      <0x0 0xe1900000 0x1e700000>;
>> +		      <0x8 0x80000000 0x80000000>,
> This patch was absolutely never even built. You must never sent code
> without at least building it. It is not maintainers task to build the
> code for you.

Am really sorry for that, this change was cosmetical and I neglected 
build-testing.

This won't happen again.

>
> Best regards,
> Krzysztof
>
Apologies,

- Markuss


