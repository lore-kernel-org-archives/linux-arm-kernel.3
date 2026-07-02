Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC5A2C43602
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 10:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=L2AXykctnuSwIgdCxYi80gooQQMlU2MT4Krd1IoiYwg=; b=ISWC1djCVJDvItr/8Snx0HELCX
	qpTWXkiQHfM1Z/l8PEHnmLBzWzMQ0o5yoUGXmZ+suBdUPgxg/8so/2x93oFFX/4HqgLO37nfRCG9r
	qe3B6J/qodBtWgNLN13/AJ/x54JKqx2NM7tIIpgQr16Vq9BDRb6mK/R5OMP1GpWsT1AJrhcLOHDJE
	ibHRqdw734yWj8sGL3WTn1jpcLBbCPMOsJLoAVRDFPwCRBa5P2MhMrUaGzC/BeYaegNnRMxL60gDD
	I4V1DEb4l/wCm3/QEooIPIACZLVaPYVUEa2BlDV99F1mgLznyo9cdjy3PG1G9uPsNR65Yleeibtxp
	Mqhb7BRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfESi-000000049Vx-3fhK;
	Thu, 02 Jul 2026 10:16:04 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfESf-000000049VG-3xuf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 10:16:03 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-493b1710405so8918925e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 03:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1782987358; x=1783592158; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L2AXykctnuSwIgdCxYi80gooQQMlU2MT4Krd1IoiYwg=;
        b=gPmVB0XrzjEHm5iZnwR3Xpc8l2Aka7ZXjASVb7EZwLJEsonNIOhkF4KU/S0drNt7XW
         OebgtQker3kft07WeawEt4FqaAqHKP3m2SkCmuorwlAOjNgsfUPQ+3joq3HQUo0o0KeR
         OhCtrG5npb8DS1NcTKjuGxKKUoef6jxHxcZBFLvzb9RafdN/1t3Y9cmOnUQ6vns8n2Pa
         2jn0ar4pnBFw6EiFflqPcwwsdw64oPGJbkXsMoBeCsPOVwkhG/RWkrz5wONdJ9m0b1N1
         wB9KDEjZdSVGe/vgWwKBiv1dZietgqIGeBPx2iwenoxfbfsoGqlyAlq4KCc2b746u6Pn
         vBtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782987358; x=1783592158;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L2AXykctnuSwIgdCxYi80gooQQMlU2MT4Krd1IoiYwg=;
        b=eG7PDeYRLm1Y3JwgPwjXYqUshqWg0GL2bcDJzm8aqXWa09fRVcc0M0se8+9Fngmuip
         ytquUawtRVmlLeshrpKwu8mjy25gIxaVf2K0dKXxn/QiLKMZF36SnlWBoZH27qElQ21l
         2j8IT8Tnj0jscFNeKTVlwtHNUSQKPxw0ozAqxdstlAnMSxr9vWynH1XFfxlMRbdM26jM
         4BTXRhLTwr4TAYk5AAn/t/KN541HhlI//Yktf30jWAyzr045hQ5GHNNP9h6Z0hiYoABT
         sw4IohhuT+bkX0np1n+NyBbgCg1T4ch/AWd//2F6BpE0CloEBYOJ7iEcAaGH+ZZul6o1
         Xr1w==
X-Forwarded-Encrypted: i=1; AFNElJ/zpwTRyL7Xz0CZJt4Ehl5YvL4oPS7Qa+BGSe1vuxVQ4JavrfHPhD5juVSTcXwqlCf+jwA/rVlSX6DT0EvmDoNh@lists.infradead.org
X-Gm-Message-State: AOJu0YyG9RFSw7/u55zP1z4MMv3vTNBKa75slFSbYvznAoFRcENhRy83
	I5pQfZA6JMonb3Ik2L4lFeX96CQJvRUfAc32XdKbl4yIucGiHufI8r7Z127oa1QcjdQ=
