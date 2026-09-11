Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57B4AC88E53
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 22:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=srhabopEjDrPGbNiaixTBBq3q3UYUb7b5seSM2Uisn8=; b=3rTxnpxj7Zo6Qt
	tm/nYrNvDfwAlnuNr+HlvngA3h5ubglb7M6JvJtiI5aWJbBrWsyMhAw8pr8E+VROP7nC+I3t0OQvE
	v2Yk0eMNbjdfHzwn6vBx6haGByHObXZchHPUzjbpQvf4iM6Nd3G/E488qgBRpKX8EU2mmsgVwKvKN
	qACua7XACFB8NiWKiZxBJqbUWMjEdfBfIN63dukkDE2r4rsS6EEmDXjmijM4cumLee+utSBZKSM5P
	KZZvOqUSLnR58Rylv5cIBOy+b3JqPEy/iQ+NwNaooXJGQWQ5GUjUAGL63CfXo/EtMxrhoFbsUQlif
	o8PCtyyB3tfQRzgYtPCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x59We-00000000FEF-1UU6;
	Fri, 11 Sep 2026 22:15:16 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x59Wb-00000000FBx-2DZa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 22:15:15 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49e65b1cc29so4513185e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 15:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789164911; x=1789769711; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=srhabopEjDrPGbNiaixTBBq3q3UYUb7b5seSM2Uisn8=;
        b=HAWIMcGrAUb+covAW6bygnX9li1krdshYcGyoEHrtNwHWTyv3n9nBz0rsYRIqIOizM
         drNSpL1AXjNwvsaIYOuEyj+BjOULwgT3MBmIGrQ1NRgxoyl0eRzlK6vMdIb3lOkvk+bj
         DObSKARgfBAceMqUtiJ1bvVeKdgp1y4xa9qhNLoMDb0F33XF3feZDEq5pp/F1qSDRi9y
         +9ZZc2d+W50f+AAvmy2cK52mQIZl+1/Lxrgu1LTEeJXjU1kbhHsB2PBYmzl7fKzPdci4
         rOlTInpxUUlYIl93sHUmnzzJjVOsA8B+fpKjsVXhPp8Ac2M7N5NUbIjlp3Rf/c3jTUu+
         Bt+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789164911; x=1789769711;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=srhabopEjDrPGbNiaixTBBq3q3UYUb7b5seSM2Uisn8=;
        b=WH8kYc6UEAYxXyNSmSsXO7uS6KXZmTNDR6rR3VGH4eC185YIrDSuahi9vpjf1pvyF6
         SCT6Q4kZ8eAbvAFJNHDBUQS7rODjVdb07DJOCsXYKJqcVJ5BRnH5imLLdYd0Oxxrn7wG
         x4CIJstVuJ1Yy6nCLtKz+zakAn9CKxdr8ZZPa7Ec4KZudqiJHsC+j03gVkY7MHLeoMVq
         YeQ/uGBYNftKsqGpXFaCpNbWNIBigN5riY0piGX5carJXM4dgTTjWF6MJRLn0qkKR0qL
         cF5BNvH1UqXH3V8o/qBokX0+63hiIEK5Y8Vb0blkX5CwAYaBUF9ti/7kHJZui2Y6Iy40
         E/Bg==
X-Forwarded-Encrypted: i=1; AKwUvByqimvLn6DZOA5uDrro0+l4IvBS9VV2oaWn+0QOcb0jJUBVcf8mYMr7eQu3soYgsIWSgAXsm0Yx2RxkrtvmEALj@lists.infradead.org
X-Gm-Message-State: AFuF++k8ARsW0weouVBzYn5umxCz3AD4pQwxewcH+wUsCG5rkk6VL7lj
	WUja0CyfkP5oZChwXGP7bpQStbr6qTc13S1wXL2CNfVgGOF/2pxNnLaj/yEw0ezdOhA=
X-Gm-Gg: AYBFou3Yf84R1ItIkBGyJNj4Xb1ruaJln5nkP+JhWTbwtFhekSFDGMA+XU/lB2Kq4CU
	bG1mhDx+rdmq7inRvaS3h5M+1EadkcvPQpLGpSsVPwoeXHXGq95Hyid1/lLDaPFefqqkGXqOS9e
	WbJDwMipwhINpGbV3+bfNQUEAxQOZ1/FwFcfReO4sQhwnKwR4Cy/IHbbesoyKt1nnuLlk52szqy
	BmrG4DtDi6wi+SgoREMOJ6eaeIe9BS+xcfVN1ZQs/4GbJPp8B+34FFnlxn1AluL3AUMWwIvFzXx
	qmqY+tOlRrG3RnUqLp/vkz7qFRG8owcROEV6IP6g09SfEAGLeQKzwNPUZYlXlmWqguu5bTFFtXo
	Z5ktwXZzPNpOr/DPUSOXkEHJFefphF5di6ptwlpwiiFEaYdLqbm7J8Rxz6KiPpU0s+7UYJbqdcm
	I/TuXZiBDYjcIJHJBnRPvn54G41klCDkHw4m+25LaRps/koQI/hNLvOySBNgtY8ybNU22r2CdUm
	CoY
