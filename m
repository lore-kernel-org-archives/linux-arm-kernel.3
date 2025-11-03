Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFADACCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 11:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qjmy8XjX+bzyGd/5u6oANywBcBczevKHZ7vCYGJEnxc=; b=Y7Ar0xbYQq0U2/RHlcRVsMSoSX
	tFuWlvTM8GOv6XmqUxgMK7dVe+9tCBMXtV7QD1CL2u1fT3X7rZBTbXjTeQG9UnkvR/KAv9v1vEDdK
	1KS03QjgHJ3EWBrdWLNnJFDWxpe7XlewbjiPGGKyux12Ui50b1EwWwBI0tC8I21y2cI1DOSD4GNQ/
	5hwdzg8td0QETN2u3qmUtIfnVSmt1+MyQHS6kqOjj8kaQEbrfR4MJ3JnkGB2HOHDqJtyVrY+Vii+r
	ubycv62GgKbFf/hZVRsqvyOwwpewTCGqsZHLsOMRkTK0wznMuaLm+s8iJbYHfZWHvmyEPIqXLiDV0
	WWoH4X/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFsiG-00000009jpC-15kR;
	Mon, 03 Nov 2025 11:27:04 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFsiD-00000009joW-2Nmh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 11:27:02 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-63bea08a326so6187291a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Nov 2025 03:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762169219; x=1762774019; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qjmy8XjX+bzyGd/5u6oANywBcBczevKHZ7vCYGJEnxc=;
        b=qLsyfMHDlnwAEiKI+5biEKM50hwsKBwsgILqZYk62s3BWdpKUwKVr5yBpz7/5+L0Xp
         xWRPnKrCi843ULQeavduIOnqVszpRm2YhS40oGBpi1giH1j+SPNdyyo0uBQvpTaCfGmF
         IND+L/xpZf5jSLEKJF/jjpHRiTcC2IVgteHpIoDXpIhkwf0IlOYGiBzyilByeY7JYOBb
         K5gI/wu06waZd26rz+qokkV01r1nAAVOBxScMIg/7/SKnaZ0nEM9DKEYO4XzTcl0O4WR
         TPVDHkxQntcKx5pFQaJESr1IeQAUjB973/kOm83MW/r+8jMKBfsx6OteAuT8t4NL4Cx3
         3r2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762169219; x=1762774019;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qjmy8XjX+bzyGd/5u6oANywBcBczevKHZ7vCYGJEnxc=;
        b=DhXK/y0aJpBj2Y33MkJX+Xpzy5ZAihLyC3oOEC4B2UPSMC6DbOHJEjHu/YJ/KRm1se
         ZMc/FyHPr4p7pdDaZ3ajMZJC1yhVQ5z8D5XmH6Y/3ZINEiY6grmDxNmPPf2LfeM3PYC7
         xbR2Zo937UkzXN+odzXK0rg30mcjdUckVlWW+eCARbPlqgnaY7KzZdkqlEK71WWDvq17
         AEeRVJMVpA57AP3dIs/6UkATdDXOK/WYKAZOBStu14ggGILXQETnuBEmdxtwi63slayx
         +ckSdS8UlKMDBPVLX+Yilv+P3PDcyWuquCUr6+7f51+SUw6X2qefSMarGl/zGt6Co47V
         5EVQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1Q4sC+DzyVq7vyC5lLB0x/lEoN4RX9tF5jMwEc5/hDIga8Mwg1f7T8S2szvT3YZkWvxfOfgrNliEG3wfop4Uo@lists.infradead.org
X-Gm-Message-State: AOJu0YxOHd+ETgrdCogYCauzVs+scRs7UeHtvqzzoTjPGvJPa0OPSJKQ
	B8nxEohdH34hFnQTGdqCahkyF6shBQP7UMUw3sCqdMwSvutew+Sql3pteEISovyPz2s=
X-Gm-Gg: ASbGncveP+fWq4fXaPuVff0f3kBhN/oqR91pL8RLUTj/hti1xitIUAzeOsQ1t9dczKW
	unkNaMuCSCtu2h+kq2k2nJoZaJTtz9PVwMq/SmiazodbdcWA8kc8kVo9qD0uYAwArEaRmn0IPDD
	ub1ssxrHt6mRvpvQfThfMJQirWg6Hni8Wcwg8TLUCWnnxIZlzMMqaPRNsO67PHOz3AEOowiXaOM
	bXQ5+0TG3+vcm4SA6OS/1wMQ6H265wQutcLvH5hjYSYVLR7nQXb/g98l4PaxKx4sNEYs4/8VSb+
	BjXSjgpVdJv7e/MnsLhphp0HbWCLsY+OA3EdHFRghb0SkGLw9y7gd36mZYxR7DVl+wwKjRLqDbu
	WmaLjKkyUgsk7b7Be/oMqMmta+xF55mKicI6P71q72TIEnqVcgoUF+ZwhJaI8ormBVSA1NtHne2
	mFTZcwIBFuogngU8djscTRhpY=
