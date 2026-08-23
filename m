Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4541C5DF97
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Aug 2026 11:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qrz6vWIs7Ln59X+fS+7H6xGzZNfsFTViY3UVWM/k9UQ=; b=X+re4GhBopKFOif2uKmevYWiYa
	k94GiB5PlQKtMAVPLQ2LiLtSNXK4db5VmOKet/vSguQobmcYg/55rj6sYktBrR+HkUEjqwVGFx+DZ
	P2P90h+H8YwCoFQkt6AxFMcMNJZf4q+8C1Q9ZVM2bePvoE9GDipgv22h9/hDvItTTsMKtfpxUdqFG
	Otroa3qs+6G3gUltrp3y2fDvvy/zsETrgsKYa2OYYThrWELPUwePR4mh0zWewWRaV9MfyTmtKTR0A
	wKYnUlfgZWKRc7pv/6w7A8lRSF9pPxC8tuvFGPJRhrCFCnTNwJgeEtdeAfoeF6PectyFSN9pcZ48f
	+vFZELBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wy6Xb-0000000FHly-2S3V;
	Sun, 23 Aug 2026 11:39:07 +0000
Received: from mail-wm1-f50.google.com ([209.85.128.50])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wy6XY-0000000FHlE-31ot
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Aug 2026 11:39:06 +0000
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4953de5be0aso15451715e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Aug 2026 04:39:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787485143; x=1788089943;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qrz6vWIs7Ln59X+fS+7H6xGzZNfsFTViY3UVWM/k9UQ=;
        b=Pd0pbX5FDQkn1MvYDPhK3V7aAZ/2xs/KuXrEdwIBKScPgDNeOB7BgmAxD5NS9jdUaF
         2mif4+BgHXxPIERo0CkInSPOI72Bc9pGhXHaaJEbWUcWWrBbqvY+uIFx22Pismpf1I8p
         L9sYJO6U1JtSqZbUTGb1nEUgVScMxUIPA6HVkUBV5vRinyLm/vc6DcZNEeJ9EqqjSlP0
         L8BvK6o0HMtT+cH2+NYsaLzuihu/oQ+/uh9tVZddu1njx4h2U4MJ12S2QezOJvF8lnUq
         HrRIk+7MdNxj9+ZwJ9YOrYH2lKY3gujXhpUpEkZZotsJjcebZRF67AAM0gNBRxVbpDXq
         B7PA==
X-Gm-Message-State: AFuF++l6sx8p3IilccR6LWJZCqpw4OsXA539+8lbLY/ll/4RKTqBd/uF
	uOlkn7pNftY/FyRGq9YbF6oJ22M/kCThngnGHXSzOxA2tfO++c2ZXzop
X-Gm-Gg: AR+sD1111InEvR2qoS1JnSGU+aFsYNIEI2Kd70OZBozSy0MGJXnGEyTVVt5mRp31nM+
	PZRWoSBZsmQvDtjYhS708vOB7BFu7BZSzwCcbpe78z2HLyfNDJmiNfyqxKntCaNW7NuFtgBVPur
	kQ+8qcGrsQ1FHYItyerYNC0SIOqVoLEC+HsaOgd2fLa+C17qZXe+qmbNl2p5jfTL9wpll/6urRR
	LObf2HFCQOpJHkfmqmZcg3Qgb4X64vCf4yi3y3Yd4Kq9BbRWzmKpXMmQKBeLwrDdDlIKJQAx9ZC
	DRsfnhJmwCHNZF1ymesHVvOK684a1Y0Ix9bSFPWeq6CczA/l+pG2XMSeaKS65V6XcFjXvcSLM5A
	NQ2uBjFQfc9qEqRudF3lvlOfXoclPFDpR5vkZUwQD8Mx67FZ1aHaIIvzzD/9RuhQB8gNV5BEexU
	tKhUlWQnepO2lPVSjy1oYTYjak9CtGU/K0ako0vG4H5xMv98mHaxKlJuuh931/Fquf0NOCXX/Xr
	YW8iYlwvVo8fyjpPv6pGd13PrmzvhPS
X-Received: by 2002:a05:600c:c48f:b0:493:bd2a:93be with SMTP id 5b1f17b1804b1-499b8325d80mr195726245e9.6.1787485142600;
        Sun, 23 Aug 2026 04:39:02 -0700 (PDT)
