Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17464C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 19:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pU5W+dP5hQjBmGloMvFYYbU1gFy16R79+oo7OXi+20M=; b=OKPFBJtzJgVVJvqnQmwcSat/LH
	iObkh0KQ9cRLHnEr6cVFjZlmMR8ICL0EmW4YBQXBfV1jeoVvBzXqSEfSDW0aLa1PDLVTXiXcgvlHv
	rnxUBBPkzcAom1qw+f0HbFaHLaZDHbQRYdWyQGGNt9o3AkZG4h7XxO9TofcL69XatoKw9djg019Jv
	9dU56wvc5RjYhAkycLffDmQ8MQzSN5eRXt5F6QPN8rooFxVy0niV0JtWhgKWHUU3i9hzbvOB3xLcf
	J8/5+gL44JGNGM+/Dhhhwmz53Pe7iNIVqhVZVzm9NogeLn45GarDAlmcuO5N17Jd6LfTPOzSDCNil
	TdCBNBjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmdps-0000000EvcP-3rnv;
	Mon, 24 Feb 2025 19:09:48 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmdoO-0000000EvUc-1xrn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 19:08:17 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4398c8c8b2cso48416115e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Feb 2025 11:08:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740424095; x=1741028895; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pU5W+dP5hQjBmGloMvFYYbU1gFy16R79+oo7OXi+20M=;
        b=lIWk6zD2m22+GbIloMQMmcCVGr+0D3iv/NjoS04BsDNX8CTB4x1DgFZm7g69vDMEM0
         V0DzLJ5GeCANJJRtJTWCOPO1uaLUCtOLE7cUfbZYHucQW/ToDs1xxq/9sApRmQ9dwWc5
         j6FAMwOTND5GsZfgB6xEHOTYkaaCVQluyGk66sr9BnO6UUYkE05W6/GL+ZcnIpyik/4T
         JR0jx6dZxefOJiQ2dNLJtLzRSnlfIos97DdYciwCc5zB2kj0bvuUztQmVJZJhnLWM6wU
         UamAXwl+r0sZ0Ytr8v6dpaRMuBxAjIuIRbGkf5/BZctUSZOIt1F8kT0BDX4MluuTDvSS
         3wZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740424095; x=1741028895;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pU5W+dP5hQjBmGloMvFYYbU1gFy16R79+oo7OXi+20M=;
        b=MXSDF+TASTbx9N2qlJYMa66cZXO19c8F5y1/XyKUStKYyCu6+ZEbhHcTYDIk0hb4N+
         NnTblU6nrKSj2zE7kPvGtImwb0nZZC7t/Dy8KqcqZR3qxGLOPoKXtoftswgGAieYhJqE
         5lsGwb0pKnKpN0XE6Wo/nqmx67ZmvmSqBwx2XvCiO1J5NjiXT74V+xAWG9yc2seXUh5y
         UyQg6Dx5lCWTFVmQ089NgHM2qmlBeDrrfXZvN6jtgSKCQv7GeXKFG6MjWK3NKJRxt5tH
         HVv6gGgObidHOjIikDw2ZOhJR7OpgDVteYZTBZF7vcoWF9QhyyUCBr+oAILb6c1T8inx
         xJEg==
X-Forwarded-Encrypted: i=1; AJvYcCVYvYr6Ix8LyV5YidnNQLiTUI3zJhWfNciMWomV8XZrhaYHDVzEQyiyfaPYTnR2xstPzw1+8PhKlHASN3H1vAVa@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6nxpaUnsHpWh1lDNOTG7XiCKNRdhAJ1yUu90hNYA8F0ILZar+
	qL6Aeq+MaEVRq+erTBoXtnHJsFxcZx4174B+bqyn2/SKPNz0IceR
