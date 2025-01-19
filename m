Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A396C02183
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Jan 2025 11:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jFwAN4NPK1DZJMX46y1FOD2OnkFuCtYDMQ81C7qA/Ns=; b=Adi39/4EW+TdPzFXcCsc/0erSz
	70GsEXmqLklItj07lDnhVWsji9thvr6hFCq1mRUaTYa9VTPNtkW9/geofC2shNRtFXVu5CQkb90Yv
	v8/Zody5MYaoILgo8+kR/XaGecNjoqNBRW+lvMPeDNKDmhSs6BbXxwVXaj9BHa62BO+v+MhffQU3k
	4T+NtDxfN9wfgGp7dkaPrzzDA2cS6N+K5mv5fJ1oBMpL1/5vHbfgMWk6euLtxhpPgsMWWmMUzJjzv
	3rwUTziD1Nxxk5HU4T+hCrhDV/WbfV2V83i06FHDfmSCkoiVhvUl0VfX1tbh2Gvzjtrl/3XimrNbX
	6SGKYD7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZTIz-00000003mmd-2HGA;
	Sun, 19 Jan 2025 11:17:25 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZTHf-00000003meQ-0nqn;
	Sun, 19 Jan 2025 11:16:07 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-21675fd60feso78059335ad.2;
        Sun, 19 Jan 2025 03:16:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737285362; x=1737890162; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jFwAN4NPK1DZJMX46y1FOD2OnkFuCtYDMQ81C7qA/Ns=;
        b=aMROngmIHXUAv0JKVoU3oUJlkVXpMjxoXuh8koVE9bjLV6ROPvGpvUwXSFzk8o6H72
         WsihlFCc0eQR2wNEVmQcbcIPqTm9XDeDzyJBmHxKkTzmUvI0xgcfC146EhP8KJA9gj2W
         p8+ZNt6STzj3mMoT618MmuSIMYS85ZYck7QlfkoYR9v+v1NK9R54UVOUbR+/EsRqJy1i
         8mBE1M9tttf8j/o+N+J3ni4Jg1tX4q7rVSiDIwNiP7Rvq1BuqIde8OVqM2lveCEja32a
         dGzxDFLM3nBmqkjcUl4aDooGZgIUcCgz9gf7K9Djf9uSvGD5HLMYVkQ1xmbJBctGc5ZS
         AnXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737285362; x=1737890162;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jFwAN4NPK1DZJMX46y1FOD2OnkFuCtYDMQ81C7qA/Ns=;
        b=Oo8Nckcq8oLpjQfpXPZVCFCdMitZTdwiFONkVdd3mgdJ//yh4cv7vPiYTDPe7VEZY0
         qeAsuvefpj/xM/4ptKizq3RTTTTOb1Sg2N9SMGvDy84+EWv93ACmFqCDRkd6lEqkxACb
         I2eLiiSDIrKF18JC2MPgqTlX+9OpCqmQYj53AeSnmNTlsyPII75vXZYK1TnmxS7+ByD/
         nGhpR/pfy67UJ6fPN329qbACQ2jtbWEnnAYkgGLmAgytKlflQxhLppC7Xy/NzOuSVfJJ
         PaRe+PAw7VF4j6uBb4k8c5rUDTPxHeuo5h25VmK8dEOODw2kFP9oO28tHT/gVuUyD+qh
         FCkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTIZDhtGdIZezN2iIDsDIyN1/7ghO6tBNxode4wYTdHHWvx3X4KSwyLtcLYPmkmr4ns+Z1CPR/wtdFqWDnZFY=@lists.infradead.org, AJvYcCXr+5tNPPF6GTSn/iXTClEyxdfNXhTIVqZeQAwmL9YfCNlflG2pWvZ94P/1PNg+AbjSw0fvRsXj9Ig/McYzwMKL@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+20fon7LsYStcimElNyPfratFW2U9vYGtqBsstJ0+58mDYI16
	BOVQsCo0v1BNgil7Q6crwLV+JR57QpHYR0Y9sj3dhb5pB26XsO4Y
X-Gm-Gg: ASbGnct3n4kLUIPAEev1M10I40xVV92G7Ye6FG51xrGgfg/Cb7QsbBo1QPdavD/e39k
	1CCADptbbYisYtQJSuuHkTa1g5ku4TO+z6xPpHm6VXweTA9kULECL+umiIxWR7fva7LS+XQWvyQ
	UXlq6cszIR7bIpKn71tA1Y5WAKAwccC2USGNitKEMzaOQj904wlC0VeBlvW0LF5dfWW76z7ovDv
	aQxbhCsQxW+CSv1HY8DW1o8b8zj4qoAMUy1i77mqYV22iJGGOuEiuTbfoaFhqqivUyapBThzVoP
	eICEj+ISEHx+cuaikDGlvZXPqvKkfTpvaT+l
