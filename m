Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64214CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 10:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6aAPWr6sG6plHcRAb74AERMut+3PIj3xR4C7ijLuCgY=; b=h1jd2dtXjBHVr2GfeHENewuZJY
	1ui8cUg1tt6FL2PuaW6MNixkaDE/KLZMPdrVsQymg6S14p3TI7w96Jv7cWW8lZW0y0roQ0VLSWIWE
	VYd0q2aPahReCsh7q1fbm3/n6kAr/E0fpMjBAHQ7ye5Ky0kLGyWYqW0G/XONUwM0YaxCW4NxLPwzB
	ZMD9zWHSon8zzJvZNlLc8Zu+fLSbxxy7d28be17wHfGQl+ePdEZTrhg6qCUdXdpysyn/bCaDTOny/
	8XUdYn8wTlhW0WF2Wkc/Fwvx66uCTKFBTojMjZKRoeymqeuBkvLY1dDsybgWFdOpuZk9HjtVAcomS
	6nbg+MYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFs9K-00000009fbr-0SV9;
	Mon, 03 Nov 2025 10:50:58 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFs9H-00000009fbO-3uww
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 10:50:57 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-b7042e50899so719367466b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Nov 2025 02:50:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762167054; x=1762771854; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6aAPWr6sG6plHcRAb74AERMut+3PIj3xR4C7ijLuCgY=;
        b=RxhRGA743SI+0UppWxF5abgLqeczJcXhaCV922K1165jUpHYh2QUjIQPC1Mm3/g5Eh
         YMkfDErGYsssMhsUH9TKdEaM23SNYVvJpPATX19edBdw9MYw3dwUEZCss4R+9+iqyOAx
         G45fAyXWaXNHBeOJTvtN0C+H9nP2EXZArZOKtGbF60M8fHfRa2abloX7lfFjvlKSiWPE
         0bgUwMKG3+Fhnt4qK51OieeORyNnbzmkIym8bKtDsWv4S/vlt39JBh0i7ElGLLIkGO6Q
         MoaUQozilcYpC6Hy8WCN/G5yf8wQnlnvyCoSex1ho7CxgQ8e3H5HYgr6H72uHhc3go3/
         VyOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762167054; x=1762771854;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6aAPWr6sG6plHcRAb74AERMut+3PIj3xR4C7ijLuCgY=;
        b=sbtrF0FMh4icYbdVcJ5nX083pQk0J8ZDvWfanaNIhcHzeVkt4jJq90zutvx96rGKkd
         mWWiEgGUKRgDCOT9pduCdCa/OJkjkHobDhvyI80oQa0H+Lx48OAKPcDVLdo3irjfuiGt
         3uBcYUVS6SLq4FyMc8oYpAkov1epkb8MK+42fl0ApGTAtryuejU1W2xTgmbPKGqwnZf5
         9itSFu9iA7Ysy0iezM4tlUPJEhkuVpFczayLQCqC44GTXRbM5bPZCGCOnaR6QwZQJWFM
         /16+BgFtbKylRPcSaZ7OEH+4R8w8NzViMCYEjSt9zJVL4p8FjEhzPskOGBC24dD3NAHv
         U56Q==
X-Forwarded-Encrypted: i=1; AJvYcCUBfyAsZPZscXG5bcGsNIxaLFmRw5FLIjYKxLjFafxPOCGwkkDWDquAG4h63IOv6GPkVCjRUbTbYmOLoYk+s+RK@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9LJ0lwtDpqIhMLqjrourOeqNTI9g+0KD6OeEnJ878MHJGB8ks
	yqMHtpWceyT00Y2pN2PJ6X8hAjm+824Ac0xedslkLhFYspDAaBgFP9u65KXzei81fs8=
X-Gm-Gg: ASbGncti2/0BO3pkIL4r3cmYxM9oe3IIkxjEC3yAU4XLzern8Q08+RklvPwCHy3IjIM
	Tj/Sr5EgKbCoYgsnbAubZhngXc6PrI4vpL+ZJxyss/aHkIaE8jExG2Vw668nDUCAMklybHImZJq
	U/ppaxT8mlgLRpltqghX/r1UgkuvDimsNw6aALOSPVHxZ1anaWIt1eI/53fN9B6tdiAQCeOp78z
	Kwt7GN82SJ/YD6pXzc9g91okge/P8soaViMnzy4T8SL6T1loHaC1uJxjGGyzwV5JduGujUZ96if
	Y6owQtfWdGwAclDF4d9D58BxDCnChtXSsyyElrR/Bszlx/UAadF++ZrfyVYvgJrOEsc8oqKfQST
	fS7bwYmmxcGYxKGIUsDQlM57c2f5w3cdHOJxZVjOwzXXqPGummKc/aCpWOy2ZllG4R0yTKnVnZn
	7ZLb3PFkepMNJq
X-Google-Smtp-Source: AGHT+IGAsmHIJSxBw8Ivjg8wV5c1LPLNuyYfSnhOFaJTNn0jDUJaTnBR+1poGrO0LFeXhX5G5jmT/Q==
X-Received: by 2002:a17:907:e98b:b0:b6d:8d8d:3010 with SMTP id a640c23a62f3a-b7070840e1bmr1281242166b.56.1762167053554;
        Mon, 03 Nov 2025 02:50:53 -0800 (PST)
Received: from [172.20.10.10] ([213.233.110.172])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b70b374067esm411112266b.64.2025.11.03.02.50.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Nov 2025 02:50:52 -0800 (PST)
Message-ID: <b82af744-ebbd-4dc8-8ccb-c7e4f2a6b04d@linaro.org>
Date: Mon, 3 Nov 2025 12:50:48 +0200
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
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20251103-pompous-lean-jerboa-c7b8ee@kuoka>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_025056_017414_74E90E82 
X-CRM114-Status: GOOD (  17.81  )
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



On 11/3/25 12:18 PM, Krzysztof Kozlowski wrote:
> On Fri, Oct 31, 2025 at 12:56:09PM +0000, Tudor Ambarus wrote:
>> Add the chipid node.
>>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>> ---
>>  arch/arm64/boot/dts/exynos/google/gs101.dtsi | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
>> index d06d1d05f36408137a8acd98e43d48ea7d4f4292..11622da2d46ff257b447a3dfdc98abdf29a45b9a 100644
>> --- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
>> +++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
>> @@ -467,6 +467,12 @@ opp-2802000000 {
>>  		};
>>  	};
>>  
>> +	chipid {
>> +		compatible = "google,gs101-chipid";
> 
> That's not a real device, sorry.
> 
> I had some doubts when reading the bindings, then more when reading
> driver - like chipid probe() was basically empty, no single device
> access, except calling other kernel subsystem - and now here no single
> actual hardware resource, except reference to other node.
> 
> Are you REALLY REALLY sure you have in your datasheet such device as
> chipid?
> 
> It is damn basic question, which you should start with.

Documentation says that  GS101 "includes a CHIPID block for the software
that sends and receives APB interface signals to and from the bus system.
The first address of the SFR region (0x1000_0000) contains the product ID."

0x1000_0000 is the base address of the OTP controller (OTP_CON_TOP).

"CHIPID block" tells it's a device, no? But now I think it was just an
unfortunate datasheet description. Do you have an advice on how I shall
treat this next please? Maybe register to the soc interface directly from
the OTP controller driver?

Thanks!
ta

