Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C195C9830B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 16:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=t+p/SUcWdkdCr+nTJjwTsUWB3w3VIv0PTBSmR+PYPBA=; b=aBg/yNCFbVdrue
	7G8vMOO3eCYcjVkv6QyDaAMrUm8zwbOoLKPkJHlM86D0mUpMYfElXKnq6TMETWAcm39VOGbYBy4dg
	5Oz55T93CA1qRfQg+d8hTXvbthDY/e7y5H60sSdnl/3spnyj0eZ4LJH1sD2BNcBnvOrwZ29wYTbzM
	LhBpC/1+zEJ9j1wsaFQDYgYmzGFGI1zEvtYxQp4BDXcYMF2TvuHJ6ayV39nVgItZrxxjN/TuOyBtu
	slOGc5VmRT903nEd4b8r8NFxj2aQQ1uawMKFRCZPklZjTCOz7nQFXL/KqFaV4vdHtEaI7ouuWddZD
	eNJueyUy17xT3KvN4BHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x92wM-00000005ydT-39l6;
	Tue, 22 Sep 2026 16:01:54 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x92w2-00000005yUW-2uhc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 16:01:37 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49cd38e0e5dso61758195e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 09:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790092892; x=1790697692; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=t+p/SUcWdkdCr+nTJjwTsUWB3w3VIv0PTBSmR+PYPBA=;
        b=W1xxwU2wncsfDw5WvmICbMubuoX0vCZtf9le9vdHIhdYRgTlCorYvcXpnxkjs8OdTI
         jWNxOy1tVJ4ePouUUEL7uBJmYY9BptSPCrMLytL7EYMm5iCNooYnPSOcuXDC2hpQru1a
         GqCklTCLr4kUfE1BT9BIEPBMJ1pzF5ya/n6RKqjQyvpLS11kQr4+ppDy7m5KSMi8q281
         wuxHglH1piKj6vdTeFlJUYjwqDHaCx3IM9qG7e2FmfuHOIN66aHT+5srdxHoKGOAP00I
         GMfoYBhO7qt7Xaul0/mH20FLOXFO1aDgLpwUO/QtKZcwh23u2uE/Fu0mP8VjDZT4l3al
         zaSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790092892; x=1790697692;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=t+p/SUcWdkdCr+nTJjwTsUWB3w3VIv0PTBSmR+PYPBA=;
        b=uHhBlcZXDEIuWEcYR1Qeuffd0h1/UUfmvL4G7ydmfsKbendl9ZfUyqgUkjVdYxyVH3
         eoYPXCZkMcQjQ3z1l6V7PMMenL04+1utQioeKfZEe8y+0lS4OWcS6GCPk09dr29JgFZk
         UA8MooMrItnwzUR5Rrv3AzPIAo1C7yRBBtPa4ZhFaldOZakRMsuWuEZ46FEEkFhMM2xK
         TOQ6FmTRGGLE5dp8B7dTX5I95pBV7fU7DuQPO0vCePBZMRqT0kMRJV6Y9WVlFVFmo5sa
         xJr/ejxFiKAt3PeWsIVHPc67oBHuz9AlqLB3dEJXXhPOUiWJ1TwifFu477kuQaErewWz
         Ri6Q==
X-Forwarded-Encrypted: i=1; AKwUvByZgmOaGS0ZWw9qGz08QwH+yuCba3qAyjHu3/TckwdcdJOthbP0EtcdSB5UEhGBtXAeI6/ERvXMgYGISVN8AT3V@lists.infradead.org
X-Gm-Message-State: AFuF++no/jvpCby3mewqAou+0XtlmpEA4eypbbRgz8q+xpMAXvw3GtxW
	Im9gFFwXgz7hCN7f+R7UdekS+Nz5g5gUpuKGZGg+wbeiAmFX+V7WlX6+KzcrNURc801ATYA33o/
	lNdqh1NCytQ==
X-Gm-Gg: AYBFou1Xy0EC96QYc6wg/+bzp2mDjFtozUFwnxcKd1th9QS847PcHG9bjZyQTCC4Wli
	CGaa6GVRpWMU7yDKnEHAE+a2d8Y9clpUn04ZgNXcn4a/iSm/7yYJjBYrbYx+nXDYoOsQQZhzkDp
	uIwwd1uyBxeKEF9EEuDq8FQueo2UoYhCaJgV9HclwAvBz1P5s6xycdC3OVTa9buyinwp1KuNEPb
	VD/KSnlvQpzfecJk7EJOOV9WJ3kU28SsDewzh9fHj9zkqfxEPEx0cVkzXRxPSduj9PD4zqFM4tO
	m9C8Q/04WzBU6kM+ZcWfa5KLa4RCqjzo1haVRBGDxKxTIgANXhHeSvSjb6gqqknVCJWxuo0++qt
	uJ5lcL07sntECtPqxy+ldQNyhsTpm9r25yuxDhdClXbdDmUuUzFIWQ++4cPy9GhelXEN74Bc5Eo
	Ge0jWKId1tRL9z+3NvrD6TO17KZx7kat6vx4PpSKHdDnPM1Yuqs3/V0l4AgE3R1JODCA==
