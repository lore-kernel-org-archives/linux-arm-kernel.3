Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E428AC98308
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 16:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3jbM+/xCOFHz2ekpLk2drdaMa28onD9DLLAyaB1dHZ0=; b=vZaNhem8K23ymA2t6TF3RHXyyo
	qo60ZrXWRcc4IfQGD/sgS9Ks9p/x4UEGhYZ5jcbr50HfTOtKT39hgvtlszbVBk+86CdLGXMPNrkLy
	Dfl6DdEiMDpe5lEL4vZBsg2RnGCFcR/Szt9OHl82wKRPTLGDB4pLQqi25GvSnOXM+rCFvMGWlKda+
	RQy8tXDNSL+DsZExCQLwyqenuZowX38rH3+KcMvHlu+SY4O2ms1D+zU0xKOraIZGT+8c7FIQIctOz
	9x0CrkCKuEIDub0lSYGtzFJXd0k8HdxRgysXkDOzMKE4IflMiN46TZpZ/neYalvLdaoTkfNjlnBvl
	uPd9ROhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x92wN-00000005yeV-1Gjm;
	Tue, 22 Sep 2026 16:01:55 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x92w3-00000005yUo-3oO3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 16:01:38 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-4843c2790ccso85954f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 09:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790092894; x=1790697694; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3jbM+/xCOFHz2ekpLk2drdaMa28onD9DLLAyaB1dHZ0=;
        b=kR1/4N0DGlOcFTSF1gKyADLLONWFPJT5E3DIePEMKHAz6OZlu6Qbi+9V7DgAlMSSQo
         O8UQ1H2ZMISvRwQpzt9QTVnuZ1Gl0ESIMdOQw0g9aHfAI+4JqLEr5QAYgMR9lYUk9wnj
         4fZ/6Wx5kF6nSxzxNvx+7VuXJiUgsMCOLoXcXKbcs/cjW7cqTBxvgt5ivIg01SLH4xkF
         UK4HwXJXNfOsPkmEzSGOr4VObWA5Y3gSdIMWNdyp41N59F6Np65LxVSRTR1Gd/UQcPXm
         h87PuUQaeM3s/4SMqFLZzYHVWp78otdpq3mCDVeW7hWKuBYuPp9gdgT4+Uya2NOOlYgj
         IJ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790092894; x=1790697694;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3jbM+/xCOFHz2ekpLk2drdaMa28onD9DLLAyaB1dHZ0=;
        b=FEZHApMXj1NFoUeLDzgwbY+1FioldZjOI9QOs9xksPct7ms2UxdQamFZ87O06/5QHV
         kyUv1j/tKTM8TPUwXowzMcRnwVBQ4B7jQIXY+ApH3RrnTWCzfBVSR96oUlgf0wTsLDx6
         igFzzTe8i/sTC8YobiwnrdnLw1B+bH8vXs13Uis0FGpRQxRD41cYniuL6IzNFZCWCxfj
         LQkUuyP7A3tdL18KQfW9hS6Dqegn5sGJOGzK+y4GbowLua3ZLhDFa9p4gfoucZAfQvmg
         Cq4l4haGs3EcsXnkkXErWik766dswJY0n8yzUdQd/dgwQyXoOeQApA2vna0Wtl5NjDkC
         lrPw==
X-Forwarded-Encrypted: i=1; AKwUvBxudOaBXTmZdwt8fnaHSBi3IZoFXA/CbRmHJgkWneCyXZBFfHC3de4uAGz8u42LBkK5aIxtyZoOMEUPGIBFsSF9@lists.infradead.org
X-Gm-Message-State: AFuF++ki1FsjwJMGB0qNgpUgVgOwewBzfg2ctFE7+5WAKMqfjk17Tx5v
	4UirdLArD3DZ8zDjyUaUW6ffs77xp4QB2kMYi5hgs9TlXYl2yZ3YZ/G4xi23EiZfw5TIBGejLMK
	d8mhj7vcsNg==
X-Gm-Gg: AYBFou1+Dm0e5CZdHFB6kgX/AjHVxVx2WYySqVw5a8qpvHuFOQ9Qzrvs5FMKhIZVQgz
	tvs63DXbSZManRFeyOcmAyuVVXLzzZt+5OjFlEUUI7+YS3JWHOo/kCcuuXkkLkAOT/Zzet3U1KR
	2A1NqPG6VMI0c8NJfo/skTAqrBmVk/+GUj4DOj+3mZYocXQ8+s4j6F3ssgTKpTgoaRRigYUQ8XN
	LfwJ/WqvGlCLL+I/+/BytL6BJlSn88m3hGiY3VFTETX+xe4jx7sYVj5qO1fAguBKIofgPsIBskP
	H4Mt+bWnZJSGbNVL7TeAA35HcNRNef8DhJt5fx8cXTjGf/Qi2eZiUcUxq60UKNUpvJe8a7bUWpe
	GU+6pkHgmKsDNsInKNvrPCxV0KyCsI+/S7mTHUQT/ECD2ri8pMI9QUWv7650F7XejbjNYXyJAup
	NsC/GYA970cozkP3phEqJPsXgXODNZk9U4kq4UfaBJKdp/hYFgxEjWIxZkU2gQ0z+dfw==
