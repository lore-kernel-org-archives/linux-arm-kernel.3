Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF787D1950D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 17:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B7kyYc7RhFlSmWPDvngvLP1/s4eswS0lTVZC8IrSTyE=; b=r73UqZaQuWvdO+LgS2xWWmtTV0
	+AfSWAA4/tS+p8ts/Xo3EtjbmBHs9H2a924qVJirEZYXH31uJFFH0KbIKP1arBirmbDgLmR0sx/Ye
	P7lshDcKtOgiHQl+/ELZcZOuai/04mfEA77q/MHV6JbBs31HmPvBMdk2qTypj+MJn+2pcSvmd3CG1
	HYQeAMfLvS26BbQmBQnXCBDms2umGXWpTqHzM00NmYuS4DmvVwcHwVaWMJhCoZ5cABXhleUegOgRV
	ri4T0Ano2rppAQP5MiZl9lbgnes/W2WEev87wsvbvtUTnny+0FBV044dZ/tQfvRRQp47dIp0CuxWQ
	8lmFffFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkQN7-0000000CyIM-1lgn;
	Mon, 26 Jan 2026 17:27:29 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkQN3-0000000CyEl-03xN;
	Mon, 26 Jan 2026 17:27:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=B7kyYc7RhFlSmWPDvngvLP1/s4eswS0lTVZC8IrSTyE=; b=qvJJ4MVcEyhY4Hz5bWLduca16T
	FHExZwQYJDSuh366xM9FBqNQZx+Er1GeBWpFNXDlW0AkO8nE3M8T1E8iULvP9JAqCTWoRfOmLkqjF
	QmZWS+cgJyuCB92ZR5PWmdP2Zs1GjNaRgFhELGHikIGsBzE2gbRjRUGgdTmxBxSls8qdntDKnS1Jr
	wQOC3Upsc1HxQDS7Hn0a4qLFNzXPsc8e6KtLPp6lJhcJ6b4yiPA9Vojgp/xIMjFxItla7FkKQ8cxK
	exYyW2Jmn/zT8MaWLPGZt7pkaz6k2nGaulTFmw5uOcEMQ6ojrxGPcEw2qEOwrJudOZB5L1Bw3ILsn
	BF0L0Idg==;
Received: from [187.36.210.68] (helo=1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1vkQMw-00A8mi-Uq; Mon, 26 Jan 2026 18:27:19 +0100
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Mon, 26 Jan 2026 14:26:39 -0300
Subject: [PATCH v4 3/6] clk: bcm: rpi: Mark PIXEL_CLK and HEVC_CLK as
 CLK_IGNORE_UNUSED
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260126-v3d-power-management-v4-3-caf2df16d4e2@igalia.com>
References: <20260126-v3d-power-management-v4-0-caf2df16d4e2@igalia.com>
In-Reply-To: <20260126-v3d-power-management-v4-0-caf2df16d4e2@igalia.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Stefan Wahren <wahrenst@gmx.net>, Maxime Ripard <mripard@kernel.org>, 
 Melissa Wen <mwen@igalia.com>, Iago Toral Quiroga <itoral@igalia.com>, 
 Chema Casanova <jmcasanova@igalia.com>, Dom Cobley <popcornmix@gmail.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 kernel-dev@igalia.com, =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1280; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=HBxi3kNHRo5O0aV4BChTV5TSpsgJgBHlM1/y8UtvZUU=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBpd6Petkfs2R/SjKZbtviysA/KE4naLldxth79M
 /ns9oJIilOJATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaXej3gAKCRA/8w6Kdoj6
 qnT5B/4iTveg3MOxV/mK6PzIE/f/V7lpidYicTlaFqDyX3AHMPSIg47NwmFSLKZApyXWvGGE0Xk
 vBGPfxKF21KOz6C6wS2KHSdjekGH2Xp8x9taXcxoTC6SGr9nrNvJHqfjh1QtM+2pNs4LVZmILi5
 scl1BxYhRDkF70CalFAggAOvAAyC6aSdAuHN+pI4q+zseHpdzvsqMvCF5hjAtxWCSKwXclKUvP8
 JcK4+/HUbvvp6iXTnS2SG/W0lyt47USHR2gD4K/GVuOP8BFk/fYBT8NHJhDHuRqC3TtEBCBJrBt
 tUUwDAkOLOqnt9QNp8d39aRAglz5sr+bwZXnjmJHaD1ZTWGw
X-Developer-Key: i=mcanal@igalia.com; a=openpgp;
 fpr=F8E45D7D0116770729A677D13FF30E8A7688FAAA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_092725_059577_8A1EF411 
X-CRM114-Status: UNSURE (   9.84  )
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

If PIXEL_CLK or HEVC_CLK is disabled during boot, the firmware will skip
HSM initialization, which would result in a bus lockup. However, those
clocks are consumed by drivers (vc4 and HEVC decoder drivers,
respectively), which means that they can be enabled/disabled by the
drivers.

Mark those clocks as CLK_IGNORE_UNUSED to allow them to be disabled by
drivers when appropriate.

Acked-by: Melissa Wen <mwen@igalia.com>
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/clk/bcm/clk-raspberrypi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
index 2e63121af0900ac9b4874b666cf6d02baa8be11c..b9f2a4dc1510ff162c84d67aa0ddd7f435156398 100644
--- a/drivers/clk/bcm/clk-raspberrypi.c
+++ b/drivers/clk/bcm/clk-raspberrypi.c
@@ -139,12 +139,12 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] = {
 	[RPI_FIRMWARE_PIXEL_CLK_ID] = {
 		.export = true,
 		.minimize = true,
-		.flags = CLK_IS_CRITICAL,
+		.flags = CLK_IGNORE_UNUSED,
 	},
 	[RPI_FIRMWARE_HEVC_CLK_ID] = {
 		.export = true,
 		.minimize = true,
-		.flags = CLK_IS_CRITICAL,
+		.flags = CLK_IGNORE_UNUSED,
 	},
 	[RPI_FIRMWARE_ISP_CLK_ID] = {
 		.export = true,

-- 
2.52.0


