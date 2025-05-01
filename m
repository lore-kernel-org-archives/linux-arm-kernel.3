Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 350F8C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 00:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CtBcAAqRumzpJ4rTrz/zowPnd5Z+XJBF3Z8VAMzb0d8=; b=Sq3WTunMi3S0NF/2uF9HMsaFap
	ctETxbdqwuMuNKAp6ZJ1hDs2EAObiAAL6GRWSorXuIUb/Nh6+Hu5ppE7DVmIOrXYRZxJ17Js2ULkY
	jnXbJUBiFu4E8XhRZJ58iFHYmGoiGjhf8ez+6U+mnITcRDuthpft+xhL0p8bmsoCcC/LAtDlkxCRb
	R+duLrrDXDNcYF9fMlJ7pl78qmCA6oNNMZW4ddGaMbcgYQuWuLRF0QOfwXikOzZ1Uns3YvqUb4Qav
	b0ydOoE7+H69YMnIgtzROexE68d5VCLyghC7Au2NXm2FGi4QLL7IPi/JtQXLlgSE3+YIi2huRPdXw
	P8sLWB5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAI6t-0000000EKs1-3Mjw;
	Thu, 01 May 2025 00:49:07 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAI4y-0000000EKhf-1GpW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 00:47:09 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-39ee623fe64so415267f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Apr 2025 17:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746060427; x=1746665227; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CtBcAAqRumzpJ4rTrz/zowPnd5Z+XJBF3Z8VAMzb0d8=;
        b=E3J5sSPJQA5W/2J9Ot7Gt7kRwjIVXqE/TBLz4WhsmOYYW0qcTlizSZ7xHrLuWQN7+e
         fEtrJkl4y9kJT21pjRcEERpe/8dhtxDHZZqEnrPoM6JjEZXuQS5Q2AX6B0UrQYsgNiUX
         +iOMm2CasM+d8wZOrxDb9YPAOwuohjm3k2jWu2kXaUFJUXqFIccnSlOAQ8y6k585HnTX
         rIgvaSO7Sld/6U2U2J1DwrMzMSs/Uj+VmcYLgFvJ/X9cLMfuhUjl+LM14+3a7Fph9NdH
         XTfap91jWMaF/2zuGwLUEJ2Nx91DGhFgybsfE8hVajj41HZAB1owkpf1frgAaGtbIN2v
         8DgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746060427; x=1746665227;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CtBcAAqRumzpJ4rTrz/zowPnd5Z+XJBF3Z8VAMzb0d8=;
        b=TpxKvTwWzKuHdF7qjAKX1c1sR4qAfrml1WLMTkHR8kq1bOzZJswV81zbxeVIVPIo8T
         Jcue9wqofRa5zMIOHu2bpcINPN+wXIvDGOwgGOMZ7FGeiveCi+4WrfLM7Jo87XBExXIs
         8LZWa/sIjpLRFcolvwyaXmtXJrueCzkbrpe/QuSYECx7dYkdM7IKa09UZl5eevUJJ5tQ
         M/N0spDgz3sRNu/QArdA5ZHXAx1WUQl6pUTWZpSubZej4lElId04NDT1FAeebDXmZoC4
         0VDcPilPmUTAjs717KBS57BElRLQzYeXHdHWP0E6gHBLPyvzi5Xdusx9/O6j5eaQDVLo
         H8HQ==
X-Forwarded-Encrypted: i=1; AJvYcCWv0BDxvp4glaMqOEjSVWstsNOJ87Pq4GbmWjKnT1f26Bk4+S8ZunhZPr75f8J7H4uLBJDY887QtyTwBcBnDTeZ@lists.infradead.org
X-Gm-Message-State: AOJu0YzMRcqQ0gxm5PNI8lFLyQqUJVl27SqjRmDITRIwjStPIK2MWbii
	zwfWQ80KWdtm4sqwKjdlDSWdK9hkFD4T4lNDzsGeuVyl4DTlcgEJx6pZRjTzZow=
