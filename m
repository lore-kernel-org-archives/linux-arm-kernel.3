Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FBB8C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 09:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kVLHVGAR/VZN5lwNOcVQ4DkumoYnRZVacqL4KhRzyk0=; b=jXMTjg2bnWVTT4sE6YQg+I8EX+
	wnz3Of4OS0Vf4b7692vnwHeNT7ciYWEX8H6h3bALxPU9QoZWbcuVAMBGTRdN2IufRFpOaaYwK7+vW
	r3B9TyEqaE7Qs6ZgMFSDAF78/SaBkNWHWdHxwoBXPyT2DQVmV9Ed5V6NJ67JMfvnTRj557cHveVxZ
	guCAY3pjB/r6AyOh3m451STWLwR7ZxNuPJbVpkQCE4rLaIRpBY80Zp4bm006f+rCevHLHMg2YmZLh
	r6bTy/FE29Q8BpSZn1oj7tdSEJJjK272WZ7tYNH3pwYuLlzcvf8OoYJwj6Vc8oVfWYiXRA5WiomEL
	xGfElA7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucKzR-00000009jf9-0BVk;
	Thu, 17 Jul 2025 09:33:21 +0000
Received: from cpanel.siel.si ([46.19.9.99])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucKTt-00000009ezz-2hZe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 09:00:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=kVLHVGAR/VZN5lwNOcVQ4DkumoYnRZVacqL4KhRzyk0=; b=mhoYAAvM282xWLPZaKiZFohYwl
	15QSI2VNw+NpS8LTjdfbA8lwAUXNfU/hL/5WGt4geYDjJV07tBriAaD7B//4v0fXy7xTlGgdDI0+k
	oXll1z472mDv7+sPcJYLwwWIhO9wllxXE+NXnuee6rdZLXYmzx71LZWJUzV+0W3CQ9e2etSTTpTc0
	yLROQA4oW/ViwSjTPS8dbciFRsIkKlNlZ+c6Qyr2iOw6BDfOWxmp6x1tmCCQBl8tPwcfgyjdR3snN
	qghVTn3G6idXIxqgUjNKYIquOeDEbp/DMCVtGaQK8w3YXVvOwtvhzY2/QQxUok7qv3eTIFCO7sSwo
	E4w1pjxA==;
Received: from [89.212.21.243] (port=53282 helo=localhost.localdomain)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1ucKTp-00DbO3-2J;
	Thu, 17 Jul 2025 11:00:40 +0200
From: Primoz Fiser <primoz.fiser@norik.com>
To: Wei Fang <wei.fang@nxp.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Clark Wang <xiaoning.wang@nxp.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: imx@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	upstream@lists.phytec.de
Subject: [PATCH 2/2] net: stmmac: Populate netdev of_node
Date: Thu, 17 Jul 2025 11:00:37 +0200
Message-Id: <20250717090037.4097520-3-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250717090037.4097520-1-primoz.fiser@norik.com>
References: <20250717090037.4097520-1-primoz.fiser@norik.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cpanel.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_020046_156121_B25F1F95 
X-CRM114-Status: UNSURE (   5.11  )
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

Populate netdev of_node with device of_node so that the network device
inherits the device tree node information in case of platform device.
On the other hand, when stmmac_dvr_probe() is called from pci device,
of_node will be NULL preserving current behavior.

With this in place, when initiated from platform device, udev will be
able to export OF_* properties (OF_NAME, OF_FULLNAME, OF_COMPATIBLE,
OF_ALIAS, etc) for the network interface. These properties are commonly
used by udev rules and other userspace tools for device identification
and configuration.

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index f350a6662880..dfd503a87f22 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -7487,6 +7487,7 @@ int stmmac_dvr_probe(struct device *device,
 		return -ENOMEM;
 
 	SET_NETDEV_DEV(ndev, device);
+	ndev->dev.of_node = device->of_node;
 
 	priv = netdev_priv(ndev);
 	priv->device = device;
-- 
2.34.1


