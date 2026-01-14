Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FE70D31A22
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 08:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ajwkw9+NGX/WfC1IKpsfCbjnOybGHKbfekZPQpU9How=; b=3Y7tqeRjDOQi7JB4NexTtT54L+
	lSYaxzCdhGIkGzc2QFHJC7S8C93aH1XkD+xtDF/RJKdRcwPNQqnZN8jggrokneJ+CWhoY0qyULHez
	JQ9ndXFZA6IrCtC7ZqVkbVeu+m8D1y5rPaUNbF2ShcF0IZCRBHQdl3Jg1FItKEIesoB5sBmQ3eBsR
	CS+x8/njEPrHLKhlVWXzLilxBN8I/UpEi1l8g/UmFVE1CJq0v1r/kKpqFYli6niAon4ZdRt/RESQW
	k5PntACtCDwnlS4tlbQ7mNti4PS311qXglv8D83YEAgPT0uofsS9R5g7OdH14EyIfRu6y7MDwPHb2
	LFlXH9Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfw5F-00000008Io8-2QdU;
	Wed, 14 Jan 2026 08:18:29 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfw5C-00000008Ile-3eoe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 08:18:28 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5221810DFEC;
	Wed, 14 Jan 2026 09:18:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1768378696; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=Ajwkw9+NGX/WfC1IKpsfCbjnOybGHKbfekZPQpU9How=;
	b=RS5oaMfHKR7qffACVNzlScaYa5fCYSMQRLi8g9avCRUkSiD8P4vVzwIeg/1n3RVaoBkSRw
	yM53bftxByHwsxuGfEoT9WjDMYgUZqKUFjevFUGx/MpPkkVJ805UcJ8no/IHA7mmjYaRco
	//tEIasJFXW0QmVZrFmbmGL+zRQRiMODy4ZkcBIpoOjcVMfnaWI1CgiXpmHmwXEl2bHmXP
	XW3B09lTcnYg3CT62Tw71+Hz8b2R9x5uQVh/HJwpY6fzlJHNB/e+ZxK81xptzWUl3tAe5H
	gvpTwovD9QcMLxlD0y2fyjrfIXv7LmOGd0H3PZyYSS8wVaDey1smjxhdvW41kA==
From: Marek Vasut <marex@nabladev.com>
To: netdev@vger.kernel.org
Cc: Marek Vasut <marex@nabladev.com>,
	"David S. Miller" <davem@davemloft.net>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Christophe Roullier <christophe.roullier@st.com>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	kernel@dh-electronics.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [net-next,PATCH] net: stmmac: stm32: Do not suspend downed interface
Date: Wed, 14 Jan 2026 09:17:54 +0100
Message-ID: <20260114081809.12758-1-marex@nabladev.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_001827_125614_C04508D4 
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

If an interface is down, the ETHnSTP clock are not running. Suspending
such an interface will attempt to stop already stopped ETHnSTP clock,
and produce a warning in the kernel log about this.

STM32MP25xx that is booted from NFS root via its first ethernet MAC
(also the consumer of ck_ker_eth1stp) and with its second ethernet
MAC downed produces the following warnings during suspend resume
cycle. This can be provoked even using pm_test:

"
$ echo devices > /sys/power/pm_test
$ echo mem > /sys/power/state
...
ck_ker_eth2stp already disabled
...
ck_ker_eth2stp already unprepared
...
"

Fix this by not manipulating with the clock during suspend resume
of interfaces which are downed.

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: "David S. Miller" <davem@davemloft.net>
Cc: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>
Cc: Christophe Roullier <christophe.roullier@st.com>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>
Cc: kernel@dh-electronics.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: netdev@vger.kernel.org
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
index e1b260ed4790b..5b0d111afcac3 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
@@ -618,11 +618,21 @@ static void stm32_dwmac_remove(struct platform_device *pdev)
 
 static int stm32mp1_suspend(struct stm32_dwmac *dwmac)
 {
+	struct net_device *ndev = dev_get_drvdata(dwmac->dev);
+
+	if (!ndev || !netif_running(ndev))
+		return 0;
+
 	return clk_prepare_enable(dwmac->clk_ethstp);
 }
 
 static void stm32mp1_resume(struct stm32_dwmac *dwmac)
 {
+	struct net_device *ndev = dev_get_drvdata(dwmac->dev);
+
+	if (!ndev || !netif_running(ndev))
+		return;
+
 	clk_disable_unprepare(dwmac->clk_ethstp);
 }
 
-- 
2.51.0


