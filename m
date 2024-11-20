Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B4EBD44171
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 09:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oJLDnW4xgZ8CURNC2nEQvItuWPLm2zclX2H1mWV132I=; b=hEmHS21GUu6BZDLtcbb5W+uoQy
	pH/lX0cobcNJHKg04bjTVdh9IWhM+jl83tzNgFGJ7YowY9bQNLuME7fmlA8BzTcFUnVjPlsHrbi6I
	4MAvew7WjK4aPwZfmb6UxMxKC32toayslzybYA1P48c9HZHk1gjBndKiwUJMk/RS18tNOqvYvUsDr
	pkX1E1citfFjZa2vfqulSkbYOwK+AHaoYs+opTw+ANdao/NW5rXQ6a1X0F9J0Ttar3B9ECdYbB04e
	H5oBJqNbyXN3Wje0NFDhGoovXeQgHq+pLZOYOviRqmLt0NkRh+Zl0Na0mCC8/tr65HDZPcQOtTzSF
	4vMiOTVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDhUe-0000000EzSn-0mxZ;
	Wed, 20 Nov 2024 09:59:28 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDhP6-0000000EyFI-2Rzt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 09:53:46 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4316a44d1bbso44940115e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Nov 2024 01:53:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thaumatec-com.20230601.gappssmtp.com; s=20230601; t=1732096423; x=1732701223; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oJLDnW4xgZ8CURNC2nEQvItuWPLm2zclX2H1mWV132I=;
        b=SofOeImDMVBIVZTJq3Mc0sjBgGiF/+ZiPJJTCIIIXv3mCYWMeq75b3IwV2ZdXaEiBN
         mjYT13m/BGph0RhyRUyMzS1l/eNfoS9XAj+vxZDdVvWgaQn9WCjhWzN95BllXNKHZteZ
         b9u2jxrjS6ehGiXOleuGSZrAuH4Ic+rLIS29ywugTJJ7kBoRN/L7hMrkxANctglrBvVw
         Lqj3vBk5p7gd76MReI0ngzVCiPl19L4kZOUI6Z0W9c6Jbh6z87niVDQxD4yK99zGWAsI
         iZMyT49ngSzv9HRFeiBYBisxnYvf+q3hpfqybtNjQkYSwoBwtKrwNeFuDhzPZ6qZKtzb
         et/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732096423; x=1732701223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oJLDnW4xgZ8CURNC2nEQvItuWPLm2zclX2H1mWV132I=;
        b=oeHOYYQxu9MB82AODDXWXpBCXPqmBfASNDCZP95n+Qp+XQ2yUsNNsJtd/WW7ASqArG
         24TL6cFtxixN5dnOu2mkhNbNIkisgEYfcoA/8EarJQJnwXUxXXYVnbi0t0R9R3pfiq5x
         lUTM2VA8DenxbFfD2LpTwyDWB1vfI4VzwhxL0vR6bgSXWxcBzI/AQY60yYkgPXMRUpgi
         0049r+FolKpdeOcntch7XRmQHC+Qgyr2vPZEFvGr6hKISG/m/FLqw9WSe1bEAy0yqNA5
         rcGsdpaFrAqN4XCa9beSpGLJBdshaHt+tNlll4f+yrY4btSPCO0LRBT+dPh1XfgZrOZJ
         ArCw==
X-Forwarded-Encrypted: i=1; AJvYcCVzodOYncls/RMt0AKoeU9urhRGbtRgeG6PSmojriDyBzq9hlFjf1nLO+8DUkCWBlTdWzerPo+excPZZuX/n1L6@lists.infradead.org
X-Gm-Message-State: AOJu0YzwGeAufUbZRFvKY3zoFLD2vV0NjO6OjbizFWZbnCIVNC4ynUcB
	FL97mole1sb6W01JcYNjT5nwCbM1QpeA6uatfu0fPk4O0JkEqwizMZNey46m3hQ=
