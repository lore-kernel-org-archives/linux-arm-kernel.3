Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB251E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Dec 2024 07:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jt0NnJsoHG8DQL5bjLIR153BEhJD7MMnvLNyCfewpR4=; b=3hKjbgepwcCsK5u7d6dkrN1p4q
	OeEHZGR2aEuJyIJ3Ddhg2D81v1if4s8cV3gEsHlEP3tgbjx5hxlQdjgUO+erXcn4LAQOkRu1W0l/y
	j5lbBrkkGKluwaBdEEdXkxByUTvF3PHzjgeXLfTIPaqTfMg+VKGsDns5MvCELXCgFQtKeLsR08Bc2
	Gp1V7T5Z1VBge+J6XIfSao17+fA1fXuLEE0fs5OEPQAeSfurjOka8n4nD5PQYN2spCguCa/ZL57BP
	45Nm7oDj6Nv02PJF9PyjdLDVvbubvZf3qwxRAGB5R4rQjNJD39jjcYCJMwKsK7WQAwe6G1vIJpY7O
	5sLshgNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQilq-0000000FR1y-38vt;
	Thu, 26 Dec 2024 07:59:02 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQikd-0000000FQk4-2EtU;
	Thu, 26 Dec 2024 07:57:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5184FA40D01;
	Thu, 26 Dec 2024 07:55:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CDB3AC4CED1;
	Thu, 26 Dec 2024 07:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735199865;
	bh=8b/59hoXnXDAUbIUEYcQ6psWuniloV83ts4PS5yxSSc=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=SLQqn4xuB6CFv8dg3bnuYbi/1C02O547k/UDrtV12F7KcRWpKUUGMe109J/G/Lqg/
	 +rWTxvjJBw/a8ETfWImCTtHyKFvA0hPv8NwBgihKOckGKyQuUkTPgeZe8FtQz98W3L
	 6k0/DIcmqPOjZMWq0QAjHPrZsjF4zKsvcLeqNlxeAU6ssGg3lCbta173AxGeNX0eqg
	 mWpzL7LerxJiWkKAWRD+XrrXKjOSiJzEr7rd7ScTrkGmPEsoH7bOlqBOjhdeALrnTK
	 hSIQqMwcmbLVzN01MWV9fBuoLvcHuup6w3Q41XZ07+fpG7bCSHmmz4YA/V2jjx7CfI
	 OMdQwBlq5qu1g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5924E77188;
	Thu, 26 Dec 2024 07:57:45 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH v2 0/5] Pinctrl: Add Amlogic pinctrl driver
Date: Thu, 26 Dec 2024 15:57:40 +0800
Message-Id: <20241226-amlogic-pinctrl-v2-0-cdae42a67b76@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHQMbWcC/3WNwQ6CMBBEf4Xs2TXdBUU9+R+GQ9NW2AQoaUmjI
 f13K/Hq8U1m3mwQXRAX4VZtEFySKH4uwIcKzKDn3qHYwsCKG2Ii1NPoezG4yGzWMCKz02e6sLL
 KQlktwT3ltRsfXeFB4urDez9I9E3/uxKhwoZUy21dn4iu91/jaPwEXc75A8+qYYuwAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735199863; l=2379;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=8b/59hoXnXDAUbIUEYcQ6psWuniloV83ts4PS5yxSSc=;
 b=g7vOqRgzWD6wbJu6ZnJIYzXnuvYrSKYObzaPPRDDncvr3/7T5Uh2NGMiBOE6kG9mOYKexn8bu
 c9P5+f3KiSADr1WYPYvuzAxx620iDH4bbdU8mO1fDqSnc8WFlMx9Ieu
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241225_235747_715440_E78A37B2 
X-CRM114-Status: GOOD (  12.64  )
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
      dt-bindings: pinctrl: Add support for Amlogic SoCs
      pinctrl: pinconf-generic: Add API for pinmux propertity in DTS file
      pinctrl: Add driver support for Amlogic SoCs
      arm64: dts: amlogic: a4: add pinctrl node
      MAINTAINERS: Add an entry for Amlogic pinctrl driver

 .../bindings/pinctrl/amlogic,pinctrl-a4.yaml       |  155 +++
 MAINTAINERS                                        |    8 +
 arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi        |  133 +++
 drivers/pinctrl/Kconfig                            |   18 +
 drivers/pinctrl/Makefile                           |    1 +
 drivers/pinctrl/pinconf-generic.c                  |  130 +++
 drivers/pinctrl/pinconf.h                          |    4 +
 drivers/pinctrl/pinctrl-amlogic.c                  | 1047 ++++++++++++++++++++
 include/dt-bindings/pinctrl/amlogic,pinctrl.h      |   68 ++
 include/linux/pinctrl/pinconf-generic.h            |    4 +
 10 files changed, 1568 insertions(+)
---
base-commit: 4de5110762b94b9978fb8182a568572fb2194f8b
change-id: 20241211-amlogic-pinctrl-22ea61820d0d

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



