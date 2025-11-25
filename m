Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22EBED0E6F7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 14:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dko5lvmc+MUpd7w482KK6frnadAm4VGfMJlDiuZRUP4=; b=BhpZhAYqmg6FCyVOnQQ8LwkL+N
	AQxAeQNHxKbT0NsVcyDv4upx5aXhNo7NhTRMXjYGxdOvngL6vFYbVd0zB66AamOR+GPgOOtuR3VKx
	fdaM02EQQQqqEfdRND8m9Qixtmh6SscDSmGZ5mOhGQa5umq3IqJ1KbwPWdPAicXbaB6GrscRP0U/C
	HAREBC2kOBdzuvIzruiu0vRIQCcBItd4RoyJX0fLtVv4gURc5uBcdT1CGYOBY1O6B217d33H+u/Xa
	aOZClmi6PFBTSdRZyvmbJE4z8Cq34BarZ8bZXimkQ5z0bKXeAGOcTLKQoVoKQC3oWgX+pKMVhm2Rk
	8Jj45VOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNuN9-0000000DSmw-0Fu5;
	Tue, 25 Nov 2025 14:50:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNuN4-0000000DSmO-395T
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 14:50:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9BBF744393;
	Tue, 25 Nov 2025 14:50:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6DCE7C116B1;
	Tue, 25 Nov 2025 14:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764082221;
	bh=qnIFkCDyjPOP+Aq8wEfr8h2dGGoTm+MqKtVpSjr0RI4=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=PdO4IGTkM+2Mmsq++fvJwa0DxOLdP+Bh3hon0cnoragFXelxg4PSLPotTwD6Pximm
	 xhn600uu8Ng+Q249wnSuhsqf6WKcqXUt9+zyRvYYq0J7G9A2FddfWioLz6pTngnnfi
	 2on84xLykbwkt8YC0mk/BJLYbqAICtFTpk9eHopjSiYHW03XfWrA8RW48KJTUtwe2v
	 H0D0Vt+edUVwtD45WAEI0JNpwseIyFQIGaPxGdhk3vs2qMmctGJAqGxy9bdK/KA3Xr
	 Mpc89OZJS2t0lHXxUND6ENc/6GoPdRKAFyyXzh3m15dedekz8mY3faOCiHag1ZyM4K
	 KH+oddvpHBY+Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59D43D0E6F7;
	Tue, 25 Nov 2025 14:50:21 +0000 (UTC)
From: Rohan G Thomas via B4 Relay <devnull+rohan.g.thomas.altera.com@kernel.org>
Date: Tue, 25 Nov 2025 22:50:02 +0800
Subject: [PATCH net-next] net: stmmac: Fix E2E delay mechanism
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251125-ext-ptp-fix-v1-1-83f9f069cb36@altera.com>
X-B4-Tracking: v=1; b=H4sIABnCJWkC/x2MSwqAMAwFr1KyNmALxc9VxIXGqNnU0hYpiHc3u
 JzHvHkgcxLOMJoHEt+S5QoKtjFA5xIORtmUwbXOW+s8ci0YS8RdKlK3sieiwfcW9BET6/zXJgh
 cMKgN8/t+7LtS/mcAAAA=
X-Change-ID: 20251125-ext-ptp-fix-c7be5ccc9581
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Jose Abreu <Jose.Abreu@synopsys.com>, Fugang Duan <fugang.duan@nxp.com>, 
 Kurt Kanzenbach <kurt@linutronix.de>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Rohan G Thomas <rohan.g.thomas@altera.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764082219; l=2038;
 i=rohan.g.thomas@altera.com; s=20250815; h=from:subject:message-id;
 bh=9giETEfw4Xea/WCJLCrYatICsuoa8+YtsuLtOXU+oPY=;
 b=c8F4pHeoCSI1RPcep11xCPWbPXDyFRKxjwvkzhxCXXqAuX7O/zfrVBMKt4l4apHT8U4uDvcKQ
 CkeLYSEp+XHAg/w+hyLJGVQazRj6y5nXet9ekMLfvj11VXf57TVL2M5
X-Developer-Key: i=rohan.g.thomas@altera.com; a=ed25519;
 pk=5yZXkXswhfUILKAQwoIn7m6uSblwgV5oppxqde4g4TY=
X-Endpoint-Received: by B4 Relay for rohan.g.thomas@altera.com/20250815
 with auth_id=494
X-Original-From: Rohan G Thomas <rohan.g.thomas@altera.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_065022_836425_9C5B2D7A 
X-CRM114-Status: GOOD (  11.14  )
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

From: Rohan G Thomas <rohan.g.thomas@altera.com>

For E2E delay mechanism, "received DELAY_REQ without timestamp" error
messages shows up for dwmac v3.70+ and dwxgmac IPs.

This issue affects socfpga platforms, Agilex7 (dwmac 3.70) and
Agilex5 (dwxgmac). According to the databook, to enable timestamping
for all events, the SNAPTYPSEL bit in the MAC_Timestamp_Control
register must be set to 2'b00, and the TSEVNTENA bit must be cleared
to 0'b0.

Commit 3cb958027cb8 ("net: stmmac: Fix E2E delay mechanism") already
addresses this problem for all dwmacs above version v4.10. However,
same holds true for v3.70 and above, as well as for dwxgmac. Updates
the check accordingly.

Fixes: 14f347334bf2 ("net: stmmac: Correctly take timestamp for PTPv2")
Fixes: f2fb6b6275eb ("net: stmmac: enable timestamp snapshot for required PTP packets in dwmac v5.10a")
Fixes: 3cb958027cb8 ("net: stmmac: Fix E2E delay mechanism")
Signed-off-by: Rohan G Thomas <rohan.g.thomas@altera.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 6cacedb2c9b3fefdd4c9ec8ba98d389443d21ebd..2885434cb0bea7166dca2a914a6c07e21c98e5b9 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -665,7 +665,8 @@ static int stmmac_hwtstamp_set(struct net_device *dev,
 			config->rx_filter = HWTSTAMP_FILTER_PTP_V2_EVENT;
 			ptp_v2 = PTP_TCR_TSVER2ENA;
 			snap_type_sel = PTP_TCR_SNAPTYPSEL_1;
-			if (priv->synopsys_id < DWMAC_CORE_4_10)
+			if (priv->synopsys_id < DWMAC_CORE_3_70 &&
+			    priv->plat->core_type != DWMAC_CORE_XGMAC)
 				ts_event_en = PTP_TCR_TSEVNTENA;
 			ptp_over_ipv4_udp = PTP_TCR_TSIPV4ENA;
 			ptp_over_ipv6_udp = PTP_TCR_TSIPV6ENA;

---
base-commit: e3daf0e7fe9758613bec324fd606ed9caa187f74
change-id: 20251125-ext-ptp-fix-c7be5ccc9581

Best regards,
-- 
Rohan G Thomas <rohan.g.thomas@altera.com>



