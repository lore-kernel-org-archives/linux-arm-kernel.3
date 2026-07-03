Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 886F3C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 11:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VWY2Crs2joWjAQwhRFf+Tu4H97AY31GvwuXuYsgMjIs=; b=JEhjCgYCb9k1TmNOZOFmOhaRvi
	ywt1Ub17XLBt7z8I9KPQYD8mvnwBWPnEiwfYduaJMW7Y6s+J4iux2GI64bpcEEDWZsIUuumIk3jtr
	gAMoaL79yDYbLk5r1A8jy1PXbyJrS1qikTubh4mUhvCbTwrTtdlYWOCqAnv0xg2Z+J6p7KLcAc30W
	twqxaueeD32Lk/kB6nBY6U3P0Jka6vHJmu/h82NOq3MSdZHjnXjqfU3g1+8h39nXIcVYVuzISCH3o
	K8HyfEcTYcL2mfwBZLM3uhciTStUg9ST7xjmskdxoJC2CuU3De6Ws3KxMrARwEslFXN77zEYJH1T1
	NnyHg3iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfbfK-00000006kZ2-0x33;
	Fri, 03 Jul 2026 11:02:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfbfJ-00000006kYs-2KWk;
	Fri, 03 Jul 2026 11:02:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7D1846001A;
	Fri,  3 Jul 2026 11:02:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C79C1F000E9;
	Fri,  3 Jul 2026 11:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783076556;
	bh=VWY2Crs2joWjAQwhRFf+Tu4H97AY31GvwuXuYsgMjIs=;
	h=From:Date:Subject:To:Cc;
	b=LCStCaPn43su3iXeUQzmDLqFuQZ4oM0kJD2nJAu3aU0wVEKqYwevTzcilprZaa6cr
	 H3xX63A8ilzSfrH/+mjCbQZ48UmflToCkPX//KbVdJM22GnWJoPY4VSJ20ynhvHLE5
	 pYBkH0LoFs6KlytUbhi7HqPqGKoUS1ah4eclgRroLt3i3LpPdRjdTP5cF4iwSTDBfj
	 V8ofktig5E80kpRPUDiuOsZ6vaWt1I5yFMc3twWuFpkHUy0NTv09y44N5tYTj5fjBM
	 WyE//yoFUu7gS2wfIlGgWIbibF3EqCmiO5Lvsxkv/JKJO0/y9RPqp/mDwP/Sk7E3OQ
	 anBQVc9KC1Muw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Fri, 03 Jul 2026 13:02:17 +0200
Subject: [PATCH net-next] net: airoha: add preliminary support to configure
 tx hw QoS queue during flowtable offloading
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-airoha-hw-qos-queue-stub-v1-1-ef253ffdd093@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQ7CIBBG4as0s3YSCsaKVzEuUP/KbMAyoE2a3
 l3i8lu8t5GiCJQuw0YFH1HJqWM8DPSIIb3A8uwma+zJTMZxkJJj4PjlJSsvDQ2std3ZOz+NR+f
 8bM/U83fBLOt/faWEyglrpdu+/wAEbzSbdAAAAA==
X-Change-ID: 20260703-airoha-hw-qos-queue-stub-939714339f28
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

Add the plumbing to program the AIROHA_FOE_QID field in the PPE FOE
entry with a per-flow priority value during flowtable offload. This
allows the hardware to steer offloaded flows to a specific QoS queue
on the egress QDMA block for traffic forwarded between two interfaces
via hardware acceleration, bypassing the kernel forwarding path.
The priority parameter is currently always zero because netfilter does
not yet provide a mechanism to pass the skb priority field to the
flowtable offload driver. Once that support is added in the netfilter
subsystem, the driver will be able to extract the priority from the
flow rule and map it to the appropriate hardware queue.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_ppe.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ethernet/airoha/airoha_ppe.c
index e7c78293002a..fdb973fc779c 100644
--- a/drivers/net/ethernet/airoha/airoha_ppe.c
+++ b/drivers/net/ethernet/airoha/airoha_ppe.c
@@ -331,7 +331,7 @@ static int airoha_ppe_foe_entry_prepare(struct airoha_eth *eth,
 					struct airoha_foe_entry *hwe,
 					struct net_device *netdev, int type,
 					struct airoha_flow_data *data,
-					int l4proto)
+					int l4proto, u8 priority)
 {
 	u32 qdata = FIELD_PREP(AIROHA_FOE_SHAPER_ID, 0x7f), ports_pad, val;
 	int wlan_etype = -EINVAL, dsa_port = airoha_get_dsa_port(&netdev);
@@ -386,7 +386,9 @@ static int airoha_ppe_foe_entry_prepare(struct airoha_eth *eth,
 			 */
 			channel = dsa_port >= 0 ? dsa_port : port->id;
 			channel = channel % AIROHA_NUM_QOS_CHANNELS;
-			qdata |= FIELD_PREP(AIROHA_FOE_CHANNEL, channel);
+			priority = priority % AIROHA_NUM_QOS_QUEUES;
+			qdata |= FIELD_PREP(AIROHA_FOE_CHANNEL, channel) |
+				 FIELD_PREP(AIROHA_FOE_QID, priority);
 
 			val |= FIELD_PREP(AIROHA_FOE_IB2_PSE_PORT, pse_port) |
 			       AIROHA_FOE_IB2_PSE_QOS;
@@ -1079,10 +1081,10 @@ static int airoha_ppe_flow_offload_replace(struct airoha_eth *eth,
 	struct airoha_flow_data data = {};
 	struct net_device *odev = NULL;
 	struct flow_action_entry *act;
+	u8 l4proto = 0, priority = 0;
 	struct airoha_foe_entry hwe;
 	int err, i, offload_type;
 	u16 addr_type = 0;
-	u8 l4proto = 0;
 
 	if (rhashtable_lookup(&eth->flow_table, &f->cookie,
 			      airoha_flow_table_params))
@@ -1177,7 +1179,7 @@ static int airoha_ppe_flow_offload_replace(struct airoha_eth *eth,
 		return -EINVAL;
 
 	err = airoha_ppe_foe_entry_prepare(eth, &hwe, odev, offload_type,
-					   &data, l4proto);
+					   &data, l4proto, priority);
 	if (err)
 		return err;
 

---
base-commit: 9507d09b2b8fc775652f5c5670028daa9d83a2bd
change-id: 20260703-airoha-hw-qos-queue-stub-939714339f28

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


