Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 281C7C5DF89
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 13:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DRc9qjIA9qp29HSwDcRMRLh9QdGpNIQXskKoCe3zzf8=; b=lNVTGTNPFfjMvR6+tuRvqazvda
	Mry77ydueLs2rYBbuohGYzLjGObd2g1O1jNXCdnEtusO7ObhVD2V7/BhrG0OGmG3our3ZAfFvMf5b
	jd8Tsfw6c2I2brHoA8Jo7guE5MhU0kv9PQXNe40RbT56AB5UK+UBdaJ4yrn8f1yy39eRftPpTl5dK
	7jPa8YU8Y10q9OaO3pJWx7hBS3WFQeQJ+IW7vvKtucrOfyGgZS+wEIy0ofRotMQcFr8NNtvpWkKln
	PvovNDItSwi5RxGxjvYtgC/Put52k51XzAvCy8bMgIak0RO8MNpVHeXKF8tXIxERxo2PNAFjcxk4V
	8aDsWUGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxPdt-0000000DSjB-1KbR;
	Fri, 21 Aug 2026 13:50:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxPdi-0000000DSbN-1mRq;
	Fri, 21 Aug 2026 13:50:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 30D8143E4E;
	Fri, 21 Aug 2026 13:50:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0833AC2BCFF;
	Fri, 21 Aug 2026 13:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787320234;
	bh=WrxF+hzknbWy6eCuGGX+A/+N5AW7fUPL2sZ1KI+FggQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kBPZLPAClNuT67QPNeVSObFL/hXnnOWSkbt4NjSDkLTi7ORrJtbV2omrpB2DEc27b
	 gtVKNZyvDID1EKisQxSlgPra+yduwRXjIyXUqsW4SDQAznnGJC2QsKtN8odZZInv+3
	 9qc8uoD4z8Bdsde8AeB/akBNKQ5cKPKfb9QN3jRTaVpn68KNJE3WMn1aNn6Q8SGXEV
	 fhrY60PKBLsXd1QL1qnXiVm5MG/NFXpiazDbaDTw3IMbac+mj7NJcnCAd6hn/AhWMN
	 0M6Ou6eeYRFOm6LvFxUGhr80jsrHISQZULUDo8vx3B0nyT6y9g7JAaYXATHR84YQ4c
	 10Aub/HqXgPnw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9C76C5DF95;
	Fri, 21 Aug 2026 13:50:33 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Fri, 21 Aug 2026 15:50:29 +0200
Subject: [PATCH 3/3] phy: apple: atc: Implement the USB4 pipehandler state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-b4-atcphy-usb4-v1-3-45c0b741e0c0@kernel.org>
References: <20260821-b4-atcphy-usb4-v1-0-45c0b741e0c0@kernel.org>
In-Reply-To: <20260821-b4-atcphy-usb4-v1-0-45c0b741e0c0@kernel.org>
To: Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sven Peter <sven@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2592; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=WrxF+hzknbWy6eCuGGX+A/+N5AW7fUPL2sZ1KI+FggQ=;
 b=owGbwMvMwCXmIlirolUq95LxtFoSQ1ZH+HLe+IxdyrffM3xjmi3YIcB+Nfa6d4LOU5O0Bp7CM
 v6eOIuOUhYGMS4GWTFFlu377U2fPHwjuHTTpfcwc1iZQIYwcHEKwESu3WZkmDDt7KTCF9O+rfRm
 U37kuvlyb4/eG4UzzhebXjltPf0tIIbhv6dIw76pT2LCiva8NL/+s7jsyjXr203+Vp5Obw4Yti2
 9xQAA
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

USB3 tunneled via USB4 requires dwc3's PIPE interface to be switched to
the USB4 NHI which will take care of the tunneling. Add the required
bringup sequence such that USB3 tunnels work once the USB4 NHI is
upstream.

Signed-off-by: Sven Peter <sven@kernel.org>
---
 drivers/phy/apple/atc.c | 41 +++++++++++++++++++++++++++++++++++++----
 1 file changed, 37 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/apple/atc.c b/drivers/phy/apple/atc.c
index 96158d348656..613bcd0ae886 100644
--- a/drivers/phy/apple/atc.c
+++ b/drivers/phy/apple/atc.c
@@ -1084,6 +1084,41 @@ static int atcphy_configure_pipehandler_usb3(struct apple_atcphy *atcphy, bool h
 	return 0;
 }
 
+static int atcphy_configure_pipehandler_usb4(struct apple_atcphy *atcphy)
+{
+	int ret;
+
+	ret = atcphy_pipehandler_check(atcphy);
+	if (ret)
+		return ret;
+
+	/* Force disable link detection */
+	clear32(atcphy->regs.pipehandler + PIPEHANDLER_OVERRIDE_VALUES,
+		PIPEHANDLER_OVERRIDE_VAL_RXDETECT0 | PIPEHANDLER_OVERRIDE_VAL_RXDETECT1);
+	set32(atcphy->regs.pipehandler + PIPEHANDLER_OVERRIDE, PIPEHANDLER_OVERRIDE_RXVALID);
+	set32(atcphy->regs.pipehandler + PIPEHANDLER_OVERRIDE, PIPEHANDLER_OVERRIDE_RXDETECT);
+
+	ret = atcphy_pipehandler_lock(atcphy);
+	if (ret) {
+		dev_err(atcphy->dev, "Failed to lock pipehandler\n");
+		return ret;
+	}
+
+	/* Configure PIPE mux to the USB4/Thunderbolt controller */
+	atcphy_pipehandler_set_mux(atcphy, PIPEHANDLER_MUX_CTRL_DATA_USB4,
+				   PIPEHANDLER_MUX_CTRL_CLK_USB4);
+
+	/* Remove link detection override */
+	clear32(atcphy->regs.pipehandler + PIPEHANDLER_OVERRIDE, PIPEHANDLER_OVERRIDE_RXVALID);
+	clear32(atcphy->regs.pipehandler + PIPEHANDLER_OVERRIDE, PIPEHANDLER_OVERRIDE_RXDETECT);
+
+	ret = atcphy_pipehandler_unlock(atcphy);
+	if (ret)
+		dev_warn(atcphy->dev, "Failed to unlock pipehandler\n");
+
+	return 0;
+}
+
 static int atcphy_configure_pipehandler_dummy(struct apple_atcphy *atcphy)
 {
 	int ret;
@@ -1130,10 +1165,8 @@ static int atcphy_configure_pipehandler(struct apple_atcphy *atcphy, bool host)
 		atcphy->pipehandler_up = true;
 		break;
 	case ATCPHY_PIPEHANDLER_STATE_USB4:
-		dev_warn(atcphy->dev,
-			 "ATCPHY_PIPEHANDLER_STATE_USB4 not implemented; falling back to USB2\n");
-		ret = atcphy_configure_pipehandler_dummy(atcphy);
-		atcphy->pipehandler_up = false;
+		ret = atcphy_configure_pipehandler_usb4(atcphy);
+		atcphy->pipehandler_up = true;
 		break;
 	case ATCPHY_PIPEHANDLER_STATE_DUMMY:
 		ret = atcphy_configure_pipehandler_dummy(atcphy);

-- 
2.55.0