X-Received: by 2002:a05:600c:3513:b0:493:f140:c3fb with SMTP id 5b1f17b1804b1-49e619c0357mr123658065e9.7.1789164911027;
        Fri, 11 Sep 2026 15:15:11 -0700 (PDT)
Received: from [127.0.1.1] ([151.42.87.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c2a419sm202882745e9.7.2026.09.11.15.15.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 15:15:10 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Subject: [PATCH 0/6] ASoC: meson: gx: add base support for I2S audio input
Date: Sat, 12 Sep 2026 00:14:30 +0200
Message-Id: <20260912-audin-v1-0-7fbefe928711@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEZ9pGoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDC2ND3cTSlMw8XcvkxKQkE1OD5GRLEyWg2oKi1LTMCrA50bEQfnFpUlZ
 qcglIs1JtLQAVIgntaQAAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3226; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=PWDc5RQ3INoxq0fo7alWh++0I6W5IGuIRf0MFpXSV8s=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFlLanOaRdZMWiury/nzTfOTv99ijh7ZIG6rNWFa9b6ZK
 3/UeT+M6ChlYRDjYpAVU2RhmX7vd0Gp2kPjhJMFMHNYmUCGMHBxCsBEAo8x/A/Z9ERcTLvnivwC
 h9+mV8XKT96fcuzu+WOqXI3LGX5Jh01m+J9+cd8XMRsXcV1mrd9NDN5LohSW15geuMURO3uHM5d
 TDjcA
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_151513_603796_14BAC77C 
X-CRM114-Status: GOOD (  16.21  )
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

The biggest change from the RFC concerns the I2S data formatter. Previously
it was a DT node owning a single register, which was deemed an invalid
binding. There is now a single audin node owning the whole audio input
register range; it instantiates the widget for the I2S data formatter,
following the solution already used by AIU, and then probes its DT child
nodes implementing the FIFOs. This lets the three FIFO instances share
one driver.

Resulting capture topology is:
  pads --> AIU I2S Encoder -> AUDIN I2S Formatter -> AUDIN FIFO -> RAM

This series includes all the changes related to this work (dt-bindings,
drivers and device-tree) in order to give the full picture in one single
place.

Unfortunately, since no Meson GXBB/GXL board available in the tree feature
an I2S capture capable codec, this work cannot be directly tested out of
the box. To test it an external codec must be connected to the SoC.
When working on this series, a custom hat board with an NXP SGTL5000 codec
has been plugged on top of an Odroid-C2 (GXBB). The last commit of this
series fully details all the device-tree changes which are required to
finalize the support for this scenario.
With this hardware configuration it has been possible to succeffully
validate the implementation with:
- alsa tools (arecord)
- pcm-tests

[1]: https://lore.kernel.org/linux-sound/20260411-audin-rfc-v2-0-4c8a6ec5fcab@baylibre.com/
[2]: https://lore.kernel.org/linux-sound/20260610-reshape-aiu-as-axg-v2-0-cac3663a8b51@baylibre.com/

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
Valerio Setti (6):
      dt-bindings: sound: amlogic: add schemas for audin components
      ASoC: meson: add audin main module and I2S formatter
      ASoC: meson: add audin FIFO driver
      ASoC: meson: aiu: add I2S Capture DAI
      ASoC: meson: gx-card: add support for audin FIFO
      arm64: dts: amlogic: gx: add nodes for audin and its FIFOs

 .../sound/amlogic,meson-gx-audin-fifo.yaml         |  52 +++
 .../bindings/sound/amlogic,meson-gx-audin.yaml     |  96 +++++
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi          |  35 ++
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi        |  22 +
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi         |  22 +
 sound/soc/meson/Kconfig                            |  14 +
 sound/soc/meson/Makefile                           |   5 +
 sound/soc/meson/aiu.c                              |   7 +
 sound/soc/meson/audin-fifo.c                       | 466 +++++++++++++++++++++
 sound/soc/meson/audin-formatter-i2s.c              | 174 ++++++++
 sound/soc/meson/audin.c                            | 109 +++++
 sound/soc/meson/audin.h                            |  14 +
 sound/soc/meson/gx-card.c                          |  16 +-
 13 files changed, 1025 insertions(+), 7 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260831-audin-9cabb450cc94

Best regards,
--  
Valerio Setti <vsetti@baylibre.com>


