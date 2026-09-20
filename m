Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BF41C982D0
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 04:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zHfStuZ9Xz/dxvNMxRM9GTvjt+Pmq5h7RaUmSX+aOCo=; b=I9/QoqGoefZR/3
	fXWBnXEumVBOawfi+dNtzTzoSa7ulBEtiSga9yvIBLHH3ivpGi8ArHKlfaTjrDXjXhU50E/8O9CSN
	zNJjhhgSQ6qxYgO2ioVmmYbUt1jTZtsGE9x19rF13GnwwaVrqF4bXbxIID/MLOAb+S1dg2YSbWTiW
	0liNpSZNI/Dg5/cM2IGbvDsragqgbWkD7AoD8lRQ+3sMAo+fs8w7SgIj/Ln8z/GEqjFZznhKaEtZT
	Ko9VA9mIGwthN88DfS+bb1a+LTf/h254I7u99e2fUe3+dG2cb5OfY72lh4MyC2yyubRQL1xCUZBBk
	0V6l56tYNm0DYp8t3s0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x89a5-0000000Grpk-0xYn;
	Sun, 20 Sep 2026 04:55:13 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x89a2-0000000Grow-2Yp7
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 04:55:11 +0000
Received: by mail-pj2-x11.google.com with SMTP id d9443c01a7336-2d747ec6188so11899015ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Sep 2026 21:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880109; x=1790484909; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zHfStuZ9Xz/dxvNMxRM9GTvjt+Pmq5h7RaUmSX+aOCo=;
        b=ekAMZCdd27SQccOBXGOfIs4RBzgRBpu88TGY4zYBBbXiWwIXxtAYLD+Kb8fd4s+CDS
         +J3B0Dq6NmQWh9jCQoY2fjSw7U3hYdXATxxewYXGNTFfHydBLjGN3WjwR2Zc3y0SbRy7
         6CE2ZsOLU8j7z9HJOhQbkVGS7bkmG0gR2aTMUoKVbIl8gHOfRHH5Qqi/nPXAf9Bk13LX
         pbztGNT9Sg5w5Jr9zPzkcHSODXZvHqEbvOP9dNjjfyDC7dEvyvd6czw9UGhTrz9I62hf
         6hIiWw75BL/6KG4tpdLZgTJh7JScypynjwlNdZd0E6IV0i5LzXamtn7qAhNykEUT/eQN
         dJ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880109; x=1790484909;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zHfStuZ9Xz/dxvNMxRM9GTvjt+Pmq5h7RaUmSX+aOCo=;
        b=eLHVzVGT4ulHJLDDHTa6riaPdBJH8GfYq/QzdlMBQtBDONXM5g9MWuXSr2XXCJaz4Q
         diWYz/2jZF8GzZu4AfVM1+DhggL+8deECapoW2kExMz9C1xsumlZ7zvRaFlCUBVsQlzM
         NU8U9OQ1gkkqA5XU+hBYWsTG5Ad+kanv+aUvqVTL2k3SYAgPuxMk2XUKvd/pwlk4A/VH
         m8/imq9lZs+DDlN9DL8XAUhKPeqR01kdnO4Mz/pdB8wchzPbllzvqXE2/EVB2hNernjw
         Ix34C+XgHb9fiMH+gX2/td9PRkro06rS334xRM10avBEyodG4/j6/Rn90DOzX3ZMWH3I
         ztww==
X-Forwarded-Encrypted: i=1; AKwUvBwVuSim+Qg3pCObEbhQ4uXd3PbBGbskOAEx05NGQdKHcgiPBCL0G3jxab+pCtKYCJcqeHvmeTxVyIRAPmLc20iJ@lists.infradead.org
X-Gm-Message-State: AFuF++n8Y4oHwtLx5voUWAlilWELv8aDafkppUW/mNlNOSi3b6jxzmOv
	+umr62iAUZwuBxJzSpE+Cucu9ENJnKTw3ZWATBOTrID23YciV0eMeb19
X-Gm-Gg: AYBFou1M7L8yC3/lxLxddhg7G9oPWLjcvVzQ5jP5/ghxkeYjmKxt7CG3S2N6/KeK9yP
	ddCmNgHnSpWNybBVvc3QbXupqA7d9BLu9Fs+5hwUIzolnbq75bmk/CGd3aZ80t6XFUY67ut/Vrq
	nMchHlesajdaYKn6OS/lpiZg7Iw7Q3eP0ZD4AeaQEKiOaly8yRwGuIsRGS1jnSm6kJWsqDvhjUb
	Or9p0gijphP2ZXPHBX/O0gs/RDvNTtBtrVYB/+2Dw0xy6ZsDORE2RcKE3jSl4I1e0e5k6kMbfbq
	TMen47yL0gY9vO2fdnnwkzUY/bIadL82fGiLqFrqv8ntDM616P4m7rFR7nz1YDCtAOz4DWhAcup
	veJ+iDUbpjS4gefOVVy5o94By9oS9zia2r44M3bcvOwz5RyuMybw+TC70ddrnLzQjn2GDs3BKJq
	rGhsuG+4dqJIK3mezlc0if/NEfHXxFJdlqH0b7ABHEoIH9KMyuv6FTP+AJ+loumGtdPv1ZUBFF8
	gl1pYTaaxJYkWbLfym1haDilUBfCxfVSSp6JATghv1CTD0ekE0hfFyYfKdOoTGk7CI84R73z0F5
	vpaN8qDdpOcD1cca5bj0Qx3hz+J1YETzgOXRRH8nKweS6Kv0bsblqnQD0g==
