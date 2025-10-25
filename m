Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA957CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Oct 2025 16:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pQlnwek1lWpij8LeOBWh+sxDT7KmBEOhz8ZE1R1F1kI=; b=z2Sc1X6LAhRnEpyGlohJItUTdW
	xfDYKBjouL+Z0KhtFoCj1kc1elzC+WmD9RmTaf5k0YOzGY2pejTD/B4s2d7qbJQN+gskpnEPhwblR
	f2NrNWlF3Qp57WzbiQAHYuTqpa7XSsHiZllIYMtiEm8qfWXrtoRa7SxZfxws4V6UCoWfDzSefFz9d
	QGvRQUI3eogcVSI8vJnslNc3tTiApm8ju/QcrwvLxCFpAoYWTLiqbaa3o911PYcIl0RMs3ge27NXT
	CQlUqG4FdoxpjhMAHowf6eJXPeg8ARSF4ZXWxuxBPiYxEPEEEKhG0ylLAXjyLruog8TgI4ytiUnqN
	WTbjC96A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vChK6-0000000BYRV-3IbX;
	Sat, 25 Oct 2025 16:40:58 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vChK1-0000000BYO9-1PjP
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Oct 2025 16:40:54 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-87eed34f767so30569376d6.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Oct 2025 09:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761410452; x=1762015252; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pQlnwek1lWpij8LeOBWh+sxDT7KmBEOhz8ZE1R1F1kI=;
        b=nLF5JTDPXR5PuCbUUlt0kMa8Niazl3cTn/fd0oXZQjFe7b6FbK+kOzomGZDb2ZwMBH
         s470RuuoAtcPFbEzrINgFYPzHSGBgy9OjLgwbECiGggxv+S6l1Ssx+JMXFrEJIWzZsgK
         xa5JkR+dP4TzgFsCtt/4705zYKCAjxNQ/4/gfSt7Ye6G9daP4vQCrUXnxvwk5jCfGj4d
         RGadkxyxpq2m3/baLgI+3bKnzmn2i5ErTy1gKJc9XlLvqxGdHxLwaIvVTXKQpM7oc9jg
         x06OySIMP5EwrKmZcy42OxJhjTDrW9N0DjZPpZWD+ayVSobnXXgB0jdErrw6tXubqv+d
         Om2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761410452; x=1762015252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pQlnwek1lWpij8LeOBWh+sxDT7KmBEOhz8ZE1R1F1kI=;
        b=V+qEDRDhDKDZTR143/8XXaudT3t2PIDns3P12k+ounQIMiDHBcXpcNAygyOBqOZpNz
         qsLHjLDul/+zhaNtDxhQi3ijmAKX8KB2M5haPSOoawhXGJyQUom4SdDqNW8OX/u6wyec
         PasCvhS60t8AHu5JBO8g/yX3ZoWly0/KjnZuDqo15hIjrlHEMVty3l1EVJ0cjwYZm7qK
         F6Nm1W/la5LHwV0Uy51jcPkVK6HdgmfNFCjfLI9B8rquQsX8xGRnds7Xu4vgiqjTh+Zr
         vt5LIchIPF9OMpPeNRTHfCRynrb5dx41BOz2JYcTZ9nPdD6rlyMMy0qmeMvl+8T4x7mm
         5GbA==
X-Forwarded-Encrypted: i=1; AJvYcCXx1sU+SfHs77+w5Q2S2Oo2QPAQNHemdHF/r/zYe1srknW0MGSgnv8lKaUbDRwTlrzaDSMTmQXW46OqglMsjMI+@lists.infradead.org
X-Gm-Message-State: AOJu0YxtyfOrlI2DSR7hM4FexDXkDsRuZLe5fGg4/wC9JFp/DD1iDjOK
	6SHrOE7hhy+6e8qyHgOCKgJZqTjuZ55/hOKpxVX57KEujAAChTHCs7np
X-Gm-Gg: ASbGnctR4iaI1smG3nxydEyBxGPEHNVlQiU2OngbNVCjUWwlIh/+GhAwdsj4f95icK3
	US2ONKQoK7tX0F7xD61Yzqsl8nQ06zJmXQliJtanrkW5PVMp0NVqywv561/EAeNTTpCx1CbnNKU
	h4EYhcwcSGK8tN0LGI4nM6XJFWLTXN2+IDoonyOluxZKdQpG6fzxCS7MlIQMDaugjuVsEtWyILD
	kbD6J1uX4lvdEsH6zEt2CnHdvCNkV8MJqrhblXJeVN3lZ8OAwcvgqIaU81BPdQQyU8607blo7n4
	Bb8OuZyzSZehX/K3NgOiz8DS1jKEksoNC50TRK7hjxLjabJMb+BgIC+XjEO3XmSCyqYVjlz+8DH
	kxPwW9XYcWMyhdM+gneO7hFlmJOFX+ouVYyZJvzr5e4OWTjZEEAEzq0Gtu660toT3Jf3FEG7Q+Q
	rGexZoHAY=
