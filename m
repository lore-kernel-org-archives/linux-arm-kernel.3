Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 228C6C88E40
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 15:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/O88mD56SBzt1YvJ4sXCFFpkOs3XAqa1P/dxdZfqCQY=; b=XWb2twshooqJ32tcbVirtdVlVP
	H8p+WA5VLjm0dulmxFxeeGCtKATDHOv2gDKwVk8kefaWjvjUDbSctLFkv7nrurcnI4hIsHzrlYTm1
	aZD4tUe2Fo82ndAKi6ztFt6GiIx75/i8K04PkBRSIRQALZHb1HiyptGjiwd6YH8K6YVy6lCB2VkNx
	FjV3HFIA6QMHaTmwBa8kn+o4X4j6WZArCkKBgryOCq3chx0T76Itp513mfQlcjmnnbeQrFmLYq1Nz
	pIKtC0J9YMujUIRUIDE7sPgGRJ2L/9wqEODzoRpvkvC5F1Ru/w+N/wLvv+XcDmKP52McWGBxk2vPW
	HHqeJB6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4gO3-0000000Ej4Z-2SnW;
	Thu, 10 Sep 2026 15:08:27 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4gO1-0000000Ej3h-17uz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 15:08:26 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-49b0d78a801so70837975e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 08:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789052903; x=1789657703; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/O88mD56SBzt1YvJ4sXCFFpkOs3XAqa1P/dxdZfqCQY=;
        b=TT9epKxe2SKGPAXSsk4l0rKnWYobrdg6E1m6+LUqNdcDkGx5kcusw0R/LnkrxYJg1X
         0/PVO4kk1gJ/vkmzhuT8PeMUg54un8Trf7wmY4OaUdivQ3arEUF4Z2okMnZ4J9cKnpXO
         u/gKGtYw3yPMmeKYRVcit0F5Y+7QEjKM98lLuLaQnwW17oEY5PUo8QOdZrRZJw2+TRDq
         wdGeCGF3rKjZoy1t0YCIdcaeRUCVMnIbIf/2myY1OG0c6pDZveCIf3jf7oiok04acN0W
         6QquCchLBL1wIqJYK7zdCzGDUddflxlJSVpqyOYHhn0EaMWRrBzGGSgUFqz2+QepjSHc
         Jugw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789052903; x=1789657703;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/O88mD56SBzt1YvJ4sXCFFpkOs3XAqa1P/dxdZfqCQY=;
        b=bp4Th7cEHnmCdbQGEDXygbL064NATNZUvMSEQvqoBa38ZX+h83Qtd1gTxmC0JfUCvS
         F1SfrBW6VNJ8DJD9DhMnTNlYO1ZA784QlMwmaeBfzCCnb8V5whFlyvRWKiVyrtUI/zz1
         l0jKewl/180SAis8k0ybfLLw8RNFIFr7rA+11XRJEK2GWQiiwUIKAZfokRYkEPagp9bV
         TV7jNMT42VKTbQAtC/nBV7vDhq2iF+dKgDsnJFcNdsLkgMyn4AMrRRzuQ1M/rQ4N6eDy
         +YL5r/9ReC0YSvZCPrMyjvDJ7F9rRMfKOxLKvF/Ch3oQ5LcOsOPsOX4IHa4sS4xr7DuZ
         a84Q==
X-Gm-Message-State: AFuF++kiFtDC4bcNZ3btQLreJX3LXc4PCGWBT7tvzek48g3xqhcWzxVY
	3woVS85+NcNpuwKH2tyEYE0cBhu8sgU3vvttOQPrAByqDuVMV+KzNtlsE2jQpuqf
X-Gm-Gg: AYBFou0rlVym910lfVRHMSxjxtdfojOn0hI81RwutYItJKPVKOz8+aMJYs/WTZ9743y
	P7maoEjWxOfT2MAg3r+zEeJ2fwojAMX8sAs+JUWvwKEakCwTuIxuLAzIKbo4ZELJMK5xEU4kF2f
	xcU9y9uyn7LHp65APgvyiNfzvSYsD6hd4EYGfLMA7hp970XPX6eroQILAhUZZMCeKb/hSr28rRb
	h40KG2NTHgMAoyYSLtTgoI6ofydEvdiV9QZtQ3+jize2+GWT4LROb+jRaKk4klQ5q6HIs4QEQsg
	iR1tsSYCKZHBEElH3OFRdv9i6CDobdC7bNG35utM7L7S7Lq8pKHqj+fGwnpfEkhj2kb0E0B1ttO
	hypdgqI+JvHXtv/ADUMoen9xbfglURz/s4JCBg+0TwWRHF2+RwfKQLcJ7rZUF5VZAL7vCvjCDFf
	g42gT1i0cIgCnQeCJ6V7sejsdAgpXys+js3a4AXBfbrILF38IjM4uv54nfpQXQ+fkCKVybKVSsb
	4tlk3kPB0tMGvb4ZMTXv5IXfWTpxWCr
