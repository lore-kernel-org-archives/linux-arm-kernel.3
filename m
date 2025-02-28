Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2BF4C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 19:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rsE6Z8pefMtcrNqizvA2kbwa2MIu2oj2aEETrBu+PkI=; b=S6ANU4O0o1QjQm
	FBDfyXn2UfHYvw/Mzz5G9F7EnMoPH8py4LevYfNShpXPhmvFRr0/THChRPSM2s22x0fC8e6FHJPmS
	mVkVlsnp36zPWtk8Prn8f409kFp6Pto1JEzNMXBgMc370NtHwVkA+Poc01/EKvLXVL8l9i1EvaBhg
	8S7hbQ52J5Y6Q56DMt6V87VJUZdgaI6b2DbPAXY2Zu9vSLADHfPfWgqQYpf22juxyTSArNSo58Xjn
	bU12/B7SlrrqigQCSpdX7lvNY/ml8g8S4MtyAK3ob4srpM67YbtlDS8ZzrpE5uZHIf9kj5YJzaEj4
	R0nnKDr8srVMPh40cwhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to6Su-0000000CRfI-4Buk;
	Fri, 28 Feb 2025 19:56:09 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to6KZ-0000000CPMb-3hJL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 19:47:33 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 7DE0825CD8;
	Fri, 28 Feb 2025 20:47:30 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cMtjQdeiNtx0; Fri, 28 Feb 2025 20:47:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1740772045; bh=L0vW+9BMQ6QnwnUmlEJKpaiyKdFPAJ2WF5bcFyFpTiQ=;
	h=From:Subject:Date:To:Cc;
	b=KPKGk+31v4GHB/NlFULZ/ylU3PaJK/OhdL3PJupbOEPuILXc7Ke21zd/QEWjUhU3g
	 qWrm0ZGo2xoFGSQt1CtYoI/O8zx9MZ28YIRECLsjUHpsZNoA/aMZcW9/lwCZXXAhd3
	 BKdffwPEUWPxIbEhvpm2KVPNi7mjAclGSy7VzFEPkw4UCCLQRjHbCFMNwrnnnfyzRQ
	 GIMluSXCoyU/HbXWcd511QU8SNvYzoh152WQV2rh5u9cq6IzClwy2xKU/5CAGljCtS
	 1JZazyGvJPQbvO+t8vXdk6z29J7Sl7JPFFfux5PadREFP7POpYdZChIqchIqN14ru5
	 /m+rUnCyDsp0g==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH v4 0/7] Add support for the Exynos7870 SoC, along with
 three devices
Date: Sat, 01 Mar 2025 01:16:48 +0530
Message-Id: <20250301-exynos7870-v4-0-2925537f9b2a@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKgSwmcC/2XMSwqDMBSF4a1Ixk25eZhoR91H6UDNjWZiSiJBE
 ffeKBSUDs+B719JxOAwkkexkoDJRefHPOStIN3QjD1SZ/ImHHgJHBjFeRl91JUGCrIuK42y1ca
 SDD4BrZuP2Oud9+Di5MNytBPb319GnDOJUaC8VcZKrRph4WlcDN5Pdx96socSP2N5wTzjUgkmm
 CrRQvePxQmz+oJFxigqaVvFoGvMFW/b9gVsWMXBIAEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740772038; l=4538;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=L0vW+9BMQ6QnwnUmlEJKpaiyKdFPAJ2WF5bcFyFpTiQ=;
 b=Deb8VQAtnpEegn73ajSh7eE2p6iErSSsjs5WjgymYnBBtShQIiJTacZ9LdHDdCXv0iPGV7xVL
 4nTW9bq/gMwBSiE0eMTX/v8EohHo29JjHDNanO5fJsVn2O/avYkmhoe
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_114732_189043_CF3EF42F 
X-CRM114-Status: GOOD (  12.13  )
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

Build dependencies are in these sub-series:
 * bootmode	  	- https://lore.kernel.org/all/20250204-exynos7870-bootmode-v1-1-0f17b3033c2d@disroot.org/
 * pmu-clocks		- https://lore.kernel.org/all/20250301-exynos7870-pmu-clocks-v4-0-0f3e73b10db7@disroot.org/

Other related sub-series:
 * gpu			R https://lore.kernel.org/all/20250204-exynos7870-gpu-v1-1-0db4c163a030@disroot.org/
 * i2c	      		A https://lore.kernel.org/all/20250204-exynos7870-i2c-v1-0-63d67871ab7e@disroot.org/
 * mmc			- https://lore.kernel.org/all/20250219-exynos7870-mmc-v2-0-b4255a3e39ed@disroot.org/
 * pinctrl	  	- https://lore.kernel.org/all/20250301-exynos7870-pinctrl-v3-0-ba1da9d3cd2f@disroot.org/
 * pmic-regulators	- https://lore.kernel.org/all/20250301-exynos7870-pmic-regulators-v3-0-808d0b47a564@disroot.org/
 * uart			R https://lore.kernel.org/all/20250219-exynos7870-uart-v2-1-c8c67f3a936c@disroot.org/
 * usb			- https://lore.kernel.org/all/20250301-exynos7870-usb-v3-0-f01697165d19@disroot.org/
 * usbphy		- https://lore.kernel.org/all/20250219-exynos7870-usbphy-v2-0-b8ba4e7a72e9@disroot.org/
(Legend: [R]eviewed, [A]pplied)

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
Changes in v4:
- Drop merged [PATCH v3 1/7].
- Explicitly mention sub-series having build dependencies.
- Include the following patch from the pmu-clocks series:
  - dt-bindings: soc: samsung: exynos-pmu: add exynos7870-pmu compatible
- Adjust clock header file name to match changes in pmu-clocks.
- Change regulator node names to match changes in pmic-regulators.
- Remove non-removable flag for the SDCard's mmc node.
- Link to v3: https://lore.kernel.org/r/20250219-exynos7870-v3-0-e384fb610cad@disroot.org

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
      dt-bindings: soc: samsung: exynos-pmu: add exynos7870-pmu compatible
      dt-bindings: arm: samsung: add compatibles for exynos7870 devices
      soc: samsung: exynos-chipid: add support for exynos7870
      arm64: dts: exynos: add initial devicetree support for exynos7870
      arm64: dts: exynos: add initial support for Samsung Galaxy J7 Prime
      arm64: dts: exynos: add initial support for Samsung Galaxy A2 Core
      arm64: dts: exynos: add initial support for Samsung Galaxy J6

 .../bindings/arm/samsung/samsung-boards.yaml       |    8 +
 .../bindings/soc/samsung/exynos-pmu.yaml           |    1 +
 arch/arm64/boot/dts/exynos/Makefile                |    3 +
 .../arm64/boot/dts/exynos/exynos7870-a2corelte.dts |  628 ++++++++++++
 arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts    |  616 ++++++++++++
 arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts |  664 +++++++++++++
 arch/arm64/boot/dts/exynos/exynos7870-pinctrl.dtsi | 1022 ++++++++++++++++++++
 arch/arm64/boot/dts/exynos/exynos7870.dtsi         |  714 ++++++++++++++
 drivers/soc/samsung/exynos-chipid.c                |    1 +
 9 files changed, 3657 insertions(+)
---
base-commit: be5c7bbb3a64baf884481a1ba0c2f8fb2f93f7c3
change-id: 20250201-exynos7870-049587e4b7df

Best regards,
-- 
Kaustabh Chakraborty <kauschluss@disroot.org>


