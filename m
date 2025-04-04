Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4706C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 09:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qDJ3Mb7YyqUASiYdnt4nl93Qyi0Oahcb6qeEI0SSTA0=; b=nFYXwfUyaQ8RmzuXAI2yOudkmz
	WkfWS7j80OyXGAOJ0fnSOX+VcSradWjX9FDY/bidJnPR4GXh4Nq4qvkH6xKMHjIUOyz7FuQOIC9MI
	n7zNbu0+0xRZyT4w6JsgpuIPI5kdZRJ+X0g7qK+tqlUwPcqrNADEFM+7Pj/JwyH5HWQIjmsDLX4BI
	Dmt+Kx3HGIy3X1czGLWFSEreDkD2BC1QkVXODRTdjCemZRzzOLXkXJzO7iGPgt6Kzqvu76mwNuGyI
	ALwdb0WwY4ZQ2sjyFsZ1ARwchzphf9Fmv4SqSB/1j7K+HfsbkvNmRCp12Xj9t/VlXcLqny29ALVvt
	LqAOJs0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0dhf-0000000BKUZ-37QH;
	Fri, 04 Apr 2025 09:51:11 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0dam-0000000BJDS-09mV;
	Fri, 04 Apr 2025 09:44:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1743759843; x=1775295843;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/1xoPsKQlQBWMpLcgEjKZ/hJOcJIL0rM7P/QyChG6kU=;
  b=MlzXWpqJ7mWNZk8vxaj24vZmpxXGpN5gd91Wynlbn/v32f283FGuXyXp
   NcnD1jU3ABkTE44yq+ZPaab3j4tDylCb37ZrvcCq4d1GQ40pnIvQg3byd
   MjYqUXxk0FGsMbUKg5v4N63yLO7Gk7vbZiutaOGY5+pUZJjzOD+S59ejB
   uC+8rWbotewgXRGiLxNDvs/ZV+MJ/ZEux7MT09I9vBTfmdcNAFbCcdzIx
   ji5F8cMY0tztrlVRoVsnVJ+li6e9+ss51SELSYQtcMFpzRLxlfAQ4yErS
   lmNk11IIv8atNt+aa6G0e89iKj8d7vMC+PxKJRYO5MfjHTQ0QfIdQblA7
   Q==;
X-CSE-ConnectionGUID: CCbOwbOjQ2SseDv2d8Zv6w==
X-CSE-MsgGUID: TTSMcQbYQG2UnIfQGa0ggw==
X-IronPort-AV: E=Sophos;i="6.15,187,1739862000"; 
   d="scan'208";a="39641646"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 04 Apr 2025 02:44:01 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 4 Apr 2025 02:43:37 -0700
Received: from DEN-DL-M70577 (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Fri, 4 Apr 2025 02:43:28 -0700
Date: Fri, 4 Apr 2025 09:43:28 +0000
From: Daniel Machon <daniel.machon@microchip.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
	<jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, "Rafael J.
 Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Vincenzo Frascino
	<vincenzo.frascino@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla
	<sudeep.holla@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, "Bjorn
 Andersson" <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Viresh Kumar
	<vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, Stephen Boyd
	<sboyd@kernel.org>, <zhouyanjie@wanyeetech.com>, Conor Dooley
	<conor@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, "Claudiu
 Beznea" <claudiu.beznea@tuxon.dev>, Steen Hegelund
	<Steen.Hegelund@microchip.com>, <UNGLinuxDriver@microchip.com>, Shawn Guo
	<shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>, Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-sunxi@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<linux-pm@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-msm@vger.kernel.org>, <linux-mips@vger.kernel.org>,
	<imx@lists.linux.dev>, <linux-rockchip@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 04/19] arm64: dts: microchip: sparx5: Fix CPU node
 "enable-method" property dependencies
Message-ID: <20250404094328.cojaf5cxrotnetln@DEN-DL-M70577>
References: <20250403-dt-cpu-schema-v1-0-076be7171a85@kernel.org>
 <20250403-dt-cpu-schema-v1-4-076be7171a85@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250403-dt-cpu-schema-v1-4-076be7171a85@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_024404_316779_9D26B064 
X-CRM114-Status: GOOD (  12.98  )
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

> The "spin-table" enable-method requires "cpu-release-addr" property,
> so add a dummy entry. It is assumed the bootloader will fill in the
> correct values.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  arch/arm64/boot/dts/microchip/sparx5_pcb_common.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/microchip/sparx5_pcb_common.dtsi b/arch/arm64/boot/dts/microchip/sparx5_pcb_common.dtsi
> index 32bb76b3202a..83bf5c81b5f7 100644
> --- a/arch/arm64/boot/dts/microchip/sparx5_pcb_common.dtsi
> +++ b/arch/arm64/boot/dts/microchip/sparx5_pcb_common.dtsi
> @@ -12,10 +12,12 @@ &psci {
> 
>  &cpu0 {
>         enable-method = "spin-table";
> +       cpu-release-addr = /bits/ 64 <0>;
>  };
> 
>  &cpu1 {
>         enable-method = "spin-table";
> +       cpu-release-addr = /bits/ 64 <0>;
>  };
> 
>  &uart0 {
> 
> --
> 2.47.2
>

Reviewed-by: Daniel Machon <daniel.machon@microchip.com>
Tested-by: Daniel Machon <daniel.machon@microchip.com>
 

