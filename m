Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A4E2E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 19:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ABd+AOjaRP5bk7jBv3c6AzePtr2yGHsdlpUthvtnsxQ=; b=bUF9c6T348aiz4xE7V1Ulg5w7i
	ioAMgtaX2RektDsOr4M7h1AaneflBJphjyEJxrTWJs01OzWJw3WaCxlNdXY6FW43QA34RMp07wVgk
	WgPiPE5NoB/0Wd6yoZK4l9RMgVVfU1rJWw6gniYPglcScSmm6IyAnocayX41xBprebCT0e+7FMqYz
	ltJ0GDnBQUTjFCJPfKEpdTfAoqaTffVXf+HEU2hQ0Vw/8tFYVzMFo0/d7m++iFgjJu1qUipUJrDq2
	9tFfKBCqmWqC1yCqkqkmcyF2yogWwQvDcBfggRuyMxMrUvWqZg3XAvUbK99VdvcLL8B0/yqyPwITr
	XnVYZkXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMBUd-00000004pNc-1HfT;
	Fri, 13 Dec 2024 19:38:31 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMBRX-00000004o4M-3MUb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 19:35:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ABd+AOjaRP5bk7jBv3c6AzePtr2yGHsdlpUthvtnsxQ=; b=rodsGVZV6/+UQdxwu1Btu1TmLo
	NFw3yQRQ+LenklTb7E9BkZ4aQ4Tluk1/piS+Trnb984tMObnfu1pbT8hHGutS4I6vDQQ4XAXvxJO3
	NDgr9CoaF6Vj9wWSfAu6xoiV70mRh0WYvhqNK/BJbloPJTMWTG1ZZWV0lUXU5ZkWLDNToQSZTdtN+
	dlUv8TPQE6UBOmsWggIW8ixNdmhYncP6Ta7JPAKP27Tdpr/mZkTiDVzVVxl25SAUPjoiFLone+J1t
	aooOu3czXlAOg9MVeXVCgxN+xe/rtX4L3Ln6h4xpaOPhw6ODCToeF6DTW2CXkSZ3d97lM7WbsBybK
	CVdEZPig==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:41424 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tMBRN-0007Dw-0M;
	Fri, 13 Dec 2024 19:35:09 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tMBRL-006van-3c; Fri, 13 Dec 2024 19:35:07 +0000
In-Reply-To: <Z1yJQikqneoFNJT4@shell.armlinux.org.uk>
References: <Z1yJQikqneoFNJT4@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	 Jose Abreu <joabreu@synopsys.com>,
	 Andrew Lunn <andrew+netdev@lunn.ch>,
	 davem@davemloft.net,
	 Eric Dumazet <edumazet@google.com>,
	 Jakub Kicinski <kuba@kernel.org>,
	 Paolo Abeni <pabeni@redhat.com>,
	 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	 Alexis =?UTF-8?B?TG90aG9yw6k=?= <alexis.lothore@bootlin.com>,
	 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	 netdev@vger.kernel.org,
	 linux-stm32@st-md-mailman.stormreply.com,
	 linux-arm-kernel@lists.infradead.org,
	 linux-kernel@vger.kernel.org
Subject: [PATCH net-next 4/5] net: pcs: lynx: fill in PCS supported_interfaces
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tMBRL-006van-3c@rmk-PC.armlinux.org.uk>
Date: Fri, 13 Dec 2024 19:35:07 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_113519_839423_CE423BE7 
X-CRM114-Status: GOOD (  10.93  )
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

Fill in the new PCS supported_interfaces member with the interfaces
that Lynx supports.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/pcs/pcs-lynx.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/net/pcs/pcs-lynx.c b/drivers/net/pcs/pcs-lynx.c
index 767a8c0714ac..6457190ec6e7 100644
--- a/drivers/net/pcs/pcs-lynx.c
+++ b/drivers/net/pcs/pcs-lynx.c
@@ -334,9 +334,19 @@ static const struct phylink_pcs_ops lynx_pcs_phylink_ops = {
 	.pcs_link_up = lynx_pcs_link_up,
 };
 
+static const phy_interface_t lynx_interfaces[] = {
+	PHY_INTERFACE_MODE_SGMII,
+	PHY_INTERFACE_MODE_QSGMII,
+	PHY_INTERFACE_MODE_1000BASEX,
+	PHY_INTERFACE_MODE_2500BASEX,
+	PHY_INTERFACE_MODE_10GBASER,
+	PHY_INTERFACE_MODE_USXGMII,
+};
+
 static struct phylink_pcs *lynx_pcs_create(struct mdio_device *mdio)
 {
 	struct lynx_pcs *lynx;
+	int i;
 
 	lynx = kzalloc(sizeof(*lynx), GFP_KERNEL);
 	if (!lynx)
@@ -348,6 +358,9 @@ static struct phylink_pcs *lynx_pcs_create(struct mdio_device *mdio)
 	lynx->pcs.neg_mode = true;
 	lynx->pcs.poll = true;
 
+	for (i = 0; i < ARRAY_SIZE(lynx_interfaces); i++)
+		__set_bit(lynx_interfaces[i], lynx->pcs.supported_interfaces);
+
 	return lynx_to_phylink_pcs(lynx);
 }
 
-- 
2.30.2


