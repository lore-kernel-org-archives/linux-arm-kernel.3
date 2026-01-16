Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E59A5D4A61A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 09:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ABv8OdJi32Gg0FcjWxhtSwfXTwcweC/Wx9N7YPA9N0A=; b=OwujhrNp/nJFBygeSEWiN+qn9O
	lcPBRAJNsUE2+ZdUKF3ZjHKxch6u9yi150RT0NnVn9ctipAUIMHxHHo2PjpOFy5xflNh109yIGAVR
	Pbza14CZDzKFGnnV5Set9he0V8UsO4S1Y7FhKxmkmKBYHU9j3yr8R/ib8l2Uk+hiWoD+QxDRCn4Xz
	s9B4aYIq6wkK48s6ibBrvoz8zm+RpjqUiU+ik5iyvpaYb+LtEnWW56H/RWxcQzeVHXAXyll0jcGD+
	8LvhpYMuMI3l9mODbWJNWSDd02t+N+Eo4qxDxMEiXsHg+iULoxzqwVCpsUhhbpaPcMAzpUmF38MM+
	jzWThwZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vggM7-0000000DsXT-0GNf;
	Fri, 16 Jan 2026 09:42:59 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vggM3-0000000DsWc-25b9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 09:42:57 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-38314d36df7so1922321fa.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Jan 2026 01:42:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768556573; x=1769161373; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ABv8OdJi32Gg0FcjWxhtSwfXTwcweC/Wx9N7YPA9N0A=;
        b=BhvX8sPj/eSW8K0yO2gaiWAiMl7Xg0xkXXxXummZEc0Xnh+YJxBulVjgGU4up6NNGH
         W/ZZOWqi4oBY9WP32kV2vbkBzP5zANNnZXs3Gb2Iy5NOclWARw0xSjloXQ9jDBvNCMCP
         Jfni+7Yi7XoFk2DCxESA82qudDjYPWF7hW2dQ33w7jUPdaeSx3tt1Z0jMO4k8kKZ6Cew
         x6Spg+pn8bOOPiQ22k2xhhVQ0wH9miLl+Ijh6+oUTbC5MXnkZ9jiPn2OwinPJNuIdV7d
         /GdmIFwAmrj/j6Y+FBHa4cggLfggwTHegOTxn5a3uQGgc7d5OHAF2wmhXag0Qz707mpq
         FQ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768556573; x=1769161373;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ABv8OdJi32Gg0FcjWxhtSwfXTwcweC/Wx9N7YPA9N0A=;
        b=ES27dBdw3do1XVptLh1mDXV3XZxB9YFup3+Bzq9bTPL9GtUVfkLnBcBC1eGky67itg
         cQdT2goaH7vsEzNmzFEFuya+RqBL2PkX3Bt0FZBLVy6BiK151VFM3wGkRpDcS9obRWnO
         JLdHuqrzHhNcfJ1ZIl8U0hX9WnBut7d8TH6dXMY6bhktKYbeKZvFICxTQWGH6i9FO2fQ
         l0/7IbZlTVF4CN0w70Z6eO9p3dvmevt+Z5ujq4gi1dPDVry26P4j0EDQg615Kk5/RScV
         S4LWtBilcHMceIULOSNLHwwX3VU/xAzbMEvQ+U10TUpauwjxqQ7H63rtjv4+IZJqJHSJ
         B6UQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5m0OLnPZYgevCqMKcDOTSUjMjjGbGGh2utt78lF2djswYefAsPKFB4RQhjs3QjKOoPRndzzmzN9ca0X131Cd0@lists.infradead.org
X-Gm-Message-State: AOJu0YzAP6NFThdZ9CXcooA8UynajYku1wV7pGZVNOOJXrW9B9EOo916
	u5Qb1kTFmSxmQTsAIkE+9DRc+lPdjOwyxoClB0upWyNkrlS/EAzb/rVnWpMlndK3uug=
