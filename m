Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E6B4C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 14:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5vCPLadSTG0XNEadulJx4woFN95JwHE+lHWPlfdFjqo=; b=ujFpl+o9cb34RyMabZaizqB4A5
	iid/A+HlL3CgWgpDscpAOMw08SRMeu25kD3ZcxLXv/cAV/pSl+W+q97GJjF/5N6JrFJR4LlkpdX9q
	a9PWPoKYy0ODErlAy7fF12/lhhEDY8PyXUiaUNjS2vbtJSaptsRN03iCmfuVgYSTEGl5VfKQZW3AT
	aDZwU8f+igqDxjsMw7voGuURzbUVc/ebPSrF+9PqmbRsm9CGjA8VsXvm+cqrfKNU0naMQbd1hW8Q+
	QQiC+YE3iBqCS041OoLBYih0TkUr+jFYdHXPPQJNFkZvbWuleCOuMbVjqaMVoGW2QF9xx1uOR2gz3
	bzTKKNvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY44z-0000000C4lw-2QHP;
	Wed, 15 Jan 2025 14:09:09 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY43j-0000000C4bV-2iAR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 14:07:52 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2163b0c09afso126474665ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 06:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736950070; x=1737554870; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5vCPLadSTG0XNEadulJx4woFN95JwHE+lHWPlfdFjqo=;
        b=KqRGEWRqtsNUmpAe7viHrcG1sTH5urCeAH3CxJaNRQSLoyof7cpFsD5RfDkhsJTz7M
         RMktbZNY3/22jhxgaNdDnVFm9pGS7RhuYzujUe0382zbFZ1lEl/j9owmtxJ3a7jaI0MW
         0Ij46hNQNGztJdBKmHsxTqDAB+YeVoQyx1RIfY5dKbGHLdY/dFQiZqdD8rDq8VgWbw2P
         HOuVWHyjYvATiTJj67gKDmFULEYLw1+nsArYg8D+zmwuvoYi9jBbEs3CG7Sl75H8iFQr
         nbvHlk8/0H8BDi4m1GqVFL73vfhWwtiKAIkVZwe07yzXReyJIf1cJudPiyADMIEcxXrd
         ryBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736950070; x=1737554870;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5vCPLadSTG0XNEadulJx4woFN95JwHE+lHWPlfdFjqo=;
        b=G4ntk9z0dRJAmF0rZgDqpm8ENbLWVCxZqC2SSloA6wx0xEWnjEAGWfjFR0ReoIslGm
         7uiPMQpdqP3yLzMRuemNqxAn3Okw4oAmaCeqR5/q0jB5qMxU8/fvy+3RfaIPnlRbGSIC
         wXZiGIh9ac1s2X5J2y0sBKRXt3PaUxPA72xKsc/Kzv4hYv28CwLYscyPoId5jif8oXHL
         PIyUlYR5jO7KtzEML+T+Cuk4ZQZdJKwYBbEWsd3zOeIVvTnfi40/9YJNAk/kxjoh+JbK
         bHCAXPtmvvO2Rk48k364y2CfwYYWqccvgO6qQkXmUaz+uh//pU9WacdauSLYB3Y9wLtU
         3IBA==
X-Gm-Message-State: AOJu0YzideLlFfd6JnT5aeE68q0KoRlAG/Je+TpJ6NoOanNDTkVPIMOe
	rmHHQH9gRU6tDfsApUxI9toMRvPh8SuPSJXoFNLyZ6ujvT4pnBh7
X-Gm-Gg: ASbGncsin8OUozNb7iEzB9w5EM1sCpxmKjc78E/mIFMva6xHjmAddolJFFhl3/pqJI3
	fVL9ax08G3w7CandHuhcdSLKr6JWHuvn+PPbEqBAJw34iAeA27lL0rgL4/aZFi+3kuedYsZv2X/
	E4ghLAjvlo3ZM4/6Pbxd2fq9WAu4u+mTdhN+CHl3BY+1R0nLZnSqLKD1A3XhkTxv21BRy39Z/rT
	6lgLqwcEdNM64RRz+4h8jordn3OjRLVgw612OiILxyFpCL3wbcE0WJkKq5vq9WX
X-Google-Smtp-Source: AGHT+IEOHm6oG8q2/VBX+YnEUddFnG0FmgHB02S4iMBT+29EuCT2i15IMPwhfxsK6EdgDfF5iHJflA==
X-Received: by 2002:a05:6a00:368d:b0:727:99a8:cd31 with SMTP id d2e1a72fcca58-72d21f47fc5mr39933032b3a.14.1736950070133;
        Wed, 15 Jan 2025 06:07:50 -0800 (PST)
Received: from [192.168.0.116] ([59.188.211.160])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a317a07cce2sm9929464a12.4.2025.01.15.06.07.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jan 2025 06:07:49 -0800 (PST)
Message-ID: <00863806-d481-44a1-b97f-ead0fc6f9581@gmail.com>
Date: Wed, 15 Jan 2025 22:07:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/5] arm64: dts: apple: Add touchbar screen nodes
Content-Language: en-MW
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
 Alyssa Ross <hi@alyssa.is>, Janne Grunau <j@jannau.net>
References: <20250114-adpdrm-v4-0-e9b5260a39f1@gmail.com>
 <20250114-adpdrm-v4-4-e9b5260a39f1@gmail.com>
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <20250114-adpdrm-v4-4-e9b5260a39f1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_060751_698573_C6F8C67E 
X-CRM114-Status: GOOD (  13.48  )
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



On 15/1/2025 05:38, Sasha Finkelstein via B4 Relay wrote:
> From: Sasha Finkelstein <fnkl.kernel@gmail.com>
> 
> Adds device tree entries for the touchbar screen
> 
> Co-developed-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
>  arch/arm64/boot/dts/apple/t8103-j293.dts | 31 ++++++++++++++++
>  arch/arm64/boot/dts/apple/t8103.dtsi     | 60 +++++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/apple/t8112-j493.dts | 31 ++++++++++++++++
>  arch/arm64/boot/dts/apple/t8112.dtsi     | 61 ++++++++++++++++++++++++++++++++
>  4 files changed, 183 insertions(+)
> 
[...]
> diff --git a/arch/arm64/boot/dts/apple/t8103.dtsi b/arch/arm64/boot/dts/apple/t8103.dtsi
> index 9b0dad6b618444ac6b1c9735c50cccfc3965f947..9b088f74e0cb9f42fbc8df822fca6451dcd1b717 100644
> --- a/arch/arm64/boot/dts/apple/t8103.dtsi
> +++ b/arch/arm64/boot/dts/apple/t8103.dtsi
> @@ -356,6 +356,66 @@ cpufreq_p: performance-controller@211e20000 {
[...]
> +
> +		displaydfr_mipi: dsi@228600000 {
> +			compatible = "apple,t8103-display-pipe-mipi", "apple,h7-display-pipe-mipi";
> +			reg = <0x2 0x28600000 0x0 0x100000>;
> +			power-domains = <&ps_mipi_dsi>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";

Missing empty line.
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				dfr_mipi_in: port@0 {
> +					reg = <0>;
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					dfr_mipi_in_adp: endpoint@0 {
> +						reg = <0>;
> +						remote-endpoint = <&dfr_adp_out_mipi>;
> +					};
> +				};
> +
> +				dfr_mipi_out: port@1 {
> +					reg = <1>;
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +				};
> +			};
> +		};
> +
[...]

With that in mind,

Reviewed-by: Nick Chan <towinchenmi@gmail.com>

