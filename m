Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BAF3CD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 12:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZEp7m1yd5lJNM2S3Bcf6gSZyrENr4nfynLs1KpFTFww=; b=zXVPzaQpqZnai0gt9fn8us32to
	A8TF/xMKun40ghvxAXxgqHK17U9x2oeGEAplK1xa3U8G3cB6/ny8NiIzRvG2zEhfLzyB8Aa1+dqKr
	ugAIFWSwwBLGo1kizBBFpjPtwytJmymzPIAnJ6uPgfSCA7B44QWWs28vchVs0pyxLkBRXTeSVIfNN
	BATuWLd6xP84efvX+bsvpm4+10o15GcvWuc5UgxUdF105LmSyHx8loRvMVTkTs/iU3L8vFmisxL/K
	qEkRQTbWgOmf0Bk1yQ+mqwBNwyynkqAYujQSsUIXbj3p0Vqi1tEmdMBI9JBnA+H1oBSC3jX3rC10V
	m3shykzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY19x-0000000AsZO-3dzB;
	Fri, 12 Jun 2026 12:38:53 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY19s-0000000AsQg-136F
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 12:38:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1781267928; x=1812803928;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=4b6cks/CDELaa0LmQZjfqkmWAr9MTiZ9LYIdy6MhNMc=;
  b=HeOZkO8GV9LgFcvDQgn7yNMrZa77OVnIT7xwrZhjbhiurgDoSbtlKRSD
   lpwx+5NAASlJyx2MsDGRBmW5RJo6UhJvblXbZhg1AdkJGLdrRwFISDW+s
   xBKmqFZVmkpgwkrDVfmTh3c+3xbm5Ydi3dOXR/LnZoBjdihrkOfCo8W+b
   yxc2gKIj6xVnfXGN1SJ3BXGPMWLNpyXuWPuX1EqK/BlpMBydjvHi9I0he
   sb70SOf3puFAtQCoynrTQ+jWvFaSxkTSIRbJHPWIDeuSjEsOEU2SYJ1ha
   0ayZ+B9x3sAHfA6yzdO2bUmVOojuQ0cyTSGC+SBVNrs4FAynhOg4UVhAl
   w==;
X-CSE-ConnectionGUID: SpMwF82rSPmQXISODnxGVQ==
X-CSE-MsgGUID: sA6//y8gQ1a1wUwe0XCASA==
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="59410184"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 12 Jun 2026 05:38:47 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 12 Jun 2026 05:38:47 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Fri, 12 Jun 2026 05:38:44 -0700
From: =?utf-8?q?Jens_Emil_Schulz_=C3=98stergaard?=
	<jensemil.schulzostergaard@microchip.com>
Date: Fri, 12 Jun 2026 14:37:13 +0200
Subject: [PATCH net-next 4/9] net: microchip: vcap: expose helpers in vcap
 api and update debugfs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20260612-sparx5_l3_routing-v1-4-fc3c10160f49@microchip.com>
References: <20260612-sparx5_l3_routing-v1-0-fc3c10160f49@microchip.com>
In-Reply-To: <20260612-sparx5_l3_routing-v1-0-fc3c10160f49@microchip.com>
To: Horatiu Vultur <horatiu.vultur@microchip.com>,
	<UNGLinuxDriver@microchip.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Daniel Machon
	<daniel.machon@microchip.com>, Steen Hegelund <Steen.Hegelund@microchip.com>,
	Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>
CC: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-hardening@vger.kernel.org>,
	=?utf-8?q?Jens_Emil_Schulz_=C3=98stergaard?=
	<jensemil.schulzostergaard@microchip.com>
X-Mailer: b4 0.15-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_053848_368480_CD5CF847 
X-CRM114-Status: GOOD (  17.29  )
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

Add new helpers to the vcap client api, in preparation for L3 routing
functionality:

 - vcap_val_add_rule(): wraps vcap_val_rule() + vcap_add_rule().
 - vcap_rule_mod_action_bit(): modify a bit-typed action on an existing
   rule.

Rename VCAP_CID_PREROUTING to VCAP_CID_PREROUTING_L0 and add
VCAP_USER_L3, both needed by the upcoming LPM VCAP user.

Extend the debugfs display to handle the new IP4_XIP and IP6_XIP key
fields.

