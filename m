Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5065EC61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 15:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P9gX6/N+hUOidEKEDGQo/G6sZJ3cDNUMsczJpk9kQyc=; b=QH1DBDMruE790X/Wd/TH0MgA5c
	oLQfpLBhnXy4OPAIj0Zcr7Rnq7LkEpwZCt+AUnDX7i0fJHXstSC7iUiUufpdWHQwUp6J9nMak0i4H
	qHNOTxKzhLfN+X8XX9ekR2VpN5vTnqAbm8vn487Y2EbMp3AGkbeBsTi4gw7RZrXXgaC+36EPhxywf
	8VCdvo4oMxosAV0VlmZx4nYTAw71j/8rHf+fASbTKYTy5ZFWdiqDU6o7dK0COLaumRbHT8A6JRgRn
	CPbXoWQimIJYXansycjGGha6/MEUnhgVfmYo2fcFhntOC5DgK8CQpxS7ZYXHUp8pGfNXxzcb2agGE
	blyRmpbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1mte-0000000F59v-11w4;
	Wed, 02 Sep 2026 15:29:06 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1mtc-0000000F58d-12nm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 15:29:05 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4994d41ceb9so900085e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 08:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788362942; x=1788967742; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P9gX6/N+hUOidEKEDGQo/G6sZJ3cDNUMsczJpk9kQyc=;
        b=beZqx4I1+LCB6L7xSjsKtxSN8Ztn4MiSnJ8uTYuCZnhbdG/NGObRH/Eyf9JW9JXHge
         SDd0PAFIqC/WM+3/VXmEPuPQQxLmH7mQy+XEnn5B6+LH99oyUOVnmEZkUceG0MQqWJRU
         TJb66y071ex+uam1X1XegHxq+D/PLcjK+wA9rRibU4xPCaUb4e/qsIS2KFWcdQ0b5vKA
         3i/Qk4a6wo/TK/boXhAW6Z9oJgcqY5VQ4rNECOUazzDeDX3cHT/5KiBaEmO3ExzZ5FmH
         6ar2GFy1bztyfD7YXWXfBvvJJ2ji01eZ3olY/yfWR5JD1ZVyY34jBAyfHvO32xbf2et8
         hBpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788362942; x=1788967742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P9gX6/N+hUOidEKEDGQo/G6sZJ3cDNUMsczJpk9kQyc=;
        b=AoyVFwlCaxgnaKVRAA7qy32/F1bmCOKuqPyIMx5NXXY76ShfOoaKUlrBdxIqH6xb3F
         v2h/I9aDcM5w6Kgr3gZBlbN3lyYgEEb3r+E46/C83qnGRHD9R8CVa0t81Nsxod9A6cfa
         +qNkxg/x9ig/HBrQNomDxTl4MlI/giMb1qyX6d66y2C/663Gd7NSdMQJWMrDnPV+ax7f
         Ymw/iJavTpMOOTiLtxbCKKzMrZHOSBWc6qpmXodHfGKssrtfJgHwSh2FDWiu3+8XCxog
         I7+4Cz5uwkkncBltksUNkkmEzdgPmIRfxjWwuMp6BFLR+3QrCnLY0zJMxzg0FfS9ZhH6
         J1TQ==
X-Forwarded-Encrypted: i=1; AHgh+RpekETBI/NI2gzCDoWdGJbRjVlgkUMgztajCq8nEv+ArjnlLvlJKCles9wRtLFZdPiZfEhijFbTBLk7D5mP0YBk@lists.infradead.org
X-Gm-Message-State: AFuF++mBjVu+5tsHt7J/pMFZyL7uFbje/BKFXziodJfZPnFgS81lx26w
	xKtAO9djClW0MNxA5pCS0v9f/MDZb1S96XURkOvYj8wRRmcabFrIqNxn
