Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 154B8C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 16:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LbTSPEsoo5SC3X6KapWlWPiYUOTT9M+P7X8TP6HlhZs=; b=po2ErB729Ip0dsnlxnqveH0Kqh
	Bld8i3kwEUkpP7cmAo3yCCWF02c8jCp/620j+VdXbdxSkafSZPJUSRFT/nl6jV32D7Y9/uNYJNtNg
	r5h3wEv4vZGtk4c+bLkmddLAwoaKD1/ZXBRXzx9UxAPSNir4RYWFmui5tU4QmyHgTo+a+4qxEy2bo
	uLZj/RQJro/i+uEj+PLy6wSMqEIkVlNbNsLt+yXX5ImiCAo+ePpG6nzPEurjg03Yn09rvo32jY3wP
	GrwMkRCIDzgLBWljuFLY683t9zlSMK5OeAFr85N2ZQ51y5MTs+l2I6a/W2AOLDcAnVkJYVAE7vsAH
	DVGGyisQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2uif-0000000BBSc-3HuC;
	Thu, 10 Apr 2025 16:25:37 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2tmo-0000000B0ak-0i9O;
	Thu, 10 Apr 2025 15:25:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C6726A4A90B;
	Thu, 10 Apr 2025 15:20:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0D54C4CEDD;
	Thu, 10 Apr 2025 15:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744298749;
	bh=MjDTqkHsQUoZDY7HZHDBkJnGyUIF+z3lclqQYwUiUSQ=;
	h=From:Date:Subject:To:Cc:From;
	b=VpmGQput7z9erAlGYbFKLsbkCzBvbXPOY1oFsdpjEfjIR7l5xY7/uwiTSTtIFWGfy
	 Oy7GzwiTGXIkeI1NjNnd8RfsDBS22AFtQSfHmBwWqGAQaETults1cmYLCiDxQijo7p
	 hRWgqPUscbHn2xTyNZWyQ8Wmfi2mO+/oJwVXETru7FUyYTpOZL1Jt2RI6JfC+2DanC
	 YsDah0JizIQOFCMYPGYvqXoHO5nbz9L8ynguI7IhXkSa5mq73nZOXCS1NMTXTa8til
	 J+5MgFXZrrZfmZIyUhk1b8DMVWJEpvg+XZkmxypsul/iQHt7rpHBjvIF9mwRsoXWDs
	 eiP3+SuxZQXjw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Thu, 10 Apr 2025 17:25:37 +0200
Subject: [PATCH net-next v3] net: airoha: Add matchall filter offload
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-airoha-hw-rx-ratelimit-v3-1-5ec2a244925e@kernel.org>
X-B4-Tracking: v=1; b=H4sIAPDi92cC/3XOQQ6CMBAF0KuQrq1pC6WpK+9hXDR0oBMRzJRUD
 OHuFtzowuWf5L8/C4tACJGdioURJIw4DjmUh4I1wQ0dcPQ5MyWUFqW03CGNwfHw5DRzchP0eMe
 JS+8rYcAYqzTL5QdBi/MOX645B4zTSK99J8nt+iFz6R+ZJJfcSuOFVV7XrT/fgAbojyN1bDOT+
 nb+vpZUdmpbQdV6pxsrf5x1Xd8CTuE+BQEAAA==
X-Change-ID: 20250319-airoha-hw-rx-ratelimit-1dd407e77925
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 Davide Caratti <dcaratti@redhat.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_082550_365331_770702C3 
X-CRM114-Status: GOOD (  19.23  )
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

Introduce tc matchall filter offload support in airoha_eth driver.
Matchall hw filter is used to implement hw rate policing via tc action
police:

$tc qdisc add dev eth0 handle ffff: ingress
$tc filter add dev eth0 parent ffff: matchall action police \
 rate 100mbit burst 1000k drop

The current implementation supports just drop/accept as exceed/notexceed
actions. Moreover, rate and burst are the only supported configuration
parameters.

