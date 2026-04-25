Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A8B3FF885C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 11:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fmLIjn9rXrvUt58W7li1vLjkEXxPp633KH6ZWld0lpg=; b=TiiCMNngDo9tJqzwizWbnuc9El
	nRhBLVlwAJGo09KBB8/Y7uk7QPzXT2BZ1/dUm/Y/wH/lBdoxDAxSYqQMtvY5eq5PXdlZF6DBrbPQc
	kz2tY88NQEF+9j7++aEitAoPRa/TzzsxbOdx27KMIqC5tmUsxTNYIzeD50PBA/7sXtSTb6XMCRTCW
	58HhJqKWcUB5kAsMOQ5qE1G8gHDJfEIovycyyj/bV9oX4Lqr+Zxc/CwkwK6McNoKaH2VtrQ6BXHxO
	J8vGmMjOgCbaeSaXbPkzcb612ozPUdlteV36r5Q1qpNq9D3lExWn5HkGGQBjuKskZxEdjvD2kjOsm
	TrQSqVQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGbAT-0000000EOUX-33SG;
	Sat, 25 Apr 2026 11:27:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGbAQ-0000000EOUB-21J6
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 11:27:23 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63P3ZBmA623782
	for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 11:27:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fmLIjn9rXrvUt58W7li1vLjk
	EXxPp633KH6ZWld0lpg=; b=oVUs1NDli2CZHbhP0Uzwp/lzSspjG7iwolA1Ftv0
	cIyuUL/XS+pJmXPUA9igxQftAdMKvZwJ4xVC62pGFz+41u+LhtAeHEuh6DfF/7je
	Ll3Q59Qmg+4dR/2AUfp8Pa6noxqRVs6u7ApIgsFHNdZTk4H502X7KmIjge7yX1MB
	6g+GmriWruNXdAwPoqSYr1vwWnN7CkdVzEPA/SU3mcXQ6uz/MdFUBhKQMpMd9YjR
	pr4m35HQzFtF8RB+/oweJKngb8vw9wsDJMQ/0qL6pnMy9eQzOq7HlaV4JkKbomh1
	strOYyCSKNmBiAhs78AmmfpTCtBsGX7P8BVb7T7dKGfBcA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnu2rs5x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 11:27:21 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-56f1fe60919so15733754e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 04:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777116441; x=1777721241; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fmLIjn9rXrvUt58W7li1vLjkEXxPp633KH6ZWld0lpg=;
        b=VVrqjbMi2Xj+w8KHZrROPqbd+SNnOlwRTeCA4FpZ2aKRgGD39vYACi3K2gvpwqc4gl
         zz/CdsmxaK+qdobVqC/N99fNElrX4VPIYgFXMoSrKuHoKuCBXAvWHneWn6V8S4o2p+u5
         PgYuaHCMYH9Ltbv27bFw2N09FmSiw75SdcHE9SStBChlNjSC8IBlVnFFdHcQGDqEfMzn
         k/yAnhWKhnWtDYvjDKqsijioagWn9toiBJyzmT556taEkOKvM8sYnG4+h+Ebf5kEc4MN
         7Pt4jpYG7hOOeXnYp5vPEBiSPhVqS48LpaQ6Z9WjsI93/p1PL9mf3KkIkuXBkdI3qDq5
         vwoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777116441; x=1777721241;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fmLIjn9rXrvUt58W7li1vLjkEXxPp633KH6ZWld0lpg=;
        b=LCEfQ8uiZ0NvrfeMp8i2w7y8vEGZCnzDaUODRYjrra+RaqmKjq+QArL1pPX/jg2Fzo
         lLdwTx+PYaXtkSJdU9a+lvpVX+FqUmssupwrL42l2JScWkS2muEZjWfDSK2tKioO2Dxw
         0SYXLTCs7df2EACq2b9W9Z2d3F2vGvvh7UvXXUmRKa9L4URbbBkQ6dLZ7zHmEQaohL6n
         vBZ0FTMb+8oGT6K21SCxXv5tfuqatzBL5sA7jsb7AdRPyvCp3KmHRJpxZOJPaDi+QZ0p
         f+RsAJd73+ySC1SRl+Ov06F9n2PSqJuMDI9JNuhHXcuIDjy0Ok3/ZheDUxALVZicRlyw
         qKTw==
X-Forwarded-Encrypted: i=1; AFNElJ+Aou+65UYe0QoFDfbXIMLt/J/w4SUBMjce543FkGLajLyl6g6n3vay7DCKK78DJDEK4QQ98cMfoEY5VFfhulz/@lists.infradead.org
X-Gm-Message-State: AOJu0YzFJmU/J4r86ZSEvtnKswURAORi2NFevJN+q5ExTDYP10f9/5dT
	ctMZzFWwdHKaDvr1pHPLe62d3WPGEJgbf1EhO9CZwL9fkEumqd5aMLwQRzVBrC+2KF3cZ1Zp2nX
	2nRc+kBYpGtKKc7UwHwk6aBUHIu72vox7hC9V3Ay3FPMtCt6EkEBL49DC3ojd3zneNSrNI3VVVK
	8W7Q==
