Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 741F4C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 11:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JS16UsJqZQKHzE/fqDapHJt+OIumLYf6ntJe9irbYl4=; b=zNPNiWjr5A+XpSZwmgKiELKVVm
	YFmDi5J694sFJZZ9I3a6mQzvfg1E33sGWI2CrzUyG8WlHLPH4qTeL0brS5XEm89wUoYnfIFUc4ziv
	yr6wlvIwQ0u6TdfTIeGinCemoQuXj4WtQLQ9t/X5f9bbfHHJ+G/dhYa3jNmt93BB3v5viQ7MZsBoe
	l+AdmoE8WqHjMOEL3449bVafKoyqf164CRsn2yqmbaj3fsKtHuZhayqaCHzapuL1hxD1mVcyJ9kpa
	WTeux9Ig0UFkjZPy5SbPqEUBEB9jcKzwxTzsm45+3boIeuGevqoGkqcz9mm1Xh5yqiW9znZaW6MDN
	sJY+zaew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuVXc-00000005nQV-2Qvp;
	Tue, 18 Mar 2025 11:55:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuVOs-00000005lpD-0W2A;
	Tue, 18 Mar 2025 11:46:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 81DD25C58A6;
	Tue, 18 Mar 2025 11:44:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C527C4CEDD;
	Tue, 18 Mar 2025 11:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742298385;
	bh=dRSfnENYRHZuwLrer5dn2uietYIYGVOL//E5QEzIj7M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kakTF8xznxHOSoYlefG4ova38cxne+CfXCK6RIEWsZvtOCakeIrADtZiggj19G/Kt
	 hG9Tsl/MpSLA5/ofq8qYq9zhgYlawnwrY466ZZZ6BKrvs2M1TKEzD8G6QG4XIF4onX
	 tKDR+5oxV3q/VyS0PhhrFvActDo9NXNMx9172ecIqmhGmdX0CMkAhP8/5r5WYAtWw/
	 jFZhWbLb9sQ2WSna8YID9cJQAGgM+brAmatv/F9ZRJtTd/W3zeOi17Nei8dTh3R3pI
	 2bQCpg6Ouyksuva4wkCeEEJBemnOQkBpI/zIKUHOTpk1A7h+C8cExW0ETq25flAUZJ
	 +RE/svSuLy+IQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Tue, 18 Mar 2025 12:46:08 +0100
Subject: [PATCH net-next v2 4/7] net: octeontx2: Add metadata support for
 xdp mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250318-mvneta-xdp-meta-v2-4-b6075778f61f@kernel.org>
References: <20250318-mvneta-xdp-meta-v2-0-b6075778f61f@kernel.org>
In-Reply-To: <20250318-mvneta-xdp-meta-v2-0-b6075778f61f@kernel.org>
To: Marcin Wojtas <marcin.s.wojtas@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Jesper Dangaard Brouer <hawk@kernel.org>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
 Masahisa Kojima <kojima.masahisa@socionext.com>, 
 Sunil Goutham <sgoutham@marvell.com>, Geetha sowjanya <gakula@marvell.com>, 
 Subbaraya Sundeep <sbhatta@marvell.com>, hariprasad <hkelam@marvell.com>, 
 Bharat Bhushan <bbhushan2@marvell.com>, Felix Fietkau <nbd@nbd.name>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 "K. Y. Srinivasan" <kys@microsoft.com>, 
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
 Dexuan Cui <decui@microsoft.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Roger Quadros <rogerq@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org, bpf@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-hyperv@vger.kernel.org, linux-omap@vger.kernel.org, 
 Michal Kubiak <michal.kubiak@intel.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_044626_278033_6885AB69 
X-CRM114-Status: GOOD (  11.94  )
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

Set metadata size building the skb from xdp_buff in octeontx2 driver.
octeontx2 driver sets xdp headroom to OTX2_HEAD_ROOM

OTX2_HEAD_ROOM	OTX2_ALIGN
OTX2_ALIGN	128

so the headroom is large enough to contain xdp_frame and xdp metadata.
Please note this patch is just compiled tested.

Reviewed-by: Michal Kubiak <michal.kubiak@intel.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/marvell/octeontx2/nic/otx2_txrx.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/marvell/octeontx2/nic/otx2_txrx.c b/drivers/net/ethernet/marvell/octeontx2/nic/otx2_txrx.c
index 6bc5ce5a9f61cc2830975e7cc5219344760b0e51..af8cabe828d05c8832085d24d183312f24d00330 100644
--- a/drivers/net/ethernet/marvell/octeontx2/nic/otx2_txrx.c
+++ b/drivers/net/ethernet/marvell/octeontx2/nic/otx2_txrx.c
@@ -41,7 +41,7 @@ static bool otx2_xdp_rcv_pkt_handler(struct otx2_nic *pfvf,
 				     struct bpf_prog *prog,
 				     struct nix_cqe_rx_s *cqe,
 				     struct otx2_cq_queue *cq,
-				     bool *need_xdp_flush);
+				     u32 *metasize, bool *need_xdp_flush);
 
 static void otx2_sq_set_sqe_base(struct otx2_snd_queue *sq,
 				 struct sk_buff *skb)
@@ -336,6 +336,7 @@ static void otx2_rcv_pkt_handler(struct otx2_nic *pfvf,
 	struct nix_rx_sg_s *sg = &cqe->sg;
 	struct sk_buff *skb = NULL;
 	void *end, *start;
+	u32 metasize = 0;
 	u64 *seg_addr;
 	u16 *seg_size;
 	int seg;
@@ -346,7 +347,8 @@ static void otx2_rcv_pkt_handler(struct otx2_nic *pfvf,
 	}
 
 	if (pfvf->xdp_prog)
-		if (otx2_xdp_rcv_pkt_handler(pfvf, pfvf->xdp_prog, cqe, cq, need_xdp_flush))
+		if (otx2_xdp_rcv_pkt_handler(pfvf, pfvf->xdp_prog, cqe, cq,
+					     &metasize, need_xdp_flush))
 			return;
 
 	skb = napi_get_frags(napi);
@@ -378,6 +380,8 @@ static void otx2_rcv_pkt_handler(struct otx2_nic *pfvf,
 		skb->mark = parse->match_id;
 
 	skb_mark_for_recycle(skb);
+	if (metasize)
+		skb_metadata_set(skb, metasize);
 
 	napi_gro_frags(napi);
 }
@@ -1482,7 +1486,7 @@ static bool otx2_xdp_rcv_pkt_handler(struct otx2_nic *pfvf,
 				     struct bpf_prog *prog,
 				     struct nix_cqe_rx_s *cqe,
 				     struct otx2_cq_queue *cq,
-				     bool *need_xdp_flush)
+				     u32 *metasize, bool *need_xdp_flush)
 {
 	struct xdp_buff xdp, *xsk_buff = NULL;
 	unsigned char *hard_start;
@@ -1514,13 +1518,14 @@ static bool otx2_xdp_rcv_pkt_handler(struct otx2_nic *pfvf,
 
 	hard_start = (unsigned char *)phys_to_virt(pa);
 	xdp_prepare_buff(&xdp, hard_start, OTX2_HEAD_ROOM,
-			 cqe->sg.seg_size, false);
+			 cqe->sg.seg_size, true);
 
 	act = bpf_prog_run_xdp(prog, &xdp);
 
 handle_xdp_verdict:
 	switch (act) {
 	case XDP_PASS:
+		*metasize = xdp.data - xdp.data_meta;
 		break;
 	case XDP_TX:
 		qidx += pfvf->hw.tx_queues;

-- 
2.48.1