X-Gm-Gg: ASbGncucgGSqh8V9GzzsKQHWwfZN/gMErORPAGyZ0NFXBaNnQK4ZA7Q6nsHFoTFYSni
	9JUPueVv+oOLsSwHtnpo44p4rnWMkL8F5KtBSp26ookHDd1pryO1oR3iMj4/VUNz+NdQR5VtDZN
	v+j4eV+5eS9wgIDxo3cu92QOIq5fDWPNasWVlGKuo0F4Cph8KIHU4Zhyh14K7sjw9O1Pf+tzIxR
	EySK4m508xcIuUcKLNTLXtGhIIQAv45X4TKARxsz4r+e1uKck9iKwDKlRUl4kXOgF7YluqDSB+2
	9h3yky3xw/+l3wZExIMRUCgMo5p/CIccJQIjB3sAzChu02QQIinBBnELGOavjOeT4cX1dFasYk8
	L3VaL3w==
X-Google-Smtp-Source: AGHT+IFmbHtqypFHAYEgz34XK2p65MJanyk+f1Rp4pEz/8sdgn2En5b9QtiOnbh8idGH+h36WMLiqw==
X-Received: by 2002:a05:6000:40c9:b0:39f:fd4:aec7 with SMTP id ffacd0b85a97d-3a08f752673mr4547696f8f.7.1746060426770;
        Wed, 30 Apr 2025 17:47:06 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073c8ca99sm18107538f8f.20.2025.04.30.17.47.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 17:47:05 -0700 (PDT)
Message-ID: <5aa6b273-bb99-421d-a2c5-deef7839d284@linaro.org>
Date: Thu, 1 May 2025 01:47:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 09/13] arm64: defconfig: enable rockchip camera
 interface
To: michael.riesch@collabora.com, Mehdi Djait <mehdi.djait@linux.intel.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Gerald Loacker <gerald.loacker@wolfvision.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Kever Yang <kever.yang@rock-chips.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Collabora Kernel Team <kernel@collabora.com>,
 Paul Kocialkowski <paulk@sys-base.io>,
 Alexander Shiyan <eagle.alexander923@gmail.com>,
 Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>
References: <20240220-rk3568-vicap-v6-0-d2f5fbee1551@collabora.com>
 <Vz96yQCdUZBjbVQtcrC3gaAUO1ximV0-SLkMByaR1p3EoVY61j98hMKsCQf1K1MnhDA6w92yhopnWMuUQRaRsw==@protonmail.internalid>
 <20240220-rk3568-vicap-v6-9-d2f5fbee1551@collabora.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240220-rk3568-vicap-v6-9-d2f5fbee1551@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_174708_349201_BFDCE380 
X-CRM114-Status: GOOD (  14.73  )
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

On 30/04/2025 10:15, Michael Riesch via B4 Relay wrote:
> From: Michael Riesch <michael.riesch@collabora.com>
> 
> The Rockchip Camera Interface (CIF) is featured in many Rockchip SoCs
> in different variations. Enable the driver for it in the default
> configuration.
> 
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> ---
>   arch/arm64/configs/defconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 5bb8f09422a2..110ff52195a6 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -858,6 +858,7 @@ CONFIG_VIDEO_RENESAS_FCP=m
>   CONFIG_VIDEO_RENESAS_FDP1=m
>   CONFIG_VIDEO_RENESAS_VSP1=m
>   CONFIG_VIDEO_RCAR_DRIF=m
> +CONFIG_VIDEO_ROCKCHIP_CIF=m
>   CONFIG_VIDEO_SAMSUNG_EXYNOS_GSC=m
>   CONFIG_VIDEO_SAMSUNG_S5P_JPEG=m
>   CONFIG_VIDEO_SAMSUNG_S5P_MFC=m
> 
> --
> 2.39.5
> 
> 
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

