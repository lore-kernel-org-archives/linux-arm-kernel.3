Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B336FE77198
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 22:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jo7KO2QKu2qPetK4xY2xNxgeD8/GXpG5tgHg1wqEWWI=; b=yUfKjGVvljkS9ASUQgCW+/57iD
	UpXgj1tvYKBuQriem9PXlPeUSZBOPIGJX2YQRo4mj6W5nzEWi7JdLlDLysX+tIDCh0vRNc+VTw+xQ
	dF5DdWREa1o3eDOOAr7LMkVcsinyxJ/NHVU6n5RoazIUBA1CaDp6I/ChSY84Mk1aUlDdL7c5WFGtR
	JqS9Zw7j77gLkVkuiBCj8ZrzLj0rwrcOROx51zL2zOR0z4bfqjoiSCr58B/vDP1DHqA1TTL1MhU35
	OgFXw65NRj8BIeOVjcsjfsDB07fWa5A7ufjuYmXa5/IszwqXvQ1T9IfcdVSFkgYLT5kPqfwzEFvvn
	eeOttVqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVI3c-00000006PuW-26HN;
	Tue, 07 Jan 2025 22:28:16 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVI2R-00000006PqM-1Au9;
	Tue, 07 Jan 2025 22:27:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 72FE95C24DA;
	Tue,  7 Jan 2025 22:26:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1A57C4CED6;
	Tue,  7 Jan 2025 22:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736288822;
	bh=/BuvRwLGk+7by7QeOu7n+QgJ5Sk03TO9WCsGbgTs3sE=;
	h=From:Date:Subject:To:Cc:From;
	b=Gx3FMrdJH+xaen2jSRnu523A40ZOBBFaj896IwBv1PeosUm+eiUCx+K3Qz9CAisX0
	 Bj4ohheTiHZDQHZelhKF3ZFTfVQUyYiLiard4x5QdylW2YZA0cpwJe64TMf7CsHbrT
	 NHCF7nrJPJUwOhDoS/YVdeTw/bb9DlM95aKGSfyH0cy7Kdmjz55No3Im9bCSKcgyaX
	 Y/lcRZglFjbLyiC3LS06AtM0KOyhUxQKrH+ZWpx5E/sdOEj3SRTJ/I+K8o3m75Kzsn
	 wKRft5pBwfhGEIrJXrFR4f73QwnxJ6eSUrfjYV8k4mFQpH3nB0hKLi2DpvYPim5dj/
	 ADsdcP6QPwokg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Tue, 07 Jan 2025 23:26:28 +0100
Subject: [PATCH net-next] net: airoha: Fix channel configuration for ETS
 Qdisc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250107-airoha-ets-fix-chan-v1-1-97f66ed3a068@kernel.org>
X-B4-Tracking: v=1; b=H4sIABOqfWcC/x2MSwqAMAwFryJZG6ifVvAq4qLUaLNRaUSE0rsbX
 Q5v3mQQSkwCY5Uh0c3Cx67Q1BWE6PeNkBdlaE1rTWMG9JyO6JEuwZUf/CSkzobgw+AW14M+z0S
 6/dVpLuUFNrlCSGUAAAA=
X-Change-ID: 20250107-airoha-ets-fix-chan-e35ccac76d64
To: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>, 
 Mark Lee <Mark-MC.Lee@mediatek.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_142703_368004_683C17BD 
X-CRM114-Status: GOOD (  11.23  )
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

Limit ETS QoS channel to AIROHA_NUM_QOS_CHANNELS in
airoha_tc_setup_qdisc_ets() in order to align the configured channel to
the value set in airoha_dev_select_queue().

Fixes: 20bf7d07c956 ("net: airoha: Add sched ETS offload support")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/mediatek/airoha_eth.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/airoha_eth.c b/drivers/net/ethernet/mediatek/airoha_eth.c
index b9f1c42f0a40ca268506b4595dfa1902a15be26c..a30c417d66f2f9b0958fe1dd3829fb9ac530a34c 100644
--- a/drivers/net/ethernet/mediatek/airoha_eth.c
+++ b/drivers/net/ethernet/mediatek/airoha_eth.c
@@ -2840,11 +2840,14 @@ static int airoha_qdma_get_tx_ets_stats(struct airoha_gdm_port *port,
 static int airoha_tc_setup_qdisc_ets(struct airoha_gdm_port *port,
 				     struct tc_ets_qopt_offload *opt)
 {
-	int channel = TC_H_MAJ(opt->handle) >> 16;
+	int channel;
 
 	if (opt->parent == TC_H_ROOT)
 		return -EINVAL;
 
+	channel = TC_H_MAJ(opt->handle) >> 16;
+	channel = channel % AIROHA_NUM_QOS_CHANNELS;
+
 	switch (opt->command) {
 	case TC_ETS_REPLACE:
 		return airoha_qdma_set_tx_ets_sched(port, channel, opt);

---
base-commit: a1942da8a38717ddd9b4c132f59e1657c85c1432
change-id: 20250107-airoha-ets-fix-chan-e35ccac76d64

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


