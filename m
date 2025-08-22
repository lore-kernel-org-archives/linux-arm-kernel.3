Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35BCBCA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GokK0EwgMtfsSNnIpttne/zzS1Pm4lLm8u+xuFpTDOc=; b=CkOeW7Y9U23fu1j7/dm3v2JrVy
	axEz5f2NBMN/xSWMky6Fcd+OGsxicLURbfBVXaTptYta6Ieukvr7Pk88eOfBTW+l4DWk8R7WWtuSY
	NJLEzfbYl/Q3qME3NUHATFstpavz7tMJz3dxBf12U4hPp0NnPbxuOWA5MzKpbEO8eYd4rZ2e21ipy
	3n0a8TBKeYEcw8HZNvtPYce/Ma7K7m3TG/5y5FzXLZJFCupgnlOLliDHc67XVOrRicG9NWYYwMoA/
	lA6PJESQ441H7A187Yl6jqxJVOPZa3gK8BTcQCNRXh3K4UYHeL+s6rx32VOskEwLyKbvovEQ/aaBS
	HLiYMpcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphlx-00000003z4n-0wXK;
	Sat, 23 Aug 2025 06:30:41 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upRZU-00000002af7-37LK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 13:12:46 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57MCcqnv031363;
	Fri, 22 Aug 2025 15:12:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	GokK0EwgMtfsSNnIpttne/zzS1Pm4lLm8u+xuFpTDOc=; b=0Eedm75kc0PDSdky
	/8jqHNndow2ZEb5RGHoy9LDDl00fo7DN6SI+sP01h0hN4/eGmIohw8BY+4hnQ7TK
	QJIMF7f/QQPTc1auYlfMmDjrNgw7pa4havE+xo6jvNi3jwYsG0ssCAr+A0clIdb2
	ih4l/a8IJcuw8mIqnVosxq2OSXKWOrRHTJE5qqMyYKzZ8LsqE+K5jWHpOxP5ePeF
	FWVyfur2bVOnOYGxfybcYo7SsAj0BCWT17YbvQdJsYhdOhEmYIM1kpi9+og2Q64M
	9Rh7ilp4ZnMMZRQMnkuDw9cTbbYvHqOBde8ooYnKiZXZDD9RBwshHnxecYV+c8V2
	9ZmL8Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48nd5xs993-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Aug 2025 15:12:34 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id F380D4002D;
	Fri, 22 Aug 2025 15:11:15 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 415ED7206CF;
	Fri, 22 Aug 2025 15:10:19 +0200 (CEST)
Received: from [10.48.87.178] (10.48.87.178) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 22 Aug
 2025 15:10:18 +0200
Message-ID: <d193523c-5508-4bba-971b-8c0a8b7b44de@foss.st.com>
Date: Fri, 22 Aug 2025 15:10:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/13] arm64: dts: st: enable display support on
 stm32mp257f-ev1 board
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
        Philippe Cornu
	<philippe.cornu@foss.st.com>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Christophe Roullier
	<christophe.roullier@foss.st.com>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20250821-drm-misc-next-v4-0-7060500f8fd3@foss.st.com>
 <20250821-drm-misc-next-v4-13-7060500f8fd3@foss.st.com>
Content-Language: en-US
From: Yannick FERTRE <yannick.fertre@foss.st.com>
In-Reply-To: <20250821-drm-misc-next-v4-13-7060500f8fd3@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.87.178]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_04,2025-08-20_03,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_061245_040928_A370C5C1 
X-CRM114-Status: GOOD (  13.13  )
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

Hi Raphael,

Thanks for the patch.

Acked-by: Yannick Fertre <yannick.fertre@foss.st.com>

Le 21/08/2025 à 13:09, Raphael Gallais-Pou a écrit :
> Enable the following IPs on stm32mp257f-ev1 in order to get display:
>     * LTDC
>     * LVDS
>     * WSVGA LVDS panel (1024x600)
>     * Panel LVDS backlight as GPIO backlight
>     * ILI2511 i2c touchscreen
>
> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> ---
>   arch/arm64/boot/dts/st/stm32mp257f-ev1.dts | 79 ++++++++++++++++++++++++++++++
>   1 file changed, 79 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
> index 836b1958ce65fb72c99d634a92af3efaf9844d76..2958ad413b0675575d84942e193a16f80197b88e 100644
> --- a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
> +++ b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
> @@ -86,6 +86,43 @@ mm_ospi1: mm-ospi@60000000 {
>   			no-map;
>   		};
>   	};
> +
> +	panel_lvds: display {
> +		compatible = "edt,etml0700z9ndha", "panel-lvds";
> +		enable-gpios = <&gpiog 15 GPIO_ACTIVE_HIGH>;
> +		backlight = <&panel_lvds_backlight>;
> +		power-supply = <&scmi_v3v3>;
> +		status = "okay";
> +
> +		width-mm = <156>;
> +		height-mm = <92>;
> +		data-mapping = "vesa-24";
> +
> +		panel-timing {
> +			clock-frequency = <54000000>;
> +			hactive = <1024>;
> +			vactive = <600>;
> +			hfront-porch = <150>;
> +			hback-porch = <150>;
> +			hsync-len = <21>;
> +			vfront-porch = <24>;
> +			vback-porch = <24>;
> +			vsync-len = <21>;
> +		};
> +
> +		port {
> +			lvds_panel_in: endpoint {
> +				remote-endpoint = <&lvds_out0>;
> +			};
> +		};
> +	};
> +
> +	panel_lvds_backlight: backlight {
> +		compatible = "gpio-backlight";
> +		gpios = <&gpioi 5 GPIO_ACTIVE_HIGH>;
> +		default-on;
> +		status = "okay";
> +	};
>   };
>   
>   &arm_wdt {
> @@ -183,6 +220,15 @@ imx335_ep: endpoint {
>   			};
>   		};
>   	};
> +
> +	ili2511: ili2511@41 {
> +		compatible = "ilitek,ili251x";
> +		reg = <0x41>;
> +		interrupt-parent = <&gpioi>;
> +		interrupts = <13 IRQ_TYPE_EDGE_FALLING>;
> +		reset-gpios = <&gpiog 14 GPIO_ACTIVE_LOW>;
> +		status = "okay";
> +	};
>   };
>   
>   &i2c8 {
> @@ -230,6 +276,39 @@ timer {
>   	};
>   };
>   
> +&ltdc {
> +	status = "okay";
> +
> +	port {
> +		ltdc_ep0_out: endpoint {
> +			remote-endpoint = <&lvds_in>;
> +		};
> +	};
> +};
> +
> +&lvds {
> +	status = "okay";
> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		port@0 {
> +			reg = <0>;
> +			lvds_in: endpoint {
> +				remote-endpoint = <&ltdc_ep0_out>;
> +			};
> +		};
> +
> +		port@1 {
> +			reg = <1>;
> +			lvds_out0: endpoint {
> +				remote-endpoint = <&lvds_panel_in>;
> +			};
> +		};
> +	};
> +};
> +
>   &rtc {
>   	status = "okay";
>   };
>

