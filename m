Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5967FC61DE2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 07:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JWMWw4FwzjGvX2iKfmXe0I6b/+rjNzreNT87o090rWg=; b=zGTvgD+1NFN9Lz1TowUDmKtWFM
	K9xICatjw3p3j1v1bkVOQgM/etXkSK55pzj0kMUQ61SkP19ygCb+/YfiN1rnoHQkea5+JUd2OMkJz
	hZKoN0Vrv8J9HhE0Q9zpenBrKQLZJdt9DcZ+rETjjZwhwhTp6Qxhtl0Kk69Re9BUUCXundTInb+6e
	6L2fjFeeyLcTwh9keWULS7GiXZSGgDrGykju21rBSiMDYtpzk6oyhK/Z5vjC3xsc6Rwk9Kku8RhUc
	to39hNr7KANLe7uzpgqgwynF9nyFBu/mw8t8pzEIZYL2RDWJW8V4S0MVH94kM2Zs0DEeGlwClfr2Y
	IHE0g7/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0w1c-00000008fkm-0j74;
	Mon, 31 Aug 2026 07:01:48 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0w1Y-00000008fjE-1yHI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 07:01:46 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A9DB44E4145B;
	Mon, 31 Aug 2026 07:01:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7A187601E1;
	Mon, 31 Aug 2026 07:01:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6740411C78A4C;
	Mon, 31 Aug 2026 09:01:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788159694; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=JWMWw4FwzjGvX2iKfmXe0I6b/+rjNzreNT87o090rWg=;
	b=bztAEhcLXhBf7yPrZ53OqQWY5eOwhfChK2LTsEpMAAKE3aW4Ue3q3IdTeBZAef5EpzqJhI
	3xsdyqW0Vc57YV3l6mEcNbaSqqR+cJFKkO3goduKhFp3FAn0JORT2BD2pfo0tGP5mvGRz/
	8TFkuddjS5Xylc0ZzYeSR6xnvOBgOSBCrBNV8jg1DQwQgJyDy9nNZv8XHQnlafh8EWBnWU
	hHPVRdY3pRWmUZzfRgPsyoflMrwDGCrusYzkENAGt6Qx8G8hKovtaacz3iveNI1X8U75cH
	mY/YT8Ji+9lDO0zTzHLARuce2jX9H02nP0xPUdaHTUonY/FdvXfTUs0lljSmZA==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Russell King <linux@armlinux.org.uk>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	thomas.petazzoni@bootlin.com,
	=?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH net-next 0/2] net: stmmac: dwmac4: Auto-discover UC filter size
Date: Mon, 31 Aug 2026 09:01:18 +0200
Message-ID: <20260831070121.349778-1-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_000144_675571_85A8B810 
X-CRM114-Status: UNSURE (   8.84  )
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

Following my attempts to get clean ethtool selftests runs on stmmac [1],
several issues were found with the unicast filtering.

[1]: https://lore.kernel.org/netdev/20260827134004.45ffb57e@kernel.org/

This lead to the discovery that on dwmac4 platforms, the unicast filter
size is always falling back to the default value of 1 entry. On older
variants, the size comes from devicetree.

With a single-entry filter, we directly fallback to unicast promisc as
soon as any entry is added in the dev->uc list.

dwmac4 exposes through the HW_Features0 register the actual size of the
unicast filter, which is made of 3 banks (details in patch 2). Let's use
this feature to grab the filter size.

Results on actual hardware :

 - imx8mp   : goes from 1 entry to 64
 - stm32mp1 : goes from 1 entry to 4
 - jh7110   : goes from 1 entry to 9
 - yt6801   : still 1 single entry, on extra implemented in HW

Maxime Chevallier (2):
  net: stmmac: dwmac4: Read the UC filter size from hardware
    capabilities
  net: stmmac: dwmac4: Use the full perfect filter ability for UC filter

 drivers/net/ethernet/stmicro/stmmac/common.h  |  5 ++
 drivers/net/ethernet/stmicro/stmmac/dwmac4.h  |  6 +-
 .../net/ethernet/stmicro/stmmac/dwmac4_core.c | 60 +++++++++++++++----
 .../net/ethernet/stmicro/stmmac/dwmac4_dma.c  |  2 +
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 39 ++++++++++++
 5 files changed, 99 insertions(+), 13 deletions(-)

-- 
2.55.0


