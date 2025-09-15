Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF56ACAC58E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 08:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=20oObnJIvq7bQNxp+IbofEnRTXIp9RDpEeStzhlTyxM=; b=uBznB+52reQ0LnhUzepjsdO8N8
	14vHIu2f3q6z0h5FoLP7FFAsfzBgDudpnlJX7eJe8Ttz2MtN7xHiuGoruQD97LZt6SUgOEe8guCcg
	eUg4AyO0ExNE84HiZVqzGWv4kYniGwif4vcwGsUqZReVBUj5PoGbDQtYK6rvs0FtYmdQ0q38PgYyL
	gM3ukErxchEcIw98gOV9LvgqAFvKCCI+vrlJfadACF4M06fJvsPMG/amPsMZwcapYdq/Mmk+/vg+w
	irlJS68t1KrGKUNy6K6LAuP9BeMAx3ayl5DCzZLJnVuLeWZCDW5wvwmfG578d1qrKrTxyVmtIzfHO
	hx7Y8uGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy4Oq-00000003AR2-0gZX;
	Mon, 15 Sep 2025 08:17:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy4Oo-00000003AQL-2rG9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 08:17:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D591E60195;
	Mon, 15 Sep 2025 08:17:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7FD80C4CEF9;
	Mon, 15 Sep 2025 08:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757924241;
	bh=SdQHZDMCVCIf4yXCpwh6xj5ooQRTeCqnTuycX0e5QVw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=hqxbmE6gCIqv+98d7Bx6z8cZ2nNBT7mgN5GX3qUWc8if8m37Zd8US+5csMzF5OMpJ
	 FEsEC/RJArQUxfh4cuFZuWvHJLdJFaurrjUSuv/tj0E2ZNKaRYKu7DHEDiqopmCPim
	 vgN2uNYdTYpI9MvN/LGx2LhZ01rzlbwHuDz8aKEQdoIlXHGK3rMROvctAKsp5eTEju
	 lWW2/vXfU+2gdJyltTVKgnhFqpiza1z6EFw5ucLE2FNHF+Mqw3MVuJKgzEvVd4p8uO
	 6XAVLE+ODA9nYWP9wokOLJoJTvLLxJTAODgip0DZTjMs5WXUZjQuItGDBRJPcxuG7B
	 FqPjiDvF+Ei9A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E0D4CAC58E;
	Mon, 15 Sep 2025 08:17:21 +0000 (UTC)
From: Rohan G Thomas via B4 Relay <devnull+rohan.g.thomas.altera.com@kernel.org>
Date: Mon, 15 Sep 2025 16:17:18 +0800
Subject: [PATCH net v2 1/2] net: stmmac: est: Fix GCL bounds checks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250915-qbv-fixes-v2-1-ec90673bb7d4@altera.com>
References: <20250915-qbv-fixes-v2-0-ec90673bb7d4@altera.com>
In-Reply-To: <20250915-qbv-fixes-v2-0-ec90673bb7d4@altera.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <Jose.Abreu@synopsys.com>, 
 Rohan G Thomas <rohan.g.thomas@intel.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Rohan G Thomas <rohan.g.thomas@altera.com>, 
 Matthew Gerlach <matthew.gerlach@altera.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757924239; l=1340;
 i=rohan.g.thomas@altera.com; s=20250815; h=from:subject:message-id;
 bh=HUAYKbtaVV7CCEfir5e4410D4ZIncaawEtn3kXUUXA0=;
 b=nYTLQKzxU0RExj8QRfyzQi45pvskNrqlgXE7azX/stBzmOcQXm//u60lh2AbIaP2zFrQzFKzO
 T7brkbXToO1Bd3aK6yoT/ytTZTdTiMx3Gt63WLur+WUAucOkfZdju6R
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

From: Rohan G Thomas <rohan.g.thomas@altera.com>

Fix the bounds checks for the hw supported maximum GCL entry
count and gate interval time.

Fixes: b60189e0392f ("net: stmmac: Integrate EST with TAPRIO scheduler API")
Signed-off-by: Rohan G Thomas <rohan.g.thomas@altera.com>
Reviewed-by: Matthew Gerlach <matthew.gerlach@altera.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
index 694d6ee1438197bd4434af6e9b78f022e94ff98f..9c84bde848263976cf08f286751ee09e2dbac09b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
@@ -981,7 +981,7 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
 	if (qopt->cmd == TAPRIO_CMD_DESTROY)
 		goto disable;
 
-	if (qopt->num_entries >= dep)
+	if (qopt->num_entries > dep)
 		return -EINVAL;
 	if (!qopt->cycle_time)
 		return -ERANGE;
@@ -1012,7 +1012,7 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
 		s64 delta_ns = qopt->entries[i].interval;
 		u32 gates = qopt->entries[i].gate_mask;
 
-		if (delta_ns > GENMASK(wid, 0))
+		if (delta_ns > GENMASK(wid - 1, 0))
 			return -ERANGE;
 		if (gates > GENMASK(31 - wid, 0))
 			return -ERANGE;

-- 
2.26.2



