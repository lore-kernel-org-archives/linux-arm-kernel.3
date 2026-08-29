Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A527C61DCB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Aug 2026 18:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b4Ex6rfFvTScbg5DzrJ4/DiARiXFmhIWSUitin0MvHk=; b=tIigQQQqDelFI0ptC0KoioehWk
	731dq+w04RglVIgbNKDCSBnhmMQhtzkuY8AaXy++cmVvnB0ZlVqB+orw9RB5JKZWpr/SIfnPQUFyl
	yagkgpl45IUBBLsv0Sy302puFIom3VSAa2DthzIXsabXnpbtrI6bcIcrzSP/oLggZZ4VKwXhRxjY8
	cnc1ZcO8kLfy9VE/uOY/T3c4sTgpnwdgcCwRLzDw6nZoTyNIwvTn+6WaqlnScayVNH0Gc+1Gz0YLP
	fwyfHzuOQKwZ1x5pwauybTX434v0dosXynB9BdWTpV3EJLls1xLizEGDvOZ0d/XatNcC5OZk+S9ZL
	ZkXgqz7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0O56-00000007DOK-2IHv;
	Sat, 29 Aug 2026 18:47:08 +0000
Received: from mail2.ecloud.global ([135.181.6.248])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0O53-00000007DNT-2hUn;
	Sat, 29 Aug 2026 18:47:07 +0000
