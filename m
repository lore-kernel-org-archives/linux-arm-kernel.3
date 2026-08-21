Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C4D5C5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 13:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HxdBvLKfkY1p3yzSeazl67B66gg5Y7KlU9adKnE2IqE=; b=puwV/LC1uVuQQ1d0TRfM79z6tl
	1y+WmL32XAIeQlGASxescMeGZiVt6j3u4h8zxwoMeZnnoXD+Z2+cpf++TJpb4J4M+0nvN3sQpgErM
	OS2DbOAN7LjNytBlTVqEgu709LsH010dH9DnK+wX71QSIbFGJQ6yFDwhhQFq1z97VVMXHOBZtt3/2
	sGI8Mq/CDGoPbWjDiGSNeZuGT6TvdicBGew4yWiYCVBby3Z68Q52tqJfVBbGKsfFbvnE6GbxmfpIz
	eR9Bmp73nL7ZKg7AxKjzqRxJ/PheG0xJYaWjcJjxqjLjIRHJASwaMhbMoHzgd8QHgLbFGI5Sw1i4V
	cmCh9Vzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxPdt-0000000DSk9-3Sai;
	Fri, 21 Aug 2026 13:50:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxPdi-0000000DSbL-2zet;
	Fri, 21 Aug 2026 13:50:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 29DCF43E11;
	Fri, 21 Aug 2026 13:50:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E7429C4AF09;
	Fri, 21 Aug 2026 13:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787320234;
	bh=4jAaIiXyX7A+vKSBPBQthDtjH8uCrqGssc0AUrXmwpg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=APjclCskI1ell56dVd4LDS6bx2lKrmZSmyWuEx132BWrfuduqr6Jw4agq7xwpN02Y
	 LUzismyzUqTLLIZl2LJuvqIhmerpoiwX3vtEatRbFrSabSoG67dYvE/fH8tXWr22hl
	 T6MFPxww7zZLXcfNoTEPdwDrozMzl9jkNDLmhxRh+VRe/11Of6bOixWUZ2T1r6bwBJ
	 E/AkuCnFezLnyPnNKRKeVDnHzGdzBJY9RoR0K3gq7AqJrMWMXiz6uA620fZf5cjk6c
	 WA6svMBdGF2R6qcXSd1wf3+H9aHYvgSEWwn26Et2Ob/FMWIiS/GrNEMyUqmZbQNyJn
	 nJN3Y0AZAwxvA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D46BAC5DF96;
	Fri, 21 Aug 2026 13:50:33 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Fri, 21 Aug 2026 15:50:28 +0200
Subject: [PATCH 2/3] phy: apple: atc: Factor out the PIPE mux sequence
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-b4-atcphy-usb4-v1-2-45c0b741e0c0@kernel.org>
References: <20260821-b4-atcphy-usb4-v1-0-45c0b741e0c0@kernel.org>
In-Reply-To: <20260821-b4-atcphy-usb4-v1-0-45c0b741e0c0@kernel.org>
To: Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sven Peter <sven@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4042; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=4jAaIiXyX7A+vKSBPBQthDtjH8uCrqGssc0AUrXmwpg=;
 b=owGbwMvMwCXmIlirolUq95LxtFoSQ1ZH+DKuB+oG2UUW35mElVkmWbqs+iXDM3fj9fDQ37uv+
 ly0b93TUcrCIMbFICumyLJ9v73pk4dvBJduuvQeZg4rE8gQBi5OAZhIwjlGhlXWluLskgLOt9Mt
 biV2lCx6q3jgvc8Mgc/LP/QrFTB92cTwT8nvyoNc4+rvdWte2zy6dsv7+q9tSgmmJm4cu+Z03FF
 z5QUA
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407
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

This sequence is already used in three places and we're about to add a
fourth copy so let's factor it out to a helper. No functional change.

Signed-off-by: Sven Peter <sven@kernel.org>
---
 drivers/phy/apple/atc.c | 46 +++++++++++++++++++---------------------------
 1 file changed, 19 insertions(+), 27 deletions(-)

diff --git a/drivers/phy/apple/atc.c b/drivers/phy/apple/atc.c
index a3162f25e6cd..96158d348656 100644
--- a/drivers/phy/apple/atc.c
+++ b/drivers/phy/apple/atc.c
@@ -972,6 +972,19 @@ static int atcphy_pipehandler_check(struct apple_atcphy *atcphy)
 	return 0;
 }
 
