Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69AFBC3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 09:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+nMEUq5ozL3XCKx6Xei2teXG7hWWZhoXqA/EoccK2ek=; b=biUybOA/DWixpSYxUd3g8rJJdf
	HwWnMcvo+7NOTsa9JvNsPW48R76tAiTDPgN6YvBYuzT1+sppJB09DIR4q/n9xCHC4CBMRYuzLCAUm
	qG6apCXBzfXEY9/LYPlSNvUQ5e7rpHkHozYvkcmOqAHghqBvrG0SCs2ZVMD9xOstwp7ktIupnpaA0
	RguC0gkshFX4J631m/omcYx9/seHXuBh/hjaBWBHFaD6GEnuiZtMq/zTDE0lF0Sgq+nwNUSBh2n4b
	w1uaxUBXAnAoW+i2IzRpmGxZ/vVEjfoar1yQucJdC0GlWeWqggSCYNGOOq2NGSBYOyfZ63FOv4oBd
	syOGksXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFUZF-0000000068M-1bYP;
	Thu, 15 May 2025 09:07:53 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFUKf-000000003G1-2Eoj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 08:52:50 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-549b116321aso691119e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 May 2025 01:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747299167; x=1747903967; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+nMEUq5ozL3XCKx6Xei2teXG7hWWZhoXqA/EoccK2ek=;
        b=Zl3Q6cvijvH7G263hmYCD5PaWZ5nUjQPeWLOJd20tSQJMLM5ivLVfOzHrDwJP3eWKn
         gFeIPcIgioSq4AZgrmHvoklQ/H8p+lga7lW5bHEIpvfMK2TczdJmik1vH7BSBHgGIuyl
         uZDm6ZzVNwXfLwl2Xj4pVRrc5NS51awMUQD08zrPu//6/pGEPYRWH4sxrm0qr2w4yQ22
         Fflpi28WHYhoHcRvZx5cQJP8utn2Kc2el9CKCCmfUSE9ofDVbnlOwfdfAVUTyem9jzFi
         intFLXoqzzTnDEfUDIlwMVrdhR5ENRNYerZ74hMErwzU6LMgIGe6t++iAHuBjXl/4i9W
         BMkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747299167; x=1747903967;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+nMEUq5ozL3XCKx6Xei2teXG7hWWZhoXqA/EoccK2ek=;
        b=tleof8S6FQS4yyasdEXseF9qNnjaUmluyS+LwTKddYL90nFML7uhjU5mDAwi3ldG8r
         TeGCLHCxd+zQ+/ORh+mM+kNFvesAsPF7rNdettoqHdGR/3ZGA4siKlfzQm6XUzlGeF6K
         84gEIDiO+YRaJCTFGA095dvqahSN2ILjOHP/SrE5cA+6425DcA+JXESqbfKzVKmJlYlh
         4/lIny4PTBl6eGbj5tbGQgN20ZGbHf561AaaTxxJQF//LtIaMcRJi60zjZmVQFB4IbAQ
         hppIqBfp7Y0hTfbJP52zyWnVUqnbK0UI5qsqv2ZH4kl9gCJpl1BaB+OEziJnsKSu7I+5
         TlrA==
X-Forwarded-Encrypted: i=1; AJvYcCWEtS7JZ2fkP/fEJ4O/626JR3wQrOh3VPI+d1Npp8kTU21RoI7PcVQa8t83NbDrE1oj2MmteVLuOraS1rVD/DP6@lists.infradead.org
X-Gm-Message-State: AOJu0YzxyqQRe78Nab1aMMzcMG6LK6v+lNkgq3QsnrtW/RqBKYTf2xkz
	mT7wyeQvaLgspfu5crG9wx/m29XCww0qF5h4tilhCO5esJlyykNi
X-Gm-Gg: ASbGncvc8aPjgmC0r61v5T4FSs9CJN5kiAESUZanoalXMNq0Pm7BdsCSfKK4l5YgZXx
	zXVeK/G8JRN9iSDJWO35C9bucZXFpc2KCgPlN6azAfwXUVXq1bFj83CoschOtfWgATSKOJtjM8G
	yLD+r6p1D4C3hxHH7wSavL6FM4KXPZiTshsn82H2n7y0eDuOtvwiKzgKsoq0megZSghmp++tb+n
	EbsJIGMyY6dAFEbVJu/vXrmx5JOG2J5nK3XbTlRny7MNHiw4PqwA/c/ibPEKAcTo4RZVzIfVv1z
	yhBoLEOM/pCr9osB4AIUfp9nLxG7CnXbPhPDcWbATfQFmPc1zrXXxuRoK9eg6ZIdRIZOGupr0Dk
	xximoFv3fKcaRCMf4Lr7/I6GSYTfMSJ+c
X-Google-Smtp-Source: AGHT+IFr+Zu/wdjpllwn3ZdGFMnTZxToomXEA+mKUOQn0Jm/AWko6eEHsQCUeWofLoc5bYC55wc4SQ==
X-Received: by 2002:a05:6512:3b9b:b0:549:39d8:51ef with SMTP id 2adb3069b0e04-550dcffc1fbmr627657e87.6.1747299167217;
        Thu, 15 May 2025 01:52:47 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc64ccf20sm2530860e87.239.2025.05.15.01.52.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 01:52:46 -0700 (PDT)
Message-ID: <057c6bc2-adf9-4160-9184-6438cbe6e9d4@gmail.com>
Date: Thu, 15 May 2025 11:52:45 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] arm64: dts: imx8mn-bsh-smm-s2-common: Define suspend
 voltage threshold
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
 <20250514082507.1983849-2-dario.binacchi@amarulasolutions.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20250514082507.1983849-2-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_015249_592437_FCC4F97F 
X-CRM114-Status: GOOD (  16.53  )
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

On 14/05/2025 11:24, Dario Binacchi wrote:
> From: Michael Trimarchi <michael@amarulasolutions.com>
> 
> Voltage threshold should be adjust according to the worst case.

I would love to understand why these voltages are set.

Could you please explain a bit further why this change is done. What 
worst case? What happens if voltages aren't adjusted? What is the 
current voltage (before this patch is applied?).

> Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
> 
>   .../boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi  | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
> index bbb07c650da9..5a1ec2f6a552 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
> @@ -105,6 +105,12 @@ buck1_reg: BUCK1 {
>   				regulator-boot-on;
>   				regulator-always-on;
>   				regulator-ramp-delay = <1250>;
> +
> +				/* enable autosuspend threshold */
> +				rohm,dvs-run-voltage = <850000>;
> +				rohm,dvs-idle-voltage = <850000>;
> +				rohm,dvs-suspend-voltage = <850000>;
> +				rohm,no-regulator-enable-control;

The commit message does not explain why the software control of the 
regulator's enable state is changed? Maybe this should be in the 2/9?

>   			};
>   
>   			buck2_reg: BUCK2 {
> @@ -115,6 +121,11 @@ buck2_reg: BUCK2 {
>   				regulator-boot-on;
>   				regulator-always-on;
>   				regulator-ramp-delay = <1250>;
> +
> +				/* enable autosuspend threshold */
> +				rohm,dvs-run-voltage = <960000>;
> +				rohm,dvs-idle-voltage = <860000>;
> +				rohm,no-regulator-enable-control;

same here?

>   			};
>   
>   			buck3_reg: BUCK3 {

Yours,
	-- Matti