X-Google-Smtp-Source: AGHT+IFGYjEIekWosK3N1x9ZAj53wDHPjVwwCvrEQHprGAlHK6CAfM14PoWKCxOAsPnnpRIJDBdzbg==
X-Received: by 2002:a05:600c:1d83:b0:431:5bf2:2d4 with SMTP id 5b1f17b1804b1-4334f02c7c6mr16575515e9.29.1732096422784;
        Wed, 20 Nov 2024 01:53:42 -0800 (PST)
Received: from fedora.. ([91.90.172.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-433b45d4288sm13108335e9.23.2024.11.20.01.53.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 01:53:42 -0800 (PST)
From: Daniel Semkowicz <dse@thaumatec.com>
To: heiko@sntech.de
Cc: Laurent.pinchart@ideasonboard.com,
	andrzej.hajda@intel.com,
	andy.yan@rock-chips.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	jernej.skrabec@gmail.com,
	jonas@kwiboo.se,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	neil.armstrong@linaro.org,
	quentin.schulz@cherry.de,
	rfoss@kernel.org,
	robh@kernel.org,
	tzimmermann@suse.de,
	Daniel Semkowicz <dse@thaumatec.com>
Subject: Re: [PATCH 0/3] drm/rockchip: Add driver for the new DSI2 controller
Date: Wed, 20 Nov 2024 10:52:58 +0100
Message-ID: <20241120095326.9854-1-dse@thaumatec.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241106123304.422854-1-heiko@sntech.de>
References: <20241106123304.422854-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_015344_629217_770C4EDD 
X-CRM114-Status: GOOD (  18.32  )
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

Hello Heiko,

> This series adds a bridge and glue driver for the DSI2 controller found
> in the rk3588 soc from Rockchip, that is based on a Synopsis IP block.
> 
> As the manual states:
> The Display Serial Interface 2 (DSI-2) is part of a group of communication
> protocols defined by the MIPI Alliance. The MIPI DSI-2 Host Controller is
> a digital core that implements all protocol functions defined in the
> MIPI DSI-2 Specification.
> 
> 
> While the driver structure is very similar to the previous DSI controller,
> the programming model of the core is quite different, with a completely
> new register set.
> 
> Another notable difference is that the phy interface is variable now too
> in its width and some other settings.
> 
> 
> Heiko Stuebner (3):
>   drm/bridge/synopsys: Add MIPI DSI2 host controller bridge
>   dt-bindings: display: rockchip: Add schema for RK3588 DW DSI2
>     controller
>   drm/rockchip: Add MIPI DSI2 glue driver for RK3588
> 
>  .../rockchip/rockchip,rk3588-mipi-dsi2.yaml   |  119 ++
>  drivers/gpu/drm/bridge/synopsys/Kconfig       |    6 +
>  drivers/gpu/drm/bridge/synopsys/Makefile      |    1 +
>  .../gpu/drm/bridge/synopsys/dw-mipi-dsi2.c    | 1034 +++++++++++++++++
>  drivers/gpu/drm/rockchip/Kconfig              |   10 +
>  drivers/gpu/drm/rockchip/Makefile             |    1 +
>  .../gpu/drm/rockchip/dw-mipi-dsi2-rockchip.c  |  524 +++++++++
>  drivers/gpu/drm/rockchip/rockchip_drm_drv.c   |    2 +
>  drivers/gpu/drm/rockchip/rockchip_drm_drv.h   |    1 +
>  include/drm/bridge/dw_mipi_dsi2.h             |   94 ++
>  10 files changed, 1792 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip,rk3588-mipi-dsi2.yaml
>  create mode 100644 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c
>  create mode 100644 drivers/gpu/drm/rockchip/dw-mipi-dsi2-rockchip.c
>  create mode 100644 include/drm/bridge/dw_mipi_dsi2.h
> 
> -- 
> 2.45.2

Thank you for this work!

Sucessfuly tested this series with DSI/LVDS bridge.

Test configuration was described in the thread "[PATCH v3 0/2] MIPI DSI
phy for rk3588":
https://lore.kernel.org/all/20241120093702.9018-1-dse@thaumatec.com/

Tested-by: Daniel Semkowicz <dse@thaumatec.com>

Kind regards
Daniel