+static void atcphy_pipehandler_set_mux(struct apple_atcphy *atcphy, u32 data, u32 clk)
+{
+	mask32(atcphy->regs.pipehandler + PIPEHANDLER_MUX_CTRL, PIPEHANDLER_MUX_CTRL_CLK,
+	       FIELD_PREP(PIPEHANDLER_MUX_CTRL_CLK, PIPEHANDLER_MUX_CTRL_CLK_OFF));
+	udelay(10);
+	mask32(atcphy->regs.pipehandler + PIPEHANDLER_MUX_CTRL, PIPEHANDLER_MUX_CTRL_DATA,
+	       FIELD_PREP(PIPEHANDLER_MUX_CTRL_DATA, data));
+	udelay(10);
+	mask32(atcphy->regs.pipehandler + PIPEHANDLER_MUX_CTRL, PIPEHANDLER_MUX_CTRL_CLK,
+	       FIELD_PREP(PIPEHANDLER_MUX_CTRL_CLK, clk));
+	udelay(10);
+}
+
 static int atcphy_configure_pipehandler_usb3(struct apple_atcphy *atcphy, bool host)
 {
 	int ret;
@@ -1054,15 +1067,8 @@ static int atcphy_configure_pipehandler_usb3(struct apple_atcphy *atcphy, bool h
 	}
 
 	/* Configure PIPE mux to USB3 PHY */
-	mask32(atcphy->regs.pipehandler + PIPEHANDLER_MUX_CTRL, PIPEHANDLER_MUX_CTRL_CLK,
-	       FIELD_PREP(PIPEHANDLER_MUX_CTRL_CLK, PIPEHANDLER_MUX_CTRL_CLK_OFF));
-	udelay(10);
-	mask32(atcphy->regs.pipehandler + PIPEHANDLER_MUX_CTRL, PIPEHANDLER_MUX_CTRL_DATA,
-	       FIELD_PREP(PIPEHANDLER_MUX_CTRL_DATA, PIPEHANDLER_MUX_CTRL_DATA_USB3));
-	udelay(10);
-	mask32(atcphy->regs.pipehandler + PIPEHANDLER_MUX_CTRL, PIPEHANDLER_MUX_CTRL_CLK,
-	       FIELD_PREP(PIPEHANDLER_MUX_CTRL_CLK, PIPEHANDLER_MUX_CTRL_CLK_USB3));
-	udelay(10);
+	atcphy_pipehandler_set_mux(atcphy, PIPEHANDLER_MUX_CTRL_DATA_USB3,
+				   PIPEHANDLER_MUX_CTRL_CLK_USB3);
 
 	/* Remove link detection override */
 	clear32(atcphy->regs.pipehandler + PIPEHANDLER_OVERRIDE, PIPEHANDLER_OVERRIDE_RXVALID);
@@ -1097,15 +1103,8 @@ static int atcphy_configure_pipehandler_dummy(struct apple_atcphy *atcphy)
 		dev_warn(atcphy->dev, "Failed to lock pipehandler");
 
 	/* Switch to dummy PHY */
-	mask32(atcphy->regs.pipehandler + PIPEHANDLER_MUX_CTRL, PIPEHANDLER_MUX_CTRL_CLK,
-	       FIELD_PREP(PIPEHANDLER_MUX_CTRL_CLK, PIPEHANDLER_MUX_CTRL_CLK_OFF));
-	udelay(10);
-	mask32(atcphy->regs.pipehandler + PIPEHANDLER_MUX_CTRL, PIPEHANDLER_MUX_CTRL_DATA,
-	       FIELD_PREP(PIPEHANDLER_MUX_CTRL_DATA, PIPEHANDLER_MUX_CTRL_DATA_DUMMY));
-	udelay(10);
-	mask32(atcphy->regs.pipehandler + PIPEHANDLER_MUX_CTRL, PIPEHANDLER_MUX_CTRL_CLK,
-	       FIELD_PREP(PIPEHANDLER_MUX_CTRL_CLK, PIPEHANDLER_MUX_CTRL_CLK_DUMMY));
-	udelay(10);
+	atcphy_pipehandler_set_mux(atcphy, PIPEHANDLER_MUX_CTRL_DATA_DUMMY,
+				   PIPEHANDLER_MUX_CTRL_CLK_DUMMY);
 
 	ret = atcphy_pipehandler_unlock(atcphy);
 	if (ret)
@@ -1149,15 +1148,8 @@ static void atcphy_setup_pipehandler(struct apple_atcphy *atcphy)
 {
 	lockdep_assert_held(&atcphy->lock);
 
-	mask32(atcphy->regs.pipehandler + PIPEHANDLER_MUX_CTRL, PIPEHANDLER_MUX_CTRL_CLK,
-	       FIELD_PREP(PIPEHANDLER_MUX_CTRL_CLK, PIPEHANDLER_MUX_CTRL_CLK_OFF));
-	udelay(10);
-	mask32(atcphy->regs.pipehandler + PIPEHANDLER_MUX_CTRL, PIPEHANDLER_MUX_CTRL_DATA,
-	       FIELD_PREP(PIPEHANDLER_MUX_CTRL_DATA, PIPEHANDLER_MUX_CTRL_DATA_DUMMY));
-	udelay(10);
-	mask32(atcphy->regs.pipehandler + PIPEHANDLER_MUX_CTRL, PIPEHANDLER_MUX_CTRL_CLK,
-	       FIELD_PREP(PIPEHANDLER_MUX_CTRL_CLK, PIPEHANDLER_MUX_CTRL_CLK_DUMMY));
-	udelay(10);
+	atcphy_pipehandler_set_mux(atcphy, PIPEHANDLER_MUX_CTRL_DATA_DUMMY,
+				   PIPEHANDLER_MUX_CTRL_CLK_DUMMY);
 }
 
 static void atcphy_configure_lanes(struct apple_atcphy *atcphy, enum atcphy_mode mode)

-- 
2.55.0