X-Gm-Gg: AfdE7cnXaCL9JXNXzctOOQ4sP/RB23Diy5OtR3/TrwfWYEClBHUimOnuIVArjrHkICW
	/irSyn9unwB1aOCR2lhXQW0wkvz45gHVCto0LEHW0cDmtBd3kS7FK5HdM2tnvVI22/jh3WrylQb
	qFOwGFK/6usbUMrn5MQFKKeH2UVgVw76UX0H40VswxfPDAo1dGKLfQgFCRWZCNQS7BVnq4kIrKG
	sr7u0HjiTQoH9/+3+gBt5n0gp0Vu0vWP43w1oeSmk+zFu2EJ05uiI3zcTGEgqR07V8/dFnTMV4k
	/S073HlXUNISCEQec62v7aOU7cU2Z96BFtnEFPl8HZxzw50R5/5mngLOnS8yaZRpAQ7pRE95EWZ
	C/BwE0eDtFTECC4FC9rHzH/qhmuInzwUhHSBmFnYYNL7wQEnT0CnvoJMYYm3VMxBi1xPqcLK9rS
	6V0i8wZ5qbcK0bUYtIyrd3YR9TJscaap1c/xxaoyB2f9kRb7uMWpuyrEjFB7oPNeqyg1JA5ZB7L
	WJKFz9LWpJh8ppwX2MDaR43smzzm+x6NPyhNQQsVBDukQH8
X-Received: by 2002:a05:600c:6296:b0:493:bd2f:c5dd with SMTP id 5b1f17b1804b1-493c2b90534mr74549765e9.21.1782987357840;
        Thu, 02 Jul 2026 03:15:57 -0700 (PDT)
