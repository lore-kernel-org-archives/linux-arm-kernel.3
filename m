Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD980EDA693
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 15:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hCve6WB7p5HFK86K5uC4kN5A3SIG4RHj/dCOzJXHcas=; b=xHETrJY/yTExCQRzO1uxkqB//7
	zy5E3AR7B9FlMICnrcKb3w/4DU7aFVFqq7U6hZc2Z5SwCX15CMqZjSND1ad6hlmlQ9QhyBKMoAETk
	atEeLSRwIXDSZBZE+nFwkepGozzOJWs1ytt64gLMAR5aTu7uKWblcZ46QG9lruBYFrmjrkNIopTsA
	5ptaIGybrWPegp1yQCO//Ge1qAmNkb1P3e7ywukKmKqmvCzCqhs7XjMpwkiP3Rlbbss2I0uGektWK
	h7Ddd4+v+c3+JtVTkaVIEAuUawTtQk5lasEQ/EozPmneC0qNGGHrBq/Laqb7d+JkHkymnYG+bJOl4
	/F8vVP5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxS6J-0000000FUP2-3HyM;
	Tue, 03 Mar 2026 15:55:59 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxS6H-0000000FUO7-28dv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 15:55:58 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-4398d9a12c6so4610668f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Mar 2026 07:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772553356; x=1773158156; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hCve6WB7p5HFK86K5uC4kN5A3SIG4RHj/dCOzJXHcas=;
        b=UFzNP9bIypnEBglUgBAj9l13t+2tKTeYsKQe+/AeEa28+IWVouf3bGHgGhUmzgZfC3
         igUQqOp0YsUSv7kqafTe8m6H+CE+JpIhb4kC1QmDFLE7Fh0MR5Z+TAYyjIOAiC3X3Vnz
         Fd5+BfmK5h/dWWONClvnv5+986IWdZAzI3uB6EjNuorgYshcCcOw0TtB0FY42ABXQCRd
         G9HmujFHdyzvn8cTXzvZL69L03MwLOcbOihbEWT6DKWCFgIlGQifn/CyMG3jQcuXgyTn
         Ko9g2tAqn59VrVCu+f2JvOCwDh/7oYhX1yIJdsnRJxUMukp5EQhD7AETwJHEK4/0N8mB
         oJ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772553356; x=1773158156;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hCve6WB7p5HFK86K5uC4kN5A3SIG4RHj/dCOzJXHcas=;
        b=XP2/+TX1eGNcv1sXjfLVQu6iuTr1MSTqVdPC1QAkYEtaFl6BYADtCdAUucQtQorVpW
         EQbgv0NAltJ0kkMiJzvPuW82RBrC9R5fl1mBHLneRNHAv84ZkrOojsa9NZIN7jm4KCsP
         kmCMoahBFYAGmKmZEuLfcM9VK6uWGBidN2WgY9a2Z4veQ810VmeLQHkLHE4AaDnLtuVA
         JbF6HT05xlbYimtA+yb3CFv7OfSGvzlruE0uqQN3Z3504Ad1ulmHaow8VLEQGS6u1rgn
         cYwY2u6AIlCFeiHKXvi+QlZ20GLP/Ny/yEmOkupnd8tjNYqgu6XBVghHAf7GHkcYuA24
         py4w==
X-Forwarded-Encrypted: i=1; AJvYcCX0gvxvwp5S4IeiA/mNWDGV2cJXQ93Egl+J5o0XQW98H89849iHT7mKU4+ySYEBZXcpS+R3CHQQPmSSZWutu55K@lists.infradead.org
X-Gm-Message-State: AOJu0YzLiexn/gtbWfq0hUIBq+Px3tbmd5ThwLlhQkwRxS9Ul8CbLx/p
	mT/RDieJA9SrS9dTDB9dLrWG0T661wA4fWGIdb0NGuVokhsIw4gbjK1H
X-Gm-Gg: ATEYQzxDjX8rEe35sr4991b56Js6Tr3gy5z+x4JNuv3tfZdehByoXD70ZFHb9Zd/9tP
	OGuaL2DuilVAyYkWHgNj+8zzrkNW2+6QGVQv/uXAkdzQqgu5vaY1x2IVcXsBzPOI5cjGlxyax5I
	r6gdmfxIVQT5364/oTdKeYAKoD1aJESRlmxhcI1RBmgXkO/srJxS7vYXj5M7xfwREoPT1PKN9gT
	p50rfBE2PLzny9Smk7ki1hAyhLqGJXR9AZXdDA9nQOvgACc1YDMIpsDrzB7FHuo1F+IFRn5AB6T
	vd4gUPq/F4HswCIe+JRpOMPXVD0RhX1aSXAZMUTwYrEDR5H8tyRAAQa2wZ4dKCK4/ZCtijMh5vw
	nD7/g1qAiyk4+nzhetxlOt8GnlyVLDUr2WfNdD4O+qIvi84htK9rGzoRzYK91ofDGdHkRvlA82A
	54b8k8AwYT0P2zzHjhA6PlI83UB6ruOLIVpYziRloFf8NUim8K5tu78RpSir91cei5qeGIPw==
