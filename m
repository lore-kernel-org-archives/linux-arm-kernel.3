Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6CB8D609AD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 08:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bew/I5xXVZXMcMLGcr2bk1V3h79V/rlhudJAubnILnI=; b=A8G6GHidMocqRXnBqg6MxRs6Tz
	Frb8aOew9guJmR9doHotvSrpZknpKBskJUvw4bHhMmF3IYeCv0gHXC60CMsj0/ilsMckzXswhhEO7
	+OmcTCZFPXPO8XFignLanVgT2NVkhHiX78KIpO42rdpeFNbobK+N+qpoUeRzuEkvrPSx/gXNSQPpq
	uZi0YDm02lajqhLU9x11TfRXVzxsKtFzfsDlKTp2Nz3cx7mzxaYbuPdEZaR3XWJAg8KqCfRSrUe5g
	YQcfWwD0vKVJLdofsoQ3DkKjj7kIdvdhIR8jZvL5KEL8p1boTLTGtSflZbuspDxIVD68r5/UwVndS
	BvN57iqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGD5H-0000000CXAb-1Pji;
	Wed, 27 Nov 2024 08:07:39 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGCzq-0000000CW6Z-1B2D
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 08:02:03 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2124a86f4cbso58320875ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Nov 2024 00:02:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732694521; x=1733299321; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bew/I5xXVZXMcMLGcr2bk1V3h79V/rlhudJAubnILnI=;
        b=XU7PtiVHWYS5YWROxljWFeH+bhLpkqA7ffA9sSA8NmpIOIP1ws9Z5Sf5Ll7nCqVtaA
         FjxD6eALqlB5qViR2azYK1QLlUi3ZvE07uC/PlNFFy4SWg2shpojGSKQgR7ZhbLZPjwe
         qTSk3M5yR31alXu6i5zfW0/lfZYxdUdiHavyT6xdew3/VLeY4jAat3faNQxhSUXHEpk7
         3oNEbnIMKLi7Wre1+/tkOXlvv5C15VKyCffhP9Jvbir7xV8xEYE6056xm06UZt+aeUuR
         9uK26dr6DPBfh0YhPhhTlsekCKc+YSoyn1roAKar8gFIdp90jopyxf2gvqdoIrjARJvG
         Zx1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732694521; x=1733299321;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bew/I5xXVZXMcMLGcr2bk1V3h79V/rlhudJAubnILnI=;
        b=E3zeI32NuHZxPa7fmFQ7kLLrNTDZFYBv+Y1KiboE/c98H7GrtnWAGuDzVCTtaA9FF8
         Je3Ih62kOTNBDJdpsEhOx5PlPYEBTGz6AgdkUORUBZS84j+LchSjQZSkpTdY5YL/RaZr
         TT4OgTK1fpUCk+LQPnH7nkpgt6XFyxLQjdboWq3RNqnbJ3qA3dl5oxBEYoflWtsr6tvs
         QBD7f2KrKLBbYKAU80qA49K6b5lPpKEVZ1rBVG2mrWje5d2LUOF4Y1M8tbLjndF5fgVX
         xVNKbPieaMp9xqmFmu8fCp5NjTKeDpevgFundZev8hq2S3Sf/8lFnH2wc4rUaTTV7leA
         L7Fg==
X-Forwarded-Encrypted: i=1; AJvYcCXPq5Uugvw8dOwTRaAFCk1hly92+qKbzdCfowiCHIJYA9HnqnqLyLBT6IlxSA7W1W9KgOLDnTkodmUsplINvtjx@lists.infradead.org
X-Gm-Message-State: AOJu0YxCjZAb/sWggVO6eDQedKv7wIh1lxi/QQPLORKvefO7FLS08AY7
	NPX0gDYWOXNVScQ7FOKmCQGiNchjXUjTxNvxlMnxOcCLcwEfSRz7
X-Gm-Gg: ASbGncv1Ukd19EY/+GS2FSA9xwXuP/NVj3uORcvne2RYue2IvCFD25YLIbFxj4St2t7
	85YHs2p12q6IMyAp5eipoHpupM+T28s5N5A4bDlydZ5DC4wu7v2Oa75mDICBGyOaC1NJqSekYCX
	qSjdqnGNw/4JSVkArQSDDJmludFx679aJAIWxaAYJ18PgI2WC0Ex5zM6guEitGULQ+gwFJVGmgy
	eNzqz8l2tvGxr9SnLUnQEIvPfwar+SaVJlZmZqrmEGWXOoojpcjCLIE0F5UxFtQTzPO/z2INhTg
	Ep8DPoflS60MjktdaSLjBdIbgFkE
X-Google-Smtp-Source: AGHT+IGtUIoISB0+clpN9PkK/2UFXTIykn3qm+m0cLDTT9iuNBtfEZ70ZERWyU6+cs55GUUZXZV4kQ==
X-Received: by 2002:a17:903:2b08:b0:211:e812:3948 with SMTP id d9443c01a7336-21500fedf8amr32131585ad.0.1732694521468;
        Wed, 27 Nov 2024 00:02:01 -0800 (PST)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129db8c783sm96580615ad.25.2024.11.27.00.01.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Nov 2024 00:02:01 -0800 (PST)
Message-ID: <6efc512e-b153-4f2c-8b38-4443024475ee@gmail.com>
Date: Wed, 27 Nov 2024 16:01:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] arm64: dts: nuvoton: Add Ethernet nodes
To: Krzysztof Kozlowski <krzk@kernel.org>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 mcoquelin.stm32@gmail.com, richardcochran@gmail.com
Cc: alexandre.torgue@foss.st.com, joabreu@synopsys.com, ychuang3@nuvoton.com,
 schung@nuvoton.com, yclu4@nuvoton.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-stm32@st-md-mailman.stormreply.com
References: <20241118082707.8504-1-a0987203069@gmail.com>
 <20241118082707.8504-3-a0987203069@gmail.com>
 <a220d407-de40-4398-a837-de11e01d2381@kernel.org>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <a220d407-de40-4398-a837-de11e01d2381@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_000202_321032_63E0BFE9 
X-CRM114-Status: GOOD (  10.34  )
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

Dear Krzysztof,

Thank you for your reply.

Krzysztof Kozlowski 於 11/26/2024 6:08 PM 寫道:
> On 18/11/2024 09:27, Joey Lu wrote:
>> diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
>> index e51b98f5bdce..2e0071329309 100644
>> --- a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
>> +++ b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
>> @@ -379,5 +379,57 @@ uart16: serial@40880000 {
>>   			clocks = <&clk UART16_GATE>;
>>   			status = "disabled";
>>   		};
>> +
>> +		gmac0: ethernet@40120000 {
>> +			compatible = "nuvoton,ma35d1-dwmac";
>> +			reg = <0x0 0x40120000 0x0 0x10000>;
>> +			interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
>> +			interrupt-names = "macirq";
>> +			clocks = <&clk EMAC0_GATE>, <&clk EPLL_DIV8>;
>> +			clock-names = "stmmaceth", "ptp_ref";
>> +
>> +			nuvoton,sys = <&sys 0>;
>> +			resets = <&sys MA35D1_RESET_GMAC0>;
>> +			reset-names = "stmmaceth";
>> +			status = "disabled";
> Status is always, always the last property. Please read and follow DTS
> coding style.
>
> Best regards,
> Krzysztof

Got it. I will fix these.

Thanks!

BR,

Joey


