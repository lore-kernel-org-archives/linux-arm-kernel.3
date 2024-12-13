Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9847CE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 19:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GnGNXV9fY/OFbdFo3uaZITHwcc9v08Tzd5HOpCpKxEs=; b=TQuciblvU5WJna6c8RAoL117Jx
	YwlZd/Rq/Uk2uc003RKBwITsLq6u5k8t70exsYPi19ZxZorS+nBPFX2utsRzIn/BK3gKtbrjE/av/
	Ml36vvg/a/4dUpsz72xCmYZDeIO92cvmYCMFMai3emvauQJH1H+4qlo8m854VYE+Vt9pWWcHNfNU9
	42PhlpJFs9G5mPMJfKkWUM1KzQsV3q+wHPhCz1pFwaMl6yoE9YLoUTJGZVi8xFshDg48Od8W2NAR2
	Cyxfox+ENQWAuagz/ugOMhZFEcu4OqV+hsowRk+wlDfhuNBYOPF19kwgRQ88ymPWABvRfMLJ9Fo+5
	czITAUTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMBTZ-00000004owq-2g7G;
	Fri, 13 Dec 2024 19:37:25 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMBRS-00000004o2b-44Uq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 19:35:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=GnGNXV9fY/OFbdFo3uaZITHwcc9v08Tzd5HOpCpKxEs=; b=gXynTGLQlPgMUDTLLkWjpq8Ph/
	qR4YyX4amMJGOqU7fQTxDkycDxFyDm1QcTrsGhYa0bfi9sl1r3bMwM+/nA5N1bkTfr3rQjfJxz/mY
	nolrEDppVWX45eTjXRTsM3gDNrTwRiBGHBsNRK8Ox6KFU3pSv511WhQ3PMj+cReLkHyKJ6SArutqn
	Mo3OyxJiCa7QRozYfJvqVKz5/LqqZvxIm1Iiu6j1wCW7OfgpEZuZWTFiaGJVzzqs39t0nySMMJBna
	EhZBJaXTn7SK4AhZDkvIJ6yE6AoS9XMcgiFOCL6WuU/XLKucwuNuXPIVQA3oyXDdbzYwuUCc6dijC
	VMv2DMhA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:32860 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tMBRI-0007Db-0x;
	Fri, 13 Dec 2024 19:35:04 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tMBRF-006vae-WC; Fri, 13 Dec 2024 19:35:02 +0000
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
Subject: [PATCH net-next 3/5] net: pcs: mtk-lynxi: fill in PCS
 supported_interfaces
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tMBRF-006vae-WC@rmk-PC.armlinux.org.uk>
Date: Fri, 13 Dec 2024 19:35:01 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_113515_005373_FB70161B 
X-CRM114-Status: UNSURE (   8.29  )
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

Fill in the new PCS supported_interfaces member with the interfaces
that the Mediatek LynxI supports.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/pcs/pcs-mtk-lynxi.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/pcs/pcs-mtk-lynxi.c b/drivers/net/pcs/pcs-mtk-lynxi.c
index 7de804535229..1377fb78eaa1 100644
--- a/drivers/net/pcs/pcs-mtk-lynxi.c
+++ b/drivers/net/pcs/pcs-mtk-lynxi.c
@@ -306,6 +306,11 @@ struct phylink_pcs *mtk_pcs_lynxi_create(struct device *dev,
 	mpcs->pcs.poll = true;
 	mpcs->interface = PHY_INTERFACE_MODE_NA;
 
+	__set_bit(PHY_INTERFACE_MODE_SGMII, mpcs->pcs.supported_interfaces);
+	__set_bit(PHY_INTERFACE_MODE_QSGMII, mpcs->pcs.supported_interfaces);
+	__set_bit(PHY_INTERFACE_MODE_1000BASEX, mpcs->pcs.supported_interfaces);
+	__set_bit(PHY_INTERFACE_MODE_2500BASEX, mpcs->pcs.supported_interfaces);
+
 	return &mpcs->pcs;
 }
 EXPORT_SYMBOL(mtk_pcs_lynxi_create);
-- 
2.30.2


