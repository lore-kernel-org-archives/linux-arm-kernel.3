Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36AA2C88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 04:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=geQe/Nt94sgACddk5UkhJlOoq3dCQ3FTfciRXuFH+10=; b=auMmka/DI+vzz8
	j5O5AWBi49r734HJ6pCWuaxqpwbmwmMs/HBkfnUvrS6orRDViljm7z9m7+5NsYLGXhYXARvayw247
	FBzBCOkg66doxL82YGg8MLINZnsFfrY27AcEujjgLObU8G1cQVYQtRKIic4MHkIPUIEVasETVmCQz
	4ripIMVmAdzZPwz03lW7VHHFXWqsfes7gygj49PJbECEbOhJUAEeDCHGjjTP5N1U3g4XqMlTzj53W
	QY9n6NtSvBaL+dNpVVrHVr33k6aiRMa9KGIG2RuuClW4xZKjw1Lqg8Cf/7MReVA9mXcsVt0t/G3Ls
	geMAH0QN1A/OP4r+JNvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6h3W-00000008I05-02qY;
	Wed, 16 Sep 2026 04:15:34 +0000
Received: from mail-oo2-x02.google.com ([2607:f8b0:4864:31::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6h3T-00000008HyG-06iG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 04:15:32 +0000
Received: by mail-oo2-x02.google.com with SMTP id 46e09a7af769-801706d7e6dso2208986a34.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 21:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789532129; x=1790136929; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=geQe/Nt94sgACddk5UkhJlOoq3dCQ3FTfciRXuFH+10=;
        b=fvGisQT+Rrt15Kyv93vgvdOWdeYxxO/n2l4f0mekJx/dzUrGfwRUN6qiEwEQetrEaf
         6Nlh3y36PHeofK3Jjg73l+AMYyKcB0MeNscxSamncKFstX+I0JwRY+TLywHm3BMihmRt
         B60h7CT10gotUKGgWIxFK8N01YCzWrzl5ExzFQrUfwfwjwDyiynIg3yyaFX9/P7oyOd1
         9k9MxWMlb0kWP0tjjkFVOecj/rQXaRGim+pHjAtZbgljKbwOUw4tbHn/f+XIouN4HjCw
         XqCOEB/k5NFUDpfqG3vEGO8VXRmJOxz5Zb+0JwerquMtD08P+Eooxv4/B38+Z7C11q5R
         ofHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789532129; x=1790136929;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=geQe/Nt94sgACddk5UkhJlOoq3dCQ3FTfciRXuFH+10=;
        b=a+kdVWxfLcJb+uQNa2bWcQhlNQ5aatU8GAIKTshayuxCvRoL71Qoj9uXVyaRBn/y/n
         UjYeML3/B1PcubT+q9UjpnZjvHjcDoI05sFhnT5p7seRLKPiDmDDgeqKw/wrlWwO5hGb
         zFovcjJEdalrZPMduNPoaawFSlPMJMeSJBlaq5Q5HEJLKgwBkl8qzfRLkqulCQTcecP4
         hTLOGyMSdz8JGuruC6Rx9dbhixi5IVnEMXEQkuc2JP+ddJgr3+U1n4QFVrx8hhFxbxga
         geI3YG3X4yTIInskYICZjJJVDTgTEwW0RXDihkaM0NMLgUiDknuYTvN93mdGgZLtZGKz
         ZLig==
X-Forwarded-Encrypted: i=1; AKwUvBz4VVZO1rW1ooUhqhkWckJHWd3n2mUeiq64J1VrznXfy2p30qwOkK/uF8lMfXg/Zeu7/Pdwb2WI2iU0Gd/QL0yf@lists.infradead.org
X-Gm-Message-State: AFuF++l1fQq0W1hzvrdgXXcIxao84q3JgHHMqO6lCsyCDiwfrTIGZXv8
	e8q0R+0xo85ERjXqgS7qurFC0mhJ29Wacgn7aKnDBhh2Gr8nn/2Orv/n
X-Gm-Gg: AYBFou1r1Wbqz8KraIvkX5WOFEuepHzNfH2dyjXLInItX9cei8ZgFZtoOsO2CGfCOtw
	P9rDCzIFbTux0I6dvrO6rpdNyYhHJwagz3Qb/LW27O7kZyI9IHTL7ZGt+N7AXOYAkqB50wsQ+4B
	t3V3QHWErf8JFnIzuCLnmHa7TFmiTCsvrajqBVZQFf15lS786Dn1zk5UtIHlk5e1YJkrjF+ICB5
	5w5GnvPUaSIdQwQkKamaYMuXzG4SZK9OlM7POmBQyuCxA/qCXGtdaC2RWLE3HmYev68VB2pX97i
	UWXCzmWfC0GlbJiQKaaWvHX/FcJMWnwG2CZqo2wBlk82r4G/5fkYA7RGvrVNOGUX0lleGkHESuI
	GbIiCSIv297XDxjX7F6s2eTE8TrzJGSLKOPJZ2iXa10glnGFJFYmJrHJ6g/e515mNusONnCxK9m
	NUsf/T7FfQQv4rUt08tNGZGkh0gAf/85p9FI6kMvUDMMZ57o6FAP+jvtLWSVacdzfLyH1xFeREs
	5Z0FA==
X-Received: by 2002:a05:6830:6af7:b0:7f4:eb7e:c8f7 with SMTP id 46e09a7af769-80b2c18158cmr1482766a34.5.1789532129476;
        Tue, 15 Sep 2026 21:15:29 -0700 (PDT)
Received: from [192.168.18.164] ([2600:8804:5716:d800::b712])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-80b07ad0373sm1440484a34.26.2026.09.15.21.15.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 21:15:29 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Subject: [PATCH 0/3] iio: adc: add mt6397 PMIC AUXADC support
Date: Tue, 15 Sep 2026 23:15:25 -0500
Message-Id: <20260915-rbrue-suez-upstreaming-mt6397-auxadc-v1-0-d35d2ac3d6f0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3NwQ6CMAyA4VchPdtkqw7FVzEe5ijYA5O0zBAJ7
 +7C8bv8/wbGKmxwbzZQ/orJJ1f4UwPpHfPIKH01kKPWdf6C+tLCaIV/WGZblOMkecRpac/dFWN
 ZY58wsCe6OQopOKipWXmQ9dg8nvv+B56DRSV2AAAA
X-Change-ID: 20260914-rbrue-suez-upstreaming-mt6397-auxadc-5e1228025c50
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lee Jones <lee@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, mfd@lists.linux.dev, 
 Roman Vivchar <rva333@protonmail.com>, 
 Luca Leonardo Scorcia <l.scorcia@gmail.com>, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789532127; l=3814;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=1ZhvOrKcGislD+WC+8Q4vWu5z8pTpCo7Q/Gsjhr1d1M=;
 b=hy8S44J3Kt9/i++nBCcDmWUBualfD1ZRDUrk1YbiwxToPcudFRBPrKHFN4YfXcOFs/wkiAGTH
 L6vgwManOMMAClIr8hluO7RIvzaIEMuHuNUzkqJgQwQVkFxih5p6Zjj
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_211531_114014_B19C5AD8 
X-CRM114-Status: GOOD (  19.10  )
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

The MediaTek mt6397 PMIC has a 10-bit AUXADC that nothing in-tree can
reach. On boards built around it that ADC is the only path to the battery:
the SoC's AUXADC is wired to board thermistors, and the charger ICs these
boards use have no ADC at all, so without it there is no pack voltage and
no state of charge.

Patch 1 adds the compatible to the existing MediaTek PMIC AUXADC schema and
the header naming the channels, patch 2 the driver, patch 3 the MFD cell
that instantiates it. The cell comes last so that no commit in between
registers a child no driver can claim.

The mt6397 is not given mediatek,mt6359-auxadc as a fallback because the
two are not register compatible; patch 1 has the detail.

Only the two channels a board needs for its pack are described, so patch 1
ships a header naming them: a channel ID is an index into the driver's array
and not the PMIC's channel number, as in mt6323-auxadc. The register
sequences are the ones the vendor kernel's pmic_auxadc.c programs.

One note on patch 3: it adds a cell to mt6397_devs[], which Luca Leonardo
Scorcia's MT6392 series converts to the MFD_CELL_* macros in its patch
4/9 [1]. Whichever of the two lands second needs a respin. Mine would
become a single MFD_CELL_OF(), and I can do a respin if that patch arrives
first.
Cc'd Luca.

[1] https://lore.kernel.org/all/20260902193351.185771-5-l.scorcia@gmail.com/

Tested on an Amazon Fire HD 10 (2017), an mt8173 with an mt6397. Both
channels are exercised: the battery channel by a fuel gauge, which reads 817
counts, 3830 mV with the pack at rest, and the thermistor channel by an
ntc-thermistor consuming it.

I have two things in the driver different from the vendor (Amazon
Fire OS based on a 3.18 kernel). Verified with over 150 interleaved reads
per setting:

 - Leaving the ISENSE input enabled between reads, as the vendor does,
   makes no difference to the value, so the driver switches it off again
   and leaves both ADC input enables clear when idle.

 - The chip's sample accumulator makes no difference at 4, 8, 16 or 31
   samples and costs no measurable time, so it is left at one. Software
   averaging helps, but only by about a quarter: 0.92 LSB standard
   deviation for one conversion against 0.67 for sixteen, where independent
   samples would have given 0.23. Conversions in a burst are correlated.

The reading was checked against the charger, which regulates the pack to
a programmed voltage in constant-voltage mode. Over twelve such voltages
from 3904 to 4080 mV, and charge currents from 111 to 778 mA, the driver's
reading is a mean of 0.9 mV from the regulated value, well inside
the charger's regulation tolerance. That also settles reading the chip's
trimmed result register rather than the raw one - the raw register is
20.7 mV low at every one of the twelve points.

Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
Ryan Brue (3):
      dt-bindings: iio: adc: mediatek,mt6359-auxadc: add mt6397 PMIC AUXADC
      iio: adc: mt6397-auxadc: add mt6397 PMIC AUXADC driver
      mfd: mt6397-core: Add mt6397 AUXADC support

 .../bindings/iio/adc/mediatek,mt6359-auxadc.yaml   |   1 +
 MAINTAINERS                                        |   7 +
 drivers/iio/adc/Kconfig                            |  11 +
 drivers/iio/adc/Makefile                           |   1 +
 drivers/iio/adc/mt6397-auxadc.c                    | 340 +++++++++++++++++++++
 drivers/mfd/mt6397-core.c                          |   3 +
 .../dt-bindings/iio/adc/mediatek,mt6397-auxadc.h   |   9 +
 7 files changed, 372 insertions(+)
---
base-commit: fd73f4a6659897191fa0d40695fe370925dd3780
change-id: 20260914-rbrue-suez-upstreaming-mt6397-auxadc-5e1228025c50

Best regards,
--  
Ryan Brue <ryanbrue.dev@gmail.com>


