Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 514EED3E796
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 06:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YdZGVqE9PqA/mLAx8V/qbBE6zEOyRZ8J6A65YgupoeA=; b=pY/3jVEvYm87ccxCL7rNoezArn
	7P4dTvUi1ZBcLzd0KB4bl2JQ6/iIlhYT8M9KxfH/5LG76/2Ob3c/5hnrFM66bKZVy2oWH81fAlUEc
	krDcVqzVttfY0r3LonjWY2qIpQPNGMnhOqsk9j6EgmIrHrcPIAU2P/yoJkHH2mlrkbBSSDmBccEjn
	CIx+J5BzRwtAkKIi4h0FmV6Egy73WfXzLSYfyLEBIWgtH8JPjK6w6MTI41q8Ri0VsxtqBKZUTKDck
	Oc2S0peuO3/GhH9sjQygD7TmM95l2STB9nVoLAM49zTRzVujV1kb7CjN46i/a9/XRur3qlLePw74T
	4J7KJihg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTa74-0000000GHqB-2zKw;
	Thu, 11 Dec 2025 06:25:20 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTa71-0000000GHpE-0q0Z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 06:25:16 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 11 Dec
 2025 14:25:01 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 11 Dec 2025 14:25:01 +0800
From: Jacky Chou <jacky_chou@aspeedtech.com>
Date: Thu, 11 Dec 2025 14:24:58 +0800
Subject: [PATCH net v3] net: mdio: aspeed: add dummy read to avoid
 read-after-write issue
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251211-aspeed_mdio_add_dummy_read-v3-1-382868869004@aspeedtech.com>
X-B4-Tracking: v=1; b=H4sIALljOmkC/43NQQ7CIBAF0Ks0rMUwaCl15T2MIVimlgWlgUpsm
 t5dghsTE+Pyz5+8v5KIwWIkp2olAZON1o85HHYV6QY93pFakzPhjNfAmaQ6TohGOWO90sYo83B
 uUQG1obVs9E1KJiU0JANTwN4+C34hI87kmo+DjbMPSxlMUKp/7AQUKNMgBWjDQcD5/TxjN+w77
 4qd+KfX/vR49upeMAHiCK1sv7xt214iS3GuHgEAAA==
X-Change-ID: 20251208-aspeed_mdio_add_dummy_read-587ab8808817
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Joel Stanley
	<joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, Potin Lai
	<potin.lai@quantatw.com>
CC: <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>, "Andrew
 Jeffery" <andrew@aj.id.au>, Jacky Chou <jacky_chou@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765434301; l=2016;
 i=jacky_chou@aspeedtech.com; s=20251031; h=from:subject:message-id;
 bh=/F4kIXDvh45WJxiCbdIwAGVfMvFPrac8MDCbVP75p2g=;
 b=oJptiug7G0Gd4SocdRv+VJ4ONlyM5fmP7zoWOeQc6wU3FZ/KkhT4lxdo14vQWCOtkRhz67Y2g
 97WIqf9bH2XBjn3dkbiQSY0jjL20PVv1/htH/ayyKn+s8t/nwgFZKHH
X-Developer-Key: i=jacky_chou@aspeedtech.com; a=ed25519;
 pk=8XBx7KFM1drEsfCXTH9QC2lbMlGU4XwJTA6Jt9Mabdo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_222515_267056_056F8E07 
X-CRM114-Status: GOOD (  10.98  )
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

The Aspeed MDIO controller may return incorrect data when a read operation
follows immediately after a write. Due to a controller bug, the subsequent
read can latch stale data, causing the polling logic to terminate earlier
than expected.

To work around this hardware issue, insert a dummy read after each write
operation. This ensures that the next actual read returns the correct
data and prevents premature polling exit.

This workaround has been verified to stabilize MDIO transactions on
affected Aspeed platforms.

Fixes: f160e99462c6 ("net: phy: Add mdio-aspeed")
Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
---
Changes in v3:
- Remove (void)
- Link to v2: https://lore.kernel.org/r/20251209-aspeed_mdio_add_dummy_read-v2-1-5f6061641989@aspeedtech.com

Changes in v2:
- Updated the Fixes: tag
- Link to v1: https://lore.kernel.org/r/20251208-aspeed_mdio_add_dummy_read-v1-1-0a1861ad2161@aspeedtech.com
---
 drivers/net/mdio/mdio-aspeed.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/mdio/mdio-aspeed.c b/drivers/net/mdio/mdio-aspeed.c
index e55be6dc9ae7..d6b9004c61dc 100644
--- a/drivers/net/mdio/mdio-aspeed.c
+++ b/drivers/net/mdio/mdio-aspeed.c
@@ -63,6 +63,13 @@ static int aspeed_mdio_op(struct mii_bus *bus, u8 st, u8 op, u8 phyad, u8 regad,
 
 	iowrite32(ctrl, ctx->base + ASPEED_MDIO_CTRL);
 
+	/* Workaround for read-after-write issue.
+	 * The controller may return stale data if a read follows immediately
+	 * after a write. A dummy read forces the hardware to update its
+	 * internal state, ensuring that the next real read returns correct data.
+	 */
+	ioread32(ctx->base + ASPEED_MDIO_CTRL);
+
 	return readl_poll_timeout(ctx->base + ASPEED_MDIO_CTRL, ctrl,
 				!(ctrl & ASPEED_MDIO_CTRL_FIRE),
 				ASPEED_MDIO_INTERVAL_US,

---
base-commit: 6bcb7727d9e612011b70d64a34401688b986d6ab
change-id: 20251208-aspeed_mdio_add_dummy_read-587ab8808817

Best regards,
-- 
Jacky Chou <jacky_chou@aspeedtech.com>


