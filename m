Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BF87C55174
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Aug 2026 09:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LIUa/GkOS3aZrfCEcRahKBXxy/BEVRSMrpiAVM66nfw=; b=xoRw65B/4FuegxKdSSbG/A11RW
	eLMT1fUrH6HbHfWDGMEpIT4/Uoothp1O5IjK0iq31jUT0uwJCzBJViouQWDq3JXyY9S4xCJmIo3Ca
	P0TsSPtuCLGm1MpevBmKaQvBPYG1Hg+VIQ+1/BGFs+OU07TbKEzft+zsDzsx2KoUJHRaWYEipcDLd
	OCJnaoFwMysQIEj1nnuBMWALlggqd1RP2anbDp4k6yKUQi8DWuPoxVhII4yVqhs7rKraOUHQjGdvz
	3TYS/GYwjykiciRyrHNTFuQQ7XvRaapRJvW0P3Z5/584A59cq9rnJ2fydJq0mtauEinHmptEOtTdd
	0+k9WRmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsdZF-00000009EMo-2s5e;
	Sat, 08 Aug 2026 09:42:13 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsdZC-00000009EM1-3rUO
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Aug 2026 09:42:11 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-47f5d5dbf80so22667f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Aug 2026 02:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786182128; x=1786786928; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LIUa/GkOS3aZrfCEcRahKBXxy/BEVRSMrpiAVM66nfw=;
        b=X9/l27VmUA4KU7xtaojnDnvHVuOftZghl/esmD+i431BWX7h5QsqnqhrNFCkI5VacM
         Qferte3XhyAdW1qbKFYgBLQ/m13/SFts9EZ19rOGXh+70FD4d91dezyaEduMDupmsPdY
         uJPYYKcGoeQGAoW/iVuT/TkSp+oV1cMkl6fKQogoIfobAfwTkumJgFirTkTue/eJfm3x
         NaRmv9oLSadaPEkSnmSKB6RQVFzm3L6frZXytUA1xop3ctwZfL6PscUfiCyz6683E3mb
         PMrMP6DCFtrexJLMHFHm73o7SOkE07QraoSqZSh+B0AbekVwDILTArlqdmLIjUYn+JWZ
         SBBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786182128; x=1786786928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LIUa/GkOS3aZrfCEcRahKBXxy/BEVRSMrpiAVM66nfw=;
        b=oGGfGescChgsxaqEcQBhDNBfl0smm1nlUpU5LS1zHI7M7fNj/3rtpHsANAbItWis8U
         du4TqcMpUTi1fo/X/w9WBVaKreC2Y4qJbCFnC4fSyTaM38PLSChAKrWrc6A8X1sPcgsN
         tWGMoX5ayS6K8T721QQHXVjDHcJ2u66aBPPIghkm0Q3kvWPUy7FbLEzG+73iUEhFdoyc
         f6XEjCbOTqEftr3CKL2t11qAxx4P0iXnXX0J+ly5U+FPQR61uQ/xhTHRaBgcvyZudpnL
         NB+Qo54S/FVuRGRB0ASP0d7WsJ6R/JiA41GTlwb6iDVOWbPPDgSPGdgEhJEwVZAOiyY6
         KgDw==
X-Forwarded-Encrypted: i=1; AHgh+Rqh5cl3nkqiiPkTw5d8Fa30hFESyIBKo6nkwxrpqvBz3MQIOi53pUujvWEHfTlJgUFSMuSocDI3qlf/sBIUgKfU@lists.infradead.org
X-Gm-Message-State: AOJu0YxNgfoWBcVBzm7QZNFUHH9CjoG2A5psw9P4LdCRPVTalutah8iB
	ek3WLj/5VnVuTKfLzgROBTzc8FXgcS1j+xqr1BCdfSXXE/3OlyGqSBUe
X-Gm-Gg: AR+sD13wPuxOlvsszVMnWDrQNYD3ptiUjrz+iQmnqkNMhQTjlywc/2hGJqwKf0/dhLd
	BN/yDc89KVGCDSzzaRCc2BnFRnr2xz8Q1tZJOdjsgstHkh0sEQvqwJDewMxGsorVcI6iY8fou2T
	PZmrlYjqiMgNGrD8QFGQ3v0SAucxDD6q89DnA+PToiDDRWynUSZCesYKNM9Sxv1vppzjMsiUUvI
	+XbEmo0FG8we5G6A58bzryT9bzh/HfsU04Mugo2cKzt2dnn2Kii6aFiN+kiW4QvbZT7actXR4Yk
	c4KvNDVFuNFXIpG9/mQUwURMXvnDFevtx3VFoSMTqmOlemFj+eOjFt8p0OtnZ6g4Yyfjy5fXLQM
	+Hjcg+lqDcaTslEmjbCjc6z7h/RLwgPEVy+4rg6eNO7rUg/NVFid9EKOQBIIoyCyuNYVgRp6NLw
	raI1aNFCTwurTSAss4TSBdvUp9uJnyBu+lWVKwMgKP2sgFJxR5f4TGexRiA9bpf3coCYeSSaUh4
	StU8sJoRDrTNyC24ivDDeCXf+7X2a35z9dnxhb+sshxn+87D6LKa/l1mUiYlt5QGfy3Rw==
