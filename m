Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1AF9C87FD3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 14:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZdCn3l/Y/cDnw+eg7OBtMS2sCWl9a4rYzAAcz1Nkh/s=; b=x8B+pSR3cAkXmtL6W80CE2j7Sm
	cRO46UtXC91RzpVWRbneyLNigdrQTa+vCbN9N+vlASLwhoNHrNbhXyhEZPgLbnqRRqVGqMKpSMl1d
	W5x0I81d0TqjmqVHmgOI2RhfCSP8hRWPAeq5rp/SltJgEwXs9Qg9JZxt186ZpxWsBY8migV9xJ+5q
	H3eZq918vSa2xGQbkBzB2hit4YZLoV4NgvRYbwB2lAorn02Tb0p1FFAq7D6pZqarZNEfWdWRuo7yQ
	WIXOHh2AKe3EMCXFMh1Me2w1g919bSRZGJJ0Ha8w9zP5FYm1NEofRX+f/oDxDuAWI2RD8bR9Rrh8h
	Q3VDyOQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujenI-0000000FOYD-1cBg;
	Wed, 06 Aug 2025 14:07:04 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujekD-0000000FNYZ-1WYY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 14:03:54 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-615d1865b2dso8787854a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Aug 2025 07:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754489032; x=1755093832; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZdCn3l/Y/cDnw+eg7OBtMS2sCWl9a4rYzAAcz1Nkh/s=;
        b=a59RiG+mTbRu6ZPTg0edSXKPrQCgxA7fsMR/1ikejqCFWCA/hP5VQ0RSbk+19MUC0v
         JDhnHFyIkJ+BOi75A4xNTULGFtKCFHY+d1FJMW45Car8wSInuY1Z8yDxI0VZFCqcNDEb
         JnH18IlVfhJA0BmhyDEZ90dPESAJvuwi673HJAvB9cYDEBRYWWBW4uRYnj2FYuPhxWQE
         qcW3xp/Epwq1yjFKAV6oP9AcFfRPLGxQgRyfK8cQ6fv66+FUe8xnS0srlU+gZsvYPPbK
         ktTA7O79zdGv8wBLuY1/Lk67PRXHTGdoREOMY6CjYYvfTKWV4hw91WInm7fNVkIXqaDk
         Ffmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754489032; x=1755093832;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZdCn3l/Y/cDnw+eg7OBtMS2sCWl9a4rYzAAcz1Nkh/s=;
        b=H/JV5/OTNT9N44etRtwKo33lJp1dO0b8b9r8gDVgPvlYYRw2WbGoYaTHlPzjNZeiLf
         /hIK4MZ7E/t9bFRGkmmXjgfvkzncTdysVzZBIhAoIupep3WAcGPevS4YO6JvTTSDe/q+
         ut5w2AWP4s/vuEQWHUh7BKgl0lVs07+ioqTyFhoAuG5NRyqsxOApyZ7RfF62SbsE7akH
         Qaj+WM1CntYaXqi3m9YmHAMykJaVnXpztdiSCFzwO14LpHm329n+OjtRtcBPPiffWaTM
         G3diKNsZYoWE90qH66S8UQ9jPwn3rJFwhRyjzASqy3EW++iALe22jW6yOpoEIXsu+aXW
         x0CQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZqhAItmkoDvElnE1qfUyJyz47TLmw4uoZFyPXsAZnkWTjNzUzqi3lRtjsj7W8hEGG1QY5HEBUgIanZPwvSGrt@lists.infradead.org
X-Gm-Message-State: AOJu0Ywf5kbuTDfgp1+H0Hnk2bsbpwXJS5HKi1YthsGy6cXjQdzKmJqJ
	K8GVAXKMdMNdugP+8HeaIB6RkyiYus5DoJA61EDCUiTQhqayyHt8J8kW
