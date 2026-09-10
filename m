Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C580C79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 15:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RJfocTlOORaTvso6KmauJUuwxsbukatHXvhE99wz6ZY=; b=vJ0mueotjXCTW9SSpJThyv7Mw1
	mIk5GLImNvTygCe0AMgDL1pod9Z8CG12yU1aYdlbqtdOSVRy6SQ1+X1/5bP6IjHN7mM4LZ4SpNFe4
	nLzuZKIR7hNJIYp9YXvN3huJbzP6payY3TTyWAfMnDYgLw+CfJwsKpvOASEmNF5/pzKCPuIqvQa6F
	17Gl2627DVkBMgxtbKwyeCtxedcnd7RSLP00q5YvDQ6Tu0fXfhpvirAbrU3hJjhLtngDbbC3WDjZK
	Kr1bZldQ87hZHg+B/YBn1C5wVG5+t63vYTfefoJ8K1DfYHjKON1henf7SG+FcpTW2dn8s6djUOSMi
	/QwwBuWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4gU4-0000000EkMX-3IIb;
	Thu, 10 Sep 2026 15:14:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4gU3-0000000EkKP-0bnH
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 10 Sep 2026 15:14:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=RJfocTlOORaTvso6KmauJUuwxsbukatHXvhE99wz6ZY=; b=lMdDifXIpomFCFXl4DSV60NFF/
	SXriAKydDK3TQuTQTNTO1NraCcuD0Rpo6qtA6hUXuOp4PegqVvLDJN7WM8Vq9X5IVkdUOoCIIgLPc
	PnqoKJ5rAfcLT7AtZafzL0OrhlOe3eMxRWKuzqPpV/0nDW5WdiUphlU3ic3ggn64ksXQWEwS7VqNN
	brPSyc3JMr+LqlM8pj+gE9zSjS5ez8x1qYLy1eT0wArzNtpmnd7St/4xFZYjTSIN5+Uum70Li3eM1
	PvPqrm4xKNVjKIjvPl7nkFzoYsZWNstZolpGhGoXKJjBMZk1jfdxsevjhIxgLtM4JDjXr+cm3NaL0
	aFk0DxIg==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4gU0-00000002ewW-0xBC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 15:14:38 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A3CDB4E40106;
	Thu, 10 Sep 2026 15:14:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7780F5FA2F;
	Thu, 10 Sep 2026 15:14:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CCF1911C7A1A1;
	Thu, 10 Sep 2026 17:14:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789053269; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=RJfocTlOORaTvso6KmauJUuwxsbukatHXvhE99wz6ZY=;
	b=wdmkJ7TABqdAPMZvI3gElyweW7LxwfsN66SDIEA2qqXYxSWISPi9gqcSIYSnXTU9rxPQWw
	Ggrr0eNbZ7nL5X3Umpmz2x3lHQx4Zo03Q0oZYj4BAGomF78MCR6LZ4B83jXDlOlGsU1UsV
	8qx3SwKjXZYaeDgrPC1CA9tePAVPK0NBQe1ZkpH9TT1gCMFutVFyHo6V4H9rjugzlogsCv
	kBov8hIMzCByaqtURR0cQ9IyUHD6cdnQNljxHI7InCbSl0MPfiD7cmFFY0rH2zl3jype0V
	DvDRYOQaAYTGE2w0brMqntIdvVnk/Pz5T5o8xNlwnT9KgsrGi2qe6ASjb4cwWQ==
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
	Jose.Abreu@synopsys.com,
	Nicolai Buchwitz <nb@tipi-net.de>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	thomas.petazzoni@bootlin.com,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	PKneuper@dspace.de,
	David Laight <david.laight.linux@gmail.com>
Subject: [PATCH net v2 3/6] net: stmmac: selftests: Check the dev->features for S-TAG offload testing
Date: Thu, 10 Sep 2026 17:14:00 +0200
Message-ID: <20260910151404.976753-4-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260910151404.976753-1-maxime.chevallier@bootlin.com>
References: <20260910151404.976753-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_161436_432529_C41DD651 
X-CRM114-Status: GOOD (  12.15  )
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

The S-TAG offload insertion incorrectly checks the dvlan (double vlan)
DMA cap, which is different than S-TAG support. Use
NETIF_F_HW_VLAN_STAG_TX to check if the feature is supported instead.

Note that this flag isn't set in stmmac yet, but contrary to ARP
offload, this is a feature that has a chance to get there eventually so
let's leave the selftest here for now. It'll report -EOPNOTSUPP in the
meantime.

Fixes: 091810dbded9 ("net: stmmac: Introduce selftests support")
Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
index a8280834185c..f3a533bc6bb6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
@@ -1405,7 +1405,7 @@ static int stmmac_test_vlanoff(struct stmmac_priv *priv)
 
 static int stmmac_test_svlanoff(struct stmmac_priv *priv)
 {
-	if (!priv->dma_cap.dvlan)
+	if (!(priv->dev->features & NETIF_F_HW_VLAN_STAG_TX))
 		return -EOPNOTSUPP;
 	return stmmac_test_vlanoff_common(priv, true);
 }
-- 
2.55.0


