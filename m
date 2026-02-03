Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AAE1E8307C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 10:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fscSYj6Edq1KO+eKiUWNHrblwvs+zwoKFQhpyWKzmWc=; b=K9b8u8y09Qap5oUVl3iYOrPNng
	H5u6YMxkT6ghRB+Mbi9nLyjmWY7aG8f3zwqRg3rzxIBhA/csP6ohtiNRPaR6Eoq6urecwDhoLfy4I
	d41FWeAc+1i7lKpbC54HnkOH5eTfH43tnwwL5ym5+0lwBPBhLwXqwFR4Od2/O2J2gv993E6Hzrb8f
	M9Au5gIdFXgbWWRYAnJH+6vQXEJrgj3RhLHG9Usit+0Mko9lHwEX03ZvB1H0/7pbFIJC2hmWOAzfr
	1MLWtBJHl8Fjyc/RFxgr40gSOXu17VACFHvFPbEraD163MAd66S/mlv5xEwSLjVKvH5QljYirqTsd
	NAvoi7Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnDT0-00000006SWh-0KuQ;
	Tue, 03 Feb 2026 10:17:06 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnDSx-00000006SWK-2e45
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 10:17:04 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-4359a302794so3713094f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 02:17:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770113822; x=1770718622; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fscSYj6Edq1KO+eKiUWNHrblwvs+zwoKFQhpyWKzmWc=;
        b=JBObwCAwMfbsvWmzdycaMYy3zgqXnK+hBnB6BQgoCy1DU9f+6jcmc/DneJvygmLs6j
         O3QWOFfirYAvo5FNRjSSV1XMzfmcx5swsfgS0aJT35i+HmHofbuQ/UhK8reuuUSTAZbx
         8BPpShEqJCYGmcKuPWPTzuU7C0Ii+WXarljU0St8Kb/L4EZIW9lLo2T2jjPbWXZsTSYW
         vC+8ob/Z+/J+jnq/jAn1BAgFWtcoYTwMC+pz+tIo4T6cTuc845EqkCZOPYjWpsdmv59x
         9kIS20DWXV6d3C8E6RJLQH2lMpzTYgLu0TZ0N6Suf7d9ZRLb3JdRZQLSWDsu+Bi98mub
         ko0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770113822; x=1770718622;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fscSYj6Edq1KO+eKiUWNHrblwvs+zwoKFQhpyWKzmWc=;
        b=LcHTrfBoRpHss8Qk6lF0K8RtRuSdc9HdZHawoOkuyZyWvfFQePguvPaHaEiX8QDi7S
         2Axf0CHT0QGqw2kJTOoCqIIg9d0Y+cq3bhooPwjL7QSpSpo3m4mXS3aWaactMsxEZHAr
         odQHJD7s//00XjD+4UQx6kruVP2Nqu9aOSgZ6/o6t6BM30DMtrrNYyDkAaBLGDPHNtp6
         212UGgXi1NJJceI9L39h5mFgv+IM26D3P5IcQrwYDvpYfYuqQ89WCtoCBTyqiHFWOVv0
         LUVRoRbGUkjBBEgIyHdPOyhAk6NxcfNCZv/Pm01y5Rob1e1Yab54+oghXkpk0zPP/PHh
         O76g==
X-Forwarded-Encrypted: i=1; AJvYcCVRsY3JkyWR6OP2Wg+mgt1mvXhqlFbaFrnl2vhE0pxJkwETPU77F/lThWid/z+i9A9zO0X9I8KSqAPg1dHJw9tc@lists.infradead.org
X-Gm-Message-State: AOJu0Yyi+0WCHNhycUz8UHBYaOG3aspBK7UiYpFe7ysRSjN7+rOT5gaM
	YW+ESYsVgzdIBLWCMbf4DWNC/827ZCaSQEc4tZ5JeSVXRlbgWh51Sc8u
