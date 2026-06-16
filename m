Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62562CD98EE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 14:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DA/IVxID36UhVTSKdfrOZP4zxdrLq4OZp8Ix/rKAv80=; b=GUi40ZwFQMgK+Ob60JochgYVPv
	t2VTP8/MvHXSfy8SQ8RSZIAp9WBqvNxjKNR1hydcWuaPBfQFPfqGray0juDqgpjIq4hK0rkcNVzdl
	+O7UYhYsmOu3R8N/5RuEibssOBH9ZjAbXjqXYfmjNVquzyFcHN6KKkhXW4zPbBuIGm1bWuTPv2Enr
	Bsa6sDdubcgMKLZEWT5Vx1yQGeobzUB4VBrK3FzFX43oM0V8d17SbVsyY4hcH/z+4AGSBmmAsdAQR
	408K6oDBg+R880zwTaZYIZ91Bj69zdOC56tDgMKP9JVrt+d6om3KaWwZPxxIf7uGSMNrN9sd64s7o
	s1KMlOzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZUZq-0000000Ftxw-3tAU;
	Tue, 16 Jun 2026 14:15:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZUZq-0000000Ftx6-0BWl;
	Tue, 16 Jun 2026 14:15:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 794244431B;
	Tue, 16 Jun 2026 14:15:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 512CCC2BCB8;
	Tue, 16 Jun 2026 14:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781619341;
	bh=XlvIloNwlhCYTGHH8aZG1rdAJjOlq93TwFN1w080BL0=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=d3ALwlVFgmBywMHfOl5dLQuzlxvQ1Dl0G6AW76Ch6YwwzuiQ6tF0ULMU0O2ZFpz4J
	 n7UIamdVyUErWvbQTFGkitK9FnUeLgBbhpet1iy1MZq5fgo3xM93YyujMrLRMt0AhO
	 bI1FeusiXH9hCp6ADy/oFd6gP7ErjB3Lndo190gpfGeo447yR/kFDxXbAVygpL1pVM
	 SSU/HoP7hQ0xweaWEtoBB6BHzPDpdfG5z8MhDu94WCiihZoOXMYF3XBi8INSTEREEh
	 ffOGy1AxcfD1IJavmW99fFzKWyZYyaT0BOYKusAVl0LlBVIejMjJgXnpj9fy2y6mGV
	 7LWBIYj3qSs5w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39B72CD98CF;
	Tue, 16 Jun 2026 14:15:41 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Subject: [PATCH v3 0/4] AUXADC driver for the MediaTek mt6323 PMIC
Date: Tue, 16 Jun 2026 17:15:38 +0300
Message-Id: <20260616-mt6323-adc-v3-0-1c27c588185d@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2WN0Q6CIBhGX8VxHY1+JmpXvUfrAvEnaSkOiNWc7
 x7oja3Ls33nfDPx6Ax6ci5m4jAab+yYgB8Kono53pGaLjEBBoKVUNIhCA6cyk5R3qJWyIVqNZA
 kTA61ea+x621j/2ofqEIu5EVvfLDus77FU95tYcFgH44nyqioUVW8KlmNeJmcDXYcpHkelR1Ir
 kfY+82PD8mXsuESgLNGN3/+sixfL3ZHK/sAAAA=
X-Change-ID: 20260525-mt6323-adc-3befce36cbf2
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
 linux-mediatek@lists.infradead.org, Ben Grisdale <bengris32@protonmail.ch>, 
 Roman Vivchar <rva333@protonmail.com>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781619339; l=3607;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=XlvIloNwlhCYTGHH8aZG1rdAJjOlq93TwFN1w080BL0=;
 b=NbUp3PfytNvQnQz7+JDvwPQAi/S5bTTYQfLrvRPuMmXmkYazYuBdekOocL0sWzz3jCGWz72Ix
 EGx0RQ40Dw0AXDupH/lVZbWQ00PDSjnvhgqIgdRzNJP6x4bJYy7YcFm
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

This series adds support for the 15-bit AUXADC hardware block found on
the MediaTek mt6323 PMIC.

