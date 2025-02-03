Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E96F3C02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 21:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=t2Ic/mUvT8uzgabPOEs9Gy3ZMLfsuhL5Z8dCC40hBw4=; b=2G6tK6aeoLcQos
	AO3umr+pR2YBsQ1JDIuQzxKis/v1pVBDNApGWTrW92izVKaP7HhIGsHhE7mVy8WwffTvMQUSJWBVV
	fQYYaLSRJkasqjwDIiWUBLlvvF+IVy6xKmXIf/kUV4ns/o7U1iO719KKU0lMTbuKrG4XTNzRqFPX8
	RbQjUhE30Jnt8oevCNbKYnv39dEjDcpm+14TTd6WxAS3Kl/Qzr3lfTw557zUIuf/Fc4G+7Dfwf+QX
	FrIcwjNOnlSnSjMyEV1zDQmQ2ml/uvgK3J8J8X0PGhiW7Y8wEDx08qTTpzqs4Zq9kOMjljsIcccib
	1BJ0eQwddmBECkEkRRPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf3mv-0000000GdFg-1v2d;
	Mon, 03 Feb 2025 21:15:25 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf3L4-0000000GZyY-2uZ7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 20:46:40 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 4F9C925BDA;
	Mon,  3 Feb 2025 21:46:37 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c0Uzq6I7cQ6X; Mon,  3 Feb 2025 21:46:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1738615592; bh=ch2sSufwQ9ybFmXz46vuGZ4BlSmI/UG2rPdI7UCO+uw=;
	h=From:Subject:Date:To:Cc;
	b=EaYzPbJ8i9CmStJfpg5bLTGSb31LL4ihqugdR8jD3gZeIvJgDin+ReN9WrqDeBbx0
	 rBZWyoSK5KPmZw3DjFEBxbOQOxAuzKU0VNReVZNDDQ1aPQV/2g0JOLGEuXJa3S3GT4
	 uCxJ4vDmhpK2RlNmJfvMptlQtAqmMXxGSUkX47hayb/S6QEXqKl0M0U8VWIn137pYJ
	 tUdyBtjafP/0a1HTKlYuJ7ntuVGhRlg1vvp4F94VUVpzNAQPcRG4LrLJEo2q3rHXq9
	 Dsx10FJS0rFonAHgXW8n+kUk5nZYJ0iVSIKGoztn838HaG6YU4kdpsXnJrbfD6anUP
	 48GVv3oM9GyDQ==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH v2 0/5] Add support for the Exynos7870 SoC, along with
 three devices
Date: Tue, 04 Feb 2025 02:16:08 +0530
Message-Id: <20250204-exynos7870-v2-0-56313165ef0c@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABAroWcC/03MQQqDMBCF4avIrJsyidHYrnqP4kKbic4mKYkER
 bx7U6HQ5f/gfTskikwJ7tUOkTInDr6EulTwmgc/kWBbGhSqBhVKQevmQzKdQYH61nSG9Gisg3J
 4R3K8ntizLz1zWkLcTjvL7/pj6n8mS4FCja112rRD7fBhOcUQlmuIE/THcXwAno6L2aYAAAA=
X-Change-ID: 20250201-exynos7870-049587e4b7df
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Conor Dooley <conor@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: Sergey Lisov <sleirsgoevy@gmail.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738615584; l=3581;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=ch2sSufwQ9ybFmXz46vuGZ4BlSmI/UG2rPdI7UCO+uw=;
 b=J+fEoP3qHxLg1PKSdLMmq+bK5SaF74eK/t+rxRkWiH4RHe753F1ESqnPBLAD+XNM6gbJ3LcU1
 0ACmCbqGBweCAHPLO9vqXIH9/XZ5xYTHy0mlUKBoII8rPitNNZ0oCCa
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_124639_008644_7233CA1E 
X-CRM114-Status: GOOD (  10.64  )
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

Samsung Exynos 7870 (codename: Joshua) is an ARM-v8 system-on-chip that was
announced in 2016. The chipset was found in several popular mid-range to
low-end Samsung phones, released within 2016 to 2019.

