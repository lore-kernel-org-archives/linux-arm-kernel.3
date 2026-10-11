Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25F53CA9EC7
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Oct 2026 18:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LVgYSY2UxISntRQ+WN3hTQeIMTkiy9umGiKAb6XsNSQ=; b=serxS20cyckDDsLbSeugu87ig8
	3h+TYxR+89P/YgkOIXOL43Wu9XjIn8kWkbE/EWcWZet3qBvS1aXK7etDb4Ma7851xTIfg8Hmj6n9r
	l13gvJeVC6FOMJ4sDvcbucEH1OaPFyEtBVuFw285CTM9+WyyeZYIv+oCKvJFPht3WBTd31MF4k5sQ
	uDDbYiTwEiMsa7x+QuO3SVHCgUtQz/2Iq1aXihSPA25NqCoDh9Pp7ecNdRj2n4AvqtMyS0TD4uTcs
	PC39mMDZQTx+FQRZRNbsmEwLtcI3BEQx0nJgpdTEy81hPIh72bS4Qrt7iTPFfur0L14BjS/zNn5aw
	G8lRA6CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFy6O-00000009HAk-291K;
	Sun, 11 Oct 2026 18:16:52 +0000
Received: from mail.nozomi.space ([139.162.184.125])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFy6L-00000009H9P-2HyD;
	Sun, 11 Oct 2026 18:16:51 +0000
From: =?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal@nozomi.space>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nozomi.space;
	s=mail; t=1791742596;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=LVgYSY2UxISntRQ+WN3hTQeIMTkiy9umGiKAb6XsNSQ=;
	b=0She3xN/8VN2Z7OQ3s5cWgL0l6SaoRYFz+y0rmQPZiYwZcdJg85cw7ZH7EI6arBvRkgIA3
	62qtNpCKgNfh9sceDizfxQhay7jtljTEeFt7JunR9UW7cZ+TOGgsM5CaWLkLnI711nZO88
	RyvkRvcmEVIXYdM2hzKCpb3JfaGAqWBTJWjlRUAH7t2Mvb3QjVhADTS2+17vmrdxNvzoxm
	DEXnofsyla/KP9WLFF0XDFaDdoC5YxMC0l1Z7DVfiz5/V9cHGGwnZtxKPgVhyz/FEaQptv
	mQwRGZJ2Ht8v3waIqLUWM7vDrXj/Adqnex/UAZfIz9LtDkjvnF0MX/gFqqgRJg==
To: linux-input@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jikos@kernel.org,
	bentiss@kernel.org,
	dmitry.torokhov@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	allencl_lin@hotmail.com,
	tylor_yang@himax.corp-partner.google.com,
	felix@kaechele.ca,
	dianders@chromium.org,
	=?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal@nozomi.space>
Subject: [PATCH v6 0/3] HID: Add support for the Himax HX83102J touchscreen
Date: Sun, 11 Oct 2026 20:16:30 +0200
Message-ID: <20261011181633.1778969-1-michal@nozomi.space>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_111649_757273_04211B83 
X-CRM114-Status: GOOD (  17.51  )
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

This series adds support for the touch function of the Himax HX83102J,
a touch and display driver integrated (TDDI) controller that reports HID
packets over SPI. It is used in the MediaTek MT8188 based Lenovo
Chromebook Duet ("Ciri").

As Krzysztof suggested, I have taken over the series and rewritten the
driver along the lines of hid-goodix-spi instead of cleaning up the
vendor code. Allen Lin and Tylor Yang are credited with Co-developed-by,
since the protocol, the firmware loading sequence and the heatmap
handling come from their code.

On Ciri the controller has no flash, so the firmware is loaded from a
file (himax_i2chid_1002.bin or himax_i2chid_1003.bin, depending on the
panel, the names ChromeOS uses). These files are not in linux-firmware.

Tested on Ciri (sku0, BOE panel): touch, stylus, display off and on,
suspend/resume and reloading the module.

The firmware report descriptor declares feature report 68 (usage
0xff0000c5), which the driver does not serve, so hid-multitouch logs
"failed to fetch feature 68" once per probe. Touch works regardless.

Changes in v6:
- Take over the series and use Allen's full name (Krzysztof).
- dt-bindings: describe how reset-gpios differs from
  display-reset-gpios (Krzysztof).
- dt-bindings: use unevaluatedProperties and drop the properties that
  only repeated the referenced schemas.
- Squash the four driver patches and rewrite the driver: a standard
  module_spi_driver() with devm resources, no kerneldoc for standard
  functions, no __func__ in messages, no probe message, no CONFIG_OF
  conditionals or .owner, dev_err_probe() in probe (Krzysztof).
- Rename the driver to hid-himax-spi (CONFIG_HID_HIMAX_SPI), like
  hid-goodix-spi.
- Power the touch function up from a work item when the panel has been
  prepared, so loading the firmware doesn't delay the panel, and drop
  the unexplained 2 s and 1 s delays of the vendor code.
- Request and validate the firmware once and keep it, so resume doesn't
  need the file system. Check every offset and size taken from the
  image.
- Keep the HID device across power cycles instead of recreating it.
- Request the interrupt in probe, disabled until the HID device exists,
  and take its trigger from the device tree.
- Retry a failed power up when the panel is prepared again, and pass
  -EPROBE_DEFER from the panel lookup through.
- Size the heatmap buffers for an odd number of nodes, and use
  hid_safe_input_report().
- Use crc32c() instead of an open-coded CRC-32C.
- Only reset the IC when reading the event stack fails, not when the
  HID core rejects a report.

v5: https://lore.kernel.org/all/20261003142741.48634-1-michal@nozomi.space/
v4: https://lore.kernel.org/all/TY0PR06MB56110754EB9D827BE3304A259E0F2@TY0PR06MB5611.apcprd06.prod.outlook.com/




Michał Kopeć (3):
  dt-bindings: input: Add Himax HX83102J touchscreen
  HID: Add Himax HX83102J SPI touchscreen driver
  arm64: dts: mediatek: mt8188-geralt-ciri: Add the touchscreen

 .../input/touchscreen/himax,hx83102j.yaml     |   98 ++
 MAINTAINERS                                   |    7 +
 .../dts/mediatek/mt8188-geralt-ciri-sku1.dts  |    4 +
 .../dts/mediatek/mt8188-geralt-ciri-sku3.dts  |    4 +
 .../dts/mediatek/mt8188-geralt-ciri-sku5.dts  |    4 +
 .../dts/mediatek/mt8188-geralt-ciri-sku7.dts  |    4 +
 .../boot/dts/mediatek/mt8188-geralt-ciri.dtsi |   33 +
 drivers/hid/Kconfig                           |   13 +
 drivers/hid/Makefile                          |    1 +
 drivers/hid/hid-himax-spi.c                   | 1300 +++++++++++++++++
 10 files changed, 1468 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/himax,hx83102j.yaml
 create mode 100644 drivers/hid/hid-himax-spi.c


base-commit: fd179f8a05be3ccae366b9b96e176b51fbe54aab
-- 
2.56.0


