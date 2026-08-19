Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B60FC5DF87
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 10:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Fjy7BDi48DK0VY42L1wkEP3ayVKA14OCO7JVfsirlug=; b=QfWiQNLwE5Ianf5AoaJwj3h7L+
	OhFcsEb0cr6P810B3I5qsUgmXzXHATrWvoGbH4nFBRSXDUKPw2w5KSKWQFCB4yt7PSmiiPp1XJQlB
	YwfFV8MbMf8unyAjJya5x0Pugx7Dq5HjptCdlMUM7tR8hdeNBVoc3MOcnLM9vO1RSfwkJOx8diGsj
	7eepLN10L/1ehH5Eysi20pC1S+zoU4uLm3Qv/nP2L7ju6uRGRpXQdd3EsiCHsKE5Lh3FvVfshSKWt
	m88xpwGVQEjgWUzPUAblvhfCzdbcj6LXHqaqavwU09z+nJtpfWeetV9CKL4iYMSS+A/TNFgaS81nr
	raT9fhcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwdOF-00000009Vtt-3ASF;
	Wed, 19 Aug 2026 10:19:23 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwdO1-00000009VkB-1MSj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 10:19:14 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-496bb7cdf51so10054775e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 03:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787134747; x=1787739547; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fjy7BDi48DK0VY42L1wkEP3ayVKA14OCO7JVfsirlug=;
        b=L2gK/hZyE1qV5LevuU6WcZCKNhHSone4OqHzOU9Oux4QLvCl0+JecXig1lbaLsbO2Z
         8hEwKTlchd23LwyXMh62dw7hXTpccG8hxLSuMtwxxqeClTZSNDYsUevkchYEkoNyzI6i
         3uPZwvum/pmUZ8QLtl10jh3X57o6reFQsZzcolwur9UE7NdcQxPyJam+wWf4BSoh20IP
         YTMl9AMol5G2jrKBFVH4J+NWSK642/mItY2SK1waU5qifhs7SkUkHBa0T9sWx4DV8g/+
         S5TwPj23COX3Cc6aoX6CxU3MbCADpohsGprBHrEj1KlBrCvolML/DW8aCz6HEorjljjT
         B9JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787134747; x=1787739547;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fjy7BDi48DK0VY42L1wkEP3ayVKA14OCO7JVfsirlug=;
        b=jrkAE30B6MZO/WWHYns+byjKAeX0rBsDZrwDtRKz52VeExEKWDowrgIp6JXVLN/uCo
         OEm9xbSPzp5wsKXsMI+xr7CfpaP2A5ktK2ir2TJTKlm/Lu+n07haioylXHKok3shUZXr
         rPSW8JjbQa72LqjHHcBJNJzCIPmt8Xv73l67Wc5WjssWDJdg31kgNbS4Tafb+rfdWABY
         BHRfs3B9atZnArt4iMV2RDxwc9JDeO9BTHIltnQOYSy6iwTKX+wAIj8aM0bXEkE+mxsM
         yEYyMtcljMW8q9cgWgSuEbhQaxMH0W8sql4Nv40Hj9K1XbYZ1LhWyah37bYEprAl7mIJ
         re5Q==
X-Forwarded-Encrypted: i=1; AHgh+RoweiS06qmeJID5zlGWLyOXo0PVUJbfY8wViB3I0NM4fd6XDJN0uIzGxVC1OYW3JJgmo0gZ273AgNqHXJ0JB+t5@lists.infradead.org
X-Gm-Message-State: AOJu0YwA3ceSR9/tFHwM4DT1xFFgskIpT50znRJnyZSgQmelVBhHQppA
	dOG8rSOG3aiUettVq5wPfBQeNIbweQypzWeDwkOcsr1UPH3PVP+3HDytQ1fWb9V7
X-Gm-Gg: AR+sD11cS/ulukRhDeaLOmsAx8YTWpoBMvmLh0NjWvuuxDIeTHfb16q9J5iiTb2pkCY
	lB0ayLU1otOlz9BfdOdc+cBcinkoYwo8d5FbPobbvcfO92g1vza9dy6UvSFizo1iBoutUMlR2pn
	H1VVffRXT6fH/8NzX/j3DM9QzYZMZdIVx9IHGejYtIBGnBIDh8X72tzASPU0G7OpGGCZR7MqcqL
	rNnpXeRkxYVKIy+YwPYVhNmRZ3ldipUOwBFziUwUiA5chHl4Zv3U3qiecWY+vkjFVOMqm7M8KmH
	xVWF6INnWFDm7vkIoV1X2MtWw7Mq9PaJkE3Hjxq2bNqQzCRcmzNK/cqS+NP1skEhyDfrzY/p7OK
	jFC9Jxvfp/Lz/+OFlIgX471qab6iBOqarOV0HRWIBJzR6KxcyCmWH0xn4Ya7S38VgKrHJuT+06Q
	DQFgBmp2hTznfyNlk3lr2ouPsHvhtD8/55F3TQbG1UhEY1ey+H/27Vyg==
