Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FBC1C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 17:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=L2AXykctnuSwIgdCxYi80gooQQMlU2MT4Krd1IoiYwg=; b=TX6NHkMeRgWAH7mBHlMnOzKFsN
	rXQRgRS8QKIga8LhalULcVocWqU+sytod+4qkadLF3Tm14aEwt8kPV8CMsFPM9mr3nMRB9MybfOkT
	zb/GyyFnXMx8XQ/T1a5z09a5zBGB6vSpHaazRDsS//4Gl5QAWRf3wvtYIXkSjjnugyYEBpbFkUDQm
	/yKNmCtAWkz/Z9N0KJWnMPJBc41BuoWAFVfOmiOzStPC+jRlp0lKG6IgCAD0KiU+SRFDvMpuvkY6K
	XEVjhfsPQCf2h7JWRb7FAJyQdDpA8UJmhkFI/khv7n+B9dogkZ7H0xBMfuXuDwRYKXA494gtOfJ0c
	t9GatLcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh9Ex-0000000FWHu-3qSm;
	Tue, 07 Jul 2026 17:05:47 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh9Ev-0000000FWGf-0mHL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 17:05:46 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-493c00f74baso28261355e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 10:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1783443942; x=1784048742; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L2AXykctnuSwIgdCxYi80gooQQMlU2MT4Krd1IoiYwg=;
        b=zFLCVjii7aSkEIf5KT8WDGqkB4QmdPTio1PISd7dlKhzUD8zuo+D28cPV9lf76afZy
         IC7progiQl5GwqNHLEpo6w6JPR8LOz5bQlAdPjrdxyW+OnKBdxFqPqKjLY0Lla9YuJbE
         wc5zJwuxNh92yGq8e2/SZ2Y1+wEWB0rsae+7seF2KJT+6cAAkf4tJNxDcPqssCiXXGuT
         iSJcGMf8SWY4S1YY0ZAVbpYuu+zdmbsxcytOFdcyRvgAzcUtZ9DUI8Hr8xw7I+pqDmNu
         Mnu+FnBfIAYPcK1Oxj7Z86iGIHmSmAg5SqnZAdDPEMPquicWgA8l0nDc0eqjldIoG3Xr
         fQOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783443942; x=1784048742;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L2AXykctnuSwIgdCxYi80gooQQMlU2MT4Krd1IoiYwg=;
        b=MgL08Wr3NoATQzvRMojKhMhUuWdjicUp46loO7MVgtLODli8efENo9lqcmUlxjxT/E
         8fSpwQO5Ufcub5soBXNMBIf/q9JIXIXVW/uWfpmJ6lujtZI+RlmYSecvta7uY5aERPK8
         nTN9ImW244+oCJeBibrl3mIjvkM1XLxUW9kIiqhZyci5+fbqcEHOPtXLlPWvhoWdRk/2
         YaNkJO+yNDeQLmGwHZt/p47rEmCIH6INi1MAtx7SXwDDjnXFeUqsdLj4t2s8uklaz5Mv
         Fe9qVSXWaPNhPonnLZKLHJuc2Y0ipM4I6mPzvvybG2HxMtKFG9T+kW4IQTdBYPIC9TY7
         rv8A==
X-Forwarded-Encrypted: i=1; AHgh+RqHrSy0uISD0dUiIqWxXiNhEjk8mXoBfgkgh+QV+gY59Y3OF0vplby2CM5pL+v8V8P79Kn9TH/YVRdQrkX5UUOP@lists.infradead.org
X-Gm-Message-State: AOJu0YwPp0DpCPFTYZVZmIP/kuK94W2WdOyupW/lhGxYy3IdYJ96Ye+2
	1dhwky4+111PYWR4VfkgZ7EUWevqE3oM83R4HubnrMzD1/vk8ZfSc9hcTL49Nj7HJpc=
X-Gm-Gg: AfdE7cmJEyVjgkGkPvw5oE9EgHpvnTReglpZUkC3ae0YR/so1VD771PkIw3qeEb0fPd
	ARVLQPfs9YPaErre0EYzvcdJnti2nY2IKYjrkZRCtRLjnOiY4o0EoWSzkzzDPp24bNDt3M1uwmW
	mBS8dQMHShSzfTd875nKPyMYzofUj6VgYqT31Oc5Od+r03gEkT0O5ymXapRIg+7AmAxSMAp7+rK
	+dHdLJvb1CPS0F3QST8KPk41nB5UgdJYSWLBhRrBcEI37C+W0fhpj9o+LV0ggNJCEs/McBNJNuO
	9htXfhKFPc9zHZknF9gT2e0gO7UsELsed4WGlzy2rxPZw3ZWnt5ua2d93o/mWF6tAoCl845XEWk
	j6Yh4pzc6pGDOw/di+kQdXgBg5WAUQGDT/x9TsOCrqgS4pdt9r7mrwgYtfSN9EHg0X0dZV2laav
	nJH9Phocek9Fmso12hxEONj71n/ftFzAJ2hODSw04qf8h+c1rKh5MdSCL0X8nPJLjSHx+gBdhpc
	JugDYBHA8/UXU1cPFs5kuNx6o0/LkXQGK5b+xP/HHw=
X-Received: by 2002:a05:600c:1d1a:b0:493:d078:796 with SMTP id 5b1f17b1804b1-493df092921mr77545585e9.17.1783443942618;
        Tue, 07 Jul 2026 10:05:42 -0700 (PDT)
Received: from threadripper-fedora-workstation (dh207-15-57.xnet.hr. [88.207.15.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e54a27cbsm1811395e9.1.2026.07.07.10.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 10:05:41 -0700 (PDT)
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
Subject: [PATCH net-next] net: sparx5: configure TAS port link speed
Date: Tue,  7 Jul 2026 19:04:48 +0200
Message-ID: <20260707170531.1129866-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_100545_286353_98254CB9 
X-CRM114-Status: GOOD (  19.36  )
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


