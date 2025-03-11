Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 474A6C28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 08:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/wBUIzbfRjL8cYbjpKbIUr1nM3k/ZT4ERi+YMbxa2AA=; b=lmcb8AhEQGvuIg0TBvD7ZvLEMB
	XAU6olLn9D2cpb0JM+7sL4OVNstGoWbQWiZOOM5p5HT4Su4jwdjOcn8K0Pw4W2rTsjYThIvFaZiOD
	rwzG76h5KpmbjQCKo9m5Ighndgx4IQpTWVcjfvssL13BB6IQKGyV4uwK39yPt7T8p/5qeisdpXuin
	Vs4ZdNBT5Ij9krUQ9Z7dVir2vk2u5qs9F5D37UysaXfof/wRhiI/+agSbMXhFDMG1weZLWzJNGQsS
	jhywm/oGfrJz5WNKHrEUHdJAtpsY9l7CpOusmwpp/bWTJh+2BfEfyujeuEAQym+YknxcGKViDemJC
	z/huFyyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trv1z-000000050Ub-0vZT;
	Tue, 11 Mar 2025 08:32:07 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trv0L-000000050G9-2gnM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 08:30:26 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-aaee2c5ee6eso705615866b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Mar 2025 01:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741681823; x=1742286623; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/wBUIzbfRjL8cYbjpKbIUr1nM3k/ZT4ERi+YMbxa2AA=;
        b=DzvDKqWO87bUJPLgxpcTMv/Hi6HMCrnyRR6ffqnPk0qvPjKQYBo8jZPVonVd7kyhbV
         CfCj9XfyVA2GI8Yq8xonHT3LunUFH+mlNOX1TD/VF7OnifeSpObtEV/HSMuV/k4kXGxc
         HkNKWDNc/Oy9sdNC8ImDgogVh86419HXkRoqk6lnpyoK0jAPXa0PfOzn2F+PRf8E8sW5
         kKcJcTv5qKoo0Y/2GZCrcbl0O21OMLMvdyhx8QcT9LzS80bd/cWWLPWTTmshy08e0VCd
         qoCj+ewnRN+P0RO/eY7DFbqYXaOnV9UrksNI5N482DDQ5iiRH7pEgnE2JuYeDmzF9eLl
         R1gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741681823; x=1742286623;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/wBUIzbfRjL8cYbjpKbIUr1nM3k/ZT4ERi+YMbxa2AA=;
        b=d4kZBwxGzVXYwwkqL0oPsSLfuRmtGMUvIro54Gb4vPMdm2B6Zbw4Y+EpI+g4mS3liF
         +6pye1kosd0t1P6sSFrBPQudCUBR5MZWof+LF9lZpHbZDXHsQ5A+ryqILaSiGI6kjMoo
         vhR4uRbXfxSiAjcZlvXVNctCYpvkgb8I/P4cVYLdLKS17dsggmTkL83t7CTU6ZFOXsdQ
         7oXNzoauXOz+gDERHlS8lqfIkfsXxnHac9P/WpkXL/uMiZT3YQEeiKWOxsVoTwlpi0qo
         g6X1L5K1Je746p1aZeq/mvPQEJaQoIUHm7iS8+CnPbcvziA1LV5D3M6YMh1yq0QVHvwJ
         i6Tg==
X-Forwarded-Encrypted: i=1; AJvYcCWPmTZ05fgUEj4+KXowRz+fmTWXNU12CCbNx04E5PEefqcMmzkA8FsRBrjn7/JcTUfkYlxRMil4KpeIeCDV/9+q@lists.infradead.org
X-Gm-Message-State: AOJu0YyuFbUobQv5dLLvdpK8W095z81Sxe1db48gew3zx1haOcKmjogS
	boxDCmt+i7aalRsLD2LMwZk+WHazDnnKS4OTajace1QA42s2EO+8
X-Gm-Gg: ASbGncvMUaipj+mq3E8KDLkz0GtkTvqCwZId2Cf+13SY7zPU4SeGy/HseHuUyJrn9tA
	tT5vGPNHIF7siZUhQt7ls3I6inIAMzIJxNrcD4yznk88igc3ZsKb9aLgFKsxEml5DxQZ4m9KmPW
	Ju9WJPBuU5W648H4/e6ZUAgVaALaaccWJjeat1WyC3HWNTBD6cAEO3+7LIbN8zgPDOWJWc7aLMY
	+IIJ9C3QLba+WN9/8vUnEoz+Vqb2gyIfEFAnNVKrpuiXaKSOV/CRe5xjKvZPyGQ8frbyKH46gV5
	8ac0BrxgckRHNXcgvDD+YubF5nYQfnM9U/BkKIpOO1AGxMOcZggKYw==