The previous version of the series for all AUXADC, EFUSE and thermal
drivers was split after Krzysztof's comment [1].

Tested on the MediaTek mt6572 and mt8163 SoCs (Ben), both paired with a
mt6323.

The other parts (EFUSE and thermal) will probably be sent this week.

[1]: https://lore.kernel.org/linux-mediatek/20260504-mt6323-v1-0-799b58b355ff@protonmail.com/T/#med30fad67a090be35f549231336b2dec295233f6

Tested-by: Ben Grisdale <bengris32@protonmail.ch> # Amazon Echo Dot (2nd Generation)
Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
Changes in v3:
- AUXADC driver:
    - Add comment for channels table about voltage and channel IDs (Jonathan)
    - Add comment for mutex in the 'mt6323_auxadc' struct (Jonathan)
    - Break 'regmap_read_poll_timeout' on logical boundaries (Andy)
    - Switch to 'guard' from 'scoped_guard' (Andy)
- Link to v2: https://patch.msgid.link/20260609-mt6323-adc-v2-0-aa93a22309f9@protonmail.com

Changes in v2:
- AUXADC driver:
    - Drop channel type from the MTK_PMIC_IIO_CHAN macro (Nuno)
    - Drop kerneldoc for the mt6323_auxadc struct (Nuno)
    - Add channel release to save power (Sashiko, Jonathan)
    - Drop 'reg' variable in the mt6323_auxadc_read (Jonathan)
    - Sort variables in the mt6323_auxadc_probe (Jonathan)
- Maintainers:
    - Drop linux-mediatek list (Andy)
    - Split between dt-bindings and driver to avoid missing file (Nuno)
- Link to v1: https://patch.msgid.link/20260602-mt6323-adc-v1-0-68ec737508ee@protonmail.com

Changes after split:
- dt-bindings: Change 'MT63xx' to 'MT6350 series and similar' (Jonathan)
- AUXADC driver:
    - Add missing headers (Andy)
    - Fix AUXADC_TRIM_CH* values (Andy)
    - Rename masks to include their register name (Jonathan)
    - Fix formatting (Andy, Jonathan)
    - Replace channel address with actual register value (Jonathan), align the table
    - Replace IIO_TEMP with IIO_VOLTAGE, since the actual output is still mV, not mC
    - Rename constants to match their registers (Jonathan)
    - Remove 'if/else if/else' in the mt6323_auxadc_read_raw (Andy)
    - Add comments for fsleep, ADC range and resolution (Andy, Jonathan)
    - Remove useless error messages (Andy)
- Maintainers:
    - Explicitly include mt6323 in the name (Jonathan)
    - Squash with AUXADC driver commit (Krzysztof)
    - Set status back to 'Maintained'
- Link to a previous series: https://patch.msgid.link/20260512-mt6323-v2-0-3efcba579e88@protonmail.com

---
Roman Vivchar (4):
      dt-bindings: iio: adc: mediatek,mt6359-auxadc: add mt6323 PMIC AUXADC
      iio: adc: mt6323-auxadc: add mt6323 PMIC AUXADC driver
      mfd: mt6397-core: add mt6323 AUXADC support
      ARM: dts: mediatek: mt6323: add AUXADC support

 .../bindings/iio/adc/mediatek,mt6359-auxadc.yaml   |   3 +-
 MAINTAINERS                                        |   7 +
 arch/arm/boot/dts/mediatek/mt6323.dtsi             |   5 +
 drivers/iio/adc/Kconfig                            |  11 +
 drivers/iio/adc/Makefile                           |   1 +
 drivers/iio/adc/mt6323-auxadc.c                    | 314 +++++++++++++++++++++
 drivers/mfd/mt6397-core.c                          |   3 +
 .../dt-bindings/iio/adc/mediatek,mt6323-auxadc.h   |  24 ++
 8 files changed, 367 insertions(+), 1 deletion(-)
---
base-commit: 028ef9c96e96197026887c0f092424679298aae8
change-id: 20260525-mt6323-adc-3befce36cbf2

Best regards,
--  
Roman Vivchar <rva333@protonmail.com>