X-Gm-Gg: AR+sD11DDyQZoKSYhrZu4MuJKt+vEg/xD7PQoiOvSeCcvuqXgCFcN5OFqWY5TcMlP8u
	eBkaOS0qpnhpxsmRkg+orD0aY3hIpQ99tccS+7p2z+TCMqt7yui4lDh652DtXkkgYyLbIO7RZq4
	3eHDM8Lrwjyan75WfhDWBagPbHxLt4uyM/D8sg8owSK2pkgX3FZJYJnZ4raZE81QXJGmmRC9vqi
	GwdnbI22SK6dfLaeBIY0lQVzgxAxNANaQX9yEep6ZntgJvV7RNaGKA0b3drKpP9NWfOOk2RXy0n
	TX/NDxURNhPIy4rkNf43FOWTkSWIer17Co9j/jSu88/zZ8bd2Fbvdev4xdnKUinV7Blu2jMB7JT
	194EdCBQfV1Gxpq3TGhRsud3NYVaTFVcHQx0DKCElRliYVIVXKn2Fip2W8hZL/CNFhoozDcB0bb
	tntyH6JwAuBVJkJC9qk/Q3z5lby7zBXOgUZLZ9c6AfRaE+KXF8yykDnxjOObYiue0jeehOs6o3I
	kbPypfqumBaxXh3z4pJUV+gV/b57mvsr2Z/5vQda3jazbLYw9Of2XZZdCaETRnpk5Ql1ifgXeSE
	o8SQ
X-Received: by 2002:a05:600c:c48e:b0:499:d95a:41f with SMTP id 5b1f17b1804b1-49ce558d5cbmr47256105e9.0.1788362942067;
        Wed, 02 Sep 2026 08:29:02 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B831700D60D5CCF7970D839.dsl.pool.telekom.hu. [2001:4c4e:1b83:1700:d60d:5ccf:7970:d839])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce4775005sm91395395e9.10.2026.09.02.08.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 08:29:01 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Igor Paunovic <royalnet026@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	mcanal@igalia.com,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Raphael Gallais-Pou <rgallaispou@gmail.com>,
	Sandy Huang <hjc@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Algea Cao <algea.cao@rock-chips.com>,
	Daniel Stone <daniels@collabora.com>,
	Liu Ying <victor.liu@nxp.com>,
	Phong LE <ple@baylibre.com>,
	Helge Deller <deller@gmx.de>,
	kernel@collabora.com,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Maud Spierings <maud_spierings@hotmail.com>,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v11 00/74] Add HDMI 2.0 support to DW HDMI QP TX
Date: Wed,  2 Sep 2026 17:28:35 +0200
Message-ID: <20260902152838.5771-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260901-dw-hdmi-qp-scramb-v11-0-bc12954a0688@collabora.com>
References: <20260901-dw-hdmi-qp-scramb-v11-0-bc12954a0688@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_082904_306863_D8A4B0AD 
X-CRM114-Status: GOOD (  13.07  )
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

Hi Cristian,

> This has been tested on the following boards:

One more, with a sink pair your boards cannot cover:

Tested-by: Igor Paunovic <royalnet026@gmail.com> # RK3588 Orange Pi 5 Plus, dual HDMI

Setup: whole v11 on its stated base (drm-misc-next 47b823940e38),
both SoC HDMI ports driven at once: a Samsung with HF-VSDB (max
TMDS character rate 600 MHz, SCDC present) and a Sony limited to
300 MHz TMDS.

1) HDMI 2.0 path: the Samsung now offers and runs 3840x2160@60 RGB
   with a 594 MHz pixel clock (modetest-confirmed). Without the
   series the same port tops out at 4K@30. A stable picture at
   594 MHz is only possible with scrambling and the 1/40 TMDS ratio
   active; it stayed stable across boot, mode changes and hotplug.

2) Non-2.0 fallback: the Sony keeps its 297 MHz 4K@30 modes.
   No regression.

3) The result I care most about: this Sony in standby keeps EDID/5V
   up but drops the link, and on my 7.2 stack that generates a
   storm of detect/modeset cycles - measured 119-194 per hour,
   enough to make the desktop stutter. On v11, twenty minutes of
   standby produced ZERO events, and wake restored both sinks by
   itself. Whatever share of that the cached-status detect and the
   SCDC-loss handling each take - thank you.

4) Hotplug on both ports: clean detach and reattach, no storms.

5) Audio on a dead link: this morning my 7.2 stack took an SError
   panic (regmap read in dw_hdmi_qp_bridge_clear_audio_infoframe
   when a PCM was closed on a link whose SCDC never came up - full
   UART trace available if useful). On v11 I could not reproduce
   the class: six open/close cycles against the standby sink plus
   one natural prepare-failure-then-close during replug all
   survived cleanly. Caveat: different base kernels, so this is
   not a clean A/B on the series alone.

Scope: RGB output only (the YUV420 output series is separate), no
USB-C DP on this base, VC4 side not exercised.

Igor