X-Google-Smtp-Source: AGHT+IED4/BdBzDJtL90V4GvyA5vlzRx5/AdyTSCLrwu2fkiBvJHxCgGCstqtAFDn9HSo6VY65AMJw==
X-Received: by 2002:a17:907:6d08:b0:abf:742e:1fd7 with SMTP id a640c23a62f3a-ac253096a6amr2126965266b.57.1741681822638;
        Tue, 11 Mar 2025 01:30:22 -0700 (PDT)
Received: from [192.168.1.130] ([188.193.103.108])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac2394825efsm877216566b.45.2025.03.11.01.30.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Mar 2025 01:30:22 -0700 (PDT)
Message-ID: <23c708ef-c52d-40c1-a9e8-b05555b21667@gmail.com>
Date: Tue, 11 Mar 2025 09:30:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] ARM: dts: stm32: add initial support for
 stm32mp157-ultra-fly-sbc board
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?B?R29yYW4gUmHEkWVub3ZpxIc=?=
 <gradenovic@ultratronik.de>, =?UTF-8?B?QsO2cmdlIFN0csO8bXBmZWw=?=
 <bstruempfel@ultratronik.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20250310154804.326943-1-goran.radni@gmail.com>
 <20250310154804.326943-5-goran.radni@gmail.com>
 <6af3a9fe-0c0b-497d-b143-77edc12f0c1e@kernel.org>
Content-Language: en-US
From: Goran Radenovic <goran.radni@gmail.com>
In-Reply-To: <6af3a9fe-0c0b-497d-b143-77edc12f0c1e@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_013025_679472_B9A891FE 
X-CRM114-Status: GOOD (  15.47  )
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

Thank You for the feedback. I will fix this. I have to solve the problem 
with my e-mails in MAINTAINERS first, because I cannot use them to send 
e-mails "inline".

Best regards
Goran


On 10.03.25 17:08, Krzysztof Kozlowski wrote:
> On 10/03/2025 16:48, Goran Rađenović wrote:
>> +&gpioj {
>> +	gpio-line-names =
>> +	"", "", "", "", "", "", "", "",
>> +	"", "", "", "", "", "", "", "";
>> +};
>> +
>> +&gpiok {
>> +	gpio-line-names =
>> +	"", "", "", "", "", "", "", "",
>> +	"", "", "", "", "", "", "", "";
>> +};
>> +
>> +&gpioz {
>> +	gpio-line-names =
>> +	"", "", "", "#SPI_CS2", "", "", "", "",
>> +	"", "", "", "", "", "", "", "";
>> +};
>> +
>> +&gpu {
>> +	status = "okay";
>> +};
>> +
>> +&i2c1 {
>> +	pinctrl-names = "default", "sleep";
>> +	pinctrl-0 = <&i2c1_ux_pins_a>;
>> +	pinctrl-1 = <&i2c1_ux_pins_sleep_a>;
>> +	i2c-scl-rising-time-ns = <100>;
>> +	i2c-scl-falling-time-ns = <7>;
>> +	status = "okay";
>> +	/delete-property/dmas;
>> +	/delete-property/dma-names;
>> +
>> +	rtc@32 {
>> +		compatible = "epson,rx8900";
>> +		reg = <0x32>;
>> +		epson,vdet-disable;
>> +		trickle-diode-disable;
>> +	};
>> +};
>> +
>> +&i2c4 {
>> +	pinctrl-names = "default", "sleep";
>> +	pinctrl-0 = <&i2c4_ux_pins_a>;
>> +	pinctrl-1 = <&i2c4_ux_pins_sleep_a>;
>> +	i2c-scl-rising-time-ns = <185>;
>> +	i2c-scl-falling-time-ns = <20>;
>> +	status = "okay";
>> +	/delete-property/dmas;
>> +	/delete-property/dma-names;
>> +
>> +	pmic: stpmic@33 {
> Node names should be generic. See also an explanation and list of
> examples (not exhaustive) in DT specification:
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
>
> pmic?
>
>> +		compatible = "st,stpmic1";
>> +		reg = <0x33>;
>> +		interrupts-extended = <&exti 0 IRQ_TYPE_EDGE_FALLING>;
>> +		interrupt-controller;
>> +		#interrupt-cells = <2>;
>> +		status = "okay";
> Does not look disabled
>
>
> ...
>
>
>> +	dac_ux_ch2_pins_a: dac_ux-ch2-0 {
> No underscores in node names.
>
>> +		pins {
>> +			pinmux = <STM32_PINMUX('A', 5, ANALOG)>;
>> +		};
>> +	};
>> +
>
>
>
> Best regards,
> Krzysztof

