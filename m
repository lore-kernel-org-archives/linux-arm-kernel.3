Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EFDFE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 17:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PbUIMKeTcturAYAiScPBcnakmAn3H8mySmvMPtWwkkM=; b=j6nXq7eJV7M17oU7GRoogmQaHn
	QSR9P2XUIhfE9a8hKvlgQKMWckQd+qYbMNjpZZxKFWygKLlYO3m3v92UbHKy3qiuvmcBF6Nvtlz0E
	52Hi3fp1TSfGaDa81ksSlAE5pu25uhJWGWlC588a30sCz7h3VjZ8+qkDNcCyA312+DTMnczoQRifi
	7o0V1qUAeCgS/to4UjH2+eIQQy8GCrIUKV46kzCE5ZW4FVqdPihiH4ZbUG1Db7/g5+tE+2LXkEwik
	gJpvmALk2pd8Z7Hn9HKEa9BLU3U6r/MhcU53rX6kPOjMU6rtctjJpRSAJj8msULoOgU7Oxooyc+xq
	KofX4Aag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOhCW-00000005i3g-00Vz;
	Fri, 20 Dec 2024 17:54:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOgow-00000005e3E-2bOD
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 20 Dec 2024 17:29:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=PbUIMKeTcturAYAiScPBcnakmAn3H8mySmvMPtWwkkM=; b=gtA3hGSyv6PDh1L5dMRNTYCQtN
	6wrgW4b2Qifhn1jgkNVKy1SMf5/gwOWsMtc55Tn4MbU8O4vfTpTC7h/71LHV9YfDZsCs8doz08IFk
	lTYWJvoafQAsMIctVZTq1rbqzHI1EtAzcTbrqq5CVzzuSxXtzsbZSoV42OrnScgbSy3Q1C9eWPJph
	65I3vT7ycWZ5rlyd3R5+pvrc67g8qE780XKLdBOvSPL2X/ntIt1Aic83bgUoKWXfpD6lcv2EoXxUo
	uO6+QK3Satd/4IX3L7CBoSZ5lYPxKg8CzHoV6nXeEHkFH0raSORJwBzWW1dbevlCjBnsYTXotXm/P
	NN9OXiuQ==;
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOgos-00000005k5U-1qNg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 17:29:49 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-a9a977d6cc7so303101866b.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Dec 2024 09:29:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1734715784; x=1735320584; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PbUIMKeTcturAYAiScPBcnakmAn3H8mySmvMPtWwkkM=;
        b=AmgUd9GjQ2Lxnrf4IiKFyxRdGKcFuQpsj3R1FO/+sVdaZKKPmVrdZlwNPwfqbWOn4W
         qcdGWpg7phVplxV8HMvtLZt2vDOThUQbs8ESPiH+GXdQUa4XIEl5XHxeaDrh97uGKWuN
         6Q9YjFJ0RNocjRAW4uEMRUP2JFfpLzYaWc2dwd9zeui2rqFyUR7WdF6Ggj+l9IyMnhBF
         ZU6537ovNI7mQ6z0eKdGwz8RGlIIfVu/KE1hqDK+6YixpFI1H7tJ8yNdR//cRKAW8ZxI
         NYqQjm33VpARxmRqlo+0RRufhGEUZYOCPreHI5byU6GIvttci41DWteEBEfycCM+3oQ0
         i8JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734715784; x=1735320584;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PbUIMKeTcturAYAiScPBcnakmAn3H8mySmvMPtWwkkM=;
        b=HgpSu/TejFF+MfxbW5tQEZruKFeRVNyY1+wMmUimQS3vd+niNkWrVGu/ZVi2+J2EG6
         LrddqvJM3tSEHTceRXKMfrPd66SmrxjKGrLckZFSAZdIBuheKYmIAaGMzXOFbTiirw8i
         k+lW7s8HB5rJOC/LxdJ6EbDzQI2vDO/GUWlwU2qP+t/juvQRwt2Gd4YL+CpUUGTPR5p7
         waWln1gAsuj3nM54DYcStMhkg2vo7l93pJNaIZk3KtL3OgkkgBolva6JYywx9m/5Ex6v
         2l8PLEM3NymztRqfvpAN2/EUwpcAyLMgS5OO4muZEvYMZVbCN43HnDNvH2h+EMpgi0hz
         yFrg==
