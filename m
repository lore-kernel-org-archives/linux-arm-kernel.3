Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2AB4C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 12:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vVwOc/plNKfiMmUT69quLhKzOtBT2oBK3V8CnUtJXVU=; b=EBzE15ar/zmO/jqnEsXBcJAhri
	CVQE7fhObBiY738kyy4WWl/eLuRF/8eGtLaFDPJH0Buyy2dUkpgYe449r8j4XhBiJhrN6a+T/Lg+A
	GgRcBO367Frb9vP8c3wIf6V28Rk1PXPp+KGhbr1/e1rvpu23BJME6dXOtmi1yjTgZR2B4VlmRMtfk
	GqOCnKRtv3ig4YOAuFAV6SzUxCo7/MiRkrT24/nh/+8zA7RvkvOehOJvhwtJpUO9mgg8Q0tdjmZjZ
	/7Dsz/MJ/rogphNC/o7IvZjlAl61PvBfJyVMJ/QPFYgNcpoF9lppTPYLmaLNtuE/89W6nKUjP6MSz
	I1JwwwOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh59i-0000000Eyye-1Rvs;
	Tue, 07 Jul 2026 12:44:06 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh59f-0000000EyvR-2RPC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 12:44:04 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-699fbcd23ccso5428191a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 05:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783428241; x=1784033041; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vVwOc/plNKfiMmUT69quLhKzOtBT2oBK3V8CnUtJXVU=;
        b=WDg+EvAu1E/lnXUZOxO5T3urdgLGuo8IVtfvN7vUs0Fhw8zsjTCcWs6ndN3Eavx1F/
         WnktzOLRMZwJy/kBkmFwwLaj9+xbfMoQ6DGKAFDcc0buuQic7S9ItYENhhAC8Pd+cu1I
         PX4iSH4kIr7kCZFl/A8F+ADvzJMvCN+R2osFyCSiSBF1UcWpXNGPphpM61wk0gtiCNo5
         2042Jpg1I/X/yp0JRWaH1eur+fWRabDWQl087kjG2f3aqQiZ7ompsCCkSJiOVY9H+FGN
         LAa1vvDi6N5m2QayAaFqtRIczdYXZwuZcDN/sHTqLMUhk3OfpMn7jheCT5KNanuHlNZc
         aMNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783428242; x=1784033042;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vVwOc/plNKfiMmUT69quLhKzOtBT2oBK3V8CnUtJXVU=;
        b=JVSS0uhIFl98FszOwhn8FimmZg7HC+tgJ8648nHqcSvp0eeAU5kY8l85/uQVnZrS/d
         ilZ5L2ampgRInnsYkADVSO/3xNlcKlt+I3ZPGMAKv/hr62hqQXGfZz3S/thMyr0Ex4v5
         yyMjOSRdj92HKw6xQ4G1BYBeqx6SIKC9uZJ/7KhKQ5PJtzDNm9JdvHuoBDloNIMTf4+x
         MZG4XwhbonS1Hx9ie8ApQkP8BpaFCjsCEkRO88U4RBmTSWGK/CDyVuh4UjKLwE8CQGdP
         nfv++a0RFSrCsD31W2PRotR/EfWzTrl8HRqVnT8le/V63fmt/u9N5s/IGkZGxO2g+zVR
         KU9A==
X-Forwarded-Encrypted: i=1; AHgh+RrX+a99/6v4gXSSc87B/kCZEZYD3m8Miu95OrgH6cqzjNak8/tqLPMyEW/JiQyuNeY/aiP8gJOxn51G7KvUvXwh@lists.infradead.org
X-Gm-Message-State: AOJu0YwuUeEew18gHoCJaOzr6QajisLPs6BN3WaaMmj3w58PSOMej1Bf
	6KszSXP2J2BjXmQ3Hei/cEJgcQNp1DVA53dhVMqUknNdSb2vGlGmLOKmnpGSCHaOT2g=
X-Gm-Gg: AfdE7cnHvmna492+2LSuljyGtHPJ467CXBhTR0RrgWihFExxD2TRbfsWzm11jXN+EPg
	QUxhO/jrkPH80SMZ2nCGoq/lDLzPMM1LESWrHijujUkCKrhc3TtzSqyRfhs1ynQXqSJBr+rPZj8
	Ju3F+6+Nw2qSzSM+rEsFrfVBFAGxkoFESKmmvjA/ItU4BB/IyMqVWWqPrkymyJRIRqX4zapWGIG
	iBKbWwh+KLvsbDr1pCylogcKHf5Hc1Y4AN+pYTtnA9qsvoOInrH9LhdA9oTXzmNd5JfW0EIMdNP
	UYGkJlBNV+5mhlUb40DWksnrh7axPEp7x3tF0CLHn6YKYgL+XSnX8h9kYOn9xtgz2Z3Br57IXDY
	zxPwegNEPC9M+3ga/+rU4WtSANGwyx+JWPzYoGDddptV+pGAUrpNDdnoLFkYaBzkCA3y1L+3RPs
	iqV1bZnFgIPxKi1+9wFAwmtvVX7Ki6NY5lnJJuJ7mkI1VEbuuA8NfwqeXdy3Kx