X-Received: by 2002:a05:600c:46c5:b0:493:f140:c3fb with SMTP id 5b1f17b1804b1-49fc566e635mr200087305e9.7.1790092892009;
        Tue, 22 Sep 2026 09:01:32 -0700 (PDT)
Received: from [127.0.1.1] ([151.42.87.32])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48862786dc2sm6118020f8f.25.2026.09.22.09.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 09:01:31 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Subject: [PATCH v3 0/7] ASoC: meson: gx: add base support for I2S audio
 input
Date: Tue, 22 Sep 2026 18:00:45 +0200
Message-Id: <20260922-audin-v3-0-a760312c076c@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC2msmoC/12Nyw6CMBQFf8V0bU1fCrjyP4yLPi5yjYJpoZEQ/
 t0WNDEuJzkzZyIBPEIgx81EPEQM2LUJ5HZDbKPbK1B0iYlg4sBKyakeHLa0stoYtWfWVoqk7dN
 Dja+lc76sHAZzA9tnOS8aDH3nx+Uo8rxbmxUXn2bklNGiNlBDJcqC85PR4x2Nh53tHiRno/gVi
 68okihLB8pY7kCqP3Ge5zfgu7el6AAAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5272; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=XzmF4J3qkuosZ/gMZETPgqXgKdShUdzjl28XPraIrmU=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFmbloWGXumYF6Siv0A8etvdfGeZbf524n3M16WkV9Q7J
 6gm3fzWUcrCIMbFICumyMIy/d7vglK1h8YJJwtg5rAygQxh4OIUgIm8PcXIMG334pDvBeoXWp6l
 f7mgf3/e1a2vWE14e9/fSe3qqGSdIc7wV9ZHhZ0/zdDOd1Fdas+WS592HXPnm+68SiJqVt0u6XP
 dfAA=
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_090134_769686_274B106B 
X-CRM114-Status: GOOD (  21.28  )
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

Apart from some glue commits for gx-formatter Kconfig split, a fix for i2s
clock divider disabling in aiu-encoder-i2s, DT, bindings and integration
with gx-card, the core commit is the 4th one, which adds the AUDIN driver.
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
Changes in v3:
- Fixed i2s clock divider disabling in 'aiu-encoder-i2s' 'hw_free'.
  [Sashiko]
- Specified const value of "#sound-dai-cells" property in dt-binding.
  [Sashiko]
- Advance 'last_pos' by whole periods in the FIFO polling timer to avoid
  drifting period notifications. [Sashiko]
- Link to v2: https://patch.msgid.link/20260917-audin-v2-0-38de4bc1de34@baylibre.com

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
Valerio Setti (7):
      ASoC: dt-bindings: amlogic,gx-audin: add schema
      ASoC: meson: build gx-formatter as a separate module
      ASoC: meson: aiu-encoder-i2s: ensure clk divider gets disabled in hw_free
      ASoC: meson: add AUDIN driver
      ASoC: meson: aiu: add I2S Capture DAI
      ASoC: meson: gx-card: add support for audin FIFO
      arm64: dts: amlogic: gx: add AUDIN node

 .../bindings/sound/amlogic,gx-audin.yaml           |  69 ++++
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi          |   9 +
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi        |   6 +
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi         |   6 +
 sound/soc/meson/Kconfig                            |  14 +
 sound/soc/meson/Makefile                           |   7 +-
 sound/soc/meson/aiu-encoder-i2s.c                  |  12 +-
 sound/soc/meson/aiu.c                              |   7 +
 sound/soc/meson/audin-fifo.c                       | 371 +++++++++++++++++++++
 sound/soc/meson/audin-formatter-i2s.c              | 174 ++++++++++
 sound/soc/meson/audin.c                            | 188 +++++++++++
 sound/soc/meson/audin.h                            |  30 ++
 sound/soc/meson/gx-card.c                          |  16 +-
 13 files changed, 894 insertions(+), 15 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260831-audin-9cabb450cc94

Best regards,
--  
Valerio Setti <vsetti@baylibre.com>


