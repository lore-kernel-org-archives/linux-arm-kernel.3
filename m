Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 411E7CD3430
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 14:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3gROlKntTUrPoT0AGvSprRcJ0UEtCVOIr8Yb9xfb+Fw=; b=Z4njsFtZ8Xn6pdrXrGDuiAyO+u
	i5UbI6Z322t7gOffdSYRchogdNLqVrk+UYehMDDTQdlhnKisbe12NPZXTkp3sqfQnbb+dubLfsWTN
	YQVD6K1+vjdXSsEKINOirNuLsyjnbGKmxQYu5dsl3FGOSZSBaEZ+/KRdVY8aFn3NiYDewxcy2RNAA
	oucsIVyrvzCny+Uzbrj7YwP7N5UVDh8n3QiqrtCeiBrYZQz+a0tjt4T6/efsql6cVw+/k+kJgRSsb
	aVpjbtN8th5mb3DrIaMEgTbsEG0UVWb1L4K0xI1zydZoBRqR5SXLDQiVGOH5WBUv8y9TUNjkxSamp
	X0MpA6sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJuWi-0000000DUOB-2JuS;
	Mon, 04 May 2026 14:44:04 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJuWg-0000000DUN7-3Ac6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 14:44:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1777905842; x=1809441842;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=7kododvTQ68yKTSDo3YpbRkIFBnTYQ7gfRla+bTGEck=;
  b=SS9+gYGctxMGki4ihPmqubub3bFfXM7UsE2kfOowV0lYqqsokm7O/kcG
   W5i3GQ4sNafao6qbbCdMNGxQ1xjqFmUQxg1OXGZRc3Xgt951XPJADdN/H
   qWGcVRqaj0eHvcWfvgx3J+d30rctupYT1+MJ4PcsBcfnvAzESY+Nm3h74
   aGm63pTa4iozphC46WYu948Ww9vQqTU+bJNqntwK6LXflagrCP9oGXvex
   YNFRHKy7g+2/RCZF7IpBGNfbhGg4lTdVmenHiLAO8ct1zxgNrx6cK3n6E
   LRBJty4kWmcuFwxOPK6TX+elODKFTUYMDJdqeCDCgdJ6TYi/WduJCpvHV
   Q==;
X-CSE-ConnectionGUID: 7uQDdU03S3GOFdMVRa3EAA==
X-CSE-MsgGUID: vi0Vgd5cTEiICpPW0xbVMg==
X-IronPort-AV: E=Sophos;i="6.23,215,1770620400"; 
   d="scan'208";a="56221892"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 07:44:01 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.37; Mon, 4 May 2026 07:44:01 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 4 May 2026 07:43:57 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Mon, 4 May 2026 16:43:42 +0200
Subject: [PATCH net 1/4] net: sparx5: defer VCAP debugfs creation until
 after netdev registration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260504-misc-fixes-sparx5-lan969x-v1-1-6604306b5743@microchip.com>
References: <20260504-misc-fixes-sparx5-lan969x-v1-0-6604306b5743@microchip.com>
In-Reply-To: <20260504-misc-fixes-sparx5-lan969x-v1-0-6604306b5743@microchip.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Steen Hegelund
	<Steen.Hegelund@microchip.com>, <UNGLinuxDriver@microchip.com>, "Sebastian
 Andrzej Siewior" <bigeasy@linutronix.de>, Clark Williams
	<clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Bjarni Jonasson
	<bjarni.jonasson@microchip.com>, Lars Povlsen <lars.povlsen@microchip.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
CC: <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Steen Hegelund
	<steen.hegelund@microchip.com>, <linux-rt-devel@lists.linux.dev>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_074402_865965_2620B5CA 
X-CRM114-Status: GOOD (  20.77  )
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

Commit 3a95973e7c79 ("net: sparx5: move VCAP initialization to probe")
moved sparx5_vcap_init() ahead of sparx5_register_netdevs() in probe.
The VCAP init path ends by calling vcap_port_debugfs() for every port,
which uses netdev_name(ndev) as the debugfs file name. At that point
the netdevs have only been allocated, not registered, so dev->name
still holds the "eth%d" template and netdev_name() returns
"(unnamed net_device)". Every port tries to create the same file under
vcaps/, producing a flood of warnings at boot:

  debugfs: '(unnamed net_device)' already exists in 'vcaps'
  debugfs: '(unnamed net_device)' already exists in 'vcaps'
  ...

Move the debugfs setup into a new sparx5_debugfs() helper in
sparx5_debugfs.c, invoked after sparx5_register_notifier_blocks()
succeeds so the netdev names are finalized. sparx5_vcap_init() now
only deals with VCAP state. The sparx5/ debugfs root is created in
the new helper as well.

Fixes: 3a95973e7c79 ("net: sparx5: move VCAP initialization to probe")
Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 drivers/net/ethernet/microchip/sparx5/Makefile     |  3 ++-
 .../net/ethernet/microchip/sparx5/sparx5_debugfs.c | 26 ++++++++++++++++++++++
 .../net/ethernet/microchip/sparx5/sparx5_main.c    |  4 ++--
 .../net/ethernet/microchip/sparx5/sparx5_main.h    |  7 ++++++
 .../ethernet/microchip/sparx5/sparx5_vcap_impl.c   |  6 -----
 5 files changed, 37 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/microchip/sparx5/Makefile b/drivers/net/ethernet/microchip/sparx5/Makefile