X-Forwarded-Encrypted: i=1; AJvYcCUcRiNETtOmJEl8laEwVl1EoJyAlUMWUdaruzSFF8CMl6R03d1VSkVLwatme2leUjJeH69rcRH0fbAesnmU71Jr@lists.infradead.org
X-Gm-Message-State: AOJu0YwA2z48tDPCarpQkYpD89R/OYVG4nobtWC3cCnky+I1juaVQTj2
	dityHAC6rEBWgSo9MXMk3p2aDXmvz6/vfsMUvq6VkM/r1NZ7S0NP0fhxWjcanzs=
X-Gm-Gg: ASbGncv9LRPHAuoUXxzAbFFHGiAh/zl7Oj/FnooaAHTlmKLlcPsNDfPkBmezBV46oYW
	o/jVFUGmOQxEDd8VbSXnvaTS1oHom5ErAF2w+88iMRUtRmSbLjSLNS3+f/vU08J54j+d4p9ui95
	rsJbQR1cn3HGCyJj5RVWmtZeFmMowRVq/Tla+yAJyuoG3XHG5woo+IacGGHzpZv6owkvk4MwPhm
	Nt1qxaZ51zD1bDV8bAiXqzD5b6YnKu9507NbSpSms//eHZF2qLK32O/24FdfgzoAgcTSK+R/mZY
	GwIEEWXadNk3S8E4fgw6+R41VCbwsH+fIDtufXXFM6qk/w==
X-Google-Smtp-Source: AGHT+IGYaeNQMvLczVdOyx6urQde/IHpnQcuF5g22rELY4crh7l7GYBXhQy6Gdckf+dJbl0sUORUfQ==
X-Received: by 2002:a05:6402:3206:b0:5d1:2377:5af3 with SMTP id 4fb4d7f45d1cf-5d81dd83b23mr8339389a12.5.1734715783962;
        Fri, 20 Dec 2024 09:29:43 -0800 (PST)