Fix a latent undefined-behaviour bug in the debugfs action-field
printer. The old mask expression (1 << width) - 1 is UB when width is
32. The bug is unreachable before this series, since no existing field
in any client hits this, but the LPM VCAP introduces VCAP_AF_MAC_LSB
which is 32 bit wide.

Reviewed-by: Daniel Machon <daniel.machon@microchip.com>
Reviewed-by: Steen Hegelund <Steen.Hegelund@microchip.com>
Signed-off-by: Jens Emil Schulz Østergaard <jensemil.schulzostergaard@microchip.com>
---
 drivers/net/ethernet/microchip/vcap/vcap_api.c     | 25 ++++++++++++++++++++++
 drivers/net/ethernet/microchip/vcap/vcap_api.h     |  4 +++-
 .../net/ethernet/microchip/vcap/vcap_api_client.h  |  6 ++++++
 .../net/ethernet/microchip/vcap/vcap_api_debugfs.c | 13 ++++++++---
 4 files changed, 44 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/microchip/vcap/vcap_api.c b/drivers/net/ethernet/microchip/vcap/vcap_api.c
index 30700648672f..0905e4f192a0 100644
--- a/drivers/net/ethernet/microchip/vcap/vcap_api.c
+++ b/drivers/net/ethernet/microchip/vcap/vcap_api.c
@@ -2379,6 +2379,19 @@ int vcap_add_rule(struct vcap_rule *rule)
 }
 EXPORT_SYMBOL_GPL(vcap_add_rule);
 
