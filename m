Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68C2DC5DF97
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 14:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zzj4GVc4/x2SELeaKUar7dAIv8TFPTU4PPNQ7zCE1Ak=; b=PImlbwzGWVtlX7h2zO5H68o+7e
	bmufKnwte+Ay46d8USJq6icCMVAIH2cDn3+JUf1E6uLNNCAWRfCXnhLgIrAlpzdeG+VmtRSYTfdNx
	8wbA/SjkrVTE55Pw1inglZAPjGzQVgan330irE7Hee9Y2Wbl8KFV6dqKOl4yGlEx78oZGg4GIwRHF
	qdAWj9yy3S36y64vVyipY96VQubleGfkfy/Kxa8JrL+PM2QaSCfL8Zkm1rrKTO/e2MLIW1H8tEipQ
	rhvffCygl4uC1li6yrD7DpRyZoQ18BRiy1EZ0NSAjntmWY1PGVptadRk/2ScuJDnlLgwzO5hA3MMP
	Xcst9JwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzEG2-00000002Yyt-3w75;
	Wed, 26 Aug 2026 14:05:38 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzEFv-00000002Yvu-02Aj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 14:05:32 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8FF181A1842;
	Wed, 26 Aug 2026 14:05:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 63D0C604EC;
	Wed, 26 Aug 2026 14:05:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BF0B511C78266;
	Wed, 26 Aug 2026 16:05:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787753127; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=Zzj4GVc4/x2SELeaKUar7dAIv8TFPTU4PPNQ7zCE1Ak=;
	b=FfjLbO664rsEBix13EAJ7rDB6BedWoXbIoLiMiDoGGVO9GskY0XSHj0MNByvCpwj/BC4MH
	H5q5XGbiBe/WvP8CGoLk1+m+OlWSAIhEiggprCjdKirInkVJekII270a1bc9Gi2twAk/aC
	Wu5fCfpKA2egZZol0QidPvAQipS15aUTMgs/VkS4ljodqE6bs/6i2JgUofj5E5WUJf1c96
	AjiDE3E8daeVA1fZv7QEGqQWT9b3Zz3l0QXZ0rW41JtZWWaRgtX844qbH/nEIv45mjx2+/
	xj/AJrxpYZUwynLVQMdss3HRmWj5uMRvP5ZVP1m9mgCjXqurDNKvCnwI4dXGig==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	=?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Minda Chen <minda.chen@starfivetech.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jan Petrous <jan.petrous@oss.nxp.com>,
	Ovidiu Panait <ovidiu.panait.rb@renesas.com>,
	Jose.Abreu@synopsys.com
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	thomas.petazzoni@bootlin.com,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH net 2/6] net: stmmac: dwmac1000: Account for the primary MAC address for UC filtering
Date: Wed, 26 Aug 2026 16:04:54 +0200
Message-ID: <20260826140500.616466-3-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826140500.616466-1-maxime.chevallier@bootlin.com>
References: <20260826140500.616466-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_070531_373113_1A7B6C63 
X-CRM114-Status: GOOD (  12.90  )
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

The same filter slots are used to store the main MAC address as well as
the address for the unicast filter. Let's account for that when deciding
whether or not to use promisc when programming the UC list in hardware.

Fixes: 47dd7a540b8a ("net: add support for STMicroelectronics Ethernet controllers.")
Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
index caac85fc08f1..d4ace3924891 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
@@ -194,7 +194,7 @@ static void dwmac1000_set_filter(struct mac_device_info *hw,
 	dwmac1000_set_mchash(ioaddr, mc_filter, mcbitslog2);
 
 	/* Handle multiple unicast addresses (perfect filtering) */
-	if (netdev_uc_count(dev) > perfect_addr_number)
+	if (netdev_uc_count(dev) + 1 > perfect_addr_number)
 		/* Switch to promiscuous mode if more than unicast
 		 * addresses are requested than supported by hardware.
 		 */
-- 
2.55.0


