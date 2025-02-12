Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CBECC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 05:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=C6wr1dBYEpzuUzUG0xAEsHvQBFVDEd1dJK84QEqoX9M=; b=pXEjx6Q+hya4qw5gk/J0crxYNh
	qwLagNP/PY7dxhPryNpOP5JbQSWNWinIdzbooLES/h4pOjoCGijuQfTUrr8OqGdZLUmZrukzL4E8y
	obRSCMQj7zOO0T+tMQ0QVkZuUlvkvaqShktjZX8tmSkCD+JNyBUQap/9u02mMlMRzHnggppHHmVl+
	6t8JxImYRv/Td3MxqM1Db+HKa+CtvsvKII5WmmgBh01MGelMn7HKmNEUKkR3Dh64Jtq3ZHV2VAQ5c
	RC/0tjKoam5gK0AsPxnq8h1pEJ877dDmf+yEjheK9VrDBWezkkGk9LIdJ8fYncGJMnUO/rDevNki9
	/mgNnqug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti5H3-00000006EsU-1vUA;
	Wed, 12 Feb 2025 05:27:01 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ti5EF-00000006EK3-2lC4;
	Wed, 12 Feb 2025 05:24:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 11A745C5864;
	Wed, 12 Feb 2025 05:23:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4B44DC4CEDF;
	Wed, 12 Feb 2025 05:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739337845;
	bh=dHrGo3MQlhcb+bCCsVoydXD2nFxFqQhq9MWMEMJtsf0=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=uAo1JDSajDjOdGtARdCHKbr06rWf+WGgb//DbXcB3s1LusNEcxyg7K5TOlAB1uw/d
	 6lGxLv7QB13j5Js/2Qn0rwlh9/62E7ARrV6rn3JRi3CaJcAI0/489PHF4sVA19fHGR
	 ebfG4jEsngo2fsAcXIBjbl/YKfsOKJyZZU1i1L+f4jerFjKmnZ+IDe2E4iKibBNkCb
	 ITrSNVgsOR2jcMIz6swONZ1cA3xrLHjOWaVKezIS1YN3nM1qibwpjTPtmqq1Q7l+8b
	 pBTYUADUmrKyV15b0lwJNckaBWT4cYp1kROTvt3LCLw8zOSb2RyqTaZvkem/d+dlvg
	 xfeGI57C8wRGQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10FA0C02198;
	Wed, 12 Feb 2025 05:24:05 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH v5 0/5] Pinctrl: Add Amlogic pinctrl driver
Date: Wed, 12 Feb 2025 13:20:49 +0800
Message-Id: <20250212-amlogic-pinctrl-v5-0-282bc2516804@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALIvrGcC/3XPywrCMBAF0F8pWRvJTF7Vlf8hLtI0rQH7IC1FK
 f1306JQCS7vMPcMM5PBBe8Gcs5mEtzkB9+1MchDRuzdtLWjvoyZIEMBCEBN8+hqb2nvWzuGB0V
 0RkGOrGQlia0+uMo/N/F6i/nuh7ELr+3ABOv0vzUBZVQA06g5lwCny2fjaLuGrNqEOwFVKmAUb
 GmcQKN0oVUq8K8gGYBMBR4FLHLJlZDaFCYVxE5ATAWxfqG0LtBBXlXwKyzL8gaOnmPOdgEAAA=
 =
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739337841; l=3760;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=dHrGo3MQlhcb+bCCsVoydXD2nFxFqQhq9MWMEMJtsf0=;
 b=48ehFmexr5yBzIpiugk/aBUy3SDD2ySYKaPSO1jH0djIjbkaZPDx5ja95qCF5cNLzEZ/H198f
 +RjYNcMPgnMD4tKNn1OuOp6+DkWPuomKh+bYk3D6AceXOK+tVTjpcNj
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_212407_813901_E6358BA0 
X-CRM114-Status: GOOD (  14.24  )
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

Add pinctrl driver support for Amloigc SoCs

Base on the previous discussion,
https://lore.kernel.org/r/20241113-a4_pinctrl-v6-0-35ba2401ee35@amlogic.com
The existed meson driver failed to meet the requirement of the current dt-binding.
So we start this new pinctrl driver to solve problem.

The advantage of this version: Once the source file and binding document
are added, adding dts node will be only operation for subsequent Amlogic SoCs
(such as A4, A5).

The code in DTS file is also readable when using GPIO, as below:
reset-gpios = <&gpiob 6 GPIO_ACTIVE_LOW>;

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Changes in v5:
- Some little modifications were made to bindings and dts according to Rob's suggestions.
- Move source file into driver/pinctrl/meson and fix license issue.
- Link to v4: https://lore.kernel.org/r/20250122-amlogic-pinctrl-v4-0-4677b2e18ff1@amlogic.com

Changes in v4:
- Drop bank-number property, and get information from gpio-ranges property.
- Keep required of pinctrol after patternProperties, and add missing "ranges" for required.
- Add required(pinmux) of function.
- Keep address-cells and size-cells property values, because:
  Previously only represented a register address offset value, now directly represents a register, through 'ranges" which to represent.
- Some little modifications were made to bindings and dts according to Krzysztof's suggestions.
- Link to v3: https://lore.kernel.org/r/20250115-amlogic-pinctrl-v3-0-2b8536457aba@amlogic.com

Changes in v3:
- Move reg and reg-name from pin controller node into gpio-controller node and drop mask property.
- Use gpio-range instead of ngpios property.
- Some little modifications were made to bindings according to Rob's suggestions.
- Fix bug reported by kernel test robot.
- Two pin controller node compressed into one because of register address defined in gpio-controller.
- Link to v2: https://lore.kernel.org/r/20241226-amlogic-pinctrl-v2-0-cdae42a67b76@amlogic.com

Changes in v2:
- Some modifications and optimizations were made to bindings according to Rob's suggestions.
- Refined some details on functions node for bindings. 
- Some source code optimizations were made according to Linus's suggestions.
- Add stand API to generic to deal pinmux propertity.
- Add private reg data to deal with for future SoCs.
- Simplified some unused processing (previously used for extension).
- Sync add to MAINTAINERS files.
- Link to v1: https://lore.kernel.org/r/20241211-amlogic-pinctrl-v1-0-410727335119@amlogic.com

---
Xianwei Zhao (5):
      dt-bindings: pinctrl: Add support for Amlogic A4 SoC
      pinctrl: pinconf-generic: Add API for pinmux propertity in DTS file
      pinctrl: Add driver support for Amlogic SoCs
      arm64: dts: amlogic: a4: add pinctrl node
      MAINTAINERS: Add an entry for Amlogic pinctrl driver

 .../bindings/pinctrl/amlogic,pinctrl-a4.yaml       |  126 +++
 MAINTAINERS                                        |    8 +
 arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi        |  120 +++
 drivers/pinctrl/meson/Kconfig                      |   11 +
 drivers/pinctrl/meson/Makefile                     |    1 +
 drivers/pinctrl/meson/pinctrl-amlogic-a4.c         | 1053 ++++++++++++++++++++
 drivers/pinctrl/pinconf-generic.c                  |  130 +++
 drivers/pinctrl/pinconf.h                          |    4 +
 include/dt-bindings/pinctrl/amlogic,pinctrl.h      |   46 +
 include/linux/pinctrl/pinconf-generic.h            |    4 +
 10 files changed, 1503 insertions(+)
---
base-commit: 4de5110762b94b9978fb8182a568572fb2194f8b
change-id: 20241211-amlogic-pinctrl-22ea61820d0d

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



