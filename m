Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A84C4D0BB41
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 22:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DK5y5wmq+sw80ovadCANJT50C5YasoLMdvqE/nm1ED8=; b=hDZ0Q5cKTJFliB+Sd3LRYPrV84
	Oi+alOf2bIPCtUz2g1OZs7lWiVBmQ+j27ly//V/NZHsszZsoqHfr76uDqRqp21rlSINo7LrRFzcSv
	jbfeEP0GYXCTTLgylVEnU2NYWUhRl0qXv2TO0SGz0tHtSkd3bpYdLcJJ8FpFx8IeoVsRyscOlUh5n
	Mb8hdDS9i/TZYvVkbGWbhtsq99Rf6jnSLA14/oObhfP+6FIgt5fzFZuCj1pEClbVhduaM6tY2uZAq
	CTBN93E1dEYa5xCpEWS2XVcWJNhOPkRNwUowfaCuYhK1cPebmXxT26/rJITjAZzF3gNwjG0WXmbSp
	bnJWxhxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3jWQ-0000000G3Z7-2QDl;
	Wed, 23 Oct 2024 22:08:06 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3jQc-0000000G27e-2KU9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 22:02:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1729720926; x=1761256926;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=tYIsnlYu8tQgs3FFqbphhsO7GFXXscQdLLBW4Ok9TdI=;
  b=hvKsJdTrwozlEuV7pF5LWGUBDY8YjOU+v9pjnBVctej7/OLd3NKykviQ
   d+oKkLADDUKGskc490yF8YO6T8h1wDTNHcRxOiei3rGhaLu6ElnVvlB+e
   svty4eoYm/3oi36A2UF/zJkSUUJxgtqKjPkEJjHAOMSZjB3CqzmousXmf
   kMpKxy6bK3NF1FZ1rtiXnkBRJnLWpTjdeLx8QCbbSALltEYiTS6A1b1hg
   a7g2OvLD1zyQyI8JFwgFP3TjmNo0BTeL9i0Sk11CjPDL/mu+WencEsPa+
   6VsvJ/9bBX/x8kSPTZNosbHbpfwywAAibwETiMto9hXDPbjboOktzMQTM
   A==;
X-CSE-ConnectionGUID: 1Xapdzk8QAqz3uJYdYtrIg==
X-CSE-MsgGUID: BGTP6e2oRi2jYdjqN96SDQ==
X-IronPort-AV: E=Sophos;i="6.11,227,1725346800"; 
   d="scan'208";a="33409631"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 23 Oct 2024 15:02:04 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 23 Oct 2024 15:01:59 -0700
Received: from DEN-DL-M70577.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Wed, 23 Oct 2024 15:01:55 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Thu, 24 Oct 2024 00:01:24 +0200
Subject: [PATCH net-next v2 05/15] net: sparx5: add registers required by
 lan969x
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241024-sparx5-lan969x-switch-driver-2-v2-5-a0b5fae88a0f@microchip.com>
References: <20241024-sparx5-lan969x-switch-driver-2-v2-0-a0b5fae88a0f@microchip.com>
In-Reply-To: <20241024-sparx5-lan969x-switch-driver-2-v2-0-a0b5fae88a0f@microchip.com>
To: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>, Lars Povlsen
	<lars.povlsen@microchip.com>, Steen Hegelund <Steen.Hegelund@microchip.com>,
	<horatiu.vultur@microchip.com>, <jensemil.schulzostergaard@microchip.com>,
	<Parthiban.Veerasooran@microchip.com>, <Raju.Lakkaraju@microchip.com>,
	<UNGLinuxDriver@microchip.com>, Richard Cochran <richardcochran@gmail.com>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, <jacob.e.keller@intel.com>,
	<ast@fiberby.net>, <maxime.chevallier@bootlin.com>, <horms@kernel.org>
CC: <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Steen Hegelund
	<steen.hegelund@microchip.com>, <devicetree@vger.kernel.org>
X-Mailer: b4 0.14-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_150206_669281_BAA79A44 
X-CRM114-Status: UNSURE (   9.53  )
X-CRM114-Notice: Please train this message.
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

Lan969x will require a few additional registers for certain operations.
Some are shared, some are not. Add these.

Reviewed-by: Steen Hegelund <Steen.Hegelund@microchip.com>
Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 .../ethernet/microchip/sparx5/sparx5_main_regs.h   | 132 +++++++++++++++++++++
 1 file changed, 132 insertions(+)

diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_main_regs.h b/drivers/net/ethernet/microchip/sparx5/sparx5_main_regs.h
index 0e8b18bcf179..561344f19062 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_main_regs.h
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_main_regs.h
@@ -2666,6 +2666,44 @@ extern const struct sparx5_regs *regs;
 #define CPU_PROC_CTRL_ACP_DISABLE_GET(x)\
 	FIELD_GET(CPU_PROC_CTRL_ACP_DISABLE, x)
 
+/* DEV1G:PHASE_DETECTOR_CTRL:PHAD_CTRL */
+#define DEV2G5_PHAD_CTRL(t, g)                                                 \
+	__REG(TARGET_DEV2G5, t, regs->tsize[TC_DEV2G5], 200, g, 2,             \
+	      regs->gsize[GW_DEV2G5_PHASE_DETECTOR_CTRL], 0, 0, 1, 4)
+
+#define DEV2G5_PHAD_CTRL_PHAD_ENA\
+	BIT(regs->fpos[FP_DEV2G5_PHAD_CTRL_PHAD_ENA])
+#define DEV2G5_PHAD_CTRL_PHAD_ENA_SET(x)\
+	spx5_field_prep(DEV2G5_PHAD_CTRL_PHAD_ENA, x)
+#define DEV2G5_PHAD_CTRL_PHAD_ENA_GET(x)\
+	spx5_field_get(DEV2G5_PHAD_CTRL_PHAD_ENA, x)
+
+/* LAN969X ONLY */
+#define DEV2G5_PHAD_CTRL_DIV_CFG                 GENMASK(11, 9)
+#define DEV2G5_PHAD_CTRL_DIV_CFG_SET(x)\
+	FIELD_PREP(DEV2G5_PHAD_CTRL_DIV_CFG, x)
+#define DEV2G5_PHAD_CTRL_DIV_CFG_GET(x)\
+	FIELD_GET(DEV2G5_PHAD_CTRL_DIV_CFG, x)
+
+/* DEV1G:PHASE_DETECTOR_CTRL:PHAD_CTRL */
+#define DEV2G5_PHAD_CTRL(t, g)                                                 \
+	__REG(TARGET_DEV2G5, t, regs->tsize[TC_DEV2G5], 200, g, 2,             \
+	      regs->gsize[GW_DEV2G5_PHASE_DETECTOR_CTRL], 0, 0, 1, 4)
+
+#define DEV2G5_PHAD_CTRL_PHAD_ENA\
+	BIT(regs->fpos[FP_DEV2G5_PHAD_CTRL_PHAD_ENA])
+#define DEV2G5_PHAD_CTRL_PHAD_ENA_SET(x)\
+	spx5_field_prep(DEV2G5_PHAD_CTRL_PHAD_ENA, x)
+#define DEV2G5_PHAD_CTRL_PHAD_ENA_GET(x)\
+	spx5_field_get(DEV2G5_PHAD_CTRL_PHAD_ENA, x)
+
+/* LAN969X ONLY */
+#define DEV2G5_PHAD_CTRL_DIV_CFG                 GENMASK(11, 9)
+#define DEV2G5_PHAD_CTRL_DIV_CFG_SET(x)\
+	FIELD_PREP(DEV2G5_PHAD_CTRL_DIV_CFG, x)
+#define DEV2G5_PHAD_CTRL_DIV_CFG_GET(x)\
+	FIELD_GET(DEV2G5_PHAD_CTRL_DIV_CFG, x)
+
 /* DEV10G:MAC_CFG_STATUS:MAC_ENA_CFG */
 #define DEV10G_MAC_ENA_CFG(t)                                                  \
 	__REG(TARGET_DEV10G, t, regs->tsize[TC_DEV10G], 0, 0, 1, 60, 0, 0, 1,  \
@@ -2869,6 +2907,11 @@ extern const struct sparx5_regs *regs;
 #define DEV10G_DEV_RST_CTRL_MAC_RX_RST_GET(x)\
 	FIELD_GET(DEV10G_DEV_RST_CTRL_MAC_RX_RST, x)
 
+/* DEV10G:DEV_CFG_STATUS:PTP_STAMPER_CFG */
+#define DEV10G_PTP_STAMPER_CFG(t)                                              \
+	__REG(TARGET_DEV10G, t, regs->tsize[TC_DEV10G], 436, 0, 1, 52, 20, 0,  \
+	      1, 4)
+
 /* DEV10G:PCS25G_CFG_STATUS:PCS25G_CFG */
 #define DEV10G_PCS25G_CFG(t)                                                   \
 	__REG(TARGET_DEV10G, t, regs->tsize[TC_DEV10G], 488, 0, 1, 32, 0, 0, 1,\
@@ -4267,6 +4310,11 @@ extern const struct sparx5_regs *regs;
 #define DEV5G_DEV_RST_CTRL_MAC_RX_RST_GET(x)\
 	FIELD_GET(DEV5G_DEV_RST_CTRL_MAC_RX_RST, x)
 
+/* DEV10G:DEV_CFG_STATUS:PTP_STAMPER_CFG */
+#define DEV5G_PTP_STAMPER_CFG(t)                                               \
+	__REG(TARGET_DEV5G, t, regs->tsize[TC_DEV5G], 436, 0, 1, 52, 20, 0, 1, \
+	      4)
+
 /* DSM:RAM_CTRL:RAM_INIT */
 #define DSM_RAM_INIT                                                           \
 	__REG(TARGET_DSM, 0, 1, 0, 0, 1, 4, 0, 0, 1, 4)
@@ -4444,6 +4492,27 @@ extern const struct sparx5_regs *regs;
 #define DSM_TAXI_CAL_CFG_CAL_PGM_ENA_GET(x)\
 	FIELD_GET(DSM_TAXI_CAL_CFG_CAL_PGM_ENA, x)
 
+/* LAN969X ONLY */
+#define DSM_TAXI_CAL_CFG_CAL_SEL_STAT            BIT(23)
+#define DSM_TAXI_CAL_CFG_CAL_SEL_STAT_SET(x)\
+	FIELD_PREP(DSM_TAXI_CAL_CFG_CAL_SEL_STAT, x)
+#define DSM_TAXI_CAL_CFG_CAL_SEL_STAT_GET(x)\
+	FIELD_GET(DSM_TAXI_CAL_CFG_CAL_SEL_STAT, x)
+
+/* LAN969X ONLY */
+#define DSM_TAXI_CAL_CFG_CAL_SWITCH              BIT(22)
+#define DSM_TAXI_CAL_CFG_CAL_SWITCH_SET(x)\
+	FIELD_PREP(DSM_TAXI_CAL_CFG_CAL_SWITCH, x)
+#define DSM_TAXI_CAL_CFG_CAL_SWITCH_GET(x)\
+	FIELD_GET(DSM_TAXI_CAL_CFG_CAL_SWITCH, x)
+
+/* LAN969X ONLY */
+#define DSM_TAXI_CAL_CFG_CAL_PGM_SEL             BIT(21)
+#define DSM_TAXI_CAL_CFG_CAL_PGM_SEL_SET(x)\
+	FIELD_PREP(DSM_TAXI_CAL_CFG_CAL_PGM_SEL, x)
+#define DSM_TAXI_CAL_CFG_CAL_PGM_SEL_GET(x)\
+	FIELD_GET(DSM_TAXI_CAL_CFG_CAL_PGM_SEL, x)
+
 /* EACL:ES2_KEY_SELECT_PROFILE:VCAP_ES2_KEY_SEL */
 #define EACL_VCAP_ES2_KEY_SEL(g, r)                                            \
 	__REG(TARGET_EACL, 0, 1, regs->gaddr[GA_EACL_ES2_KEY_SELECT_PROFILE],  \
@@ -6720,6 +6789,69 @@ extern const struct sparx5_regs *regs;
 	      regs->gcnt[GC_PTP_PHASE_DETECTOR_CTRL],                          \
 	      regs->gsize[GW_PTP_PHASE_DETECTOR_CTRL], 4, 0, 1, 4)
 
+/* LAN969X ONLY */
+/* DEVCPU_PTP:PTP_TS_FIFO:PTP_TWOSTEP_CTRL */
+#define PTP_TWOSTEP_CTRL                                                       \
+	__REG(TARGET_PTP, 0, 1, 612, 0, 1, 16, 0, 0, 1, 4)
+
+#define PTP_TWOSTEP_CTRL_PTP_OVWR_ENA            BIT(12)
+#define PTP_TWOSTEP_CTRL_PTP_OVWR_ENA_SET(x)\
+	FIELD_PREP(PTP_TWOSTEP_CTRL_PTP_OVWR_ENA, x)
+#define PTP_TWOSTEP_CTRL_PTP_OVWR_ENA_GET(x)\
+	FIELD_GET(PTP_TWOSTEP_CTRL_PTP_OVWR_ENA, x)
+
+#define PTP_TWOSTEP_CTRL_PTP_NXT                 BIT(11)
+#define PTP_TWOSTEP_CTRL_PTP_NXT_SET(x)\
+	FIELD_PREP(PTP_TWOSTEP_CTRL_PTP_NXT, x)
+#define PTP_TWOSTEP_CTRL_PTP_NXT_GET(x)\
+	FIELD_GET(PTP_TWOSTEP_CTRL_PTP_NXT, x)
+
+#define PTP_TWOSTEP_CTRL_PTP_VLD                 BIT(10)
+#define PTP_TWOSTEP_CTRL_PTP_VLD_SET(x)\
+	FIELD_PREP(PTP_TWOSTEP_CTRL_PTP_VLD, x)
+#define PTP_TWOSTEP_CTRL_PTP_VLD_GET(x)\
+	FIELD_GET(PTP_TWOSTEP_CTRL_PTP_VLD, x)
+
+#define PTP_TWOSTEP_CTRL_STAMP_TX                BIT(9)
+#define PTP_TWOSTEP_CTRL_STAMP_TX_SET(x)\
+	FIELD_PREP(PTP_TWOSTEP_CTRL_STAMP_TX, x)
+#define PTP_TWOSTEP_CTRL_STAMP_TX_GET(x)\
+	FIELD_GET(PTP_TWOSTEP_CTRL_STAMP_TX, x)
+
+#define PTP_TWOSTEP_CTRL_STAMP_PORT              GENMASK(8, 1)
+#define PTP_TWOSTEP_CTRL_STAMP_PORT_SET(x)\
+	FIELD_PREP(PTP_TWOSTEP_CTRL_STAMP_PORT, x)
+#define PTP_TWOSTEP_CTRL_STAMP_PORT_GET(x)\
+	FIELD_GET(PTP_TWOSTEP_CTRL_STAMP_PORT, x)
+
+#define PTP_TWOSTEP_CTRL_PTP_OVFL                BIT(0)
+#define PTP_TWOSTEP_CTRL_PTP_OVFL_SET(x)\
+	FIELD_PREP(PTP_TWOSTEP_CTRL_PTP_OVFL, x)
+#define PTP_TWOSTEP_CTRL_PTP_OVFL_GET(x)\
+	FIELD_GET(PTP_TWOSTEP_CTRL_PTP_OVFL, x)
+
+/* LAN969X ONLY */
+/* DEVCPU_PTP:PTP_TS_FIFO:PTP_TWOSTEP_STAMP_NSEC */
+#define PTP_TWOSTEP_STAMP_NSEC                                                 \
+	__REG(TARGET_PTP, 0, 1, 612, 0, 1, 16, 4, 0, 1, 4)
+
+#define PTP_TWOSTEP_STAMP_NSEC_NS                GENMASK(29, 0)
+#define PTP_TWOSTEP_STAMP_NSEC_NS_SET(x)\
+	FIELD_PREP(PTP_TWOSTEP_STAMP_NSEC_NS, x)
+#define PTP_TWOSTEP_STAMP_NSEC_NS_GET(x)\
+	FIELD_GET(PTP_TWOSTEP_STAMP_NSEC_NS, x)
+
+/* LAN969X ONLY */
+/* DEVCPU_PTP:PTP_TS_FIFO:PTP_TWOSTEP_STAMP_SUBNS */
+#define PTP_TWOSTEP_STAMP_SUBNS                                                \
+	__REG(TARGET_PTP, 0, 1, 612, 0, 1, 16, 8, 0, 1, 4)
+
+#define PTP_TWOSTEP_STAMP_SUBNS_NS               GENMASK(7, 0)
+#define PTP_TWOSTEP_STAMP_SUBNS_NS_SET(x)\
+	FIELD_PREP(PTP_TWOSTEP_STAMP_SUBNS_NS, x)
+#define PTP_TWOSTEP_STAMP_SUBNS_NS_GET(x)\
+	FIELD_GET(PTP_TWOSTEP_STAMP_SUBNS_NS, x)
+
 /* QFWD:SYSTEM:SWITCH_PORT_MODE */
 #define QFWD_SWITCH_PORT_MODE(r)                                               \
 	__REG(TARGET_QFWD, 0, 1, 0, 0, 1, 340, 0, r,                           \

-- 
2.34.1


