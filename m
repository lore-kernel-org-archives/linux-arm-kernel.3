Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8033AC88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 21:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=097ql+3Z1IlDXg0ya0fn2DItRG2p3HsUzNgnRrCaa70=; b=vIdIrpZSK77qRq
	m0bNBbRDYuYHWpQQ2D12F8iQTc/RQNaLj+VRSmzyxSPrDllP/W+ZtdY4K8eUSIC7gGOn3NGQ21QVJ
	qKiglL3w0Ciwm3yIcFYfZK6p6sxePLn+Djzu0Q3p3mt4nEQXK8WR1ad6ewPMLPpjhhO+fGeQYAjBw
	V5eEwVjvfGHyZQyFV+lwXXvtULMfy8GFFlp9/IzOcFuWbQ8/L0JUodYL8ok0Ehg1ekeig1Mc4PJs1
	eh9yVWJ6SQ6gf/Pq2zuDE3WuBJi98v6jXVsMcL16HPIP+VLJmOBXS9zb12P1uyIvc5abPCmzPklkZ
	pUHABCys52YMgKHL7O5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7JFl-0000000CW52-1jaT;
	Thu, 17 Sep 2026 21:02:45 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7JFh-0000000CW3i-3jW4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 21:02:44 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49e66390995so379585e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 14:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789678959; x=1790283759; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=097ql+3Z1IlDXg0ya0fn2DItRG2p3HsUzNgnRrCaa70=;
        b=bZ6t1aD0ZO4Oea2pdXAQlC44fRtmi9zvJv2avxm7bccDIYJeJ8R7ydmivvZO795wKE
         NWx/3zhLoVaYfEZiIEn60ZRSXfHc3R5ORPo81vZkbn531PmS72saQVWODE9j/La7No1e
         BSwOZ8Gctsr39NlptaeWp62+87uLm5Xg8ttRZ3PdT1NeJ0bG1Rfu4JOOYuzqobPTW94Q
         Dm1OBYclAI13FYtfwdbowp2xeATqll9UUarCAr0mI2R/ZYSr5kvjLssnnPdklH/61RHx
         HZXYv0KjSIgm0ZCMMHQx9LPBIAJ3n3ZBhbMYI2X0OI5BgdLmVwkoy2iEvLAFNIEwnzXh
         HEgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789678959; x=1790283759;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=097ql+3Z1IlDXg0ya0fn2DItRG2p3HsUzNgnRrCaa70=;
        b=FnHic+QWYrCN57D6tvUZRh/+Vw8u6Ugm9olrsTBkjGYTknF/lHMNghsgN21XRwmDUC
         CDR2nxgh8xvBEqyvsAxpxKIQ9awNOSHtNbeWplppN2jlnN5w/jwqnJtKgdCTud9lcCTz
         HD2xULYfoRoizp/AVYM8uXHxyTSpaJuLHwgSKNIXN2G/OQV3tqj2D7d73UlP16jJ4sFe
         9J8QvesP6wo3dWUc4M2Pea3WKH9Le4jI0gPh34PvGLIJiPGw7xz1TRhEpulTCXn+vzOB
         IFWnMRRxalzN3ZGhl54oUmM1xRE98aELOVQCN7ewpx6bhs9qpbGaDT5p/kkGAUiZC7AT
         CZ4w==
X-Forwarded-Encrypted: i=1; AKwUvBya8EXrJ8haAMxTMeffMpz4qH70xtFuqF1mFQfquGEGa1Bpv26gV/6Vg89weWWTrz9W320HDuSYFAr8GD6pPmAp@lists.infradead.org
X-Gm-Message-State: AFuF++ktGWmw/Oo4IYMk/xbkTrKSQjRrX7zoBXZmDURVSmhpbcIwnFas
	4Q6GGc1vefKOq/Z9rxl6Od+vj2wwFgQmJbKI/ipUo0wyTLvRh33HclRXeV6JkthreME=
X-Gm-Gg: AYBFou1kwymW+Fo10M0hm4ZlwOkX+aFVDRbcwWTMRcsq6GBe9pPT76oY2yYNfyoaEwS
	bVpe7JtGUzOKIenrpruq8fyacTIEx/BCzRNNtGwWxoz6VdPuIyeRdFWBQzV0fuX6+7FnvF+pNR8
	HEIkpUbFugtA18sFK1ZwwW6SETFnBoztg5QmHEA2C6gZBeSYsOhAv1QmGUuJhyMv3Rg7RlvL3RA
	cGS+v/fvHYpVz3QesxPPwu0x72V0QmOQDWxQcRxIMI4KY2N6VEBew/KfZTzHJ6JGsHHJxHqyoBk
	ssMOlw8t/AZPn5jwin3yCKHjGroue/J7wBJojd+Hl3NXwvm+m02VM7XysgR4n3ijcwqzLZ2rmqw
	7IQDWnhgvvZaIcmc/omxUpZLQ2H/BPXuEtHodyOn2Y1hB7+/wN1AhzIeqeT0ldF36z2h9IZ7I8J
	y98x0dWl/I5tw9WucvRDDtPSpu7S4mRgGRUv/58/UwiW7ZjQF499UCVAttzh3X0VWUdaKtZ60zy
	EhR
X-Received: by 2002:a05:600c:1993:b0:49c:ffe3:2b3f with SMTP id 5b1f17b1804b1-49fc56dbc54mr1780725e9.3.1789678959379;
        Thu, 17 Sep 2026 14:02:39 -0700 (PDT)
