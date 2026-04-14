Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A350ED7B9A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 10:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HjjP3x2s4FAG01oUrkjM+enP8FGX1QBSjIAMGgLldEs=; b=Fdl7iTE7+MJeWFHrYbOvz5NxdH
	vkEYvW87DuLRzB8GKlu3MXi1tNC27rXgVPbBnY5ObFG1PlNHtOyb7q75nwFWCjcTpfZe38ApKp8ba
	jcgQ2zmRER5D4zgtqH+uOuWz6wSyoV0imm58bOff9omZMRHZDmGkQlJSpiivPwAEqvmtaHzL6fLIc
	tANQ1ccQgJQA37DMVxfEZCNnuBIJR8rWC3a0Uz+dp7OUvaZUyTDrqaScerllOsf6iJLCy8tgbGQpy
	D8/ZpG9vjUVfb6uudaM7sIlGbcx59GDHVxHUs/uE4OJOJZ0YSzcQ4AAmhZo8K+vAbo64S9nbDaj8O
	hCADQVAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCasr-0000000H86b-3fvp;
	Tue, 14 Apr 2026 10:20:41 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCasp-0000000H85l-2E9W
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 10:20:41 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-43cfe71e5d3so4102739f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Apr 2026 03:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776162037; x=1776766837; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HjjP3x2s4FAG01oUrkjM+enP8FGX1QBSjIAMGgLldEs=;
        b=LcDNaltPLH0QsvlJoJGUo9o3H1j/8h+8yzTU7Y8C/sggj7kawygSs9G41yuNDbgk3g
         VIMtut+leQx2HcB87Lu+PQEMN6i5raf0rno0gLb0d3/r+Qp43x2ayV4cFsy7CX0xfte7
         HXS+SkeZyYaMK1ysWPawDpTmA8rhFEEtF/IWSAwGW8lOVrRd951t6PNxDmhWdd+ocwmY
         S/Xxr6POvFMiw7GsyV0Wd6gbdTVyONHU15vrCBTJIhZtd7CNXVf9iYMgUEpTSKio5llt
         aNNIsWiUgFmj0okde+wM+P+8ON8twm4p2GHp//4PNvje8wBW944SYAAn4Jg1S0AY4ANd
         dDbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776162037; x=1776766837;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HjjP3x2s4FAG01oUrkjM+enP8FGX1QBSjIAMGgLldEs=;
        b=Dnhejh/j8BdFhkrNAqijOnILXSaEXTeUNXoH+AM2f3VVk7X1fz/bI8xxjF6nkI1J1C
         FLFWW7Mq3t0HH3JBYdVNQH7fjUTuxQRuJztgzsjBTBT1Fbiw5A2s+/gakXm3pT+fvV80
         mheUprQNlWYR6bCjRYD11vFzMe2BV86YrgUly4LIumF7PUngZj7ntxtADZOGx5Y3NUZ4
         9MBL0qmZHopAzBzySWxFC9ltles8pE2ZJE9QP1dseOG4DHfT6ky8SH+XVNTCQSm/UA44
         w1O1QoxDbpK8foPaySK97KEF0sDUsAlZWfJiuKDvSUA0m/m/cTN//lzN7JzEHG3AiPR1
         tNWw==
X-Forwarded-Encrypted: i=1; AFNElJ/2cSD//5zfKG0Ou/BzN74nWwdCZ4m7yaK7YENBDm/ssXKpdCl6sfai2eE/S7qmfiRQ+AnIoiqHQh1LXw0baYlu@lists.infradead.org
X-Gm-Message-State: AOJu0YzM75G6VGGqi/ZumwHyzkpsKBEDpPTAoCIGrpyWjusse7AgvAep
	X6+lvXQhc98YsExbQ8WQf2k6eLt9B06CoHA/esJiWeIKr34np+rTeTR+xtRPSbfbgVq55Mn8UCc
	fwfQNhfQ=
X-Gm-Gg: AeBDievNZDbIWqPh/hXjKZYAG1oupdSEZedNQkNUdDOiesxNkeCjZd2eOt9s+53gXQs
	1TuDQeF85GofG0JeHE4gIWYov4bZ2uz+xEblMQ5iYGO4THnH3cRpbwchwz4l86nYgeKUOTjMcoZ
	Qmm8+03h2NURMiFqGgVwW2qwxK4c3RhE5IhMQG1bD8uXujVt/jmFnrbyWSEc6awRQBwOodU342T
	fQHJXNOs+SzZf5osKFHkxXk/nqIlFEBXGm4zWDAGWMmo9rIzwi+9DfWUYI/G2AAHcbg7CptrZua
	YJpdjxZE91g7jEJQUd+JAr1t22iR8ST1SAW4AC1+npQ97ITE0UJiVqxuIAAT6mzK0lGAGK3Gkzc
	g45Lt1YHxFBmigk+TbLTzSsIApqZQhyYOUDqhdfdwuRwoBCwUhdOf2uK/F/kul1yqVHNLZdhJz7
	LSe+X/Wmw6i2paEvydtCFvU+DHXqfKcgbOTFUyaY2tXw==