Reviewed-by: Davide Caratti <dcaratti@redhat.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
Changes in v3:
- remove duplicated entries configuring REG_PPE_DFT_CPORT0() regs
- Link to v2: https://lore.kernel.org/r/20250409-airoha-hw-rx-ratelimit-v2-1-694e4fda5c91@kernel.org

Changes in v2:
- Validate act police mtu parameter
- Link to v1: https://lore.kernel.org/r/20250407-airoha-hw-rx-ratelimit-v1-1-917d092d56fd@kernel.org
---
 drivers/net/ethernet/airoha/airoha_eth.c  | 273 +++++++++++++++++++++++++++++-
 drivers/net/ethernet/airoha/airoha_eth.h  |   8 +-
 drivers/net/ethernet/airoha/airoha_ppe.c  |   9 +-
 drivers/net/ethernet/airoha/airoha_regs.h |   7 +
 4 files changed, 286 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index d748dc6de92367365db9f9548f9af52a7fdac187..f5f1bc7d65f74e184e4fa9db08767c46cb880e89 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -527,6 +527,25 @@ static int airoha_fe_init(struct airoha_eth *eth)
 	/* disable IFC by default */
 	airoha_fe_clear(eth, REG_FE_CSR_IFC_CFG, FE_IFC_EN_MASK);
 
+	airoha_fe_wr(eth, REG_PPE_DFT_CPORT0(0),
+		     FIELD_PREP(DFT_CPORT_MASK(7), FE_PSE_PORT_CDM1) |
+		     FIELD_PREP(DFT_CPORT_MASK(6), FE_PSE_PORT_CDM1) |
+		     FIELD_PREP(DFT_CPORT_MASK(5), FE_PSE_PORT_CDM1) |
+		     FIELD_PREP(DFT_CPORT_MASK(4), FE_PSE_PORT_CDM1) |
+		     FIELD_PREP(DFT_CPORT_MASK(3), FE_PSE_PORT_CDM1) |
+		     FIELD_PREP(DFT_CPORT_MASK(2), FE_PSE_PORT_CDM1) |
+		     FIELD_PREP(DFT_CPORT_MASK(1), FE_PSE_PORT_CDM1) |
+		     FIELD_PREP(DFT_CPORT_MASK(0), FE_PSE_PORT_CDM1));
+	airoha_fe_wr(eth, REG_PPE_DFT_CPORT0(1),
+		     FIELD_PREP(DFT_CPORT_MASK(7), FE_PSE_PORT_CDM2) |
+		     FIELD_PREP(DFT_CPORT_MASK(6), FE_PSE_PORT_CDM2) |
+		     FIELD_PREP(DFT_CPORT_MASK(5), FE_PSE_PORT_CDM2) |
+		     FIELD_PREP(DFT_CPORT_MASK(4), FE_PSE_PORT_CDM2) |
+		     FIELD_PREP(DFT_CPORT_MASK(3), FE_PSE_PORT_CDM2) |
+		     FIELD_PREP(DFT_CPORT_MASK(2), FE_PSE_PORT_CDM2) |
+		     FIELD_PREP(DFT_CPORT_MASK(1), FE_PSE_PORT_CDM2) |
+		     FIELD_PREP(DFT_CPORT_MASK(0), FE_PSE_PORT_CDM2));
+
 	/* enable 1:N vlan action, init vlan table */
 	airoha_fe_set(eth, REG_MC_VLAN_EN, MC_VLAN_EN_MASK);
 
@@ -1631,7 +1650,6 @@ static void airhoha_set_gdm2_loopback(struct airoha_gdm_port *port)
 
 	if (port->id == 3) {
 		/* FIXME: handle XSI_PCE1_PORT */
-		airoha_fe_wr(eth, REG_PPE_DFT_CPORT0(0),  0x5500);
 		airoha_fe_rmw(eth, REG_FE_WAN_PORT,
 			      WAN1_EN_MASK | WAN1_MASK | WAN0_MASK,
 			      FIELD_PREP(WAN0_MASK, HSGMII_LAN_PCIE0_SRCPORT));
@@ -2109,6 +2127,125 @@ static int airoha_tc_setup_qdisc_ets(struct airoha_gdm_port *port,
 	}
 }
 
