Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42CF1D2CDFE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 01:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=I15V66zB1T31cGXD0lOmzQuynlP2Pen5WcKwz023y0o=; b=C6JwXS4Ak2u9Xms+1zCumNL1sg
	cpXubbkQ3Y3H828LQGsu1HL1NC0tD0F/12HpqUaZ9sRrnOm0YZw/8fhkE1MgRpK0G3ZlplVl76x0K
	wuz+ltiZ+ZAIRLRYYVnmAGtroLmsC5QeCp8twMVWA1QmqJKpo9PKIYQ2E+KQV2Gmdt7xtXRo732m+
	9E32pZ9AnzchyGeNSGe7BxUfQFMPGwv9rJ57i4WL3KXaiXPHgwLn7dQAYFxdeqlXE0foPJ1NztPBQ
	3oeKCobGC6XySS/czmAgswE4cs8UfM0GD5naScCMgZOtqEDwikqSrT5tkQwbWQxVmv58CuZVFbqnr
	vo2tBU+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRKlR-00000008sGz-2TF5;
	Fri, 05 Dec 2025 01:37:41 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRKlO-00000008sGX-2Ohh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 01:37:40 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 5 Dec
 2025 09:37:27 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 5 Dec 2025 09:37:27 +0800
From: Jacky Chou <jacky_chou@aspeedtech.com>
Date: Fri, 5 Dec 2025 09:37:22 +0800
Subject: [PATCH net-next] net: mdio: aspeed: add dummy read to avoid
 read-after-write issue
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251205-aspeed_mdio_add_dummy_read-v1-1-60145ae20ea7@aspeedtech.com>
X-B4-Tracking: v=1; b=H4sIAFE3MmkC/x3MQQqDMBAF0KvIrBswwUDbq5QSQv9vO4tESaxYx
 LsbXL7N26SyKKvcu00KF6065gZ76eT1jflDo2gW1ztvXe9NrBOJkKBjiEDAL6V/KIww8FdYDrf
 BOkgLpsK3rmf+kMzZZK6zPPf9AIb4G/R2AAAA
X-Change-ID: 20251205-aspeed_mdio_add_dummy_read-d58d1e49412d
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Joel Stanley
	<joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>
CC: <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>, Jacky Chou
	<jacky_chou@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764898647; l=1685;
 i=jacky_chou@aspeedtech.com; s=20251031; h=from:subject:message-id;
 bh=S7YMglq8xDZ86NvHllMwMpita0VXT5NdJ+3b28QfTZA=;
 b=Ps7Hi70frz0jQRXPVvsI7ldWRC/vUIB2+MlTS0A8qMwi2htDxw+IuUKtQFWJ/D4fb+S5YT/WU
 +6J+70lg37kB2/KkYTcqTd2EYPL6bmdnjhSrYXB//9EmSRmeEb1bkfX
X-Developer-Key: i=jacky_chou@aspeedtech.com; a=ed25519;
 pk=8XBx7KFM1drEsfCXTH9QC2lbMlGU4XwJTA6Jt9Mabdo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_173738_640155_FAC78961 
X-CRM114-Status: UNSURE (   9.65  )
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

The Aspeed MDIO controller may return incorrect data when a read operation
follows immediately after a write. Due to a controller bug, the subsequent
read can latch stale data, causing the polling logic to terminate earlier
than expected.

To work around this hardware issue, insert a dummy read after each write
operation. This ensures that the next actual read returns the correct
data and prevents premature polling exit.

This workaround has been verified to stabilize MDIO transactions on
affected Aspeed platforms.

Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
---
 drivers/net/mdio/mdio-aspeed.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/mdio/mdio-aspeed.c b/drivers/net/mdio/mdio-aspeed.c
index e55be6dc9ae7..00e61b922876 100644
--- a/drivers/net/mdio/mdio-aspeed.c
+++ b/drivers/net/mdio/mdio-aspeed.c
@@ -62,6 +62,12 @@ static int aspeed_mdio_op(struct mii_bus *bus, u8 st, u8 op, u8 phyad, u8 regad,
 		| FIELD_PREP(ASPEED_MDIO_DATA_MIIRDATA, data);
 
 	iowrite32(ctrl, ctx->base + ASPEED_MDIO_CTRL);
+	/* Workaround for read-after-write issue.
+	 * The controller may return stale data if a read follows immediately
+	 * after a write. A dummy read forces the hardware to update its
+	 * internal state, ensuring that the next real read returns correct data.
+	 */
+	(void)ioread32(ctx->base + ASPEED_MDIO_CTRL);
 
 	return readl_poll_timeout(ctx->base + ASPEED_MDIO_CTRL, ctrl,
 				!(ctrl & ASPEED_MDIO_CTRL_FIRE),

---
base-commit: 8f7aa3d3c7323f4ca2768a9e74ebbe359c4f8f88
change-id: 20251205-aspeed_mdio_add_dummy_read-d58d1e49412d

Best regards,
-- 
Jacky Chou <jacky_chou@aspeedtech.com>


