Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA0D9E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jan 2025 18:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cNNEQTfDk8Yom1JObfiP3ux4k8qElkfZC1BvWtIlhPM=; b=PR23h9khfaLjp3tKw81uh/ly3Q
	E6586o3SvJScz5wpk+z4w16gzazL6ZrwXWDV3nvaXpSikUt2H98YK4tpL6lzWLgMXs9y+aoXgt4Zw
	EBT3vzkNdNPSn9qeUweJCA47KYW9aZs3Q0CRwVTET7R1xTaIY4FUT3co6pWPhqIHOjacnCUP2HqQw
	e8mq7A0XtRz7opaQ8g0ECephLs9H8/NP9Ksp+M6hRV6wFKTiwuoh+98MNWrRrhyVZXuYmBx1fa5fM
	o44zeyWD6lJpQqhshp7bCLt80EY7ksSuzOVYilxH4rmo5OhdazELvYYWI/J2qSc8N1ac7MP9qrmy0
	nnI2USVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tX2nP-00000003GH2-0Pn8;
	Sun, 12 Jan 2025 18:34:47 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tX2m9-00000003GCh-2cCc;
	Sun, 12 Jan 2025 18:33:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 73EDAA40708;
	Sun, 12 Jan 2025 18:31:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEA33C4CEDF;
	Sun, 12 Jan 2025 18:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736706807;
	bh=4WQQaCak4TJuaVWaDAMb3yACSDF7AlTUwq82HMM4tQo=;
	h=From:Date:Subject:To:Cc:From;
	b=vDAXRM3US9kpZLqIDfuJztnFopiRf/XL2Z4SjUeicqPbmPgFeZXBiEFWAmR+1dqgz
	 ol7fQN0lR0fA1RIByTY04bp+PH1doZpW/Sh5xeURJco7kvHWizz7dmdkbDMiKEFcqG
	 pwuDNoLMFMTbGJDNThywbLMPW3NLy0Fy0emoLF5LQZv5YeiLBejN4YSRuLBxoy0EbN
	 UeEgJkebg1bWdFTc+pkLhoe489MFibL2m7f3g4g8rfQ0bgcoP92X9C4idZIGI8l0wk
	 T5PxrL3TGDn8YFwUOjf7vAHro5PaKb/eaN9K4tY+qnHyL8zxfGHg5O4bWQY9FuyB3n
	 DBCngiY45Iv3A==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sun, 12 Jan 2025 19:32:45 +0100
Subject: [PATCH net-next] net: airoha: Enforce ETS Qdisc priomap
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250112-airoha_ets_priomap-v1-1-fb616de159ba@kernel.org>
X-B4-Tracking: v=1; b=H4sIAMwKhGcC/x3MMQqAMAxA0atIZgs2WBGvIiJBU82gLamIULy7x
 fEN/2dIrMIJhiqD8i1Jwllg6wqWnc6NjazFgA26xlo0JBp2mvlKc1QJB0WDzmHXUtuT91DCqOz
 l+afj9L4fh7NURWQAAAA=
X-Change-ID: 20250112-airoha_ets_priomap-255264a48aff
To: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 Davide Caratti <dcaratti@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250112_103329_735328_BCF58B2B 
X-CRM114-Status: GOOD (  11.15  )
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

EN7581 SoC supports fixed QoS band priority where WRR queues have lowest
priorities with respect to SP ones.
E.g: WRR0, WRR1, .., WRRm, SP0, SP1, .., SPn

Enforce ETS Qdisc priomap according to the hw capabilities.

Suggested-by: Davide Caratti <dcaratti@redhat.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/mediatek/airoha_eth.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/airoha_eth.c b/drivers/net/ethernet/mediatek/airoha_eth.c
index a30c417d66f2f9b0958fe1dd3829fb9ac530a34c..415d784de741c991fa521243783860dee1ed0bfa 100644
--- a/drivers/net/ethernet/mediatek/airoha_eth.c
+++ b/drivers/net/ethernet/mediatek/airoha_eth.c
@@ -2793,7 +2793,7 @@ static int airoha_qdma_set_tx_ets_sched(struct airoha_gdm_port *port,
 	struct tc_ets_qopt_offload_replace_params *p = &opt->replace_params;
 	enum tx_sched_mode mode = TC_SCH_SP;
 	u16 w[AIROHA_NUM_QOS_QUEUES] = {};
-	int i, nstrict = 0;
+	int i, nstrict = 0, nwrr, qidx;
 
 	if (p->bands > AIROHA_NUM_QOS_QUEUES)
 		return -EINVAL;
@@ -2807,7 +2807,20 @@ static int airoha_qdma_set_tx_ets_sched(struct airoha_gdm_port *port,
 	if (nstrict == AIROHA_NUM_QOS_QUEUES - 1)
 		return -EINVAL;
 
-	for (i = 0; i < p->bands - nstrict; i++)
+	/* EN7581 SoC supports fixed QoS band priority where WRR queues have
+	 * lowest priorities with respect to SP ones.
+	 * e.g: WRR0, WRR1, .., WRRm, SP0, SP1, .., SPn
+	 */
+	nwrr = p->bands - nstrict;
+	qidx = nstrict && nwrr ? nstrict : 0;
+	for (i = 1; i <= p->bands; i++) {
+		if (p->priomap[i % AIROHA_NUM_QOS_QUEUES] != qidx)
+			return -EINVAL;
+
+		qidx = i == nwrr ? 0 : qidx + 1;
+	}
+
+	for (i = 0; i < nwrr; i++)
 		w[i] = p->weights[nstrict + i];
 
 	if (!nstrict)

---
base-commit: 7d0da8f862340c5f42f0062b8560b8d0971a6ac4
change-id: 20250112-airoha_ets_priomap-255264a48aff

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