+static int airoha_qdma_get_rl_param(struct airoha_qdma *qdma, int queue_id,
+				    u32 addr, enum trtcm_param_type param,
+				    u32 *val_low, u32 *val_high)
+{
+	u32 idx = QDMA_METER_IDX(queue_id), group = QDMA_METER_GROUP(queue_id);
+	u32 val, config = FIELD_PREP(RATE_LIMIT_PARAM_TYPE_MASK, param) |
+			  FIELD_PREP(RATE_LIMIT_METER_GROUP_MASK, group) |
+			  FIELD_PREP(RATE_LIMIT_PARAM_INDEX_MASK, idx);
+
+	airoha_qdma_wr(qdma, REG_TRTCM_CFG_PARAM(addr), config);
+	if (read_poll_timeout(airoha_qdma_rr, val,
+			      val & RATE_LIMIT_PARAM_RW_DONE_MASK,
+			      USEC_PER_MSEC, 10 * USEC_PER_MSEC, true, qdma,
+			      REG_TRTCM_CFG_PARAM(addr)))
+		return -ETIMEDOUT;
+
+	*val_low = airoha_qdma_rr(qdma, REG_TRTCM_DATA_LOW(addr));
+	if (val_high)
+		*val_high = airoha_qdma_rr(qdma, REG_TRTCM_DATA_HIGH(addr));
+
+	return 0;
+}
+
+static int airoha_qdma_set_rl_param(struct airoha_qdma *qdma, int queue_id,
+				    u32 addr, enum trtcm_param_type param,
+				    u32 val)
+{
+	u32 idx = QDMA_METER_IDX(queue_id), group = QDMA_METER_GROUP(queue_id);
+	u32 config = RATE_LIMIT_PARAM_RW_MASK |
+		     FIELD_PREP(RATE_LIMIT_PARAM_TYPE_MASK, param) |
+		     FIELD_PREP(RATE_LIMIT_METER_GROUP_MASK, group) |
+		     FIELD_PREP(RATE_LIMIT_PARAM_INDEX_MASK, idx);
+
+	airoha_qdma_wr(qdma, REG_TRTCM_DATA_LOW(addr), val);
+	airoha_qdma_wr(qdma, REG_TRTCM_CFG_PARAM(addr), config);
+
+	return read_poll_timeout(airoha_qdma_rr, val,
+				 val & RATE_LIMIT_PARAM_RW_DONE_MASK,
+				 USEC_PER_MSEC, 10 * USEC_PER_MSEC, true,
+				 qdma, REG_TRTCM_CFG_PARAM(addr));
+}
+
+static int airoha_qdma_set_rl_config(struct airoha_qdma *qdma, int queue_id,
+				     u32 addr, bool enable, u32 enable_mask)
+{
+	u32 val;
+	int err;
+
+	err = airoha_qdma_get_rl_param(qdma, queue_id, addr, TRTCM_MISC_MODE,
+				       &val, NULL);
+	if (err)
+		return err;
+
+	val = enable ? val | enable_mask : val & ~enable_mask;
+
+	return airoha_qdma_set_rl_param(qdma, queue_id, addr, TRTCM_MISC_MODE,
+					val);
+}
+
+static int airoha_qdma_set_rl_token_bucket(struct airoha_qdma *qdma,
+					   int queue_id, u32 rate_val,
+					   u32 bucket_size)
+{
+	u32 val, config, tick, unit, rate, rate_frac;
+	int err;
+
+	err = airoha_qdma_get_rl_param(qdma, queue_id, REG_INGRESS_TRTCM_CFG,
+				       TRTCM_MISC_MODE, &config, NULL);
+	if (err)
+		return err;
+
+	val = airoha_qdma_rr(qdma, REG_INGRESS_TRTCM_CFG);
+	tick = FIELD_GET(INGRESS_FAST_TICK_MASK, val);
+	if (config & TRTCM_TICK_SEL)
+		tick *= FIELD_GET(INGRESS_SLOW_TICK_RATIO_MASK, val);
+	if (!tick)
+		return -EINVAL;
+
+	unit = (config & TRTCM_PKT_MODE) ? 1000000 / tick : 8000 / tick;
+	if (!unit)
+		return -EINVAL;
+
+	rate = rate_val / unit;
+	rate_frac = rate_val % unit;
+	rate_frac = FIELD_PREP(TRTCM_TOKEN_RATE_MASK, rate_frac) / unit;
+	rate = FIELD_PREP(TRTCM_TOKEN_RATE_MASK, rate) |
+	       FIELD_PREP(TRTCM_TOKEN_RATE_FRACTION_MASK, rate_frac);
+
+	err = airoha_qdma_set_rl_param(qdma, queue_id, REG_INGRESS_TRTCM_CFG,
+				       TRTCM_TOKEN_RATE_MODE, rate);
+	if (err)
+		return err;
+
+	val = bucket_size;
+	if (!(config & TRTCM_PKT_MODE))
+		val = max_t(u32, val, MIN_TOKEN_SIZE);
+	val = min_t(u32, __fls(val), MAX_TOKEN_SIZE_OFFSET);
+
+	return airoha_qdma_set_rl_param(qdma, queue_id, REG_INGRESS_TRTCM_CFG,
+					TRTCM_BUCKETSIZE_SHIFT_MODE, val);
+}
+
+static int airoha_qdma_init_rl_config(struct airoha_qdma *qdma, int queue_id,
+				      bool enable, enum trtcm_unit_type unit)
+{
+	bool tick_sel = queue_id == 0 || queue_id == 2 || queue_id == 8;
+	enum trtcm_param mode = TRTCM_METER_MODE;
+	int err;
+
+	mode |= unit == TRTCM_PACKET_UNIT ? TRTCM_PKT_MODE : 0;
+	err = airoha_qdma_set_rl_config(qdma, queue_id, REG_INGRESS_TRTCM_CFG,
+					enable, mode);
+	if (err)
+		return err;
+
+	return airoha_qdma_set_rl_config(qdma, queue_id, REG_INGRESS_TRTCM_CFG,
+					 tick_sel, TRTCM_TICK_SEL);
+}
+
 static int airoha_qdma_get_trtcm_param(struct airoha_qdma *qdma, int channel,
 				       u32 addr, enum trtcm_param_type param,
 				       enum trtcm_mode_type mode,
@@ -2273,10 +2410,142 @@ static int airoha_tc_htb_alloc_leaf_queue(struct airoha_gdm_port *port,
 	return 0;
 }
 
+static int airoha_qdma_set_rx_meter(struct airoha_gdm_port *port,
+				    u32 rate, u32 bucket_size,
+				    enum trtcm_unit_type unit_type)
+{
+	struct airoha_qdma *qdma = port->qdma;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(qdma->q_rx); i++) {
+		int err;
+
+		if (!qdma->q_rx[i].ndesc)
+			continue;
+
+		err = airoha_qdma_init_rl_config(qdma, i, !!rate, unit_type);
+		if (err)
+			return err;
+
+		err = airoha_qdma_set_rl_token_bucket(qdma, i, rate,
+						      bucket_size);
+		if (err)
+			return err;
+	}
+
+	return 0;
+}
+
+static int airoha_tc_matchall_act_validate(struct tc_cls_matchall_offload *f)
+{
+	const struct flow_action *actions = &f->rule->action;
+	const struct flow_action_entry *act;
+
+	if (!flow_action_has_entries(actions)) {
+		NL_SET_ERR_MSG_MOD(f->common.extack,
+				   "filter run with no actions");
+		return -EINVAL;
+	}
+
+	if (!flow_offload_has_one_action(actions)) {
+		NL_SET_ERR_MSG_MOD(f->common.extack,
+				   "only once action per filter is supported");
+		return -EOPNOTSUPP;
+	}
+
+	act = &actions->entries[0];
+	if (act->id != FLOW_ACTION_POLICE) {
+		NL_SET_ERR_MSG_MOD(f->common.extack, "unsupported action");
+		return -EOPNOTSUPP;
+	}
+
+	if (act->police.exceed.act_id != FLOW_ACTION_DROP) {
+		NL_SET_ERR_MSG_MOD(f->common.extack,
+				   "invalid exceed action id");
+		return -EOPNOTSUPP;
+	}
+
+	if (act->police.notexceed.act_id != FLOW_ACTION_ACCEPT) {
+		NL_SET_ERR_MSG_MOD(f->common.extack,
+				   "invalid notexceed action id");
+		return -EOPNOTSUPP;
+	}
+
+	if (act->police.notexceed.act_id == FLOW_ACTION_ACCEPT &&
+	    !flow_action_is_last_entry(actions, act)) {
+		NL_SET_ERR_MSG_MOD(f->common.extack,
+				   "action accept must be last");
+		return -EOPNOTSUPP;
+	}
+
+	if (act->police.peakrate_bytes_ps || act->police.avrate ||
+	    act->police.overhead || act->police.mtu) {
+		NL_SET_ERR_MSG_MOD(f->common.extack,
+				   "peakrate/avrate/overhead/mtu unsupported");
+		return -EOPNOTSUPP;
+	}
+
+	return 0;
+}
+
+static int airoha_dev_tc_matchall(struct net_device *dev,
+				  struct tc_cls_matchall_offload *f)
+{
+	enum trtcm_unit_type unit_type = TRTCM_BYTE_UNIT;
+	struct airoha_gdm_port *port = netdev_priv(dev);
+	u32 rate = 0, bucket_size = 0;
+
+	switch (f->command) {
+	case TC_CLSMATCHALL_REPLACE: {
+		const struct flow_action_entry *act;
+		int err;
+
+		err = airoha_tc_matchall_act_validate(f);
+		if (err)
+			return err;
+
+		act = &f->rule->action.entries[0];
+		if (act->police.rate_pkt_ps) {
+			rate = act->police.rate_pkt_ps;
+			bucket_size = act->police.burst_pkt;
+			unit_type = TRTCM_PACKET_UNIT;
+		} else {
+			rate = div_u64(act->police.rate_bytes_ps, 1000);
+			rate = rate << 3; /* Kbps */
+			bucket_size = act->police.burst;
+		}
+		fallthrough;
+	}
+	case TC_CLSMATCHALL_DESTROY:
+		return airoha_qdma_set_rx_meter(port, rate, bucket_size,
+						unit_type);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int airoha_dev_setup_tc_block_cb(enum tc_setup_type type,
+					void *type_data, void *cb_priv)
+{
+	struct net_device *dev = cb_priv;
+
+	if (!tc_can_offload(dev))
+		return -EOPNOTSUPP;
+
+	switch (type) {
+	case TC_SETUP_CLSFLOWER:
+		return airoha_ppe_setup_tc_block_cb(dev, type_data);
+	case TC_SETUP_CLSMATCHALL:
+		return airoha_dev_tc_matchall(dev, type_data);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
 static int airoha_dev_setup_tc_block(struct airoha_gdm_port *port,
 				     struct flow_block_offload *f)
 {
-	flow_setup_cb_t *cb = airoha_ppe_setup_tc_block_cb;
+	flow_setup_cb_t *cb = airoha_dev_setup_tc_block_cb;
 	static LIST_HEAD(block_cb_list);
 	struct flow_block_cb *block_cb;
 
diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index ec8908f904c61988c3dc973e187596c49af139fb..31ebb46be454c26ec789ed692a2f968c6c1ace03 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -127,6 +127,11 @@ enum tx_sched_mode {
 	TC_SCH_WRR2,
 };
 
+enum trtcm_unit_type {
+	TRTCM_BYTE_UNIT,
+	TRTCM_PACKET_UNIT,
+};
+
 enum trtcm_param_type {
 	TRTCM_MISC_MODE, /* meter_en, pps_mode, tick_sel */
 	TRTCM_TOKEN_RATE_MODE,
@@ -536,8 +541,7 @@ bool airoha_is_valid_gdm_port(struct airoha_eth *eth,
 			      struct airoha_gdm_port *port);
 
 void airoha_ppe_check_skb(struct airoha_ppe *ppe, u16 hash);
-int airoha_ppe_setup_tc_block_cb(enum tc_setup_type type, void *type_data,
-				 void *cb_priv);
+int airoha_ppe_setup_tc_block_cb(struct net_device *dev, void *type_data);
 int airoha_ppe_init(struct airoha_eth *eth);
 void airoha_ppe_deinit(struct airoha_eth *eth);
 struct airoha_foe_entry *airoha_ppe_foe_get_entry(struct airoha_ppe *ppe,
diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ethernet/airoha/airoha_ppe.c
index f10dab935cab6fad747fdfaa70b67903904c1703..3b14ad1c126ab11ee103de6448c3640244cf7f7f 100644
--- a/drivers/net/ethernet/airoha/airoha_ppe.c
+++ b/drivers/net/ethernet/airoha/airoha_ppe.c
@@ -822,18 +822,13 @@ static int airoha_ppe_offload_setup(struct airoha_eth *eth)
 	return err;
 }
 
-int airoha_ppe_setup_tc_block_cb(enum tc_setup_type type, void *type_data,
-				 void *cb_priv)
+int airoha_ppe_setup_tc_block_cb(struct net_device *dev, void *type_data)
 {
-	struct flow_cls_offload *cls = type_data;
-	struct net_device *dev = cb_priv;
 	struct airoha_gdm_port *port = netdev_priv(dev);
+	struct flow_cls_offload *cls = type_data;
 	struct airoha_eth *eth = port->qdma->eth;
 	int err = 0;
 
-	if (!tc_can_offload(dev) || type != TC_SETUP_CLSFLOWER)
-		return -EOPNOTSUPP;
-
 	mutex_lock(&flow_offload_mutex);
 
 	if (!eth->npu)
diff --git a/drivers/net/ethernet/airoha/airoha_regs.h b/drivers/net/ethernet/airoha/airoha_regs.h
index 8146cde4e8ba370e79b9b1bd87bb66a2caf7649a..29c8f046b9910c371ab4edc34b01f58d7383ae8d 100644
--- a/drivers/net/ethernet/airoha/airoha_regs.h
+++ b/drivers/net/ethernet/airoha/airoha_regs.h
@@ -283,6 +283,7 @@
 #define PPE_HASH_SEED				0x12345678
 
 #define REG_PPE_DFT_CPORT0(_n)			(((_n) ? PPE2_BASE : PPE1_BASE) + 0x248)
+#define DFT_CPORT_MASK(_n)			GENMASK(3 + ((_n) << 2), ((_n) << 2))
 
 #define REG_PPE_DFT_CPORT1(_n)			(((_n) ? PPE2_BASE : PPE1_BASE) + 0x24c)
 
@@ -691,6 +692,12 @@
 #define REG_TRTCM_DATA_LOW(_n)		((_n) + 0x8)
 #define REG_TRTCM_DATA_HIGH(_n)		((_n) + 0xc)
 
+#define RATE_LIMIT_PARAM_RW_MASK	BIT(31)
+#define RATE_LIMIT_PARAM_RW_DONE_MASK	BIT(30)
+#define RATE_LIMIT_PARAM_TYPE_MASK	GENMASK(29, 28)
+#define RATE_LIMIT_METER_GROUP_MASK	GENMASK(27, 26)
+#define RATE_LIMIT_PARAM_INDEX_MASK	GENMASK(23, 16)
+
 #define REG_TXWRR_MODE_CFG		0x1020
 #define TWRR_WEIGHT_SCALE_MASK		BIT(31)
 #define TWRR_WEIGHT_BASE_MASK		BIT(3)

---
base-commit: a9843689e2de1a3727d58b4225e4f8664937aefd
change-id: 20250319-airoha-hw-rx-ratelimit-1dd407e77925

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


