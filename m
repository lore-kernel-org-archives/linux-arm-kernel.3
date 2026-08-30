Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D104C61DD9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Aug 2026 12:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=giq0ZKRP+1aIgx6E+QNEKTdfQEpdLDHpMpAo/DOA7+o=; b=Bq8irQEYPu96ti0HilARB1YfdU
	vug1W0MGDugYXu+A1jJP+lnjqHRr/HibqaCKKzPv0k9C8r+CLLQJE5Lo0BY3gZY683DSvfhlr/l6v
	leMosAb2efetSUg3xv5GVCVuHJzOqvOV2/SWgSLeTVhiU76Lr19DybS3MK1fTX+2BAEL60bCDn/HR
	2RWzoACcsYRHFuzmvwedNGT5Pr2orSQzbUiwaG7ivKaVc0Wk/0fiIc/oouNrXg34j6M1wE8wksN7+
	jbvkMlKaZ4iFEOUr85HYzCOiC9BpgA0Bc5qR4OF81rzFv8UlwN07gYuO6rRWq02Ji1f0n0hbIQXum
	TtLldCew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0eeV-00000007hwg-2S67;
	Sun, 30 Aug 2026 12:28:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0eeU-00000007hwS-16gP;
	Sun, 30 Aug 2026 12:28:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7BB184085E;
	Sun, 30 Aug 2026 12:28:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D38CD1F000E9;
	Sun, 30 Aug 2026 12:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788092925;
	bh=giq0ZKRP+1aIgx6E+QNEKTdfQEpdLDHpMpAo/DOA7+o=;
	h=From:Date:Subject:To:Cc;
	b=MdPHKOW8/AN3VNoICdI9/e84pyIxOt3M0yYc3aZ2H+YpGYwpc11bwEcJ5xmx4wpJT
	 LNIPJjOBFA+9Xk94bDSr02Y+azPNY8s1tPFLu/8hrGzkVEJKwK0xnssn8L7aGSQFzT
	 4Sevm2gU8775M2uMblhTVzkSJKG4vinfn2AQhCsadjOTFm55zf+9mhIOScKv8fmNUX
	 IMXvbTK4Ze8yDDLPVbB2PtFQBb8LWHEnvnzDfRo3GvPE3a28XENhs2LlS2gxZDmFoE
	 8ZCRBW/pJObTVLdXebvKboLnsievDAat4Ql/gnWACowVH22dFfGyB4CPLm5/lJiid6
	 2UD/0eFdj/14g==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sun, 30 Aug 2026 14:28:27 +0200
Subject: [PATCH net] net: airoha: enable RX_DONE interrupt for RX queue 31
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260830-airoha-rxdone-rxq31-v1-1-830a91503f2f@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQqAIBAAvxJ7TnAtKvpKdBDdci9aa0QQ/j3pN
 Mxh5oVMwpRhbl4QujlzilWwbcAFG3dS7KuD0WbQU6eVZUnBKnl8ilRxdqgMeoebdQbHHmp5CG3
 8/NcFIl2wlvIBQxFW02oAAAA=
X-Change-ID: 20260830-airoha-rxdone-rxq31-21dc1fac2174
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
X-Mailer: b4 0.14.3
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

RX queue 31 has always been allocated and filled by airoha_qdma_init_rx()
since RX_DONE_INT_MASK spans queues 0-31, but none of the RX_IRQ*
_BANK_PIN_MASK values covered BIT(31). As a consequence the RX_DONE
interrupt for queue 31 was never enabled, airoha_qdma_rx_process() never
ran on that queue and its buffers were never reaped.

Route RX queue 31's RX_DONE interrupt to IRQ bank 1 so that the queue
is drained and its buffers returned to the page pool.

Fixes: f252493e1835 ("net: airoha: Enable multiple IRQ lines support in airoha_eth driver.")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index fa9a8edce22f..8277c1c87bb3 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -538,7 +538,7 @@ struct airoha_wdma_info {
 
 /* RX queue to IRQ mapping: BIT(q) in IRQ(n) */
 #define RX_IRQ0_BANK_PIN_MASK			0x839f
-#define RX_IRQ1_BANK_PIN_MASK			0x7fe00000
+#define RX_IRQ1_BANK_PIN_MASK			0xffe00000
 #define RX_IRQ2_BANK_PIN_MASK			0x20
 #define RX_IRQ3_BANK_PIN_MASK			0x40
 #define RX_IRQ_BANK_PIN_MASK(_n)		\

---
base-commit: 2188569e7e1b0bc3f3b557dc97ab7a02befc11c8
change-id: 20260830-airoha-rxdone-rxq31-21dc1fac2174

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


