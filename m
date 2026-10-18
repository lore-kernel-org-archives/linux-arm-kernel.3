Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17094CCF2C9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 10:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i0GYKkf8XbyAZJHyQTcaoYxGjldhybLRAxAX/UufVP4=; b=MnQLvd7w+MUP93FD9xzZoKaB2v
	AIaw965FjmIt/79nrSHOIsxsvHPENgzHEH7D+hnfmI9a1DYzu0jtbsTU75XuiKsc/0lYBQMkvNICw
	Z8Tt7ZnsQvPqXYU82Pz8mv5tIA85DjjsULJdaR6/HTHzNmSYy+nSso9f3DLPNcyovv4ZWkHOtAgE+
	ge7VAGTOpoKaIxeIoIHhcWXf7XkpbTxuy0SBYSpydMmviCsrRF3XiyR1I7sA/DI+3WWh7Usvai3bh
	jaIcIVTG0u2Yv4rptG45G9H0XtoZcM4hW2c56Vvl8Xq8TPzkkfHMr42ggZDikHnEq5zDYkE4u5JKk
	itCh7hew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xINyd-00000005jlF-1aGA;
	Sun, 18 Oct 2026 10:18:51 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xINyU-00000005jf7-31zN
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Oct 2026 10:18:45 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4a1698ea378so8619245e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Oct 2026 03:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792318721; x=1792923521; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i0GYKkf8XbyAZJHyQTcaoYxGjldhybLRAxAX/UufVP4=;
        b=mxlQuUNFKbHqhuXiGUpQkYBpUTrbtw7aGVdBbVQcGzxjamgKkeCcctJC/VrPJ0bTt9
         kcYIv9PWL+CKPNL6yXNw6E6iocd9Ld8yKZbb7mVUU1kgU0uqUFQ0vjdmQai+q9Wka6mn
         KHwoIdNUKRqvSsT1uhSIi3mvHtsNxF2tVMwWQdKGjq+b84Yis8mEFzboz9av5eZbv0qE
         cL60bbo4ubh3Z6/f8vKQIb8UT44fm5wGOFFN1pqM4ZSid4+BRaXKM1p87YeFTvCPhJgF
         KDxJIRo+/bioM5NoVqlwgJaOlrldtpefmvrHsOM5QdM0PjyRq6hapjQClFyPHYzo4g34
         tixw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792318721; x=1792923521;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i0GYKkf8XbyAZJHyQTcaoYxGjldhybLRAxAX/UufVP4=;
        b=l0y1p4ny4Jxtp5UOYWfOzpQyd+WWx2Z5iEJ2Jdt1ZZVCXX3j9a7mrw3drB+Q0JWHIN
         D/g92kiDTMRqjVVnpWN7PRInsTbbsHllWAhGMV2hXSIt4XLNe0I5CpwsCe/yygIxRGyN
         Ek87RX4egJrDDzQnoh4Ks8KBDlq6JE8JfAqaiHmNZq++rC5f/AIEiDVl0pJlngmPiDFl
         +0Gbn4uU5hQNnn+dtSpwKEDoxRJPWEl5SuJLY1e7QFef0Gnbz3Tt4eQYgYd1PJak8fyL
         RC4km0tx02NIWtRFvNGLabgFLOoDisbgleUF2xwki+qBFuHtfJ12X9yEeY+AFGp40s+q
         WoMw==
X-Forwarded-Encrypted: i=1; AKwUvByjmmvwOKDRiprHHXmpJ/2QMP7vC6Q+CrMrXc3GqjTvQrg0W+xolIIOmNsYNM+iINkFk0vDYwX7FWLXqGcFktJU@lists.infradead.org
X-Gm-Message-State: AFq9FYIXt0ElKNCmZI6MADFYeR9ccuewRZ4ME4qbpEak2bECEb19oYm3
	5ETlZ/ncLluB3Zw4JpwGkYAFVc34RXEq8/bHEaPvj7DLf562QEApCbzlOF54BECYFN4=
X-Gm-Gg: AYBFou2vCa7fqh4/nfvYG9GC/By8suffJnDuDHDYYQct/iunXjMP075hBPcYaauiipB
	VsVbNgy7nUFFcMSOJN5Q3kA7IrygoeUpJbaFTcqWjEG99YaPpL/9Z1hAb3PuNv8WbR07eKKHPKb
	u6gqY9TxB/S6FtWCUrcUTD/OO2jlTjzNt7f8xaCXC5LYq8yr9tutVrc11515EbC3eYZwAa/JJOL
	etpn5lXjJlDbAQWZKyjTdvCIaQUl/Y2wwE8QiIIp4TTtQZlecWPq47lcnkXtWYXGSMONCKY0X1i
	i/E5mNMr2mZeqvQqztKhtupoVSvpZrZ59UaD0nuBQ4cTFb+T4ZE6SmC6VXd2l/zENoe758tg06d
	kUoLFBMB0Yt+Vr/HzNlT09YEkrQCfqRDKOjyY+WCndgTISzVHkcnBn4eo2bBLXlaam1geUAeEbr
	1IWfBPfraybmJLSSlXhot7z4puAEAFUcmakLh9xhkNPk2Bnf+uHAX8PiAEYNY5Na+VNp9g
X-Received: by 2002:a05:600c:3f0c:b0:4a1:e383:6811 with SMTP id 5b1f17b1804b1-4a1e3836c4amr24008775e9.29.1792318720807;
        Sun, 18 Oct 2026 03:18:40 -0700 (PDT)
Received: from [127.0.1.1] ([37.103.126.255])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4d4978sm14911507f8f.21.2026.10.18.03.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 03:18:40 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Sun, 18 Oct 2026 12:17:59 +0200
Subject: [PATCH v5 2/7] ASoC: meson: build gx-formatter as a separate
 module
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-audin-v5-2-4b8cc13a1b22@baylibre.com>
References: <20261018-audin-v5-0-4b8cc13a1b22@baylibre.com>
In-Reply-To: <20261018-audin-v5-0-4b8cc13a1b22@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2164; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=JbM2VE3IsOerKlOKNPqjWE7ND0hmDWEReikc0eKWCJU=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFlX5vxOCv+/XCiZOzFa6sPhy1KTdvuufjJLujw65Y7kr
 +MJ1zac7ihlYRDjYpAVU2RhmX7vd0Gp2kPjhJMFMHNYmUCGMHBxCsBEolsYGXrOfpw6RzL8+s31
 wr7Z3r/F/sob30oxmFfGXp+/lZ09fy7DP+sNAUZbQjKfc7hbXc00vFp7qu9MlqOoi5kvT6Q+X9E
 XBgA=
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_031842_786860_99143A9A 
X-CRM114-Status: GOOD (  11.05  )
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

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
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