X-Received: by 2002:a05:600c:8b84:b0:479:2f95:5179 with SMTP id 5b1f17b1804b1-483c9bb1adbmr288516035e9.15.1772553355437;
        Tue, 03 Mar 2026 07:55:55 -0800 (PST)
Received: from [192.168.68.74] (93-34-120-147.ip49.fastwebnet.it. [93.34.120.147])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b485a0b6sm20131646f8f.39.2026.03.03.07.55.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 07:55:55 -0800 (PST)
Message-ID: <84ccccd0-bbf6-4f36-9862-68264f85ed9e@gmail.com>
Date: Tue, 3 Mar 2026 16:55:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: freescale: imx95-toradex-smarc: Support
 Cortex M7
To: Frank Li <Frank.li@nxp.com>, peng.fan@oss.nxp.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260303121324.1576841-1-ghidoliemanuele@gmail.com>
 <aacAYYuPkqgV3QYu@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
In-Reply-To: <aacAYYuPkqgV3QYu@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_075557_566684_833567EA 
X-CRM114-Status: GOOD (  16.76  )
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



On 3/3/26 16:38, Frank Li wrote:
> On Tue, Mar 03, 2026 at 01:13:06PM +0100, Emanuele Ghidoli wrote:
>> From: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
>>
>> Enable Cortex M7, the vring nodes, a mailbox and reserve DDR memory for
>> the M7. The remoteproc framework is so capable to load and run the M7
>> firmware.
>>
>> Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
>> ---
>>  .../dts/freescale/imx95-toradex-smarc.dtsi    | 50 +++++++++++++++++++
>>  1 file changed, 50 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
>> index 5932ba238a8a..77c4a6dee098 100644
>> --- a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
>> +++ b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
>> @@ -42,6 +42,16 @@ clk_serdes_eth_ref: clock-eth-ref {
>>  		enable-gpios = <&som_gpio_expander_1 13 GPIO_ACTIVE_HIGH>;
>>  	};
>>
>> +	cm7: remoteproc-cm7 {
>> +		compatible = "fsl,imx95-cm7";
>> +		mbox-names = "tx", "rx", "rxdb";
>> +		mboxes = <&mu7 0 1
>> +			  &mu7 1 1
>> +			  &mu7 3 1>;
>> +		memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
>> +				<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>, <&m7_reserved>;
>> +	};
>> +
>>  	connector {
>>  		compatible = "gpio-usb-b-connector", "usb-b-connector";
>>  		/* SMARC P64 - USB0_OTG_ID */
>> @@ -156,6 +166,42 @@ linux_cma: linux,cma {
>>  			alloc-ranges = <0 0x80000000 0 0x7f000000>;
>>  			linux,cma-default;
>>  		};
>> +
>> +		m7_reserved: memory@80000000 {
>> +			reg = <0 0x80000000 0 0x1000000>;
>> +			no-map;
>> +		};
>> +
>> +		rsc_table: memory@88220000 {
> 
> I remember driver use hardcode rsc-table, I suggest fan pan to update
> driver to support memory-region-names to avoid use hidden ABI.
> 
> Fan peng, what's current status?
> 
> Frank
> 
>> +			reg = <0 0x88220000 0 0x1000>;
>> +			no-map;
>> +		};
>> +
>> +		vdev0vring0: memory@88000000 {
>> +			reg = <0 0x88000000 0 0x8000>;
>> +			no-map;
>> +		};
>> +
>> +		vdev0vring1: memory@88008000 {
>> +			reg = <0 0x88008000 0 0x8000>;
>> +			no-map;
>> +		};
>> +
>> +		vdev1vring0: memory@88010000 {
>> +			reg = <0 0x88010000 0 0x8000>;
>> +			no-map;
>> +		};
>> +
>> +		vdev1vring1: memory@88018000 {
>> +			reg = <0 0x88018000 0 0x8000>;
>> +			no-map;
>> +		};
>> +
>> +		vdevbuffer: memory@88020000 {
>> +			compatible = "shared-dma-pool";
>> +			reg = <0 0x88020000 0 0x100000>;
>> +			no-map;
>> +		};
>>  	};
>>  };
>>
>> @@ -572,6 +618,10 @@ &lpuart3 {
>>  	pinctrl-0 = <&pinctrl_uart3>;
>>  };
>>
>> +&mu7 {
>> +	status = "okay";
>> +};
>> +
>>  /* SMARC MDIO, shared between all ethernet ports */
>>  &netc_emdio {
>>  	pinctrl-names = "default";
>> --
>> 2.43.0
>>

Thanks Frank. You’re right.
I spotted that my patch is not working as expected, due to a last minute
renaming on my side.
I’ll rework the patch accordingly and send a v2 to align to current expected
naming.

Emanuele

