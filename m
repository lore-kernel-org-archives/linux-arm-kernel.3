Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2ACEC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 17:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FBPYVaLi/uKYGxgimpo2QNuRdBqjr1WrILf7lC0MLjw=; b=M0a/9nPiKiffto0+JEKsDp37gu
	MGiVwfML9NQhBXzgp4/p3+VEtnoMVoy2UDoHVltz6I1ayM+A8ykNSsyDUCyVfctQi1Swj/qkR1UuT
	Y2Ao1ODcamQek0nXTqreDmYUaMdIldHzO4sBcgV8OeX4k8ryiPCw7Hy5sZn1PkaJ65a4SwSGkReyn
	mkrUJzrqZSqH1Zt8O20YV4LI454R78Ec2lGAMh0d8ffvvHBjcS099OmPu6sgP3CIzBY5iPp+Wl+It
	x6tUgD24qssdjWLO9By3aSQOE1ZeslR0jwBHiFnapwubIPID2o5N8b3KL2I2pTUJQUWaIvdow97Xj
	UiPWt0zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqFLB-0000000BjWE-0LT5;
	Thu, 06 Mar 2025 17:49:01 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqEGI-0000000BXWe-0hUH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 16:39:55 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5497e7bf2e0so996773e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Mar 2025 08:39:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741279192; x=1741883992; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FBPYVaLi/uKYGxgimpo2QNuRdBqjr1WrILf7lC0MLjw=;
        b=lVU0aSuyCQyIUxJNWtv17/e3Kz8LQ4f6IIJFhwRmYyMSsxhQtAQgXhW//mY5pTaXiC
         4hPrqMQKdQ1nP09m8KDZqqu8aAR/p9AneVLkoY9Iu8lMe3kVvtDfGIWg6lQCnJiWIyTn
         fh6v3i5AcGh1cSSFg4lPfB1FpS0UhtZUPqkDv6S0ha7iPO6ixQzq9oXo4R6yC12dOBHS
         eTskbhG5fqP1hRvWc0hl4AqFqhBh/Y6n5GykcJeHgsKsA2fdL/7SBOikGbp6LzJwaoCO
         gt2IqET0fUwmFdysaN5DckCkPM4ZpYA7l6FAGX0jZWSn+YTGDTq9AHoLeEL88x+f0uLa
         2duw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741279192; x=1741883992;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FBPYVaLi/uKYGxgimpo2QNuRdBqjr1WrILf7lC0MLjw=;
        b=CxkzMRWV8zayPg85BByC+iHGdCg0hYhG9OmDyRIxpgvSrzFTOAkXCLb0tHVlUO7Mz/
         AGK9LZt/5JU4aMAfpzIyJ6R6UUq3Jw9xTS0dkoFbq8l61ylWm+/kGtv3+MYNPc4HSkFd
         RdVZ2dC9CNLCaxSRCjc/SqLx4tO6adnre9TcBaP0x00A/I/+F8u2bDlB0R/S2sAAD1mg
         E3hQG4kiLmvQ4ukPy9VruJrkjdFeEpmYJRNXTE4+rtHXCK2ZTJVsIOQJYJMHADTmVBRI
         mefJarl/VI5fV2oXjI4T0KM1ANpa1w6CXz5ONIRllP75Vy1OG/cdnH6lmkOQHrF61I1y
         FqiA==
X-Forwarded-Encrypted: i=1; AJvYcCVsAksKzZvzIx731PYjXAc16oEsBPfulQt1ASzteR2XtFPzPyeOhu8GP0Y6Ss7RxjPzW3GyEY7NBGcJlfOa7Fci@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8p04yGXnrj/WrSZH9SRjk4hBoEgJ9aUBGVBQbnPqq24rYbYV4
	JK5wySi7GCG2r6G13oANKS23PWrSWbD3zHLN/VZpekOwG27d8jYysPZ0B/andC8=
X-Gm-Gg: ASbGncvuJTxYaiTC3Qims8qnQsTsvzdmaW0oyeTRw72T8gZPRmrfEl73OYaRtKrieMr
	R23qMvi2j8pl86wMkcReiVgblNGRZsT3gyHIlMLKzoTzio+orPMj9Qo234CLy6rVSuszlGysqM7
	FGL7L9RSRq9VOGlvLby9Fdxi+jxLFKd6de2jscrN94yE4Yxpb6fZQ3YglsO9ZY4iC/6BGDogryx
	mEIJYmrGLbIN2Q6pTMsd7uIF+rTcFTw+Cc+l6lGHm0M1Jxz3hheEG5RMjCvC+fE7k+zzVEiq4PX
	IHz8A43JorQV1wl8IooV5sl3bit7lG33Oy/3JF5KG/u4bd53bQwFzBS4Ri/ISKrgwBytVT4FulW
	e/mmJcL5fjVPubblNLfR9GhQc
