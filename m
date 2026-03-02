Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AD57D58E73
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 08:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pzgC4aUzxFSpLAMwn+L0pn5MDObG9dJ9EJftg3QZJdc=; b=wYpcbBF7CjSsfF6S3tu6ogChdf
	UGbUA4shT2d/ACDIHSW4bwAw0qUYtdGiLrlCKDbmh85VRbp6IfJb4P7j4BffIgmlBB+u8SzsOWDZF
	xiR+TkPVAG1UqrN4aYix9IhEZZszlkXCgIpGbIgihHGQoIPv602jmk/ochPQKqeluo87Rn1MRNN/a
	WzodnOtrsU8TRm1LWDe+H4vxSi4cddFfuKet6Zyb0NWyHK+7uq2Ol+ciDXWsEWgbKRqDRz0rvwoyc
	OXAa3oWUTSTivqeK/gzgTaPnyX4z2Jo04gtvnh7Tk6kEF3eXI6YyQpNPr39cQUCskIyTFFhyFPzw4
	t95L+FwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwyI7-0000000CUqg-1OiG;
	Mon, 02 Mar 2026 08:06:11 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwyI4-0000000CUqI-3x2k
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 08:06:10 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2a9296b3926so31339425ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 00:06:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772438768; x=1773043568; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pzgC4aUzxFSpLAMwn+L0pn5MDObG9dJ9EJftg3QZJdc=;
        b=JrSkmbMMGlcwYdNGdnK0fUqxRBQmg6i+4EVLTXPpKsRaDVPURvrRhhYAWRtM8mUWkL
         IlvENwKkdPMN6exV2rR9H3+S0GxOOeB8Ip/K3jLaKNVdNhbdXy8Zf58e5vMl39gNsCo0
         979Zi/quLs1K161pvm7rQj921RroOvzZk9yT+LR70IlT6K/JvNwHGrXE66rja5ohNDqB
         cS8NU/L2LdTgveCxW85BjBxcE21GLQGldfMM2F87fE3wpQnMkwvp8orXdrM5MB53ecKW
         mJ7q5yGZXkNU2rdTwJiFPXXw/XcQAzrYfdIIbx+4JQt+1eTggqhrNIqKRRJsPbE6S8vB
         u19g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772438768; x=1773043568;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pzgC4aUzxFSpLAMwn+L0pn5MDObG9dJ9EJftg3QZJdc=;
        b=cFWYsW0IiTBUpklJFYMazceb8YJ67nFz3U/8yubIlgbwJRFx9k56C77Gc4zakeTQj2
         cD7+msm3RQvQs7KQATO0icFWcG12oB3o2BxmEZSIdUjolMhEE2PWtTHdCWhBeXPiTt9t
         nLscqZz2RYHdATg7gRPlclzrud6c5vNhA5/opywXql18wbGtOhBw5pNYaUy943U8HXew
         LVvtgx+ZAbYY9MF52MxMI369EY0lUir5MQ62MU3Jb9QIY2Z5Ypi26rkRXNvJfmcy3eyQ
         K9RtBDBrL1fu1OlvrRkiNmlYfckZqS0q8TUKO6+6OxxGikzkbHFo1EnDVdpX3HlCnJfy
         KIxA==
X-Forwarded-Encrypted: i=1; AJvYcCW2nkh5C/sJ4C5t5yM1ufsM2YcyjKYaM8eFVxZG67alz9mnD6GiALh0Z5KyxGErXze0zuLTj3QCTv2Ja6caj2sK@lists.infradead.org
X-Gm-Message-State: AOJu0YwobfVPbQ3Y6dPML5v/TFPgaENeh+qkpLD1F8kms8QABONKtVKL
	PwDvwgn3Ir3Q3lZ/0QmibEG6LqexK6uo4WvErfIWsTzxtpqQJsLRn/m/
X-Gm-Gg: ATEYQzzGfQS1TWUddOqEEnQd/jT8+BDTYVqDgCcOCGOTGAm9Ri6c9WN9x9tk/Uu8LSj
	qmNmqDJEuBjm+PTecE0+bWAdnMAy2Grm2wSS9IxzvtpnNxkZOhnftcDRDRjP0xd1zmqW4hOhSYV
	DBWy4vA8vDg2pgmVmtEQt/9qCLC9k7v/xwukOmddHn8NRZcOETPknaX8ux3TrPk5JHLbFmvkrRn
	RanyAvcBJ4YBWltvT+dFtqLKm4m7FX8HtcRdOhpUEYjEwc+QHTxCkzPZnWxTVjV5yKkU3oAii2N
	IgUkiBJAUm4Pbzx2htEpbfZ7PV3CAtfAhXYHh0cpmIg1wmb8B7wjqoCV5ZpSvCOwNbuvrw8ZAoz
	I7CsjQnYCq2Lcz2eASfzVrDRzat4e43Px4UtxkekFma3Vm7vK8xtqGzvSBurd3+Eva6sUqp8R9B
	0cnCnTzp9yifHIwPB9174FtYCM7XQvwoV2kZl3I13SYNN5GTCTJCtkwN6C14DwnoPo0YI+RzA=
X-Received: by 2002:a17:902:c945:b0:2ae:4e43:a607 with SMTP id d9443c01a7336-2ae4e43b71amr25850355ad.13.1772438767557;
        Mon, 02 Mar 2026 00:06:07 -0800 (PST)
