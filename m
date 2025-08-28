Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8616CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 18:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KP6GeI4QNlyVzRWNe4PL6HeP+siA3vt2wqk6FJm5c6M=; b=1bJUpT/fmHsc3qoGn60jwCorp+
	GGrSiFdBfMdYbhQiC4DPV4j/YD9AGMVvPvY7BsqMUtRMY5fQRUS5TbrJz9lZxh7XHfs5rF0ILNzp3
	oMmknsph1TpN9yDLoAWonQ60s1TLz5jSun6C+GqGdsxBhBlpVt/AI+A2pxWzOFn6Q258IZMFpFTUz
	sca+ieYOSrQ7+VlsXCOGj/+KfovIJcSJmfe2098y8J1GxD/BuwtOSe5x6/tUtE8hkQlKa4K6+Y4aq
	UcZ62Xy6ZZxoS8/UR9/MNzroiob+gYrghK7EzZRY75AuPOPP8I+M/+OLM7AVqvgFw4qHLcsDAsAIl
	L5w3XxbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urhWL-00000002oCT-27k1;
	Thu, 28 Aug 2025 18:38:49 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urccl-00000001jGL-2dIh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 13:25:08 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-afcb72d5409so152588966b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 06:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756387506; x=1756992306; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KP6GeI4QNlyVzRWNe4PL6HeP+siA3vt2wqk6FJm5c6M=;
        b=fjGRryPNRdN2zZ2SI40/V0o8WL4hLj+ebeRnaotiWKdXVs+Z4owGWVi4GZDRpEfDQs
         6xN5KT3zV6af7OIQ6hS7hDuR4bGEqgab6x9Ojh3JH7kX9Wvi6dokwa+HtVK37fzzgmae
         pWYmjGSMb/8CEv3oti17C623B9qrXpARnL2GMo9LEPNO+iBGWHQCIQacHTP4Bd7lwf8H
         6o5apKK9t0QRdgnALFIirKLpfTNqBlp2yrdvpAnQ/8UTXiBX4iOvLlIxXU5HU0VxhD8F
         GLkHnbAABytpGe+iM9yis3zrdH3BZ/idAqPvcU80HuEGT701z3KcSSA+KQvgiwvBJsG4
         Bnvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756387506; x=1756992306;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KP6GeI4QNlyVzRWNe4PL6HeP+siA3vt2wqk6FJm5c6M=;
        b=rSWHuUrU6NBSmgIQHhblHEgi5QeLmXYSekVYUsQLvcLJ1SIodaLMGMswQjt1piY/Nw
         yr6CvXtK8s1oKe8FLDzcV3+03yq8tIOzreOAPFKRWBVRpQ6Tjh+f3X8QJPqgJ/tlq0tB
         XizzTKe//odeMUERfALVh1FA20ZooWi618f9aXEUqYacr8beqT+p/ki63cPbbYsCMh9f
         CjggLrwylJ5jeHqBLt5XLHsMCpXfTwQuiQ3HeaDI0YQSBM+XEwaXJO36oU+EK03Xqhct
         XhxL5QkzxS1Uf0bh5jKw8BXfmwYPA2K5pvmh938VDTBsvD2yn+wOU7oVtalGZ6UdOt6N
         ud5w==
X-Forwarded-Encrypted: i=1; AJvYcCUDj99nqc61jnILBeUoqjM0/TtZrMFEYciwdgTTB46c5/s+eXq7IdmPT9RdubHeydQ6fs5TBIvIjvZN76mC7ANM@lists.infradead.org
X-Gm-Message-State: AOJu0YwJbPEuRoxN+cqeHedCHHPuAtr4D3+E11XMIIU/vCeCrE2Dp5Tc
	ohrKc5I0URXRk9E6ALp6Ao5e0uhZWc3gu+uJB3ZuFcjamTLN5yNjeCHQriffytejEZ0=
