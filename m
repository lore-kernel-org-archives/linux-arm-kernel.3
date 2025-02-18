Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA52EC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 19:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9vvr543lNdqWeEeVZFDtRvS5PuCDX5cFH7xFDzQelZ8=; b=wl3wPMTDibBOOY
	o+nzZJxUI1VCKUSQ8Wt37g8CGRf8kGWPAjStizGBXpLUEgvyCZP0cHmwIIiz6BQTWKPwCglAXcmwU
	rMHISp3WqO/2TNqQw50qv63MNJ4EKFoQa96jt6Ccqm0jYLzLBuFL668lObBIUvVIcL75iFJEM5lYm
	IixGAK2x9urqklS7FEs0u/tGr+GCtLoGBVd7hfzUm/e8rOKaPEkbnQ8Ztm5LBCitv1xENzR2Ume5f
	38d95jnVFzS5G4w1v7Mo88/6A/0dZfelCp9Q3q9kBrc9MZXzK7MPM+DfvA1I0cJlRFFmHXjXuQWoC
	LNCKNfaGNv/3K9fV3wlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkTYt-00000009deY-04CR;
	Tue, 18 Feb 2025 19:47:19 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkSsr-00000009URf-31tK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 19:03:55 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 201A725F6B;
	Tue, 18 Feb 2025 20:03:52 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bCOxpRDHNYGU; Tue, 18 Feb 2025 20:03:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1739905423; bh=JTd1l3l1TUPJLaW1itWZ16kwRJWkduYtTgS2cfEjA+k=;
	h=From:Subject:Date:To:Cc;
	b=Za0AaPL2U9L8yMJcz0uDqbndexvG3yPP67NXzhVQcHxW9bb2jUNVHhSEwHXg1JKGV
	 tnZez/Z/zhjnLnhCl94uzzM/PZGQZKW3TAPxsXLzppYqZ7DHJGZmxWhQkTG/nq2aQp
	 Zte+QSuAnA22xKT4GdgOm15zo6+l7LFMAM03c06Y3UMYJc9oSVwU9xFfZF5VnoFYwP
	 qDM71GHd7E6eBb7JfRzW9s5kxCFAU9cpU3vdjMyIAU7Tdpl5CdGcTT/eBAMXBierBT
	 iq8AQtMiqe2bXXoJbpqqkq5SPh0emclmCT1RCHrQqJcszPU7X4cWtbQ+39z30kRN84
	 xwYUg4FosNv7Q==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH v3 0/7] Add support for the Exynos7870 SoC, along with
 three devices
Date: Wed, 19 Feb 2025 00:33:10 +0530
Message-Id: <20250219-exynos7870-v3-0-e384fb610cad@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG7ZtGcC/1XMSwqDMBSF4a1Ixk25eduOuo/SgZobzcSURIIi7
 r1RKOjwHPi/lSSMHhN5ViuJmH3yYSxD3CrSDc3YI/W2bMKBK+DAKM7LGJKpDVCQD1UblK2xjpT
 gG9H5+cDen7IHn6YQl8PObH//jDgzmVGgvNXWSaMb4eBlfYohTPcQe7JDmZ9jeYl5iZUWTDCt0
 EF3jbdt+wFjqvRd4wAAAA==
X-Change-ID: 20250201-exynos7870-049587e4b7df
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739905418; l=3985;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=JTd1l3l1TUPJLaW1itWZ16kwRJWkduYtTgS2cfEjA+k=;
 b=Kit8dV9N/JF0doGFtT8JtyemUTutD5Nd9US4sk2RKh4z7iLlxy1gnSlDBUvmQu4MlO7ic74NT
 OxOgFHVjgqsAAfQzepjG4Kvn35jOlJZ1KjWS+BZwCT3/Py7XVDnz5OR
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_110354_030085_28907D0E 
X-CRM114-Status: GOOD (  11.45  )
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

Here is a list of all sub-series:
 * bootmode	  	- https://lore.kernel.org/all/20250204-exynos7870-bootmode-v1-1-0f17b3033c2d@disroot.org/
 * gpu			R https://lore.kernel.org/all/20250204-exynos7870-gpu-v1-1-0db4c163a030@disroot.org/
 * i2c	      		A https://lore.kernel.org/all/20250204-exynos7870-i2c-v1-0-63d67871ab7e@disroot.org/
 * mmc			- https://lore.kernel.org/all/20250219-exynos7870-mmc-v2-0-b4255a3e39ed@disroot.org/
 * pinctrl	  	- https://lore.kernel.org/all/20250219-exynos7870-pinctrl-v2-0-1ff9b10bf913@disroot.org/
 * pmic-regulators	- https://lore.kernel.org/all/20250219-exynos7870-pmic-regulators-v2-0-1ea86fb332f7@disroot.org/
 * pmu-clocks		- https://lore.kernel.org/all/20250219-exynos7870-pmu-clocks-v3-0-0d1e415e9e3a@disroot.org/
 * uart			- https://lore.kernel.org/all/20250219-exynos7870-uart-v2-1-c8c67f3a936c@disroot.org/
 * usb			- https://lore.kernel.org/all/20250219-exynos7870-usb-v2-0-1de41a89c9d4@disroot.org/
 * usbphy		- https://lore.kernel.org/all/20250219-exynos7870-usbphy-v2-0-b8ba4e7a72e9@disroot.org/
(Legend: [R]eviewed, [A]pplied)

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
Changes in v3:
- Added patches from https://lore.kernel.org/all/20250204-exynos7870-chipid-v1-0-0bf2db08e621@disroot.org/
- Fix devicetree formatting according to the devicetree style guide.
- Take over ownership of patches by the co-author, upon their request.
- Link to v2: https://lore.kernel.org/r/20250204-exynos7870-v2-0-56313165ef0c@disroot.org

Changes in v2:
- Redo a few commit descriptions.
- Split patchsets into multiple sub-series, subsystem-wise.
- Link to v1: https://lore.kernel.org/r/20250203-exynos7870-v1-0-2b6df476a3f0@disroot.org

---
Kaustabh Chakraborty (7):
      dt-bindings: hwinfo: samsung,exynos-chipid: add exynos7870-chipid compatible
      dt-bindings: arm: samsung: add compatibles for exynos7870 devices
      soc: samsung: exynos-chipid: add support for exynos7870
      arm64: dts: exynos: add initial devicetree support for exynos7870
      arm64: dts: exynos: add initial support for Samsung Galaxy J7 Prime
      arm64: dts: exynos: add initial support for Samsung Galaxy A2 Core
      arm64: dts: exynos: add initial support for Samsung Galaxy J6

 .../bindings/arm/samsung/samsung-boards.yaml       |    8 +
 .../bindings/hwinfo/samsung,exynos-chipid.yaml     |    1 +
 arch/arm64/boot/dts/exynos/Makefile                |    3 +
 .../arm64/boot/dts/exynos/exynos7870-a2corelte.dts |  629 ++++++++++++
 arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts    |  617 ++++++++++++
 arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts |  665 +++++++++++++
 arch/arm64/boot/dts/exynos/exynos7870-pinctrl.dtsi | 1022 ++++++++++++++++++++
 arch/arm64/boot/dts/exynos/exynos7870.dtsi         |  720 ++++++++++++++
 drivers/soc/samsung/exynos-chipid.c                |    1 +
 9 files changed, 3666 insertions(+)
---
base-commit: e5d3fd687aac5eceb1721fa92b9f49afcf4c3717
change-id: 20250201-exynos7870-049587e4b7df

Best regards,
-- 
Kaustabh Chakraborty <kauschluss@disroot.org>


