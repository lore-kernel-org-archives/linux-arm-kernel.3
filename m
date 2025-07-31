Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD490C87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 21:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ULjQfnhtaCOc6nuTlfsZN9Ndb34y8oJUL4ctPVdS50E=; b=VUO2in4icVLWSkB0xD+JDuKuBf
	y4mLOUJgw3ytoEmTrjYkCJVqQ2l3lHzfzW898R6TVq9NDy91hSHuKSTIZURo1bIEd0+JADDE9VR/Q
	S5gn0eXdSQEuLwPRVlE5AOfFoWXj2VYs/teAOTH7L1y0p+4v2mHjMb3FXDnymGn5/6vEQSk++oTTg
	Mz+iz9wBTY0BbA/U3MCzHDC9eU6oBJ6w/x4uvudflY0Z8s+lur9+52fmqimoexq0TPhA73asKtTkF
	U5HN6QZmZuscqbp00xIDU/hI4WCplKbWMRLrRTVORb48w5UwLz1jdSQ1EqTR/m/dlBnKlPmDl5p/S
	D3hc/s/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhakK-00000004SlJ-2b92;
	Thu, 31 Jul 2025 21:23:28 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhaUL-00000004QQc-3jJv;
	Thu, 31 Jul 2025 21:06:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ULjQfnhtaCOc6nuTlfsZN9Ndb34y8oJUL4ctPVdS50E=; b=Qy4EAQJt9mBpWKn/kZw/jo6bIS
	Z/R914OrXmb86ghVBgyB61aCQgKDytoT6Qtyi469yD1DMdQKYm0yl54ktrFDTsB+KecW8Yf7+VR60
	Gk3uTBf0ztyVIGvRKtO7Ld+eLWWmeCvwA2YN4aaVeEgwtZHm7awGLLWOksC1LpGrRz12iNtwFXKYL
	bPM51s9F+WVI9i3ateL8z9OktzkxEk+vr6yJs2cVvcChj3IGRxt3ChuNA1F2LpLyc4a52OMSbY4Ml
	8M8qPKHyKyecRWUo8e7Yt02A292P+a5HPMw1pmMRzIKHBTPr9OJYEBgE6V4E1Wl0wIYOK8CgoEHrE
	OohDqoIQ==;
Received: from [189.7.87.79] (helo=1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1uhaUG-006udv-GF; Thu, 31 Jul 2025 23:06:52 +0200
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Thu, 31 Jul 2025 18:06:19 -0300
Subject: [PATCH v2 3/5] clk: bcm: rpi: Maximize V3D clock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250731-v3d-power-management-v2-3-032d56b01964@igalia.com>
References: <20250731-v3d-power-management-v2-0-032d56b01964@igalia.com>
In-Reply-To: <20250731-v3d-power-management-v2-0-032d56b01964@igalia.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Stefan Wahren <wahrenst@gmx.net>, Maxime Ripard <mripard@kernel.org>, 
 Melissa Wen <mwen@igalia.com>, Iago Toral Quiroga <itoral@igalia.com>, 
 Dom Cobley <popcornmix@gmail.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 kernel-dev@igalia.com, =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1402; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=O00PsKXK2jlCG/cJaXu43518VkWglgzTQU7i2A9SDdU=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBoi9rUePKvZrB61zbL7vB3NsW4V2vMh/P3tKA0Q
 ycZPC7UAxCJATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaIva1AAKCRA/8w6Kdoj6
 quAlB/4xILc7+1+O5iez+G384qNdJ5teQLSRbPz7RYpBzvieoCh7ahwySTdkQ8lwO6sU4YQMwQC
 hF98fnBitUz+PeZzdOBxvzXWD3WdOkMGKF/088TQdT0lu9yLq6t5N8xs5vSLhmCDKA47Bh6OtUD
 DK891EUysB9WFRuRc/MspiMQNTD0OVqbp756QvhScyAXPCWGdkNHUfTt7LvHxkuBh4JAcz/1x4L
 xosPgmye5e77w+w0njlMjL7K/ISnxISq0C7C99KUOilQTkpYXfQsuMTau3loUynqQFsMZOG9WKs
 HqWvQlJ5jx+MPtlcM9wES3AdemCdjSDN3VMwYFTKINOBGCHY
X-Developer-Key: i=mcanal@igalia.com; a=openpgp;
 fpr=F8E45D7D0116770729A677D13FF30E8A7688FAAA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_140657_929450_C7857D9E 
X-CRM114-Status: GOOD (  11.37  )
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

Although minimizing the clock rate is the best for most scenarios, as
stated in commit 4d85abb0fb8e ("clk: bcm: rpi: Enable minimize for all
firmware clocks"), when it comes to the GPU, it's ideal to have the
maximum rate allowed.

Add an option to maximize a firmware clock's rate when the clock is
enabled and set this option for V3D.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/clk/bcm/clk-raspberrypi.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
index 70acfa68827d84670c645bedd17bf0e181aadfbb..1a9162f0ae31e330c46f6eafdd00350599b0eede 100644
--- a/drivers/clk/bcm/clk-raspberrypi.c
+++ b/drivers/clk/bcm/clk-raspberrypi.c
@@ -68,6 +68,7 @@ struct raspberrypi_clk_variant {
 	char		*clkdev;
 	unsigned long	min_rate;
 	bool		minimize;
+	bool		maximize;
 	u32		flags;
 };
 
@@ -135,7 +136,7 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] = {
 	},
 	[RPI_FIRMWARE_V3D_CLK_ID] = {
 		.export = true,
-		.minimize = true,
+		.maximize = true,
 	},
 	[RPI_FIRMWARE_PIXEL_CLK_ID] = {
 		.export = true,
@@ -386,6 +387,9 @@ static struct clk_hw *raspberrypi_clk_register(struct raspberrypi_clk *rpi,
 		}
 	}
 
+	if (variant->maximize)
+		variant->min_rate = max_rate;
+
 	if (variant->min_rate) {
 		unsigned long rate;
 

-- 
2.50.0


