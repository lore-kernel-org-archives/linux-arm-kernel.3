Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B87CC28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 03:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PI8imn5enacRy4k0Uw3T+rGBrPBsfBuLoQOkvC+rUKY=; b=WULVlFSlpwNiVoCvK0fcgiOCF3
	bBQi6EvVo4pVuLRdB4D0vTrzReOEP7uc72Tz65jVo1U+x9JEfyq9QG+s3cGR0JchV1qpqGxsGfw1C
	bgHnTBXKfpdrE5P4uka2vV+WsUDPiV9qURdqOSNyxsHeEMn1b3V1UWsJSRkLwE8nZ4nn8v5+vmPF8
	iRbUUncuaxPROX2x8G0q1ELY43GWsBY12a8bYR7xzqypbMub+OI01/D3+HNauaDVmvRF/Bn6btnwY
	ZbJdWgxPdBr9BjTRhPWqSbWQWwv36hpiKLUg0PcgNQLK7oLZElgy0yRBdRyrBw2D0aH6sRYrO3ff3
	WzBtqDFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trq26-00000004UmU-2Gsf;
	Tue, 11 Mar 2025 03:11:54 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trpyp-00000004UIA-3vpD;
	Tue, 11 Mar 2025 03:08:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 926E9A467D1;
	Tue, 11 Mar 2025 03:03:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5203AC4CEEC;
	Tue, 11 Mar 2025 03:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741662510;
	bh=6YFlKkmJqvHypt4lt2xcZRr3utLgEQlOW0fxh7lNRnQ=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=hvpweZMC7YwAnjQAJe4vr934bW6gdvtiy8YaZUPj7/AbPkF1AH9uvbsL8Z/mZce4i
	 0j0Kl3u/JUN0WMxTqLQgaZzVkjdTp2SVLtWKo1iJHxntziPpFXt2TnJ5gcWM7q/izK
	 le8bVbSX7WTlDOrWjzK+/Vo/lARHOAqOOkeQihHdaXZBwQnKas7KKoZ2sVcqb/nbSs
	 Tv1OXxpwGUu+YAGTrwx0DPhf4xPt26baG46MbRawDKHGG99ydHYJiSNZCLicdn6384
	 C8O+hxPfEtlNm52cvdal1uBk0RZzQIBNnO3VkpDoQwSFrgY8ZEnAENStIO2hANdwuz
	 feccazQM0Kbew==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42B20C28B2E;
	Tue, 11 Mar 2025 03:08:30 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH v5 0/4] Add GPIO interrupt support for Amlogic A4 and A5
 SoCs
Date: Tue, 11 Mar 2025 11:08:26 +0800
Message-Id: <20250311-irqchip-gpio-a4-a5-v5-0-ca4cc276c18c@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACupz2cC/23QzU7DMAzA8VeZcibITux9cOI9EIfUdVtLbCkpq
 kBT3510F4bW49+Sf5Z8dZMW08m97K6u6GyT5UsNfto5GdKlV29tbRcgEAaM3sqnDDb6frTsE/n
 E/gjCkJB4L+Tq4li0s+8b+vZee7DpK5ef240Z1+nKMQQ8bXEzevBRjkqUlELbvabzR+5NniWf3
 QrO4Q4J+00kVESYGwQGaZgfkfiHROBNJFYEVeUAkUOn6RGhe+SwiVBFWojpRPWFjM1/ZFmWX6f
 P8BaFAQAA
To: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741662508; l=1918;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=6YFlKkmJqvHypt4lt2xcZRr3utLgEQlOW0fxh7lNRnQ=;
 b=3MveDm9G6ntXWpZhH6/St+ViGjIaVCdHUE+6VbXi9dIntkMm4Da3JSu+SLSFPuRx1RdkvfQhy
 0r385KlVEghDWnVwJUNckZRD/te9Ox+CdrYCQ/XHusuCljFuKQB1OSW
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_200832_116655_7EA25C9F 
X-CRM114-Status: UNSURE (   9.44  )
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
Changes in v5:
- Make minor changes of source code according to Thomas's suggestion.
- Link to v4: https://lore.kernel.org/r/20250307-irqchip-gpio-a4-a5-v4-0-d03a9424151b@amlogic.com

Changes in v4:
- Make minor changes for bindings as Conor and Rob suggest.
- Format adjustment of source code according to Thomas's suggestion.
- Link to v3: https://lore.kernel.org/r/20250305-irqchip-gpio-a4-a5-v3-0-1eec70352fea@amlogic.com

Changes in v3:
- Fix warning when run 'make ARCH=arm64 dtbs_check'.
- Fix warning when run 'make ARCH=arm64 Image W=1'.
- Rebase file amlogic-a4.dtsi.
- Link to v2: https://lore.kernel.org/r/20250226-irqchip-gpio-a4-a5-v2-0-c55b1050cb55@amlogic.com

Changes in v2:
- Use if/then instead of direct modification minimum value for property 'amlogic,channel-interrupts'.
- Add register offsets to the parameter structure to reduce definition of a function.
- Link to v1: https://lore.kernel.org/r/20250219-irqchip-gpio-a4-a5-v1-0-3c8e44ae42df@amlogic.com

---
Xianwei Zhao (4):
      dt-bindings: interrupt-controller: Add support for Amlogic A4 and A5 SoCs
      irqchip: Add support for Amlogic A4 and A5 SoCs
      arm64: dts: Add gpio_intc node for Amlogic A4 SoCs
      arm64: dts: Add gpio_intc node for Amlogic A5 SoCs

 .../amlogic,meson-gpio-intc.yaml                   | 19 ++++++++-
 arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi        | 19 +++++++++
 arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi        | 12 ++++++
 drivers/irqchip/irq-meson-gpio.c                   | 48 +++++++++++++++++-----
 4 files changed, 86 insertions(+), 12 deletions(-)
---
base-commit: 73e4ffb27bb8a093d557bb2dac1a271474cca99c
change-id: 20241213-irqchip-gpio-a4-a5-80c50a1456c4

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