X-Received: by 2002:a05:600c:4f12:b0:49c:fc6c:be00 with SMTP id 5b1f17b1804b1-49cfc6cbfcamr388041945e9.23.1789052902962;
        Thu, 10 Sep 2026 08:08:22 -0700 (PDT)
Received: from [10.25.218.197] ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d24e01c66sm48739535e9.1.2026.09.10.08.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 08:08:21 -0700 (PDT)
Message-ID: <a41510f0-8906-4698-9919-b65b40cc9b89@gmail.com>
Date: Thu, 10 Sep 2026 08:08:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arm64: dts: freescale: add MR-NAVQ95 basic board
 support
To: Ahmad Fatoum <a.fatoum@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Frank Li <Frank.Li@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 elena.popa@nxp.com, consmin.stoica@nxp.com
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Pengutronix Kernel Team
 <kernel@pengutronix.de>, imx@lists.linux.dev
References: <20260909153943.1048-1-laurentiumihalcea111@gmail.com>
 <20260909153943.1048-3-laurentiumihalcea111@gmail.com>
 <f0136c29-e372-4ae9-972a-23d7a60d75e4@pengutronix.de>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <f0136c29-e372-4ae9-972a-23d7a60d75e4@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_080825_332564_54F3BF88 
X-CRM114-Status: GOOD (  26.56  )
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


Hi Ahmad,

On 9/9/2026 9:20 AM, Ahmad Fatoum wrote:
> Hi,
> 
> On 9/9/26 5:39 PM, Laurentiu Mihalcea wrote:
>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>
>> Add basic support for NXP's MR-NAVQ95 board. This board is designed for
>> robotics applications (e.g. drones, rovers, humanoids, etc..) and has the
>> following hardware feats (list is not exhaustive):
>>
>> * based on i.MX95 19x19 SoC
>> * 64GB eMMC
>> * up to 16GB of LPDDR5 memory
>> * 1 x USB 2.0 TypeC
>> * 1 x USB 3.0 TypeC
>> * 1 x RJ45 port with RTL8211 PHY
>>
>> The support targets revision B of the board.
>>
>> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>> ---
> 
>> +	chosen {
>> +		stdout-path = &lpuart1;
> 
> I would recommend instead "serial0:115200n8" here. This introduces no
> change for Linux, but for other consumers of the device tree, they will
> be able to agree on a common baudrate.

ACK, seems fine. If there's no other objections to this I'll make the switch
in V5.

> 
>> +	memory@80000000 {
>> +		device_type = "memory";
>> +		/* actual size filled in by the bootloader */
>> +		reg = <0x0 0x80000000 0 0x80000000>;
> 
> If the board has at least 2G always, this is fine.

the board only ships with 16GB LPDDR5 so yes, it'll always have at least 2GB.
While the current size is fine, maybe it would be better to change it to 16GB?
Will have to update the commit message as well since "up to 16GB of LPDDR5 memory"
might be a bit misleading.

my other option was to leave the size set to 0x0 like some QCOM DTSIs seem to do.
Not sure what the preferred way of handling this is?

> 
>> +&usdhc2 {
>> +	bootph-pre-ram;
>> +	bus-width = <4>;
>> +	cd-gpios = <&gpio3 0 GPIO_ACTIVE_LOW>;
>> +	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
>> +	pinctrl-1 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
>> +	pinctrl-2 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
>> +	pinctrl-3 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
>> +	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
> 
> Looks unexpected to have same pinctrl groups for the higher speeds.
> Are higher speed modes even possible on this board?
> 
> If not, I would suggest dropping the extra states.

The pin configuration is chosen to meet the timing requirements of the 200MHz
state. Because of this, I would expect the configuration to be appropriate for
lower frequencies as well.

The intention is to use the same configuration as MX95-19x19-EVK since, from what
I've been told, the trace lengths are similar to those of the EVK.

Thanks for taking the time to review this! :)


