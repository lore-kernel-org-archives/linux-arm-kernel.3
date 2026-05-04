Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6513CCD3427
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 18:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EDF6hUkZ0lywwZvFhw0Nk/fYqOoq7apBZafqB0ONLuU=; b=3DtnLZq65JUJiDx+czwO9Awp+t
	9Dcb402fQKM6+yvUQgxFc9TJCmuwkwlOdFAjo1PGuR2JbN2cgRQC5HQXmVSvq5UyZGXy2Zgha+BoI
	45OXJQv1YGJnAnSKfHKdRS8Avu9FGQ71BgXxL1t6Fi9KUlpAbpOXqdb5nOSQBiM96c5GjW76uUC69
	h+b3bfiPMQ06kiEXg8Ek/KjfQ5UtQVrqGCMqcU0DruuTUgSu5OoMO5SgC9ICH6Xrt8F7PBceIVPdy
	R71svqZDezpkUWwjwm9IBZPFlzFZCJJD7ipEQVx9d4CCYTlr/gKuGSR3NNGeeAWg3iNGGlYrDEb0R
	RVeavyQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJxyZ-0000000DyHv-11fU;
	Mon, 04 May 2026 18:25:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJxyV-0000000DyAr-3Zsd;
	Mon, 04 May 2026 18:25:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A653D44366;
	Mon,  4 May 2026 18:24:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 78D87C2BCB8;
	Mon,  4 May 2026 18:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777919098;
	bh=QYhlAZ3CmOdhVVfeWniyHMUkBmi9/VkBz61p37XrddE=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=qu7pVB5Z+Fti0eh5R7o4ePLqloDkhg/rPuNC+jm++mu5LEGORB67ThZlaB4Ri6REd
	 h9k3PZDK50VzbGjjW6to0CZ3WYG0JKpKddijq3iBM/j6MUBj6IS8JeP2QGBV/AmJ/f
	 opBFVbpeJQwBStAro4VeWFGJi7YCpHj639JioMKBtknoJcM+/nAT1OknxZbHmuhOo8
	 g5FRyEkINzqEhfHst5RqbQN1DzzxF9nv8pANcmBAq/erH8+f9Z/ucGfsZPMRJsIYkJ
	 MOTHJyj0MIwgo8a09bKuJelLt2gmZ4rLYLlnREHi3n7hdc/WGqlT/+WWEa1H77BwF5
	 4vjunr/b3eLzg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 452C2CD342F;
	Mon,  4 May 2026 18:24:58 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Subject: [PATCH 00/13] add AUXADC, EFUSE and thermal drivers for the
 MediaTek mt6323 PMIC
Date: Mon, 04 May 2026 21:24:52 +0300
Message-Id: <20260504-mt6323-v1-0-799b58b355ff@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDUwMj3dwSM2MjY11Lk1TDNKMUo8SkJGMloOKCotS0zAqwQdGxEH5xaVJ
 WanIJSLdSbS0AsRoavGoAAAA=
X-Change-ID: 20260502-mt6323-94e1f2d2abb3
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Lee Jones <lee@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org, 
 Ben Grisdale <bengris32@protonmail.ch>, 
 Roman Vivchar <rva333@protonmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777919095; l=2679;
 i=rva333@protonmail.com; s=20260325; h=from:subject:message-id;
 bh=QYhlAZ3CmOdhVVfeWniyHMUkBmi9/VkBz61p37XrddE=;
 b=HnPIZLJxYhQb7c7hv5WLcTV2Su7mCxPFsQG4AYkl+FX9MpAm+P9sqwlSxYaIA8rUnf5jsv0hA
 hEI5QMSVOeAAjC+pse0XZEk6Ve0do2DE/vjHgpCOLUXF/3zs0ZaWYhy
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=euuVBZGtA2Cqb8Dju84qpQPhvwxyUirJlXpqEPQWKBM=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260325 with
 auth_id=695
X-Original-From: Roman Vivchar <rva333@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_112459_974492_B4927850 
X-CRM114-Status: GOOD (  10.36  )
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
Roman Vivchar (13):
      dt-bindings: iio: adc: add mt6323 PMIC AUXADC
      dt-bindings: nvmem: add mt6323 PMIC EFUSE
      dt-bindings: thermal: add mt6323 PMIC thermal
      iio: adc: mediatek: add mt6323 PMIC AUXADC driver
      nvmem: add mt6323 PMIC EFUSE driver
      thermal: mediatek: add pmic thermal support
      mfd: mt6397-core: add mt6323 AUXADC support
      mfd: mt6397-core: add support for mt6323 efuse
      mfd: mt6397-core: add support for mt6323 thermal
      ARM: dts: mediatek: mt6323: add support for AUXADC
      ARM: dts: mediatek: mt6323: add support for EFUSE
      ARM: dts: mediatek: mt6323: add support for thermal
      MAINTAINERS: add mt6323 drivers maintainer

 .../bindings/iio/adc/mediatek,mt6323-auxadc.yaml   |  39 +++
 .../bindings/nvmem/mediatek,mt6323-efuse.yaml      |  42 +++
 .../bindings/thermal/mediatek,mt6323-thermal.yaml  |  63 ++++
 MAINTAINERS                                        |  18 +
 arch/arm/boot/dts/mediatek/mt6323.dtsi             |  42 +++
 drivers/iio/adc/Kconfig                            |  11 +
 drivers/iio/adc/Makefile                           |   1 +
 drivers/iio/adc/mt6323-auxadc.c                    | 372 +++++++++++++++++++++
 drivers/mfd/mt6397-core.c                          |   9 +
 drivers/nvmem/Kconfig                              |  11 +
 drivers/nvmem/Makefile                             |   2 +
 drivers/nvmem/mt6323-efuse.c                       |  86 +++++
 drivers/thermal/mediatek/Kconfig                   |   9 +
 drivers/thermal/mediatek/Makefile                  |   1 +
 drivers/thermal/mediatek/pmic_thermal.c            | 274 +++++++++++++++
 .../dt-bindings/iio/adc/mediatek,mt6323-auxadc.h   |  16 +
 16 files changed, 996 insertions(+)
---
base-commit: 028ef9c96e96197026887c0f092424679298aae8
change-id: 20260502-mt6323-94e1f2d2abb3

Best regards,
--  
Roman Vivchar <rva333@protonmail.com>



