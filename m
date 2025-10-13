Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A50ECCD183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 16:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F9tnRL1o3FmzbH3rPOyKULKn/hk3zU9MNzUIZBbOh80=; b=f5ljTPEsksWp+KDiHbGyA2nU3q
	PJNulQTmRIoyhAu5gvPAyA5fAq6tjHwRDa8pCelZeMyERgcDoFxbX942+HK2fBzn6nFVQ5aOVKS6a
	09PdPezxANFLzS9rozv+TdN/YT5Y17PSBaDLkHbaKbIiUcbmDMbfxk8HlYfRapdKuQGghHZKVi8bx
	F/mzg0g5p9PtHSclsjTmDVoeKZSbrm3ARJehjVpZZQ8QlJqEYv1Qxa63UG/GmO6P35OkQwSMmxCf8
	b/wQh8GPrc8K9cjrKTEFwra4ThsJFGHrVnlLwuhnf7RgGtXdycDu2H3m8RxvzzkpchifHtqPKkGHK
	UR45sH9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Kxq-0000000DmZL-0wmu;
	Mon, 13 Oct 2025 15:59:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Kxp-0000000DmYz-0Dsh
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 13 Oct 2025 15:59:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=F9tnRL1o3FmzbH3rPOyKULKn/hk3zU9MNzUIZBbOh80=; b=a3Z/BJnMY/dpnUiU/HS5Whaxys
	QJ+o7tQrrdHCeHkQFS2XtLxAQMjUSMj66LKTty9A8VWTqNPZ15hXAsdTq2mFri6Wh8lEwLQXIp7Nz
	J297HIqI5YkzVmN+4C4aTS4PRDRX1THBFsytePyP/cGuZEcAyUG+xYg+VBCTlFMinlP35/6oYMcI/
	FBnB1mmVq4TLNIXmeULhYf5Agzqth0ABr5xTaJ3Ia/EjAmBsFu+8IS6v+8rNWsx6zg4JJQmQRVMnn
	/lUxahawfGx90NTNHKb53wwNLj2UWG780tkoxXycZFCThUFrtt4fej9walEp5eDrwhp9jpZv+QzoD
	+43UbBCg==;
Received: from smtpout-04.galae.net ([185.171.202.116])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Kxk-00000004RiO-3V97
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 15:59:55 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8E361C093B0;
	Mon, 13 Oct 2025 15:59:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 663A66067B;
	Mon, 13 Oct 2025 15:59:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F18D3102F2273;
	Mon, 13 Oct 2025 17:59:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760371189; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=F9tnRL1o3FmzbH3rPOyKULKn/hk3zU9MNzUIZBbOh80=;
	b=iTUvBUFvI/itbMlmJ0x0WrNzyi3QeiZvBxNdzyILfJ7IH3MWnWJYdtUDDzRm/s1Oe50Qsx
	S50pmM6ZNqZ/t4QvTvRlAE5J968iQN3WpJ8KeQ7Sei/efTMN/EXd4tY9drQHat9TNT63LT
	kJ1dQGrfmrjAuJJ+vZAX9+tkap3RpYHzUGZ/ia9xXCZch8QszvcJrPkyu1TE15dECyKWgF
	igGuZWbbLVAo95qPbdNjUPGGTBhxylCrwmu3DL+6HkZFc/5pR+xyxrgq+U6odYq+7yaR3t
	xJR/eJjTd9DVWPwo4sMzBwBIaRuZeK2fWtLndnSXGUsnJyQl9MZi6mBjU7SVBQ==
Message-ID: <7293f682-7ba7-420c-9997-eec0d5cb09e1@bootlin.com>
Date: Mon, 13 Oct 2025 17:59:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/15] arm64: dts: allwinner: h616: add NAND controller
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>
Cc: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Wentao Liang <vulab@iscas.ac.cn>, Johan Hovold <johan@kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20251013152645.1119308-1-richard.genoud@bootlin.com>
 <20251013152645.1119308-16-richard.genoud@bootlin.com>
 <2800174.mvXUDI8C0e@jernej-laptop>
