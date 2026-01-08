Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFBB6D1D478
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 17:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JAM3p217on0LQd5A1+LnCZgftY0kMT3Jv9qw4Y1bwoo=; b=zmkYTMCJ0P01N/q3XUC69p2zTu
	hH2uskefPhEpBNrWH/C6PEW8JR8PLyKw+le0kNw+UQAQwvIx4j7xw05qmwpJbMbwPOKW+vyZ52eaB
	gwqaJBnQGaYiuB8MFoZF5Kq1+Zmc3lo77ckOJmhrcg9ns+kW1OKv3k2ZfDoLXd453Ae+rfeu5lb3f
	ftccvGIhTtIy2IbqKzBtmNNtdQwoDiznB4bfLvJomQ8W168oa5J25SJhg+ambxUPhqfc226zNy+5Z
	IvRJUgqTQ9P0CVi82vzhVzsfxyOdG9mDoia5sLAzqOXgPmAz1iXlimLIyG+poqzJNknWK2ajuCCdA
	/j1VGvCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdtw0-00000000Rx0-0PQ4;
	Thu, 08 Jan 2026 17:36:32 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdtvt-00000000RrR-0Xje
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 17:36:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=JAM3p217on0LQd5A1+LnCZgftY0kMT3Jv9qw4Y1bwoo=; b=SE8fOoKCwzDu0plXYHgAN806EU
	3knhUPs26HUWD9VUlfuLipjA0t4cSwIF8sCZUR17qi72z3Cuw8sTkhhx4DKp1Vf514RDi0+n+/1F4
	VWum07bQZG7A9wgb36uzQmnUU+Zn/E/u0gIRfStvHqrKX2amKTINQfi8OjCKxmeWCD6ZkTcBrfwo0
	Yp5SAgubMszZTWM7AQQu0PedMJT39xNTmBeapC/vB3aGM170doGiWAz0QLZlwN7qASrvpZd/DNm93
	Bd2/HHW8kchwf1nGgncUNw7F2oXEdxqxPmrOIhyciXtmVhzeeGgPiniHyESdIRhdVdL/VHU7Uy2ZE
	rwkLWTfw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:42936 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vdtvo-000000002z8-1ejj;
	Thu, 08 Jan 2026 17:36:20 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vdtvn-00000002GtV-1wCS;
	Thu, 08 Jan 2026 17:36:19 +0000
In-Reply-To: <aV_q2Kneinrk3Z-W@shell.armlinux.org.uk>
References: <aV_q2Kneinrk3Z-W@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next v2 3/9] net: stmmac: dwmac4: fix PTP message type
 field extraction
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vdtvn-00000002GtV-1wCS@rmk-PC.armlinux.org.uk>
Date: Thu, 08 Jan 2026 17:36:19 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_093625_190589_6F61D6A6 
X-CRM114-Status: GOOD (  12.79  )
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

In dwmac4_wrback_get_rx_status(), the code extracts the PTP message
type from receive descriptor 1 using the dwmac enhanced descriptor
definitions:

	message_type = (rdes1 & ERDES4_MSG_TYPE_MASK) >> 8;

This is defined as:

 #define ERDES4_MSG_TYPE_MASK            GENMASK(11, 8)

The correct definition is RDES1_PTP_MSG_TYPE_MASK, which is also
defined as:

 #define RDES1_PTP_MSG_TYPE_MASK         GENMASK(11, 8)

Use the correct definition, converting to use FIELD_GET() to extract
it without needing an open-coded shift right that is dependent on the
mask definition.

As this change has no effect on the generated code, there is no need
to treat this as a bug fix.

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
index aac68dc28dc1..c84b26d51760 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
@@ -108,7 +108,7 @@ static int dwmac4_wrback_get_rx_status(struct stmmac_extra_stats *x,
 		ret = discard_frame;
 	}
 
-	message_type = (rdes1 & ERDES4_MSG_TYPE_MASK) >> 8;
+	message_type = FIELD_GET(RDES1_PTP_MSG_TYPE_MASK, rdes1);
 
 	if (rdes1 & RDES1_IP_HDR_ERROR) {
 		x->ip_hdr_err++;
-- 
2.47.3


