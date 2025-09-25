Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACB5BCAC5B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 14:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IJ+nF8uKdrEQpugzICNVcKzol70S/AnQATCfzBW+hiM=; b=MSiePeJ4FnJD/eKTZ3SM8GaYsn
	OUpW3WUuKUihe1DXqA/kCkiSAn5Y7mMKA4knOexCcSX8jVlVSf+Tc1DuUK1i/1NR+yK2LAoDwlwIp
	0cpA+xR6p9Vvb2Qsdlngos915EyflW76WqCIVVQd+cTrlAHnr7oiLaSZsjzwMu0Nta5Wg1I4rPE+F
	FKkt5jP9CxWBUxs31pEe+HqIrij/Hn8yAtAf221hGUxpJUYEJ90v9oTx9o6sVkw2srLqyWDCr9H4X
	o4qweqT4JOQE04SvpwTPzZcx9zLCeXqyE3xmUEm28wTb69ciMfWlL2C6FrTQJtCGa0tiJMViD9mPw
	LJ6/3alg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1mcA-00000009mti-3RmW;
	Thu, 25 Sep 2025 14:06:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1mc9-00000009mqq-0Lqi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 14:06:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3CA88605D8;
	Thu, 25 Sep 2025 14:06:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DAC92C116D0;
	Thu, 25 Sep 2025 14:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758809187;
	bh=HV1fJPRFrPlcadQzhmD0w45w8XUYKAzZp4nL/8OX/sU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=AZXV4PyEfHJIAOnyxSkujQNWdCnF1+t0zf438VaaaJxiOkVeZAQ2bhk4zWXwks32S
	 xCtuq4ZUx7iRijmMNrn9R9iuIxGkClsa4QpFc3rq7wjqsNURc4HuTOvi8iuG/bfDrc
	 xz4LqWlW0QNWGnlEoJR2/kVqQH0UMEzYKacUQGEUA50J1vNIETIZb6Pddfxb2E8lam
	 K/H79239LrutrQYv+yFXTmha4wK7+NmaX2iT1RmWsoi6+C8I3YkzOr0k40e6B1+joa
	 US5G3dPMN5hAb19htIfLNuuZAPQjNMEKkNsboWDcjo4KDEbOe942rVcZ0Kk+nacgtu
	 XvRuD6GGq2acw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD778CAC5B7;
	Thu, 25 Sep 2025 14:06:27 +0000 (UTC)
From: Rohan G Thomas via B4 Relay <devnull+rohan.g.thomas.altera.com@kernel.org>
Date: Thu, 25 Sep 2025 22:06:14 +0800
Subject: [PATCH net-next v3 2/2] net: stmmac: tc: Add HLBS drop count to
 taprio stats
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-hlbs_2-v3-2-3b39472776c2@altera.com>
References: <20250925-hlbs_2-v3-0-3b39472776c2@altera.com>
In-Reply-To: <20250925-hlbs_2-v3-0-3b39472776c2@altera.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Rohan G Thomas <rohan.g.thomas@altera.com>, 
 Matthew Gerlach <matthew.gerlach@altera.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758809186; l=1901;
 i=rohan.g.thomas@altera.com; s=20250815; h=from:subject:message-id;
 bh=yQq3VlBwoMaeIk8RqufK4UtuoZY2MJJUDQlkLWwWmPU=;
 b=hMdALF2Fprn4xVt2wKIRH3p+R12E3UBo6KtGBycM/0VaCD43UCQOfL6aRH7GT37DTEzaquy94
 rybizx/a9NfB7Wi/Vz9npKmXRfGA6OTViRZojhai+kF+f2vKAwnzA0S
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

Add the count of the frames dropped by Head-Of-Line Blocking due to
Scheduling(HLBS) error to taprio window drop count stats.

Signed-off-by: Rohan G Thomas <rohan.g.thomas@altera.com>
Reviewed-by: Matthew Gerlach <matthew.gerlach@altera.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
index 694d6ee1438197bd4434af6e9b78f022e94ff98f..97e89a604abd7a01bb8e904c38f10716e0a911c1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
@@ -1080,6 +1080,7 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
 		for (i = 0; i < priv->plat->tx_queues_to_use; i++) {
 			priv->xstats.max_sdu_txq_drop[i] = 0;
 			priv->xstats.mtl_est_txq_hlbf[i] = 0;
+			priv->xstats.mtl_est_txq_hlbs[i] = 0;
 		}
 		mutex_unlock(&priv->est_lock);
 	}
@@ -1097,7 +1098,8 @@ static void tc_taprio_stats(struct stmmac_priv *priv,
 
 	for (i = 0; i < priv->plat->tx_queues_to_use; i++)
 		window_drops += priv->xstats.max_sdu_txq_drop[i] +
-				priv->xstats.mtl_est_txq_hlbf[i];
+				priv->xstats.mtl_est_txq_hlbf[i] +
+				priv->xstats.mtl_est_txq_hlbs[i];
 	qopt->stats.window_drops = window_drops;
 
 	/* Transmission overrun doesn't happen for stmmac, hence always 0 */
@@ -1111,7 +1113,8 @@ static void tc_taprio_queue_stats(struct stmmac_priv *priv,
 	int queue = qopt->queue_stats.queue;
 
 	q_stats->stats.window_drops = priv->xstats.max_sdu_txq_drop[queue] +
-				      priv->xstats.mtl_est_txq_hlbf[queue];
+				      priv->xstats.mtl_est_txq_hlbf[queue] +
+				      priv->xstats.mtl_est_txq_hlbs[queue];
 
 	/* Transmission overrun doesn't happen for stmmac, hence always 0 */
 	q_stats->stats.tx_overruns = 0;

-- 
2.35.3



