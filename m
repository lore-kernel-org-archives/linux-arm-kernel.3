Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 474CDCD8C92
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 12:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0sf15Qn18zljQFqjYtY+ttqovVDRkyxEeVFCISge3H8=; b=V+ccI9J1BxvLNhE1wu8S1kodTy
	GGtIZuSp7QTkLhhIQArwXpwJeDM0abbqVQe+OktWuBFZsOhwYJ+umkUm0fhM+v9slVQT+51/UYBag
	Dq99xFe4flwDCkgaUsCl3v+hiGYUkPkofNxbBFGFKMUlEhe+gj4BxG1XOmQ39OCFuwPA9CAEFwjbg
	Ubnvir1RUY85fWY+ncP629UdTwrfG8WQLSvnoB9nf9VECY1fXBuimnZlfbaQNKYNwcVrXS/wJ1inn
	6uh/vQvwGe0Cwscp3xN2RHlP315rFK3ZDjV4MyZIHCNQon/pkP73EmlX69tDAmshiBZPWXAewZbON
	Tc/Irw0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWvOd-00000005VgR-1UbM;
	Tue, 09 Jun 2026 12:17:31 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWvOa-00000005Vfd-2AfE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 12:17:29 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-45ef4223be7so2923175f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 05:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781007446; x=1781612246; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0sf15Qn18zljQFqjYtY+ttqovVDRkyxEeVFCISge3H8=;
        b=XpdnU2eaLnbk6SZpZi7gKmog9EtL10BaWscjzUedJGSiXKr4vZ7NPnhBBHN3HUdqVE
         HShqFJjz6BsBnHzVcKq9d18xUdYgpBvcyT3bZ2oLqjwH0HyiS3ZYJQaa71ecLIDuMjB3
         g2bfjpf0tvbSzb36FGlfqXMPL2lMtze6Eg3WOd9kRnXShAq/u6vm/U91mUOwEgSkMCWW
         8jutNoy3FIklOxohEGuXw4aHPkfdWWdFfZBEmYpEa1FA5FfVBwRC8+AtuDQAokPYHaJa
         ayQxxhAudrFFaN/4ZXrntTPd5Bz6xShEt7Sj0NwljFFIkhWXNMXy/A0sMjmLY0+00Ykr
         7+8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781007446; x=1781612246;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0sf15Qn18zljQFqjYtY+ttqovVDRkyxEeVFCISge3H8=;
        b=e7zdNDR6uecGVxC6E/ENYDMo89RyiB5pxOuESl1N5g+Og/jV/bsgNWJJ7FzrOhsJrj
         b8VLK6u8JFdXMjDh4jHSNjCccoEgq5YYTPsjr7IR801LtwI6c8vPFFfBotykwSNKx/2T
         bo5NoK8q0ufEELPL6mFC9Q6pJQ9EM3Le2Ik7HMg9ommsEM2EbR4gsCDCDzaC2MOKszV2
         Z8gA72BadySk8vIQAzDTOBJRlbBr0YLo494CRzSD2gK/09ejmigNTy5MRuTlcMxuL9PY
         tk6Md7YNboZ7Uvc+gbLtm0Q1C6ukqaUill+AMyUEUR0gxHaI5m/pc9N6L8djV5RE5AUA
         6eHw==
X-Forwarded-Encrypted: i=1; AFNElJ8B/c++C/E3yRZNTWec2eZlYGnZzSElztY9DKITtRbHIwaeluaBRZjaJBD1s6PSENAO5OtfR7jeeLKXGvUT02Ua@lists.infradead.org
X-Gm-Message-State: AOJu0YxexZ3BfAJusZcqxrFNzcjvHo3tf6BRWptoo72f5FLUyV5tVecK
	3JHX7jywKcuKuAuOxNyzgu5C7t1P/NIESyaH73dBY4mXUgoXo3pYNNQsuTx5WdHl4eo=
X-Gm-Gg: Acq92OGtXL2APZlgDoM6AXA/EImR/89cRE1pz3oaQOiFvXN/I9UCeEpKCTdJqD8cLbi
	b0yr/ly8Ya/K5aQ0h3K2N1ICR6+xMHiqDQ2Je0ZYaXhRqW0EZNK1VauBC5rziEqtNoSn4GdzZG6
	Z5fNNGWjO6jEe7gIEZhoRCc4Zk7ZopX78V74hfzTx6YUstvQlao9RoolREjzf+PRGEB50VTRLBq
	DEyJMTCViIdWyJleJIeAf7GcpU/cxuay+XYHkioBhcCoV4ydgYxjuhTfZqUNGzXfjaOBTt8ui+2
	jLzWlvRd3UqgIQSqIxowftjwmJCJaRIRDEdMILVsHb8zFEggEkWyEpS5PXRLtkh3Ed3jyGVAtZe
	m8qj2WHuos36GCPJG3nhXLyxDUZr3wQ1zPfSFud9gsA0QEO3aWdfIbW0PGfUL/C/dgLMxPm1K5P
	CAr4br8K1rcHn2blcpbyFhIDKHxi2+Dyid0AbcL0TzC5zDAR8mKw2q
X-Received: by 2002:a05:6000:25e7:b0:460:3233:beef with SMTP id ffacd0b85a97d-460566dc381mr3315017f8f.43.1781007445883;
        Tue, 09 Jun 2026 05:17:25 -0700 (PDT)
Received: from [10.11.12.110] ([82.76.215.73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f351ac0sm110033645f8f.27.2026.06.09.05.17.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 05:17:25 -0700 (PDT)
Message-ID: <055b5f99-887d-473e-8211-aefb253cb549@linaro.org>
Date: Tue, 9 Jun 2026 15:17:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 4/5] arm64: dts: exynos: gs101: Add thermal management
 unit
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: jyescas@google.com, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-hardening@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260603-acpm-tmu-v8-0-0f1810a356e6@linaro.org>
 <20260603-acpm-tmu-v8-4-0f1810a356e6@linaro.org>
 <08d7299968e14e5fc07fa4791479abd9a2b11c2d.camel@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <08d7299968e14e5fc07fa4791479abd9a2b11c2d.camel@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_051728_586010_6E12711D 
X-CRM114-Status: GOOD (  12.52  )
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



On 6/9/26 2:44 PM, André Draszik wrote:
> Hi Tudor,
> 
Hi!

> On Wed, 2026-06-03 at 13:00 +0000, Tudor Ambarus wrote:
> 
>>
>> [...]
>>
>> diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
>> index 86933f22647b..b6866ef99fb3 100644
>> --- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
>> +++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
>>
>> [...]
>>
>> @@ -639,6 +647,15 @@ watchdog_cl1: watchdog@10070000 {
>>  			status = "disabled";
>>  		};
>>  
>> +		tmu_top: thermal-sensor@100a0000 {
>> +			compatible = "google,gs101-tmu-top";
>> +			reg = <0x100a0000 0x800>;
>> +			clocks = <&cmu_misc CLK_GOUT_MISC_TMU_TOP_PCLK>;
>> +			interrupts = <GIC_SPI 769 IRQ_TYPE_LEVEL_HIGH 0>;
>> +			samsung,acpm-ipc = <&acpm_ipc>;
>> +			#thermal-sensor-cells = <1>;
> 
> Vendor-specific properties should always come after generic ones
> (samsung,... to move to end here).

Yes, thanks! I'll address this after I get some feedback on the driver
from the thermal maintainers.

Cheers,
ta 