X-Google-Smtp-Source: AGHT+IHt8WQLWAGDWHo3md1Ffan9Wx7URm1t0MnTSAc9qQkPKqnAbToODyzMc5O6JoOi7DfCRhZZiA==
X-Received: by 2002:a05:6512:2391:b0:549:9078:dd45 with SMTP id 2adb3069b0e04-5499078ddd8mr7463e87.28.1741279191737;
        Thu, 06 Mar 2025 08:39:51 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5498b1c3c0esm227438e87.248.2025.03.06.08.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 08:39:51 -0800 (PST)
Date: Thu, 6 Mar 2025 18:39:48 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Yan <andyshrk@163.com>
Cc: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>, heiko@sntech.de, 
	neil.armstrong@linaro.org, sebastian.reichel@collabora.com, devicetree@vger.kernel.org, 
	hjc@rock-chips.com, mripard@kernel.org, linux-kernel@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, yubing.zhang@rock-chips.com, dri-devel@lists.freedesktop.org, 
	Andy Yan <andy.yan@rock-chips.com>, krzk+dt@kernel.org, robh@kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/6] Add support for RK3588 DisplayPort Controller
Message-ID: <zybxwxxkua2zqukcd7tn2z4uwbqjbxt2fdtnrmpsov4hy55tzn@moxuyfxtyagb>
References: <25401bfa.291d.19564244e54.Coremail.andyshrk@163.com>
 <75189787-28E1-4FC2-8E10-4960B3877A6F@gmail.com>
 <28b0d3fc.bb3.19568f6b5f8.Coremail.andyshrk@163.com>
 <44213B17-FE14-4FB8-8319-1E31BBF6EAA0@gmail.com>
 <74c154b6.8c50.1956aa8c8d2.Coremail.andyshrk@163.com>
 <1573D5D6-AFED-4D92-8112-B0C6BB52D5FF@gmail.com>
 <46c0d239.a4f5.1956b619b97.Coremail.andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <46c0d239.a4f5.1956b619b97.Coremail.andyshrk@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_083954_204330_1FEF5A69 
X-CRM114-Status: GOOD (  24.90  )
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

