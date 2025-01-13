Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBDCDE7719F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 09:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2m7BqFyPTCb5l2+wQfuOnNqekkEOfPARePQKvpZbjSw=; b=CfZiTApyooSSVtMvnugUwDLlpC
	Ix05eFymBg/TVpsk/sM3iNn+VQYicF83vqKdBqMyOAo62OkyZcnX/XEaRO4JvU7EUZXLO7WRusSop
	iznYifEnkYoYU5zs+IPkKzv7kBpHEGVh+HFLoOjJLu55kymh97yuRuMr01oOrFI3eMv0YKsP8I4/g
	jxr0EW4c7l5PKWIA1x5EUs4W2i2y0HODCtJ8ikrJZaBorMHBzuBjyjkt+0zIcXGmGh5POaJcSMaYv
	JVhRgpgWZeAT2QsA7KBe0nlMpL8cCsT1yByIcIfq6uTOh6tWYoA4oh/4psRBrMgFXrRvQqekbqWLI
	UXI7+TUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXGcT-00000004a2s-3S9I;
	Mon, 13 Jan 2025 09:20:25 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXGSV-00000004Y8v-16Ue
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 09:10:09 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-53e3a227b82so3488105e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jan 2025 01:10:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736759405; x=1737364205; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2m7BqFyPTCb5l2+wQfuOnNqekkEOfPARePQKvpZbjSw=;
        b=f66w0IweUKuCo07oZfKp/IZrAs5/BZA08j1LADCj/KUCVFcrDI7VIIkzwXZICmWvDe
         XjCnkuMJjFkZ/p5+G+sBvBlgXJ1Addjv2Fmqy+ERtUcKo2xLtmkoC9nDE3H0S9RTAEPa
         RZazfSAt0SZxQjvakPq/C5s0X89LwZpd1Sdt4frzpnQRHlnTaDvv8lI55lxT2wR0tPHR
         X5yBWVgifkvw61Hr6ASDKao+zaIVeywCPMir8frtPcDcmRco8mZByxawbEbTDuFCMObz
         pQeBd1DOfu70tCTOhmy3yD5pJSUmuwRDPJbDC5enRLSo5Ojt4MM3OlrqsINI//ZvpL/l
         YE/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736759405; x=1737364205;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2m7BqFyPTCb5l2+wQfuOnNqekkEOfPARePQKvpZbjSw=;
        b=pMkLYFTmIMPFDZN+an+jv7rNkRke/gfKNDvza35n211dsw8wfR1ZtF/XhWRvyR79G6
         C3ib8rWyD+eYMCTpd9QGQKO6PziFrSWbWgKOeamjz7COdsQn1y6CvNxsEGbYTUvBWe79
         8u+bjkJVuMuhEn8Ibn1f7b7OcvJD2bRVqMivWzzFL7Xz2bz1MIU2ImzRbcUTaTyGyWB5
         nTrtrZVobkdK1g1yfL0A4dhALNbvdh4oDEe404qpSzmpmXbdsDv/+X39Ty/9JjKm7S81
         mx7Oyfq4qoWn64F/95b4991Xz4DklY4I522vvadmDkU6t88mF2dmtSiuxEyNjav2fOZf
         vXtw==
X-Forwarded-Encrypted: i=1; AJvYcCXhen6HnTomtVVWaKq01vuLItFS2BpI8Me4NgkVQ6JIoVl7G/FOJ9b1mTVW00bNZMVSTXLdKAnkgfEWv8HN725J@lists.infradead.org
X-Gm-Message-State: AOJu0YyFsFzKVQ7I+w7QX/nzhrPd1buMgZBHOF93BL4QwepfALa77/EN
	qY35U7XbNGPCFcd2Na6G0B8KrWADIt4tqENmxM/12Emy5gzsZ3FkU1n/Qw0XswU=
X-Gm-Gg: ASbGncuSL0z7CMVIflK2spfhLHlHp0SWSaFhngE9qPGPbdfnovNrVwd+PrX+0Kph6B/
	ETqZmQ/kBiwDEl3uQrQZxPC+yRWeIiuNiJ+Szz2B/FTSIh8UN5mtSL1wJnlQFxbu1Sf8kzNTBJz
	shL+3tf3d+eqFgniTZ/Vq1PnsDcRFs4aqGRxKaucAehoSsy97Kyl+ArfT7LNag0DamEqgL/86xv
	uR+mVI+4yo8RaZfotQStlFQhoboUUriAZvT+iMnSPgZZKhg/nqr1baQAGhCAj9GwNLq4R3tQP0R
	W//c94bTBkb4EqX59E4+KIJCCT+3BBrL8Jpj
