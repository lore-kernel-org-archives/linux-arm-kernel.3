Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF8AED3B7F1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 08:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0KGuZp0wmnF7hzmfITp90xIKhOfwwLfqha6id3DNJEw=; b=ue5BRVMUQAnwhpcwhwcKeHvGXp
	2k6c9kA0bDJ6ppJuQqlUnBSaFzi/MmcVJjn5fIBG4uMWS9By2GcZvLxpEN3L6K8kaFjQ9EpytqtN1
	ldRt9R63j2xRgm7KteBKAR1BJysETlRZeK63tluc904K10oQsg3+sUrtpoXDiR3yXhqDZl21/gwr6
	8fRV6YGV9QLifHwT4h5UgD5hQWjjgYvkA+FTGCcmcEKzET/lG2vpFEOwD1AMFqHHTbMFpNQChsAeo
	HTZH+yhY5LpvIP3uk45hxj0zmwoUeg6rp/shFju1f47WAewezCWOJgfNf9yHTF5MG+fyXT6FcOFrA
	o27Ri4UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFUfZ-00000007QS3-2IIT;
	Mon, 25 Nov 2024 08:42:09 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFUdH-00000007Q5f-0l7S
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 08:39:48 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-724f81cc659so1072684b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Nov 2024 00:39:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732523986; x=1733128786; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0KGuZp0wmnF7hzmfITp90xIKhOfwwLfqha6id3DNJEw=;
        b=DOw0PIJH8so3yCTKexQquoRmsaBLGWijs0oa+IwQHOzm31MrP5fWSQI6+Bo1yswDn1
         JX9PgT3i3GraF0gfmlOrgLumhi4FprwjdTcVGFkQZjYvo9ZGWSpFCCB8TLBeOdqXFic1
         b4kaggchM7GpDYOYHii02+Y9y7TCzl9OUYowI/NW/zkgqhIuc2I8A/5AGEV59J7WtQ4V
         hfx3iJvBvvrz1fUSm7TJuDyObpObQ+Nc0ygAZNbOnzaGKvm1u3L3FCRp0XmCkpABkeSX
         hWLf6hFZbeuaU24wAeG9zNyYnhECWz2UsYzdxqLt8bkr4k55Os/x5FYqw2CHmANWCyPT
         twiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732523986; x=1733128786;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0KGuZp0wmnF7hzmfITp90xIKhOfwwLfqha6id3DNJEw=;
        b=AAROgbqpJpgDSdC32jk/Acv/cVUL6cQpE3ABLkYjfkDmX7aKreoUALcCMZIsclkd+Y
         OnVUjsBEGo5JnhfpLOhatCLnZJcNaq6x8FYEZtcvfA4yHB3XbOKIWSIATZoqy20OjP98
         bDXsLfvsVqT9plERyf0aY9v2ec/9GUes7gDsbiR0xkafH2PzeR7DgK66qhSgW29jYvhw
         gjdWpBLZFHoMotvKAw34dAazr4DP8UxszIvWOiDXSjklSf7N8ZRwQUjE2zrM6YMejnPh
         5u+pUdhmQaErP6kBPXRLPvO9hJ0njrKGBm2qPdOZ4/OI7GzkJxHpdlcTBq9BAaCLPT1Z
         yFqQ==
X-Gm-Message-State: AOJu0YzNZtZkgRO19MfhckriKEUJjg8uahVRJYeo2OGYDqzAab6rh8Mi
	pXaeWxjn6i4U9qJKpaIzMCOmnK/IvmKJ/1d8iPWCbWlJLCxg98aP
X-Gm-Gg: ASbGnctsdFERDkIZ+tk5NJqBregPMw5fONrDBpB3dxRXvp+pk1iebahthDU6Nr0ii24
	UarS0dspkB3m6qGsHunX2CDd4fkRK/wXdbisB0kBA63NPOcdOtwWfL/EDvGsYr6yX7mpkAN2bmh
	BOx6YgArGQrEmI6aSE4CBUsn+Hut7PyKWo/wtZ+vbWRrRBHdB7Vr0Vg4j8gOnduTEzIguTr0K0F
	jyHvNlo5tYM8wxNwtoVA4BDmJvXq7pwbDb8RMO/MLYCB/pSaKJlmqIQZ6L/E6jR76x8
