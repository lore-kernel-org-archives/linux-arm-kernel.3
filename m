Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE8F0C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 11:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8x3lei9vrmlsjP6V208iSvZSdEC6uVaHCGxHyg5du2E=; b=F2dtjTrDMA2HzZ1rwcBsThv9VS
	qETlLT4q/rhRS18LoWhapa2+jqEk6aGtEidVUBnOjmwc5JC4sXqpjn+41M8NsNwSPxJkmUeFyzYsG
	4Pnw6VwZuAlWv5LDhsPhO9KFBERVOzsDHrBglY1R//wBva4ZLDyiEvlql3FOCYie0nc8/zQv2nDbK
	w9s7fpvb1TZEHFm8sUmPQ9sDbMFwocRm7fTxT6eVJSozykRFbhLPeDaNjFnshDXTwqz6K7NjtjG55
	QqVyP0+hUVyToyIcuwtjsHyGecSIeh0fzxdY0eDEQpcpBFwhYHoUrT/dSL0TZVzK0d9sfS2E4Bu6s
	fcrDubAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqVlM-0000000E1Vp-38pI;
	Fri, 07 Mar 2025 11:21:08 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqVjk-0000000E1Fa-0cE7;
	Fri, 07 Mar 2025 11:19:29 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8E02043349;
	Fri,  7 Mar 2025 11:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741346366;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8x3lei9vrmlsjP6V208iSvZSdEC6uVaHCGxHyg5du2E=;
	b=b0lbPgPyRiJ+EvgogRoHF1Q5o5I5WC7K+u5fRx8RJ8uwY3NhIuz14L4MdGQ73lrWY6gTAY
	wZUscZsBJqqiahtbYbFQoZXQyP45VZBQUN9WXdlYp8U0kFqMCYg8tWTln/Pv0YTV9nTolF
	AjGrB4KHqa6ncbZ5xpJcO4pnGYK+pXIAAy+lsM3nUSuz6YWqVHdXrBJfq5qaXGCVEtiJgc
	zsywzJYNFYF3ERtxRYLIdVevEMiajHkGUaXPoUP65nY+wuQWim5SEjAZZZl/E8XjGOf7Eh
	4lOK5CuEmfEY+LDGJcGaUqdrK6v/+hVcadHBg93lYRH4R3wyh3Oky1v1cs29sw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 07 Mar 2025 12:19:07 +0100
Subject: [PATCH 1/2] thermal: bcm2835: use %pC instead of %pCn
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250307-vsprintf-pcn-v1-1-df0b2ccf610f@bootlin.com>
References: <20250307-vsprintf-pcn-v1-0-df0b2ccf610f@bootlin.com>
In-Reply-To: <20250307-vsprintf-pcn-v1-0-df0b2ccf610f@bootlin.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, Liu Ying <victor.liu@nxp.com>, 
 linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduuddthedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeiieeuvdfftefgueduleehueetgffgjeeitedtteetkeeuueeuueekveevvdeuveenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghloheplgduledvrdduieekrddujeekrdduudekngdpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvjedprhgtphhtthhopegrnhgurhhihidrshhhvghvtghhvghnkhhosehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepshgsrhgrnhguvghnsegsrhhorggutghomhdrtghomhdprhgtphhtthhopehlihhnuhigqdgtlhhksehvghgvrhdrk
 hgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghorhgsvghtsehlfihnrdhnvghtpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepfhhlohhrihgrnhdrfhgrihhnvghllhhisegsrhhorggutghomhdrtghomhdprhgtphhtthhopehsvghnohiihhgrthhskhihsegthhhrohhmihhumhdrohhrghdprhgtphhtthhopehpmhhlrgguvghksehsuhhsvgdrtghomh
X-GND-Sasl: luca.ceresoli@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_031928_336042_14FBA5CF 
X-CRM114-Status: GOOD (  11.73  )
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

The %pC and %pCn printk format specifiers produce the exact same string. In
preparation for removing %pCn, use %pC.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/thermal/broadcom/bcm2835_thermal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thermal/broadcom/bcm2835_thermal.c b/drivers/thermal/broadcom/bcm2835_thermal.c
index 7fbba2233c4c12e14090832a62784e1500c0ab79..685a5aee5e0dfb113638313a9086721beae09db3 100644
--- a/drivers/thermal/broadcom/bcm2835_thermal.c
+++ b/drivers/thermal/broadcom/bcm2835_thermal.c
@@ -192,7 +192,7 @@ static int bcm2835_thermal_probe(struct platform_device *pdev)
 	rate = clk_get_rate(data->clk);
 	if ((rate < 1920000) || (rate > 5000000))
 		dev_warn(dev,
-			 "Clock %pCn running at %lu Hz is outside of the recommended range: 1.92 to 5MHz\n",
+			 "Clock %pC running at %lu Hz is outside of the recommended range: 1.92 to 5MHz\n",
 			 data->clk, rate);
 
 	/* register of thermal sensor and get info from DT */

-- 
2.48.1


