Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AEADC5516E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 19:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oabn4j+0fax77TiRX/c/TKcL9eo9nqglwTeuL6S0z50=; b=RCCFjbmeNUKNBfz/q7C3W9jKOr
	bVo6U7P5axAbfdmsAXbh+eIOeBqtDx/fthSH9tj1cPNj4jNhc3NZpp4A/uXJxmUU/6EruKIYUy3vz
	K52/NmStQH/Vsgz+akKCDzUsGbHmGlC+5YybfFj7kqlsy2gmBHrjuytAYYA7RYkJQ0d+knI22kg3F
	64th41KSuiX/DJi1WABq/whB3pQo1frMwg8PF7ajHsAbk6MlHUpJaNjZakTDDboQL2Ur7zYw/ZrOb
	Y9kBXmc1tPFMkZaKqfZaVTFvNReJOGOceJFNWHlqXGcZrv/SPQAqcSzmW8RYvm7A/TE7h2c6PtcQy
	2HFmRxyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpWkf-0000000BGdZ-30xO;
	Thu, 30 Jul 2026 19:49:09 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpWkc-0000000BGbo-3PGf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 19:49:08 +0000
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 2070D41C0A;
	Thu, 30 Jul 2026 21:48:59 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id twh4_bGASbqc; Thu, 30 Jul 2026 21:48:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1785440938; bh=5OosL7UAzAlw+AfOM4QcdD9qlKoevvkWJfZrS6zvBNQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=RfPxy95nrBGr4RUcT6igf1c9IC/it5/M8WhA8SDcCraOn351JXMlcQNP8vagstq5f
	 pqi1RBiV/2aIqCRik7ikWAkL3kMqX6qgVctOmDAQBnTp1y/fQZeCCshKurk+yr7qHH
	 D7AhEy6wrYjD7oRHS7NnwQBpKlSDdmeoSAY4Esz5Ykjh0WM+oUjvA2O0hH/3xlKGAd
	 o5WsDsK17WoqAXDVuoEW6sBarOBWRys+dUeW1PSRLGptQbO04sA/T4amD9uPS2n5Ej
	 DJNZfWDnuqSginQZnxRTb4CQpiTP6HL2dNTXWM5mMzmBgxJIXHctdQHcYlXDFZnwo/
	 2bFVkwd1aTWTg==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Fri, 31 Jul 2026 01:18:22 +0530
Subject: [PATCH v2 2/5] Input: zinitix - do not ignore non-moving fingers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-zinitix-modes-v2-2-ffe2ec9a9031@disroot.org>
References: <20260731-zinitix-modes-v2-0-ffe2ec9a9031@disroot.org>
In-Reply-To: <20260731-zinitix-modes-v2-0-ffe2ec9a9031@disroot.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Michael Srba <Michael.Srba@seznam.cz>, 
 Linus Walleij <linusw@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_124906_998123_D1AF6C3C 
X-CRM114-Status: GOOD (  16.53  )
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

With the ZT7548 touchscreen present in the Galaxy J6, multitouch does not
work reliably. This is due to the fact that the driver reports fingers
only when their state is changed, so it's either placed against the
screen, moved, or drawn away from the screen.

The function which is responsible for this is zinitix_report_finger().
This function is called from the IRQ handler, under the following
condition:

		if (p->sub_status & SUB_BIT_EXIST)
			zinitix_report_finger(bt541, i, p);

This implies and ensures that every valid finger must have the
SUB_BIT_EXIST flag.

However, at the beginning of the function, it refuses to recognize any
finger if it has none of SUB_BIT_UP | SUB_BIT_DOWN | SUB_BIT_MOVE. This
excludes fingers in reports which do not move from the position since
the previous interrupt. Add SUB_BIT_EXIST to the list of valid bits.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 drivers/input/touchscreen/zinitix.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/zinitix.c b/drivers/input/touchscreen/zinitix.c
index 3421b8ffb19b..a0a89d25e25b 100644
--- a/drivers/input/touchscreen/zinitix.c
+++ b/drivers/input/touchscreen/zinitix.c
@@ -406,7 +406,7 @@ static void zinitix_report_finger(struct bt541_ts_data *bt541, int slot,
 	u16 x, y;
 
 	if (unlikely(!(p->sub_status &
-		       (SUB_BIT_UP | SUB_BIT_DOWN | SUB_BIT_MOVE)))) {
+		       (SUB_BIT_EXIST | SUB_BIT_UP | SUB_BIT_DOWN | SUB_BIT_MOVE)))) {
 		dev_dbg(&bt541->client->dev, "unknown finger event %#02x\n",
 			p->sub_status);
 		return;
@@ -473,7 +473,7 @@ static irqreturn_t zinitix_ts_irq_handler(int irq, void *bt541_handler)
 		const struct point_coord *p = &touch_event.point_coord[i];
 
 		/* Only process contacts that are actually reported */
-		if (p->sub_status & SUB_BIT_EXIST)
+		if (p->sub_status)
 			zinitix_report_finger(bt541, i, p);
 	}
 

-- 
2.54.0


