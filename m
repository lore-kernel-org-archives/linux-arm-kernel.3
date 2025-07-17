Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3F0EC83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 09:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cso+5tLqeTQKKO4EZ493bd6mPolRbgVqpRkTEZ8wCvs=; b=WP28zk6QQTXmoPBPnlP9pWBfR1
	rx/wfm1jLpEYCmI0KqmsSeJAD7mQEx3xp7sk3gBbB8P1bWCsrRQOXbRzB/+VtMfvkSlYjdrJIN+kq
	oLgWtrl6ivdH3uXyqbsSO+mXFhS/ND52HOA0kxN2cQVhi/mzDiPtYwN5vhXxiocgNoTv+pMTaJrox
	ZJfpAKHTNPI5BjhEA5XMm3mCdaV/5H7hf4imUr3jd+fsnoHVvRKP+6f/S+lSOM9OMTm9twPQm5MoW
	lOraYVD5S+cVk9W4A9CyUNsfxk0tq9GdaHre4ts4ej9rncfmosNmWnIap+mCA7TYVJmOm/rGXsUg+
	Yp0pHQTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucKx2-00000009jWO-0790;
	Thu, 17 Jul 2025 09:31:04 +0000
Received: from cpanel.siel.si ([46.19.9.99])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucKTt-00000009ezy-2hWv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 09:00:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=cso+5tLqeTQKKO4EZ493bd6mPolRbgVqpRkTEZ8wCvs=; b=GiHjAWZuixQ0SHXQ06qPgG6UT7
	Hq8yzPf2jUiJ/Zsr++itTALRJBdupkZk8y6MvoyxrpIpCKJoEhpvXoB1R9albUjf3TEwCItKP7/U/
	dVJ1RItYpuA9jVSCqwIpQT79ADlYsZWOY26H6Djt6bBnMu+9bdqm5EerqbS+hMWOvTMWCkpvnUz0n
	rJJMWMmO3YlJlYzLBfEdKcQmkdO23mm44tjo+wInWRSBs5wiLwqAZeSYOsKLOJHD2uCQd9puC8zZM
	7xjvxRuCAdN2ELGSHsMwfimJUAY/85KEUuT+IG59nkiNO30Ur1aWmEUrTdj3xbQboPPcGCV4WVWzE
	gOe/ynNQ==;
Received: from [89.212.21.243] (port=53282 helo=localhost.localdomain)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1ucKTp-00DbO3-1t;
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
Subject: [PATCH 1/2] net: fec: fec_probe(): Populate netdev of_node
Date: Thu, 17 Jul 2025 11:00:36 +0200
Message-Id: <20250717090037.4097520-2-primoz.fiser@norik.com>
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
X-CRM114-CacheID: sfid-20250717_020046_150662_F7E8A775 
X-CRM114-Status: UNSURE (   5.69  )
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

Populate netdev of_node with pdev of_node so that the network device
inherits the device tree node information from the platform device and
its of_node is available in sysfs.

Without this, udev is unable to expose the OF_* properties (OF_NAME,
OF_FULLNAME, OF_COMPATIBLE, OF_ALIAS, etc.) for the network interface.
These properties are commonly used by udev rules and other userspace
tools for device identification and configuration.

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
 drivers/net/ethernet/freescale/fec_main.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/freescale/fec_main.c b/drivers/net/ethernet/freescale/fec_main.c
index 63dac4272045..5142fed08cba 100644
--- a/drivers/net/ethernet/freescale/fec_main.c
+++ b/drivers/net/ethernet/freescale/fec_main.c
@@ -4359,6 +4359,7 @@ fec_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	SET_NETDEV_DEV(ndev, &pdev->dev);
+	ndev->dev.of_node = pdev->dev.of_node;
 
 	/* setup board info structure */
 	fep = netdev_priv(ndev);
-- 
2.34.1


