Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3397C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 13:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2iiE6UVA0heAgE+9tDmCf0F1m5lLI5gJLshxcqafEbQ=; b=PfJT5rSD8tj7Ia7JtGaiwyCLyq
	QkyK131GcUZPAFkcBgKjae84YiafUENInXFEwg8Y0XfAon6RMHDxPDeA20fMNb+T0S+r2kAB7AQ42
	sQ8C/CNDzo82dCVWYScFeV1Jy+WFyMKP+dnlFmMkACSZAcmQcJa7MPsqsJ2vmvpJY8B0nNmkU/ADk
	ZH4Ro5xb9ltZNUTC0cMlTEn4IgiJ9RHDkkbknCT2rU/TpN1Qi6K6TQNq14DSnMxL54OmxsVW4ADAu
	1WFk0h7eXv0PEE5qDxoZw+AEeqrlv0k32Yv5aQk/9zrBsSh+sA4ycQo0pFdOQo5w/sjvnFo/b1VgP
	Hy7ByMjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x27hH-0000000HQay-22yO;
	Thu, 03 Sep 2026 13:41:43 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x27hF-0000000HQa8-0q5i
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 13:41:42 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-48431648f33so710391f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 06:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788442898; x=1789047698; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2iiE6UVA0heAgE+9tDmCf0F1m5lLI5gJLshxcqafEbQ=;
        b=KfDnWQn6WrIGPRtBtkkbp5fzU50sp4XEowqgJ8TKhZcMvXAi1kS8Ci11cKW4xesc09
         uYRoFQ/xG02cENFtBue1NeIvuN5lfN/gKar89FV0k2JVnX7MmfYnF/o0IVSU+7TslEEv
         wSXIev+ZpqKPl+/F4iyaJYjUpX0+dN7h2kThvA1wIA9b/SN04eLtlb4qGXqy4zD/DwSH
         pJeEf/osgghH2YNh7R0MLrR4F5+NvvCLmiWRMkulYT/9Jstef4+mPOfWAys5F46NpkDk
         Mm2Yb2DyAz75mF/8uyAuEDlYNckqCpBXfNoJCLUIR6uz7iA2OBQ3SGLW1Qmi41vUEfW+
         8Rgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788442898; x=1789047698;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2iiE6UVA0heAgE+9tDmCf0F1m5lLI5gJLshxcqafEbQ=;
        b=fMfVyPzcmXMcVEyRf/9wchE5XwdglxcgE3AoQ9GG7CtAxjjto7RA1SW7pW0gtsdO5b
         f9S45vpB/oda6CJnxd4P7JtvB11Jb8C5KWCT3aHbpDFuWHRaruBnVviVO0FmgddMUd6J
         6cj5t4GeaCPkux7x9oeYiAPIzV0OqzKHlt6LghPGYzY+Dpil6teUhxPU6J6j9h6jsz/L
         ExwP6Xc+zprU4Zil/TI0ZQa51/5FSeclobNwHECrttByUEnweX6lTZTNcEuc+AMT8+6g
         zXN6+fSNTfeuRheYHsU8T9aaYi6uPwENg5Kabixr6u1JG/8IJQg6gx3RhHd8UOkhI3oB
         lsDA==
X-Forwarded-Encrypted: i=1; AKwUvBx/fsYK877dFdH9QgmR43v9q15vsfSx1zawvjx0kbn/4DpUxai/IJMweReo6lrKIgu+C9jdmvoPvkZQxZw8ygDc@lists.infradead.org
X-Gm-Message-State: AFuF++mYXms0Sxvj3wvUHlghCtfiaUTyTm/6bIXTft1KDuVuxD/uaJ++
	GvSSOEeh7iVn3XBVbX+3s+tYJuY7KuMm0pz6k3ocYcTyXdfczgmmklMIS120yKeyuA0=
X-Gm-Gg: AYBFou3xAFN3InIVS8H1KzfjmgxfrPGUVmnz9KH3z9wBEA0Odq6VtO0m3JzEOxg89eK
	8E9qbcBIWE1AkLjzTSP3xm3Jh78h47tMZputA3n1XNeTEwnkQoz3x6Fb6DVH8Hon0MzAol1Dqg8
	mewKRrC8T71ZBszkCwjlZ5TY8pEuYf3kgMwrcZsyUXEV812P7bmESK/4WKbHS5M87Cdtg17J2dd
	VsqMQqTrx/WOiZKaigQ9eDrecxC/AQUwdCdK6K/6Ksl2ve0cSTo+M1pOs2Ima3TmQoJ4p7bxnGm
	ugTe7TcM3fVpHulZS9vaZ0/aAXyZ1yB5x+CNc5yGKIXzE/SHnC6R24ldHFGpdARosUALHmO1xxx
	9G9p9nRhXlSJJM+OzFEWCh85Xr8dQUcNTRnhajREZxlbPwm8pf1rshahbPahQRB24qB3b8qJqsd
	qd3IaAlbUfWCCVg/I+S+B8P5VqSkMyqzRsVD8caNw5zlFmgs/om/ol0YUnLA==
