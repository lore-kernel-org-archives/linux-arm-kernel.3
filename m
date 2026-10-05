Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A678CA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 10:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LFDKBytFqpiCAKHq7794WGTm1eiUeSTtEFvwUnjGNk4=; b=R4ha+Kjo0RSrKMNVyO/tiwLPdX
	saNb0TEFzlZgHkerUs0IhUxgOufZI2ZDgiFP9UuPohiDsKVAA3qGpWOMe64xzNUKEhHxjouhclqmq
	9ukFv2GQXC9+d/CsXaxNPeyRgxyki1bKPulMHVpUvijNm/18JX20ZAKN03CN6OuGUQSAj2adCgvHv
	ci0BcKkui1L3R1QOjaVPxzKtQeUzPV8X7JN3iaevFAVPMOzRgSSMluNkvJlfczT+62S6WWc1JCncw
	izstZDjmGCa2qrpozEgQGJY5eojueGl+IDbM2WU9Kfc/hAxWr4JMiVAqm7gyXo7eNWjJ5N39LqLXd
	YLkPGEcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDfYi-0000000G7Lb-2GqS;
	Mon, 05 Oct 2026 10:04:36 +0000
Received: from mail-ed1-f41.google.com ([209.85.208.41])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDfYb-0000000G7Jl-2Bu2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 10:04:35 +0000
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6a9bd4db6ccso1989596a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 03:04:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791194667; x=1791799467;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LFDKBytFqpiCAKHq7794WGTm1eiUeSTtEFvwUnjGNk4=;
        b=Isc2wKQnMywavkD8p5e6LAjklGYHaJi+EENYI9BOAv2oSCIpwAB5ZTsvJb3sb/kG71
         lMjjVn9VNZyFQH9YFgvxNN9hXngJeQvTJXeQfo1OO6LGgS7ZuXfTTbsnl1rPgm4LBYij
         a2nIxv+KbJFgLIpTzxjJxDGzNuCG5KPq2YuioeoYLIGHcODcTBPPCIz7vzLshMtCnmvH
         NFR5nHxVeprU4VLpAFvid/mJAJrdDL1Gpb6dbl6+MLoa32RjVTziia+hpV4MsfftO7Km
         /KcWH+H/DVCvLWixLEZ+qTuCHPwnOsQ+Bibo9ZxK0B2AIhDYvzcTI2vfM7kknQQI31P9
         WHWQ==
X-Forwarded-Encrypted: i=1; AKwUvBzd+4DG+/hmt8JQSIMzmQmZ0wpwHD3DR6I9P3IIySyS8ghgGQztIFKGs1fbbcczUFwhhs9wvtqyI2WxO4CfixPR@lists.infradead.org
X-Gm-Message-State: AFq9FYKaDaIf2BYwkdSyCQGABCSxaGNX21LOEjH65uyPYnODNYC2Cvr6
	lKXSaaFqm6t+9wjUbnZgYKiIg4z9nMpNTojfCt1oTg5ya+wU2KbsIgFs
X-Gm-Gg: AYBFou3ou1W1OFOJneNE3H251Ia65a2uSkQMaZV5/fDHyacay09cAm9rzkm7C40aRu/
	cstsAdn0WNS0XQl6TEiOi6nI5FO9h0QbFGlU5rNpilkNezbQcexks4EUhus3b2GMo1Uu8wLTO9z
	3mm/t6sWljbjwSIE0YijTQuAfZYqXJfbJnA+d3cZBjMoNyVpor3+wrnAn9Wup9edoFbRm9AGSpE
	pzP6D2CodGI0MZQNokbPtBljyW6+dJNb2YlKd5ONmKgW6GKH5DMxVcxvfn3npr9ws/kICx49d1i
	bN7VINzeHng4IsCJddrTbk+Z1LsMywkuRFZkQ5YGkTZuZi1JDGZMWmMO62VzUylEyaC0ErUfDdJ
	ZTogzmVLFuLL4piNZlZ6yYgCP/PQ7v8CxjsB8rcXW1LE7AQW7KSvXQdYQKIIvxmEKHuJjTv3y1W
	ONlBtCGMRpjECvAEONJlR4NfTA7o2pxIHAKlNOqRR52/hPF1LxTKwlFAtdfbt6QynNT/JR/rJQ4
	9gZgCgsUS1VUoIE4slJTzQ8B2Zs
X-Received: by 2002:a05:6402:2421:b0:6ac:6968:9424 with SMTP id 4fb4d7f45d1cf-6afada1af02mr6404847a12.33.1791194667149;
        Mon, 05 Oct 2026 03:04:27 -0700 (PDT)