X-Gm-Gg: ASbGnctm73fT3R1ytoIO2bptrrb4VbbTwZF7O9KHWw7pfZuYgcLv5MeMzXlk5GI8vQo
	pSWc6MouHQvi7GaPg7ejabIcX3zKYBBt+Cykwv+SOKKfgTcPZnwWReukuQdLFvRmh3ppU6iCH7E
	UsDGD/iNMPXpuwtLXSaMIztsR+jcLZR81AS7riyNoHvefMX1HBXhr4IhDAh4ONqGfN/fTLUe0/K
	63ZyDEJi956aJdmFcvTneepLMDs3Efo93P3z7/inS++H5jq6LY+NF0cTdnVOQC+NTdg0LDtrC4p
	qVxB16/SryKAg2a9wD8lTMTw9B2mhw2n86suCxP1sgDMifOUH6P5GPXJhiV974E8J74+Hq40qLe
	AFvCzkmIOcefRX+jUjVNi/0Xfa1AJkRQs21W7PQ9b7lQfvEvQR8vjoVkz2Jm8Z6ZECQU3WpEndN
	17tLafrZ2pA1w=
X-Google-Smtp-Source: AGHT+IEZN/xnmINXiJf33M2U1WyJPsMopS4IUXYnX6+rek03rsq/iuB5F0OgJMrRAGHbwh934qYWfw==
X-Received: by 2002:a17:907:9710:b0:ae0:de30:8569 with SMTP id a640c23a62f3a-af9900f6e63mr261859666b.1.1754489031265;
        Wed, 06 Aug 2025 07:03:51 -0700 (PDT)
Received: from [192.168.1.106] (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a21c0f4sm1094570366b.106.2025.08.06.07.03.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Aug 2025 07:03:50 -0700 (PDT)
Message-ID: <cf613367-dba6-4014-9be6-ff40de16a3a6@gmail.com>
Date: Wed, 6 Aug 2025 17:03:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] arm64: dts: exynos2200: add serial_0/1 nodes
Content-Language: en-US
To: Sam Protsenko <semen.protsenko@linaro.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250730074253.1884111-1-ivo.ivanov.ivanov1@gmail.com>
 <20250730074253.1884111-5-ivo.ivanov.ivanov1@gmail.com>
 <CAPLW+4kOiBOZYQVA-ZiMEn+-_ZF1HD8QTm9AH0y34bcY+Mu92A@mail.gmail.com>
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <CAPLW+4kOiBOZYQVA-ZiMEn+-_ZF1HD8QTm9AH0y34bcY+Mu92A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_070353_417769_8F4680D6 
X-CRM114-Status: GOOD (  25.15  )
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

