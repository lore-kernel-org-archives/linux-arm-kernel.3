Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDAB2C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 09:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oUZnZ1nzA1VahWTXdD9nimd4WKEUhUq33YKSElfIzC4=; b=q56kilY6m+t42NVDt9/4vZSaU6
	8Y/UsP+5oMNOV1HXzOpqJZeiTNSQ1hlgJ/cnjdlGhBuULbn1qX/RtknVNWFNu8yMJNUrAuZzDI0qY
	GRnR19uZf6kbwnsILd4xqCOSO14HSEA8jhJM3smVKyeuekC6AMSMTkeiCsY/do+Wb3T4U0XpvPS0l
	yDPhL0vMoX+5EibCs+u9wdmy3+WNlryGQZZzYIVWp7C3OkqHftaR3kyuzmZiV1JRB0eIaKNjN30bW
	x4WEWBGhLlB8KwjPVv+vcAjDFUcO/eL/iTwB7tGqhJM0GsSd0ne8X7LOBkhPKtbknUM25E+s0zosr
	kT6lH6pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFV3T-00000000BqS-3eBg;
	Thu, 15 May 2025 09:39:07 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFUtT-000000009tP-1Puz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 09:28:48 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-550e505538aso23881e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 May 2025 02:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747301325; x=1747906125; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oUZnZ1nzA1VahWTXdD9nimd4WKEUhUq33YKSElfIzC4=;
        b=aKsFgk0IiFViEI3lS4lDTWT6d14xvJE0M2aDx3hI840Wg2wC6U6g6l4Pj/Qymil2Mp
         37l2YDkH9OUkPvYwHEfzgTVV/eNfV1oBo8pyUkIjAjU40plNletNiy7C4uiyCOziNUwm
         zV29P/b6vObf4ATg5jV1JiPmkTbQxJgaTQSL6pyYlOeBEy5osM1DBbaiea3GY9cLzr7L
         oP9nbF07eWyvWQV8ZGSmbBNH6PvraxEVfRBxoSETCTRvITfPDLZCmrbKP/3qnhk6n22l
         HJkbDtpARZAbBW6UtLVFba4y1/OJrWvkkOGT2g+piiRnm9cLHxvK6MXqVaDUFsblGLiM
         QNZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747301325; x=1747906125;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oUZnZ1nzA1VahWTXdD9nimd4WKEUhUq33YKSElfIzC4=;
        b=UMCUp1dL7XRxsFIGaspeNleFAdsW4eUPURX9dqly/3ySTFRpBJwtYX6ad1ru39XIW+
         DVdm+LifLWqLt+ihoNARM/moXZirb6uG+tdYF9dsAj0bOiQyboJy88vUYZu4Lf0EIBjf
         32EEmbSlc5CPe85IdIPeMLaGKm+iNQ409I0I7050rkKYL9Wi3sOL6fD/KWnce3Xpi+N7
         iSEti76SP+71zbr4HXtqkojPan0EwwxxM08JXIP+MO6eaLsB0QSl9fNkIB7aeMl0oeEo
         15xc/PHEbj+EwszrjXdZmQyjBAHvjpPhrqZAmFMWnr78OKDDGqvxflAgrBH9Zz5Rxugf
         VznA==
X-Forwarded-Encrypted: i=1; AJvYcCUjyFBfExl8NJx2untehDPnPlaizDx/538VKqsPHKYZFBJwWrhhEtPl3yYivSVeCx+Pi6kcgTS0iS4qCkzhix68@lists.infradead.org
X-Gm-Message-State: AOJu0YyDLt81dCwzN/Bdv6Tz4oPWWQAI0Jh/58JfmslcJzonz2PaSwDh
	QT4a6IEu5B5Xauk030q1TrXHTfUxQreDHwsOFuxSMq/YMq4trJMfPTZa
X-Gm-Gg: ASbGncsN8p8yFvzLfHgrHjK09UF2MtFj1eYIHzEMJtB0/czVqcCqTVW/wVao6Ot2RId
	1N6pCpprbaF4eFR5EJAI+1b1SImHPTUJk4yG1FL+LtL4jwoagZQy+tamnSodz2JnyG96jGG9UCm
	aMOCCGfSu97RLRz9i4NVjTkcKD/mXSXB/tyQgZ+fcgDGQ8DS5lcEgij7fCpTq/Rzs9Q9Sw9Pokq
	zJbXTdzf3NweFAFt63ocX3wYclGmwvhNEYUBghmzkPKljH7hCzX+L6UHjycQb/dU6cwHf4BI10+
	k9sF290X/loOBpIAQ9/imf2jfSz6/SqgdupXD5bznuY28oUxKLEptsqhITCnQS0wCy+j1jj4U0D
	oQiB5qHJQdynsqfS9xECCct3P9mE0mV66
X-Google-Smtp-Source: AGHT+IGtzN/vJeQqjXNcCh6S+CyPGXXKJUFYk7VQPziFd4r34mBTi90PPXGWHwTS9SK3MYrz0Qwrbw==
X-Received: by 2002:a05:6512:b11:b0:549:9643:68d0 with SMTP id 2adb3069b0e04-550db97d223mr937454e87.17.1747301325041;
        Thu, 15 May 2025 02:28:45 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc644fafdsm2565109e87.51.2025.05.15.02.28.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 02:28:44 -0700 (PDT)
Message-ID: <fb5b60e9-eaf9-42bc-9bda-0c80bd55f81d@gmail.com>
Date: Thu, 15 May 2025 12:28:43 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] arm64: dts: imx8mn-bsh-smm-s2-common: Disable PMIC
 SNVS reset target state
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-kernel@vger.kernel.org
Cc: Simon Holesch <simon.holesch@bshg.com>,
 Karthikdatt Anantharamrao <karthikdatt.anantharamrao@in.bosch.com>,
 michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Wolfgang Birkner <wolfgang.birkner@bshg.com>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20250514082507.1983849-1-dario.binacchi@amarulasolutions.com>
 <20250514082507.1983849-10-dario.binacchi@amarulasolutions.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20250514082507.1983849-10-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_022847_377207_A6C01AD8 
X-CRM114-Status: GOOD (  14.77  )
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

On 14/05/2025 11:25, Dario Binacchi wrote:
> From: Wolfgang Birkner <wolfgang.birkner@bshg.com>
> 
> VDD_DRAM was disabled on standby, therefore the reference hardware did not
> wake up reliable. Use PMIC reset target state READY instead of SNVS, to
> keep VDD_DRAM active during standby.

There is something I'm not quite sure I understand. Lookin at the 
BD71847 data-sheet, the VDD_DRAM is OFF at READY.

(Page 27, Table 3-8. Voltage Rails ON/OFF for Respective Power State)

https://fscdn.rohm.com/en/products/databook/datasheet/ic/power/switching_regulator_system/bd71847amwv-e.pdf

Please, explain.

Yours,
	-- Matti

> 
> Signed-off-by: Wolfgang Birkner <wolfgang.birkner@bshg.com>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> 
> ---
> 
>   arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
> index ea8d741c6904..633874b3bf66 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
> @@ -94,7 +94,6 @@ bd71847: pmic@4b {
>   		pinctrl-0 = <&pinctrl_pmic>;
>   		interrupt-parent = <&gpio1>;
>   		interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
> -		rohm,reset-snvs-powered;
>   
>   		#clock-cells = <0>;
>   		clocks = <&osc_32k>;