Received: from [192.168.1.135] ([83.106.158.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499b9b57ab4sm61139535e9.2.2026.08.23.04.39.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Aug 2026 04:39:01 -0700 (PDT)
Message-ID: <0969d872-faff-4b0f-81ad-972b7aa9bb7f@linux.com>
Date: Sun, 23 Aug 2026 12:39:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: amlogic: t7: use the real UART pclk
To: Ronald Claveau <linux-kernel-dev@aliel.fr>,
 Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
References: <20260818191159.11523-1-tanure@linux.com>
 <20260818191159.11523-2-tanure@linux.com>
 <c428305a-265c-4cc5-be01-be5b21dc22ca@amlogic.com>
 <6673edea-6822-4368-9374-29f92195fcf5@aliel.fr>
Content-Language: en-US
From: Lucas Tanure <tanure@linux.com>
In-Reply-To: <6673edea-6822-4368-9374-29f92195fcf5@aliel.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260823_043905_619502_70EE5AA0 
X-CRM114-Status: GOOD (  18.12  )
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

On 19/08/2026 08:25, Ronald Claveau wrote:
> On 8/19/26 4:39 AM, Xianwei Zhao wrote:
>> Hi Lucas,
>>
>> On 2026/8/19 03:11, Lucas Tanure wrote:
>>> uart_a lists the 24MHz crystal for all three of its clocks, because
>>> the T7 clock controller driver did not exist when these boards were
>>> added.
>>>
>>> That leaves the real UART bus clock without a user, so the kernel
>>> turns it off when it disables unused clocks at the end of boot, and
>>> the board hangs.
>>>
>>> Point uart_a at the real clocks, the way meson-s4.dtsi does, and drop
>>> the placeholders from the two board files.
>>>
>>> Fixes: 4fef056588f5 ("arm64: dts: amlogic-t7-a311d2-khadas-vim4: add
>>> initial device-tree")
>>> Fixes: 6f048cc7a635 ("arm64: dts: add board AN400")
>>> Signed-off-by: Lucas Tanure<tanure@linux.com>
>>> Assisted-by: Claude:claude-fable-5
>>> ---
>>>    arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts       | 2 --
>>>    arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 2 --
>>>    arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi                   | 4 ++++
>>>    3 files changed, 4 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts
>>> b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts
>>> index cab2ee9ea0d3..dcbcd08a78b9 100644
>>> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts
>>> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts
>>> @@ -33,7 +33,5 @@ xtal: xtal-clk {
>>>    };
>>>
>>>    &uart_a {
>>> -       clocks = <&xtal>, <&xtal>,
>>> <&xtal>;
>>> -       clock-names = "xtal", "pclk", "baud";
>>>           status = "okay";
>>>    };
>>> diff --git
>>> a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
>>> b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
>>> index c41525a34b72..677069e58f30 100644
>>> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
>>> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
>>> @@ -266,6 +266,4 @@ &sd_emmc_c {
>>>
>>>    &uart_a {
>>>           status = "okay";
>>> -       clocks = <&xtal>, <&xtal>,
>>> <&xtal>;
>>> -       clock-names = "xtal", "pclk", "baud";
>>>    };
>>> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
>>> b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
>>> index cc371fcd1896..7847582e77ed 100644
>>> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
>>> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
>>> @@ -587,6 +587,10 @@ uart_a: serial@78000 {
>>>                                   compatible = "amlogic,t7-uart",
>>> "amlogic,meson-s4-uart";
>>>                                   reg = <0x0 0x78000 0x0 0x18>;
>>>                                   interrupts = <GIC_SPI 168
>>> IRQ_TYPE_EDGE_RISING>;
>>> +                               clocks = <&xtal>,
>>> +                                        <&clkc_periphs
>>> CLKID_SYS_UART_A>,
>>> +                                        <&xtal>;
>>> +                               clock-names = "xtal", "pclk", "baud";
>>>                                   status = "disabled";
>>>                           };
>>
>> I agree with moving the UART clock configuration to the DTSI file.
>> However, it seems a little odd to keep the XTAL clock definition in the
>> DTS, as the alias may not be consistent across different boards, which
>> could result in compilation errors. Could we move the XTAL clock
>> definition to the DTSI as well, similar to other Amlogic SoCs?
> 
> It seems similar to changes in this series :
> 
> https://lore.kernel.org/all/20260420-add-bluetooth-t7-vim4-v4-0-9505df0e7016@aliel.fr/
> 
> What do you think ?
> 
Thanks for pointing out that series, though I wasn't aware of it.
And after reading I don't agree with it. The clocks are not redundant, 
they are there because we agreed sometime ago that xtal belongs to the 
board files.
So I still vote for my change in v2, that I will send in a few minutes.

