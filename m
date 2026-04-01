Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 889A9D35171
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 11:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=93p9L3k+sUGmocfBSVzKGZHTWa/Pn999YBF5eBW86uY=; b=AcQzo5fIeKS3jCflxKyvzCiBw0
	uzJPCFYV3uUcBuKJU025fuoIPIru4a81yknBzTyXWCr31RYGf220umvBksdGeepz8FTHDMApzk8ir
	ZxzyuEB5smEu/vyJ/VQjoPEtsVRcjBk9LpSCZrZkEwefo0y1qK2J8UKvwqq8qBuSQsX2/hCEw/0wZ
	LlgYh0WWLLenFLkalrjQJk08XyhoBimbbZvpP/jN7bPE/t2WRo/UXnsSFnqIsIjl9QqPiEoXaupPL
	TJRuCuYAdjXJUPs3o475V24Ud6kCcXqR4prBW2+Woo5fO3IjM7z1xVlsq9ibH4lOc8wT5psWku1b9
	YcX43Vng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7tXD-0000000Ebo7-2u0F;
	Wed, 01 Apr 2026 11:14:55 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7tX9-0000000Ebm9-0yhq;
	Wed, 01 Apr 2026 11:14:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
	Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=93p9L3k+sUGmocfBSVzKGZHTWa/Pn999YBF5eBW86uY=; b=HmRiBARyPM06LMZajCZb+DGAxu
	DmgwtsEM7Ml5uZpe3FgM3HxWL8eC6Wf3ztDZJRgtpOKjVGGvsIv4lmWfk8De9VRh1OELS04igS5LM
	sYthgM8d7OJL1k2/BWyplj1Am2ZymtqSUJtoVFaQpLLcrHX85LMVPro57kVMyD/HMmarWJvPRy6/T
	h/ysIqdyI9ChBMuIVR5+3Y2jLflu/HtT1zmm8PaDlFkwZ5Gan/XkI44amn5GloHKh6yycc1zZ4zKV
	BK9TUHOq5b+IJ2VdzTeJrfEeoJusnpOsBTwReE24j/DuVHpEWaGhlVVBbjM45CGel/wQz1COBBXzL
	4sEy1xLA==;
Received: from [189.7.87.169] (helo=prince)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1w7tWv-009twc-LF; Wed, 01 Apr 2026 13:14:38 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Mark Brown <broonie@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Dom Cobley <popcornmix@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: linux-clk@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel-dev@igalia.com,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Subject: [PATCH] clk: bcm: rpi: Mark VEC clock as CLK_IGNORE_UNUSED
Date: Wed,  1 Apr 2026 08:13:57 -0300
Message-ID: <20260401111416.562279-2-mcanal@igalia.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_041452_384512_21952956 
X-CRM114-Status: UNSURE (   9.71  )
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

On Raspberry Pi 3B, the VEC clock is used by the VideoCore firmware
display driver, which remains active until the vc4 driver loads and
sends NOTIFY_DISPLAY_DONE. If this clock is disabled during boot, a bus
lockup happens and the firmware becomes unresponsive, causing a complete
system lockup.

Mark the VEC clock with CLK_IGNORE_UNUSED so it survives the unused
clock disablement and remains available until the vc4 driver takes over
display management.

Fixes: 672299736af6 ("clk: bcm: rpi: Manage clock rate in prepare/unprepare callbacks")
Reported-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/clk/bcm/clk-raspberrypi.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
index df2d246eb6ef..f1a99de6de4f 100644
--- a/drivers/clk/bcm/clk-raspberrypi.c
+++ b/drivers/clk/bcm/clk-raspberrypi.c
@@ -160,6 +160,13 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] = {
 	[RPI_FIRMWARE_VEC_CLK_ID] = {
 		.export = true,
 		.minimize = true,
+
+		/*
+		 * If this clock is disabled during boot, it causes a bus
+		 * lockup in RPi 3B. Therefore, make sure it's left enabled
+		 * during boot.
+		 */
+		.flags = CLK_IGNORE_UNUSED,
 	},
 	[RPI_FIRMWARE_DISP_CLK_ID] = {
 		.export = true,
-- 
2.53.0