X-Google-Smtp-Source: AGHT+IHU1nyBULHIR2177tUcXa0ze8GqotcNDT6gsNhsvTrJblPUvYHMUa+RMDMyUkRWs6wbq9n4YA==
X-Received: by 2002:a05:6a00:1251:b0:71e:cb:e7bf with SMTP id d2e1a72fcca58-724df66a8abmr14741216b3a.18.1732523985898;
        Mon, 25 Nov 2024 00:39:45 -0800 (PST)
Received: from [192.168.0.115] ([59.188.211.160])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724de454c55sm5838914b3a.35.2024.11.25.00.39.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Nov 2024 00:39:45 -0800 (PST)
Message-ID: <4381e1ef-6113-4fe5-a48a-ea4c163dd103@gmail.com>
Date: Mon, 25 Nov 2024 16:39:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: apple: Add touchbar screen nodes
To: fnkl.kernel@gmail.com, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Janne Grunau <j@jannau.net>
References: <20241124-adpdrm-v1-0-3191d8e6e49a@gmail.com>
 <20241124-adpdrm-v1-4-3191d8e6e49a@gmail.com>
Content-Language: en-US
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <20241124-adpdrm-v1-4-3191d8e6e49a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_003947_218698_58EF79A7 
X-CRM114-Status: GOOD (  15.67  )
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



