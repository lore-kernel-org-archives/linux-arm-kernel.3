Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F8B9CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 04:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wQSKqA4W203PRBWrRgQNEnxbf5+pDp/cb7Iapz4hS94=; b=e6SmRWMBmBiOTKNZI9VZfDpesJ
	atsb0KKpRwHbONSCaFHRAC9djoPJYkZec4F6rJTsAb6qW9jo4ZHS53HzwTPWj1u8w1ctHo9KWHQtx
	JwLIq9koOsNfqLnLhbGZHDpAY9f/lyuDKq4GWKYTnR2ymmH19gLpPwmHLhWH3MjcmRext6cYiqeQu
	A9Blyrgn31qs9pvD01UeFk9hPiZlz/h3TV3gVZrR27nrzIfA7DM1qErGEjJOqRiqarQm9OIdzo0dg
	SPWxVFDzutF2LobPf5z7Yg5P21jh+/kuXlPfAo44+3IyTSZi3YxyWtOOCBZLSqXv77qV/Zlt/1rUX
	zmY2hNKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqP5g-00000006vHQ-38j7;
	Mon, 25 Aug 2025 04:45:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqOxD-00000006tDd-43BM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 04:37:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B39676024E;
	Mon, 25 Aug 2025 04:37:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 76E7AC4CEF4;
	Mon, 25 Aug 2025 04:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756096629;
	bh=qbmrznk8y3bTUpjqPLSvWYU8OwN7QufMMM55Yj86Gkw=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=TSdhfPjaKUkCMfdZp6E1WGCCorVE09YvUlhgqThgPprHZL+GglTNpnY/9elKdcxEq
	 skgve9Ww+us2OO5HJSLbCFn041VBYSjkr49jiGsqAflvZEOInxo80fkB7kciOZnbLI
	 Ea1GDxhQIvWz5js7FSF2gzB4GtoZjV4yvOdlnwjYI+A9PZwNskiwzj+zcSy39ELASx
	 68DXrvRC9NCp4eZxhq1J81iGiPNNeGr4BbwszzYMBsqIfsqW7nZN/s66057Dd3htrz
	 lKjdmEeEvN+hvMEhrsgaD9C5pLFapiEXtti6xB0QL5KnBjb2T6GRJu03v7N7u7aol1
	 RDZTK6QZaUesQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61FACCA0FE1;
	Mon, 25 Aug 2025 04:37:09 +0000 (UTC)
From: Rohan G Thomas via B4 Relay <devnull+rohan.g.thomas.altera.com@kernel.org>
Subject: [PATCH net v3 0/3] net: stmmac: xgmac: Minor fixes
Date: Mon, 25 Aug 2025 12:36:51 +0800
Message-Id: <20250825-xgmac-minor-fixes-v3-0-c225fe4444c0@altera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGPoq2gC/33NTQrDIBAF4KuEWdeikz/TVe9RuhAzJkKjRYOkh
 Ny94qYUSpdvHu+bHSIFSxEu1Q6Bko3WuxzqUwV6Vm4iZsecATm2vBcN26ZFabZY5wMzdqPIGo6
 yN4hi1AR59wxUijy7gaMV7vk427j68Cp/kijVHzIJxpmuGz6gklL1eFWPlYI6a78ULuGHkKL7R
 WAmumFoW9QmE+aLOI7jDdEnumv7AAAA
X-Change-ID: 20250714-xgmac-minor-fixes-40287f221dce
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <Jose.Abreu@synopsys.com>, 
 Romain Gantois <romain.gantois@bootlin.com>, 
 Serge Semin <fancer.lancer@gmail.com>, 
 Ong Boon Leong <boon.leong.ong@intel.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Rohan G Thomas <rohan.g.thomas@altera.com>, 
 Matthew Gerlach <matthew.gerlach@altera.com>, Andrew Lunn <andrew@lunn.ch>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756096627; l=1399;
 i=rohan.g.thomas@altera.com; s=20250815; h=from:subject:message-id;
 bh=qbmrznk8y3bTUpjqPLSvWYU8OwN7QufMMM55Yj86Gkw=;
 b=wb6durDNB7EBHq2OkiLCdW7vqZM17yyaQFwyVzxklzowPsTG1zA8RPFzfe0pjDOg89l4lAE/C
 O0US6x4B5ujDW1ogpumfCPQOh67cwwuBN4pPnWn+WnqvUqBeK5LdVC5
X-Developer-Key: i=rohan.g.thomas@altera.com; a=ed25519;
 pk=5yZXkXswhfUILKAQwoIn7m6uSblwgV5oppxqde4g4TY=
X-Endpoint-Received: by B4 Relay for rohan.g.thomas@altera.com/20250815
 with auth_id=494
X-Original-From: Rohan G Thomas <rohan.g.thomas@altera.com>
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
Reply-To: rohan.g.thomas@altera.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

This patch series includes following minor fixes for stmmac
dwxgmac driver:

    1. Disable Rx FIFO overflow interrupt for dwxgmac
    2. Correct supported speed modes for dwxgmac
    3. Check for coe-unsupported flag before setting CIC bit of
       Tx Desc3 in the AF_XDP flow

Signed-off-by: Rohan G Thomas <rohan.g.thomas@altera.com>
---
Changes in v3:
- Keep variable declaration smallest to largest.
- Link to v2: https://lore.kernel.org/r/20250816-xgmac-minor-fixes-v2-0-699552cf8a7f@altera.com

Changes in v2:
- Added Fixes: tags to relevant commits.
- Added a check for synopsys version to enable 10Mbps, 100Mbps support.
- Link to v1: https://lore.kernel.org/r/20250714-xgmac-minor-fixes-v1-0-c34092a88a72@altera.com

---
Rohan G Thomas (3):
      net: stmmac: xgmac: Do not enable RX FIFO Overflow interrupts
      net: stmmac: xgmac: Correct supported speed modes
      net: stmmac: Set CIC bit only for TX queues with COE

 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c | 13 +++++++++++--
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c  |  9 +++++----
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c   |  6 ++++--
 3 files changed, 20 insertions(+), 8 deletions(-)
---
base-commit: b1c92cdf5af3198e8fbc1345a80e2a1dff386c02
change-id: 20250714-xgmac-minor-fixes-40287f221dce

Best regards,
-- 
Rohan G Thomas <rohan.g.thomas@altera.com>