X-Gm-Gg: ASbGncuAQ34RVlQycf04oC3dqmJ2m7h9eAy4+5gGNVnrweUGTAYc9kFxlv7ZvBiIZFJ
	pPOM9Y8BaGjsKwb8VV5yGjy4Hlw6x4VTZyGTPoTiZXo0z5HSFgXQY3WtROF/Yxk8KK4/Heu/tx6
	1V0ZodT4idhARKP3RKinvzDvH7lFXyf/Icw17yAGN5+coNW6LVN7VnHofs3wqkZksRrue+iwQcK
	aIdKUuvk28QsQav10v9mOmj4ZAWpOw7F8ChwK8LyIC0CK+vPb1Oav+DPzkuM3PafYeK4kYQWoVb
	t/B4pDYw9eLR3bVPXV0uCnVJrk1Y2C3CziddJ8uuYOkhWsNwKDD61fOS2W5kO0FfXLRTaMbibh9
	quUVwQc9lGrVRNpUNNQyEp8eY6xe1taag9LoGHQUCFgmxg5FMIm7H/RYsf4kCCFtSUthbdAjbJ6
	Bd2Q==
X-Google-Smtp-Source: AGHT+IHnstlza8K9C5w6vOWcSWmYNQEhQr+qMHGXGhuf3pnVngAd6eVaQO3IZGsyPfF2zyp3aTQhtA==
X-Received: by 2002:a17:907:968c:b0:afd:d9e4:51e7 with SMTP id a640c23a62f3a-afe296bceabmr2217290166b.63.1756387505863;
        Thu, 28 Aug 2025 06:25:05 -0700 (PDT)
Received: from [10.41.150.230] ([77.241.232.9])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afe79fba62dsm926560266b.100.2025.08.28.06.25.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Aug 2025 06:25:04 -0700 (PDT)
Message-ID: <ecbde2de-d08a-4951-82a4-fb73760de73e@linaro.org>
Date: Thu, 28 Aug 2025 15:25:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 10/13] arm64: dts: rockchip: add the vip node to px30
To: michael.riesch@collabora.com, Mehdi Djait <mehdi.djait@linux.intel.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Gerald Loacker <gerald.loacker@wolfvision.net>,
 Markus Elfring <Markus.Elfring@web.de>,
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
 linux-rockchip@lists.infradead.org, Mehdi Djait <mehdi.djait@bootlin.com>
References: <20240220-rk3568-vicap-v10-0-62d8a7b209b4@collabora.com>
 <20240220-rk3568-vicap-v10-10-62d8a7b209b4@collabora.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20240220-rk3568-vicap-v10-10-62d8a7b209b4@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_062507_662377_9F0F8ABF 
X-CRM114-Status: GOOD (  16.33  )
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

On 19/08/2025 01:26, Michael Riesch via B4 Relay wrote:
> From: Mehdi Djait <mehdi.djait@bootlin.com>
> 
> Add the device tree node for the PX30 Video Input Processor (VIP).
> 
> Signed-off-by: Mehdi Djait <mehdi.djait@bootlin.com>
> [added cosmetic changes]
> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> ---
>   arch/arm64/boot/dts/rockchip/px30.dtsi | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/px30.dtsi b/arch/arm64/boot/dts/rockchip/px30.dtsi
> index 46f64cd33b9b..ef52879d6a73 100644
> --- a/arch/arm64/boot/dts/rockchip/px30.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/px30.dtsi
> @@ -1280,6 +1280,18 @@ isp_mmu: iommu@ff4a8000 {
>   		#iommu-cells = <0>;
>   	};
>   
> +	cif: video-capture@ff490000 {
> +		compatible = "rockchip,px30-vip";
> +		reg = <0x0 0xff490000 0x0 0x200>;
> +		interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&cru ACLK_CIF>, <&cru HCLK_CIF>, <&cru PCLK_CIF>;
> +		clock-names = "aclk", "hclk", "pclk";
> +		power-domains = <&power PX30_PD_VI>;
> +		resets = <&cru SRST_CIF_A>, <&cru SRST_CIF_H>, <&cru SRST_CIF_PCLKIN>;
> +		reset-names = "axi", "ahb", "pclkin";
> +		status = "disabled";
> +	};
> +
>   	qos_gmac: qos@ff518000 {
>   		compatible = "rockchip,px30-qos", "syscon";
>   		reg = <0x0 0xff518000 0x0 0x20>;
> 

Now that I look at the rockchip dtsi it appears newline scarcity is the 
norm, you can disregard my suggestion for your example in the previous 
patch so.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

