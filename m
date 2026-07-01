Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75944C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 14:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZW8+spma2S67V6miLcBHdIf2ZY8X/GF3gl5p74l3kDU=; b=HvwefSF1GepaBT
	qiQ2BnGasU1qi/hAye3askO4a3I/9elfVkWrho1mejTbZkgV/P7FsDWT/fWLq3tRGcG7DtPDd+66B
	u3l6EFHig9HDMuFEmJQ+zpd2fBTVr8Rjn+0mY2fhqco8Di4oTAWUSakafNeT1NhvapQxO7PpRqnM0
	GPEmU0jGqNClG6DKa32G/6Ib6aryaO/tOwqO9vWr0Neu7F9qL9RhowPyiBQA7uN1jWeWvmqZbm5lv
	/25ypa82Vu22SoGR5Aw7wR24u4OZFrT5mN9SYMzs7swXfKpCelEtaw1p92uh3HYj+y6E1uARcW/sK
	QAHq0iSxtAYeF6qyQuhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wevkr-00000002GJu-1fep;
	Wed, 01 Jul 2026 14:17:33 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wevko-00000002GJ6-00mq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 14:17:31 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-493bc8fda98so6062785e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 07:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782915447; x=1783520247; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZW8+spma2S67V6miLcBHdIf2ZY8X/GF3gl5p74l3kDU=;
        b=ex1PJB7dAsJRKktaIfxf9Pt/Eqgj2A/DnVPK85nJvv4q6cQ/XBRnqjixaMTlzT2c+c
         dE7jBfxdpzyVSyhVGbfngIMWnwHl6oNJi8JWJ4MXUXxa5ZuiRu1a9Z0tfVzjdrytNqIJ
         VeJyYPB+MFR5nojLzFMDEo79KVTeiVAToSJ5EUTvK2GYT+A9oD9VkEGrD2WEJsRwfyf6
         15bIW3KkCwCOAlvsQY+9b6bDxwljnphc4uPU9J2iKvgGVpTSoYLx3Wavp0GZsd6lEI8Z
         lROdONB49Lf9DVyOwkpCV4Qu8dmc587O+h9677pUaxnjxtuQ2uFE66bLd1aVvqVsHqPk
         vZhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782915447; x=1783520247;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZW8+spma2S67V6miLcBHdIf2ZY8X/GF3gl5p74l3kDU=;
        b=PvdWpeXyCoA6nRsZgXQ3ygCukQ7sw5SVgTE8RLqN1Th7s0Njv61CYndiuu3w/t07ph
         vyiG50lMy3tfVgZ+wRmBVOrd59y75tnq6dalribK4dGXJAS04rpUzfrfFCzWRQi+VGR4
         ToZq8pHKXxFqdEH8L/abVEw6OtphD/TkfhUSUt6ARr9+cb1A3HZpfv2lmpmIqPvVZOkr
         oCqAv3ZwMul4KZKDLJdbyHDKKHtyeWnnfkmFHjoFjjvteym/JHjKvP7pQ26sKhJA4bfS
         RHCyoEvPoEF2DuOzmKqmg7NfiqPKmigBuXhqL2Ca4Cqp7IQiiHom7Mudq1ZJM/LMAJuz
         R6aA==
X-Forwarded-Encrypted: i=1; AFNElJ9q4CQTrAwhql5tBNq35jGqJTfhMyAXgDhezHbTU8Y7SycGIkeg6hBVrcEWIdHXQVKLc+RkuH/g3kQog11O8DxL@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8acLVLb4psWK3mQl81FZuDe9m2l1ftPa3fPOCO/ppfbKmG0TK
	uIwXuqg59lcdP7gyxk4LXuBuJSRfTlDhLlBW92dnvIzFH+ge1U+MEyxMV7WBXavp84dJv3ZJ3mg
	MZ4cQ
X-Gm-Gg: AfdE7cmmWdJDLDnEaw8ItM+mqyTDoCAwBHVNXrnszHFdYbyswEOEWU+G2Ib19mc8aGc
	n4FTESIcWSBApTx/tRjDhzZeMZC8kUFMlqoqDgfCiS9EXDrosMKR84jm3NhJ/VOKaxTmnytppsM
	witVS6FeOzUjkkT+qESMVGXKOVSYjqBngtaQq5FZm5MOqG5JooOmJfwLT3rYmQfP3aLBwGjfrhv
	Vbs1s1w3zEQD87WmGCzacVMQIZdz+6oRvm5XumEfRFZxTXz7TS1WwaB/muDH2J71+XVlefIYBKi
	HXdbHWrLOwcBwj1t/5YFPV7UV07Q+VIPrmwaneq0LPvxB3amZhQaB32Z64sVi7OsnoYX0/QeBF+
	s+yG4P+NgM++SNXGdarFYXFwcrJ5cSPzT002zoQO8nnFxHc+WvWPVGo8hL8z3KScwpj865dFLd1
	S1ox5pf/utd8cEeYuAwLvOSH5+N+bvAKHoC37jzjEHjWLiCkaSp0eI
X-Received: by 2002:a05:600c:524a:b0:493:af0d:484c with SMTP id 5b1f17b1804b1-493c3df2fb5mr12527785e9.34.1782915447358;
        Wed, 01 Jul 2026 07:17:27 -0700 (PDT)
