Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AA47CD484E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 05:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BPQf09flx3bPYsBrqxbtXR3Hzfkdfkg5ZXgAO0v4+Zk=; b=d+7JIIjNm8awRIq/8YFb8v8R5V
	U6f2Ty5BzGmZ4RfEx3/FUklRUhzKcH6DfC71Eq67tjleOl7c2yB75jMQvcuym7SMCfs5S8/K7/b8O
	P+evkUXvxcapJCyQp16LQpqLF+bsd/yYxjUBtfA0xjM//A9jgqG71/lu8om/Fumcn8PrMiQmBRg5v
	aTKDymIu4QUDtDqDt4COuzvLfyIpSeEwF+nuIfHfLNVwzr8dcsDUSsk5sd26GSWoZWQ04Ef1plBNp
	PjVCc863hrqiSN27wvYd8512ZFZiqfe8yUFltYYj3cHI0F9143cXHUwCBaYnB94E1dZP7x5sWGQv4
	pRhIAbWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMfYs-0000000FYog-0O5K;
	Tue, 12 May 2026 05:21:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMfYq-0000000FYmJ-3jhT;
	Tue, 12 May 2026 05:21:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E586B60055;
	Tue, 12 May 2026 05:21:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8EF4FC2BCB0;
	Tue, 12 May 2026 05:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778563299;
	bh=P/jMSfPtRFdohnZ2RbfEsPmgWw03TgQcG7fDYV/R02w=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=Vg2c0rb9AB/F9ZnCCo50AaHEmR41/v00FIMB9J1xy04IvouVoZIKrX1m4H+HFxUUR
	 13AAF6yprSLygajqzZHFZhVozG49SfjCZM0AkJ5ZsXRtKPQ1T1jWjFttp+VUdCsc56
	 drfIPGkzb9SHj8iw4GAqU6amLCNIeD5cGge9QVXt0xox6q/znCqb9qY3NIa1rL87hP
	 ZGMeE0WGh+WdXVwMFepftiURNSeNomFNvCnY+Xlf19fpBfrOWS7S12GmwxR2Qnth8Q
	 i1ANC3ZfzFD4fuKwexRPrrN5HjkU5hbWye9B35hIXFYNB7kpExiflK5ys8AG8V7/9c
	 V8157VjSgEwGA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80277CD4851;
	Tue, 12 May 2026 05:21:39 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Subject: [PATCH v2 00/16] add AUXADC, EFUSE and thermal drivers for the
 MediaTek mt6323 PMIC
Date: Tue, 12 May 2026 08:18:14 +0300
Message-Id: <20260512-mt6323-v2-0-3efcba579e88@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/zWNQQ6CMBBFr0JmbU2ZUhRW3sOwoDCVMUJJW4mGc
 HcBw/Il778/QyDPFKBMZvA0cWA3rICnBJquHh4kuF0ZUGIutUTRx1yhEkVGqcUWa2MUrPLoyfJ
 nD92rP4e3eVITt/VmdByi89/9aUo374hmR3RKhRSXojD6apTW1t5G76Ib+ppf58b1UC3L8gPPy
 SFqswAAAA==
X-Change-ID: 20260502-mt6323-94e1f2d2abb3
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
 Roman Vivchar <rva333@protonmail.com>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org, 
 Ben Grisdale <bengris32@protonmail.ch>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778563297; l=4770;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=P/jMSfPtRFdohnZ2RbfEsPmgWw03TgQcG7fDYV/R02w=;
 b=CiMrazcWzqkeUeN4GpsK+aPXiZqRaZvE5U6erqpDpkh3lqXtLpKViX6H2PBX4tNxkpFqGvyex
 d6tQ2/tzsVoAHl2n31m/GrYtnBAEB8ddGN/aQIHsyCvDS/khlpOOHah
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
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
Reply-To: rva333@protonmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

This series adds support for AUXADC, EFUSE and thermal drivers for the
MediaTek mt6323 PMIC

Usually vendor downstream kernels for devices with mt6323 include various
useful drivers like AUXADC, thermal, fuel gauge etc. Bring it to the
upstream kernel by rewriting some drivers from 3.18 vendor tree.

Currently dt-bindings limit some values like ADC channel count and names
to what mt6323 has, but the drivers were designed in a way to support
other PMICs like mt6358 (which has very similar thermal logic).

Tested on the MediaTek mt6572 and mt8163 SoCs, both paired with mt6323.

