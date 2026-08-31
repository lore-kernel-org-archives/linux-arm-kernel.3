Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D0B9C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 06:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ptsOsHU/6/aB7s/AaOx0+tOkggKvvNrqLs8HPEye82U=; b=yjEZe1FwZv1xz0HGMxK1KhpY5H
	xWCiA6Mb5+o4WtCyRRd9hs6kOJekrhYrU4Ms7b2lsUAwKfCJCOnl1WArTiclVoSYparrnPK55a/5r
	8Jnh7VHbvZRmNiXotB/vq5t19IAJqQ/dXxr6+Sku1uz2LvKyhIfSxmvyO1sk/FB13VlsKTSuoS3KS
	+LELETRYWjR4DiPHIKBsx6Eu6iNgvRnMhsc5DhVAoMOvlM+VpZGE/wH41W6buYZMFw/TNPPEQOCnD
	+zPshLvpgsPbxtxxG/miE/1hpx85VdtZZf/vLbcWrUZ0tIRs1aqLBM9EyjxSLW5IwygwhrQvrWpG8
	Qm9KUegQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0vav-00000008cJh-161Z;
	Mon, 31 Aug 2026 06:34:13 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0vaq-00000008cJ0-0XF5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 06:34:12 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so3513082a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 30 Aug 2026 23:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788158046; x=1788762846; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ptsOsHU/6/aB7s/AaOx0+tOkggKvvNrqLs8HPEye82U=;
        b=QMKaW18IrwPQC5NcpXMwVQqcxuqLipCkZEfZmA2YHZo8QvKy/9BS0YwVKN7SE31JbZ
         GQu8oPLRANC6OGWZXnE49OPnAIDHUambfeD/vMiLIPVlR/BYuSTIJg0yEVWtPIrqJ0pm
         pI6GQnDSgcjtuClUJbIo8twh1UV44Ur1zggjz9f9YsIrFxVunOq/Y4ksxOZ3SfVfqH1S
         DaFZkDJaVaykYTtkhv1KOD1c/WLjoRJ0Yd9gkl4+ubynKgK4/+d3kVZJRs+jd3XOQMwg
         qPc1RpeQAKWB6lGcyKj7KZanVudA/u0rlIrHmrkVBt7OI1izY4/MFEfGsmXB4S+AmnNX
         MiYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788158046; x=1788762846;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ptsOsHU/6/aB7s/AaOx0+tOkggKvvNrqLs8HPEye82U=;
        b=rWBU+/SloN9TdV59XgXmUpjUUFP7tZwXzStYna/oTx4kNMXsMyzbDApqe7K8c5jygm
         +MCHemxrfHCEU69b640SC8Awe28p1FJGOXnMQIOVOiBQcQcQjxBaQbJ9AsQ/qAl43hBC
         9jrXAcEppaOqLBf/HjtFtXhJUQQC1df8KMG5djLN1Ki3NTsZKe9ORR++d1QNCGXdxhcp
         UFvdLIYFwdaI3ys04f/NK49VU7sVcCLcra7dw+txO1kUyhHIxuG7ehR0KMB5CMv7c0Af
         4JnUiA+CMm2j/xF+ejYFnWEATvdbRe16QkskgijEZudXZSj0UalJye172eIyWw2M+MTf
         69gA==
X-Forwarded-Encrypted: i=1; AKwUvBzHqSPc4FbfkFkmaa9MV7Vw1lK+b44gqmswPT48F3+vO1v57xsr8BgEHUvtLWYUFjHIoUxC+dxMn453Cpc86U4P@lists.infradead.org
X-Gm-Message-State: AFuF++lcYoz8fkfRyTPT/o9vBiX9iQYYS2ECNo528hPEcfaXOfQhXkhz
	J9YPVZHtjVSnVluwGN5MhuAHjo4Na/q5VyqTIQ9dEQijZZVbjyOGa6dH