X-Gm-Gg: AeBDievPxBqUK1mhqqdQd/o3X3byPJfnmJAX+MKASlDmK4e13hQ2OIeT9eNlMMhUiG3
	cR9WmyBUXevJrtJK5Sslj9OXMGCO3gwjnkrFi2FE2V8fWNJikuqsSiyr+ZTkyOvGuOOaO8dEirx
	qfO8CsoPqUp2HcfGlY3vbfU/5gXy7EdAhG5zxVKG7rD3Y+2DlVfMa3omLmx01AFMKPbUtCPIwac
	XQNA8OccRptStNEFyh7nK6+5AbITGlZnUHv0LWIKVREzXi7uu0J9o0DjZcnfOMAJa+At02OXzO2
	3v3kIw+zM2jlTOV8GUkyRJFIbMmvNdjMfC/Y32nIe9ZI/JO1ZarKT/QPSDGoSlUEjGZNNYUKYHV
	o6bgH5rozsgbm5y2oQyxwm89fJR7Y/SsbizlWNnwv1miBraEr+VAREiCd8WFyBqBnIkifnv+9JL
	+cxWZNges6eQEPcof9eGcXmLyHcx5rlMqH4oYStqbU7DgE0w==
X-Received: by 2002:a05:6102:3e0f:b0:605:19ce:9ccf with SMTP id ada2fe7eead31-616f58af7d9mr18831234137.13.1777116440669;
        Sat, 25 Apr 2026 04:27:20 -0700 (PDT)
X-Received: by 2002:a05:6102:3e0f:b0:605:19ce:9ccf with SMTP id ada2fe7eead31-616f58af7d9mr18831208137.13.1777116440223;
        Sat, 25 Apr 2026 04:27:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb4f5035sm55448141fa.4.2026.04.25.04.27.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 04:27:18 -0700 (PDT)
Date: Sat, 25 Apr 2026 14:27:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Lukas Timmermann <linux@timmermann.space>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Douglas Anderson <dianders@chromium.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Alexandre Marquet <tb@a-marquet.fr>
Subject: Re: [PATCH 5/5] ARM: dts: exynos: Add display support for
 exynos5250-manta
Message-ID: <4hbwdx7xfdko4pmmjq55ttfmiszjbtx56wb4io3p7dhq2dydh3@j4dgwilyumg2>
References: <20260423-manta-display-v1-0-196f80c5673a@timmermann.space>
 <20260423-manta-display-v1-5-196f80c5673a@timmermann.space>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423-manta-display-v1-5-196f80c5673a@timmermann.space>
X-Proofpoint-GUID: 2KwwYIvCIY_hinIBSI-PASwC3O0YO2Fv
X-Authority-Analysis: v=2.4 cv=cbriaHDM c=1 sm=1 tr=0 ts=69eca519 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=5VA55DBcQVjzkzcLKVwA:9
 a=CjuIK1q_8ugA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-ORIG-GUID: 2KwwYIvCIY_hinIBSI-PASwC3O0YO2Fv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI1MDExNCBTYWx0ZWRfXwN8CPAChYS34
 BrmCogBY21KQFSspRyFW8o5Ex18kJbx5L3Ib4yZgvU111kGEZ9GVTaAtA0k5TOHkl8FIFnFq7d5
 joixkZvAWMxde3uYSyOLIHW/AkxLz3ryxQzPzBRBkISk6NMnzKtvD/BI5wZN5Z7TB5ZBgFTUxfL
 +e3Hh1O7kJ9Ktr3zOm3bgQTqxwovpjfoKukA5P6tqIDSCpm3cCCc/SBgdJRDHun2Y43uJyYm8q6
 z2fEIo2l8gZLJCmc0Qgm908rNCGp4/sWVPRawr0ZFl12r3YtALC8WFXGoVSjEDCKmlsv4na0Xi0
 X69m4OoCSdpygTTqsFS3Wl0asIGpNkcR7Rj84j4M9Zp7aKOmK7663Wt7EUrOcrW201iZwkZMqhq
 7kX26iaH+6hTOLk7yaLp6J8lbIhNQCI0FCAATthFQyBm69SQumAFnGwvdiqDkfEx/xDvASzl1Y+
 YqVor8wlXpW2qImc2qQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-25_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604250114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_042722_598342_B0A63853 
X-CRM114-Status: GOOD (  22.44  )
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

