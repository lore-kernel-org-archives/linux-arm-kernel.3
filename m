Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E5DDC55196
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 19:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qNkEgZtE9MyrRrLinjI/1vsPROGFxoSujraxlInN0iw=; b=dvcocYBPkovxXXrDfYPwlsM9IG
	e75NoKlg8beTS0D47utomv5A2CgFKvLDcmHBo3taQ3VjwKDHi7bUS3tmHENsuBvU6jjnbpVGfeL5O
	by11EKjYlmIxhOk/pxjl1CgJ09bNvZO4CY86bv38l+h10IyTqdT+74Mrw6djFubn64PChOraGjHDJ
	huzHDXCkdLi91wpDStovnPHjf4enZIl2yzJHxDJQiZ3A53wbNxPlpW67CWHiCPE93MC+LyGCCQqGA
	pCBBe7Q9dRMZKJ6O6BOs59tot7GbZTB90zBgYU8VF3HuHqpCXcGiZSGmP0w4GbgNLsAhnloFnb2Cs
	zClGIyWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqyjw-00000000T6P-3Exp;
	Mon, 03 Aug 2026 19:54:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqyjs-00000000T6C-42KQ;
	Mon, 03 Aug 2026 19:54:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=qNkEgZtE9MyrRrLinjI/1vsPROGFxoSujraxlInN0iw=; b=lLmY11O4g2pIqSWooliYhlAw3h
	kBlCwiLqUoJvefeWiOMaLHnv3ecNro69r8LrasamqHfLLwNeoFdKKcws7V4ps9kA7tSYao6xcHMTb
	GeSVZQoaJtLTHd4XusNzIh3roSrgGfPmx0PTN0vnvwWjimj/JfdT7e6VmfuR92U5zLdX8GbcN4Mi3
	rdz1prPUDomcT6N9NjJj7NUIl2lsfXU80E2DUVXgFhdixqL66wPJ2uIjAfGb8CVmpKH5HtbzazYxS
	Xpr/8o0x91ftRM3/8L9BO75Cpsu7CO4a/R6fZTJcQJv4K3684eb0QxF7g7YNBHaHhUvDddBhXZfHM
	vMA9BLcw==;
Received: from ixit.cz ([84.42.129.46])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wqyjp-00000009J6R-0Yqz;
	Mon, 03 Aug 2026 19:54:19 +0000
Received: from [10.0.0.182] (unknown [10.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ixit.cz (Postfix) with ESMTPSA id AA37E5340321;
	Mon, 03 Aug 2026 21:35:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
	t=1785785719;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=qNkEgZtE9MyrRrLinjI/1vsPROGFxoSujraxlInN0iw=;
	b=CCKoQ1CVpmqp8XoxyeAiSn1Wke25wcx+oIwCGSfaJkvDrezNwe9fgfOWhY+y71UhUhRLO1
	/0HfWAFcTOX46qQ75eNsOvZ5YmwCY8Y3PquVUqU/ltOdR0QYunrLxXDFgX2P9EQ6eC4a18
	mEZ8erCjUnmSdpDymfaUC0GKg00N/j4=
Message-ID: <58da7454-e539-4e2b-b658-829cece52205@ixit.cz>
Date: Mon, 3 Aug 2026 21:35:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: imx8mq-librem5: Dongwoon DW9714 coil
 requires higher voltage
To: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Ondrej Jirman <megi@xff.cz>, Olivier Benjamin
 <olivier.benjamin@bootlin.com>, Manuel Traut <manut@mecka.net>,
 Alexander Warnecke <awarnecke002@hotmail.com>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Martin Kepplinger <martin.kepplinger@puri.sm>,
 Shawn Guo <shawnguo@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 phone-devel@vger.kernel.org, imx@lists.linux.dev, stable@vger.kernel.org
References: <20260801-pp-pro-camera-v1-0-7b4d90788f9f@ixit.cz>
 <20260801-pp-pro-camera-v1-4-7b4d90788f9f@ixit.cz>
 <yJywMSNTQGGZm3rbxd56Yw@puri.sm>
Content-Language: en-US
From: David Heidelberg <david@ixit.cz>
Autocrypt: addr=david@ixit.cz; keydata=
 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
In-Reply-To: <yJywMSNTQGGZm3rbxd56Yw@puri.sm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_205417_320983_C102E6AA 
X-CRM114-Status: GOOD (  19.24  )
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

On 03/08/2026 20:12, Sebastian Krzyszkowiak wrote:
> On sobota, 1 sierpnia 2026 02:35:23 czas środkowoeuropejski letni David
> Heidelberg via B4 Relay wrote:
>> From: David Heidelberg <david@ixit.cz>
>>
>> By datasheet the VDD (in-kernel named vcc) range is between 2.3 to 4.3 V.
>> Usually it's around 2.8 V. Here it matches the reg_vcam_2v8.
> 
> It doesn't - VCAM_2V8 isn't connected to DW9714 (and neither is CSI_1V8);
> VCAM_AFVDD is.

I didn't realized we have datasheet here :)

> 
>> 1.8 V here is likely used for i2c level shifter.
> 
> I'm not sure where you've got an I2C level shifter from, there's none involved

it's copy-paste from previous commits.

> there. CSI_1V8 is passed to the rear camera module as DOVDD and is consumed by
> S5K3L6 as VDDIO, and both S5K3L6 and DW9714 are connected to I2C4_SDA/
> I2C4_SCL, operating at the 1.8V level, only though an EMI filter (F7 in the
> schematic).

I don't see the AFVDD in the [1], do you have it somewhere defined?

Thanks
David

[1] 
https://source.puri.sm/Librem5/linux/-/tree/pureos/latest/arch/arm64/boot/dts/freescale?ref_type=heads

> 
>>
>> Fixes: f00df2bdb512 ("arm64: dts: imx8mq-librem5: describe the voice coil
>> motor for focus control") Cc: stable@vger.kernel.org
>> Signed-off-by: David Heidelberg <david@ixit.cz>
>> ---
>>   arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
>> b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi index
>> f5d529c5baf3e..583cba2d3bebf 100644
>> --- a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
>> +++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
>> @@ -1167,17 +1167,17 @@ &i2c4 {
>>   	pinctrl-1 = <&pinctrl_i2c4_gpio>;
>>   	scl-gpios = <&gpio5 20 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
>>   	sda-gpios = <&gpio5 21 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
>>   	status = "okay";
>>
>>   	vcm@c {
>>   		compatible = "dongwoon,dw9714";
>>   		reg = <0x0c>;
>> -		vcc-supply = <&reg_csi_1v8>;
>> +		vcc-supply = <&reg_vcam_2v8>;
>>   	};
>>
>>   	bat: fuel-gauge@36 {
>>   		compatible = "maxim,max17055";
>>   		reg = <0x36>;
>>   		interrupt-parent = <&gpio3>;
>>   		interrupts = <20 IRQ_TYPE_LEVEL_LOW>;
>>   		pinctrl-names = "default";
> 
> 
> 
> 

-- 
David Heidelberg


