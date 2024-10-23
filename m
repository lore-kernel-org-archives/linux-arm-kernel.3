Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08D3BD0BB41
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 22:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EcgawFVqirzh/RoiinJTaud9EYPan3o+3M37lbhTMeY=; b=HEmozdGYOx1yzbGqr6tJk2VO4k
	YF7mG1PTfcHK2ojGG/CTQ+7fjQk/umQ8eBVBtGb7lnYNYhItSVcAfcPopjlcmYjyZODpv8jnjoSTY
	2OlL+eg4eGxHQFWaYCmv0N4Qq+wdZ4/5ntJGMXjfxYmheYrrfbkhQ4ZB4CK58QjOjECD00MOgmioW
	KEySATMbrMSbwLXGs+OVQt/waV380hmS3aR4gQg6N4P/fO+Dxh06UZSlVPg8ViACaayCOB8BV8rzs
	UBE+p7gFtaasWdo/pCA1hbOlPLKXqWZ2DAzX1Co0X4pLyy6k06CHcdfMK357UW6zqV4yzsZJCjicA
	Lzte37zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3jTM-0000000G2tx-3qSD;
	Wed, 23 Oct 2024 22:04:56 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3jQb-0000000G26w-0JGF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 22:02:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1729720925; x=1761256925;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=MuJJ4LlvyejvlG7OuIrz3VoNCIapqHE4HSNFdd4Yb14=;
  b=DVPq1889OqE51KRlkTVYYq4+DC+xPsEXlArEqKAmdKGCb9OU47EhnKDR
   4x88TE5MbNhQtJcyU2ZkwUwPPxxzawvcqjyLbKxaiFogKH0ZFnw+/xBzO
   cZLWozFkKz3EDWQ5ytVID2nx6itZd5+rrc1qXNy1IqmBGHOdnUUDpGHqW
   3RqdSKXcECwtJGbOsY28p2wScBeFaAMpsDP5qgMuxMADvMMxGJy9cs6Tb
   coMlqki0RVv5FGmnLuF5WVZk1Nyoanr+EjuYtJ2gHHuML9MS2hojaoWWs
   v3E67iJ0himVifUh2k4g5A1ryfQ6RwiwIeWiCA/UEuLEkjXuFT4K+0gyd
   w==;
X-CSE-ConnectionGUID: 1Xapdzk8QAqz3uJYdYtrIg==
X-CSE-MsgGUID: lG8inuBvTbidbLV9WE2aLQ==
X-IronPort-AV: E=Sophos;i="6.11,227,1725346800"; 
   d="scan'208";a="33409628"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 23 Oct 2024 15:02:03 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 23 Oct 2024 15:01:42 -0700
Received: from DEN-DL-M70577.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Wed, 23 Oct 2024 15:01:38 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Thu, 24 Oct 2024 00:01:20 +0200
Subject: [PATCH net-next v2 01/15] net: sparx5: add support for lan969x
 targets and core clock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241024-sparx5-lan969x-switch-driver-2-v2-1-a0b5fae88a0f@microchip.com>
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
X-CRM114-CacheID: sfid-20241023_150205_164837_321DA55D 
X-CRM114-Status: GOOD (  15.37  )
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

In preparation for lan969x, add lan969x targets to
sparx5_target_chiptype and set the core clock frequency for these
throughout. Lan969x only supports a core clock frequency of 328MHz.

Also, set the policer update internal (pol_upd_int) matching the 328 MHz
frequency of the lan969x targets.

Reviewed-by: Steen Hegelund <Steen.Hegelund@microchip.com>
Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 .../ethernet/microchip/sparx5/sparx5_calendar.c    | 17 +++++++++++
 .../net/ethernet/microchip/sparx5/sparx5_main.c    | 16 ++++++++++
 .../net/ethernet/microchip/sparx5/sparx5_main.h    | 35 +++++++++++++++-------
 drivers/net/ethernet/microchip/sparx5/sparx5_ptp.c |  6 ++++
 4 files changed, 64 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_calendar.c b/drivers/net/ethernet/microchip/sparx5/sparx5_calendar.c
index b2a8d04ab509..1ae56194637f 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_calendar.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_calendar.c
@@ -53,6 +53,22 @@ static u32 sparx5_target_bandwidth(struct sparx5 *sparx5)
 	case SPX5_TARGET_CT_7558:
 	case SPX5_TARGET_CT_7558TSN:
 		return 201000;
