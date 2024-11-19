Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D9F0D62060
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 09:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BVXUBve+E1W0wWXAnIyKvnXTF5QZM8J1LQfuTRm8BNQ=; b=iT4GMS1MoZeuRLCScNHTi63XQS
	JY+a2R6KnI8tUZIHccrjkQvw9OM2ooUGW0Q/PllwA4cnjd6v/vHNJYXx0EYO9yWJWEcl5ev7y2cLI
	DGupKWk03zoNYdgrfx0W0IUsvmg4Xwq4tqBOq7tt34R6fACNYRhLxNyiH2Uvfx1PKGVkLDxwgP3ty
	Sn2S7en3XsTjSCgtY88/0UxpI+uCZy+TQqlQfhusHfCpB11QLUkL9GWOVc/udVBBO2OIU7y4IPZ0E
	JoAfvKnlRqUVXva81B/q6S6PH1NICfBP4+E5GPWdA5ce4p6ay75qw6Qq3VtJLS6SYYQXE6q6IQNSM
	mBdMlHqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDKuj-0000000BxUs-1Lrw;
	Tue, 19 Nov 2024 09:52:53 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDKtl-0000000Bx8d-1KVN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 09:51:54 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 19 Nov
 2024 17:51:42 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 19 Nov 2024 17:51:42 +0800
From: Jacky Chou <jacky_chou@aspeedtech.com>
To: <andrew@lunn.ch>, <hkallweit1@gmail.com>, <linux@armlinux.org.uk>,
	<davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
	<pabeni@redhat.com>, <joel@jms.id.au>, <andrew@codeconstruct.com.au>,
	<f.fainelli@gmail.com>, <netdev@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>
CC: <jacky_chou@aspeedtech.com>
Subject: [PATCH net v2] net: mdio: aspeed: Add dummy read for fire control
Date: Tue, 19 Nov 2024 17:51:41 +0800
Message-ID: <20241119095141.1236414-1-jacky_chou@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_015153_359160_277FB70C 
X-CRM114-Status: GOOD (  10.53  )
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

When the command bus is sometimes busy, it may cause the command is not
arrived to MDIO controller immediately. On software, the driver issues a
write command to the command bus does not wait for command complete and
it returned back to code immediately. But a read command will wait for
the data back, once a read command was back indicates the previous write
command had arrived to controller.
Add a dummy read to ensure triggering mdio controller before starting
polling the status of mdio controller to avoid polling unexpected timeout.

Fixes: a9770eac511a ("net: mdio: Move MDIO drivers into a new subdirectory")
Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
---
 drivers/net/mdio/mdio-aspeed.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/mdio/mdio-aspeed.c b/drivers/net/mdio/mdio-aspeed.c
index c2170650415c..373902d33b96 100644
--- a/drivers/net/mdio/mdio-aspeed.c
+++ b/drivers/net/mdio/mdio-aspeed.c
@@ -62,6 +62,8 @@ static int aspeed_mdio_op(struct mii_bus *bus, u8 st, u8 op, u8 phyad, u8 regad,
 		| FIELD_PREP(ASPEED_MDIO_DATA_MIIRDATA, data);
 
 	iowrite32(ctrl, ctx->base + ASPEED_MDIO_CTRL);
+	/* Add dummy read to ensure triggering mdio controller */
+	(void)ioread32(ctx->base + ASPEED_MDIO_CTRL);
 
 	return readl_poll_timeout(ctx->base + ASPEED_MDIO_CTRL, ctrl,
 				!(ctrl & ASPEED_MDIO_CTRL_FIRE),
-- 
2.25.1