+/* Validate and add rule to a VCAP instance */
+int vcap_val_add_rule(struct vcap_rule *rule, u16 l3_proto)
+{
+	int err;
+
+	err = vcap_val_rule(rule, l3_proto);
+	if (err)
+		return err;
+
+	return vcap_add_rule(rule);
+}
+EXPORT_SYMBOL_GPL(vcap_val_add_rule);
+
 /* Allocate a new rule with the provided arguments */
 struct vcap_rule *vcap_alloc_rule(struct vcap_control *vctrl,
 				  struct net_device *ndev, int vcap_chain_id,
@@ -3547,6 +3560,18 @@ int vcap_rule_mod_action_u32(struct vcap_rule *rule,
 }
 EXPORT_SYMBOL_GPL(vcap_rule_mod_action_u32);
 
+/* Modify a bit action with value in the rule */
+int vcap_rule_mod_action_bit(struct vcap_rule *rule,
+			     enum vcap_action_field action,
+			     enum vcap_bit val)
+{
+	struct vcap_client_actionfield_data data;
+
+	vcap_rule_set_action_bitsize(&data.u1, val);
+	return vcap_rule_mod_action(rule, action, VCAP_FIELD_BIT, &data);
+}
+EXPORT_SYMBOL_GPL(vcap_rule_mod_action_bit);
+
 /* Drop keys in a keylist and any keys that are not supported by the keyset */
 int vcap_filter_rule_keys(struct vcap_rule *rule,
 			  enum vcap_key_field keylist[], int length,
diff --git a/drivers/net/ethernet/microchip/vcap/vcap_api.h b/drivers/net/ethernet/microchip/vcap/vcap_api.h
index 6069ad95c27e..e197e7257560 100644
--- a/drivers/net/ethernet/microchip/vcap/vcap_api.h
+++ b/drivers/net/ethernet/microchip/vcap/vcap_api.h
@@ -22,7 +22,7 @@
 #define VCAP_CID_INGRESS_L5          1500000 /* Ingress Stage 1 Lookup 5 */
 
 #define VCAP_CID_PREROUTING_IPV6     3000000 /* Prerouting Stage */
-#define VCAP_CID_PREROUTING          6000000 /* Prerouting Stage */
+#define VCAP_CID_PREROUTING_L0       6000000 /* Prerouting Stage Lookup 0 */
 
 #define VCAP_CID_INGRESS_STAGE2_L0   8000000 /* Ingress Stage 2 Lookup 0 */
 #define VCAP_CID_INGRESS_STAGE2_L1   8100000 /* Ingress Stage 2 Lookup 1 */
@@ -41,7 +41,9 @@ enum vcap_user {
 	VCAP_USER_MRP,
 	VCAP_USER_CFM,
 	VCAP_USER_VLAN,
+	VCAP_USER_L3,
 	VCAP_USER_QOS,
+	/* permanent enabled users above here */
 	VCAP_USER_VCAP_UTIL,
 	VCAP_USER_TC,
 	VCAP_USER_TC_EXTRA,
diff --git a/drivers/net/ethernet/microchip/vcap/vcap_api_client.h b/drivers/net/ethernet/microchip/vcap/vcap_api_client.h
index cdf79e17ca54..3f17e1e76b7d 100644
--- a/drivers/net/ethernet/microchip/vcap/vcap_api_client.h
+++ b/drivers/net/ethernet/microchip/vcap/vcap_api_client.h
@@ -167,6 +167,8 @@ void vcap_free_rule(struct vcap_rule *rule);
 int vcap_val_rule(struct vcap_rule *rule, u16 l3_proto);
 /* Add rule to a VCAP instance */
 int vcap_add_rule(struct vcap_rule *rule);
+/* Validate and add rule to a VCAP instance */
+int vcap_val_add_rule(struct vcap_rule *rule, u16 l3_proto);
 /* Delete rule in a VCAP instance */
 int vcap_del_rule(struct vcap_control *vctrl, struct net_device *ndev, u32 id);
 /* Make a full copy of an existing rule with a new rule id */
@@ -266,6 +268,10 @@ int vcap_rule_mod_key_u32(struct vcap_rule *rule, enum vcap_key_field key,
 int vcap_rule_mod_action_u32(struct vcap_rule *rule,
 			     enum vcap_action_field action,
 			     u32 value);
+/* Modify a bit action with value in the rule */
+int vcap_rule_mod_action_bit(struct vcap_rule *rule,
+			     enum vcap_action_field action,
+			     enum vcap_bit val);
 
 /* Get a 32 bit key field value and mask from the rule */
 int vcap_rule_get_key_u32(struct vcap_rule *rule, enum vcap_key_field key,
diff --git a/drivers/net/ethernet/microchip/vcap/vcap_api_debugfs.c b/drivers/net/ethernet/microchip/vcap/vcap_api_debugfs.c
index 59bfbda29bb3..56464ece8e6b 100644
--- a/drivers/net/ethernet/microchip/vcap/vcap_api_debugfs.c
+++ b/drivers/net/ethernet/microchip/vcap/vcap_api_debugfs.c
@@ -40,7 +40,8 @@ static void vcap_debugfs_show_rule_keyfield(struct vcap_control *vctrl,
 		value = (u8 *)(&data->u32.value);
 		mask = (u8 *)(&data->u32.mask);
 
-		if (key == VCAP_KF_L3_IP4_SIP || key == VCAP_KF_L3_IP4_DIP) {
+		if (key == VCAP_KF_L3_IP4_SIP || key == VCAP_KF_L3_IP4_DIP ||
+		    key == VCAP_KF_IP4_XIP) {
 			out->prf(out->dst, "%pI4h/%pI4h", &data->u32.value,
 				 &data->u32.mask);
 		} else if (key == VCAP_KF_ETYPE ||
@@ -88,7 +89,8 @@ static void vcap_debugfs_show_rule_keyfield(struct vcap_control *vctrl,
 	case VCAP_FIELD_U128:
 		value = data->u128.value;
 		mask = data->u128.mask;
-		if (key == VCAP_KF_L3_IP6_SIP || key == VCAP_KF_L3_IP6_DIP) {
+		if (key == VCAP_KF_L3_IP6_SIP || key == VCAP_KF_L3_IP6_DIP ||
+		    key == VCAP_KF_IP6_XIP) {
 			u8 nvalue[16], nmask[16];
 
 			vcap_netbytes_copy(nvalue, data->u128.value,
@@ -133,7 +135,12 @@ vcap_debugfs_show_rule_actionfield(struct vcap_control *vctrl,
 		out->prf(out->dst, "%d", value[0]);
 		break;
 	case VCAP_FIELD_U32:
-		fmsk = (1 << actionfield[action].width) - 1;
+		if (action == VCAP_AF_MAC_LSB || action == VCAP_AF_MAC_MSB) {
+			hex = true;
+			break;
+		}
+		fmsk = actionfield[action].width ?
+		       GENMASK(actionfield[action].width - 1, 0) : 0;
 		val = *(u32 *)value;
 		out->prf(out->dst, "%u", val & fmsk);
 		break;

-- 
2.52.0


