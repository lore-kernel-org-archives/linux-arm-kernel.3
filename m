Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9B53E7719F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 06:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pGLyERfz0Sc2lbQ8c+aD9QD/xJWEbWuMz+3DkYTQocM=; b=jw69DGuptENR0EF2++gJwN4irA
	7rudhUqCKgK6geZ7pFY9XKR8V+XJrSE4EaMzA+Vbguo6WTv8NbiWvWJjOSERUZyQDJRD/SjGB2eod
	QhJsBWJwc4mElP3DJnX10rDu5+vgLcH1TBgJ9As1CJKWlkIplZ5UiRDFUOy2K4b2k2WlENzM8lHV6
	J49zVZ4g7+BkpIoqaqPYjm+sfHwoaO/BjdBUbHC4fX7RmxynB24H0I8uy/DrH3SmHGEXGQ0MH6ik+
	95CfrbNkCwq0o68dWMxdqDmvJNiJmFym8jHf4y3h3+G51MkwRPLnvbqDFYzTsjAKRxuKpcnD+Sh+7
	+UgdWvCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXE4O-000000049Eq-3GlG;
	Mon, 13 Jan 2025 06:37:04 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXE39-000000048zy-2gyy;
	Mon, 13 Jan 2025 06:35:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 47CFEA40158;
	Mon, 13 Jan 2025 06:33:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1C714C4CED6;
	Mon, 13 Jan 2025 06:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736750146;
	bh=jTNH048J8/e37rPd6oTYl8kF3JhnEDxWF56FPekHMjE=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=MoMkt8YHcrwIqGAAUSz8wPAph1rZMXMe0aRXDbRfgSdTp8AZpNqaAK/J/kdEONx23
	 jFUR75ep9xRmy5c1P2UovMT9EdtfLVIy/Gx8zmqD6oLUGkzjFVMZhA9qf4FIdM2YiW
	 W3NMBRtRG/q/J4XG5R6CEpvGQK1Ky8UN9ck9XS0qqGUHVoDcN+hycGI6XvoYmYoWWh
	 QCpwL6e0eIiO4296uoWh/GPkbeuxwc94FXDwE1DSYg8AEx46TTXpSwMCAwTzNNNqZX
	 KBvJpjSlMie/g71hLkAb/eP+GJ6KTcKofb3iUIXY7H/XNBDizueUVHLdWJJrbi/02W
	 +LMkfj52fewIg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1C4EE7719E;
	Mon, 13 Jan 2025 06:35:45 +0000 (UTC)
From: jiebing chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org>
Subject: [PATCH 0/3] Add support for S4 audio
Date: Mon, 13 Jan 2025 14:35:12 +0800
Message-Id: <20250113-audio_drvier-v1-0-8c14770f38a0@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACG0hGcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDQ0MD3cTSlMz8+JSisszUIl0D80RTYwvDZBNLkyQloJaCotS0zAqwcdG
 xtbUAVy28hV4AAAA=
X-Change-ID: 20250110-audio_drvier-07a5381c494b
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, jiebing chen <jiebing.chen@amlogic.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736750144; l=1136;
 i=jiebing.chen@amlogic.com; s=20250110; h=from:subject:message-id;
 bh=jTNH048J8/e37rPd6oTYl8kF3JhnEDxWF56FPekHMjE=;
 b=zGklfCbSRH4yBG2RsEX2vhu/9ldv5Wjvg/qtKRhQIJW7IToz0zt7qIztoJwr2Tg7lR98AKjfB
 4eXneib0EVrClzcwjQKfqXlUYUGjcwHG4T4zCfukXL2UQFptj3PvQys
X-Developer-Key: i=jiebing.chen@amlogic.com; a=ed25519;
 pk=6rFvvF45A84pLNRy03hfUHeROxHCnZ+1KAGw/DoqKic=
X-Endpoint-Received: by B4 Relay for jiebing.chen@amlogic.com/20250110 with
 auth_id=316
X-Original-From: jiebing chen <jiebing.chen@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250112_223547_758624_5DF89F8D 
X-CRM114-Status: UNSURE (   7.93  )
X-CRM114-Notice: Please train this message.
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
Reply-To: jiebing.chen@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Add the tdmout pad control and tocodec control driver. 

Signed-off-by: jiebing chen <jiebing.chen@amlogic.com>
---
jiebing chen (3):
      ASoC: dt-bindings: Add Amlogic S4 audio
      ASoC: meson: s4:support for the on-chip audio
      arm64: dts: amlogic: Add Amlogic S4 Audio

 .../bindings/sound/amlogic,s4-tdmout-pad.yaml      |  36 ++
 .../bindings/sound/amlogic,s4-tocodec.yaml         |  44 +++
 .../boot/dts/amlogic/meson-s4-s805x2-aq222.dts     | 226 ++++++++++++
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi          | 385 ++++++++++++++++++++-
 sound/soc/meson/Kconfig                            |  16 +
 sound/soc/meson/Makefile                           |   6 +
 sound/soc/meson/s4-pad-out-control.c               | 372 ++++++++++++++++++++
 sound/soc/meson/s4-tocodec-control.c               | 376 ++++++++++++++++++++
 sound/soc/meson/t9015.c                            |   5 +-
 9 files changed, 1461 insertions(+), 5 deletions(-)
---
base-commit: 6ecd20965bdc21b265a0671ccf36d9ad8043f5ab
change-id: 20250110-audio_drvier-07a5381c494b

Best regards,
-- 
jiebing chen <jiebing.chen@amlogic.com>



