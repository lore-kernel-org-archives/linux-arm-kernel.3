Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1C6BE674AD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 07:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WHE/xgU5sJqZ0Lnc8Dbx+W3ND41PhQt4HeQMGXZ2DV4=; b=hPqW0En85nkFD3w4UaR4ynm/FN
	B4poBbyZRl30pO2jofQu9YJ0o5gtA93B0gqrb0XeeTHyg12SxvSevapqOBalQHCJJ8IALuFQDKbHe
	JPggZWiDlh0DNA0tD3DwCS8xWgJzDS6BNkW+A/kBTEnBpTs0zYZs8umEreesQUJSe2e4vD1tQBD1z
	BOe56STTj3JNH0tMHAjR3PtrAlHHi4qQsNwDQgnaQJG36DHk7lBVrPN6lw9JzLzF5C27jOjZrVtjY
	uydBq/x6D+bNvEQ8p1CZrfMLWP1BsLYIov3ZOr+zhHVKTDjPttqVKLxXmyzK3fO6zBIeuaJzpiCL+
	PSP8bBvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6m5B-000000066n2-32Zi;
	Fri, 01 Nov 2024 07:28:33 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6lnj-000000063n8-1Xjw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 07:10:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1730445031; x=1761981031;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=NO8D57jjFPDxrbgYyw5Mvi+zlor1VX7LknLSSD3o+GY=;
  b=OK4UBul+DFFWwugnCO8jwoc5wHDMlsb1B3ueWB2PN5k67RYhtWMwz5Xa
   c2I5RwMehtDI869yOze5zfXhqU4x4XNIbD5K3OhkUxGAeEDv+ZPH6jEOX
   eIINRuK5MbNNdBAtbn2cZmOtbhjndy2eiPVZw1UAyeAcuhrxyW4e7lzr5
   clBzjNTLMMGE/r5Qw88h0yv+lcr9V8ZDhSo2xnrVtfJ9GzSuGVINUg7C3
   KzkezyqlPQkpiIpFebcbmAhaYO3NePJefP/DfDtN/SSL+anmWoC42ftAa
   0jDNKgRMgqLyGoSocC9zyAh1Mo5rEmLewx4rUbyRWsEpF1Pqu7vNCCvye
   A==;
X-CSE-ConnectionGUID: j3YBXS8JS+qztkz9gl3BFg==
X-CSE-MsgGUID: t5VuQJaGQ7qXXZt/aEIsqg==
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; 
   d="scan'208";a="264868811"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 01 Nov 2024 00:10:31 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 1 Nov 2024 00:10:00 -0700
Received: from DEN-DL-M70577.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Fri, 1 Nov 2024 00:09:57 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Fri, 1 Nov 2024 08:09:09 +0100
Subject: [PATCH net-next 3/6] net: sparx5: add new VCAP constants to match
 data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20241101-sparx5-lan969x-switch-driver-3-v1-3-3c76f22f4bfa@microchip.com>
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
X-CRM114-CacheID: sfid-20241101_001031_435178_AED5C6CF 
X-CRM114-Status: GOOD (  15.78  )
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

In preparation for lan969x VCAP support, add the following three new
VCAP constants to match data:

    - vcaps_cfg (contains configuration data for each VCAP).

    - vcaps (contains auto-generated information about VCAP keys and
      actions).

    - vcap_stats: (contains auto-generated string names of all the keys
      and actions)

Add these constants to the Sparx5 match data constants and use them to
initialize the VCAP's in sparx5_vcap_init().

Reviewed-by: Steen Hegelund <Steen.Hegelund@microchip.com>
Reviewed-by: Jens Emil Schulz Østergaard <jensemil.schulzostergaard@microchip.com>
Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 drivers/net/ethernet/microchip/sparx5/sparx5_main.c        | 5 +++++
 drivers/net/ethernet/microchip/sparx5/sparx5_main.h        | 3 +++
 drivers/net/ethernet/microchip/sparx5/sparx5_vcap_ag_api.h | 2 ++
 drivers/net/ethernet/microchip/sparx5/sparx5_vcap_impl.c   | 6 +++---
 4 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
index 4f2d5413a64f..bac87e885bf1 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
@@ -30,6 +30,8 @@
 #include "sparx5_main.h"
 #include "sparx5_port.h"
 #include "sparx5_qos.h"
+#include "sparx5_vcap_ag_api.h"
+#include "sparx5_vcap_impl.h"
 
 const struct sparx5_regs *regs;
 
@@ -1063,6 +1065,9 @@ static const struct sparx5_consts sparx5_consts = {
 	.qres_max_prio_idx   = 630,
 	.qres_max_colour_idx = 638,
 	.tod_pin             = 4,
+	.vcaps               = sparx5_vcaps,
+	.vcaps_cfg           = sparx5_vcap_inst_cfg,
+	.vcap_stats          = &sparx5_vcap_stats,
 };
 
 static const struct sparx5_ops sparx5_ops = {
diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_main.h b/drivers/net/ethernet/microchip/sparx5/sparx5_main.h
index 146bdc938adc..d5dd953b0a71 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_main.h
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_main.h
@@ -303,6 +303,9 @@ struct sparx5_consts {
 	u32 qres_max_prio_idx;   /* Maximum QRES prio index */
 	u32 qres_max_colour_idx; /* Maximum QRES colour index */
 	u32 tod_pin;             /* PTP TOD pin */
+	const struct sparx5_vcap_inst *vcaps_cfg;
+	const struct vcap_info *vcaps;
+	const struct vcap_statistics *vcap_stats;
 };
 
 struct sparx5_ops {
diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_vcap_ag_api.h b/drivers/net/ethernet/microchip/sparx5/sparx5_vcap_ag_api.h
index 7d106f1276fe..e68f5639a40a 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_vcap_ag_api.h
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_vcap_ag_api.h
@@ -10,6 +10,8 @@
 #ifndef __SPARX5_VCAP_AG_API_H__
 #define __SPARX5_VCAP_AG_API_H__
 
+#include "vcap_api.h"
+
 /* VCAPs */
 extern const struct vcap_info sparx5_vcaps[];
 extern const struct vcap_statistics sparx5_vcap_stats;
diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_vcap_impl.c b/drivers/net/ethernet/microchip/sparx5/sparx5_vcap_impl.c
index bbff8158a3de..25066ddb8d4d 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_vcap_impl.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_vcap_impl.c
@@ -2053,14 +2053,14 @@ int sparx5_vcap_init(struct sparx5 *sparx5)
 
 	sparx5->vcap_ctrl = ctrl;
 	/* select the sparx5 VCAP model */
-	ctrl->vcaps = sparx5_vcaps;
-	ctrl->stats = &sparx5_vcap_stats;
+	ctrl->vcaps = consts->vcaps;
+	ctrl->stats = consts->vcap_stats;
 	/* Setup callbacks to allow the API to use the VCAP HW */
 	ctrl->ops = &sparx5_vcap_ops;
 
 	INIT_LIST_HEAD(&ctrl->list);
 	for (idx = 0; idx < ARRAY_SIZE(sparx5_vcap_inst_cfg); ++idx) {
-		cfg = &sparx5_vcap_inst_cfg[idx];
+		cfg = &consts->vcaps_cfg[idx];
 		admin = sparx5_vcap_admin_alloc(sparx5, ctrl, cfg);
 		if (IS_ERR(admin)) {
 			err = PTR_ERR(admin);

-- 
2.34.1