X-Received: by 2002:a17:903:bcf:b0:2dd:c100:425a with SMTP id d9443c01a7336-2ddc1004524mr36709245ad.62.1789880108858;
        Sat, 19 Sep 2026 21:55:08 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d712dsm16026765ad.64.2026.09.19.21.54.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:55:08 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Subject: [PATCH 00/28] Add speaker and headset jack support for Apple
 Silicon Macs
Date: Sun, 20 Sep 2026 14:53:39 +1000
Message-Id: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDS0NT3dzE5MTSlMx8XWPjZMNkkzRjA5OURCWg8oKi1LTMCrBR0bEQfnF
 pUlZqcglIv1JtLQBCLL0xbAAAAA==
X-Change-ID: 20260915-macaudio-33c1c4f304da
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Ulf Hansson <ulfh@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, Vinod Koul <vkoul@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 James Schulman <james.schulman@cirrus.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com, 
 Takashi Iwai <tiwai@suse.de>, linux-mediatek@lists.infradead.org, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik@protonmail.com>, 
 Hector Martin <marcan@marcan.st>, Sasha Finkelstein <k@chaosmail.tech>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6822;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=CFj0wXW59irlghkyjdPh8VaRRF+k+fzH58xy0dEOiyw=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnr06V5yx5xv/43uWvHJDGm6S8k1Samr9oaOf/cZ57DC
 +f+vDCrvGMiC4MYF4OlmCLLhiYhj9lGbDf7RSr3wsxhZQIZIi3SwAAELAx8uYl5pUY6Rnqm2oZ6
 hkY6xjpGDFycAjDVaesZ/vBV8e3vZv5ismfvufyrfV/qHs47e7ivIo4jodXY6gqv0HdGhvfyKuF
 nzV4Kz+j1nHm94OL6ptkiKne/cl15LKU/zXyRAicA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_215510_671993_78073C3D 
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

Hi folks,

This series finalises support for the main
audio subsystem on Apple Silicon Macs. It adds a machine driver
called macaudio, which is based on an RFC sent many years ago
by Martin Povišer[1]. The driver uses the DPCM model to dynamically
glue a backend DAI (combination of MCA ports and codecs) to a
frontend PCM. While this theoretically allows us to route any
backend to any frontend, this is not used in practice; the "Primary"
frontend is always used for the headset codec and the "Secondary"
is always used for the speakers.

The audio subsystem on Apple Silicon Macs is rather complicated.
The speaker arrangement is highly variable; some machines have a
single mono woofer while others pull together multiple woofers
and tweeters into a single stereo pair. The driver also exposes
the headset jack's capture PCM. The builtin microphones on equipped
Apple Silicon Macs are not handled by this driver as they are
connected to the Always-On Processor (not actually always on).

Many functions which are handled by firmware on other platforms
must be handled by the kernel or userspace. Most notably, speaker
protection is handled by speakersafetyd[2], a userspace daemon.
The macaudio machine driver facilitates this by exposing a capture
PCM from which the voltage and current across each speaker's voice
coil can be read. Given that there are absolutely no hardware or
firmware level failsafes preventing permanent damage to the fragile
speakers found on these machines, the driver also implements a
failsafe that will mute and lock the kcontrol of every speaker
unless speakersafetyd is running.

This (rather large, sorry) series is split up into logical sections:

1. Devicetree binding for the macaudio driver;
2. Minor ALSA/ASoC fixes required to drive the audio subsystem on
   these machines correctly;
3. Minor ALSA/ASoC API additions to facilitate the driver's
   integration with speakersafetyd and the insane combinatorics
   required to cater for such a wide array of possible setups;
4. The machine driver itself; and
5. Devicetree updates for M1 and M2 series machines.

Adding the required Devicetree updates for M3 series devices would
have bloated this series to an unreasonable size as they are still
missing most prerequisite hardware nodes. They will be added in a
future series.

Regards,
James

[1] https://lore.kernel.org/asahi/20220606191910.16580-1-povik+lin@cutebit.org/
[2] https://github.com/AsahiLinux/speakersafetyd

---
Hector Martin (6):
      ASoC: cs42l42: Set a faster digital ramp-up rate
      ASoC: apple: mca: Fix PD link double-frees
      alsa: pcm: Remove the qos request only if active
      ALSA: dmaengine: Always terminate DMA when a PCM is closed
      ALSA: control: Add kcontrol callbacks for lock/unlock
      ASoC: ops: Export snd_soc_control_matches()

