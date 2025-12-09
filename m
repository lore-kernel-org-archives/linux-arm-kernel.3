Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99341D3B7EA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 11:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jvBQmXdDaTJ4bqlV98BV9Mp3YssdzJrV1kGBuaoOX1g=; b=tnUamazzq1/RENY5pfLUbNc/Gk
	ijw0WWsNRtJCcgKPOEz0R4/bdrzMS9aNvZhPL0qyVNXZS+UCrYaS7Q2/+ihKBDNp4z8BL8LEdy0iz
	qzw7AG8iNxQQeFSsT/hD/OLtpGST8J2j21uMTynvGs8Xw5P1/A8lwhm9YxUDLWYr3LZBfI0/NP+p9
	pbq8S+dmRVW/xDUthMV7jQkqyrHzgIp7Qic5zvsfkzTuRwXO3oIsYIE6SadsnYCopPj8jLBhw4Stl
	tZcaTxaxIVLb2MmYiCSQ/JJVHLj/uF0g6a6Z4ls1i13a+qmXptX+dsyJ8gveLZvKAw/EJpFNYVCz2
	haYsWncg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSvh5-0000000EACb-3kJK;
	Tue, 09 Dec 2025 11:15:47 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSvgy-0000000EA1G-1xzN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 11:15:42 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 9 Dec
 2025 19:15:32 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 9 Dec 2025 19:15:32 +0800
From: Jacky Chou <jacky_chou@aspeedtech.com>
Date: Tue, 9 Dec 2025 19:15:31 +0800
Subject: [PATCH net v2] net: mdio: aspeed: add dummy read to avoid
 read-after-write issue
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251209-aspeed_mdio_add_dummy_read-v2-1-5f6061641989@aspeedtech.com>
X-B4-Tracking: v=1; b=H4sIANIEOGkC/42NQQqDMBBFryKzbkomoIaueo8iYepMaxYxkqhUx
 Ls32At0+f7/vL9DluQlw63aIcnqs49jAXOpoB9ofIvyXBiMNjUabRXlSYRdYB8dMTteQthcEmJ
 V25ae1mprsYUimJK8/OeUP2CUGboSDj7PMW3n4Ypn9Y97RYVKE9oGiQ02eP+NZ+mHax8DdMdxf
 AG3JDDXzgAAAA==
X-Change-ID: 20251208-aspeed_mdio_add_dummy_read-587ab8808817
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Joel Stanley
	<joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, Potin Lai
	<potin.lai@quantatw.com>
CC: <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>, Jacky Chou
	<jacky_chou@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765278932; l=1877;
 i=jacky_chou@aspeedtech.com; s=20251031; h=from:subject:message-id;
 bh=Mg8PdAkgzIWHVGruAAz0jujfLeSjM7YjkzAbXqHp61U=;
 b=cIXKNFH4KlPuUxu8VYrzWB6g8Jw7ZigbsZTBDriQL/xeLWFu/8lzf993F8cPv+2+thMgn7WFZ
 5ipiglIvxodDFOOpgnU/meEZJqwxMa6GpKHdo8UkSyqAU4WdN8iAItD
X-Developer-Key: i=jacky_chou@aspeedtech.com; a=ed25519;
 pk=8XBx7KFM1drEsfCXTH9QC2lbMlGU4XwJTA6Jt9Mabdo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_031540_516560_FDB70FAD 
X-CRM114-Status: GOOD (  10.60  )
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
Changes in v2:
- Updated the Fixes: tag
- Link to v1: https://lore.kernel.org/r/20251208-aspeed_mdio_add_dummy_read-v1-1-0a1861ad2161@aspeedtech.com
---
 drivers/net/mdio/mdio-aspeed.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/mdio/mdio-aspeed.c b/drivers/net/mdio/mdio-aspeed.c
index e55be6dc9ae7..7d11add3c05e 100644
--- a/drivers/net/mdio/mdio-aspeed.c
+++ b/drivers/net/mdio/mdio-aspeed.c
@@ -63,6 +63,13 @@ static int aspeed_mdio_op(struct mii_bus *bus, u8 st, u8 op, u8 phyad, u8 regad,
 
 	iowrite32(ctrl, ctx->base + ASPEED_MDIO_CTRL);
 
+	/* Workaround for read-after-write issue.
+	 * The controller may return stale data if a read follows immediately
+	 * after a write. A dummy read forces the hardware to update its
+	 * internal state, ensuring that the next real read returns correct data.
+	 */
+	(void)ioread32(ctx->base + ASPEED_MDIO_CTRL);
+
 	return readl_poll_timeout(ctx->base + ASPEED_MDIO_CTRL, ctrl,
 				!(ctrl & ASPEED_MDIO_CTRL_FIRE),
 				ASPEED_MDIO_INTERVAL_US,

---
base-commit: 0373d5c387f24de749cc22e694a14b3a7c7eb515
change-id: 20251208-aspeed_mdio_add_dummy_read-587ab8808817

Best regards,
-- 
Jacky Chou <jacky_chou@aspeedtech.com>