Received: from [192.168.0.2] (host93-7-32-195.dimensionesrl.eu. [195.32.7.93])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493be81df2asm152552155e9.12.2026.07.01.07.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 07:17:26 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Subject: [PATCH v7 0/2] add mcf54415 DAC driver
Date: Wed, 01 Jul 2026 16:17:22 +0200
Message-Id: <20260701-wip-stmark2-dac-v7-0-ff8fdcc8010a@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XRy07DMBAF0F+pssbI48c4YcV/IBbjFzXQpnJCo
 Kry7zhh0UJdsRxp7rmW59QMIacwNA+bU5PDlIbU78tg7jaN29L+JbDky9wILpArydlnOrBh3FF
 +E8yTY4Yjj6rzvlOxKalDDjF9reLT8888fNjX4MaFWTa2aRj7fFwrJ7Hs3dYnwTgLkmKLrVOc4
 NHS8T3ZHO5dv1u0NapB1qPReQqau6iBfkeXt03y3K65uiZkIbgWiiA6cPJWuxD1KKANnLzUhKb
 SDv+0QyFao5xEUh1wXyHUBSHhmlCFMAE1WSVA+xqhzwRC5QK6ENagbaVE9NpVCLwk2msCC6Fag
 +Ct7dD//Yt5nr8Bqq48OogCAAA=
X-Change-ID: 20260430-wip-stmark2-dac-7060f49dd94f
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
 linux-m68k@lists.linux-m68k.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, 
 Angelo Dureghello <adureghello@baylibre.com>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_071730_091215_1B0FE49D 
X-CRM114-Status: GOOD (  12.46  )
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

This patchset adds a minimalistic DAC driver for the NXP mcf54415/6/7/8
builtin DACs.

Currently the driver enables the raw write only. Feature as dma, sync, or
format are not supoprted for this version.

Additional options suppoerted by the DAC module will be added to the driver
later on, as needed.

The same patchset prepares the m68k/coldfire architecture to support
the driver.

Below some basic tests done on stmark2 mcf54415-based board, voltage check
on DAC0 and DAC1:

~ # cd /sys/bus/iio/devices/iio:device0/
/sys/bus/iio/devices/iio:device0 # ls
name               out_voltage_scale  uevent
out_voltage_raw    subsystem
/sys/bus/iio/devices/iio:device0 # cat name
mcf54415
/sys/bus/iio/devices/iio:device0 # echo 4095 > out_voltage_raw 
/sys/bus/iio/devices/iio:device0 # echo 2048 > out_voltage_raw 
/sys/bus/iio/devices/iio:device0 # echo 4096 > out_voltage_raw 
sh: write error: Invalid argument
/sys/bus/iio/devices/iio:device0 # cat out_voltage_raw 
2048
/sys/bus/iio/devices/iio:device0 # 

Same behavior for /sys/bus/iio/devices/iio:device1.

Generated a sine wave by shell script, sine shape is good.

is actually in progress:

Note: this patchset depends on mew mcf_read/mcf_write implementation that
Link: https://lore.kernel.org/linux-m68k/209d0653-6386-4b64-9e15-e358f84453ab@app.fastmail.com/T/#t
Link: https://lore.kernel.org/linux-m68k/20260506142644.3234270-2-gerg@kernel.org/
---
Changes in v7:
- keeping changelog in each single patch, where any
- Link to v6: https://patch.msgid.link/20260618-wip-stmark2-dac-v6-0-48761dbb96d7@baylibre.com

Changes in v6:
- Removed patches 1 to 8, already pushed in m68knommu for-next by
  Greg Ungerer <gerg@linux-m68k.org>
- keeping changelog in each single patch, where any
- Link to v5: https://patch.msgid.link/20260610-wip-stmark2-dac-v5-0-b76b83366d5c@baylibre.com

Changes in v5:
- keeping changelog in each single patch, where any
- Link to v4: https://patch.msgid.link/20260531-wip-stmark2-dac-v4-0-7e65ab4215dd@baylibre.com

Changes in v4:
- keeping changelog in each single patch, where any
- Link to v3: https://patch.msgid.link/20260522-wip-stmark2-dac-v3-0-16be0ad35a67@baylibre.com

Changes in v3:
- keeping changelog in each single patch, where any
- Link to v2: https://patch.msgid.link/20260513-wip-stmark2-dac-v2-0-fcdae50cf51a@baylibre.com

Changes in v2:
- keeping changelog in each single patch, where any
- Link to v1: https://patch.msgid.link/20260504-wip-stmark2-dac-v1-0-874c36a4910d@baylibre.com

To: Jonathan Cameron <jic23@kernel.org>
To: David Lechner <dlechner@baylibre.com>
To: Nuno Sá <nuno.sa@analog.com>
To: Andy Shevchenko <andy@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-kernel@vger.kernel.org
Cc: linux-iio@vger.kernel.org
Cc: linux-m68k@lists.linux-m68k.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org

---
Angelo Dureghello (2):
      iio: dac: add mcf54415 DAC
      m68k: defconfig: update stmark2 defconfig

 arch/m68k/configs/stmark2_defconfig |   2 +
 drivers/iio/dac/Kconfig             |  11 +++
 drivers/iio/dac/Makefile            |   1 +
 drivers/iio/dac/mcf54415_dac.c      | 180 ++++++++++++++++++++++++++++++++++++
 4 files changed, 194 insertions(+)
---
base-commit: bc5a85a5441632f4bd7acd38620fdcbe4852a44f
change-id: 20260430-wip-stmark2-dac-7060f49dd94f

Best regards,
--  
Angelo Dureghello <adureghello@baylibre.com>


