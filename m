Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AEEECA6019
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 11:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Pp9kvjrqNsiEOjGVAzr60GlJORpeZvNF8HGAEL7Ujo=; b=xNNw9OtowVEBWrKtcH4tIe/aQw
	ZSIPXHpVYh8+SsHJvXTpUtsVetj7AGfHeKqG/+ZIU0LxrMYAGs6nSJkoUHrY4awIzfWq3qwwkW7GG
	IlhSOhRf+daJcdgois+Hm2hk5tWJnu/g1PWrFKaR9T6UFuo54s3L9LW90Vzaq5KZR8tlpiFttO6xg
	nhLtre26zEka4o8s0OIiHqJ4/q5xSFpafjNNzC+lz29mH8XjV4A8KradfWU0jv1OL0el2toJpkI6m
	5qmil2ZnXo3uMPOZqCcfLccVIhYjGL7VKRigKmLpJS6+lckAMcrEc4quon6Gip4eEocM99YqCKIUn
	qszK7GJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF9B0-00000006F4G-3z7Q;
	Fri, 09 Oct 2026 11:54:14 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF9Ax-00000006ExV-2dDl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 11:54:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1791546851; x=1823082851;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=hyKNij5GCovecZ025KXgJewZWnNsVvo4nF2Ue6FaKDg=;
  b=Sth6pD/ynpZT/pHHFedu/uYcPaMwIRQ//HLH8wQdvrlXfgs+ERjF36Ca
   Zp0gXI0Aw8at+zqSfRlZPxvvGnhaknAM/El0uyuRB2XWSvRqfYHCytVyB
   T5azLSaZGtrZ6B/s8ObDCk0LX0IP4jIvr0cpcpXlMoJeP3BK71wSxUJq0
   rIYnNFtdl0nlhM+/D7dhL24XyLbHkcplc5Q4ucortgzW4c5g7vgbcBPC9
   apjciR/CSwkxJrii0r7iKYoIFcB2jnEZh8JL/GZ7927f3/RcKHZ3Cjxmk
   H8AwVpdQ/wqZ6knf8hCezsdeI4nyjVfrnVKDgMVG8Fjvi0gAhTAUA0S90
   A==;
X-CSE-ConnectionGUID: asbsX0P+QF+sfkwM9CrAKg==
X-CSE-MsgGUID: xIX9leUTRE6gyZv9hyAkVg==
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="296224250"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 04:54:11 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.49; Fri, 9 Oct 2026 04:54:10 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Fri, 9 Oct 2026 04:54:08 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Fri, 9 Oct 2026 13:52:05 +0200
Subject: [PATCH net-next 5/5] net: sparx5: Offload tc port policers via
 matchall
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261009-b4-lan966x-pci-fdma-sparx5-lan969x-port-policers-v1-5-4916708a7ea2@microchip.com>
References: <20261009-b4-lan966x-pci-fdma-sparx5-lan969x-port-policers-v1-0-4916708a7ea2@microchip.com>
In-Reply-To: <20261009-b4-lan966x-pci-fdma-sparx5-lan969x-port-policers-v1-0-4916708a7ea2@microchip.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Steen Hegelund
	<Steen.Hegelund@microchip.com>, <UNGLinuxDriver@microchip.com>
CC: <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Daniel Machon <daniel.machon@microchip.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_045411_683977_C01D5E15 
X-CRM114-Status: GOOD (  13.61  )
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

Offload a tc matchall filter with a police action to the port policer:

  tc qdisc add dev <eth> clsact
  tc filter add dev <eth> ingress matchall skip_sw \
      action police rate <bps> burst <bytes> conform-exceed drop

The port policer meters all ingress frames on the port, so offload the
filter only on ingress, on chain 0, with protocol all, and on a block
that is not shared. Only drop is supported as the exceed action, and
only one policer per port. Report the pass and drop counts through the
matchall stats.

Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 .../ethernet/microchip/sparx5/sparx5_tc_matchall.c | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_tc_matchall.c b/drivers/net/ethernet/microchip/sparx5/sparx5_tc_matchall.c
index 146d7f28e8f3..5bf17c52e564 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_tc_matchall.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_tc_matchall.c
@@ -43,6 +43,13 @@ sparx5_tc_matchall_parse_mirror_action(struct sparx5_mall_entry *entry,
 	entry->mirror.port = netdev_priv(action->dev);
 }
 
+static void
+sparx5_tc_matchall_parse_port_policer_action(struct sparx5_mall_entry *entry,
+					     struct flow_action_entry *action)
+{
+	entry->port_policer.police = action->police;
+}
+
 static int sparx5_tc_matchall_replace(struct net_device *ndev,
 				      struct tc_cls_matchall_offload *tmo,
 				      bool ingress)
@@ -98,6 +105,30 @@ static int sparx5_tc_matchall_replace(struct net_device *ndev,
 		}
 		/* Get baseline stats for this port */
 		sparx5_mirror_stats(mall_entry, &tmo->stats);
+		break;
+	case FLOW_ACTION_POLICE:
+		if (tmo->common.protocol != htons(ETH_P_ALL)) {
+			NL_SET_ERR_MSG_MOD(tmo->common.extack,
+					   "Policer is only supported with protocol all");
+			kfree(mall_entry);
+			return -EOPNOTSUPP;
+		}
+
+		if (tmo->common.chain_index) {
+			NL_SET_ERR_MSG_MOD(tmo->common.extack,
+					   "Policer is only supported on chain 0");
+			kfree(mall_entry);
+			return -EOPNOTSUPP;
+		}
+
+		sparx5_tc_matchall_parse_port_policer_action(mall_entry,
+							     action);
+		err = sparx5_add_port_policer(mall_entry, tmo->common.extack);
+		if (err) {
+			kfree(mall_entry);
+			return err;
+		}
+
 		break;
 	case FLOW_ACTION_GOTO:
 		err = vcap_enable_lookups(sparx5->vcap_ctrl, ndev,
@@ -151,6 +182,11 @@ static int sparx5_tc_matchall_destroy(struct net_device *ndev,
 
 	if (entry->type == FLOW_ACTION_MIRRED) {
 		sparx5_mirror_del(entry);
+	} else if (entry->type == FLOW_ACTION_POLICE) {
+		err = sparx5_delete_port_policer(entry);
+		if (err)
+			NL_SET_ERR_MSG_MOD(tmo->common.extack,
+					   "Could not delete port policer");
 	} else if (entry->type == FLOW_ACTION_GOTO) {
 		err = vcap_enable_lookups(sparx5->vcap_ctrl, ndev,
 					  0, 0, tmo->cookie, false);
@@ -180,6 +216,8 @@ static int sparx5_tc_matchall_stats(struct net_device *ndev,
 
 	if (entry->type == FLOW_ACTION_MIRRED) {
 		sparx5_mirror_stats(entry, &tmo->stats);
+	} else if (entry->type == FLOW_ACTION_POLICE) {
+		sparx5_update_port_policer_stats(ndev, tmo);
 	} else {
 		NL_SET_ERR_MSG_MOD(tmo->common.extack, "Unsupported action");
 		return -EOPNOTSUPP;

-- 
2.34.1