Received: from [192.168.1.135] ([84.68.183.72])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6afb020bdb9sm3060982a12.23.2026.10.05.03.04.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 03:04:26 -0700 (PDT)
Message-ID: <f246ff74-a30e-4381-a6a0-ab51261f9e90@linux.com>
Date: Mon, 5 Oct 2026 11:04:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 6/6] arm64: dts: amlogic: t7: khadas-vim4: enable the
 ethernet port
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
 xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20261004144046.391444-1-tanure@linux.com>
 <20261004144046.391444-7-tanure@linux.com>
 <d1ae6c21-72a9-4bc7-aaaf-9051d0f6b1b0@bootlin.com>
Content-Language: en-US
From: Lucas Tanure <tanure@linux.com>
In-Reply-To: <d1ae6c21-72a9-4bc7-aaaf-9051d0f6b1b0@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_030429_585906_2EEA3DBA 
X-CRM114-Status: GOOD (  26.09  )
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

On 04/10/2026 21:58, Maxime Chevallier wrote:
> Hi Lucas,
> 
> On 10/4/26 16:40, Lucas Tanure wrote:
>> The board carries a Realtek RTL8211F gigabit PHY on the external
>> management bus, connected to the MAC over RGMII.
>>
>> Enable the controller, hand it the ethernet pins and point it at the
>> PHY. The clock delays RGMII needs are supplied by the MAC rather than
>> the PHY: 2ns on transmit and 2000ps on receive, the values the vendor
>> kernel programs.
>>
>> The PHY interrupt output is wired to GPIOH_6, so describe it and let
>> link changes be reported instead of polled. The PHY reset pin is driven
>> by an RC network on the board, not by the SoC, so there is no reset line
>> to describe.
>>
>> Tested at 930Mbit/s sustained receive over a minute, with no MAC error
>> counters moving in either direction.
>>
>> Assisted-by: LLM
>> Signed-off-by: Lucas Tanure <tanure@linux.com>
>> ---
>>   .../amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 28 +++++++++++++++++++
>>   1 file changed, 28 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
>> index 0fa83362b417..5d0365ddde72 100644
>> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
>> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
>> @@ -14,6 +14,7 @@ / {
>>   	compatible = "khadas,vim4", "amlogic,a311d2", "amlogic,t7";
>>   
>>   	aliases {
>> +		ethernet0 = &ethmac;
>>   		serial0 = &uart_a;
>>   		mmc0 = &sd_emmc_c;
>>   		mmc1 = &sd_emmc_b;
>> @@ -256,6 +257,33 @@ xtal: xtal-clk {
>>   	};
>>   };
>>   
>> +&ethmac {
>> +	status = "okay";
>> +	pinctrl-0 = <&eth_pins>, <&eth_rgmii_pins>;
>> +	pinctrl-names = "default";
>> +
>> +	/*
>> +	 * The RGMII clock delays are added by the MAC, so the PHY is
>> +	 * asked for the mode that adds none.
>> +	 */
>> +	phy-mode = "rgmii";
> 
> In devicetree, "rgmii" means that the delays are inserted at the hardware
> level, i.e. with longer PCB traces for the clock. With the above comment,
> this is therefore wrong.
> 
> As a rule of thumb, "phy-mode = rgmii" is almost always wrong.
> 
> The right behaviour here is to represent the HW as it is, that is to say
> pass phy-mode = "rgmii-id"; delays are internal. In DT we don't say who
> inserts the delays (MAC or PHY), that's for the drive to figure out.
> 
> If the MAC inserts the delays, then it needs to fixup the mode passed to the PHY so that
> they follow this doc :
> 
> https://www.kernel.org/doc/html/v7.2/networking/phy.html#rg-mii-electrical-interface-considerations
> 
> Maxime
Hi Maxime,

Thanks for the review. You are right about what the mode names mean,
but after a few tests I do not think this board can follow it. I tried
all three:

   rgmii-id    23 of 23 received frames had a bad CRC, DHCP never
               completes.
   rgmii-txid  receive becomes perfect, but then the peer sees nothing
               we send, not even an error counter.
   rgmii       1Gbit/s, 930Mbit/s sustained, no error counter moving.

There was nothing to tune on the PHY side either: the RTL8211F delays
are single enable bits, TXCR bit 8 and RXCR bit 3, on or off.

The modes whose names promise internal delays are the same ones where
the glue switches its own off, so there is no value that is both right
by phy.rst and working here. Keeping "rgmii" and the comment, so the
next person sees why before trying it. Glad to help test and convert
this board if the driver's phy-mode handling is ever reworked along
with the other Amlogic boards.

Thanks,
Lucas