X-Gm-Gg: AY/fxX4dOsbas3CaTcVeCEAT3bt1qqZBy0geuaMfzioCCd4W+jmdvmhJRiz7PEdsxuX
	vW43cobi7pu2DaSGsnnxK0hh5z0XdAEX8yfziL28/YlC4m2/ZiAI82FkbN0nP5gU77bnJ1A5YsW
	RgVwpzaCJC2aUCzwllAYPQNzt6jDHbcO4dCSaGLHMuFkVKebhNylUrtM+mqNfk8fgRbUFByz6Zf
	ahUyci/1M/FZZI1GN67L5vRn+57CNq5BwKTZogS54SWn+6rzqsYHNIrswiTUY5pilSh01grMytK
	zSLY2IzawStB54x3clP7/PK/DvR5A1LTP+QGO/rw7XJx8nWIhJgOr/BxrodVvYCVNx09qX3/Lff
	hwGXWXR+sxRNtY3sX+QBHUmFyzTvvbvXkuPURhMTSRlOoD7KyIii5aSP4aT6q9oCKmrf384HczA
	ORYWxIDVonP728Fun/Rph3ioh62B/EcGN1qCJmHyEzXbR/j0QdHZ0GbK7yg3BZ6X6bLQ==
X-Received: by 2002:a05:6512:1514:20b0:597:d790:a1a2 with SMTP id 2adb3069b0e04-59baef18155mr314794e87.8.1768556573145;
        Fri, 16 Jan 2026 01:42:53 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf33e82dsm618507e87.11.2026.01.16.01.42.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jan 2026 01:42:52 -0800 (PST)
Message-ID: <e081fa74-9e0b-4e54-a51d-eee97ae6f4fa@linaro.org>
Date: Fri, 16 Jan 2026 11:42:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] arm64: dts: qcom: talos-evk-camera: Add DT overlay
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20260115-sm6150_evk-v3-0-81526dd15543@oss.qualcomm.com>
 <20260115-sm6150_evk-v3-5-81526dd15543@oss.qualcomm.com>
 <3b16ffa2-1580-426c-aa9c-f377d913d49c@linaro.org>
 <e27deffc-bbcc-48bc-9e4e-ce52698d98f3@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <e27deffc-bbcc-48bc-9e4e-ce52698d98f3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_014255_565458_C75AA465 
X-CRM114-Status: GOOD (  13.41  )
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

On 1/16/26 11:32, Wenmeng Liu wrote:
> 
> 
> On 1/16/2026 5:12 PM, Vladimir Zapolskiy wrote:
>> On 1/15/26 12:12, Wenmeng Liu wrote:
>>> Enable IMX577 via CCI on Taloss EVK Core Kit.
>>>
>>> The Talos EVK board does not include a camera sensor
>>> by default, this DTSO has enabled the Arducam 12.3MP
>>> IMX577 Mini Camera Module on the CSI-1 interface.
>>>
>>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>>> ---
>>>    arch/arm64/boot/dts/qcom/Makefile                  |  3 ++
>>>    .../boot/dts/qcom/talos-evk-camera-imx577.dtso     | 63 ++++++++++++
>>> ++++++++++
>>>    2 files changed, 66 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/
>>> qcom/Makefile
>>> index
>>> 00652614e73582fa9bd5fbeff4836b9496721d2d..be9aeff2cd1555bc436e1b8eb78d8e1c9b84f9c4 100644
>>> --- a/arch/arm64/boot/dts/qcom/Makefile
>>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>>> @@ -339,8 +339,11 @@ dtb-$(CONFIG_ARCH_QCOM)    += sm8650-qrd.dtb
>>>    dtb-$(CONFIG_ARCH_QCOM)    += sm8750-mtp.dtb
>>>    dtb-$(CONFIG_ARCH_QCOM)    += sm8750-qrd.dtb
>>>    dtb-$(CONFIG_ARCH_QCOM)    += talos-evk.dtb
>>> +dtbo-$(CONFIG_ARCH_QCOM)    += talos-evk-camera-imx577.dtbo
>>
>> Please remind me, what does dtbo-y Makefile target serve for?
> Rob mentioned:
> https://lore.kernel.org/all/20260106192609.GA2581379-robh@kernel.org/

It'd be better to ask Rob about it, I suppose that the concern may be about
a missing in the qcom/Makefile mechanism to build standalone .dtbo artefacts.

> I checked, dtbo- is not an upstream usage, it will be updated form

Right, that's why it attracted the attention.

> dtbo-$(CONFIG_ARCH_QCOM) to dtb-$(CONFIG_ARCH_QCOM) in the next version.
> 

But...

>>> +talos-evk-camera-imx577-dtbs    := talos-evk.dtb talos-evk-camera-
>>> imx577.dtbo
>>>    talos-evk-lvds-auo,g133han01-dtbs    := \
>>>        talos-evk.dtb talos-evk-lvds-auo,g133han01.dtbo
>>> +dtb-$(CONFIG_ARCH_QCOM)    += talos-evk-camera-imx577.dtb

it's already here and it was here in the previous version.

-- 
Best wishes,
Vladimir

