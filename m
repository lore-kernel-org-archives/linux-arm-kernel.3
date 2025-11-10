Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37B9CCCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 09:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yy2Y3SJbuc6h3iInMfmhynFq9n8Y39FAnrKgiWA6qd4=; b=msOPZu00i4NUivzrIyptbx1rYl
	JC6cr6o+B/fWoQKdhOqR4MPhd39C68KBbNVAWPqFYV5IxI0hRJ5c35GqNAOhOLf0wDMslNeYQIZid
	HxuqRC/+w5CNA1WAWUmO4xB+BMAc5QfOshpFYpq1PMCzPVYIyeJ/oVVG9K4w7WjGdTSgolAHDu1ZU
	X6GjxpUTRtmjzyZNV7huIfYtr/ePea2EfhOvsLarWEFPJnZGZe1cicOsdoyMS0SIcK8TEeswUzUbd
	WvW0tg9QLucWYX4TvsKM0RmK5lHcM4oFmaHA+S+IyZ4hPxtcmov0btJwlhQncYWfr2oJPUvDI/dcR
	lW9fU9CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIOCv-000000055qO-3rP9;
	Mon, 10 Nov 2025 09:29:05 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIOCt-000000055px-2B9g
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 09:29:04 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-477442b1de0so18308825e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 01:29:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762766941; x=1763371741; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yy2Y3SJbuc6h3iInMfmhynFq9n8Y39FAnrKgiWA6qd4=;
        b=NcQMtvf/WUiMkrWSfQvA6Pz+uEYYPYbL9tsdGXBes+NGcYn+V/m+1UfPR7ntIT7OUc
         QFT0CiLbl/DVZ5s9c2zxVUxLDO1ePdActe0PR6WE+/2kQeaBuNYj3OmZ6m7n68KesnYZ
         nHYWdGRtOXrrd+8Qwrzw4YcOqQVJoRNfDee4Dy7v2vxZRM4QzzNT0S6r9mzLvPklJWYC
         EeDC3WAsTy1j2PGHQAoPwAF47qTXOrbJXISi+pbn49NNyuoSY99O+3Gb5nnhc+TVDMXX
         hM32kOBSG5uxQ2hnZTboNAYR9oOm2RF5yY/oh3huDil/kY/u5qh4wK1t8XfzXe6InYHI
         k0rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762766941; x=1763371741;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yy2Y3SJbuc6h3iInMfmhynFq9n8Y39FAnrKgiWA6qd4=;
        b=BFD+x/VcM7zJg47waA9JmFDUqRjIxwxwfdqsJqXscJMJGjJs5i8lVcqqL99upXjOoQ
         Qh1HW6qff/EB6NMBDbHW1oDr3Mpa6Nw+4I9zdUdjReu9m2Urdhl7HpXBbCP+qFuH0q54
         2s8pc+C6U8OZTDMeLkM0ptB4qYoq83kBSxfjBx6aBOZE4wpLsT7G83S8KSjoo89Yaenv
         5Yjy9KgQv27NK/eKAFVJpNPNNvRv2jHOQrVmNb1tL+gZ+Bw/46PrSAB2z7dAsuXkqsrT
         0WJ72TcguI3vFRimkm7qywdmtI05qlx+y31mRL6X6aBfnaFDhRWuy3oQFiPkVJxkIjfz
         yNug==
X-Forwarded-Encrypted: i=1; AJvYcCWj1gRzbSuJT2IcJX8EHO50gqGVbH8uC+rD7DlTz5po7y03SAbNyBkU/DDh5w62xkQLFBkcIkoaasWQGMvVXkJo@lists.infradead.org
X-Gm-Message-State: AOJu0YxJ8NuFsBR1w5O7fRlWOQLqxoZpvE5gMxxoqypxr5M/VsMNJ7R+
	nmzo3ctETxqkps3nUxACU02u+CCvzbCfoYIr+dAi1Zat6TWdJkPJ9GD911cbpfKrN44=
X-Gm-Gg: ASbGncvOD/jYYXX5/67UAU+Vo5gTnOGz26s61rhsQ7XtJAg54AnsgXX5gw6yIwVEuoY
	WbH2MOMLtnQgm+Yr2asoYdB/8xu9yyOHJ4GuLnaF6hX0WILz8dx2llyDUtQXh1aL9/1kWuWs+cq
	II6j6s0PlEyHLqGEy7WWyyEHbSlL8XZhFIAwD5nU1xESSDS5j3Rdsh2J8h3gCextZM5GjMW2xja
	RKQdvJ628cwc2FFpqZeiz2ciRsoTK4D/xMemWBJ2cwT1ryIkS0vCkwKAZ6HmQc06I2qYekNs+H7
	syZNvJm5PomKcDqxXWaofwTNDbMbvTA7CpsVdcUotWW/2z2sDhBuRkHdPJqG2Ky8BqHg1saB+op
	6rtpCqb9fNILToDY+QI8RQ77oMK8yYlwJVwqrVKDuhf28jxgg5USyRzXsRpL/QPI2Gqv1EP006i
	3iUZrnW93VMDMQ+bPs
X-Google-Smtp-Source: AGHT+IGRrEV2Y5FWsA2ScUyXO8LRGfeCzTu8A6LXyew1cnLNeQXucI/waFNT0uIfIF1Jhc8bs3HOiw==
X-Received: by 2002:a05:600c:4453:b0:471:13dd:bae7 with SMTP id 5b1f17b1804b1-47773277296mr66813835e9.30.1762766941281;
        Mon, 10 Nov 2025 01:29:01 -0800 (PST)
Received: from [10.11.12.107] ([5.12.85.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac675cd25sm21324511f8f.22.2025.11.10.01.28.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 01:29:00 -0800 (PST)
Message-ID: <3a2f9b58-bbdf-4977-b06b-9f43a4555274@linaro.org>
Date: Mon, 10 Nov 2025 11:28:57 +0200
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
 <b9b10943-0ece-495f-a6a8-403fc1ab9213@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <b9b10943-0ece-495f-a6a8-403fc1ab9213@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_012903_591524_8C5E4609 
X-CRM114-Status: GOOD (  22.34  )
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



On 11/4/25 9:14 AM, Krzysztof Kozlowski wrote:
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
> 
> So chipid@1000_0000
> 
>>
>> 0x1000_0000 is the base address of the OTP controller (OTP_CON_TOP).
> 
> 
> and efuse@1000_0000 from your other patchset and your sentence above.
> 
> Please add them to DTS and check for warnings.

One would get an unique_unit_address warning, yes.

> 
>>
>> "CHIPID block" tells it's a device, no? But now I think it was just an
>> unfortunate datasheet description. Do you have an advice on how I shall
>> treat this next please? Maybe register to the soc interface directly from
>> the OTP controller driver?
> I think in the SoC it is impossible or at least never happening that you
> create two devices for the same address, therefore either chipid is a
> device or efuse is a device.
> 
Right. The ChipID "block" does not have its own registers. It references
the OTP registers. I'll describe just the efuse device in the DT and
register to the soc interface directly from the efuse driver. Please let
me know if you think there's a better way to handle this.

Thanks,
ta