X-Received: by 2002:a05:600c:c493:b0:499:7aa7:eaa7 with SMTP id 5b1f17b1804b1-499aa20c7b1mr56722905e9.15.1787134746695;
        Wed, 19 Aug 2026 03:19:06 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499a9b7c987sm27316965e9.1.2026.08.19.03.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 03:19:06 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 0/7] Properly describe mt6589 and mt8167 toprgu resets
Date: Wed, 19 Aug 2026 12:16:21 +0200
Message-ID: <20260819101853.44681-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_031909_390950_47CBB0E1 
X-CRM114-Status: GOOD (  23.75  )
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

Currently mt8167 inherits its watchdog from the included mt8516 dtsi,
which in turn falls back on mt6589-wdt, which does not support toprgu
resets yet. This series adds support for mt6589 toprgu resets with bit
definitions obtained from Android stock sources.

However, according to its data sheet, mt8167 has 14 sw resets instead of
12, and the reset bits are non-contiguous. This is currently unsupported
by the mtk-wtd driver, and it caused confusion between reset IDs and reset
bits in device tree includes.

Therefore in the first three patches we improve the description of the,
resets for mt6589 using the definitions obtained from Android sources.

Then we introduce a dedicated mediatek,mt8167-wdt compatible for the
watchdog driver that describes correctly this SoC's resets. Also while
we're touching the bindings reset includes, we add IDs for the MMSYS
resets.

In the 5th patch we add support for a watchdog reset table to accommodate
the distinction between device tree reset IDs and the actual bits in the
registers. Code is inspired by the reset table currently implemented in the
mmsys driver. There should be no effect on existing sequential wdt resets.

In the 6th patch, we define the mmsys reset table for the SoC. According
to the datasheet, there are 28 mmsys reset bits divided across two
adjacent registers.

In the last patch we actually enable the watchdog driver for mt8167 by
adding a node for the mt8167 watchdog referring to the new compatible in
the SoC dtsi.

The series has been tested on a Sony PlayStation Classic Mini and on a
Lenovo Smart Clock 2.

Changes in v4:
- Squashed the reset IDs includes together with the bindings change;
- Added support for a reset table to the mtk-wdt driver. This allows us
  to decouple reset IDs from device trees from reset bits and lets us
  describe correctly the non-contiguous reset bits of mt8167;
- Improved explanations in commit messages.

Changes in v3 [3]:
- Improved explanations in the commit messages;
- Added the #reset-cells property to mt6589 watchdog node;
- Included the mediatek,mt6589-resets.h file in mt6589.dtsi;
- Included the mediatek,mt8167-resets.h file in mt8167.dtsi;
- Moved the mmsys reset table from the mt8167-mmsys.h header file to
  the mmsys driver implementation.

Changes in v2 [2]:
- Sashiko pointed out correctly a missing entry in the mmsys reset table
  in the last patch.

Initial version: [1]

[1] https://lore.kernel.org/linux-mediatek/20260717151134.678839-1-l.scorcia@gmail.com/
[2] https://lore.kernel.org/linux-mediatek/20260717163959.714561-1-l.scorcia@gmail.com/


Luca Leonardo Scorcia (7):
  dt-bindings: reset: Add mt6589 toprgu reset IDs
  watchdog: mediatek: Add wdt/toprgu resets for mt6589
  arm: dts: mediatek: mt6589: Enable toprgu reset controller
  dt-bindings: watchdog: Add compatible for MediaTek mt8167
  watchdog: mediatek: Add support for mt8167 toprgu/watchdog
  soc: mediatek: mtk-mmsys: Add resets for mt8167
  arm64: dts: mt8167: Properly describe the SoC watchdog and mmsys
    resets

 .../bindings/watchdog/mediatek,mtk-wdt.yaml   |  1 +
 arch/arm/boot/dts/mediatek/mt6589.dtsi        |  2 +
 arch/arm64/boot/dts/mediatek/mt8167.dtsi      | 10 ++++
 drivers/soc/mediatek/mt8167-mmsys.h           |  3 ++
 drivers/soc/mediatek/mtk-mmsys.c              | 38 +++++++++++++
 drivers/watchdog/mtk_wdt.c                    | 54 +++++++++++++++++--
 .../dt-bindings/reset/mediatek,mt6589-wdt.h   | 20 +++++++
 .../dt-bindings/reset/mediatek,mt8167-mmsys.h | 35 ++++++++++++
 .../dt-bindings/reset/mediatek,mt8167-wdt.h   | 21 ++++++++
 9 files changed, 179 insertions(+), 5 deletions(-)
 create mode 100644 include/dt-bindings/reset/mediatek,mt6589-wdt.h
 create mode 100644 include/dt-bindings/reset/mediatek,mt8167-mmsys.h
 create mode 100644 include/dt-bindings/reset/mediatek,mt8167-wdt.h

-- 
2.43.0