X-Received: by 2002:a05:600c:1388:b0:49c:eded:44e with SMTP id 5b1f17b1804b1-49cf158e77fmr37815585e9.7.1788442898624;
        Thu, 03 Sep 2026 06:41:38 -0700 (PDT)
Received: from localhost ([194.183.24.73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5dec54sm86567845e9.12.2026.09.03.06.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 06:41:37 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 3 Sep 2026 15:45:16 +0200
To: Peter Robinson <pbrobinson@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Phil Elwell <phil@raspberrypi.com>, devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Andrea della Porta <andrea.porta@suse.com>
Subject: Re: [PATCH 3/3] arm64: dts: broadcom: bcm2712: Add USB OTG port
Message-ID: <apl57BlWIkOWjWAu@apocalypse>
References: <20260802145109.728793-1-pbrobinson@gmail.com>
 <20260802145109.728793-4-pbrobinson@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260802145109.728793-4-pbrobinson@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_064141_257844_1B186B87 
X-CRM114-Status: GOOD (  18.92  )
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

Hi Peter,

On 15:50 Sun 02 Aug     , Peter Robinson wrote:
> The Raspberry Pi 5 has a USB2 OTG port wired up to the
> Type-C that uses the same IP in earlier generations so
> wire this up so it can be used.
> 
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> Cc: Florian Fainelli <florian.fainelli@broadcom.com>
> Cc: Dave Stevenson <dave.stevenson@raspberrypi.com
> ---
>  .../dts/broadcom/bcm2712-rpi-5-b-base.dtsi    |  6 +++++
>  arch/arm64/boot/dts/broadcom/bcm2712.dtsi     | 25 +++++++++++++++++++
>  2 files changed, 31 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
> index d998bfae91acb..e5030da60f9e7 100644
> --- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
> +++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
> @@ -3,6 +3,7 @@
>  
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/input/input.h>
> +#include <dt-bindings/power/raspberrypi-power.h>
>  #include "bcm2712.dtsi"
>  
>  / {
> @@ -239,6 +240,11 @@ bluetooth: bluetooth {
>  	};
>  };
>  
> +&usb {
> +	power-domains = <&power RPI_POWER_DOMAIN_USB>;
> +	status = "okay";
> +};
> +
>  &hvs {
>  	clocks = <&firmware_clocks 4>, <&firmware_clocks 16>;
>  	clock-names = "core", "disp";
> diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
> index c73ed9e066662..f650a5cd8462d 100644
> --- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
> +++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
> @@ -55,6 +55,13 @@ clk_sw_baud: clk-sw-baud {
>  			clock-frequency = <96000000>;
>  			clock-output-names = "sw-baud";
>  		};
> +
> +		clk_usb: clk-usb {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +			clock-frequency = <480000000>;
> +			clock-output-names = "otg";
> +		};
>  	};
>  
>  	cpus: cpus {
> @@ -693,6 +700,19 @@ v3d: gpu@1002000000 {
>  			interrupts = <GIC_SPI 250 IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 249 IRQ_TYPE_LEVEL_HIGH>;
>  		};
> +
> +		usb: usb@100480000 {

Please fill in the missing 0 in the unit number. Apart from that, LGTM.

Thanks,
Andrea

> +			compatible = "brcm,bcm2835-usb";
> +			reg = <0x10 0x00480000  0x0 0x10000>;
> +			interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			clocks = <&clk_usb>;
> +			clock-names = "otg";
> +			phys = <&usbphy>;
> +			phy-names = "usb2-phy";
> +			status = "disabled";
> +		};
>  	};
>  
>  	vc4: gpu {
> @@ -756,4 +776,9 @@ cooling_maps: cooling-maps {
>  			};
>  		};
>  	};
> +
> +	usbphy: phy {
> +		compatible = "usb-nop-xceiv";
> +		#phy-cells = <0>;
> +	};
>  };
> -- 
> 2.55.0
> 

