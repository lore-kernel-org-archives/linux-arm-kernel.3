Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8B72CA5FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 16:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3jbM+/xCOFHz2ekpLk2drdaMa28onD9DLLAyaB1dHZ0=; b=Aw3hNZon64u8c+S7NHeB5Zqx1s
	l8I/m+ysFKNfV+sl72tjlwLgop0iygRRhoMoSk4HqFa+aKiO/s6ul3SPgq+0pzYN1R/gWwzht1kz7
	Lvjml/oumaPyDUCxHR77YwYH8LdQ1ZSe9UjxAYUVoTwAS/HGuots9Z9Azk8h8HrozFCp61LrAWBgO
	+JTfo00q5PdOyiM4SQPkqP71QFc94wzEGar1QTYDfe9MeI98IIo7FAGm+W8GuabmnHT4fD7qq5iEN
	iY8fmiSjhAv68BStnNPcir9dITvbpXfkK+BD6w7eIrGU4Z6SI/Ju+NdRN/+lNmKrY/4o7TSo7SoSD
	9OUtr0rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJIy-00000009dof-2YrK;
	Thu, 01 Oct 2026 16:06:45 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJIu-00000009dkv-2UzD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 16:06:42 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49fff6f0f87so37100025e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 09:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790870799; x=1791475599; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3jbM+/xCOFHz2ekpLk2drdaMa28onD9DLLAyaB1dHZ0=;
        b=GNRakb8mHeOST1JSJZoVgol6fdOAkYL83NBwclOef7AmPb+0RpfK+8bXbltGpHx0rs
         Mo24P/klaq3SDzSZ8V3bFI9MZmllKBUdeu/joHvRcEi0G3T4D/N+5LJjw6hqlFlN1f9l
         UH/qe/RbeK3Hy1xsg6oflGIYPQHI+yYo1kvq2VZupcgsHi5LuNBp348FsIx7DeVqNPBO
         HpgoWuibqZA038xOPap3pVbylGYQ/ATu0WQk5g/r/wXZbUa6LSJkv+MhSPCghADje1WN
         1Njej8ie9ukXd2LxAGwxyZd+0m3hQAYytXHNR0QRmQ5RjTGH3ngyX4MNnHMbHN1bgpha
         dHdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790870799; x=1791475599;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3jbM+/xCOFHz2ekpLk2drdaMa28onD9DLLAyaB1dHZ0=;
        b=sPPPJ1SxNK5KbMp51pI8gMEQiQdBtcTcKd4MHq74wubHeC4/1yR9R3PAW3zXVtmsG/
         cQwcdjY7On4b09RTkOGnj4c8u4Rbrw9HjXltHZ+5KAVJ8qpbZq2WpyYfjmBvK2sNqriF
         jDq4wWug15iOWzC1rC0a2s07qc6z7QGrOQWAxabUmlVttDORPc2LkfSszbCBqDbEILfk
         hkrwJLJpSelKDXfNiDDr+j4rCScLlV7sOQZgH1sEFP5+cbj+NHMeoNMdDubDqzbp2CnM
         FHOU/PGIlH+yqS/OYczEjWYEUToUH6RyVO/8QqVzDy16UCKLRYAy7VgpV4fz44+iaM39
         1OzA==
X-Forwarded-Encrypted: i=1; AKwUvBzqVNi0QtjFg30lKWtH/D+stGDscOBRo70Rlg4p30xbwMcvmMqoifCah/CFDDscx4ecgIlqOYtNlllT0tyu47u4@lists.infradead.org
X-Gm-Message-State: AFuF++njYHvci2kYJHL8V3DpYPoXswxm5rj8u1mJWxlzgmhaCtkd1hhS
	LKIEfHfws2XlH3Ez3AWFsiiEyLT05URMOVTQ3It3unrAMffdMMx6KUKKBCQZOiyJGfcwjTARcxB
	3HK1YBn0=
X-Gm-Gg: AYBFou1rqs8pQDAvUtOkK+fHuMbGVWrxOaorStRMnwS2JloweA//1dcFqcj14qviW2f
	kVFlIxjwhIphkGHCCSKIxcFVMtghuXkDuK2MkCPha0nC3wW7++l7KLQWSLn1KAu22LTOJHzWuoj
	bnxM+ub/6tVXYsARdUUwqThR88e2mVbn3ICtXoKi9nOFZfC7g0fITYdbs7IsSChNlEGOOueHRm1
	aAQjvBRvY24cEVRWJ7/RGP/ro7V/WAFMShA345v1j/ZyJpjJAR8Hfm20g6UiLx/eWRwiPuYPhQJ
	s7YA+E5sHMtkAGL1vK1D5E8JtcrrtSayfTOlDqZHeJtoGlz0TUAXDwCfC/KrCoOdGh+jrDWFz5F
	IHTtB/gg36SMei5BeHKPATdBCatlvPE3po7zpXVnn1By5bXjGdWIKGIAy4xbv++BK7eZsVhwA3Z
	lUN96IC1tK93OBvX+T1T34Gvhjox9T+d0FZcJjTDHgjg9EVHNUyWNKEBCraWZUzDUF
X-Received: by 2002:a05:600c:19cb:b0:49e:69ff:c6b1 with SMTP id 5b1f17b1804b1-4a0276a312fmr1303425e9.31.1790870799033;
        Thu, 01 Oct 2026 09:06:39 -0700 (PDT)
Received: from [127.0.1.1] ([151.42.82.6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f93ad0bsm52969705e9.4.2026.10.01.09.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 09:06:38 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Thu, 01 Oct 2026 18:06:27 +0200
Subject: [PATCH v4 2/7] ASoC: meson: build gx-formatter as a separate
 module
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-audin-v4-2-2476646118b5@baylibre.com>
References: <20261001-audin-v4-0-2476646118b5@baylibre.com>
In-Reply-To: <20261001-audin-v4-0-2476646118b5@baylibre.com>
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
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFn7WrkUTqy4z3Vl0Q8e+9PveYtTTF9lnd4flmZ3N1Mg+
 KPFrNaVHaUsDGJcDLJiiiws0+/9LihVe2iccLIAZg4rE8gQBi5OAZjITVGGfzpNLgy3Jrp8Xbu4
 SGvmtN92qybPreZpDftuLXrS2fr5L3VGhm8e+WIVchvPN+/es+Pe0euZGhfly/fbFky+VBp/0qk
 jkxkA
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_090640_664030_C3D6ADC1 
X-CRM114-Status: GOOD (  11.43  )
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