X-Google-Smtp-Source: AGHT+IHlyjol8Bie8F99hAjP80rz8ZMg2F2ufGY62yGvqxUFdDm1aK3+hSTgiT9hRW2DHU1QiGn1gA==
X-Received: by 2002:ad4:5aae:0:b0:787:8e43:5761 with SMTP id 6a1803df08f44-87fb6473b5fmr66116636d6.56.1761410451896;
        Sat, 25 Oct 2025 09:40:51 -0700 (PDT)
Received: from localhost ([12.22.141.131])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87fc49b98b0sm16464616d6.54.2025.10.25.09.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Oct 2025 09:40:51 -0700 (PDT)
From: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Shreeya Patel <shreeya.patel@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jaehoon Chung <jh80.chung@samsung.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	"Yury Norov (NVIDIA)" <yury.norov@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	kernel@collabora.com,
	linux-mmc@vger.kernel.org,
	linux-sound@vger.kernel.org
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: [PATCH 11/21] drivers: don't use GENMASK() in FIELD_PREP_WM16()
Date: Sat, 25 Oct 2025 12:40:10 -0400
Message-ID: <20251025164023.308884-12-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251025164023.308884-1-yury.norov@gmail.com>
References: <20251025164023.308884-1-yury.norov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251025_094053_384408_9AF19719 
X-CRM114-Status: GOOD (  14.77  )
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

Recently added FIELD_PREP_WM16() in a few places uses GENMASK. It's
confusing and may mislead readers. Switch to BITS() or FIRST_BITS()
as appropriate.

Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
Link: https://lore.kernel.org/all/CAHk-=whoOUsqPKb7OQwhQf9H_3=5sXGPJrDbfQfwLB3Bi13tcQ@mail.gmail.com/
Signed-off-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>
---
 drivers/gpu/drm/rockchip/rockchip_lvds.h             | 2 +-
 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c         | 4 ++--
 drivers/media/platform/synopsys/hdmirx/snps_hdmirx.h | 4 ++--
 drivers/mmc/host/dw_mmc-rockchip.c                   | 4 ++--
 drivers/soc/rockchip/grf.c                           | 4 ++--
 sound/soc/rockchip/rockchip_i2s_tdm.h                | 2 +-
 6 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_lvds.h b/drivers/gpu/drm/rockchip/rockchip_lvds.h
index 2d92447d819b..e79e6031be59 100644
--- a/drivers/gpu/drm/rockchip/rockchip_lvds.h
+++ b/drivers/gpu/drm/rockchip/rockchip_lvds.h
@@ -115,7 +115,7 @@
 #define   PX30_LVDS_INVERT_DCLK(val)		FIELD_PREP_WM16(BIT(5), (val))
 
 #define PX30_LVDS_GRF_PD_VO_CON1		0x438
-#define   PX30_LVDS_FORMAT(val)			FIELD_PREP_WM16(GENMASK(14, 13), (val))
+#define   PX30_LVDS_FORMAT(val)			FIELD_PREP_WM16(BITS(13, 14), (val))
 #define   PX30_LVDS_MODE_EN(val)		FIELD_PREP_WM16(BIT(12), (val))
 #define   PX30_LVDS_MSBSEL(val)			FIELD_PREP_WM16(BIT(11), (val))
 #define   PX30_LVDS_P2S_EN(val)			FIELD_PREP_WM16(BIT(6), (val))
diff --git a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
index 38c49030c7ab..438fea5f6f6d 100644
--- a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
+++ b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
@@ -1698,7 +1698,7 @@ static unsigned long rk3588_set_intf_mux(struct vop2_video_port *vp, int id, u32
 		val = rk3588_get_hdmi_pol(polflags);
 		regmap_write(vop2->vop_grf, RK3588_GRF_VOP_CON2, FIELD_PREP_WM16(BIT(1), 1));
 		regmap_write(vop2->vo1_grf, RK3588_GRF_VO1_CON0,
-			     FIELD_PREP_WM16(GENMASK(6, 5), val));
+			     FIELD_PREP_WM16(BITS(5, 6), val));
 		break;
 	case ROCKCHIP_VOP2_EP_HDMI1:
 		div &= ~RK3588_DSP_IF_EDP_HDMI1_DCLK_DIV;