On Thu, Apr 23, 2026 at 11:14:41PM +0200, Lukas Timmermann wrote:
> Adds the necessary entries for panel and backlight as
> well as the fimd controller.
> 
> Signed-off-by: Alexandre Marquet <tb@a-marquet.fr>
> Signed-off-by: Lukas Timmermann <linux@timmermann.space>
> ---
>  arch/arm/boot/dts/samsung/exynos5250-manta.dts | 99 ++++++++++++++++++++++++++
>  1 file changed, 99 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/samsung/exynos5250-manta.dts b/arch/arm/boot/dts/samsung/exynos5250-manta.dts
> index 76d3657eb22f..eb97a28ff4e3 100644
> --- a/arch/arm/boot/dts/samsung/exynos5250-manta.dts
> +++ b/arch/arm/boot/dts/samsung/exynos5250-manta.dts
> @@ -25,6 +25,29 @@ aliases {
>  		mmc1 = &mmc_1; /* WiFi */
>  	};
>  
> +	backlight: backlight {
> +		compatible = "pwm-backlight";
> +		pwms = <&pwm 0 1000000 0>;
> +
> +		brightness-levels = <2 255>; /* TODO */
> +		num-interpolated-steps = <254>; /* TODO */
> +		default-brightness-level = <102>; /* TODO */
> +		post-pwm-on-delay-ms = <97>; /* TODO */
> +
> +		power-supply = <&backlight_reg>;
> +		enable-gpios = <&gpg0 5 GPIO_ACTIVE_HIGH>;
> +
> +		pinctrl-0 = <&led_bl_reset &pwm0_out>;
> +		pinctrl-names = "default";
> +	};
> +
> +	backlight_reg: regulator-backlight {
> +		compatible = "regulator-fixed";
> +		regulator-name = "APS_EN_18V";
> +		pinctrl-0 = <&aps_en_18v>;
> +		pinctrl-names = "default";
> +	};
> +
>  	/* Voltage source unknown */
>  	bmp180_vdda_reg: regulator-bmp180-vdda {
>  		compatible = "regulator-fixed";
> @@ -105,6 +128,28 @@ multi-led {
>  		leds = <&status_red>, <&status_green>, <&status_blue>, <&status_white>;
>  	};
>  
> +	panel {
> +		compatible = "samsung,ltl101dl02-002";
> +
> +		backlight = <&backlight>;
> +		power-supply = <&panel_reg>;
> +		enable-gpios = <&gph1 7 GPIO_ACTIVE_HIGH>;
> +		pinctrl-0 = <&lcd_en>;
> +		pinctrl-names = "default";
> +		no-hpd;
> +
> +		port {
> +			panel: endpoint {
> +				remote-endpoint = <&dp_out>;
> +			};
> +		};
> +	};

No, the panel is not just being attached to the device. I asumme it is
controlled over the AUX bus, so it shoud be a child device of the
AUX bus.

> +
> +	panel_reg: regulator-panel {
> +		compatible = "regulator-fixed";
> +		regulator-name = "LCD_EN";
> +	};
> +
>  	pwrseq: mmc1-pwrseq {
>  		compatible = "mmc-pwrseq-simple";
>  
> @@ -146,10 +191,36 @@ &cpu1 {
>  	cpu-supply = <&buck2_reg>;
>  };
>  
> +&dp {
> +	status = "okay";
> +
> +	samsung,color-space = <0>;
> +	samsung,color-depth = <1>;
> +	samsung,link-rate = <0x0a>;
> +	samsung,lane-count = <4>;
> +	samsung,dynamic-range = <0>;
> +	samsung,ycbcr-coeff = <0>;
> +
> +	ports {
> +		port {
> +			dp_out: endpoint {
> +				remote-endpoint = <&panel>;
> +			};
> +		};
> +	};
> +};
> +
>  &ehci {
>  	status = "disabled";
>  };
>  
> +&fimd {
> +	status = "okay";
> +
> +	assigned-clocks = <&clock CLK_MOUT_FIMD1>, <&clock CLK_MOUT_VPLL>;
> +	assigned-clock-parents = <&clock CLK_MOUT_VPLL>;
> +};
> +
>  &i2c_1 {
>  	status = "okay";
>  
> @@ -396,6 +467,12 @@ ldo25_reg: LDO25 {
>  	};
>  };
>  
> +&mali {
> +	status = "okay";
> +
> +	mali-supply = <&buck4_reg>;
> +};
> +
>  &mixer {
>  	status = "okay";
>  };
> @@ -489,6 +566,14 @@ wlan_irq: wlan-irq-pins {
>  };
>  
>  &pinctrl_1 {
> +	aps_en_18v: aps-en-18v-pins {
> +		samsung,pins = "gph1-6";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>; /* TODO */
> +		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_INPUT>; /* TODO */
> +		samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_UP>; /* TODO */
> +		samsung,pin-val = <0>; /* TODO */
> +	};
> +
>  	bh1721fvc_reset: bh1721fvc-reset-pins {
>  		samsung,pins = "gph1-2";
>  		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
> @@ -509,6 +594,20 @@ bt_wake: bt-wake-pins {
>  		samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_NONE>;
>  	};
>  
> +	lcd_en: lcd-en-pins {
> +		samsung,pins = "gph1-7";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>; /* TODO */
> +		samsung,pin-val = <0>;
> +	};
> +
> +	led_bl_reset: led-bl-rst-pins {
> +		samsung,pins = "gpg0-5";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>; /* TODO */
> +		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>; /* TODO */
> +		samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_NONE>; /* TODO */
> +		samsung,pin-val = <0>; /* TODO */
> +	};
> +
>  	msense_reset: msense-reset-pins {
>  		samsung,pins = "gpg2-0";
>  		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
> 
> -- 
> 2.53.0
> 

-- 
With best wishes
Dmitry

