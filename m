Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3613BD7235E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 09:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6HdXNZ3Nba+GjaEjoZsm3NjZLI9rre4BgbexuF1mMZI=; b=S/mmffSfKSud+AlhH0XXfLlsDk
	4HIFDhNcFfQkzGXN4YnAuNqEuh9NCZrkSm6s7gDoik6jhdvHoK3VYfc7U4GRGV4Uys/T6tgy8Qwus
	C/JsDRjujvPe8T/c9kAQ/tbIh9dxBYKlE4l0ShFTeOJ2DM8MqgV6UVc2XByogChgWtvN/r96nW0d1
	Uuw8YwtD0ABMf77Jhu3e9V8AlCoXfZJfQuh6A/tj0KJBGWIBnxkUng9erAlzqBCwTESjzROfo1wkD
	IDeSA1ubDawxs/eYECYmXwhECNi3npxQkXnkbW4qlcCPQEtvs74g8mpyrwLpT5ZVOXsrZ6/M3cfwb
	uKOUUqgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjDYI-00000008azI-2mOc;
	Fri, 23 Jan 2026 09:34:02 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjDYA-00000008aw8-1gfX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 09:33:55 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id F276B4E42218;
	Fri, 23 Jan 2026 09:33:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C68606070A;
	Fri, 23 Jan 2026 09:33:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 742EF119A879B;
	Fri, 23 Jan 2026 10:33:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769160831; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=6HdXNZ3Nba+GjaEjoZsm3NjZLI9rre4BgbexuF1mMZI=;
	b=SBj3gjtJo/1rgjyDl7/r5f9nceA8TyQzz6LvG0/gA6DDvoG+96GwNz7Kv6prMAItwE0JKX
	WdLOrIQ7+9MDcHUVFxpUPsliWfeMACv6NKH1l6zqyuogefVe2KqXYyePwE+IZs2Q2i3pCh
	YoKw1eecQLU5X5yGwfEiEkDgRcK/inTj36l5jF67Sc2UUGHI5NZ20mQ06GOtLqF1FkI0Pn
	F/yZSP6oQs3oNrjwL5wsfAU0qUSUyM3/FLbcOQ2ADrO34wXMCF451TsyGXF7JOi6KPAmFz
	+gSeJIdNrKn5CPY1hyaMrSIKM2Xnuxyxrqv7DorfreZX3yV/14o8E9rA4Xwlyw==
From: Richard Genoud <richard.genoud@bootlin.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Paul Kocialkowski <paulk@sys-base.io>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Richard Genoud <richard.genoud@bootlin.com>
Subject: [PATCH v3 4/4] MAINTAINERS: Add entry on Allwinner H616 PWM driver
Date: Fri, 23 Jan 2026 10:33:22 +0100
Message-ID: <20260123093322.1327389-5-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260123093322.1327389-1-richard.genoud@bootlin.com>
References: <20260123093322.1327389-1-richard.genoud@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_013354_581056_F896AE5F 
X-CRM114-Status: UNSURE (   9.57  )
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

Add myself as maintainer of Allwinner H616 PWM driver and device-tree
bindings.

Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
---
 MAINTAINERS | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 765ad2daa218..ac7b07f4eddf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -903,6 +903,11 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-dmic.yaml
 F:	sound/soc/sunxi/sun50i-dmic.c
 
+ALLWINNER H616 PWM DRIVER
+M:	Richard Genoud <richard.genoud@bootlin.com>
+S:	Maintained
+F:	drivers/pwm/pwm-sun50i-h616.c
+
 ALLWINNER HARDWARE SPINLOCK SUPPORT
 M:	Wilken Gottwalt <wilken.gottwalt@posteo.net>
 S:	Maintained
-- 
2.47.3


