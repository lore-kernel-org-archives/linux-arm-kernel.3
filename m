Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB6C7E674AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 07:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Aznmoxjs1A/X/M1eMj2ezm4UQazPbpPcX+QlRIbifw=; b=YOCiLib4qEMW02+j+0T28O1MxN
	Sh+WjwpbkXqBLD8g8yG9PKutwfI8w0w/UIh06u1Qk+XHdlI6RcuZAzGVqnMALX5HMmQCPXyj22WPs
	Q1Tn+VR0bD7BO+kVmNCfKPwf0z+JVgR5oCq9u49hph0WT0p0sGyr/5JhfjwEMxYzDlrmyrWIpVUoB
	E755Mx2qkpqdMfKAuHjWK/cV45C/ruaUzLGpm+Svm2nqzhVbH7F9R5Jil61HeLfCqt88gEEzCDGkj
	DCuoFML7brk02hGegygvawJrjYo8OQqrTv1TAKzWtQiUaqx9/Rr1DWPZJ7KLmw21SnLYf0BcjI7qi
	MqeEMQTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6m5A-000000066mj-1rjp;
	Fri, 01 Nov 2024 07:28:32 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6lnN-000000063ei-0Blg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 07:10:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1730445008; x=1761981008;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=PoUpoiqh15WbBGv3obiAOp0I0e8/k6KBOM9i6jG/LjA=;
  b=sQf4WUxUDPkp17CtJqu/nkP83vG1FV+RXDgY5ltvvXmvo5C+i0KsFYw8
   VRMNvSyuI70Cz6vYhj8cm12XNpFRbVegqzzS4m6lKHZkwG6l9MlshlWu+
   yfjLHqf/sQtYibXLJSJS5J3Cgn92AwC1JbGKkpLK0LsfPRYjWaemalp+T
   4hYXDJ51TGkvmaclzkEGxftmwyPhY565xybQgSMuQV1tEBP3/Id01nRBy
   YaA4/X0an1+wKSFGBstQXriAw8ZAH/CiDeBHNcuJGoBn7F2wpCerzMV2x
   NPakdGZTjaaS80XNqKJUs6MNTT4kdg5PwAO8+nbiu7dLtxfS+c0Ley/gp
   A==;
X-CSE-ConnectionGUID: NPrwf/hMSSa00KPy6thoyw==
X-CSE-MsgGUID: r7VsTCbOQcaA3FloD0sZgQ==
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; 
   d="scan'208";a="201180320"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 01 Nov 2024 00:10:04 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 1 Nov 2024 00:09:54 -0700
Received: from DEN-DL-M70577.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Fri, 1 Nov 2024 00:09:52 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Fri, 1 Nov 2024 08:09:07 +0100
Subject: [PATCH net-next 1/6] net: sparx5: expose some sparx5 VCAP symbols
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20241101-sparx5-lan969x-switch-driver-3-v1-1-3c76f22f4bfa@microchip.com>
References: <20241101-sparx5-lan969x-switch-driver-3-v1-0-3c76f22f4bfa@microchip.com>
In-Reply-To: <20241101-sparx5-lan969x-switch-driver-3-v1-0-3c76f22f4bfa@microchip.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Lars Povlsen
	<lars.povlsen@microchip.com>, Steen Hegelund <Steen.Hegelund@microchip.com>,
	=?utf-8?q?Jens_Emil_Schulz_=C3=98stergaard?=
	<jensemil.schulzostergaard@microchip.com>, <UNGLinuxDriver@microchip.com>,
	<jacob.e.keller@intel.com>, <christophe.jaillet@wanadoo.fr>
CC: <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
X-Mailer: b4 0.14-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_001009_247819_3F7FC8B8 
X-CRM114-Status: GOOD (  15.85  )
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

In preparation for lan969x VCAP support, expose the following symbols for
use by the lan969x VCAP implementation:

- The symbols SPARX5_*_LOOKUPS defines the number of lookups in each
  VCAP instance.  These are the same for lan969x. Move them to the
  header file.

- The struct sparx5_vcap_inst encapsulates information about a single
  VCAP instance. Move this struct to the header file and declare the
  sparx5_vcap_inst_cfg as extern.

Reviewed-by: Steen Hegelund <Steen.Hegelund@microchip.com>
Reviewed-by: Jens Emil Schulz Østergaard <jensemil.schulzostergaard@microchip.com>
Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 .../ethernet/microchip/sparx5/sparx5_vcap_impl.c    | 18 +-----------------
 .../ethernet/microchip/sparx5/sparx5_vcap_impl.h    | 21 +++++++++++++++++++++
 2 files changed, 22 insertions(+), 17 deletions(-)

diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_vcap_impl.c b/drivers/net/ethernet/microchip/sparx5/sparx5_vcap_impl.c
index 967c8621c250..0bdf7a378892 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_vcap_impl.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_vcap_impl.c
@@ -17,7 +17,6 @@
 #define SUPER_VCAP_BLK_SIZE 3072 /* addresses per Super VCAP block */
 #define STREAMSIZE (64 * 4)  /* bytes in the VCAP cache area */
 
