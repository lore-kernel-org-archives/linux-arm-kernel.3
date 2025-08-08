Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C0C5C87FD3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 12:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WDaDKFrE9tePMwqIpXfK3gAKisGxx+wlPAiFTrZ+JsA=; b=IElDY7mzUYwk8mo5c6ciR4w9kH
	v50TtBKNHSkaY3SjdoNrVErunLWCWDNW4kjEFnHf8FVi9TtgbeT8aMk3ObQVfROnzTiMIfahecIlf
	tJLGxudgmrrc6unP0UGrR5IElj3l8VKBgm+P0toCDhurpKK1CYa7j7C+iBI0gO0GHk+XlrMIEDu/1
	tqR7s+blsiP0BB4UATRrbqtcf/Mfy6JzuhSIUE/a/r/bV/Pg/TGonCmVT6zm33DzQvMHkt5g5pBiW
	fnSgr459P5fDICtwpLSdCFCfpjIXz/UvrZIN4NoHWAee0B6UJDO+UFA+AG7cb49jRAWqEyMFGEj8j
	lDEjTDdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukLpb-00000002kWR-3Wd7;
	Fri, 08 Aug 2025 12:04:19 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukLDK-00000002f8F-0Xyp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 11:24:47 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-459e1338565so18589075e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 Aug 2025 04:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1754652285; x=1755257085; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WDaDKFrE9tePMwqIpXfK3gAKisGxx+wlPAiFTrZ+JsA=;
        b=ZDGkPL8KaVFUnC6cKwXbRULZ32JsNOy5y+u2qt5xuaiXvqeJd6kytMaar3g3lal1yd
         4FOrHTOVTxhMQ5h+CQoTWN9RB2noPZzk+UBuThz23+fM7cQ+21PC3rVaERSnq+0ZFIM6
         PV83r9owH/11mE3TYAzuzhVb4g3q/IKCXmRXIZ458u+KblFWwgVHe/XGCBKhCN0AGM5t
         QzWH3UwZmPHEMOjKCP8A4xwJrNt83YbqTmLcA4tgEHSz1HGCMKekMcS5zymUP2KO6lzq
         GoE6T57BX1zvbeZPdPiFrs+McMEgTFzJoY/a7ZCv9Yw9j/jLHXzaThZNBeppa1YXcv5t
         mj/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754652285; x=1755257085;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WDaDKFrE9tePMwqIpXfK3gAKisGxx+wlPAiFTrZ+JsA=;
        b=xOv+vYqBlO+YvCppAEMfQMA0tBhk/mmYX74IdxSaoIIGn6NtHzhNXUWMsdz9uSqbk3
         fwbCNGZ02q2kxlbX1tQYsb4xpkK0knRluA45JRXTbzSHM3VPbHN00srrvSQ/Myh1c2Xr
         lhJG1tKLYQ4Sv6nhNn+U3hj6pRvMJgZwgXRW6dfPthGxrZmsHPzXOgpLM52KzN+K3AF8
         CWCCOjN6utQ2xHC3Ty1Bru8uRlbOxCkfCg0Qnfgmd313r/8hOOrJeHjbfBaQNplHc58A
         spR8lrXnUCe9xk9mxYTRq+zv+vTmTDEz25HXCMaRjmGlBlowJ4w49D0JjoXgRrOTHmT1
         txLA==
X-Forwarded-Encrypted: i=1; AJvYcCUwDf/Lh31vpqJzh14/XplPsm6fc1p+gkyEHxAd0mJcVoZ6dwBigOldtrqk2N5EPXWp9RLfBZiNq7+rlcEGAeN3@lists.infradead.org
X-Gm-Message-State: AOJu0YxBVeqmcFzqjZEq2WMbC04lJEhtdHNeck8qE3lGMdS84akLP47r
	NSGlzef4hclX1hQbTp+L/zpsEqjQDlRQR2Y8WaoHQM5vcMvCSG0fsRDgPN9Q17e3DtE=
X-Gm-Gg: ASbGncuyGkXj5svNWoP6Z1QV/CJk1UsgcwOTgUYBE0UmiaszMNYamseQSGF/4EDjWDT
	Xyb4FAz7TR3pqsMO6c0/MzSAEdfzIjxQw262a0AmvzWd5df+s0A4Bm0scaXGI4cISVRp/n5p16g
	CrI+AXYw36yZLlbSYHArTqLJzp/n4q4IHYJ8l6FvXDMRiYeCiKXn3WffaHvc283W6JX8FukLXPD
	NvtArYA1P3blwlcFldt4qMnCtymI70eIdAS2TojSbU6S2taRL1Gy2vh/7/XogG+nXyELfUN2CwL
	UMTsb9OYj/qCrtgZp8F4w4b6jLni+5vfe9Hoi8OvbDk5k/+HqTh9BPvWDoKXvbCvTNHqAFzxHyc
	RPMxJfVhpD3lzCEKxQ7bhN4n7Ncvh32A=
X-Google-Smtp-Source: AGHT+IGFc+AaIxGFA2SLKc1CBodgdE5FKKCWRuNF/M1Z18xEptVX+bZf7YDkhLJM8Nb3ewYalAQT8w==
X-Received: by 2002:a05:600c:4f4b:b0:456:f1e:205c with SMTP id 5b1f17b1804b1-459f4e9df86mr24463835e9.4.1754652284753;
        Fri, 08 Aug 2025 04:24:44 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.188])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e6867193sm128153435e9.6.2025.08.08.04.24.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Aug 2025 04:24:44 -0700 (PDT)
Message-ID: <efdf5d48-c105-4e1b-8dbe-14706302aa2d@tuxon.dev>
Date: Fri, 8 Aug 2025 14:24:42 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/9] arm64: dts: renesas: rzg3s-smarc-som: Update
 dma-ranges for PCIe
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
 mani@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 geert+renesas@glider.be, magnus.damm@gmail.com, catalin.marinas@arm.com,
 will@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
 p.zabel@pengutronix.de, lizhi.hou@amd.com, linux-pci@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, Claudiu Beznea
 <claudiu.beznea.uj@bp.renesas.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20250708165540.GA2148533@bhelgaas>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250708165540.GA2148533@bhelgaas>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_042446_174230_12511A8B 
X-CRM114-Status: GOOD (  16.79  )
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

Hi, Bjorn,

On 08.07.2025 19:55, Bjorn Helgaas wrote:
> On Fri, Jul 04, 2025 at 07:14:07PM +0300, Claudiu wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> The first 128MB of memory is reserved on this board for secure area.
>> Update the PCIe dma-ranges property to reflect this.
> 
> Can we include a sentence or two about what the "secure area" means?

I'll update it.

Basically, it is a RAM region that is used by firmware.

Thank you for your review,
Claudiu

> I don't know how to connect this with anything in the driver.
> 
>> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> ---
>>
>> Changes in v3:
>> - collected tags
>>
>> Changes in v2:
>> - none, this patch is new
>>
>>  arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
>> index 39845faec894..1b03820a6f02 100644
>> --- a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
>> +++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
>> @@ -214,6 +214,11 @@ &sdhi2 {
>>  };
>>  #endif
>>  
>> +&pcie {
>> +	/* First 128MB is reserved for secure area. */
>> +	dma-ranges = <0x42000000 0 0x48000000 0 0x48000000 0x0 0x38000000>;
>> +};
>> +
>>  &pinctrl {
>>  #if SW_CONFIG3 == SW_ON
>>  	eth0-phy-irq-hog {
>> -- 
>> 2.43.0
>>