Sasha Finkelstein via B4 Relay 於 2024/11/25 早上6:29 寫道:
> From: Sasha Finkelstein <fnkl.kernel@gmail.com>
> 
> Adds device tree entries for the touchbar screen
> 
> Co-developed-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
>  arch/arm64/boot/dts/apple/t8103-j293.dts |  8 ++++++++
>  arch/arm64/boot/dts/apple/t8103.dtsi     | 26 ++++++++++++++++++++++++++
>  arch/arm64/boot/dts/apple/t8112-j493.dts | 15 +++++++++++++++
>  arch/arm64/boot/dts/apple/t8112.dtsi     | 25 +++++++++++++++++++++++++
>  4 files changed, 74 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/apple/t8103-j293.dts b/arch/arm64/boot/dts/apple/t8103-j293.dts
> index 56b0c67bfcda321b60c621de092643017693ff91..349a8fce6b0b8ccf3305f940ba7242e2c1a67754 100644
> --- a/arch/arm64/boot/dts/apple/t8103-j293.dts
> +++ b/arch/arm64/boot/dts/apple/t8103-j293.dts
> @@ -49,3 +49,11 @@ &i2c4 {
>  &fpwm1 {
>  	status = "okay";
>  };
> +
> +&display_dfr {

Inconsistent placement of #address-cells and #size-cells.
> +	status = "okay";

There should be a blank line here.
> +	dfr_panel: panel@0 {
> +		compatible = "apple,summit";
> +		reg = <0>;
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/apple/t8103.dtsi b/arch/arm64/boot/dts/apple/t8103.dtsi
> index 9b0dad6b618444ac6b1c9735c50cccfc3965f947..b377c92c5db3cb4fea53ae2c5dd85acf038429a3 100644
> --- a/arch/arm64/boot/dts/apple/t8103.dtsi
> +++ b/arch/arm64/boot/dts/apple/t8103.dtsi
> @@ -356,6 +356,32 @@ cpufreq_p: performance-controller@211e20000 {
>  			#performance-domain-cells = <0>;
>  		};
>  
> +		display_dfr: display-pipe@228200000 {
> +			compatible = "apple,t8103-display-pipe", "apple,h7-display-pipe";
> +			reg-names = "be", "fe", "mipi";
> +			reg = <0x2 0x28200000 0x0 0xc000>,
> +				<0x2 0x28400000 0x0 0x4000>,
> +				<0x2 0x28600000 0x0 0x100000>;
> +			power-domains = <&ps_dispdfr_fe>, <&ps_dispdfr_be>, <&ps_mipi_dsi>;
> +			interrupt-parent = <&aic>;
> +			interrupts = <AIC_IRQ 502 IRQ_TYPE_LEVEL_HIGH>,
> +				<AIC_IRQ 506 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "be", "fe";
> +			status = "disabled";
> +			iommus = <&displaydfr_dart 0>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;

Inconsistent placement of #address-cells and #size-cells.
> +		};
> +
> +		displaydfr_dart: iommu@228304000 {
> +			compatible = "apple,t8103-dart";
> +			reg = <0x2 0x28304000 0x0 0x4000>;
> +			interrupt-parent = <&aic>;
> +			interrupts = <AIC_IRQ 504 IRQ_TYPE_LEVEL_HIGH>;
> +			#iommu-cells = <1>;
> +			power-domains = <&ps_dispdfr_fe>;
Not every M1 (T8103) device has a touch bar. Disable it here and
then enable it in t8103-j293.dts.

> +		};
> +
>  		sio_dart: iommu@235004000 {
>  			compatible = "apple,t8103-dart";
>  			reg = <0x2 0x35004000 0x0 0x4000>;
> diff --git a/arch/arm64/boot/dts/apple/t8112-j493.dts b/arch/arm64/boot/dts/apple/t8112-j493.dts
> index 0ad908349f55406783942735a2e9dad54cda00ec..80e371495f3e097f91e94549c7ac2949609f566f 100644
> --- a/arch/arm64/boot/dts/apple/t8112-j493.dts
> +++ b/arch/arm64/boot/dts/apple/t8112-j493.dts
> @@ -35,6 +35,21 @@ led-0 {
>  	};
>  };
>  
> +&display_dfr {
> +	status = "okay";
status should be after other properties, before child nodes.

> +	#address-cells = <1>;
> +	#size-cells = <0>;

Inconsistent placement of #address-cells and #size-cells. I would place
them in
t8112.dtsi.
> +
> +	dfr_panel: panel@0 {
> +		compatible = "apple,summit";
> +		reg = <0>;
> +	};
> +};
> +
> +&displaydfr_dart {
> +	status = "okay";
> +};
> +
>  /*
>   * Force the bus number assignments so that we can declare some of the
>   * on-board devices and properties that are populated by the bootloader
> diff --git a/arch/arm64/boot/dts/apple/t8112.dtsi b/arch/arm64/boot/dts/apple/t8112.dtsi
> index 1666e6ab250bc0be9b8318e3c8fc903ccd3f3760..726b11376692580abb129b9be35107bee1550a93 100644
> --- a/arch/arm64/boot/dts/apple/t8112.dtsi
> +++ b/arch/arm64/boot/dts/apple/t8112.dtsi
> @@ -379,6 +379,31 @@ cpufreq_p: cpufreq@211e20000 {
>  			#performance-domain-cells = <0>;
>  		};
>  
> +		display_dfr: display-pipe@228200000 {
> +			compatible = "apple,t8112-display-pipe", "apple,h7-display-pipe";
> +			reg-names = "be", "fe", "mipi";
> +			reg = <0x2 0x28200000 0x0 0xc000>,
> +				<0x2 0x28400000 0x0 0x4000>,
> +				<0x2 0x28600000 0x0 0x100000>;
> +			power-domains = <&ps_dispdfr_fe>, <&ps_dispdfr_be>, <&ps_mipi_dsi>;
> +			interrupt-parent = <&aic>;
> +			interrupts = <AIC_IRQ 614 IRQ_TYPE_LEVEL_HIGH>,
> +				<AIC_IRQ 618 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "be", "fe";
> +			status = "disabled";
> +			iommus = <&displaydfr_dart 0>;
> +		};
> +
> +		displaydfr_dart: iommu@228304000 {
> +			compatible = "apple,t8110-dart";
> +			reg = <0x2 0x28304000 0x0 0x4000>;
> +			interrupt-parent = <&aic>;
> +			interrupts = <AIC_IRQ 616 IRQ_TYPE_LEVEL_HIGH>;
> +			#iommu-cells = <1>;
> +			power-domains = <&ps_dispdfr_fe>;
> +			status = "disabled";
> +		};
> +
>  		sio_dart: iommu@235004000 {
>  			compatible = "apple,t8110-dart";
>  			reg = <0x2 0x35004000 0x0 0x4000>;
> 

Nick Chan

