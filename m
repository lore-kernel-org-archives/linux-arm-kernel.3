Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B21ACD6E60
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 12:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uOU/rMZX6bJWKgiY146js/iKbZLcrtFcQsk57ojN0DI=; b=fnTutq2xdvfb0b+6eDzIT2mPPj
	+Kw3rvDd10YZWzIi0v3vhU0fBfLy3MUQBSAwly2btJs/4dmRhvCVE9cpX59ckVyEL1U0ZK3TeB+Gn
	bULncOcPrajqGtX5Qjy7yOB4R+9u0+I78WYBu6Q/Ps2hrvegK34x1HaQO1oDLWY6+qA7uRO6ZD7Fm
	DDOjrH+EwTy4FNnAMxcI4lQQzrN88LDccgwGaFbiD3CznzrWBKXSUJPIjg7Y+4mRMnTClE5x3J5UJ
	oW+4mhYAKjgcTKBWRBZ+Q9eqnSPdrjsT91TfLaQHG7xrxK/q//9ci2NSqJm4HonE8G4LiNkovvSpv
	4hlofF1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUOWI-0000000D0oR-2Kqw;
	Tue, 02 Jun 2026 12:46:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUOWH-0000000D0nP-0tBT;
	Tue, 02 Jun 2026 12:46:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7144F60141;
	Tue,  2 Jun 2026 12:46:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 19749C2BCB4;
	Tue,  2 Jun 2026 12:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780404416;
	bh=7JSIVJME0qcwrQkDU0f3aTxdQOaohzA3I2n+ATF6Cqc=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=NytbkpnvZm9cEu5e4OX06nVnFWbbd6myUUwGAsHmbU6zXX1VTeOaOv35meORmxrWo
	 tCA0Flr/HAmxpKxbg0BpN3vNjqROfAFJJtv3QtsLqKxhJBK7TJfBR5jiFGjObApwS2
	 FknjOxTuEJjzhDT7HAuiFjrOXdK/BEaZr2V0IJeC2fCciCu4qHz7T5bNFaF8SFA+VK
	 KZBrb4O1/rlvZgTIjk4Y6Npmb9XNx5n8D0eAkEQI6ZPPAXbe7CuueJ/wdYrSvzD47L
	 BzKIDmThUSMO+GQBCbrw9tXvK/vBpk85L01ubDP3Rrt9Oq0ipfFpMYL64yXNbLXcjW
	 4pvLy+5iWB9cg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02855CD6E57;
	Tue,  2 Jun 2026 12:46:56 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Subject: [PATCH 0/4] AUXADC driver for the MediaTek mt6323 PMIC
Date: Tue, 02 Jun 2026 15:46:53 +0300
Message-Id: <20260602-mt6323-adc-v1-0-68ec737508ee@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQ5AMBBA4avIrDVhGl24iljodMpI/KRFJOLui
 uW3eO+CyEE4Qp1dEPiQKMucUOYZ0NDNPStxyYAFmqLCSk2b0ahV50hpy55YG7IeIQVrYC/nN2v
 a33G3I9P2HuC+H2I4g2luAAAA
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
 Roman Vivchar <rva333@protonmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780404414; l=2643;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=7JSIVJME0qcwrQkDU0f3aTxdQOaohzA3I2n+ATF6Cqc=;
 b=0JbMx2y6tCQJ3dd9ZlUioB5ryHJQg5jI2blGOCtlbQ6SkPy7gHQ8050y5eQKPoicbwzx0Hnsg
 abvtLeSslqPAqYkIExaK3VblfKmPSMfXmth7sUz2Ec+Ybrc3QcZ880Z
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

The other parts (EFUSE and thermal) will probably be sent next week.

[1]: https://lore.kernel.org/linux-mediatek/20260504-mt6323-v1-0-799b58b355ff@protonmail.com/T/#med30fad67a090be35f549231336b2dec295233f6

Tested-by: Ben Grisdale <bengris32@protonmail.ch> # Amazon Echo Dot (2nd Generation)
Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
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
 MAINTAINERS                                        |   8 +
 arch/arm/boot/dts/mediatek/mt6323.dtsi             |   5 +
 drivers/iio/adc/Kconfig                            |  11 +
 drivers/iio/adc/Makefile                           |   1 +
 drivers/iio/adc/mt6323-auxadc.c                    | 299 +++++++++++++++++++++
 drivers/mfd/mt6397-core.c                          |   3 +
 .../dt-bindings/iio/adc/mediatek,mt6323-auxadc.h   |  24 ++
 8 files changed, 353 insertions(+), 1 deletion(-)
---
base-commit: 028ef9c96e96197026887c0f092424679298aae8
change-id: 20260525-mt6323-adc-3befce36cbf2

Best regards,
--  
Roman Vivchar <rva333@protonmail.com>



