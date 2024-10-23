Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A71FD0BB42
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 22:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AbCamVsAAm7hkHH06xyk1OYRP1zvDvVb7sC8vjiDeEI=; b=mRgdrXLQdChkeZPLjqNPDooJrd
	IIIZYSRG3PDXK+RjzHuW3CwS59EXuG3p6PjkocRfWPHzgv0EqwIKnhLjSNcAo+e98spFOLNAGvFyy
	C0NJNC4jq17B3D7YopGKeJAn2c8+reMorTI8EHsZtfRhEWPu5Hu5fQKeD/qMuh8K1unz+zHSHiS4w
	TaKAcEx8UUo/kY42j3VUIQ07D/swsm3VR+R9BDqYobJ9N5dsGvzgXEuP76z8Wz69iZF10EmLJqgel
	jppckAnV7rnEI1WTV5/7W4JGii3xQOYXSTwocGYpX8qTWS8nMKtRDOkLwz2/wR0iXBZBMhmMNwvlZ
	zi/NZbeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3jdv-0000000G4N3-2sC3;
	Wed, 23 Oct 2024 22:15:51 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3jRB-0000000G2Eo-0LHw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 22:02:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1729720960; x=1761256960;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=TvHR8qKlsEZ/gYU9wdk5E7vu890MusslQxca3KuHjs0=;
  b=k1QeqSVLsd6DRLkjqSJWGNr4DuMmuqtexCd/wohzaSJEd/38NYMgftr1
   jG3dzVsOM57ePQT4AQbGgMauKD4015OsbKCAfW7lhWJyBI9M5JFPOXtcu
   XnIoBwxoxslhBGr6QTfOPFzOmPB2oPHh2tD9np8HYyXLuVD31hNclVTcV
   cc0AOO2sqRSCmxr7UTENwoCPkZfM//vK0yTQZzo+PeyesMJ+1GX5YFtyM
   smCkbg5UHBWGvkY+EDbOdVtYZcek7bim0PNMbQBtgqUHzeMFxwE/R6LBQ
   6bPyGuIUGhvEIaCGc0kCamuJloQUid0F3Un+HSkcO9yBNweJLX+sRoQuV
   A==;
X-CSE-ConnectionGUID: wd8IJW4NTJ64cR86gqDN2Q==
X-CSE-MsgGUID: KM0LWttpTwaDnBlVitA/WA==
X-IronPort-AV: E=Sophos;i="6.11,227,1725346800"; 
   d="scan'208";a="200831269"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 23 Oct 2024 15:02:36 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 23 Oct 2024 15:02:12 -0700
Received: from DEN-DL-M70577.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Wed, 23 Oct 2024 15:02:08 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Thu, 24 Oct 2024 00:01:27 +0200
Subject: [PATCH net-next v2 08/15] net: lan969x: add constants to match
 data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241024-sparx5-lan969x-switch-driver-2-v2-8-a0b5fae88a0f@microchip.com>
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
X-CRM114-CacheID: sfid-20241023_150241_295936_35A51F66 
X-CRM114-Status: GOOD (  10.70  )
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

Add the lan969x constants to match data. These are already used
throughout the Sparx5 code (introduced in earlier series [1]), so no
need to update any code use.

[1] https://lore.kernel.org/netdev/20241004-b4-sparx5-lan969x-switch-driver-v2-0-d3290f581663@microchip.com/

Reviewed-by: Steen Hegelund <Steen.Hegelund@microchip.com>
Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 drivers/net/ethernet/microchip/lan969x/lan969x.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/net/ethernet/microchip/lan969x/lan969x.c b/drivers/net/ethernet/microchip/lan969x/lan969x.c
index 0b47e4e66058..19f91e4a9f3e 100644
--- a/drivers/net/ethernet/microchip/lan969x/lan969x.c
+++ b/drivers/net/ethernet/microchip/lan969x/lan969x.c
@@ -103,11 +103,32 @@ static const struct sparx5_regs lan969x_regs = {
 	.fsize = lan969x_fsize,
 };
 
+static const struct sparx5_consts lan969x_consts = {
+	.n_ports             = 30,
+	.n_ports_all         = 35,
+	.n_hsch_l1_elems     = 32,
+	.n_hsch_queues       = 4,
+	.n_lb_groups         = 5,
+	.n_pgids             = 1054, /* (1024 + n_ports) */
+	.n_sio_clks          = 1,
+	.n_own_upsids        = 1,
+	.n_auto_cals         = 4,
+	.n_filters           = 256,
+	.n_gates             = 256,
+	.n_sdlbs             = 496,
+	.n_dsm_cal_taxis     = 5,
+	.buf_size            = 1572864,
+	.qres_max_prio_idx   = 315,
+	.qres_max_colour_idx = 323,
+	.tod_pin             = 4,
+};
+
 const struct sparx5_match_data lan969x_desc = {
 	.iomap      = lan969x_main_iomap,
 	.iomap_size = ARRAY_SIZE(lan969x_main_iomap),
 	.ioranges   = 2,
 	.regs       = &lan969x_regs,
+	.consts     = &lan969x_consts,
 };
 EXPORT_SYMBOL_GPL(lan969x_desc);
 

-- 
2.34.1


