Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5382AE64007
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Apr 2026 08:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jJ1vMbJfBrkdCY2MB+pu1xbv8eR080vqqGcGhYDLoAM=; b=Atu78XH7Bila5bLJcZfK+lpAKj
	lo/2f9EtS6tb7kRKImuANO+7WMNwzYU3wYvBh2bE7rRHo/aoF9tXauM0pqfsYZR1hZEXOk7mBFhIR
	s/avnXckjgXR0u1wYS3sO/fx6lRO2Jbqz+P5SAlmOQU1FfQ9pgXEgFPTx6A+Lfw5rEmr1f66oP/qT
	bcktaf8fpeYaR9rO7r0b5EyK5IFZ0+8QoBjAQfC8v4u2X/q7U1acxZ6TcBbqv09IOTG7qF2eBcw4j
	SXJrJrejNEawgWwrNgM1DPQ3i2KM4AYHg99mqgoW4RXnBbcvBN8G8ZRxzOmHyGOdEsF3XX3vH26JH
	RLtGbLnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBq3o-0000000E9QT-3TYB;
	Sun, 12 Apr 2026 08:20:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBq3n-0000000E9QK-31tl;
	Sun, 12 Apr 2026 08:20:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C175160008;
	Sun, 12 Apr 2026 08:20:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E23F7C19424;
	Sun, 12 Apr 2026 08:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775982050;
	bh=xKqI+P1KWypfWU+RDHzu5Y0I3ZlpFtGyeLcvopY078M=;
	h=From:Date:Subject:To:Cc:From;
	b=Ji7HQV7wLSHLqUrLUzL1+khHMwXGT4URcxRT0FBdqPaKR0vd5EQoJ6AUyFPTZGJs0
	 PVh/K4BQDRl941ayzkF1iePDiMGgRNOHkA8Eb6B7eSscy77ZWfnloHtVwGqSD5lhw3
	 5868NX8YKMPIdfIvp6iFYSiZQTo3K9l2H8UcAbYWtwFr2Nz8KhrraEELuE2Rpf2tn+
	 9wsH5ncsllRsijOQQ6pYDk8DLSlFzHa8UqH2dPAdknn5lS/OnvH++H/DPOV3kIoSM2
	 lbrSnv6jCd7pT30IlUkvU4GNROE5EanlRGtC17HYRig4gJoVP6ubd4lt3SEDlNrxJh
	 M82wB4R9Jw7cQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sun, 12 Apr 2026 10:20:25 +0200
Subject: [PATCH net] net: airoha: Wait for NPU PPE configuration to
 complete in airoha_ppe_offload_setup()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260412-airoha-wait-for-npu-config-offload-setup-v1-1-f4e0aa2a5d85@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2NQQrDMAzAvlJ8niEJ7WD7ytghNE5rGHZw0nVQ+
 veFHnWQdEAlY6rwHA4w+nJllQ7+NsC8RlkIOXWG4MLdjT5gZNM14h65YVZDKRvOKpkX1Jw/GhN
 WaltB/0hunELoUoKeK0aZf9fqBUIN3uf5B/Jyqfd/AAAA
X-Change-ID: 20260412-airoha-wait-for-npu-config-offload-setup-19d04522412d
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
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

In order to properly enable flowtable hw offloading, poll
REG_PPE_PPE_FLOW_CFG register in airoha_ppe_offload_setup routine and
wait for NPU PPE configuration triggered by ppe_init callback to complete
before running airoha_ppe_hw_init().

Fixes: 00a7678310fe3 ("net: airoha: Introduce flowtable offload support")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_ppe.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ethernet/airoha/airoha_ppe.c
index c2c32b6833df..52199f6b39f9 100644
--- a/drivers/net/ethernet/airoha/airoha_ppe.c
+++ b/drivers/net/ethernet/airoha/airoha_ppe.c
@@ -1332,6 +1332,7 @@ static int airoha_ppe_offload_setup(struct airoha_eth *eth)
 	struct airoha_npu *npu = airoha_ppe_npu_get(eth);
 	struct airoha_ppe *ppe = eth->ppe;
 	int err, ppe_num_stats_entries;
+	u32 val;
 
 	if (IS_ERR(npu))
 		return PTR_ERR(npu);
@@ -1340,6 +1341,13 @@ static int airoha_ppe_offload_setup(struct airoha_eth *eth)
 	if (err)
 		goto error_npu_put;
 
+	/* Wait for NPU PPE configuration to complete */
+	err = read_poll_timeout(airoha_fe_rr, val, val, USEC_PER_MSEC,
+				100 * USEC_PER_MSEC, false, eth,
+				REG_PPE_PPE_FLOW_CFG(0));
+	if (err)
+		goto error_npu_put;
+
 	ppe_num_stats_entries = airoha_ppe_get_total_num_stats_entries(ppe);
 	if (ppe_num_stats_entries > 0) {
 		err = npu->ops.ppe_init_stats(npu, ppe->foe_stats_dma,

---
base-commit: 02f72964395911e7a09bb2ea2fe6f79eda4ea2c2
change-id: 20260412-airoha-wait-for-npu-config-offload-setup-19d04522412d

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