-#define SPARX5_IS2_LOOKUPS 4
 #define VCAP_IS2_KEYSEL(_ena, _noneth, _v4_mc, _v4_uc, _v6_mc, _v6_uc, _arp) \
 	(ANA_ACL_VCAP_S2_KEY_SEL_KEY_SEL_ENA_SET(_ena) | \
 	 ANA_ACL_VCAP_S2_KEY_SEL_NON_ETH_KEY_SEL_SET(_noneth) | \
@@ -27,7 +26,6 @@
 	 ANA_ACL_VCAP_S2_KEY_SEL_IP6_UC_KEY_SEL_SET(_v6_uc) | \
 	 ANA_ACL_VCAP_S2_KEY_SEL_ARP_KEY_SEL_SET(_arp))
 
-#define SPARX5_IS0_LOOKUPS 6
 #define VCAP_IS0_KEYSEL(_ena, _etype, _ipv4, _ipv6, _mpls_uc, _mpls_mc, _mlbs) \
 	(ANA_CL_ADV_CL_CFG_LOOKUP_ENA_SET(_ena) | \
 	ANA_CL_ADV_CL_CFG_ETYPE_CLM_KEY_SEL_SET(_etype) | \
@@ -37,31 +35,17 @@
 	ANA_CL_ADV_CL_CFG_MPLS_MC_CLM_KEY_SEL_SET(_mpls_mc) | \
 	ANA_CL_ADV_CL_CFG_MLBS_CLM_KEY_SEL_SET(_mlbs))
 
-#define SPARX5_ES0_LOOKUPS 1
 #define VCAP_ES0_KEYSEL(_key) (REW_RTAG_ETAG_CTRL_ES0_ISDX_KEY_ENA_SET(_key))
 #define SPARX5_STAT_ESDX_GRN_PKTS  0x300
 #define SPARX5_STAT_ESDX_YEL_PKTS  0x301
 
-#define SPARX5_ES2_LOOKUPS 2
 #define VCAP_ES2_KEYSEL(_ena, _arp, _ipv4, _ipv6) \
 	(EACL_VCAP_ES2_KEY_SEL_KEY_ENA_SET(_ena) | \
 	EACL_VCAP_ES2_KEY_SEL_ARP_KEY_SEL_SET(_arp) | \
 	EACL_VCAP_ES2_KEY_SEL_IP4_KEY_SEL_SET(_ipv4) | \
 	EACL_VCAP_ES2_KEY_SEL_IP6_KEY_SEL_SET(_ipv6))
 
-static struct sparx5_vcap_inst {
-	enum vcap_type vtype; /* type of vcap */
-	int vinst; /* instance number within the same type */
-	int lookups; /* number of lookups in this vcap type */
-	int lookups_per_instance; /* number of lookups in this instance */
-	int first_cid; /* first chain id in this vcap */
-	int last_cid; /* last chain id in this vcap */
-	int count; /* number of available addresses, not in super vcap */
-	int map_id; /* id in the super vcap block mapping (if applicable) */
-	int blockno; /* starting block in super vcap (if applicable) */
-	int blocks; /* number of blocks in super vcap (if applicable) */
-	bool ingress; /* is vcap in the ingress path */
-} sparx5_vcap_inst_cfg[] = {
+const struct sparx5_vcap_inst sparx5_vcap_inst_cfg[] = {
 	{
 		.vtype = VCAP_TYPE_IS0, /* CLM-0 */
 		.vinst = 0,
diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_vcap_impl.h b/drivers/net/ethernet/microchip/sparx5/sparx5_vcap_impl.h
index 2684d9199b05..d0a42406bf26 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_vcap_impl.h
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_vcap_impl.h
@@ -16,6 +16,11 @@
 #include "vcap_api.h"
 #include "vcap_api_client.h"
 
+#define SPARX5_IS2_LOOKUPS 4
+#define SPARX5_IS0_LOOKUPS 6
+#define SPARX5_ES0_LOOKUPS 1
+#define SPARX5_ES2_LOOKUPS 2
+
 #define SPARX5_VCAP_CID_IS0_L0 VCAP_CID_INGRESS_L0 /* IS0/CLM lookup 0 */
 #define SPARX5_VCAP_CID_IS0_L1 VCAP_CID_INGRESS_L1 /* IS0/CLM lookup 1 */
 #define SPARX5_VCAP_CID_IS0_L2 VCAP_CID_INGRESS_L2 /* IS0/CLM lookup 2 */
@@ -40,6 +45,22 @@
 #define SPARX5_VCAP_CID_ES2_MAX \
 	(VCAP_CID_EGRESS_STAGE2_L1 + VCAP_CID_LOOKUP_SIZE - 1) /* ES2 Max */
 
+struct sparx5_vcap_inst {
+	enum vcap_type vtype; /* type of vcap */
+	int vinst; /* instance number within the same type */
+	int lookups; /* number of lookups in this vcap type */
+	int lookups_per_instance; /* number of lookups in this instance */
+	int first_cid; /* first chain id in this vcap */
+	int last_cid; /* last chain id in this vcap */
+	int count; /* number of available addresses, not in super vcap */
+	int map_id; /* id in the super vcap block mapping (if applicable) */
+	int blockno; /* starting block in super vcap (if applicable) */
+	int blocks; /* number of blocks in super vcap (if applicable) */
+	bool ingress; /* is vcap in the ingress path */
+};
+
+extern const struct sparx5_vcap_inst sparx5_vcap_inst_cfg[];
+
 /* IS0 port keyset selection control */
 
 /* IS0 ethernet, IPv4, IPv6 traffic type keyset generation */

-- 
2.34.1


