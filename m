Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32497E674AC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 07:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XWCccoYb7utv54mL8mqSrsWuZ7gIsI0Rm2fcJC7XuQU=; b=HNs8O69i2MOR/7miugCQ3x51w3
	RU3HrMqxQ29YQ073TlmON+S1swGew06f06g8APy99j3WKdlPQhfpW5BPTMbta6m+Rihc67N1u9gFU
	4W882hDnOF/GQ17PqVxz1ZFbUtQ7yaMIQAD6q5nqwuFJNu8IYYYe2a4/IxjWbHq2zOJNV+36H5u84
	67J5lnrZoFLx9AJVSSyhl+Y4B7rcUAx2wm57V5E8fnhUO/j13uriHd2Mh6F2lb4OdrcY18m9CdlRS
	NjNN0EQVN43gvRgy0BvHwGHG1nGEg9uR8IwRCmwjBiOpTgKqoVNSYX27qwg+lHayKI/YLn2bN5fU9
	w2355uNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6m5C-000000066nB-1NlJ;
	Fri, 01 Nov 2024 07:28:34 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6lnk-000000063n8-3bwc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 07:10:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1730445033; x=1761981033;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=QoxEepSpxIzxiW268nfycWfp/ZCANVoZdj/L2K/PPzM=;
  b=MCG+WcDYGJItOqcFJ4q8k2XIM1HbpEiNfftBSdaJQT3SqznnQ/q48lbx
   yO4YzLyoGHou8oaCssqa7lnMSSdYGMLqdm967OoAgkrbVhQBCsTHQDQe3
   GjdUA0qFJ3CW/OqMP1paXYWF3b/LJTLMuIFVchKbsb4M5DJhvhVlLhOgc
   dPv9pCYng/zg067QwOCIQNmQ7ijZm6dccgTKeUFwJ7sEagxwxpSNxkN1w
   7QFMZyEQ9UH+W5Jl9ExzMHY1W/ZCjltQ+7QZiIriy5eop/PJzMBktFDIG
   QVyyy2NQBSvmk+qHfByGdNgBlhcpyrpbK7hpB66a51DB/QANYcQym4Wub
   g==;
X-CSE-ConnectionGUID: j3YBXS8JS+qztkz9gl3BFg==
X-CSE-MsgGUID: AIVyQYU1TU63uRNfiH9Lrg==
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; 
   d="scan'208";a="264868831"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 01 Nov 2024 00:10:32 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 1 Nov 2024 00:10:08 -0700
Received: from DEN-DL-M70577.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Fri, 1 Nov 2024 00:10:05 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Fri, 1 Nov 2024 08:09:12 +0100
Subject: [PATCH net-next 6/6] net: lan969x: add VCAP configuration data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20241101-sparx5-lan969x-switch-driver-3-v1-6-3c76f22f4bfa@microchip.com>
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
X-CRM114-CacheID: sfid-20241101_001032_988594_98E9FFEB 
X-CRM114-Status: GOOD (  17.07  )
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

Add configuration data (for consumption by the VCAP API) for the four
VCAP's that we are going to support. The following VCAP's will be
supported:

 - VCAP CLM: (also known as IS0) is part of the analyzer and enables
   frame classification using VCAP functionality.

 - VCAP IS2: is part of ANA_ACL and enables access control lists, using
   VCAP functionality.

 - VCAP ES0: is part of the rewriter and enables rewriting of frames
   using VCAP functionality.

 - VCAP ES2: is part of EACL and enables egress access control lists
   using VCAP functionality

The two VCAP's: CLM and IS2 use shared resources from the SUPER VCAP.
The SUPER VCAP is a shared pool of 6 blocks that can be distributed
freely among CLM and IS2.  Each block in the pool has 3,072 addresses
with entries, actions, and counters. ES0 and ES2 does not use shared
resources.

In the configuration data for lan969x CLM uses blocks 2-4 with a total
of 6 lookups. IS2 uses blocks 0-1 with a total of 4 lookups.

Reviewed-by: Steen Hegelund <Steen.Hegelund@microchip.com>
Reviewed-by: Jens Emil Schulz Østergaard <jensemil.schulzostergaard@microchip.com>
Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 drivers/net/ethernet/microchip/lan969x/Makefile    |  2 +-
 drivers/net/ethernet/microchip/lan969x/lan969x.c   |  1 +
 drivers/net/ethernet/microchip/lan969x/lan969x.h   |  3 +
 .../ethernet/microchip/lan969x/lan969x_vcap_impl.c | 85 ++++++++++++++++++++++
 4 files changed, 90 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/microchip/lan969x/Makefile b/drivers/net/ethernet/microchip/lan969x/Makefile
index 3ea560e08a21..9a2351b4f111 100644
--- a/drivers/net/ethernet/microchip/lan969x/Makefile
+++ b/drivers/net/ethernet/microchip/lan969x/Makefile
@@ -6,7 +6,7 @@
 obj-$(CONFIG_LAN969X_SWITCH) += lan969x-switch.o
 
 lan969x-switch-y := lan969x_regs.o lan969x.o lan969x_calendar.o \
- lan969x_vcap_ag_api.o
+ lan969x_vcap_ag_api.o lan969x_vcap_impl.o
 
 # Provide include files
 ccflags-y += -I$(srctree)/drivers/net/ethernet/microchip/fdma