X-Gm-Gg: AZuq6aJR9e5BoZxTvgjZWKYD7xXZdz2htlA6SVgS8YXO6fnNONrcEyGXe+CPSzkS78M
	rrghYl66ovA4v/5dmTFjiaB6vhobx69dsSRMJJJ/HINPUzFQFKXPLeDyL/aP5qLYaPF6XYyvQvm
	Brd05QysgcHNioPx5+vyhbJE7VzAhGxRYyELRY3LgwpfqGt03XRQYCLMfqQ02TGNCJZreYP/q5M
	7RFVmlnn3+vNAvPC05Ayx6bx9jGZrbA3F2SjVLak9WkfSfPAMnbMatKd+q8FjkfrQqHxwskStwO
	iMNwqWD3NcKjWz6df2h5vtIOCPIE4JKZ1RRW4zGHcMKGj3fuuAZCPczfGx1PwWr8MT5ZzvKkq66
	EPfEQ/m68rHdUxXNOLSxOzyckIBMbbkKMpu3+PJOtBpjtkBbg6xXsU5VHCHieLtovUS+E8bXRJa
	phSb+6IXjyRc21aI55fWSHs7u5mAC/o5RszKNrRx4mlQA=
X-Received: by 2002:a05:6000:2c01:b0:42f:8816:a509 with SMTP id ffacd0b85a97d-435f3ad2726mr23780172f8f.62.1770113821338;
        Tue, 03 Feb 2026 02:17:01 -0800 (PST)
Received: from [10.25.220.39] ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e135422csm53010801f8f.40.2026.02.03.02.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 02:17:00 -0800 (PST)
Message-ID: <d9c72c09-0b10-4b5a-a49a-ec93764bdbab@gmail.com>
Date: Tue, 3 Feb 2026 02:16:57 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] arm64: dts: imx95: Reserve eDMA channels 0-1 for
 V2X
To: Peng Fan <peng.fan@oss.nxp.com>, Joy Zou <joy.zou@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
 Peng Fan <peng.fan@nxp.com>, Ye Li <ye.li@nxp.com>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
References: <20260130-b4-imx95-v2x-v3-0-95af05bece95@nxp.com>
 <20260130-b4-imx95-v2x-v3-1-95af05bece95@nxp.com>
 <aYAYeQaGK2RUFQs6@shlinux89>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <aYAYeQaGK2RUFQs6@shlinux89>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_021703_688910_3FFE311C 
X-CRM114-Status: GOOD (  17.76  )
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


On 2/1/2026 7:22 PM, Peng Fan wrote:
> Hi Joy,
>
> Sorry to jump in at V3.
>
> On Fri, Jan 30, 2026 at 05:36:27PM +0800, Joy Zou wrote:
>> Reserve eDMA channels 0 and 1 on the AXI eDMA controller for exclusive
>> use by V2X (Vehicle-to-Everything) fast hash operations.
>>
>> Reviewed-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>> Tested-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>> Signed-off-by: Joy Zou <joy.zou@nxp.com>
>> ---
>> arch/arm64/boot/dts/freescale/imx95.dtsi | 2 ++
>> 1 file changed, 2 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
>> index 55e2da094c889fc7c1096d0e36f31ae118d2a982..9ac82da2ff440e08ae8378d7ff830a568d50a354 100644
>> --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
>> +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
>> @@ -631,6 +631,8 @@ edma2: dma-controller@42000000 {
>> 				reg = <0x42000000 0x210000>;
>> 				#dma-cells = <3>;
>> 				dma-channels = <64>;
>> +				/* channels 0 and 1 reserved for V2X fast hash */
>> +				dma-channel-mask = <0x3>;
> This is wrong. Per dt-binding,
> dma-channel-mask means Bitmask of available DMA channels in ascending order,
> The usage in this patch does not match the dt-binding.


Ah, good catch. It would seem like our EDMA driver reverses the meaning of the "dma-channel-mask"

bits (i.e. bit x set means channel x reserved instead of channel x available).


Now, I wonder how we should be proceeding with this. According to the DT binding, our devicetree

configurations are wrong. Since there seem to be only 8 upstream instances in which this property is

being used I guess it wouldn't be so difficult to correct the driver's behavior and then correct the

devicetrees?


