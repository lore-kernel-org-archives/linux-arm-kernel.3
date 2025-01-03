Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73237E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 12:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+CLXbWjqasJCmUu+dEMQw+ykuK3mnvuqvC53Exr4A7o=; b=2FZ1FmfZXspwLnQfZEBc25QG2U
	DqfhqUSQkIjvObFsuwIKaRneN+Lc4BgsjPpAro/+8SrDNLfJPm/EUtu5PHvOviOEOEkQFxi4Oy6ez
	oD5cyclrQkC9RyzXJHEMCMGoXJnmox/C/EOAg1o8DLTXzO3Ph7DkDVGie9zvcldrivss5Nxpr48DO
	sjPi7rOPfTiPO1QRe0f+jUuvlNVoEZfNf01NoQPimjtpg96vRFoN+bM5dsdQzVUQ+XJ712ggMPYtI
	jpyssekidzWJZbsVp6iX71j+8JhJolGoF86jEU1q15GHBj50dCKX2KLPE1eItDTO5mZUhdWI+KU/7
	LUHu7fWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTgek-0000000Ctsi-3op0;
	Fri, 03 Jan 2025 12:19:58 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTgcP-0000000CtaK-3OCl;
	Fri, 03 Jan 2025 12:17:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C3656A40ACA;
	Fri,  3 Jan 2025 12:15:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BE08C4CECE;
	Fri,  3 Jan 2025 12:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735906652;
	bh=fd/aH/z2sf7GgvQ1/qfuBaz9++yS81y9FpLiIGCQDWU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TE3XQ48JGqBoZfRW+mkkorMlScB3pNn75AyI3xCEh71hz79l66JuI/A5fQSye4MU4
	 0mjpxB+TiOmgBJov3e75C/ELmgXvRX8bCZ+wiFuizikj1CtAFjo0erTaBjPrcmXdb3
	 suk7yAng6zULTfXnzi2L/W5sqfCFD6u4GvCu0HUGMYhxw74D4ZcPFQ+4YDXIPODca0
	 wwUn2vAFVDP72t4bUtAOf54s2ARauetYaYs61mTg4iFH4tMkBdbsoI9gASNovwXCwF
	 qVw07lyqPUBaBA84SJYSb6bdNwrJ1ur2pledmflp6bvqUdNXtZEiubCobqH0vKGUOb
	 vtD/FG0z1i0ng==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Fri, 03 Jan 2025 13:17:02 +0100
Subject: [PATCH net-next 1/4] net: airoha: Enable Tx drop capability for
 each Tx DMA ring
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250103-airoha-en7581-qdisc-offload-v1-1-608a23fa65d5@kernel.org>
References: <20250103-airoha-en7581-qdisc-offload-v1-0-608a23fa65d5@kernel.org>
In-Reply-To: <20250103-airoha-en7581-qdisc-offload-v1-0-608a23fa65d5@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>, 
 Mark Lee <Mark-MC.Lee@mediatek.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 upstream@airoha.com, Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_041733_912840_4C0676F1 
X-CRM114-Status: UNSURE (   8.47  )
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

This is a preliminary patch in order to enable hw Qdisc offloading.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/mediatek/airoha_eth.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/ethernet/mediatek/airoha_eth.c b/drivers/net/ethernet/mediatek/airoha_eth.c
index d8bfc21a5b194478e18201ee3beca7494c223e24..59e889cf08e49b89d20fa630f83a1c1322bae6b4 100644
--- a/drivers/net/ethernet/mediatek/airoha_eth.c
+++ b/drivers/net/ethernet/mediatek/airoha_eth.c
@@ -1789,6 +1789,10 @@ static int airoha_qdma_init_tx_queue(struct airoha_queue *q,
 		WRITE_ONCE(q->desc[i].ctrl, cpu_to_le32(val));
 	}
 
+	/* xmit ring drop default setting */
+	airoha_qdma_set(qdma, REG_TX_RING_BLOCKING(qid),
+			TX_RING_IRQ_BLOCKING_TX_DROP_EN_MASK);
+
 	airoha_qdma_wr(qdma, REG_TX_RING_BASE(qid), dma_addr);
 	airoha_qdma_rmw(qdma, REG_TX_CPU_IDX(qid), TX_RING_CPU_IDX_MASK,
 			FIELD_PREP(TX_RING_CPU_IDX_MASK, q->head));

-- 
2.47.1