This patch series aims to add support for Exynos 7870, starting with the
most basic yet essential components such as CPU, GPU, clock controllers,
PMIC, pin controllers, etc.

Moreover, the series also adds support for three Exynos 7870 devices via
devicetree. The devices are:
 * Samsung Galaxy J7 Prime	- released 2016, codename on7xelte
 * Samsung Galaxy J6		- released 2018, codename j6lte
 * Samsung Galaxy A2 Core	- released 2019, codename a2corelte

Additional features implemented in this series include:
 * I2C	- touchscreen, IIO sensors, etc.
 * UART	- bluetooth and serial debugging
 * MMC	- eMMC, Wi-Fi SDIO, SDCard
 * USB	- micro-USB 2.0 interface

The series has commits from me and Sergey, who has given me permission
to upstream their patches with proper attribution.

Here is a list of all sub-series:
 * bootmode	  	- https://lore.kernel.org/all/20250204-exynos7870-bootmode-v1-1-0f17b3033c2d@disroot.org/
 * chipid		- https://lore.kernel.org/all/20250204-exynos7870-chipid-v1-0-0bf2db08e621@disroot.org/
 * gpu			- https://lore.kernel.org/all/20250204-exynos7870-gpu-v1-1-0db4c163a030@disroot.org/
 * i2c	      		- https://lore.kernel.org/all/20250204-exynos7870-i2c-v1-0-63d67871ab7e@disroot.org/
 * mmc			- https://lore.kernel.org/all/20250204-exynos7870-mmc-v1-0-c87cfc72be4a@disroot.org/
 * pinctrl	  	- https://lore.kernel.org/all/20250204-exynos7870-pinctrl-v1-0-77b9800749b7@disroot.org/
 * pmic-regulators	- https://lore.kernel.org/all/20250204-exynos7870-pmic-regulators-v1-0-05adad38102c@disroot.org/
 * pmu-clocks		- https://lore.kernel.org/all/20250204-exynos7870-pmu-clocks-v1-0-a3030ae5bb53@disroot.org/
 * uart			- https://lore.kernel.org/all/20250204-exynos7870-uart-v1-0-06be6aa96284@disroot.org/
 * usb			- https://lore.kernel.org/all/20250204-exynos7870-usb-v1-0-a7753f8183a4@disroot.org/
 * usbphy		- https://lore.kernel.org/all/20250204-exynos7870-usbphy-v1-0-f30a9857efeb@disroot.org/
(Legend: [R]eviewed, [A]pplied)

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
Changes in v2:
- Redo a few commit descriptions.
- Split patchsets into multiple sub-series, subsystem-wise.
- Link to v1: https://lore.kernel.org/r/20250203-exynos7870-v1-0-2b6df476a3f0@disroot.org

---
Kaustabh Chakraborty (5):
      dt-bindings: arm: samsung: add compatibles for exynos7870 devices
      arm64: dts: exynos: add initial devicetree support for exynos7870
      arm64: dts: exynos: add initial support for Samsung Galaxy J7 Prime
      arm64: dts: exynos: add initial support for Samsung Galaxy A2 Core
      arm64: dts: exynos: add initial support for Samsung Galaxy J6

 .../bindings/arm/samsung/samsung-boards.yaml       |    8 +
 arch/arm64/boot/dts/exynos/Makefile                |    3 +
 .../arm64/boot/dts/exynos/exynos7870-a2corelte.dts |  619 ++++++++++++
 arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts    |  606 ++++++++++++
 arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts |  654 +++++++++++++
 arch/arm64/boot/dts/exynos/exynos7870-pinctrl.dtsi | 1035 ++++++++++++++++++++
 arch/arm64/boot/dts/exynos/exynos7870.dtsi         |  722 ++++++++++++++
 7 files changed, 3647 insertions(+)
---
base-commit: df4b2bbff898227db0c14264ac7edd634e79f755
change-id: 20250201-exynos7870-049587e4b7df

Best regards,
-- 
Kaustabh Chakraborty <kauschluss@disroot.org>