Received: from threadripper-fedora-workstation (d-zg1-018.globalnet.hr. [213.149.36.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c6372c52sm38791925e9.14.2026.07.02.03.15.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 03:15:57 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	Steen.Hegelund@microchip.com,
	horms@kernel.org,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [RFC net-next] net: sparx5: configure TAS port link speed
Date: Thu,  2 Jul 2026 12:15:44 +0200
Message-ID: <20260702101550.189699-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_031602_048058_9D79D0C8 
X-CRM114-Status: GOOD (  18.86  )
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

On the TSN and RED variants of LAN969x and SparX-5i TAS (Time-Aware Shaper)
is present in the silicon.

Currently, the driver does not use configure it at all, which means that
the TAS_PROFILE_CONFIG.LINK_SPEED[1] value is left at the default of 3
which means that its configured for 1 Gbps.

So, running iperf between two 10G switch ports will result in only 940-ish
Mbps while we should be getting around 9.3 Gbps.

Correctly populating the TAS_PROFILE_CONFIG.LINK_SPEED[1] with the current
port speed fixes this issue and we achieve around 9.4 Gbps between two 10G
switch ports.

So, port the TAS port link speed setting from the vendor BSP 6.18 kernel[2]

[1] https://microchip-ung.github.io/lan969x-industrial_reginfo/reginfo_LAN969x-Industrial.html?select=hsch,tas_profile_cfg,tas_profile_config,link_speed
[2] https://github.com/microchip-ung/linux/tree/bsp-6.18-2026

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 .../microchip/sparx5/lan969x/lan969x_regs.c   |  3 ++
 .../microchip/sparx5/sparx5_main_regs.h       | 12 +++++
 .../ethernet/microchip/sparx5/sparx5_port.c   |  4 ++
 .../ethernet/microchip/sparx5/sparx5_qos.c    | 49 +++++++++++++++++++
 .../ethernet/microchip/sparx5/sparx5_qos.h    |  1 +
 .../ethernet/microchip/sparx5/sparx5_regs.c   |  3 ++
 .../ethernet/microchip/sparx5/sparx5_regs.h   |  3 ++
 7 files changed, 75 insertions(+)

diff --git a/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x_regs.c b/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x_regs.c
index ace4ba21eec4..3fc2c006ba12 100644
--- a/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x_regs.c
+++ b/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x_regs.c
@@ -95,6 +95,7 @@ const unsigned int lan969x_gaddr[GADDR_LAST] = {
 	[GA_HSCH_SYSTEM] = 37384,
 	[GA_HSCH_MMGT] = 36260,
 	[GA_HSCH_TAS_CONFIG] = 37696,
+	[GA_HSCH_TAS_PROFILE_CFG] = 37712,
 	[GA_PTP_PTP_CFG] = 512,
 	[GA_PTP_PTP_TOD_DOMAINS] = 528,
 	[GA_PTP_PHASE_DETECTOR_CTRL] = 628,
@@ -129,6 +130,7 @@ const unsigned int lan969x_gcnt[GCNT_LAST] = {
 	[GC_GCB_SIO_CTRL] = 1,
 	[GC_HSCH_HSCH_CFG] = 1120,
 	[GC_HSCH_HSCH_DWRR] = 32,
+	[GC_HSCH_TAS_PROFILE_CFG] = 30,
 	[GC_PTP_PTP_PINS] = 8,
 	[GC_PTP_PHASE_DETECTOR_CTRL] = 8,
 	[GC_REW_PORT] = 35,
@@ -144,6 +146,7 @@ const unsigned int lan969x_gsize[GSIZE_LAST] = {
 	[GW_FDMA_FDMA] = 448,
 	[GW_GCB_CHIP_REGS] = 180,
 	[GW_HSCH_TAS_CONFIG] = 16,
+	[GW_HSCH_TAS_PROFILE_CFG] = 68,
 	[GW_PTP_PHASE_DETECTOR_CTRL] = 12,
 	[GW_QSYS_PAUSE_CFG] = 988,
 };
diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_main_regs.h b/drivers/net/ethernet/microchip/sparx5/sparx5_main_regs.h
index 27d02eea7ce1..15fbfa68bc75 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_main_regs.h
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_main_regs.h
@@ -5369,6 +5369,18 @@ extern const struct sparx5_regs *regs;
 #define HSCH_TAS_STATEMACHINE_CFG_REVISIT_DLY_GET(x)\
 	FIELD_GET(HSCH_TAS_STATEMACHINE_CFG_REVISIT_DLY, x)
 
+/* HSCH:TAS_PROFILE_CFG:TAS_PROFILE_CONFIG */
+#define HSCH_TAS_PROFILE_CONFIG(g)                                             \
+	__REG(TARGET_HSCH, 0, 1, regs->gaddr[GA_HSCH_TAS_PROFILE_CFG], g,       \
+	      regs->gcnt[GC_HSCH_TAS_PROFILE_CFG],                              \
+	      regs->gsize[GW_HSCH_TAS_PROFILE_CFG], 32, 0, 1, 4)
+
+#define HSCH_TAS_PROFILE_CONFIG_LINK_SPEED       GENMASK(10, 8)
+#define HSCH_TAS_PROFILE_CONFIG_LINK_SPEED_SET(x)\
+	FIELD_PREP(HSCH_TAS_PROFILE_CONFIG_LINK_SPEED, x)
+#define HSCH_TAS_PROFILE_CONFIG_LINK_SPEED_GET(x)\
+	FIELD_GET(HSCH_TAS_PROFILE_CONFIG_LINK_SPEED, x)
+
 /* LAN969X ONLY */
 /* HSIOWRAP:XMII_CFG:XMII_CFG */
 #define HSIO_WRAP_XMII_CFG(g)                                                  \
diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_port.c b/drivers/net/ethernet/microchip/sparx5/sparx5_port.c
index 62c49893de3c..ef06bed3a9cc 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_port.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_port.c
@@ -11,6 +11,7 @@
 #include "sparx5_main_regs.h"
 #include "sparx5_main.h"
 #include "sparx5_port.h"
+#include "sparx5_qos.h"
 
 #define SPX5_ETYPE_TAG_C     0x8100
 #define SPX5_ETYPE_TAG_S     0x88a8
@@ -1050,6 +1051,9 @@ int sparx5_port_config(struct sparx5 *sparx5,
 		 sparx5,
 		 QFWD_SWITCH_PORT_MODE(port->portno));
 
+	/* Notify TAS about the speed. */
+	sparx5_tas_speed(port, conf->speed);
+
 	/* Save the new values */
 	port->conf = *conf;
 
diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_qos.c b/drivers/net/ethernet/microchip/sparx5/sparx5_qos.c
index e580670f3992..972da8a71f5a 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_qos.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_qos.c
@@ -9,6 +9,17 @@
 #include "sparx5_main.h"
 #include "sparx5_qos.h"
 
+enum sparx5_tas_link_speed {
+	TAS_SPEED_NO_GB,
+	TAS_SPEED_10,
+	TAS_SPEED_100,
+	TAS_SPEED_1000,
+	TAS_SPEED_2500,
+	TAS_SPEED_5000,
+	TAS_SPEED_10000,
+	TAS_SPEED_25000,
+};
+
 /* Calculate new base_time based on cycle_time.
  *
  * The hardware requires a base_time that is always in the future.
@@ -581,3 +592,41 @@ int sparx5_tc_ets_del(struct sparx5_port *port)
 
 	return sparx5_dwrr_conf_set(port, &dwrr);
 }
+
+void sparx5_tas_speed(struct sparx5_port *port, int speed)
+{
+	struct sparx5 *sparx5 = port->sparx5;
+	u8 spd;
+
+	switch (speed) {
+	case SPEED_10:
+		spd = TAS_SPEED_10;
+		break;
+	case SPEED_100:
+		spd = TAS_SPEED_100;
+		break;
+	case SPEED_1000:
+		spd = TAS_SPEED_1000;
+		break;
+	case SPEED_2500:
+		spd = TAS_SPEED_2500;
+		break;
+	case SPEED_5000:
+		spd = TAS_SPEED_5000;
+		break;
+	case SPEED_10000:
+		spd = TAS_SPEED_10000;
+		break;
+	case SPEED_25000:
+		spd = TAS_SPEED_25000;
+		break;
+	default:
+		netdev_err(port->ndev, "TAS: Unsupported speed: %d\n", speed);
+		return;
+	}
+
+	spx5_rmw(HSCH_TAS_PROFILE_CONFIG_LINK_SPEED_SET(spd),
+		 HSCH_TAS_PROFILE_CONFIG_LINK_SPEED,
+		 sparx5,
+		 HSCH_TAS_PROFILE_CONFIG(port->portno));
+}
diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_qos.h b/drivers/net/ethernet/microchip/sparx5/sparx5_qos.h
index 04f76f1e23f6..a92a699c551f 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_qos.h
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_qos.h
@@ -60,6 +60,7 @@ struct sparx5_dwrr {
 };
 
 int sparx5_qos_init(struct sparx5 *sparx5);
+void sparx5_tas_speed(struct sparx5_port *port, int speed);
 
 /* Multi-Queue Priority */
 int sparx5_tc_mqprio_add(struct net_device *ndev, u8 num_tc);
diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_regs.c b/drivers/net/ethernet/microchip/sparx5/sparx5_regs.c
index 220e81b714d4..3863f954bd83 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_regs.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_regs.c
@@ -95,6 +95,7 @@ const unsigned int sparx5_gaddr[GADDR_LAST] = {
 	[GA_HSCH_SYSTEM] = 184000,
 	[GA_HSCH_MMGT] = 162368,
 	[GA_HSCH_TAS_CONFIG] = 162384,
+	[GA_HSCH_TAS_PROFILE_CFG] = 188416,
 	[GA_PTP_PTP_CFG] = 320,
 	[GA_PTP_PTP_TOD_DOMAINS] = 336,
 	[GA_PTP_PHASE_DETECTOR_CTRL] = 420,
@@ -129,6 +130,7 @@ const unsigned int sparx5_gcnt[GCNT_LAST] = {
 	[GC_GCB_SIO_CTRL] = 3,
 	[GC_HSCH_HSCH_CFG] = 5040,
 	[GC_HSCH_HSCH_DWRR] = 72,
+	[GC_HSCH_TAS_PROFILE_CFG] = 100,
 	[GC_PTP_PTP_PINS] = 5,
 	[GC_PTP_PHASE_DETECTOR_CTRL] = 5,
 	[GC_REW_PORT] = 70,
@@ -144,6 +146,7 @@ const unsigned int sparx5_gsize[GSIZE_LAST] = {
 	[GW_FDMA_FDMA] = 428,
 	[GW_GCB_CHIP_REGS] = 424,
 	[GW_HSCH_TAS_CONFIG] = 12,
+	[GW_HSCH_TAS_PROFILE_CFG] = 64,
 	[GW_PTP_PHASE_DETECTOR_CTRL] = 8,
 	[GW_QSYS_PAUSE_CFG] = 1128,
 };
diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_regs.h b/drivers/net/ethernet/microchip/sparx5/sparx5_regs.h
index ea28130c2341..585589a31e90 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_regs.h
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_regs.h
@@ -104,6 +104,7 @@ enum sparx5_gaddr_enum {
 	GA_HSCH_SYSTEM,
 	GA_HSCH_MMGT,
 	GA_HSCH_TAS_CONFIG,
+	GA_HSCH_TAS_PROFILE_CFG,
 	GA_PTP_PTP_CFG,
 	GA_PTP_PTP_TOD_DOMAINS,
 	GA_PTP_PHASE_DETECTOR_CTRL,
@@ -139,6 +140,7 @@ enum sparx5_gcnt_enum {
 	GC_GCB_SIO_CTRL,
 	GC_HSCH_HSCH_CFG,
 	GC_HSCH_HSCH_DWRR,
+	GC_HSCH_TAS_PROFILE_CFG,
 	GC_PTP_PTP_PINS,
 	GC_PTP_PHASE_DETECTOR_CTRL,
 	GC_REW_PORT,
@@ -155,6 +157,7 @@ enum sparx5_gsize_enum {
 	GW_FDMA_FDMA,
 	GW_GCB_CHIP_REGS,
 	GW_HSCH_TAS_CONFIG,
+	GW_HSCH_TAS_PROFILE_CFG,
 	GW_PTP_PHASE_DETECTOR_CTRL,
 	GW_QSYS_PAUSE_CFG,
 	GSIZE_LAST,
-- 
2.55.0