X-Received: by 2002:a5d:64e8:0:b0:487:40a:5ba8 with SMTP id ffacd0b85a97d-4886704c06dmr106703f8f.15.1790092893762;
        Tue, 22 Sep 2026 09:01:33 -0700 (PDT)
Received: from [127.0.1.1] ([151.42.87.32])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48862786dc2sm6118020f8f.25.2026.09.22.09.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 09:01:33 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Tue, 22 Sep 2026 18:00:47 +0200
Subject: [PATCH v3 2/7] ASoC: meson: build gx-formatter as a separate
 module
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-audin-v3-2-a760312c076c@baylibre.com>
References: <20260922-audin-v3-0-a760312c076c@baylibre.com>
In-Reply-To: <20260922-audin-v3-0-a760312c076c@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Valerio Setti <vsetti@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2113; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=QQUrE+DwZ1KWpqLSQpoA8URn9azrBBw3jC33CI+5l4Q=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFmblkXNVTA3EJ5w5MTt/YvSv399+NWkRVpNtr1IsiIit
 nLNRN4pHaUsDGJcDLJiiiws0+/9LihVe2iccLIAZg4rE8gQBi5OAZhIUCzDf/+Ebz4WizZvNz/g
 d3y1Orf2Uy8bxc47Lg4GVSLnmz9oGDAyXJrMeTWn/N2ZoKyQWY+/RTXLn40+avp9zo2YTT7bTta
 9YgMA
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_090136_036334_9491889D 
X-CRM114-Status: GOOD (  11.95  )
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

Instead of including it in 'snd-soc-meson-aiu', create a separate module
for it. This way it can be independently selected by either AIU or the
(upcoming) AUDIN.

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 sound/soc/meson/Kconfig  | 5 +++++
 sound/soc/meson/Makefile | 3 ++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/soc/meson/Kconfig b/sound/soc/meson/Kconfig
index d9a730994a2a..4c40bf60dc4e 100644
--- a/sound/soc/meson/Kconfig
+++ b/sound/soc/meson/Kconfig
@@ -2,10 +2,15 @@
 menu "Amlogic"
 	depends on ARCH_MESON || (COMPILE_TEST && COMMON_CLK)
 
+config SND_MESON_GX_FORMATTER
+	tristate
+	select REGMAP_MMIO
+
 config SND_MESON_AIU
 	tristate "Amlogic AIU"
 	select SND_MESON_CODEC_GLUE
 	select SND_PCM_IEC958
+	select SND_MESON_GX_FORMATTER
 	imply SND_SOC_MESON_T9015
 	imply SND_SOC_HDMI_CODEC if DRM_MESON_DW_HDMI
 	help
diff --git a/sound/soc/meson/Makefile b/sound/soc/meson/Makefile
index f9ec0ebb01f0..1b1fbe8a0458 100644
--- a/sound/soc/meson/Makefile
+++ b/sound/soc/meson/Makefile
@@ -4,12 +4,12 @@ snd-soc-meson-aiu-y := aiu.o
 snd-soc-meson-aiu-y += aiu-acodec-ctrl.o
 snd-soc-meson-aiu-y += aiu-codec-ctrl.o
 snd-soc-meson-aiu-y += aiu-encoder-i2s.o
-snd-soc-meson-aiu-y += gx-formatter.o
 snd-soc-meson-aiu-y += aiu-formatter-i2s.o
 snd-soc-meson-aiu-y += aiu-encoder-spdif.o
 snd-soc-meson-aiu-y += aiu-fifo.o
 snd-soc-meson-aiu-y += aiu-fifo-i2s.o
 snd-soc-meson-aiu-y += aiu-fifo-spdif.o
+snd-soc-meson-gx-formatter-y := gx-formatter.o
 snd-soc-meson-axg-fifo-y := axg-fifo.o
 snd-soc-meson-axg-frddr-y := axg-frddr.o
 snd-soc-meson-axg-toddr-y := axg-toddr.o
@@ -29,6 +29,7 @@ snd-soc-meson-g12a-tohdmitx-y := g12a-tohdmitx.o
 snd-soc-meson-t9015-y := t9015.o
 
 obj-$(CONFIG_SND_MESON_AIU) += snd-soc-meson-aiu.o
+obj-$(CONFIG_SND_MESON_GX_FORMATTER) += snd-soc-meson-gx-formatter.o
 obj-$(CONFIG_SND_MESON_AXG_FIFO) += snd-soc-meson-axg-fifo.o
 obj-$(CONFIG_SND_MESON_AXG_FRDDR) += snd-soc-meson-axg-frddr.o
 obj-$(CONFIG_SND_MESON_AXG_TODDR) += snd-soc-meson-axg-toddr.o

-- 
2.47.3