X-Google-Smtp-Source: AGHT+IGw4VY/Y6W8zkOKJuAFr5OCeGQE4lHsOJ/tJKFeVu0YC0sUMWeW67o9DovWrzDT+skDY5PJJw==
X-Received: by 2002:a05:6512:3f12:b0:540:3566:5397 with SMTP id 2adb3069b0e04-542845b70d4mr6410811e87.22.1736759405308;
        Mon, 13 Jan 2025 01:10:05 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428be5492bsm1294955e87.104.2025.01.13.01.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 01:10:04 -0800 (PST)
Date: Mon, 13 Jan 2025 11:10:01 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, rfoss@kernel.org, vkoul@kernel.org, 
	sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com, l.stach@pengutronix.de, 
	andy.yan@rock-chips.com, hjc@rock-chips.com, algea.cao@rock-chips.com, 
	kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org
Subject: Re: [PATCH v1 0/6] Add eDP mode support for Rockchip Samsung HDPTX
 PHY
Message-ID: <ezoduel3qz5ihlhekry26cb7ace3bm4xmzsfrsqvbodtcl3gjq@xxo75h7uozei>
References: <20250112090714.1564158-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250112090714.1564158-1-damon.ding@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_011008_305059_8E362D75 
X-CRM114-Status: GOOD (  14.61  )
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

On Sun, Jan 12, 2025 at 05:07:08PM +0800, Damon Ding wrote:
> Picked from:
> https://patchwork.kernel.org/project/linux-rockchip/list/?series=923593

Then it should have been v6, not v1.

> 
> These patchs have been tested with a 1536x2048p60 eDP panel on
> RK3588S EVB1 board, and HDMI 1080P/4K display also has been verified
> on RK3588 EVB1 board.
> 
> Damon Ding (6):
>   phy: phy-rockchip-samsung-hdptx: Swap the definitions of LCPLL_REF and
>     ROPLL_REF
>   phy: phy-rockchip-samsung-hdptx: Supplement some register names with
>     their full version
>   phy: phy-rockchip-samsung-hdptx: Add the '_MASK' suffix to all
>     registers
>   phy: phy-rockchip-samsung-hdptx: Add eDP mode support for RK3588
>   dt-bindings: display: rockchip: Fix label name of hdptxphy for RK3588
>     HDMI TX Controller
>   arm64: dts: rockchip: Fix label name of hdptxphy for RK3588
> 
>  .../rockchip/rockchip,rk3588-dw-hdmi-qp.yaml  |   2 +-
>  arch/arm64/boot/dts/rockchip/rk3588-base.dtsi |   4 +-
>  .../dts/rockchip/rk3588-coolpi-cm5-evb.dts    |   2 +-
>  .../rockchip/rk3588-coolpi-cm5-genbook.dts    |   2 +-
>  .../boot/dts/rockchip/rk3588-evb1-v10.dts     |   2 +-
>  .../rk3588-friendlyelec-cm3588-nas.dts        |   2 +-
>  .../arm64/boot/dts/rockchip/rk3588-jaguar.dts |   2 +-
>  .../boot/dts/rockchip/rk3588-nanopc-t6.dtsi   |   2 +-
>  .../dts/rockchip/rk3588-orangepi-5-plus.dts   |   2 +-
>  .../boot/dts/rockchip/rk3588-rock-5b.dts      |   2 +-
>  .../boot/dts/rockchip/rk3588-tiger-haikou.dts |   2 +-
>  .../boot/dts/rockchip/rk3588s-coolpi-4b.dts   |   2 +-
>  .../dts/rockchip/rk3588s-indiedroid-nova.dts  |   2 +-
>  .../boot/dts/rockchip/rk3588s-nanopi-r6.dtsi  |   2 +-
>  .../boot/dts/rockchip/rk3588s-odroid-m2.dts   |   2 +-
>  .../boot/dts/rockchip/rk3588s-orangepi-5.dtsi |   2 +-
>  .../boot/dts/rockchip/rk3588s-rock-5a.dts     |   2 +-
>  .../boot/dts/rockchip/rk3588s-rock-5c.dts     |   2 +-
>  .../phy/rockchip/phy-rockchip-samsung-hdptx.c | 971 +++++++++++++++++-
>  19 files changed, 934 insertions(+), 75 deletions(-)
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

