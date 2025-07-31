Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18AF6C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 21:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8GhUDeTLSwNjxecym9jvvl8qS8LaxkEHbs2c8gKKa24=; b=1/ZGRjsJJp/zrkbwylfFd1N5Zr
	V0boM/71qyScrTPRj/3qlR+VBfvnFVuBJo64dcimbGFaPvNtI8vGxNkvfl9adek6G23p25vql+CNF
	SGixKZRqhqMPCpiZupJ79i7hzemz3Cln5/GlQwhehijFNZXJoQakHyrcMBNedx/M9fbz4GS+v4+iv
	G/yonPmdo2/T2SbHm6lND2cwvyTugKstDG+/vliJoLbgsNz4ixtvmEauHWtwKODez/fFit19pkUL1
	eSvzoeu1PFXuKZ7yH//s5NBcViYRCLwzPYL5UbwqTj2EZir8Dbqvia1BLbYGyGSSxi9IgZfXPweje
	m5BD9LNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhaeT-00000004Rnq-0DYN;
	Thu, 31 Jul 2025 21:17:25 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhaUI-00000004QNL-1ZNU;
	Thu, 31 Jul 2025 21:06:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=8GhUDeTLSwNjxecym9jvvl8qS8LaxkEHbs2c8gKKa24=; b=YS1nL0oJVh0cvWyxm8UyXWoXx1
	xnSo/6a57JxK1C8CHfndF1U3Zrtnd4nl8JGPTTUMZDW3FyeneV3bzD3EuudJq3kDY5MyVRapJJ3Tk
	kdj28lS4baHyX7rd0CL5SY6a4NqUs0cyGsW6HwRBqNSm/fVr8l/PgRiOxmfAv4BTAG37rWxXmb1zn
	x1a2aaehBIKECiTXQD7PMwOkWGpUDuQhk7IlrL/K1kubt2QhQ2a9PujnFNwhdlNZz1mb3FptwAQUO
	hbGmpIOv0vjuxQhwi12v09TL8gwSr6sfTou7xTQuGy2V9Dmk5KiEI9XZK4ulMMzVXA7Q/7OHxXOdt
	OdKdKNfQ==;
Received: from [189.7.87.79] (helo=1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1uhaU4-006udv-5k; Thu, 31 Jul 2025 23:06:40 +0200
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Thu, 31 Jul 2025 18:06:17 -0300
Subject: [PATCH v2 1/5] clk: bcm: rpi: Add missing logs if firmware fails
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250731-v3d-power-management-v2-1-032d56b01964@igalia.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1470; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=erDCfOsYa2mIy6rXKmvOpHwNvVeseuMZhnPMp7sgL84=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBoi9rTbW3zXA3JCj73aonfd9bzr3nFhywVj/Wx2
 afRt8diZnuJATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaIva0wAKCRA/8w6Kdoj6
 qhxMB/oDRSqLUnbJhzCRdkHJPMO7vN+qYdfAfph+4ZYGOE+H0MVIxLnI5q9CsE6aBJpub5R3MER
 JkGex4eMjo3dsUaIl+ojQXmlICTvFAjZ2TRqYKRWHiaxfYY1dcHbzsnF5kNISNQ7Y4LFkTMR2R+
 rqTJJaOH4IWu+0tkvv9scmuJWtfzsbycGSq5nLkvQ+4yOTT7Zby3rxOZVWewXmKH07BV/a5k8Dk
 hjXMwrmjK/tnyi3ydQvbbrbgWICTDa0epQFWcLLaFo/7wRmTVUVCNu5ET8jcmCw6ojGvVidGEvK
 D6uWnlCWhEKk7Xir8gBUQtPzTXAnHUEnV1b2azT6+KMlHdfe
X-Developer-Key: i=mcanal@igalia.com; a=openpgp;
 fpr=F8E45D7D0116770729A677D13FF30E8A7688FAAA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_140654_427243_027B22BF 
X-CRM114-Status: UNSURE (   9.52  )
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

From: Stefan Wahren <wahrenst@gmx.net>

In contrary to raspberrypi_fw_set_rate(), the ops for is_prepared() and
recalc_rate() silently ignore firmware errors by just returning 0.
Since these operations should never fail, add at least error logs
to inform the user.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/clk/bcm/clk-raspberrypi.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
index 8e4fde03ed232b464165f524d27744b4ced93a60..166d0bec380310e8b98f91568efa4aa88401af4f 100644
--- a/drivers/clk/bcm/clk-raspberrypi.c
+++ b/drivers/clk/bcm/clk-raspberrypi.c
@@ -194,8 +194,11 @@ static int raspberrypi_fw_is_prepared(struct clk_hw *hw)
 
 	ret = raspberrypi_clock_property(rpi->firmware, data,
 					 RPI_FIRMWARE_GET_CLOCK_STATE, &val);
-	if (ret)
+	if (ret) {
+		dev_err_ratelimited(rpi->dev, "Failed to get %s state: %d\n",
+				    clk_hw_get_name(hw), ret);
 		return 0;
+	}
 
 	return !!(val & RPI_FIRMWARE_STATE_ENABLE_BIT);
 }
@@ -211,8 +214,11 @@ static unsigned long raspberrypi_fw_get_rate(struct clk_hw *hw,
 
 	ret = raspberrypi_clock_property(rpi->firmware, data,
 					 RPI_FIRMWARE_GET_CLOCK_RATE, &val);
-	if (ret)
+	if (ret) {
+		dev_err_ratelimited(rpi->dev, "Failed to get %s frequency: %d\n",
+				    clk_hw_get_name(hw), ret);
 		return 0;
+	}
 
 	return val;
 }

-- 
2.50.0