Received: from [10.93.128.164] (ip-078-094-000-050.um19.pools.vodafone-ip.de. [78.94.0.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f05fd7csm196164466b.172.2024.12.20.09.29.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 09:29:43 -0800 (PST)
Message-ID: <9a210e3d-90eb-42d4-83fd-7bbad7b00e86@9elements.com>
Date: Fri, 20 Dec 2024 18:29:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: rockchip: ROCK3B: Correct clock rates for
 Ethernet PHYs
To: Jonas Karlman <jonas@kwiboo.se>
Cc: heiko@sntech.de, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241220163227.1501912-1-alicja.michalska@9elements.com>
 <17251add-40b7-4d18-8626-2d74b29532fc@kwiboo.se>
Content-Language: en-US
From: Alicja Michalska <alicja.michalska@9elements.com>
In-Reply-To: <17251add-40b7-4d18-8626-2d74b29532fc@kwiboo.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_172946_643519_E4E8690E 
X-CRM114-Status: GOOD (  25.47  )
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

Hello Jonas,


On 20/12/2024 18:09, Jonas Karlman wrote:
> Have you used mainline or vendor u-boot when testing?
>
> There is an existing issue with RTL8211F PHYs that they must be reset
> before Linux can identify them, see [1] for more details on the issue.
>
> Mainline U-Boot will reset the Ethernet PHYs on this board and that
> should allow for Linux to identify and use the Ethernet PHYs.
>
> [1] https://lore.kernel.org/r/47d55aca-bee6-810f-379f-9431649fefa6@kwiboo.se/

Thank you for the link. I've tested with vendor-provided U-Boot build:

U-Boot latest-2023.10-11-cc60ff40-gcc60ff40 (Aug 14 2024 - 03:56:35 +0000)

I can test with upstream in upcoming days.

> The snps,reset props is deprecated and reset- props should be used in
> the PHY node.
>
> This also changes to use 20/100 ms delay instead of current 20/50ms
> delay. If anything it could be changed to 20/80ms, I have only seen
> datasheets for rtl8211f mention minimum 10 ms and minimum 30-76 ms.
>
>> +
>> +	tx_delay = <0x36>;
>> +	rx_delay = <0x2d>;
> Are you having issue with use of rgmii-id on your board?

Interesting insight, thank you!

I have to admit that I haven't read the current documentation, just seen that other RK356X boards in the tree used it. My apologies.

I've ran into issues with rgmii-id, but that's with vendor U-Boot (as mentioned above), will try with upstream next and see a follow-up if I will still experience issues.

>> +
>>  	status = "okay";
>>  };
>>  
>>  &gmac1 {
>>  	assigned-clocks = <&cru SCLK_GMAC1_RX_TX>, <&cru SCLK_GMAC1>;
>>  	assigned-clock-parents = <&cru SCLK_GMAC1_RGMII_SPEED>, <&cru CLK_MAC1_2TOP>;
>> -	clock_in_out = "input";
>> -	phy-handle = <&rgmii_phy1>;
>> -	phy-mode = "rgmii-id";
>> +	assigned-clock-rates = <0>, <125000000>;
>> +	clock_in_out = "output";
>>  	phy-supply = <&vcc_3v3>;
>> +	phy-mode = "rgmii";
>> +	phy-handle = <&rgmii_phy1>;
>>  	pinctrl-names = "default";
>>  	pinctrl-0 = <&gmac1m1_miim
>>  		     &gmac1m1_tx_bus2
>>  		     &gmac1m1_rx_bus2
>>  		     &gmac1m1_rgmii_clk
>> -		     &gmac1m1_rgmii_bus
>> -		     &gmac1m1_clkinout>;
>> +		     &gmac1m1_rgmii_bus>;
>> +	snps,reset-gpio = <&gpio3 RK_PB0 GPIO_ACTIVE_LOW>;
>> +	snps,reset-active-low;
>> +	snps,reset-delays-us = <0 50000 150000>;
> Same here, but now this is 50/150 ms?
I wasn't sure about those delays, as I've taken them from vendor's sources. They did seem awfully high, though.
>> +
>> +	tx_delay = <0x47>;
>> +	rx_delay = <0x28>;
> Same here, is use of rgmii-id causing issues on your boards?
Answer above :)
>> +
>>  	status = "okay";
>>  };
>>  
>> +&mdio0 {
>> +	rgmii_phy0: ethernet-phy@0 {
>> +		compatible = "ethernet-phy-ieee802.3-c22";
>> +		reg = <0>;
> The phy addr used for these boards is 0x1.
>
>> +	};
>> +};
>> +
>> +&mdio1 {
>> +	rgmii_phy1: ethernet-phy@0 {
>> +		compatible = "ethernet-phy-ieee802.3-c22";
>> +		reg = <0>;
> Same here.
Makes sense, other boards in the tree had it configured the same way.
>> +	};
>> +};
> There should be no need to move these nodes, they should already be in
> alphabetical order?
There's no reason to, just thought moving them closer to PHYs would look cleaner and make a bit more sense. It's just a nitpick though.
>> +
>>  &gpu {
>>  	mali-supply = <&vdd_gpu>;
>>  	status = "okay";
>> @@ -512,26 +540,6 @@ &i2s1m0_sdi0
>>  	status = "okay";
>>  };
>>  
>> -&mdio0 {
>> -	rgmii_phy0: ethernet-phy@1 {
>> -		compatible = "ethernet-phy-ieee802.3-c22";
> If you want to use vendor u-boot you can probably change this to
> "ethernet-phy-id001c.c916".
>
>> -		reg = <1>;
>> -		reset-assert-us = <20000>;
>> -		reset-deassert-us = <50000>;
>> -		reset-gpios = <&gpio3 RK_PB7 GPIO_ACTIVE_LOW>;
>> -	};
>> -};
>> -
>> -&mdio1 {
>> -	rgmii_phy1: ethernet-phy@1 {
>> -		compatible = "ethernet-phy-ieee802.3-c22";
> Same here.

True, but in this case it likely wouldn't be accepted in upstream, right?

I really would prefer devicetrees to be passed to the OS by bootloader, just like ACPI does on x86 and some (i.e Ampere) platforms.

This way we wouldn't need to maintain per-board DTs in the tree, and would keep functionality between kernel versions/BSDs... but one can dream, huh? :)

Thank you,

Alicja


