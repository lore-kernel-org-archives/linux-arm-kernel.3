Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36BFBC5516E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 20:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+JKu1688n0Kq/j/gdlNvkJcnUFrKwv5OExbLBUMLkJE=; b=te6FcBdvPkTmq+t0Fxr3GTviBt
	t93iDPL/dqzOgm++hMlbM/TyTW0HmucT1CMM3Gsm+Nve8pIvGGXVptl2c9esP6eH7ZvdEB9sDUURB
	zP8E+rwYrh6Zzk0vl7qgNeAuTx5TAhuWhc5ObnQp5yZY4OXBICYhWvxyFoahFiacs5bsyk6zjvsXp
	X+POJkaYZjvHmgChw8ADfM0ykmJWCyGQKTqshuuERUBIIs5u/teoOlAxNFH0TnjrMNQ38dQiiCIOO
	D8BmbIhvlxK11SeAVjbbBy/wexRLUhxEuPhfq/h9NplhBo1PiFIoYIIv7mtbb6HCHPxdyYaTNP/bi
	b14DVUiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpXDo-0000000BJac-2ElW;
	Thu, 30 Jul 2026 20:19:16 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpXDj-0000000BJZM-0ufk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 20:19:12 +0000
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 42DAB41BF9;
	Thu, 30 Jul 2026 22:19:03 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1LqmO0BPDn1u; Thu, 30 Jul 2026 22:19:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1785442742; bh=yNCQ1hJmfPMg6tm7gbrV3yC9T9Hq5gOQ1U8UmvOOz90=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=hFQWubHyG0kSWo53cQqAp3j8UF3NNzWq7DjonbJi9vN0LkTqCKAAYJ5JG6dekLxEW
	 5GBND5ux/trHPDypMFhVA+OUfHfDEP/86w5A1xoEjDI3etkXgNvgI1780l3K53eQaH
	 dksZZrdrOqec1verdz8RPZS6p6g+H1LNisctlX0tP64QVpfdu2e9bTdXrB2mIonz//
	 Hh9YFFjC8D1obQucyngaszKA3RsNu2nG/j37zJJXxZZ9SBaAG4eYQQugUijig+MFxZ
	 TTa6z28POU0EqGOs5TUIyB5Rsg7hbGpQpWdVbqGe17cANs+lnCxWgsa3rnJP+spp+G
	 /DmQi+PsK8daQ==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Fri, 31 Jul 2026 01:48:34 +0530
Subject: [PATCH v3 1/5] Input: zinitix - check all available fingers for
 every touch event
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-zinitix-modes-v3-1-2c8de712997a@disroot.org>
References: <20260731-zinitix-modes-v3-0-2c8de712997a@disroot.org>
In-Reply-To: <20260731-zinitix-modes-v3-0-2c8de712997a@disroot.org>
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
X-CRM114-CacheID: sfid-20260730_131911_705106_48B11755 
X-CRM114-Status: GOOD (  19.85  )
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

When this initial driver was first added to tree, that is, in commit
26822652c85e ("Input: add zinitix touchscreen driver"), the touch_event
struct had a field called finger_cnt. It was supposed to report how many
fingers are touching the screen.

But then, in commit e941dc13fd37 ("Input: zinitix - do not report shadow
fingers"), some touchscreens reportedly exposed a bit mask for the
fingers, instead of the count. So the code was changed to bitwise
iteration.

With my testing on the ZT7548 touchscreen of the Galaxy J6, I find the
former to be true. This shows that there's two valid methods depending
on what hardware the driver is made to work on.

One solution is to implement both methods, and use some flag to select
between the two. However, this introduces more implementation overhead,
and a possibility of regression on devices the driver is expected to work.

Instead, unconditionally check all fingers. The finger_mask field is now
left unused, thus serving as padding bytes in the struct. For each
finger, zinitix_report_finger() is called if the status reports the
SUB_BIT_EXIST bit, so phantom fingers are not going to be a thing.

Moreover, the android driver [1] does exactly that, so it's a tried
method of implementation.

Link: https://android.googlesource.com/kernel/bcm/+/23d376ef33aa4c500a5ea24a290f029d5f8e2de3/drivers/input/touchscreen/zinitix_touch.c#1942 [1]
Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 drivers/input/touchscreen/zinitix.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/input/touchscreen/zinitix.c b/drivers/input/touchscreen/zinitix.c
index 0c36765bd79f..3421b8ffb19b 100644
--- a/drivers/input/touchscreen/zinitix.c
+++ b/drivers/input/touchscreen/zinitix.c
@@ -445,7 +445,6 @@ static irqreturn_t zinitix_ts_irq_handler(int irq, void *bt541_handler)
 	struct bt541_ts_data *bt541 = bt541_handler;
 	struct i2c_client *client = bt541->client;
 	struct touch_event touch_event;
-	unsigned long finger_mask;
 	__le16 icon_events;
 	int error;
 	int i;
@@ -470,8 +469,7 @@ static irqreturn_t zinitix_ts_irq_handler(int irq, void *bt541_handler)
 		zinitix_report_keys(bt541, le16_to_cpu(icon_events));
 	}
 
-	finger_mask = touch_event.finger_mask;
-	for_each_set_bit(i, &finger_mask, MAX_SUPPORTED_FINGER_NUM) {
+	for (i = 0; i < MAX_SUPPORTED_FINGER_NUM; i++) {
 		const struct point_coord *p = &touch_event.point_coord[i];
 
 		/* Only process contacts that are actually reported */

-- 
2.54.0