@@ -1711,7 +1711,7 @@ static unsigned long rk3588_set_intf_mux(struct vop2_video_port *vp, int id, u32
 		val = rk3588_get_hdmi_pol(polflags);
 		regmap_write(vop2->vop_grf, RK3588_GRF_VOP_CON2, FIELD_PREP_WM16(BIT(4), 1));
 		regmap_write(vop2->vo1_grf, RK3588_GRF_VO1_CON0,
-			     FIELD_PREP_WM16(GENMASK(8, 7), val));
+			     FIELD_PREP_WM16(BITS(7, 8), val));
 		break;
 	case ROCKCHIP_VOP2_EP_EDP0:
 		div &= ~RK3588_DSP_IF_EDP_HDMI0_DCLK_DIV;
diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.h b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.h
index b13f58e31944..14df3f53ff8f 100644
--- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.h
+++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.h
@@ -12,8 +12,8 @@
 #include <linux/bitops.h>
 #include <linux/hw_bitfield.h>
 
-#define UPDATE(x, h, l)		FIELD_PREP(GENMASK((h), (l)), (x))
-#define HIWORD_UPDATE(v, h, l)	FIELD_PREP_WM16(GENMASK((h), (l)), (v))
+#define UPDATE(x, h, l)		FIELD_PREP(BITS((l), (h)), (x))
+#define HIWORD_UPDATE(v, h, l)	FIELD_PREP_WM16(BITS((l), (h)), (v))
 
 /* SYS_GRF */
 #define SYS_GRF_SOC_CON1			0x0304
diff --git a/drivers/mmc/host/dw_mmc-rockchip.c b/drivers/mmc/host/dw_mmc-rockchip.c
index 82dd906bb002..7fac1a7281bf 100644
--- a/drivers/mmc/host/dw_mmc-rockchip.c
+++ b/drivers/mmc/host/dw_mmc-rockchip.c
@@ -148,10 +148,10 @@ static int rockchip_mmc_set_internal_phase(struct dw_mci *host, bool sample, int
 
 	if (sample)
 		mci_writel(host, TIMING_CON1,
-			   FIELD_PREP_WM16(GENMASK(11, 1), raw_value));
+			   FIELD_PREP_WM16(BITS(1, 11), raw_value));
 	else
 		mci_writel(host, TIMING_CON0,
-			   FIELD_PREP_WM16(GENMASK(11, 1), raw_value));
+			   FIELD_PREP_WM16(BITS(1, 11), raw_value));
 
 	dev_dbg(host->dev, "set %s_phase(%d) delay_nums=%u actual_degrees=%d\n",
 		sample ? "sample" : "drv", degrees, delay_num,
diff --git a/drivers/soc/rockchip/grf.c b/drivers/soc/rockchip/grf.c
index 344870da7675..89fd4a4c69eb 100644
--- a/drivers/soc/rockchip/grf.c
+++ b/drivers/soc/rockchip/grf.c
@@ -125,8 +125,8 @@ static const struct rockchip_grf_info rk3566_pipegrf __initconst = {
 #define RK3576_SYSGRF_SOC_CON1		0x0004
 
 static const struct rockchip_grf_value rk3576_defaults_sys_grf[] __initconst = {
-	{ "i3c0 weakpull", RK3576_SYSGRF_SOC_CON1, FIELD_PREP_WM16_CONST(GENMASK(7, 6), 3) },
-	{ "i3c1 weakpull", RK3576_SYSGRF_SOC_CON1, FIELD_PREP_WM16_CONST(GENMASK(9, 8), 3) },
+	{ "i3c0 weakpull", RK3576_SYSGRF_SOC_CON1, FIELD_PREP_WM16_CONST(BITS(6, 7), 3) },
+	{ "i3c1 weakpull", RK3576_SYSGRF_SOC_CON1, FIELD_PREP_WM16_CONST(BITS(8, 9), 3) },
 };
 
 static const struct rockchip_grf_info rk3576_sysgrf __initconst = {
diff --git a/sound/soc/rockchip/rockchip_i2s_tdm.h b/sound/soc/rockchip/rockchip_i2s_tdm.h
index 0171e05ee886..eee6db372ee7 100644
--- a/sound/soc/rockchip/rockchip_i2s_tdm.h
+++ b/sound/soc/rockchip/rockchip_i2s_tdm.h
@@ -287,7 +287,7 @@ enum {
 #define I2S_TDM_RXCR	(0x0034)
 #define I2S_CLKDIV	(0x0038)
 
-#define HIWORD_UPDATE(v, h, l)	(FIELD_PREP_WM16_CONST(GENMASK((h), (l)), (v)))
+#define HIWORD_UPDATE(v, h, l)	(FIELD_PREP_WM16_CONST(BITS((l), (h)), (v)))
 
 /* PX30 GRF CONFIGS */
 #define PX30_I2S0_CLK_IN_SRC_FROM_TX		HIWORD_UPDATE(1, 13, 12)
-- 
2.43.0