On 8/2/25 02:12, Sam Protsenko wrote:
> On Wed, Jul 30, 2025 at 2:43 AM Ivaylo Ivanov
> <ivo.ivanov.ivanov1@gmail.com> wrote:
>> Add nodes for serial_0 (UART_DBG) and serial_1 (UART_BT), which
>> allows using them.
>>
>> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>> ---
>>  arch/arm64/boot/dts/exynos/exynos2200.dtsi | 26 ++++++++++++++++++++++
>>  1 file changed, 26 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/exynos/exynos2200.dtsi b/arch/arm64/boot/dts/exynos/exynos2200.dtsi
>> index bab77b442..22c6da907 100644
>> --- a/arch/arm64/boot/dts/exynos/exynos2200.dtsi
>> +++ b/arch/arm64/boot/dts/exynos/exynos2200.dtsi
>> @@ -336,6 +336,19 @@ pinctrl_peric1: pinctrl@10730000 {
>>                         reg = <0x10730000 0x1000>;
>>                 };
>>
>> +               serial_1: serial@10840000 {
>> +                       compatible = "samsung,exynos2200-uart", "google,gs101-uart";
>> +                       reg = <0x10840000 0x100>;
>> +                       clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
>> +                                <&cmu_peric1 CLK_DOUT_PERIC1_UART_BT>;
>> +                       clock-names = "uart", "clk_uart_baud0";
>> +                       interrupts = <GIC_SPI 674 IRQ_TYPE_LEVEL_HIGH 0>;
>> +                       pinctrl-0 = <&uart1_bus>;
>> +                       pinctrl-names = "default";
>> +                       samsung,uart-fifosize = <256>;
>> +                       status = "disabled";
>> +               };
>> +
>>                 cmu_hsi0: clock-controller@10a00000 {
>>                         compatible = "samsung,exynos2200-cmu-hsi0";
>>                         reg = <0x10a00000 0x8000>;
>> @@ -458,6 +471,19 @@ pinctrl_peric2: pinctrl@11c30000 {
>>                         reg = <0x11c30000 0x1000>;
>>                 };
>>
>> +               serial_0: serial@11c40000 {
>> +                       compatible = "samsung,exynos2200-uart", "google,gs101-uart";
>> +                       reg = <0x11c40000 0x100>;
>> +                       clocks = <&cmu_peric2 CLK_MOUT_PERIC2_NOC_USER>,
>> +                                <&cmu_peric2 CLK_DOUT_PERIC2_UART_DBG>;
>> +                       clock-names = "uart", "clk_uart_baud0";
>> +                       interrupts = <GIC_SPI 687 IRQ_TYPE_LEVEL_HIGH 0>;
>> +                       pinctrl-0 = <&uart0_bus_single>;
>> +                       pinctrl-names = "default";
>> +                       samsung,uart-fifosize = <256>;
>> +                       status = "disabled";
>> +               };
>> +
> Shouldn't these two serial nodes be children of some corresponding USI
> nodes?

Which :P

>  IIUC, the downstream counterpart of this device tree is [1]? I
> can see the corresponding USI node is missing there. And if you don't
> have the TRM, it might get confusing. But, apart from my intuition
> telling me that those UART blocks *should* be implemented as a part of
> USI IP blocks in Exynos2200, there is also a fact that the downstream
> driver is actually accessing USI registers in exynos_usi_init()
> function, in the exynos-uart driver here: [2].

Unless that does nothing and Samsung did not care enough to strip the
code for it.

>  If that's correct, it
> means there should exist a USI block, which should be modeled like so:
>
> 8<------------------------------------------------------------------------->8
>     usi_...: usi@11c400c0 {
>         compatible = ...;
>         reg = <0x138200c0 0x20>;
>         samsung,sysreg = <...>;
>         samsung,mode = <USI_MODE_UART>;
>         #address-cells = <1>;
>         #size-cells = <1>;
>         ranges;
>         clocks = <&cmu_peric2 CLK_MOUT_PERIC2_NOC_USER>,
>                  <&cmu_peric2 CLK_DOUT_PERIC2_UART_DBG>;
>         clock-names = "pclk", "ipclk";
>         status = "disabled";
>
>         serial_0: serial@11c40000 {
>             compatible = "samsung,exynos2200-uart", "google,gs101-uart";
>             reg = <0x11c40000 0x100>;
>             clocks = <&cmu_peric2 CLK_MOUT_PERIC2_NOC_USER>,
>                      <&cmu_peric2 CLK_DOUT_PERIC2_UART_DBG>;
>             clock-names = "uart", "clk_uart_baud0";
>             interrupts = <GIC_SPI 687 IRQ_TYPE_LEVEL_HIGH 0>;
>             pinctrl-0 = <&uart0_bus_single>;
>             pinctrl-names = "default";
>             samsung,uart-fifosize = <256>;
>             status = "disabled";
>         };
>     };
> 8<------------------------------------------------------------------------->8
>
> This way you can achieve the same behavior as in downstream kernel, by
> making the (upstream) USI driver to initialize corresponding USI
> registers for you.
>
> Does that make any sense?

Not really. Perhaps you could __verify__ to what USI instance it belongs?
And is there a sysreg register for controlling the behavior of that?

Again, I know nothing more than what downstream says.

Best regards,
Ivaylo

>
> Thanks!
>
> [1] https://github.com/jgudec/android_kernel_samsung_exynos2200/blob/CWAI/arch/arm64/boot/dts/exynos/s5e9925.dts#L4648
> [2] https://github.com/jgudec/android_kernel_samsung_exynos2200/blob/CWAI/drivers/tty/serial/exynos_tty.c#L2181
>
>
>>                 cmu_cmgp: clock-controller@14e00000 {
>>                         compatible = "samsung,exynos2200-cmu-cmgp";
>>                         reg = <0x14e00000 0x8000>;
>> --
>> 2.43.0
>>
>>


