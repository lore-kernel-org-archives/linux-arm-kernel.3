Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42032CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 14:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=byJmp20ozUXMyoKY5EOWJZujkHr16poyflFSxhdQvxg=; b=TkMlhKw07CwsHr5UaCy3VBEbq9
	nXTX7XqxKRqMX+nq1fqHoN/5dGO8NrIg0Y6sKnNlc9BphU2STbW05rG4mHrEm7tBSnqQj7kkXoSsY
	wCh9TM9w0u/vox1XwR8N+I478ceMcZuE0zHSqt9UdDk60DZNu9MEZ3bASAIv+MSCb7Aramb7GFwgB
	0IJ6Z9SuBtx57nNOo/7sGitatDhXXWaAtsJVqdeHVnvyIUB+tjWdvYkIGqmpXkihuGNyBKLPMiWS2
	aF71dnnSUuT7xKWlqd3t44LrTdaRneoHdrqHMQ4B7qj1HGFHPeHG9rpjA+XdHggFffIEnnFflAPMt
	r57yQ6Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbfmN-000000055Lt-3fu9;
	Mon, 22 Jun 2026 14:37:39 +0000
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbfmK-000000055KY-2urv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Jun 2026 14:37:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap4-20230908; h=Sender:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:In-Reply-To:
	References; bh=byJmp20ozUXMyoKY5EOWJZujkHr16poyflFSxhdQvxg=; b=nWTKzmrd4iK95s
	PDDmh2o+j1xgFfJJKO8SOtPNODbt39YHDkQunnC/Szi8IjIUfQmLP4J5lMC1W62l95nWo6ce/nHHH
	+s1QAQcRoFOgkeIZIAo05FBsGdL1pM50bMAsQ34a0e3i6o3d30avo/cT9DRzjosUZXpBYx5m9IXTO
	ODvXdNhXY/gZ5y6nzMnwsARJI3tZf6Gd0uQPpiQORYDuIMCs5M1gDjuxUy/ydxoS31CcU8FbJskV4
	sDuBmcWL+4cn7J5W0+ARrFfrkyXrydZ1jguzI+OsgQuJ9NMgRiXp0LXgiZdYQYOT6wRV3htGM/XJs
	pfRdirhSLo68+Xzw7VdA==;
Received: from [167.98.27.226] (helo=rainbowdash)
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1wbflu-00EqWl-D2; Mon, 22 Jun 2026 15:37:10 +0100
Received: from ben by rainbowdash with local (Exim 4.99.4)
	(envelope-from <ben@rainbowdash>)
	id 1wbfls-000000025LX-32iL;
	Mon, 22 Jun 2026 15:37:08 +0100
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	"Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] net: stmmac: fix missed le32_to_cpu()
Date: Mon, 22 Jun 2026 15:37:07 +0100
Message-Id: <20260622143707.497198-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.37.2.352.g3c44437643
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_073736_755327_4F740E37 
X-CRM114-Status: GOOD (  11.22  )
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

The print in ndesc_display_ring() sends the des2 and des3
to the pr_info() without passing them through the relevant
conversion to cpu order.

Fix the (prototype) sparse warnings by using le32_to_cpu():
drivers/net/ethernet/stmicro/stmmac/norm_desc.c:258:17: warning: incorrect type in argument 6 (different base types)
drivers/net/ethernet/stmicro/stmmac/norm_desc.c:258:17:    expected unsigned int
drivers/net/ethernet/stmicro/stmmac/norm_desc.c:258:17:    got restricted __le32 [usertype] des2
drivers/net/ethernet/stmicro/stmmac/norm_desc.c:258:17: warning: incorrect type in argument 7 (different base types)
drivers/net/ethernet/stmicro/stmmac/norm_desc.c:258:17:    expected unsigned int
drivers/net/ethernet/stmicro/stmmac/norm_desc.c:258:17:    got restricted __le32 [usertype] des3

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 drivers/net/ethernet/stmicro/stmmac/norm_desc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/norm_desc.c b/drivers/net/ethernet/stmicro/stmmac/norm_desc.c
index c4b613564f87..74c9b7b1fe8f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/norm_desc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/norm_desc.c
@@ -258,7 +258,7 @@ static void ndesc_display_ring(void *head, unsigned int size, bool rx,
 		pr_info("%03d [%pad]: 0x%x 0x%x 0x%x 0x%x",
 			i, &dma_addr,
 			(unsigned int)x, (unsigned int)(x >> 32),
-			p->des2, p->des3);
+			le32_to_cpu(p->des2), le32_to_cpu(p->des3));
 		p++;
 	}
 	pr_info("\n");
-- 
2.37.2.352.g3c44437643