X-Gm-Gg: AYBFou0rN7iZu1mlKIygMr/DRNBsTxciz/fQoKRpDrcEUydglXZw1xTmQ4ezXSGOfjD
	sup8dXPrtK8AEMsCD/PSS4EBaQDufX6NGnlEuoOO+2+diVxUQKAH4z3Gvvb9UTLllX8sX1Z+Nna
	eGXQ2vQ4thrp9SSE3iW9eB8wIKsII6OuR7kVY3A2zhNUHwLtRCVj9ECxcZtGEobBlUpgklBd4JM
	QCRauvD8wGIROxQ9RxeJIV1i9TkZ3TNUduMcjNipDxgxRP9XKCow6p9NziHtrViNEFZ/5llLQ37
	lPx/lXvfSCTlVwJy2kuJS77TdgHa8G11ip+qNduxaTD1vUAVo8xlWbzp3AC9mRVVLYrocP0Eu1B
	0QEvKjuaXGN5PTdmDKNYV5W2/SM0g+mV28ol1WFVbyebYbG465u7D8JYOm68x6Y3+Ik5rJkCNpK
	ypLIuXFu56mNT5So+4m3ehV8fKTXOdP1ajBkqD1EAAbCVsC5Ybw5CfoPdmgvZaABhGqK4t32Ng8
	tGHfzMSlyUgSR0=
X-Received: by 2002:a17:90b:4b92:b0:396:40e6:f631 with SMTP id 98e67ed59e1d1-398f8203c37mr1788304a91.3.1788158046328;
        Sun, 30 Aug 2026 23:34:06 -0700 (PDT)
Received: from [10.25.162.18] ([165.85.1.43])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0d18eaasm27743090c88.1.2026.08.30.23.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 23:34:05 -0700 (PDT)
Message-ID: <4dafc090-4e2d-4f05-85ce-cba993e93575@gmail.com>
Date: Mon, 31 Aug 2026 14:33:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: imx8mp-phyboard-pollux-peb-av-10: Fix SAI
 master assignment
To: Primoz Fiser <primoz.fiser@norik.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
 Yannic Moog <y.moog@phytec.de>, Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 upstream@lists.phytec.de
References: <20260831051222.3298730-1-primoz.fiser@norik.com>
Content-Language: en-US
From: Chancel Liu <chancel.liu@gmail.com>
In-Reply-To: <20260831051222.3298730-1-primoz.fiser@norik.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260830_233408_178831_DD387AAB 
X-CRM114-Status: GOOD (  17.51  )
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

> The dailink_master label was placed on the codec sub-node instead of
> the CPU sub-node, configuring the codec as I2S bitclock/frame master
> with SAI2 as slave. On this board, BCLK and LRCLK are wired the other
> way around: SAI2 must be bus master, with the codec as I2S slave.
> 
> Move dailink_master to the CPU sub-node so SAI2 drives BCLK and LRCLK,
> fixing broken audio on the PHYTEC phyBOARD-Pollux-i.MX8MP board with
> PEB-AV-10 Audio/Video expansion board. Also remove the spurious clocks
> property from the codec sub-node, which had no effect in this topology.
> 
> Fixes: 7012f551081f ("arm64: dts: imx8mp pollux: add expansion board overlay")
> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>

Reviewed-by: Chancel Liu <chancel.liu@gmail.com>

Regards,
Chancel Liu

> ---
> Changes in v2:
> - reword commit message to avoid topology confusion
> 
> Link to v1: https://lore.kernel.org/all/20260827065556.2326079-1-primoz.fiser@norik.com/
> 
>  .../boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10.dtsi | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10.dtsi
> index bb740f845855..8957b24a7ad2 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10.dtsi
> @@ -77,13 +77,12 @@ sound {
>  			"MIC3R", "Microphone Jack",
>  			"Microphone Jack", "Mic Bias";
>  
> -		simple-audio-card,cpu {
> +		dailink_master: simple-audio-card,cpu {
>  			sound-dai = <&sai2>;
>  		};
>  
> -		dailink_master: simple-audio-card,codec {
> +		simple-audio-card,codec {
>  			sound-dai = <&codec>;
> -			clocks = <&clk IMX8MP_CLK_SAI2>;
>  		};
>  	};
>  };