Received: from [127.0.1.1] ([151.42.87.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc5755c40sm3106095e9.3.2026.09.17.14.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 14:02:39 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Subject: [PATCH v2 0/6] ASoC: meson: gx: add base support for I2S audio
 input
Date: Thu, 17 Sep 2026 23:02:30 +0200
Message-Id: <20260917-audin-v2-0-38de4bc1de34@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGZVrGoC/y2NwQ6CMBAFf4Xs2Zq2olBP/ofh0JZF1mgxLRAJ6
 b/bgsdJ5s1bIaAnDHAtVvA4U6DBJZCHAmyv3QMZtYlBcnnh9UkwPbXkmLLamPLMrVUlJPfjsaP
 v1rk3O4fJPNGOeZyNnsI4+GU7mkX29qYS8t+cBeOs6gx2qGRdCXEzenmR8Xi0wxuaGOMP4jULB
 K8AAAA=
X-Change-ID: 20260831-audin-9cabb450cc94
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4682; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=yo+5pijNTMwmqWFlMlY2nS+EN4AqIMiUf/48r8SNlyU=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFlrQnO93i26K/tHIHTLnPNu+qUWR+Py14V5n1Jn7zgvX
 HCY/eSLjlIWBjEuBlkxRRaW6fd+F5SqPTROOFkAM4eVCWQIAxenAEzk1gGG/95XDHp/tlSdjlm6
 sIgl3la1lON2543739bvSNN8WGqm94Lhf6icUaf6z3uvcphl5todU+qw6XPJCrtx6wpf0F2/Dbv
 k2QE=
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_140241_983821_BF9A5DAF 
X-CRM114-Status: GOOD (  19.21  )
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

This series is the 2nd part of the initial RFC [1] proposed to add audio
input support to the Meson GX SoCs. After the AIU reshaping series [2] that
has recently been merged, this one adds the audio input path itself.

Apart from some glue commits for gx-formatter Kconfig split, DT, bindings
and integration with gx-card, the core commit is the 3rd one, which adds
the AUDIN driver.
This is the counterpart of AIU for capture: it gets the entire register
range, it handles peripheral clock and reset, it instantiates the I2S data
formatter as widget and FIFOs as DAIs.

Resulting capture topology is:
  pads --> AIU I2S Encoder -> AUDIN I2S Formatter -> AUDIN FIFO -> RAM

This series includes all the changes related to this work (dt-bindings,
drivers and device-tree) in order to give the full picture in one single
place.

Unfortunately, since no Meson GXBB/GXL board available in the tree features
an I2S capture capable codec, this work cannot be directly tested out of
the box. To test it an external codec must be connected to the SoC.
When working on this series, a custom hat board with an NXP SGTL5000 codec
has been plugged on top of an Odroid-C2 (GXBB). The last commit of this
series fully details all the device-tree changes which are required to
finalize the support for this scenario.
With this hardware configuration it has been possible to successfully
validate the implementation with:
- alsa tools (arecord)
- pcm-tests

[1]: https://lore.kernel.org/linux-sound/20260411-audin-rfc-v2-0-4c8a6ec5fcab@baylibre.com/
[2]: https://lore.kernel.org/linux-sound/20260610-reshape-aiu-as-axg-v2-0-cac3663a8b51@baylibre.com/

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
Changes in v2:
- Dropped FIFO child nodes from AUDIN in device-tree. Now AUDIN is the
  only sound component and FIFOs are its DAIs. This is the same design
  used in AIU. [Krzysztof]
- Renamed driver compatible, using 'amlogic,gx-audin' as fallback and
  'amlogic,gx[bb|l]-audin' as SoC specific. Fixed also other reported
  comments on the binding. [Krzysztof]
- Adjusted headers inclusion in 'audin.c' and spacing in the empty entry
  of 'meson_gx_audin_of_match'. [Uwe]
- Replaced 'snd_soc_component_read' with 'regmap_read' in 'audin_fifo_pos'
  in order to prevent sleeping in atomic context. Also changed the hrtimer
  from hard-irq to a soft-irq one. [Sashiko]
- Added 'sync_stop' callback in 'audin_component' to ensure the hrtimer is
  fully stopped before attempting to restart the stream in a
  "start->stop->prepare->start" scenario.
- Link to v1: https://patch.msgid.link/20260912-audin-v1-0-7fbefe928711@baylibre.com

To: Jerome Brunet <jbrunet@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>
To: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Valerio Setti <vsetti@baylibre.com>
To: Jaroslav Kysela <perex@perex.cz>
To: Takashi Iwai <tiwai@suse.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-sound@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-amlogic@lists.infradead.org

---
Valerio Setti (6):
      ASoC: dt-bindings: amlogic,gx-audin: add schema
      ASoC: meson: build gx-formatter as a separate module
      ASoC: meson: add AUDIN driver
      ASoC: meson: aiu: add I2S Capture DAI
      ASoC: meson: gx-card: add support for audin FIFO
      arm64: dts: amlogic: gx: add AUDIN node

 .../bindings/sound/amlogic,gx-audin.yaml           |  66 ++++
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi          |   9 +
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi        |   6 +
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi         |   6 +
 sound/soc/meson/Kconfig                            |  14 +
 sound/soc/meson/Makefile                           |   7 +-
 sound/soc/meson/aiu.c                              |   7 +
 sound/soc/meson/audin-fifo.c                       | 367 +++++++++++++++++++++
 sound/soc/meson/audin-formatter-i2s.c              | 174 ++++++++++
 sound/soc/meson/audin.c                            | 186 +++++++++++
 sound/soc/meson/audin.h                            |  30 ++
 sound/soc/meson/gx-card.c                          |  16 +-
 12 files changed, 880 insertions(+), 8 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260831-audin-9cabb450cc94

Best regards,
--  
Valerio Setti <vsetti@baylibre.com>