From: Richard GENOUD <richard.genoud@bootlin.com>
Content-Language: en-US, fr
Organization: Bootlin
In-Reply-To: <2800174.mvXUDI8C0e@jernej-laptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_165953_577571_6AA5BF3E 
X-CRM114-Status: GOOD (  15.42  )
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

Le 13/10/2025 à 17:43, Jernej Škrabec a écrit :
> Dne ponedeljek, 13. oktober 2025 ob 17:26:45 Srednjeevropski poletni čas je Richard Genoud napisal(a):
>> The H616 has a NAND controller quite similar to the A10/A23 ones, but
>> with some register differences, more clocks (for ECC and MBUS), more ECC
>> strengths, so this requires a new compatible string.
>>
>> Add the NAND controller node and pins in the device tree.
>>
>> Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
>> ---
>>   .../arm64/boot/dts/allwinner/sun50i-h616.dtsi | 51 +++++++++++++++++++
>>   1 file changed, 51 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
>> index ceedae9e399b..bb53c6c63836 100644
>> --- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
>> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
>> @@ -304,6 +304,42 @@ mmc2_pins: mmc2-pins {
>>   				bias-pull-up;
>>   			};
>>   
>> +			/omit-if-no-ref/
>> +			nand_pins: nand-pins {
>> +				pins = "PC0", "PC1", "PC2", "PC5", "PC8", "PC9",
>> +				       "PC10", "PC11", "PC12", "PC13", "PC14",
>> +				       "PC15", "PC16";
>> +				function = "nand0";
>> +			};
>> +
>> +			/omit-if-no-ref/
>> +			nand_cs0_pin: nand-cs0-pin {
>> +				pins = "PC4";
>> +				function = "nand0";
>> +				bias-pull-up;
>> +			};
>> +
>> +			/omit-if-no-ref/
>> +			nand_cs1_pin: nand-cs1-pin {
>> +				pins = "PC3";
>> +				function = "nand0";
>> +				bias-pull-up;
>> +			};
>> +
>> +			/omit-if-no-ref/
>> +			nand_rb0_pin: nand-rb0-pin {
>> +				pins = "PC6";
>> +				function = "nand0";
>> +				bias-pull-up;
>> +			};
>> +
>> +			/omit-if-no-ref/
>> +			nand_rb1_pin: nand-rb1-pin {
>> +				pins = "PC7";
>> +				function = "nand0";
>> +				bias-pull-up;
>> +			};
>> +
>>   			/omit-if-no-ref/
>>   			spi0_pins: spi0-pins {
>>   				pins = "PC0", "PC2", "PC4";
>> @@ -377,6 +413,21 @@ iommu: iommu@30f0000 {
>>   			#iommu-cells = <1>;
>>   		};
>>   
>> +		nfc: nand-controller@4011000 {
>> +			compatible = "allwinner,sun50i-h616-nand-controller";
>> +			reg = <0x04011000 0x1000>;
>> +			interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
>> +			clocks = <&ccu CLK_BUS_NAND>, <&ccu CLK_NAND0>,
>> +				<&ccu CLK_NAND1>, <&ccu CLK_MBUS_NAND>;
>> +			clock-names = "ahb", "mod", "ecc", "mbus";
>> +			resets = <&ccu RST_BUS_NAND>;
>> +			reset-names = "ahb";
>> +			dmas = <&dma 10>;
>> +			dma-names = "rxtx";
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +		};
> 
> Sorry, forgot to mention. This should be marked as disabled, as most of
> the boards don't have NAND connected.
arg! of course, I forgot that.

Thanks!

> 
> Best regards,
> Jernej
> 
>> +
>>   		mmc0: mmc@4020000 {
>>   			compatible = "allwinner,sun50i-h616-mmc",
>>   				     "allwinner,sun50i-a100-mmc";
>>
> 
> 
> 
> 


-- 
Richard Genoud, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