James Calligeros (13):
      ASoC: tas2764: Set up V/ISENSE on codec probe
      arm64: dts: apple: t8103-j274: Add speaker/headset jack nodes
      arm64: dts: apple: t8103-j313: Add speaker/headset jack nodes
      arm64: dts: apple: t8103-j293: Add speaker/headset jack nodes
      arm64: dts: apple: t8103-j45x: Add headset jack nodes
      arm64: dts: apple: t8112-j413: Add speaker/headset jack nodes
      arm64: dts: apple: t8112-j415: Add speaker/headset jack nodes
      arm64: dts: apple: t8112-j473: Add speaker/headset jack nodes
      arm64: dts: apple: t8112-j493: Add speaker/headset jack nodes
      arm64: dts: apple: t600x-j31x: Add speaker/headset jack nodes
      arm64: dts: apple: t600x-j375: Add speaker/headset jack nodes
      arm64: dts: apple: t602x-j41x: Add speaker/headset jack nodes
      arm64: dts: apple: t602x-j47x: Add speaker/headset jack nodes

Martin Povišer (9):
      dt-bindings: sound: Add Apple Macs sound peripherals
      ASoC: cs42l42: Fix typo
      ALSA: Support nonatomic dmaengine PCMs
      ASoC: ops: Move guts out of snd_soc_limit_volume
      ASoC: ops: Accept patterns in snd_soc_limit_volume
      ASoC: ops: Introduce 'snd_soc_deactivate_kctl'
      ASoC: ops: Introduce 'soc_set_enum_kctl'
      ASoC: card: Let 'fixup_controls' return errors
      ASoC: apple: Add macaudio machine driver

 .../bindings/sound/apple,macaudio.yaml   |  235 ++++
 .../arm64/boot/dts/apple/t6000-j314s.dts |    5 +
 .../arm64/boot/dts/apple/t6000-j316s.dts |    5 +
 .../arm64/boot/dts/apple/t6001-j314c.dts |    5 +
 .../arm64/boot/dts/apple/t6001-j316c.dts |    5 +
 .../arm64/boot/dts/apple/t6001-j375c.dts |    5 +
 .../arm64/boot/dts/apple/t6002-j375d.dts |    5 +
 .../boot/dts/apple/t600x-j314-j316.dtsi  |  128 ++
 .../arm64/boot/dts/apple/t600x-j375.dtsi |   58 +
 .../arm64/boot/dts/apple/t6020-j414s.dts |    5 +
 .../arm64/boot/dts/apple/t6020-j416s.dts |    5 +
 .../arm64/boot/dts/apple/t6020-j474s.dts |    5 +
 .../arm64/boot/dts/apple/t6021-j414c.dts |    5 +
 .../arm64/boot/dts/apple/t6021-j416c.dts |    5 +
 .../arm64/boot/dts/apple/t6021-j475c.dts |    5 +
 .../arm64/boot/dts/apple/t6022-j475d.dts |    5 +
 .../boot/dts/apple/t602x-j414-j416.dtsi  |   35 +
 .../boot/dts/apple/t602x-j474-j475.dtsi  |   10 +
 arch/arm64/boot/dts/apple/t8103-j274.dts |   60 +
 arch/arm64/boot/dts/apple/t8103-j293.dts |  104 ++
 arch/arm64/boot/dts/apple/t8103-j313.dts |   75 ++
 arch/arm64/boot/dts/apple/t8103-j456.dts |   33 +
 arch/arm64/boot/dts/apple/t8103-j457.dts |   33 +
 arch/arm64/boot/dts/apple/t8112-j413.dts |  101 ++
 arch/arm64/boot/dts/apple/t8112-j415.dts |  125 ++
 arch/arm64/boot/dts/apple/t8112-j473.dts |   55 +
 arch/arm64/boot/dts/apple/t8112-j493.dts |  101 ++
 include/sound/control.h                  |    7 +
 include/sound/cs42l42.h                  |    4 +
 include/sound/soc-card.h                 |    2 +-
 include/sound/soc.h                      |    8 +-
 sound/core/control.c                     |   16 +-
 sound/core/pcm_dmaengine.c               |   37 +-
 sound/core/pcm_native.c                  |    5 +-
 sound/soc/apple/Kconfig                  |   19 +
 sound/soc/apple/Makefile                 |    4 +
 sound/soc/apple/macaudio.c               | 1729 +++++++++++++++++++++++++
 sound/soc/apple/mca.c                    |   16 +-
 sound/soc/codecs/cs42l42.c               |   12 +-
 sound/soc/codecs/tas2764.c               |   61 +-
 .../soc/mediatek/mt8188/mt8188-mt6359.c  |    4 +-
 sound/soc/soc-card.c                     |   12 +-
 sound/soc/soc-core.c                     |    5 +-
 sound/soc/soc-ops.c                      |  182 ++-
 44 files changed, 3268 insertions(+), 73 deletions(-)
---
base-commit: 0e5a521109e0d2fb7ac226bd6301ec1facca1c26
change-id: 20260915-macaudio-33c1c4f304da

Best regards,
--  
James Calligeros <jcalligeros99@gmail.com>


