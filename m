Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A097C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 07:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WZx1lKnvUFFvjznz9cFpFooGmUr8X3FryadFLwnTQJI=; b=rHrpTKz3YTlMy95xZ/LvOz1zgF
	Actq0dDyMpL37DbIZ872nmZ99M1bAOlrDa2Q8kqZdpsSj4MaLda1nKbqAh63KLd0aJq9xCF3ad+47
	BwjE+K0aAiZ7fQDOpHNEltEVf7YOF1UImocy998Wcj/2nmy/UiO3SE2YJT+8H5yKeVIwjC/QqpYCG
	ge0wN/CYwXxjlZVhEBCoTSZ/X+rpgUM9JEVL8RNz7hOoiaaY0DhvLZ60JryGSt50jIkx4OQPYyui5
	tjN72edUyOIY+oRqLbS5OLx8TkBgXBZoWOmnd0nY0VPX8hBJIvvmSg+J4+M8Tb38uhCkLr1ueepAd
	Qtye+anQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkeYg-0000000BGEO-1mjs;
	Wed, 19 Feb 2025 07:31:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkeW4-0000000BFQO-1APi;
	Wed, 19 Feb 2025 07:29:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 166625C5450;
	Wed, 19 Feb 2025 07:28:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E2189C4CED1;
	Wed, 19 Feb 2025 07:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739950147;
	bh=ImNpnsptW8WJoO1olJWkaeTDPYynu8aJPZ10S0NXgBA=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=nQGIpjjE8MunxA3EVXwvWneVxXkqthRw3GURkUTEkvix+4NvAlFmGnMa+U+d7ucvs
	 MucX/A+XZo/Me0dprIbCJCVQHauMZnzCq4eOS5M3Wo27gR6xbUTCmxUF+CVckBmRUo
	 CsMgfYm1qj4J4gY2Wj4dB69y1f94pO+Xxigx6r3PoQ2fdmo19YyUJJBvHavORTXWeI
	 k9Q/xg+tjDYfYukhyUPF+qYnmOgToMar1oKk+wWvPcYMHNoK7frYm63Ya46oDwlK63
	 YCv6coKSjdf3L7V/MmGySFlIAfKjcFb6c/3XDISv+UO37RlbCrl0xIeQWt3O5tb4+d
	 PrWa7jyjS3Ctw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D02E2C021AA;
	Wed, 19 Feb 2025 07:29:06 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH 0/4] Add GPIO interrupt support for Amlogic A4 and A5 SoCs
Date: Wed, 19 Feb 2025 15:29:02 +0800
Message-Id: <20250219-irqchip-gpio-a4-a5-v1-0-3c8e44ae42df@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD6ItWcC/x3MQQqAIBBA0avErBtQ04iuEi3EJp2NmUIE4t2Tl
 m/xf4VCmanAOlTI9HDhK3bIcQAXbPSEfHSDEkpLJSfkfLvACX3iC61Ga3ARzggrtZmdhh6mTCe
 //3TbW/sAeJI412QAAAA=
To: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739950145; l=903;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=ImNpnsptW8WJoO1olJWkaeTDPYynu8aJPZ10S0NXgBA=;
 b=kBJy8i3DWBxIZsOOmE/IltkEkpIMhPO6n8vGPuyAvcvoNrKq3atiLHkfjy9kjHyRTRrWpPILK
 h7FUOk0a6/lBs1Dqwb5WzEfHSgZMzdE7hoJS3uooL02uyvXMD3vWlA5
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_232908_364566_0A461C36 
X-CRM114-Status: UNSURE (   9.17  )
X-CRM114-Notice: Please train this message.
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

This patch adds GPIO interrupt support for Amlogic A4 and A5 SoCs

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Xianwei Zhao (4):
      dt-bindings: interrupt-controller: Add support for Amlogic A4 and A5 SoCs
      irqchip: Add support for Amlogic A4 and A5 SoCs
      arm64: dts: Add gpio_intc node for Amlogic-A4 SoCs
      arm64: dts: Add gpio_intc node for Amlogic-A5 SoCs

 .../amlogic,meson-gpio-intc.yaml                   |  5 +-
 arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi        | 21 ++++++++
 arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi        | 12 +++++
 drivers/irqchip/irq-meson-gpio.c                   | 61 ++++++++++++++++++++++
 4 files changed, 98 insertions(+), 1 deletion(-)
---
base-commit: 953913df9c3ab6f496c6facd5aa7fc9f2f847ac2
change-id: 20241213-irqchip-gpio-a4-a5-80c50a1456c4

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