X-Received: by 2002:a05:6402:40cf:b0:69a:a4bb:bfc0 with SMTP id 4fb4d7f45d1cf-69aa4bbc2e2mr209995a12.11.1783428241439;
        Tue, 07 Jul 2026 05:44:01 -0700 (PDT)
Received: from [192.168.2.177] (48.85-85-171.dynamic.clientes.euskaltel.es. [85.85.171.48])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19ce4ad4sm5751522a12.12.2026.07.07.05.43.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 05:44:01 -0700 (PDT)
Message-ID: <53f3621f-3888-45f3-b319-95efa36fb0f2@suse.com>
Date: Tue, 7 Jul 2026 14:43:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] arm64: dts: broadcom: rpi-5: Add RP1 PWM node
To: Andrea della Porta <andrea.porta@suse.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 linux-pwm@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Naushir Patuck <naush@raspberrypi.com>,
 Stanimir Varbanov <svarbanov@suse.de>, Sean Young <sean@mess.org>,
 Julian Braha <julianbraha@gmail.com>
References: <cover.1783097764.git.andrea.porta@suse.com>
 <300b6fb4ba2c9399297b4bd85cbb3bc14f08f6b7.1783097764.git.andrea.porta@suse.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <mbrugger@suse.com>
Autocrypt: addr=mbrugger@suse.com; keydata=
 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
 PVrr2NoUqi/bxI8fFQJD1jVj8K0=
In-Reply-To: <300b6fb4ba2c9399297b4bd85cbb3bc14f08f6b7.1783097764.git.andrea.porta@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_054403_659695_EA6A756D 
X-CRM114-Status: GOOD (  15.74  )
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



On 03/07/2026 19:05, Andrea della Porta wrote:
> From: Stanimir Varbanov <svarbanov@suse.de>
> 
> The RP1 chipset used on the Raspberry Pi 5 features an integrated
> PWM controller to drive the cooling fan.
> 
> Add the corresponding DT node for this PWM controller.
> 
> Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
> Co-developed-by: Andrea della Porta <andrea.porta@suse.com>
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>

Reviewed-by: Matthias Brugger <mbrugger@suse.com>

> ---
>   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts | 12 ++++++++++++
>   arch/arm64/boot/dts/broadcom/rp1-common.dtsi     |  9 +++++++++
>   2 files changed, 21 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
> index 0fc57e72632ed..748be8f1ee9e2 100644
> --- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
> +++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
> @@ -64,6 +64,12 @@ phy1: ethernet-phy@1 {
>   };
>   
>   &rp1_gpio {
> +	fan_pwm_default_state: fan-pwm-default-state {
> +		function = "pwm1";
> +		pins = "gpio45";
> +		bias-pull-down;
> +	};
> +
>   	usb_vbus_default_state: usb-vbus-default-state {
>   		function = "vbus1";
>   		groups = "vbus1";
> @@ -94,6 +100,12 @@ &rp1_i2c6 {
>   	pinctrl-names = "default";
>   };
>   
> +&rp1_pwm1 {
> +	pinctrl-0 = <&fan_pwm_default_state>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +};
> +
>   &rp1_usb0 {
>   	pinctrl-0 = <&usb_vbus_default_state>;
>   	pinctrl-names = "default";
> diff --git a/arch/arm64/boot/dts/broadcom/rp1-common.dtsi b/arch/arm64/boot/dts/broadcom/rp1-common.dtsi
> index 16f5359395835..df4c2d09c8d34 100644
> --- a/arch/arm64/boot/dts/broadcom/rp1-common.dtsi
> +++ b/arch/arm64/boot/dts/broadcom/rp1-common.dtsi
> @@ -99,7 +99,16 @@ rp1_i2c6: i2c@40088000 {
>   		clocks = <&rp1_clocks RP1_CLK_SYS>;
>   		i2c-scl-rising-time-ns = <65>;
>   		i2c-scl-falling-time-ns = <100>;
> +		status = "disabled";
> +	};
>   
> +	rp1_pwm1: pwm@4009c000 {
> +		compatible = "raspberrypi,rp1-pwm";
> +		reg = <0x00 0x4009c000  0x0 0x100>;
> +		clocks = <&rp1_clocks RP1_CLK_PWM1>;
> +		assigned-clocks = <&rp1_clocks RP1_CLK_PWM1>;
> +		assigned-clock-rates = <50000000>;
> +		#pwm-cells = <3>;
>   		status = "disabled";
>   	};
>   