Received: from authenticated-user (mail2.ecloud.global [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail2.ecloud.global (Postfix) with ESMTPSA id 5727E721211;
	Sat, 29 Aug 2026 18:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=murena.io; s=mail2;
	t=1788029216;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b4Ex6rfFvTScbg5DzrJ4/DiARiXFmhIWSUitin0MvHk=;
	b=kJRJxTyyQMcIlC2MG6VJ+b+oMXJ54a/2zuFGwzTwuo9CZxVz3F08ZVm8APsh+MsNYKfln7
	tpIsv3BQSMkVO12LdgK9AGcG0V01enJJzYdvOZtfj3rnOzMRJOcEh6TrpCo01U2nha2zrQ
	J0KsfHnCEfM1FmgUODuLp2W5PkBY6k4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=murena.io;
	s=mail2; t=1788029216;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b4Ex6rfFvTScbg5DzrJ4/DiARiXFmhIWSUitin0MvHk=;
	b=iKSP3zjFE39ry20mmXNOJsboV+El7n+ksWSaf4BjAJtPYNi4skVmgJEw/IqLzCMs+NZ86y
	cHJ15QP8zMHswrrFu0FfNfjOSV/qEbV8Ek28lmHwqTAZKytJ5ty9O6AZACMRpf/g7ac69l
	DPEMrfrnitQFB0w62FocUPfUBN3mVcU=
ARC-Authentication-Results: i=1;
	mail2.ecloud.global;
	auth=pass smtp.mailfrom=maud_spierings@murena.io
ARC-Seal: i=1; s=mail2; d=murena.io; t=1788029216; a=rsa-sha256; cv=none;
	b=PBSzIckDQ9J/rtP8kgKk6YirF5KsP0xzXMGk/+beKynJrp5wESTe2ODak8XzOi5hl0vL2A
	AuJUpLcNj2cEiZwG9EPCnizlv2HGbZHD4eFqrDaZ7+XptJc8z0BTYKf2fnW0YghpcFzZER
	e1LilsNtpR7oiPTe54yrwUcb9BlYx2Q=
Message-ID: <b9d39858-3531-4538-a4ab-eb34a0be6ad5@murena.io>
Date: Sat, 29 Aug 2026 20:46:53 +0200
MIME-Version: 1.0
To: m.wilczynski@samsung.com
Cc: Laurent.pinchart@ideasonboard.com, airlied@gmail.com, alex@ghiti.fr,
 andrzej.hajda@intel.com, andy.yan@rock-chips.com, andyshrk@163.com,
 aou@eecs.berkeley.edu, bmasney@redhat.com, conor+dt@kernel.org,
 conor@kernel.org, db@domibel.de, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hal.feng@starfivetech.com, heiko@sntech.de,
 hello@big-grey.co.uk, jernej.skrabec@gmail.com, jonas@kwiboo.se,
 kernel@esmil.dk, krzk+dt@kernel.org, lee@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org,
 luca.ceresoli@bootlin.com, m.szyprowski@samsung.com,
 maarten.lankhorst@linux.intel.com, maudspierings@gocontroll.com,
 mfd@lists.linux.dev, mripard@kernel.org, mturquette@baylibre.com,
 neil.armstrong@linaro.org, p.zabel@pengutronix.de, palmer@dabbelt.com,
 pjw@kernel.org, rfoss@kernel.org, robh@kernel.org, sboyd@kernel.org,
 simona@ffwll.ch, tzimmermann@suse.de, uwu@icenowy.me, vkoul@kernel.org
References: <20260828-jh7110-clean-send-v2-14-331680c8b9d1@samsung.com>
Subject: Re: [PATCH v2 14/15] riscv: dts: starfive: jh7110: Update DT for
 display subsystem
Content-Language: en-US
From: Maud Spierings <maud_spierings@murena.io>
In-Reply-To: <20260828-jh7110-clean-send-v2-14-331680c8b9d1@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260829_114705_885539_574181F2 
X-CRM114-Status: GOOD (  15.86  )
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

Hi Michal,

Very happy to see an update to this series!

I have some very minor nitpicks I found in the devicetree

> Activate the display subsystem by adding the dc8200, hdmi and voutcrg
> nodes as direct soc children. Each references the PD_VOUT power domain
> through power-domains, so genpd powers the domain on demand, and the
> HDMI-PHY -> voutcrg -> HDMI-controller probe order is resolved by
> deferred probe.
> 
> The monolithic hdmi node is modelled as a container with hdmi_phy
> and hdmi_controller children. This lets the PHY (clock provider,
> depending only on xin24m) and the controller (clock consumer) probe
> independently, breaking the circular clock dependency with voutcrg.
> 
> voutcrg consumes the pixel clock from the &hdmi_phy node instead of the
> old fixed-clock, and dc8200 gets its pixel clocks from voutcrg's MUXes
> and is marked dma-noncoherent for framebuffer DMA. The old, incorrect
> hdmitx0-pixel-clock fixed-clock node is removed.
> 
> Co-developed-by: Dominique Belhachemi <db@domibel.de>
> Signed-off-by: Dominique Belhachemi <db@domibel.de>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 119 +++++++++++++++++++++++-
>  arch/riscv/boot/dts/starfive/jh7110.dtsi        |  87 +++++++++++++++--
>  2 files changed, 196 insertions(+), 10 deletions(-)
> 

[snip]

>  
> +&dc8200 {
> +	status = "okay";
> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		dpu_port0: port@0 {
> +			reg = <0>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			dpu_out_dpi0: endpoint@0 {
> +				reg = <0>;
> +				remote-endpoint = <&hdmi_in>;
> +			};
> +		};
> +
> +		dpu_port1: port@1 {
> +			reg = <1>;
> +		};
> +	};
> +};
> +
>  &dvp_clk {
>  	clock-frequency = <74250000>;
>  };
> @@ -99,8 +153,31 @@ &gmac1_rmii_refin {
>  	clock-frequency = <50000000>;
>  };
>  
> -&hdmitx0_pixelclk {
> -	clock-frequency = <297000000>;
> +&hdmi_controller {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&hdmi_pins>;
> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		port@0 {
> +			reg = <0>;
> +
> +			hdmi_in: endpoint {
> +				remote-endpoint = <&dpu_out_dpi0>;
> +			};
> +		};
> +
> +		hdmi_out_port: port@1 {
> +			reg = <1>;

missing newline here

> +			hdmi_out_con: endpoint {
> +				remote-endpoint = <&hdmi_con_in>;
> +			};
> +

one newline to much here

> +		};
> +	};
>  };
>  

Kind regards,
Maud