X-Google-Smtp-Source: AGHT+IHivtvy/jRPu0I8Ces/TDhvBY7TVA9tDT88jLA028aX3ASpmqQ3KfJYVYM1rOEorR2QyolQYQ==
X-Received: by 2002:a05:6402:4402:b0:640:a26e:3d76 with SMTP id 4fb4d7f45d1cf-640a26e4208mr5484730a12.27.1762169219448;
        Mon, 03 Nov 2025 03:26:59 -0800 (PST)
Received: from [172.20.10.10] ([213.233.110.172])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-640af968e5dsm4801329a12.19.2025.11.03.03.26.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Nov 2025 03:26:58 -0800 (PST)
Message-ID: <c5c81744-48a2-4f3f-9ac3-2420af7caaac@linaro.org>
Date: Mon, 3 Nov 2025 13:26:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/11] arm64: dts: exynos: gs101: add the chipid node
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 semen.protsenko@linaro.org, willmcvicker@google.com,
 kernel-team@android.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251031-gs101-chipid-v1-0-d78d1076b210@linaro.org>
 <20251031-gs101-chipid-v1-10-d78d1076b210@linaro.org>
 <20251103-pompous-lean-jerboa-c7b8ee@kuoka>
 <b82af744-ebbd-4dc8-8ccb-c7e4f2a6b04d@linaro.org>
 <abd5b16b-1467-449c-b452-7699cbe5d9f5@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <abd5b16b-1467-449c-b452-7699cbe5d9f5@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_032701_678561_0EA454B4 
X-CRM114-Status: GOOD (  23.32  )
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



On 11/3/25 1:01 PM, Krzysztof Kozlowski wrote:
> On 03/11/2025 11:50, Tudor Ambarus wrote:
>>
>>
>> On 11/3/25 12:18 PM, Krzysztof Kozlowski wrote:
>>> On Fri, Oct 31, 2025 at 12:56:09PM +0000, Tudor Ambarus wrote:
>>>> Add the chipid node.
>>>>
>>>> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>>>> ---
>>>>  arch/arm64/boot/dts/exynos/google/gs101.dtsi | 6 ++++++
>>>>  1 file changed, 6 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
>>>> index d06d1d05f36408137a8acd98e43d48ea7d4f4292..11622da2d46ff257b447a3dfdc98abdf29a45b9a 100644
>>>> --- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
>>>> +++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
>>>> @@ -467,6 +467,12 @@ opp-2802000000 {
>>>>  		};
>>>>  	};
>>>>  
>>>> +	chipid {
>>>> +		compatible = "google,gs101-chipid";
>>>
>>> That's not a real device, sorry.
>>>
>>> I had some doubts when reading the bindings, then more when reading
>>> driver - like chipid probe() was basically empty, no single device
>>> access, except calling other kernel subsystem - and now here no single
>>> actual hardware resource, except reference to other node.
>>>
>>> Are you REALLY REALLY sure you have in your datasheet such device as
>>> chipid?
>>>
>>> It is damn basic question, which you should start with.
>>
>> Documentation says that  GS101 "includes a CHIPID block for the software
>> that sends and receives APB interface signals to and from the bus system.
>> The first address of the SFR region (0x1000_0000) contains the product ID."
>>
>> 0x1000_0000 is the base address of the OTP controller (OTP_CON_TOP).
>>
>> "CHIPID block" tells it's a device, no? But now I think it was just an
>> unfortunate datasheet description. Do you have an advice on how I shall
>> treat this next please? Maybe register to the soc interface directly from
>> the OTP controller driver?
>>
> 
> 
> Huh, then I am confused, because:
> 1. That's the same message as in other Exynos and it has SFR region
> 2. Your binding said there is no SFR region.
> 3. Anyway, please post complete DTS, so if this has SFR region it must
> have proper reg entry. You cannot skip it.
> 
> Of course next question would be what is the OTP controller...

The CHIPID block, which has a dedicated chapter and all :), consists of two
registers:

Product ID
Address = Base Address (0x1000_0000) + 0x0000, Reset Value = 0xE383_0000

Chipid 3
Address = Base Address (0x1000_0000) + 0x0010, Reset Value = 0x0000_0000

While the Product ID is fixed (fused I assume), the CHIPID registers:
"depend on the OTP value. When the power-on sequence progresses, the OTP
values are loaded to the registers. These registers can read the loaded
current OTP values."

OTP values are from the OTP memory (32Kbit) from address 5'b00000, 160 bits
in total. Even if not explicitly stated, I think the OTP controller copies
the CHIP ID from the OTP memory to its registers, so that the "CHIPID block"
can access them. You notice that the reset value of the CHIPID OTP registers
is zero. They're then filled at power-on.

This is all. I lean towards thinking the CHIPID block is not really a device.
It's just a way software gets the product and chip IDs, which is by querying
the OTP registers. I think I lean towards registering to the soc interface
directly via the OTP device. Or maybe you think differently?

Thanks,
ta