X-Google-Smtp-Source: AGHT+IHaTt00aOKIg9mcDnsHrjnAg6faqbxOOHMpsfBN2LwzL1GNhhYFrCUK2KkmLZAv0vVu7zGv+Q==
X-Received: by 2002:a17:903:186:b0:216:69ca:772a with SMTP id d9443c01a7336-21c3563ee3fmr144590885ad.53.1737285361827;
        Sun, 19 Jan 2025 03:16:01 -0800 (PST)
Received: from ?IPV6:2408:8362:245d:4738:bc4b:53ff:fead:2724? ([2401:b60:5:867d:3631:b7db:c3f4:aae2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2d3a87e4sm43606145ad.111.2025.01.19.03.15.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Jan 2025 03:16:01 -0800 (PST)
Message-ID: <59893a67-18c7-4ab3-9b2a-5a17091d4b6c@gmail.com>
Date: Sun, 19 Jan 2025 19:15:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: rockchip: change eth phy mode to rgmii-id for
 orangepi r1 plus lts
To: Dragan Simic <dsimic@manjaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Jonas Karlman <jonas@kwiboo.se>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Peter Geis <pgwipeout@gmail.com>
References: <20250119091154.1110762-1-cnsztl@gmail.com>
 <ce15f141688c4c537ac3307b6fbed283@manjaro.org>
From: Tianling Shen <cnsztl@gmail.com>
In-Reply-To: <ce15f141688c4c537ac3307b6fbed283@manjaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250119_031603_232697_E6D62B4D 
X-CRM114-Status: GOOD (  17.38  )
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

Hi Dragan,

On 2025/1/19 17:54, Dragan Simic wrote:
> Hello Tianling,
> 
> Thanks for the patch.  Please, see a comment below.
> 
> On 2025-01-19 10:11, Tianling Shen wrote:
>> In general the delay should be added by the PHY instead of the MAC,
>> and this improves network stability on some boards which seem to
>> need different delay.
>>
>> Fixes: 387b3bbac5ea ("arm64: dts: rockchip: Add Xunlong OrangePi R1 
>> Plus LTS")
>> Cc: stable@vger.kernel.org # 6.6+
>> Signed-off-by: Tianling Shen <cnsztl@gmail.com>
>> ---
>>  arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus-lts.dts | 3 +--
>>  arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus.dts     | 1 +
>>  arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus.dtsi    | 1 -
>>  3 files changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git
>> a/arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus-lts.dts
>> b/arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus-lts.dts
>> index 67c246ad8b8c..ec2ce894da1f 100644
>> --- a/arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus-lts.dts
>> +++ b/arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus-lts.dts
>> @@ -17,8 +17,7 @@ / {
>>
>>  &gmac2io {
>>      phy-handle = <&yt8531c>;
>> -    tx_delay = <0x19>;
>> -    rx_delay = <0x05>;
>> +    phy-mode = "rgmii-id";
> 
> Shouldn't the "tx_delay" and "rx_delay" DT parameters be converted
> into the "tx-internal-delay-ps" and "rx-internal-delay-ps" parameters,
> respectively, so the Motorcomm PHY driver can pick them up and
> actually configure the internal PHY delays?

The documentation[1] says "{t,r}x-internal-delay-ps" default to 1950 and 
that value already works fine on my board.

1. 
https://www.kernel.org/doc/Documentation/devicetree/bindings/net/motorcomm%2Cyt8xxx.yaml

Thanks,
Tianling.

> 
>>      status = "okay";
>>
>>      mdio {
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus.dts
>> b/arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus.dts
>> index 324a8e951f7e..846b931e16d2 100644
>> --- a/arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus.dts
>> +++ b/arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus.dts
>> @@ -15,6 +15,7 @@ / {
>>
>>  &gmac2io {
>>      phy-handle = <&rtl8211e>;
>> +    phy-mode = "rgmii";
>>      tx_delay = <0x24>;
>>      rx_delay = <0x18>;
>>      status = "okay";
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus.dtsi
>> b/arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus.dtsi
>> index 4f193704e5dc..09508e324a28 100644
>> --- a/arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus.dtsi
>> +++ b/arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus.dtsi
>> @@ -109,7 +109,6 @@ &gmac2io {
>>      assigned-clocks = <&cru SCLK_MAC2IO>, <&cru SCLK_MAC2IO_EXT>;
>>      assigned-clock-parents = <&gmac_clk>, <&gmac_clk>;
>>      clock_in_out = "input";
>> -    phy-mode = "rgmii";
>>      phy-supply = <&vcc_io>;
>>      pinctrl-0 = <&rgmiim1_pins>;
>>      pinctrl-names = "default";