+	case SPX5_TARGET_CT_LAN9691VAO:
+		return 46000;
+	case SPX5_TARGET_CT_LAN9694RED:
+	case SPX5_TARGET_CT_LAN9694TSN:
+	case SPX5_TARGET_CT_LAN9694:
+		return 68000;
+	case SPX5_TARGET_CT_LAN9696RED:
+	case SPX5_TARGET_CT_LAN9696TSN:
+	case SPX5_TARGET_CT_LAN9692VAO:
+	case SPX5_TARGET_CT_LAN9696:
+		return 88000;
+	case SPX5_TARGET_CT_LAN9698RED:
+	case SPX5_TARGET_CT_LAN9698TSN:
+	case SPX5_TARGET_CT_LAN9693VAO:
+	case SPX5_TARGET_CT_LAN9698:
+		return 101000;
 	default:
 		return 0;
 	}
@@ -74,6 +90,7 @@ static u32 sparx5_clk_to_bandwidth(enum sparx5_core_clockfreq cclock)
 {
 	switch (cclock) {
 	case SPX5_CORE_CLOCK_250MHZ: return 83000; /* 250000 / 3 */
+	case SPX5_CORE_CLOCK_328MHZ: return 109375; /* 328000 / 3 */
 	case SPX5_CORE_CLOCK_500MHZ: return 166000; /* 500000 / 3 */
 	case SPX5_CORE_CLOCK_625MHZ: return  208000; /* 625000 / 3 */
 	default: return 0;
diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
index d1e9bc030c80..9da755c8b894 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
@@ -475,6 +475,20 @@ static int sparx5_init_coreclock(struct sparx5 *sparx5)
 		else if (sparx5->coreclock == SPX5_CORE_CLOCK_250MHZ)
 			freq = 0; /* Not supported */
 		break;
+	case SPX5_TARGET_CT_LAN9694:
+	case SPX5_TARGET_CT_LAN9691VAO:
+	case SPX5_TARGET_CT_LAN9694TSN:
+	case SPX5_TARGET_CT_LAN9694RED:
+	case SPX5_TARGET_CT_LAN9696:
+	case SPX5_TARGET_CT_LAN9692VAO:
+	case SPX5_TARGET_CT_LAN9696TSN:
+	case SPX5_TARGET_CT_LAN9696RED:
+	case SPX5_TARGET_CT_LAN9698:
+	case SPX5_TARGET_CT_LAN9693VAO:
+	case SPX5_TARGET_CT_LAN9698TSN:
+	case SPX5_TARGET_CT_LAN9698RED:
+		freq = SPX5_CORE_CLOCK_328MHZ;
+		break;
 	default:
 		dev_err(sparx5->dev, "Target (%#04x) not supported\n",
 			sparx5->target_ct);
@@ -516,6 +530,8 @@ static int sparx5_init_coreclock(struct sparx5 *sparx5)
 			 CLKGEN_LCPLL1_CORE_CLK_CFG_CORE_ROT_ENA |
 			 CLKGEN_LCPLL1_CORE_CLK_CFG_CORE_CLK_ENA,
 			 sparx5, CLKGEN_LCPLL1_CORE_CLK_CFG);
+	} else {
+		pol_upd_int = 820; // SPX5_CORE_CLOCK_328MHZ
 	}
 
 	/* Update state with chosen frequency */
diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_main.h b/drivers/net/ethernet/microchip/sparx5/sparx5_main.h
index 364ae92969bc..f117cf65cf8c 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_main.h
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_main.h
@@ -26,16 +26,28 @@
 
 /* Target chip type */
 enum spx5_target_chiptype {
-	SPX5_TARGET_CT_7546    = 0x7546,  /* SparX-5-64  Enterprise */
-	SPX5_TARGET_CT_7549    = 0x7549,  /* SparX-5-90  Enterprise */
-	SPX5_TARGET_CT_7552    = 0x7552,  /* SparX-5-128 Enterprise */
-	SPX5_TARGET_CT_7556    = 0x7556,  /* SparX-5-160 Enterprise */
-	SPX5_TARGET_CT_7558    = 0x7558,  /* SparX-5-200 Enterprise */
-	SPX5_TARGET_CT_7546TSN = 0x47546, /* SparX-5-64i Industrial */
-	SPX5_TARGET_CT_7549TSN = 0x47549, /* SparX-5-90i Industrial */
-	SPX5_TARGET_CT_7552TSN = 0x47552, /* SparX-5-128i Industrial */
-	SPX5_TARGET_CT_7556TSN = 0x47556, /* SparX-5-160i Industrial */
-	SPX5_TARGET_CT_7558TSN = 0x47558, /* SparX-5-200i Industrial */
+	SPX5_TARGET_CT_7546       = 0x7546,  /* SparX-5-64  Enterprise */
+	SPX5_TARGET_CT_7549       = 0x7549,  /* SparX-5-90  Enterprise */
+	SPX5_TARGET_CT_7552       = 0x7552,  /* SparX-5-128 Enterprise */
+	SPX5_TARGET_CT_7556       = 0x7556,  /* SparX-5-160 Enterprise */
+	SPX5_TARGET_CT_7558       = 0x7558,  /* SparX-5-200 Enterprise */
+	SPX5_TARGET_CT_7546TSN    = 0x47546, /* SparX-5-64i Industrial */
+	SPX5_TARGET_CT_7549TSN    = 0x47549, /* SparX-5-90i Industrial */
+	SPX5_TARGET_CT_7552TSN    = 0x47552, /* SparX-5-128i Industrial */
+	SPX5_TARGET_CT_7556TSN    = 0x47556, /* SparX-5-160i Industrial */
+	SPX5_TARGET_CT_7558TSN    = 0x47558, /* SparX-5-200i Industrial */
+	SPX5_TARGET_CT_LAN9694    = 0x9694,  /* lan969x-40 */
+	SPX5_TARGET_CT_LAN9691VAO = 0x9691,  /* lan969x-40-VAO */
+	SPX5_TARGET_CT_LAN9694TSN = 0x9695,  /* lan969x-40-TSN */
+	SPX5_TARGET_CT_LAN9694RED = 0x969A,  /* lan969x-40-RED */
+	SPX5_TARGET_CT_LAN9696    = 0x9696,  /* lan969x-60 */
+	SPX5_TARGET_CT_LAN9692VAO = 0x9692,  /* lan969x-65-VAO */
+	SPX5_TARGET_CT_LAN9696TSN = 0x9697,  /* lan969x-60-TSN */
+	SPX5_TARGET_CT_LAN9696RED = 0x969B,  /* lan969x-60-RED */
+	SPX5_TARGET_CT_LAN9698    = 0x9698,  /* lan969x-100 */
+	SPX5_TARGET_CT_LAN9693VAO = 0x9693,  /* lan969x-100-VAO */
+	SPX5_TARGET_CT_LAN9698TSN = 0x9699,  /* lan969x-100-TSN */
+	SPX5_TARGET_CT_LAN9698RED = 0x969C,  /* lan969x-100-RED */
 };
 
 enum sparx5_port_max_tags {
@@ -192,6 +204,7 @@ struct sparx5_port {
 enum sparx5_core_clockfreq {
 	SPX5_CORE_CLOCK_DEFAULT,  /* Defaults to the highest supported frequency */
 	SPX5_CORE_CLOCK_250MHZ,   /* 250MHZ core clock frequency */
+	SPX5_CORE_CLOCK_328MHZ,   /* 328MHZ core clock frequency */
 	SPX5_CORE_CLOCK_500MHZ,   /* 500MHZ core clock frequency */
 	SPX5_CORE_CLOCK_625MHZ,   /* 625MHZ core clock frequency */
 };
@@ -641,6 +654,8 @@ static inline u32 sparx5_clk_period(enum sparx5_core_clockfreq cclock)
 	switch (cclock) {
 	case SPX5_CORE_CLOCK_250MHZ:
 		return 4000;
+	case SPX5_CORE_CLOCK_328MHZ:
+		return 3048;
 	case SPX5_CORE_CLOCK_500MHZ:
 		return 2000;
 	case SPX5_CORE_CLOCK_625MHZ:
diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_ptp.c b/drivers/net/ethernet/microchip/sparx5/sparx5_ptp.c
index 9b15e44f9e64..a511f14312f1 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_ptp.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_ptp.c
@@ -38,6 +38,9 @@ static u64 sparx5_ptp_get_1ppm(struct sparx5 *sparx5)
 	case SPX5_CORE_CLOCK_250MHZ:
 		res = 2301339409586;
 		break;
+	case SPX5_CORE_CLOCK_328MHZ:
+		res = 1756832768924;
+		break;
 	case SPX5_CORE_CLOCK_500MHZ:
 		res = 1150669704793;
 		break;
@@ -60,6 +63,9 @@ static u64 sparx5_ptp_get_nominal_value(struct sparx5 *sparx5)
 	case SPX5_CORE_CLOCK_250MHZ:
 		res = 0x1FF0000000000000;
 		break;
+	case SPX5_CORE_CLOCK_328MHZ:
+		res = 0x18604697DD0F9B5B;
+		break;
 	case SPX5_CORE_CLOCK_500MHZ:
 		res = 0x0FF8000000000000;
 		break;

-- 
2.34.1