Tested-by: Ben Grisdale <bengris32@protonmail.ch> # Amazon Echo Dot (2nd Generation)
Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
Changes in v2:
- dt-bindings:
    - Drop Tested-by tags (Krzysztof)
    - AUXADC: drop mt6323 standalone binding and merge into mt6359 (Krzysztof)
    - EFUSE: drop mt6323 standalone binding and merge into mt6397 (Krzysztof)
    - Thermal: drop iio-channel-names, nvmem-cells description, unused label (Rob)
    - Thermal: Merge into mt6397 mfd
- AUXADC driver:
    - Fix formatting for macro, OF table, etc (Andy, Jonathan)
    - Drop dev field from the mt6323_auxadc struct (Andy)
    - Use dt-bindings constants for channels instead of raw numbers
    - Simplify mt6323_auxadc_check_if_stuck implemenetation with iopoll (Andy)
    - Drop untested audio channel support (Andy, Jonathan)
    - Replace check for chan->address with chan->channel to avoid confusion (Jonathan)
    - Replace scoped_guard with guard in mt6323_auxadc_read_raw (Andy)
    - Replace mutex_init with devm helper in probe (Andy)
- EFUSE driver:
    - Add comments about read function (Andy)
    - Use sizeof() (Andy)
- Thermal driver:
    - Rename to mtk_pmic_thermal for proper module name
    - Add module name to Kconfig
    - Use bitfield.h APIs for efuse extraction (Andy)
    - Drop nvmem cell name for consistency with devicetree bindings
    - Replace raw numbers with constants (Andy)
    - Add comments to read function, remove redundant parentheses (Andy)
    - Add comments to precalc function, simplify it for readability (Andy)
    - Reorder struct fields (Andy)
    - Drop cali_val field, since per-PMIC functions are used
    - Use __free for nvmem_cell_read cleanup (Andy)
- Maintainers:
    - Split patch into 3 for different subsystems (Krzysztof)
    - Downgrade to "Odd fixes"
- Note: Signing key has been changed since v1. Sorry for inconvenience
- Link to v1: https://patch.msgid.link/20260504-mt6323-v1-0-799b58b355ff@protonmail.com

---
Roman Vivchar (16):
      dt-bindings: iio: adc: mt6359: generalize description for mt63xx series
      dt-bindings: iio: adc: mt6359: add mt6323 PMIC AUXADC
      dt-bindings: mfd: mediatek: mt6397: add mt6323 PMIC EFUSE
      dt-bindings: mfd: mediatek: mt6397: add mt6323 PMIC thermal
      iio: adc: mediatek: add mt6323 PMIC AUXADC driver
      nvmem: add mt6323 PMIC EFUSE driver
      thermal: mediatek: add PMIC thermal support
      mfd: mt6397-core: add mt6323 AUXADC support
      mfd: mt6397-core: add mt6323 EFUSE support
      mfd: mt6397-core: add mt6323 thermal support
      ARM: dts: mediatek: mt6323: add AUXADC support
      ARM: dts: mediatek: mt6323: add EFUSE support
      ARM: dts: mediatek: mt6323: add thermal support
      MAINTAINERS: add MediaTek mt6323 PMIC AUXADC driver maintainer
      MAINTAINERS: add MediaTek mt6323 PMIC EFUSE driver maintainer
      MAINTAINERS: add MediaTek mt6323 PMIC thermal driver maintainer

 .../bindings/iio/adc/mediatek,mt6359-auxadc.yaml   |   3 +-
 .../devicetree/bindings/mfd/mediatek,mt6397.yaml   |  65 +++++
 MAINTAINERS                                        |  15 +
 arch/arm/boot/dts/mediatek/mt6323.dtsi             |  40 +++
 drivers/iio/adc/Kconfig                            |  11 +
 drivers/iio/adc/Makefile                           |   1 +
 drivers/iio/adc/mt6323-auxadc.c                    | 319 +++++++++++++++++++++
 drivers/mfd/mt6397-core.c                          |   9 +
 drivers/nvmem/Kconfig                              |  11 +
 drivers/nvmem/Makefile                             |   2 +
 drivers/nvmem/mt6323-efuse.c                       |  86 ++++++
 drivers/thermal/mediatek/Kconfig                   |  12 +
 drivers/thermal/mediatek/Makefile                  |   1 +
 drivers/thermal/mediatek/mtk_pmic_thermal.c        | 316 ++++++++++++++++++++
 .../dt-bindings/iio/adc/mediatek,mt6323-auxadc.h   |  24 ++
 15 files changed, 914 insertions(+), 1 deletion(-)
---
base-commit: 028ef9c96e96197026887c0f092424679298aae8
change-id: 20260502-mt6323-94e1f2d2abb3

Best regards,
--  
Roman Vivchar <rva333@protonmail.com>