index d447f9e84d92..eb5c81527f41 100644
--- a/drivers/net/ethernet/microchip/sparx5/Makefile
+++ b/drivers/net/ethernet/microchip/sparx5/Makefile
@@ -14,7 +14,8 @@ sparx5-switch-y  := sparx5_main.o sparx5_packet.o \
  sparx5_psfp.o sparx5_mirror.o sparx5_regs.o
 
 sparx5-switch-$(CONFIG_SPARX5_DCB) += sparx5_dcb.o
-sparx5-switch-$(CONFIG_DEBUG_FS) += sparx5_vcap_debugfs.o
+sparx5-switch-$(CONFIG_DEBUG_FS) += sparx5_vcap_debugfs.o \
+				    sparx5_debugfs.o
 
 sparx5-switch-$(CONFIG_LAN969X_SWITCH) += lan969x/lan969x_regs.o \
 					  lan969x/lan969x.o \
diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_debugfs.c b/drivers/net/ethernet/microchip/sparx5/sparx5_debugfs.c
new file mode 100644
index 000000000000..f6cb1eeaab80
--- /dev/null
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_debugfs.c
@@ -0,0 +1,26 @@
+// SPDX-License-Identifier: GPL-2.0+
+/* Microchip Sparx5 Switch driver debug filesystem support
+ *
+ * Copyright (c) 2026 Microchip Technology Inc. and its subsidiaries.
+ */
+
+#include <linux/debugfs.h>
+
+#include "sparx5_main.h"
+#include "vcap_api_debugfs.h"
+
+void sparx5_debugfs(struct sparx5 *sparx5)
+{
+	const struct sparx5_consts *consts = sparx5->data->consts;
+	struct vcap_control *ctrl = sparx5->vcap_ctrl;
+	struct dentry *dir;
+	int idx;
+
+	sparx5->debugfs_root = debugfs_create_dir("sparx5", NULL);
+
+	dir = vcap_debugfs(sparx5->dev, sparx5->debugfs_root, ctrl);
+	for (idx = 0; idx < consts->n_ports; ++idx)
+		if (sparx5->ports[idx])
+			vcap_port_debugfs(sparx5->dev, dir, ctrl,
+					  sparx5->ports[idx]->ndev);
+}
diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
index dad713e9ddd5..bec07560e6fe 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
@@ -820,8 +820,6 @@ static int mchp_sparx5_probe(struct platform_device *pdev)
 	/* Default values, some from DT */
 	sparx5->coreclock = SPX5_CORE_CLOCK_DEFAULT;
 
-	sparx5->debugfs_root = debugfs_create_dir("sparx5", NULL);
-
 	ports = of_get_child_by_name(np, "ethernet-ports");
 	if (!ports) {
 		dev_err(sparx5->dev, "no ethernet-ports child node found\n");
@@ -1000,6 +998,8 @@ static int mchp_sparx5_probe(struct platform_device *pdev)
 		goto cleanup_netdevs;
 	}
 
+	sparx5_debugfs(sparx5);
+
 	goto cleanup_config;
 
 cleanup_netdevs:
diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_main.h b/drivers/net/ethernet/microchip/sparx5/sparx5_main.h
index 6a745bb71b5c..d5e6644ff124 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_main.h
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_main.h
@@ -565,6 +565,13 @@ void sparx5_get_hwtimestamp(struct sparx5 *sparx5,
 int sparx5_vcap_init(struct sparx5 *sparx5);
 void sparx5_vcap_deinit(struct sparx5 *sparx5);
 
+/* sparx5_debugfs.c */
+#if defined(CONFIG_DEBUG_FS)
+void sparx5_debugfs(struct sparx5 *sparx5);
+#else
+static inline void sparx5_debugfs(struct sparx5 *sparx5) {}
+#endif
+
 /* sparx5_pgid.c */
 enum sparx5_pgid_type {
 	SPX5_PGID_FREE,
diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_vcap_impl.c b/drivers/net/ethernet/microchip/sparx5/sparx5_vcap_impl.c
index 95b93e46a41d..dd446b3a9f20 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_vcap_impl.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_vcap_impl.c
@@ -2035,7 +2035,6 @@ int sparx5_vcap_init(struct sparx5 *sparx5)
 	const struct sparx5_vcap_inst *cfg;
 	struct vcap_control *ctrl;
 	struct vcap_admin *admin;
-	struct dentry *dir;
 	int err = 0, idx;
 
 	/* Create a VCAP control instance that owns the platform specific VCAP
@@ -2074,11 +2073,6 @@ int sparx5_vcap_init(struct sparx5 *sparx5)
 			sparx5_vcap_port_key_selection(sparx5, admin);
 		list_add_tail(&admin->list, &ctrl->list);
 	}
-	dir = vcap_debugfs(sparx5->dev, sparx5->debugfs_root, ctrl);
-	for (idx = 0; idx < consts->n_ports; ++idx)
-		if (sparx5->ports[idx])
-			vcap_port_debugfs(sparx5->dev, dir, ctrl,
-					  sparx5->ports[idx]->ndev);
 
 	return err;
 }

-- 
2.34.1