diff --git a/drivers/net/ethernet/microchip/lan969x/lan969x.c b/drivers/net/ethernet/microchip/lan969x/lan969x.c
index 0cb9ec1d2054..ac37d0f74ee3 100644
--- a/drivers/net/ethernet/microchip/lan969x/lan969x.c
+++ b/drivers/net/ethernet/microchip/lan969x/lan969x.c
@@ -321,6 +321,7 @@ static const struct sparx5_consts lan969x_consts = {
 	.tod_pin             = 4,
 	.vcaps               = lan969x_vcaps,
 	.vcap_stats          = &lan969x_vcap_stats,
+	.vcaps_cfg           = lan969x_vcap_inst_cfg,
 };
 
 static const struct sparx5_ops lan969x_ops = {
diff --git a/drivers/net/ethernet/microchip/lan969x/lan969x.h b/drivers/net/ethernet/microchip/lan969x/lan969x.h
index 167281d99c50..2489d0d32dfd 100644
--- a/drivers/net/ethernet/microchip/lan969x/lan969x.h
+++ b/drivers/net/ethernet/microchip/lan969x/lan969x.h
@@ -18,6 +18,9 @@ extern const struct sparx5_match_data lan969x_desc;
 extern const struct vcap_statistics lan969x_vcap_stats;
 extern const struct vcap_info lan969x_vcaps[];
 
+/* lan969x_vcap_impl.c */
+extern const struct sparx5_vcap_inst lan969x_vcap_inst_cfg[];
+
 /* lan969x_regs.c */
 extern const unsigned int lan969x_tsize[TSIZE_LAST];
 extern const unsigned int lan969x_raddr[RADDR_LAST];
diff --git a/drivers/net/ethernet/microchip/lan969x/lan969x_vcap_impl.c b/drivers/net/ethernet/microchip/lan969x/lan969x_vcap_impl.c
new file mode 100644
index 000000000000..543a1f2bf6bd
--- /dev/null
+++ b/drivers/net/ethernet/microchip/lan969x/lan969x_vcap_impl.c
@@ -0,0 +1,85 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+#include "vcap_api.h"
+#include "lan969x.h"
+
+const struct sparx5_vcap_inst lan969x_vcap_inst_cfg[] = {
+	{
+		.vtype = VCAP_TYPE_IS0, /* CLM-0 */
+		.vinst = 0,
+		.map_id = 1,
+		.lookups = SPARX5_IS0_LOOKUPS,
+		.lookups_per_instance = SPARX5_IS0_LOOKUPS / 3,
+		.first_cid = SPARX5_VCAP_CID_IS0_L0,
+		.last_cid = SPARX5_VCAP_CID_IS0_L2 - 1,
+		.blockno = 2,
+		.blocks = 1,
+		.ingress = true,
+	},
+	{
+		.vtype = VCAP_TYPE_IS0, /* CLM-1 */
+		.vinst = 1,
+		.map_id = 2,
+		.lookups = SPARX5_IS0_LOOKUPS,
+		.lookups_per_instance = SPARX5_IS0_LOOKUPS / 3,
+		.first_cid = SPARX5_VCAP_CID_IS0_L2,
+		.last_cid = SPARX5_VCAP_CID_IS0_L4 - 1,
+		.blockno = 3,
+		.blocks = 1,
+		.ingress = true,
+	},
+	{
+		.vtype = VCAP_TYPE_IS0, /* CLM-2 */
+		.vinst = 2,
+		.map_id = 3,
+		.lookups = SPARX5_IS0_LOOKUPS,
+		.lookups_per_instance = SPARX5_IS0_LOOKUPS / 3,
+		.first_cid = SPARX5_VCAP_CID_IS0_L4,
+		.last_cid = SPARX5_VCAP_CID_IS0_MAX,
+		.blockno = 4,
+		.blocks = 1,
+		.ingress = true,
+	},
+	{
+		.vtype = VCAP_TYPE_IS2, /* IS2-0 */
+		.vinst = 0,
+		.map_id = 4,
+		.lookups = SPARX5_IS2_LOOKUPS,
+		.lookups_per_instance = SPARX5_IS2_LOOKUPS / 2,
+		.first_cid = SPARX5_VCAP_CID_IS2_L0,
+		.last_cid = SPARX5_VCAP_CID_IS2_L2 - 1,
+		.blockno = 0,
+		.blocks = 1,
+		.ingress = true,
+	},
+	{
+		.vtype = VCAP_TYPE_IS2, /* IS2-1 */
+		.vinst = 1,
+		.map_id = 5,
+		.lookups = SPARX5_IS2_LOOKUPS,
+		.lookups_per_instance = SPARX5_IS2_LOOKUPS / 2,
+		.first_cid = SPARX5_VCAP_CID_IS2_L2,
+		.last_cid = SPARX5_VCAP_CID_IS2_MAX,
+		.blockno = 1,
+		.blocks = 1,
+		.ingress = true,
+	},
+	{
+		.vtype = VCAP_TYPE_ES0,
+		.lookups = SPARX5_ES0_LOOKUPS,
+		.lookups_per_instance = SPARX5_ES0_LOOKUPS,
+		.first_cid = SPARX5_VCAP_CID_ES0_L0,
+		.last_cid = SPARX5_VCAP_CID_ES0_MAX,
+		.count = 1536,
+		.ingress = false,
+	},
+	{
+		.vtype = VCAP_TYPE_ES2,
+		.lookups = SPARX5_ES2_LOOKUPS,
+		.lookups_per_instance = SPARX5_ES2_LOOKUPS,
+		.first_cid = SPARX5_VCAP_CID_ES2_L0,
+		.last_cid = SPARX5_VCAP_CID_ES2_MAX,
+		.count = 1024,
+		.ingress = false,
+	},
+};

-- 
2.34.1


