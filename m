Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A39A5EB362F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 17:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8lHYvI4XaM23b/ks3cNwFoJCsC49zZtfLRl0dNWwiNs=; b=ER4Nbh5VjPZ1Cy/PzqliXIotjb
	8/w62f8XCFyB+qcdKPcvzrYIe49OBypc9w5kvilr5buV/Lxn432FNqc4tknd+RR3Ue+FP6EVuqMOJ
	pgAumr0Aanr3fc+U0IbLkJsXwLJ29/DsbWNQsVKMNqw0fz83yh6/Fsrs9j/ptfoXmiZTZzWi2Wj+f
	HhVyg7qjWKWjwMtuwd0Uxrf+BDL8AuU27ASn3R3SbzYp1hnWWT32QsH5C1bTZWs2STIAEPARfxbfk
	1IR+I/ESPvehhRQluzqYCZiGevuTk/zyLAIWoI/deGga82FeDhz/YkULAFlpRvLNFdFKQkf6pVvws
	a5iARYXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxTzR-0000000FgFp-3mzD;
	Tue, 03 Mar 2026 17:57:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxTzQ-0000000FgFR-0jKa;
	Tue, 03 Mar 2026 17:57:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 61E7644480;
	Tue,  3 Mar 2026 17:56:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9F0EC116C6;
	Tue,  3 Mar 2026 17:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772560619;
	bh=bubmxG6ci0dg97xq/tbfQq56C8X+tu4E9FIby9oyRm8=;
	h=From:Date:Subject:To:Cc:From;
	b=FjFsNgImvwWgOpJ2x+WI4WKLDwcvsAoBvdRmmOmXg5wfa6Xz/SpFFDhVGX1xXSOB7
	 vEIyn2NrLaw7b3hNbYwILW9MV+to40lqRd85waV0qtmRj7JpXyYZi1uLRUiDAPnK7W
	 1gpRpD6NgRHq5jY3MO5UB8D0uGmH5nEGtSXaHomq8NbUzrz7zk3LnpV1969S3rG+ci
	 fx8tCrN+X3AinAgFmbxHA82BtSsL9ozCzl7n6L2SOBKBlQpRh8df36NLIQA3womgI1
	 J1aBMQjzbRsM6IR9l48CgcKRGPm9VwazZ/vT/e1MOf/FBZx8e/l4mjZznKOSbCLarh
	 Bcs6FqlA7g44w==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Tue, 03 Mar 2026 18:56:39 +0100
Subject: [PATCH net v2] net: ethernet: mtk_eth_soc: Reset prog ptr to
 old_prog in case of error in mtk_xdp_setup()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260303-mtk-xdp-prog-ptr-fix-v2-1-97b6dbbe240f@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NQQ6CMBBFr0Jm7RioQsGV9zAsaBmgQdtm2hAM4
 e42PYDL/37++wcEYkMBHsUBTJsJxtkUxKUAvQx2JjRjyiBK0ZRCSPzEFffRo2c3o4+Mk9lxmOp
 OdVqTVAOkqWdKOGtfYClCn+BiQnT8zVdblav/1q3CCpW8jbJuW9Xc6+dKbOl9dTxDf57nD7C5M
 /2+AAAA
X-Change-ID: 20260227-mtk-xdp-prog-ptr-fix-af59b9cce7ba
To: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Jesper Dangaard Brouer <hawk@kernel.org>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Stanislav Fomichev <sdf@fomichev.me>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Paolo Valerio <pvalerio@redhat.com>, netdev@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 bpf@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_095700_241544_A4F9DFD9 
X-CRM114-Status: GOOD (  11.00  )
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

Reset eBPF program pointer to old_prog and do not decrease its ref-count
if mtk_open routine in mtk_xdp_setup() fails.

Fixes: 7c26c20da5d42 ("net: ethernet: mtk_eth_soc: add basic XDP support")
Suggested-by: Paolo Valerio <pvalerio@redhat.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
Changes in v2:
- Reset prog_ptr to old_prog instead of always setting it to NULL
- Link to v1: https://lore.kernel.org/r/20260227-mtk-xdp-prog-ptr-fix-v1-1-b73d7588b645@kernel.org
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 1060764b9f17da251a1437c4e0fb7042d14307a8..bb8ced22ca3be239ae268f042efc119c96285947 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -3770,12 +3770,21 @@ static int mtk_xdp_setup(struct net_device *dev, struct bpf_prog *prog,
 		mtk_stop(dev);
 
 	old_prog = rcu_replace_pointer(eth->prog, prog, lockdep_rtnl_is_held());
+
+	if (netif_running(dev) && need_update) {
+		int err;
+
+		err = mtk_open(dev);
+		if (err) {
+			rcu_assign_pointer(eth->prog, old_prog);
+
+			return err;
+		}
+	}
+
 	if (old_prog)
 		bpf_prog_put(old_prog);
 
-	if (netif_running(dev) && need_update)
-		return mtk_open(dev);
-
 	return 0;
 }
 

---
base-commit: c69855ada28656fdd7e197b6e24cd40a04fe14d3
change-id: 20260227-mtk-xdp-prog-ptr-fix-af59b9cce7ba

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


