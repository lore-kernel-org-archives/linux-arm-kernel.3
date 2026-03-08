Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76155EF5866
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Mar 2026 13:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=St0AyNXsSwKBzqSM+oRrqDno8Waxo4WGv/VDy+FEh5Q=; b=0aZUZj8wrycrnSnGl/XiyYSDL3
	s4+ldeUq1qCeMWIVPppVM/AtiS31hNkAqrExicZq8D3P6NXV3Bv+S13xemaVqh71CDUs4JJ9+y24w
	L36l7CZgl1LzjhbeFPiyjbY1DDyOUt58drgAApeNxY2Joqd+nGqlImc7EGv/MsCZz2ZoncdtC7jQ4
	2IDCLPcuXpgxPKfDnpItFs+nuWjxHdKjIC+yiWQ0MmYh/8PrPhpLHGrZMKuwzUuB3PUBy9D77EWVZ
	7+St5ne/fLltkJdJItVtE1J//mM6OSNlBnuJjyBnZ3yhu7qJb17lJMKJPHxCt96uy++Mos+Y3LYDo
	BzycXAHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzEP7-0000000643H-21KN;
	Sun, 08 Mar 2026 13:42:45 +0000
Received: from s106b.cyber-folks.pl ([195.78.66.88])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzEP4-0000000642Y-05xV
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Mar 2026 13:42:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mmpsystems.pl; s=x; h=Cc:To:Message-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=St0AyNXsSwKBzqSM+oRrqDno8Waxo4WGv/VDy+FEh5Q=; b=nCQ+4oLRHT0Scfga9gqQKqAdve
	DnhdxnX0eg9wsnslnUnWC0PW4yjt2hmNLUVC2EtMItuJVleuQ2a8xwqEONbRNrCJubNJn83ind0+T
	sLsSWLDkUCRp/yBBudHhDZxHuu6G8Qc/aotSIDynyMogqRPavEjAIdaZe8iB24CZLEZLwgyxGeYVf
	UXR+cdmrLCzUBklVYFhp6ZrD/tbgkh/d1Hg23dQ69LG9PVXhymL6PYbeVkwLBrzJ7zOaAuD51C5o4
	j1tYUEv4zqpb2JMHbWcZU2lSvFcaTMhHu3nvDDCHRBhyq2MxTu/jqm+xOltJdqZDacG7YrhYCu4Rs
	KwRw5gYA==;
Received: from user-5-173-16-20.play-internet.pl ([5.173.16.20] helo=localhost)
	by s106.cyber-folks.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <michal.piekos@mmpsystems.pl>)
	id 1vzEOy-00000001bBU-1wll;
	Sun, 08 Mar 2026 14:42:36 +0100
From: Michal Piekos <michal.piekos@mmpsystems.pl>
Date: Sun, 08 Mar 2026 14:42:07 +0100
Subject: [PATCH v2] pinctrl: sunxi: fix gpiochip_lock_as_irq() failure when
 pinmux is unknown
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260308-rc2-boot-hang-v2-1-516fdb820953@mmpsystems.pl>
X-B4-Tracking: v=1; b=H4sIAK58rWkC/3WMQQqDMBBFryKz7pQk1hhd9R7FhZqxBqoJGZGKe
 PdG912+/3lvB6boiKHOdoi0OnZ+TqBuGfRjO78JnU0MSigtcmEw9go77xc8X1S6IlM8tM6LDpI
 TIg3ue/VeTeLR8eLjduVXea7/SqtEgbaslJVtaexgn9MUeOOFJr6HDzTHcfwAMnstaq4AAAA=
To: Linus Walleij <linusw@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Michal Piekos <michal.piekos@mmpsystems.pl>, 
 Andrey Skvortsov <andrej.skvortzov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andre Przywara <andre.przywara@arm.com>, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772977354; l=2440;
 i=michal.piekos@mmpsystems.pl; s=20260301; h=from:subject:message-id;
 bh=rrGyO2F1XUUE+HsMS168kypAGTNq7QUgIvitPdO1BQk=;
 b=yEJ8OTcrMY3hFIqred0NGwmGs6SEjFUz6A/HTFbFK40vun//DFrg4PhU9J9PebOKV5Gih+cv5
 YuVng+yvsP8A0LbrdP1AfM+h70wtsnDh7Nf1VuszYz/z0PgHcyPJuDe
X-Developer-Key: i=michal.piekos@mmpsystems.pl; a=ed25519;
 pk=Aixyx03If7ZDamiKKN0lsa+0mtA+WjIuIf2ZQVYNBqg=
X-Authenticated-Id: michal.piekos@mmpsystems.pl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260308_064242_548816_F21A6138 
X-CRM114-Status: GOOD (  14.65  )
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

Fixes kernel hang during boot due to inability to set up IRQ on AXP313a.

The issue is caused by gpiochip::get_direction() which was returning
-ENODEV when gpio is in unitialized state.

Instead of failing when the current muxval is at default value, report
the line as input.

Tested on Orange Pi Zero 3.

Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
Suggested-by: Andrey Skvortsov <andrej.skvortzov@gmail.com>
---
This fixes a kernel hang during boot on the Orange Pi Zero 3 caused by
inability to set up interrupt for the AXP313A PMIC.

The issue is caused by gpiochip::get_direction() which was returning
-ENODEV when gpio is in unitialized state and its muxval is at default
value.

Instead of failing, report the line as input.

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Samuel Holland <samuel@sholland.org>
To: Andre Przywara <andre.przywara@arm.com>
To: Linus Walleij <linusw@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-sunxi@lists.linux.dev
Cc: linux-kernel@vger.kernel.org
Cc: linux-gpio@vger.kernel.org

Changes in v2:
- Dropped the previous faulty solution which was forcing the axp313 to
  use r_pio as interrupt controller as pointed out by Jernej Škrabec.
- Implemented suggestion from Andrey Skvortsov to return default
  direction as input
- Link to v1: https://lore.kernel.org/r/20260308-rc2-boot-hang-v1-0-d792d1a78dfd@mmpsystems.pl
---
 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index c990b6118172..e438cf35ff28 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -971,7 +971,7 @@ static int sunxi_pinctrl_gpio_get_direction(struct gpio_chip *chip,
 
 	func = sunxi_pinctrl_desc_find_function_by_pin_and_mux(pctl, pin, muxval);
 	if (!func)
-		return -ENODEV;
+		return GPIO_LINE_DIRECTION_IN;
 
 	if (!strcmp(func->name, "gpio_out"))
 		return GPIO_LINE_DIRECTION_OUT;

---
base-commit: 4ae12d8bd9a830799db335ee661d6cbc6597f838
change-id: 20260308-rc2-boot-hang-269e8546635b

Best regards,
-- 
Michal Piekos <michal.piekos@mmpsystems.pl>


