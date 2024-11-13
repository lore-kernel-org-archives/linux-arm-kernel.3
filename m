Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEF78D41C0F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 07:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6dlE562LsAkro/FX5wMHOoqr7IPsB/e0KRTnKMvneDE=; b=imiXvHaoCZrmgXH4kihV2eqZfW
	hdb9HrwhasWiOjnRDymoFdpSXgVr/svIZ3xYoPVNaAjG2hxs2KgoZb1JooddFpoIhZopXP4s0N+9Y
	eAHYc43k6mXmwy4oa49WK16uoH4ui1UyyLXM0ZP+fe7q3aw5CN76NXYsquhZ50wwd/rGsrRPPDat/
	d7O+j7vFAXlY5zDY6ZxaU4/nW0QW5pCLZXEsijZT6TIYs3p1GiwnP61U3efzbMv2G4F8kOEN4qMoz
	9xHdPoTo1rroDa0UaHTu8LRZuYP08TScOLGEc+jetpiHkg0bRG6D1l8M1OYvSPIwLLIzD6XLK4NTD
	9OV0Sz/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tB7sY-000000060of-3VK6;
	Wed, 13 Nov 2024 07:33:31 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tB7ot-00000005zqZ-0cWi;
	Wed, 13 Nov 2024 07:29:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 12BDA5C57F5;
	Wed, 13 Nov 2024 07:28:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 01BD1C4CED0;
	Wed, 13 Nov 2024 07:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731482982;
	bh=jTZlTZlZlc/8oe7tDDpKMU27TjCaQVXWIYr+dhvV8jI=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=kgsNtBFPiSUBR4Koe4a+lmtEI4IyQLsuaxD5Pnr4rjGjUvzjDvYoZA70VF0wtUr6C
	 Hx8eTjL3EXnP/xdlhQGueDNpYK4V36oa7nWqJLbi7cWFiTdKyWCSxVpTVSQgmZ5GY4
	 uwzH8/gF2NLSU+HW3OCopmNZujev3LTe17Z8O7HoqIz1I3ZcFI3sttEX5S0VpnPKEi
	 IbXN5PqVbLgcvI0n6AaWVhWXCxXJa3RG3/R12AGxe7fqZ1Wp+L9nd6LLaCRaO+Rixa
	 Kh+qKPxlYPF/VAAutuZqVkhqQ+SG0MC5Oy2kW8MtFr6Y4ZbyeC1HU5wxMmeWdPY1VF
	 TQI9N8ydEJFtg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D81ECD41C00;
	Wed, 13 Nov 2024 07:29:41 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH v6 0/5] Pinctrl: A4: Add pinctrl driver
Date: Wed, 13 Nov 2024 15:29:38 +0800
Message-Id: <20241113-a4_pinctrl-v6-0-35ba2401ee35@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGJVNGcC/2XP0QqCMBTG8VeRXbfY5tFZV71HRKyzow7UxYxRh
 O/eDCLFy2/w+3P2ZiMFRyM7Zm8WKLrR+SGNcpcxbM3QEHc2baaEAimk4gaudzfgI3RcHKy8KSM
 1gWYJ3APV7vmNnS9pt258+PD6tqOaX38ZWGai4oLnpMGUBaqqoJPpO9843KPv2RyK+RJXK5wnT
 LqsrcRaSKu3GP446RWGGdf2UJHF3FjY4mKB17+PxXw2lAJJCoRKrPE0TR/FIPJkXQEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731482979; l=3167;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=jTZlTZlZlc/8oe7tDDpKMU27TjCaQVXWIYr+dhvV8jI=;
 b=m4K96oRnL5/UOrRY29MRVvvw544CUEkerxoU9h9+7gESaPC+1p4F26yp8bt0b3sdQ+/DisqvJ
 TQPy19ewAEQCS6TZcCKjgOP75oiW4iuhjTXIynPf891+IeErHIFnSoj
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_232943_316373_F31BCD40 
X-CRM114-Status: GOOD (  11.65  )
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

All of Amogic SoCs GPIO device requirement is met here by
adding GPIO bank definition instead of the pin definition.
Binding header files will no longer be added to future
SoCs's pin devices.

The pinctrl software only adds insterface of of_xlate to support
for transformation without affecting the overall framework and
is compatible with previous drivers.

The code in DTS file is also readable when using GPIO, as below:

reset-gpios = <&gpio AMLOGIC_GPIO_X 6 GPIO_ACTIVE_LOW>;

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Changes in v6:
- Adjust code formatting and style.
- Remove "#gpio-cells" definition from amlogic,meson-pinctrl-common.yaml
  and add them in all amlogic,meson-pinctrl-XXX.yaml with const: 2, and then
  add amlogic,meson-pinctrl-a4.yaml(copy form  amlogic,meson-pinctrl-a1.yaml) with const: 3.
- Link to v5: https://lore.kernel.org/r/20241112-a4_pinctrl-v5-0-3460ce10c480@amlogic.com

Changes in v5:
- Modify if to switch.
- Dropped parameter combination, bank and offset as independent parameter passing
- Link to v4: https://lore.kernel.org/r/20241101-a4_pinctrl-v4-0-efd98edc3ad4@amlogic.com

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
Xianwei Zhao (5):
      dt-bindings: pinctrl: move gpio-cells property
      dt-bindings: pinctrl: Add support for Amlogic A4 SoCs
      pinctrl: meson: add interface of of_xlate
      pinctrl: meson: Add driver support for Amlogic A4 SoCs
      arm64: dts: amlogic: a4: add pinctrl node

 .../bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml |    3 +
 .../bindings/pinctrl/amlogic,meson-pinctrl-a4.yaml |   80 ++
 .../pinctrl/amlogic,meson-pinctrl-common.yaml      |    3 -
 .../pinctrl/amlogic,meson-pinctrl-g12a-aobus.yaml  |    3 +
 .../amlogic,meson-pinctrl-g12a-periphs.yaml        |    3 +
 .../pinctrl/amlogic,meson8-pinctrl-aobus.yaml      |    3 +
 .../pinctrl/amlogic,meson8-pinctrl-cbus.yaml       |    3 +
 arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi        |   36 +
 drivers/pinctrl/meson/Kconfig                      |    6 +
 drivers/pinctrl/meson/Makefile                     |    1 +
 drivers/pinctrl/meson/pinctrl-amlogic-a4.c         | 1324 ++++++++++++++++++++
 drivers/pinctrl/meson/pinctrl-meson.c              |    4 +
 drivers/pinctrl/meson/pinctrl-meson.h              |    4 +
 include/dt-bindings/gpio/amlogic-gpio.h            |   45 +
 14 files changed, 1515 insertions(+), 3 deletions(-)
---
base-commit: 58e2d28ed28e5bc8836f8c14df1f94c27c1f9e2f
change-id: 20241012-a4_pinctrl-09d1b2a17e47

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