X-Gm-Gg: ASbGnct+bSipyfmYE4d3zvgnLEIhzYDgcEWbYZgipwc+rSJHUu4eig3YqVlVyeN3coD
	cKWR1TB4kYm/ZuHHOI+wBU5kin5X5xxX1gKYaaC/OldkNMPGHHF38cysQbkxYsj8O9kGfS7qjfP
	Njx45ANcNvfIQmIhp6NdiivZAOF/5ty+pN/KrLI4BgEq2yGtlAPRyBfSm9uFp5Ytzx6JwoPJWl2
	kU/fAQzyRWCEW2ZTqnq0kqULKmhVzovPSo8DQdZov4+ezfguSFE4WUQE9VVN4klUq6mrHSErOVn
	sx4bITKRdlzQlTc2CqaaGgqQb0mvz24KXtGP03ctOmVXJJpnsC+wB/I=
X-Google-Smtp-Source: AGHT+IFMZpSkj8mOeTbZpxScUGNxroU6s1DGkIhvD1LVcsUzWU2LZzSOcO2UmaPQci+OsYqbI2Wf4Q==
X-Received: by 2002:a05:6000:154b:b0:38d:d666:5457 with SMTP id ffacd0b85a97d-390cc631b04mr259493f8f.42.1740424094433;
        Mon, 24 Feb 2025 11:08:14 -0800 (PST)
Received: from [192.168.1.143] ([82.79.237.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed1d552e7sm8482966b.48.2025.02.24.11.08.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Feb 2025 11:08:13 -0800 (PST)
Message-ID: <36ca7549-aee7-4f14-9311-77978a42362a@gmail.com>
Date: Mon, 24 Feb 2025 21:17:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] arm64: dts: imx: add imx95 dts for sof
Content-Language: en-GB
To: Frank Li <Frank.li@nxp.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250211225808.3050-1-laurentiumihalcea111@gmail.com>
 <20250211225808.3050-4-laurentiumihalcea111@gmail.com>
 <Z6vcBvs4xGQ+pGCJ@lizhi-Precision-Tower-5810>
From: Mihalcea Laurentiu <laurentiumihalcea111@gmail.com>
In-Reply-To: <Z6vcBvs4xGQ+pGCJ@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_110816_511075_461756F2 
X-CRM114-Status: GOOD (  15.85  )
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


On 12.02.2025 01:23, Frank Li wrote:
> On Tue, Feb 11, 2025 at 05:58:08PM -0500, Laurentiu Mihalcea wrote:
>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>
>> Add imx95 DTS for SOF usage.
>>
>> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>> ---
>>  arch/arm64/boot/dts/freescale/Makefile        |  1 +
>>  .../dts/freescale/imx95-19x19-evk-sof.dts     | 85 +++++++++++++++++++
>>  2 files changed, 86 insertions(+)
>>  create mode 100644 arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dts
>>
>> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
>> index 839432153cc7..27f64e333e4b 100644
>> --- a/arch/arm64/boot/dts/freescale/Makefile
>> +++ b/arch/arm64/boot/dts/freescale/Makefile
>> @@ -282,6 +282,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxca.dtb
>>  dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxla.dtb
>>  dtb-$(CONFIG_ARCH_MXC) += imx93-var-som-symphony.dtb
>>  dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk.dtb
>> +dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk-sof.dtb
> look like should use dt overlay ?


can you pls explain why you'd see this as an overlay?

(snip)

>> +
>> +	sof-sound-wm8962 {
>> +		compatible = "audio-graph-card2";
>> +		links = <&cpu>;
>> +		label = "wm8962-audio";
>> +		hp-det-gpios = <&gpio2 11 GPIO_ACTIVE_HIGH>;
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&pinctrl_hp>;
>> +		widgets =
>> +			"Headphone", "Headphones",
>> +			"Microphone", "Headset Mic";
> Generally, align to  =
> 	widgets = "Headphone", "Headphones",
> 		  "Microphone", "Headset Mic";


sure


>> +		routing =
>> +			"Headphones", "HPOUTL",
>> +			"Headphones", "HPOUTR",
>> +			"Headset Mic", "MICBIAS",
>> +			"IN3R", "Headset Mic",
>> +			"IN1R", "Headset Mic";
>> +	};
>> +
>> +	sound-wm8962 {
>> +		status = "disabled";
>> +	};
>> +
>> +};
>> +
>> +&edma2 {
>> +	dma-channel-mask = <0xc0000000>, <0x0>;
>> +};
> Not sure why need mask edma2's some channel, can you add comments for it
>
> Frank


sure, can add comment in commit msg


