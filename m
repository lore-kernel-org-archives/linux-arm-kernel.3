Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22D68E6F061
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 14:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BmP1dDwsLFzj5qrCNltuy87HlshF0Cny5GbPiZJ/h7o=; b=sE74Xw3Qh06joEUUKg4xGdO5/6
	w1RV1fSCaOFGbSGoS0UYgUgh7IAleoqXaSxtJvEDmJUGzDA1DhOp/OmW+pkTX/r8Rr3Raxn0OxlEQ
	OGnkqlhDzKvoc9wymeaeC9EVbFF+hcQRF/H2poovdO/e/H9fLkk2L8Y7X8uh/c2c4unP0bl3+20Rn
	ewF9T9F0gc1TsIwae77gWO/xKaqo297yaAKAgD3JIIIUZXamOBPAVDSZPFm8Pia6oTUxjt65vMV0c
	7UYNZ59TXutD7CPwcWRmfVuh024LJE/8/pz1TKh6SVTE7/5gvtN8p8y5U+QIVKQshYgIu5N+igxgq
	3D9iDwkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6sRd-00000007IVm-28Nf;
	Fri, 01 Nov 2024 14:16:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6s6T-00000007Ecm-16QR;
	Fri, 01 Nov 2024 13:54:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8C04D5C1083;
	Fri,  1 Nov 2024 08:26:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2502CC4CED1;
	Fri,  1 Nov 2024 08:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730449640;
	bh=TDts9AQyyHimRSBgvjiw7JB16PDCCRdn8ZlqHDAtAyY=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=aJra/82adHsVVg0c55ZyHsnQ29O2ToV/HtsoW8OfwZ0ddl/pHf7ZQtDHp238PnvWb
	 c0f92vKMN+5nDGaClf2bkt7gya8oCiWarx53X7KgF8pbYc+Gh8pQFvB7aOfzWki/Vo
	 XCv2ZmnrVpnoLXOgCs3fjXPVDIE6swPl7HS0+1QV38+P/rcUTHd74VtqIBIlLKIi1c
	 +0bIhTPuFtMF8zM8g77GSOFuPKL5gqNOIqLYGSIIx0TxtNRlLR3NHr6z52NNR8MAmw
	 oz8sKNVjeHYPckTCTFtKxl+COl5ngsXsdaguErR/AlCCNY8hJXnPzyb8mpYJy57tzD
	 K2tiyZocXLJew==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 111B9E67497;
	Fri,  1 Nov 2024 08:27:20 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH RFC v4 0/4] Pinctrl: A4: Add pinctrl driver
Date: Fri, 01 Nov 2024 16:27:16 +0800
Message-Id: <20241101-a4_pinctrl-v4-0-efd98edc3ad4@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOSQJGcC/1WNQQqDMBREryJZNyWJ0diuCoUeoNtSSpp89YMaS
 URaxLs3hC50OTO8NwsJ4BECOWcL8TBjQDfEIA8ZMa0eGqBoYyaCCckZF1TL14iDmXxH2cnyt9B
 cgVQkAqOHGj9J9iD325U8Y9limJz/poNZpOnvklvXLCijOSipy8KIqoCL7jvXoDka1yfRnG/ha
 gfnEQZV1pabmnGr9vC6rj9hIe1K6AAAAA==
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730449638; l=2253;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=TDts9AQyyHimRSBgvjiw7JB16PDCCRdn8ZlqHDAtAyY=;
 b=tb0w3LwxFKvKhqjqjTwr+bTdKqQDRn5BFQheIW0/6we6WINAU7yhQp6BMZNh44V6J+pO7KY4p
 Md15Ea1KqvMAJFlKemu+BDdKckgZIXEk/ZQBA74YbN4+QyD9gVvYmlu
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_065417_421638_946A866B 
X-CRM114-Status: GOOD (  10.86  )
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
Reply-To: xianwei.zhao@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Add pinctrl driver support for Amloigc A4 SoC

I want to find out what kind of solution is feasible to
meet the needs of all parties. This RFC verion is one of them.

All of Amogic SoCs GPIO device requirement is met here by
adding GPIO bank definition instead of the pin definition.
Binding header files will no longer be added to future
SoCs's pin devices.

The pinctrl software only adds insterface of of_xlate to support
for transformation without affecting the overall framework and
is compatible with previous drivers.

The code in DTS file is also readable when using GPIO, as below:

reset-gpios = <&gpio AMLOGIC_GPIO(AMLOGIC_GPIO_X, 6) GPIO_ACTIVE_LOW>;

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Changes in v4:
- Add interface of of_xlate support.
- Add const for some variable.
- Link to v3: https://lore.kernel.org/r/20241018-a4_pinctrl-v3-0-e76fd1cf01d7@amlogic.com

Changes in v3:
- Remove head file from binding.
- Move GPIO define to file *.c.
- Link to v2: https://lore.kernel.org/r/20241014-a4_pinctrl-v2-0-3e74a65c285e@amlogic.com

Changes in v2:
- Use one marco instead of all pin define.
- Add unit name for dts node.
- Link to v1: https://lore.kernel.org/all/20240611-a4_pinctrl-v1-0-dc487b1977b3@amlogic.com/

---
Xianwei Zhao (4):
      dt-bindings: pinctrl: Add support for Amlogic A4 SoCs
      pinctrl: meson: add interface of of_xlate
      pinctrl: meson: Add driver support for Amlogic A4 SoCs
      arm64: dts: amlogic: a4: add pinctrl node

 .../bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml |    2 +
 arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi        |   36 +
 drivers/pinctrl/meson/Kconfig                      |    6 +
 drivers/pinctrl/meson/Makefile                     |    1 +
 drivers/pinctrl/meson/pinctrl-amlogic-a4.c         | 1321 ++++++++++++++++++++
 drivers/pinctrl/meson/pinctrl-meson.c              |    4 +
 drivers/pinctrl/meson/pinctrl-meson.h              |    4 +
 include/dt-bindings/gpio/amlogic-gpio.h            |   50 +
 8 files changed, 1424 insertions(+)
---
base-commit: 58e2d28ed28e5bc8836f8c14df1f94c27c1f9e2f
change-id: 20241012-a4_pinctrl-09d1b2a17e47

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