Received: from [172.19.1.48] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb5b257esm130191305ad.4.2026.03.02.00.06.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 00:06:06 -0800 (PST)
Message-ID: <5607ce87-a1ab-4de1-8917-0a7c31f943f2@gmail.com>
Date: Mon, 2 Mar 2026 16:06:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: nuvoton: Add I2C nodes for MA35D1 SoC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: andi.shyti@kernel.org, ychuang3@nuvoton.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260302020822.13936-1-zychennvt@gmail.com>
 <20260302020822.13936-4-zychennvt@gmail.com>
 <20260302-amiable-rugged-mastiff-ccded3@quoll>
Content-Language: en-US
From: zychen <zychennvt@gmail.com>
In-Reply-To: <20260302-amiable-rugged-mastiff-ccded3@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_000609_015136_9846A606 
X-CRM114-Status: GOOD (  16.15  )
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

Hi Krzysztof,
	Thanks for your review.

Krzysztof Kozlowski 於 2026/3/2 下午 03:25 寫道:
> On Mon, Mar 02, 2026 at 02:08:22AM +0000, Zi-Yu Chen wrote:
>> Add I2C controller nodes to the MA35D1 SoC dtsi.
>> Also enable the I2C interfaces on the MA35D1 SOM board
>> to allow communication with onboard peripherals.
>>
>> Signed-off-by: Zi-Yu Chen <zychennvt@gmail.com>
>> ---
>>  .../boot/dts/nuvoton/ma35d1-som-256m.dts      | 14 ++++
>>  arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       | 65 +++++++++++++++++++
>>  2 files changed, 79 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
>> index f6f20a17e501..2a8f0fd90ded 100644
>> --- a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
>> +++ b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
>> @@ -98,6 +98,14 @@ pinctrl_uart16: uart16-pins {
>>  			power-source = <1>;
>>  		};
>>  	};
> 
> Missing blank line
Will fix in v2.
> 
>> +	i2c-grp {
>> +		pinctrl_i2c1: i2c1-pins {
>> +			nuvoton,pins = <1 10 12>,
>> +				       <1 11 12>;
>> +			bias-disable;
>> +		};
>> +
>> +	};
>>  };
>>  
>>  &uart0 {
>> @@ -129,3 +137,9 @@ &uart16 {
>>  	pinctrl-0 = <&pinctrl_uart16>;
>>  	status = "okay";
>>  };
>> +
>> +&i2c1 {
> 
> Why 'i' is after 'u'? Please read DTS coding style.
Will move &i2c1 after &clk and before &pinctrl in v2 to follow alphabetical order.
> 
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&pinctrl_i2c1>;
>> +	status = "okay";
>> +};
>> diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
>> index e51b98f5bdce..36bd19e37b57 100644
>> --- a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
>> +++ b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
>> @@ -17,6 +17,10 @@ / {
>>  	#address-cells = <2>;
>>  	#size-cells = <2>;
>>  
>> +	aliases {
>> +		i2c0 = &i2c2;
> 
> Not a property of DTSI, but DTS.
Will move to DTSI in v2.
> 
>> +	};
>> +
>>  	cpus {
>>  		#address-cells = <2>;
>>  		#size-cells = <0>;
>> @@ -372,6 +376,66 @@ uart15: serial@407f0000 {
>>  			status = "disabled";
>>  		};
>>  
>> +		i2c1: i2c@40810000 {
>> +			compatible = "nuvoton,ma35d1-i2c";
>> +			reg = <0x0 0x40810000 0x0 0x1000>;
>> +			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
>> +			clocks = <&clk I2C1_GATE>;
>> +			clock-frequency = <100000>;
>> +			resets = <&sys MA35D1_RESET_I2C1>;
>> +			status = "disabled";
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +		};
>> +
>> +		i2c2: i2c@40820000 {
>> +			compatible = "nuvoton,ma35d1-i2c";
>> +			reg = <0x0 0x40820000 0x0 0x1000>;
>> +			interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
>> +			clocks = <&clk I2C2_GATE>;
>> +			clock-frequency = <100000>;
>> +			resets = <&sys MA35D1_RESET_I2C2>;
>> +			status = "disabled";
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +		};
>> +
>> +		i2c3: i2c@40830000 {
>> +			compatible = "nuvoton,ma35d1-i2c";
>> +			reg = <0x0 0x40830000 0x0 0x1000>;
>> +			interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
>> +			clocks = <&clk I2C3_GATE>;
>> +			clock-frequency = <100000>;
>> +			resets = <&sys MA35D1_RESET_I2C3>;
>> +			status = "disabled";
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +		};
>> +
>> +		i2c4: i2c@40840000 {
>> +			compatible = "nuvoton,ma35d1-i2c";
>> +			reg = <0x0 0x40840000 0x0 0x1000>;
>> +			interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
>> +			clocks = <&clk I2C4_GATE>;
>> +			clock-frequency = <100000>;
>> +			resets = <&sys MA35D1_RESET_I2C4>;
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			status = "disabled";
>> +		};
>> +
>> +		i2c5: i2c@40850000 {
>> +			compatible = "nuvoton,ma35d1-i2c";
>> +			reg = <0x0 0x40850000 0x0 0x1000>;
>> +			interrupts = <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>;
>> +			clocks = <&clk I2C5_GATE>;
>> +			clock-frequency = <100000>;
>> +			resets = <&sys MA35D1_RESET_I2C5>;
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			status = "disabled";
>> +		};
>> +
>>  		uart16: serial@40880000 {
>>  			compatible = "nuvoton,ma35d1-uart";
>>  			reg = <0x0 0x40880000 0x0 0x100>;
>> @@ -379,5 +443,6 @@ uart16: serial@40880000 {
>>  			clocks = <&clk UART16_GATE>;
>>  			status = "disabled";
>>  		};
>> +
> 
> Why? Do not introduce random changes.
Will fix in v2.
> 
> Best regards,
> Krzysztof
> 

