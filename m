Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D279AF55130
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Mar 2026 05:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MCAy3IspOxjf/o/Qcw9iPr9RuRe4LJc4sM16VEdAeX0=; b=zrJaBiniUs0p2f
	KBP4DS7KTintlzsMTqnk+A0GK0vtvJ0zbUvMPaF8iJiSHYTP+lmwuhtrnEhfyDjLlT4DRPUN+hkmQ
	f9VYMcUeIOv6yrkUD/83KDT98iTkILpsf85MX5Zi5dSG1a+0wL5mQNaXxK9aseeJew41fBitk/SVk
	OpanWa5jM+Z6RdCqxVbWmw4cOyvst53Ad2kuVeBIQsYWLNkt2Udd82qpl2zM9F8lGrBubpJ+NAcJY
	wJOtx8/yOl8oF95Jo1WeDuVbD56piT/aI0POK7pQkSHAwnsIPu810i+WEW9Xp+qi/E0nX2v1aW0kb
	2m/XO0hQcRofwE9GIpiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vz6Wa-00000005iYp-16fx;
	Sun, 08 Mar 2026 05:17:56 +0000
Received: from s106b.cyber-folks.pl ([195.78.66.88])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vz6WV-00000005iXn-3js6
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Mar 2026 05:17:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mmpsystems.pl; s=x; h=Cc:To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=MCAy3IspOxjf/o/Qcw9iPr9RuRe4LJc4sM16VEdAeX0=; b=d03LcMrFqnLUqVf/haqumC8wRv
	60Pn30j32ouEVIaz1A2lpwjA39omsYPp9CQSHL2LtJeLeUo/LxgSgBHf/UeoqCMGTNorNm5dZ1Wgl
	C908+vleVfkoPZ9IAOX24/3PD3Kx83Q7JK82tOp+QjctNSa9mIYpNGPCrWui6Q1kz8h/A5hZCADs8
	HwzsIpywM0LuXWMf/JG6Gjd6qLWORbk/qPu2fGXxisMlaG91VMfcejixmUulNRbBJ/pINURScG4mW
	7VFIx4L0r8U9pavDC0M+gm0LTRvHMCrvVRubPpCq5RYXKBS1WiGtoGxY2W5bGhsset0H4ozejk+3R
	qtqXsUMw==;
Received: from user-5-173-16-20.play-internet.pl ([5.173.16.20] helo=localhost)
	by s106.cyber-folks.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <michal.piekos@mmpsystems.pl>)
	id 1vz6WP-00000007Wqt-3yvx;
	Sun, 08 Mar 2026 06:17:46 +0100
From: Michal Piekos <michal.piekos@mmpsystems.pl>
Subject: [PATCH 0/2] arm64: dts: allwinner: fix Orange Pi Zero 3 PMIC
 interrupt routing
Date: Sun, 08 Mar 2026 06:16:50 +0100
Message-Id: <20260308-rc2-boot-hang-v1-0-d792d1a78dfd@mmpsystems.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEIGrWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYwML3aJkI92k/PwSXZCsrpGZZaqFqYmZmbFpkhJQT0FRalpmBdi86Nj
 aWgBBCfOSXwAAAA==
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Andre Przywara <andre.przywara@arm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Michal Piekos <michal.piekos@mmpsystems.pl>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772947022; l=1377;
 i=michal.piekos@mmpsystems.pl; s=20260301; h=from:subject:message-id;
 bh=SMRYIg4HW8+BozjEhJiK5oB5jbrZ8pGHSsfVh+tG3tQ=;
 b=QJkqZXtGpUiKlbs8QY9kRldGClQZQkLighO5blpHfyS256XWVowBvPrOmeyvytbXCdzrhTx70
 eTe9fXs++DkAMubxxlMiTOfuGKd8SsCqUFSZW2pzG6Z1aqO70fOfFyx
X-Developer-Key: i=michal.piekos@mmpsystems.pl; a=ed25519;
 pk=Aixyx03If7ZDamiKKN0lsa+0mtA+WjIuIf2ZQVYNBqg=
X-Authenticated-Id: michal.piekos@mmpsystems.pl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260307_211752_344179_836B61B4 
X-CRM114-Status: GOOD (  11.38  )
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

This fixes a kernel hang during boot on the Orange Pi Zero 3 caused by
incorrect interrupt routing for the AXP313A PMIC.

The PMIC interrupt on is connected to PL bank GPIO handled by the R_PIO
controller. However current dts routes the interrupts to PIO controller.
This causes the kernel to select wrong pinctrl instance when configuring
the interrupt which leads to invalid register access and a kernel hang
during boot.

The problem existed previously but became visible after the commit
01e10d0272b9 (pinctrl: sunxi: Implement gpiochip::get_direction()),
which causes gpiolib to call the gpiochip::get_direction() callback
during interrupt setup.

Patch 1 declares R_PIO node as interrupt controller so it can be used as
interrupt parrent.

Patch 2 fixes the board device tree by routing the interrupt to R_PIO

---
Michal Piekos (2):
      arm64: dts: allwinner: h616: declare r_pio as interrupt controller
      arm64: dts: allwinner: orangepi-zero3: fix axp313 interrupt parrent

 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi               | 2 ++
 arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dts | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)
---
base-commit: 4ae12d8bd9a830799db335ee661d6cbc6597f838
change-id: 20260308-rc2-boot-hang-269e8546635b

Best regards,
-- 
Michal Piekos <michal.piekos@mmpsystems.pl>


