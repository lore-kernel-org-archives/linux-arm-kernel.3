Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04453C021AD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 19:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wPAOC+w3Lk3IO27buD8tzQ7nFxGTpb44iIOvoPy+Uiw=; b=nhKDEnHAUz+XjY
	2ZVOoltQFeRJ80KZmgUuHkGi2ZlEn8eEP6sesVVhX9kAP6V+8zeDl8gCVFyK46vpo/KwlDsQyjb+7
	z8gl4t3ADQ6IfLqVyJU1/G6TiPuUcgL7q4XFkpWeR8NZ98YhjcscKBnKKp2ZbNiDzsO0rgGcZAGx8
	EtyuGxReb52drsVAke64FWMssqmB2vjQTqwQNz1FCJC0IlHyONfknxCeYXs0QMsbysS7vHr462wMJ
	b1gF726u0U+AZTLNAFKr+PUqlDK7GybH8OA7h9VQSmzi/QU66rVqLl5ac4QQvsuwodvpQpQ67Ltd3
	O4tNrBBK5gDTZ0lHIQag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkTOm-00000009bf3-1VB7;
	Tue, 18 Feb 2025 19:36:52 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkSlU-00000009SYr-47P3;
	Tue, 18 Feb 2025 18:56:18 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id BB76A234ED;
	Tue, 18 Feb 2025 19:56:15 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nUP-Q1szeK_g; Tue, 18 Feb 2025 19:56:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1739904974; bh=lGmY4p1VRzYFACIa5FUQnatEVrtfwJ9hMuMP3qnvkpg=;
	h=From:Subject:Date:To:Cc;
	b=KcIEgY2o6kVj0oRQMDdMVgVROrZfc5cJSJem5YEK0AxUL2LKe89E5eOr9WCcrbTnK
	 vxcqvLNIBe0f9ZbuOBCD40JzebjSRbm+78IQOZYerficCbC/L6X74OZhbnbCdT9LWm
	 7al+YW1SGDX/PWSibNguJ07qST8oIez1Q9sE3fFrj3bdjVpEjYvSePiVXT4N0TqI2/
	 Gebwv3u5HpaDumDw6QwIZ4nggPGfaoO6fkmsnpxXqU6gasFVcGXnJYpItqa/zkl26F
	 fnrsna4I/BKobedyfcGsCe/6DpW8lPrkbt2VOaMSWAstqw6eczk1byrVKI7vYhYrgO
	 b7wdEyqHJdKAA==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH v2 0/3] Introduce USBDRD-PHY support for Exynos7870 SoC
Date: Wed, 19 Feb 2025 00:25:37 +0530
Message-Id: <20250219-exynos7870-usbphy-v2-0-b8ba4e7a72e9@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKnXtGcC/22NOw6DMBAFr4K2jiNjPgaq3COigLDG29jISxAI+
 e5xkNKlnJHevBMYAyFDl50QcCMm7xKoWwYvO7gZBU2JQUlVSSULgfvhPOtGS/HmcbGHqMe2aYv
 alGU+QdotAQ3tV/PZJ7bEqw/HdbHlX/urlX9qWy6kMIUc2qbSaHB8TMTB+/Xuwwx9jPEDYDxWh
 7QAAAA=
X-Change-ID: 20250203-exynos7870-usbphy-6b98936f441d
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739904968; l=1208;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=lGmY4p1VRzYFACIa5FUQnatEVrtfwJ9hMuMP3qnvkpg=;
 b=Vg1OPg3CQFyh2tZdL14b9baf4IKxguTJiHMkoT4ZXtxC7l3bb51GqXJ5CfNfyMa9dv+wUDzpl
 YN17CKw6wW1Cp+Olk4fxqseV/zB9Lqag56L3ssU9oLWREBCZHnLmwNI
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_105617_170068_917C79C2 
X-CRM114-Status: UNSURE (   8.26  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Apart from introducing driver support and documentation, this patch series
also introduces a masking fix and non-functional changes.

This patch series is a part of Exynos7870 upstreaming.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
Changes in v2:
- Do away with [PATCH 1/4] from v1 as it was sent separately.
- Take over ownership of patches by the co-author, upon their request.
- Link to v1: https://lore.kernel.org/r/20250204-exynos7870-usbphy-v1-0-f30a9857efeb@disroot.org

---
Kaustabh Chakraborty (3):
      phy: exynos5-usbdrd: use GENMASK and FIELD_PREP for Exynos5 PHY registers
      dt-bindings: phy: samsung,usb3-drd-phy: add exynos7870-usbdrd-phy compatible
      phy: exynos5-usbdrd: add exynos7870 USBDRD support

 .../bindings/phy/samsung,usb3-drd-phy.yaml         |   2 +
 drivers/phy/samsung/phy-exynos5-usbdrd.c           | 407 +++++++++++++++++----
 include/linux/soc/samsung/exynos-regs-pmu.h        |   2 +
 3 files changed, 339 insertions(+), 72 deletions(-)
---
base-commit: e5d3fd687aac5eceb1721fa92b9f49afcf4c3717
change-id: 20250203-exynos7870-usbphy-6b98936f441d

Best regards,
-- 
Kaustabh Chakraborty <kauschluss@disroot.org>