X-Received: by 2002:a05:6000:1a8d:b0:43d:1bf6:30f3 with SMTP id ffacd0b85a97d-43d6424c4f6mr24710460f8f.14.1776162037022;
        Tue, 14 Apr 2026 03:20:37 -0700 (PDT)
Received: from [10.11.12.108] ([79.115.63.48])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d73e36e7csm20342473f8f.10.2026.04.14.03.20.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 03:20:36 -0700 (PDT)
Message-ID: <5797be19-8886-45a2-bfce-eb7d5f0df6c2@linaro.org>
Date: Tue, 14 Apr 2026 13:20:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: exynos850: Add SRAM node
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Alexey Klimov <alexey.klimov@linaro.org>,
 Sam Protsenko <semen.protsenko@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Juan Yescas <jyescas@google.com>, Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
References: <20260413-exynos850_sram-v1-1-7fda5b7fb7d4@linaro.org>
 <2ff077e1-8983-4a41-bb21-5e4140545aa3@kernel.org>
 <DHSR70EGYY4N.2EA2HWIXJR7QR@linaro.org>
 <4c6a92e0-15a1-4f82-afc9-542f5ad9d2df@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <4c6a92e0-15a1-4f82-afc9-542f5ad9d2df@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_032039_622427_6873C7D0 
X-CRM114-Status: GOOD (  18.78  )
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

Hi!

On 4/14/26 12:08 PM, Krzysztof Kozlowski wrote:
> On 14/04/2026 11:00, Alexey Klimov wrote:
>> On Mon Apr 13, 2026 at 4:23 PM BST, Krzysztof Kozlowski wrote:
>>> On 13/04/2026 16:52, Alexey Klimov wrote:
>>>> SRAM is used by the ACPM protocol to retrieve the ACPM channels
>>>> information and configuration data. Add the SRAM node.
>>>>
>>>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>>>> ---
>>>>  arch/arm64/boot/dts/exynos/exynos850.dtsi | 8 ++++++++
>>>>  1 file changed, 8 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
>>>> index cb55015c8dce..cf4a6168846c 100644
>>>> --- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
>>>> +++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
>>>> @@ -910,6 +910,14 @@ spi_2: spi@11d20000 {
>>>>  			};
>>>>  		};
>>>>  	};
>>>> +
>>>> +	apm_sram: sram@2039000 {
>>>> +		compatible = "mmio-sram";
>>>> +		reg = <0x0 0x2039000 0x40000>;
>>>> +		#address-cells = <1>;
>>>> +		#size-cells = <1>;
>>>> +		ranges = <0x0 0x0 0x2039000 0x40000>;
>>>
>>> You miss here children.
>>
>> Thank you! I guess I should convert it to smth like this:
>>
>> apm_sram: sram@2039000 {
>> 		compatible = "mmio-sram";
>> 		reg = <0x0 0x2039000 0x40000>;
>> 		ranges = <0x0 0x0 0x2039000 0x40000>;
>> 		#address-cells = <1>;
>> 		#size-cells = <1>;
>>
>> 		acpm_sram_region: sram-section@0 {
>> 			reg = <0x0 0x40000>;
> 
> This covers entire block, so feels pointless. Maybe requirement of
> children should be dropped. What's the point of having children? Why
> does the driver need them?
> 
>> 		};
>> 	};
>>
>> And then later reference shmem = &acpm_sram_region from acpm node.
>>
>>> Also, 'ranges' should be after 'reg'.
>>
>> Thanks, will fix this.
>>
>> FWIW this commit is a copy of commit 48e7821b26904
>> https://lore.kernel.org/r/20250207-gs101-acpm-dt-v4-1-230ba8663a2d@linaro.org
> 
> 
> Huh, we should fix that one as well.
> 

On gs101, likely on e850 too, ACPM parses the SRAM and discovers at runtime where
the TX/RX queue offsets are in SRAM. So we can't define static partitions in DT.
I remember that I thought about extending the SRAM driver to add dynamic
partitions (clients to request the mmio-sram driver to create partitions at
runtime), but it was just ACPM that's using SRAM, so I didn't need it.

Cheers,
ta