X-Received: by 2002:a05:6000:1785:b0:47f:91f0:9ab with SMTP id ffacd0b85a97d-47fec484f36mr22974430f8f.0.1786182128200;
        Sat, 08 Aug 2026 02:42:08 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B8E20009911270F4BEC2300.dsl.pool.telekom.hu. [2001:4c4e:1b8e:2000:9911:270f:4bec:2300])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021f9182sm13826171f8f.28.2026.08.08.02.42.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 02:42:07 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Igor Paunovic <royalnet026@gmail.com>,
	Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Damon Ding <damon.ding@rock-chips.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Alexey Charkov <alchark@flipper.net>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	kernel@collabora.com,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v11 00/21] Synopsys DisplayPort Controller improvements for Rockchip platforms
Date: Sat,  8 Aug 2026 11:41:32 +0200
Message-ID: <20260808094138.7205-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260806-synopsys-dw-dp-improvements-v11-0-0d508505f383@collabora.com>
References: <20260806-synopsys-dw-dp-improvements-v11-0-0d508505f383@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260808_024210_978249_9EBD98F2 
X-CRM114-Status: GOOD (  18.19  )
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

Hi Sebastian,

The Tested-by tag is at the bottom.  Short version: v11 works here on
an Orange Pi 5 Plus over USB-C DP AltMode.  It needs your usbdp v13
series underneath to probe at all, and above 2560x1440@144 it needs a
VOP2 ACLK change that has nothing to do with your patches.

One caveat first, so that the next paragraph is not misread: dp0 is
disabled in the mainline RK3588 DTS, so none of this is reachable on
an untouched tree.  I enable it with a local board DT patch.

With dp0 enabled but without usbdp v13, dw-dp never finishes probing.
It stops at "failed to get follow-up bridge" (dw-dp.c), because
mainline phy-rockchip-usbdp has no drm_aux_bridge_register() at all;
that call arrives with usbdp v13 patch 16/35 ("phy: rockchip: usbdp:
Register DP aux bridge").  The component bind then never completes, so
both HDMI outputs stay dark as well - the symptom is much wider than
the cause, which cost me a boot to work out.

Hardware: Samsung Odyssey G70B behind a USB-C to HDMI 2.1 protocol
converter.  DPCD extended revision 1.4, the link trains at HBR2 x4,
VSC SDP colorimetry is supported.  The converter ships a malformed
EDID, so a boot script feeds a corrected one through the debugfs
edid_override and kicks fusb302 once; without that the 4K modes are
dropped and AUX stays dead.  Both are adapter problems, not driver
ones.

What I saw:

  - DP-1 comes up connected, the EDID reads through the converter,
    the link trains, and KWin drives the output.
  - At the stock VOP2 ACLK rate, modes up to 2560x1440@144 are clean.
    I left the machine at 2560x1440@143.99 for more than eight hours
    with no DRM or VOP2 errors.
  - 3840x2160@120 comes up, but the picture is unusable until the
    VOP2 ACLK is raised.  With it raised the picture is correct
    immediately.

That last point is a platform issue rather than a dw-dp one, so I have
sent it as its own thread to dri-devel and linux-rockchip with you on
Cc: "drm/rockchip: vop2: ACLK_VOP pinned at 500 MHz starves DP 4K120
on RK3588".

Two small things I noticed while I was in there:

Kconfig: ROCKCHIP_DW_DP selects nothing, and DRM_DW_DP does not select
DRM_BRIDGE_CONNECTOR either, while ROCKCHIP_ANALOGIX_DP,
ROCKCHIP_CDN_DP, ROCKCHIP_DW_HDMI_QP, ROCKCHIP_LVDS and ROCKCHIP_RGB
all do.  Since dw_dp-rockchip.c calls drm_bridge_connector_init(), a
configuration with only ROCKCHIP_DW_DP enabled fails to link.  This
predates your series; I am happy to send the one-liner if you agree it
is worth fixing.

sound-dai-cells: the dt-bindings patch in this series ("dt-bindings:
display: rockchip: dw-dp: Fix sound DAI cells") notes that the
mainline rk3588 DTS still sets 0 and will be fixed up separately.  Is
that DTS patch already queued somewhere?  I would rather not duplicate
it.

DP audio: it does work here, but on my rockchip-devel based daily
kernel, which carries the v9 generation of the audio patch - a
simple-audio-card with cpu &spdif_tx2 and codec <&dp0 1>, picked up by
PipeWire unaided, playing over the same cable as the video.  I have
not retested audio on the v11 tree, so the tag below covers video
only.

Tested on drm-misc-next of 2026-08-07 (dc2f9f7fed1a) with this series,
usbdp v13, two local board DT patches (enable DP AltMode on the USB-C
connector; pin DCLK_VOP2 to V0PLL), and a one-line local change to
clk.c so that I could set clock rates from debugfs.

Thanks for the series.

Tested-by: Igor Paunovic <royalnet026@gmail.com>