On Thu, Mar 06, 2025 at 08:15:13PM +0800, Andy Yan wrote:
> Hi Piotr,
> 
> 在 2025-03-06 19:47:31，"Piotr Oniszczuk" <piotr.oniszczuk@gmail.com> 写道：
> >
> >> Wiadomość napisana przez Andy Yan <andyshrk@163.com> w dniu 6 mar 2025, o godz. 09:53:
> >> 
> >> 
> >> Hi,
> >> 
> >> 在 2025-03-06 16:42:00，"Piotr Oniszczuk" <piotr.oniszczuk@gmail.com> 写道：
> >>> 
> >>> 
> >>>> Wiadomość napisana przez Andy Yan <andyshrk@163.com> w dniu 6 mar 2025, o godz. 01:59:
> >>>> 
> >>>> 
> >>>> 
> >>>> 
> >>>> Both of the two config options should be enabled.
> >>>> andy@Pro480:~/WorkSpace/linux-next$ rg DW_DP .config
> >>>> 4044:CONFIG_ROCKCHIP_DW_DP=y
> >>> 
> >>> here i’m a bit lost….
> >>> greping on full kernel sources (with applied https://patchwork.kernel.org/project/linux-rockchip/list/?series=936784) gives me no single appearance of ROCKCHIP_DW_DP…
> >>> Do i miss something?
> >> 
> >> see PATCH 3/6:   
> >> 
> >> 
> >> diff --git a/drivers/gpu/drm/rockchip/Kconfig b/drivers/gpu/drm/rockchip/Kconfig
> >> index 26c4410b2407..c8638baf9641 100644
> >> --- a/drivers/gpu/drm/rockchip/Kconfig
> >> +++ b/drivers/gpu/drm/rockchip/Kconfig
> >> @@ -8,6 +8,7 @@ config DRM_ROCKCHIP
> >> select DRM_PANEL
> >> select VIDEOMODE_HELPERS
> >> select DRM_ANALOGIX_DP if ROCKCHIP_ANALOGIX_DP
> >> + select DRM_DW_DP if ROCKCHIP_DW_DP
> >> select DRM_DW_HDMI if ROCKCHIP_DW_HDMI
> >> select DRM_DW_HDMI_QP if ROCKCHIP_DW_HDMI_QP
> >> select DRM_DW_MIPI_DSI if ROCKCHIP_DW_MIPI_DSI
> >> @@ -58,6 +59,12 @@ config ROCKCHIP_CDN_DP
> >>  RK3399 based SoC, you should select this
> >>  option.
> >> 
> >> +config ROCKCHIP_DW_DP
> >> + bool "Rockchip specific extensions for Synopsys DW DP"
> >> + help
> >> +  Choose this option for Synopsys DesignWare Cores DisplayPort
> >> +  transmit controller support on Rockchip SoC.
> >> 
> >> https://lore.kernel.org/linux-rockchip/047EECFC-7E55-44EC-896F-13FE04333E4D@gmail.com/T/#m178a325ea0ebc64187aae474d77c3f7a9e0bc93d
> >>> 
> >
> >
> >Ah my bad!
> >One patch patch was commented - so not all dp code was applied.
> >
> >Now it is much better:
> >
> >root@myth-frontend-56b0f018b5e0:~ # dmesg | grep drm
> >[    9.795380] panthor fb000000.gpu: [drm] clock rate = 198000000
> >[    9.796257] panthor fb000000.gpu: [drm] mali-g610 id 0xa867 major 0x0 minor 0x0 status 0x5
> >[    9.796262] panthor fb000000.gpu: [drm] Features: L2:0x7120306 Tiler:0x809 Mem:0x301 MMU:0x2830 AS:0xff
> >[    9.796265] panthor fb000000.gpu: [drm] shader_present=0x50005 l2_present=0x1 tiler_present=0x1
> >[    9.851869] panthor fb000000.gpu: [drm] Firmware protected mode entry not be supported, ignoring
> >[    9.851921] panthor fb000000.gpu: [drm] Firmware git sha: 814b47b551159067b67a37c4e9adda458ad9d852
> >[    9.852127] panthor fb000000.gpu: [drm] CSF FW using interface v1.1.0, Features 0x0 Instrumentation features 0x71
> >[    9.852436] [drm] Initialized panthor 1.3.0 for fb000000.gpu on minor 0
> >[   10.003108] rockchip-drm display-subsystem: bound fdd90000.vop (ops vop2_component_ops)
> >[   10.004705] rockchip-drm display-subsystem: bound fde60000.dp (ops dw_dp_rockchip_component_ops)
> >[   10.006085] rockchip-drm display-subsystem: bound fdea0000.hdmi (ops dw_hdmi_qp_rockchip_ops)
> >[   10.006679] [drm] Initialized rockchip 1.0.0 for display-subsystem on minor 1
> >[   10.006737] rockchip-drm display-subsystem: [drm] Cannot find any crtc or sizes
> >[   10.007663] rockchip-drm display-subsystem: [drm] Cannot find any crtc or sizes
> >
> >Unfortunately still nothing on screen
> >
> >dri state: https://gist.github.com/warpme/5e971dfd2e9fd52fae76641831cebe46
> >
> >and kernel dmesg https://termbin.com/r0m3
> >
> >i’m not sure what is missing (some dts enablement or….)
> 
> From your dts,  I find you use gpio for hpd, I'm not sure how to handle it  with upstream  code now.
> 
> 
> &dp1 {
> 	status = "okay";
> 	pinctrl-names = "default";
> 	pinctrl-0 = <&dp1_hpd>;
> 	hpd-gpios = <&gpio3 RK_PD5 GPIO_ACTIVE_HIGH>;

If this GPIO is handled by the DP controller itself, it should be a part
of DP's node. Otherwise please move it to the correctponding
dp-connector node.

> };
> 
> I suggest a change like this:
> 
> &dp1 {
> 	status = "okay";
> 	pinctrl-names = "default";
>         pinctrl-0 = <&dp1m0_pins>;
> 
> };
> 
> And also remove dp1_hpd pinctrl in your dts.
> 
> Then when you DP cable plugin, you can run command as bellow to see if the driver detects the HPD:
> 
> # cat /sys/class/drm/card0-DP-1/status 
> connected
> # 

-- 
With best wishes
Dmitry

