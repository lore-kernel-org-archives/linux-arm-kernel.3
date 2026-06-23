Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA9E5CDB471
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 08:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=088293Lv3MHmQTOwZSK+9DNFw1IPuRmYSxXpF5olaqA=; b=PZd8m73Lx/MzHH7JPu8X9TJatj
	K4VLjzhv92FaZoqM29MegO0dzKraxhjnkNtlm0eAFWKo89dQzQawymue5z+/FiIavbgWpMCU2lS3j
	+vRQhYg/l1KWnA0X0SlaSjKiq+IsZnegvR2aNeWKJK3FA/DdmIZkphuYupRlst+zZFYvjje4mi4f7
	0NjwrKvSlYC/xpKbBmE+OPUmPNBliuhi2UO783A9Qr/xDVd0kWXLStlKr5BJHJAvnXU0iTwZZxsQD
	FawDVYRPyeADses3Xk2DQLUsRB2LNumWupPi7juYErrMbsjuuJjWdEcKxySKPk4AUktHV1UQ6XN95
	CVD5GZIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbwKJ-00000005tcR-2irG;
	Tue, 23 Jun 2026 08:17:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbwKI-00000005tbU-2TnP;
	Tue, 23 Jun 2026 08:17:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BD2EF440DA;
	Tue, 23 Jun 2026 08:17:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 95930C2BCC9;
	Tue, 23 Jun 2026 08:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1782202665;
	bh=g6VHC3WqxI7yz/J+dPACO/qHVEth/epIVlobOssOjQQ=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=uUx4vs015+Hs9ZnnAU60i+Ea5dcRs3oaM5ud5C4ul454DFm8vTe5leKDOao7WSs6L
	 rCRXpUi/FQ2TrWYYoFJy4TSkUAAvB8SN++i3lAsL6bQPJCZ8gWgboTN0bVWT0xTNpq
	 J8daQ6+R5jOeRieXskBPuVpHSLMcDZdvKaMBASxCINUGeNfgqBpkEsZEKSDuViguVs
	 rinycrBSQBAIcA64vpcMCuTIp3Paw8O7MUVS6YmOS7HrhEBzYr9BSbmM+bYuZe9Qpz
	 ZdmAG3bfzLSuqp/FGfno4AkgJepSUzl59ngs5EL3TvCnG96ihG725Do7Yp+3pwUJIj
	 WPrv1fpm0USVg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AAF7CDB471;
	Tue, 23 Jun 2026 08:17:45 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Subject: [PATCH v4 0/4] AUXADC driver for the MediaTek mt6323 PMIC
Date: Tue, 23 Jun 2026 11:16:12 +0300
Message-Id: <20260623-mt6323-adc-v4-0-299680ad3194@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23NQW7CMBCF4asgr3Flz9SOw4p7VCycyQSMSBzZa
 USFcvc6sAlql0+a75+HyJwCZ3HYPUTiOeQQhzI+9ztBFz+cWYa2bAEKrDJgZD9ZBJS+JYkNd8R
 oqelAFDAm7sL9Gfs6vXb+bq5M01pYLy4hTzH9PL/Ner17ha2CbXjWUknrmCqsjHLMxzHFKQ69D
 7cPir1Y6zNsff3moXjva/QAqOqu/tfjxmv75rF4TVCRcU470/7xy7L8AnQFGWs7AQAA
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
 Conor Dooley <conor.dooley@microchip.com>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782202663; l=3817;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=g6VHC3WqxI7yz/J+dPACO/qHVEth/epIVlobOssOjQQ=;
 b=yxMOlMc6lDlL8G0eIa+T8e+wDTogxwJUjvNOUlKJ+A+V6mrMt0ne3MrIfJbF5nlPaOy1S9Weo
 vlpAAWZVi4DArysZ136nZv4xwZqrkiNl4A9o4maPvPtBDzIDuc2h9Fv
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

[1]: https://lore.kernel.org/linux-mediatek/20260504-mt6323-v1-0-799b58b355ff@protonmail.com/T/#med30fad67a090be35f549231336b2dec295233f6

Tested-by: Ben Grisdale <bengris32@protonmail.ch> # Amazon Echo Dot (2nd Generation)
Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
Changes in v4:
- dt-bindings: Drop separate driver mention from the commit message (Conor)
- AUXADC driver: Break one more time 'regmap_read_poll_timeout' on logical boundaries (Andy)
- Link to v3: https://patch.msgid.link/20260616-mt6323-adc-v3-0-1c27c588185d@protonmail.com

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



