Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4569BFF885A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 14:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XZrocbBBhGKITlbCj/RuyAz4hGKD61ETxLQuz3gXPZk=; b=aM9Av9KnoXpKd2dcAXICTT2v20
	T5YJ8CEA8WitWubxOufXfIV9GlOFKoX1mhAyDIbButwp/B5kB/k/VEztXAbSn4saqxRXERtTDjN7w
	6C6cEOvYG6h58f9ZxV7Aoe+Ihym/duWqbvbudrMULHE5c9fBYGyJY8Si7GsihvPQVEs9FPs2DMxHu
	wXyJOl1jSgA0eOnD3SQO0wVu2n3lNWXAMuihiAZ080ZmgOe4uRJJ2CZqufoTM1gOwkPrgvRzyB5Dj
	Q+FwQRhR6eE1RoGHNjLM5g7ZS2nrhye5XLh0DakLBx1HdmY2MkLp7CUbmmlk4PWoqb1g+nyMz4Zbp
	ADvpAtGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJuWp-0000000DUS5-3OND;
	Mon, 04 May 2026 14:44:11 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJuWn-0000000DUQs-1wla
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 14:44:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1777905850; x=1809441850;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=ij6m2Zw7qmqJMLa1sxeBDVQogIFh4XZl0pqMXbUT/vw=;
  b=a4fpQEqV318VjuZtEM59NL4AnqHHgwvkTQLUPAQ8gOACjECiWAUB2ntA
   2HpJp1R3l1DlqkSWlTajAF9atS3nR9DdgN3T8RWZEDJPWtRK1XX80PI/q
   T6uF3JvdLKW/HUnSARFGWwOj/rQ6c0KR+xsYpXdwffpmpSfkLcPz3yTGr
   OEDnnOzemj2xe34/eWotzPamWsTpKpsekAShBbPOANO1FXnEw4XZIMTrc
   iYLt59OWpaNr4piepGTOdDfZljfALD75djSfXIRlmoUlIvVdGjfBfJ2cl
   2NqMKcouGIXojYSvbPeMfZPCvn4ZriiTZe6uWtbsnPnFk0J/plp2VBUtC
   A==;
X-CSE-ConnectionGUID: T41Wt9DfSqeTX7IawbYxdQ==
X-CSE-MsgGUID: IadO+9T0SGyphG3GdFXGEw==
X-IronPort-AV: E=Sophos;i="6.23,215,1770620400"; 
   d="scan'208";a="288370927"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 04 May 2026 07:44:09 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 4 May 2026 07:44:08 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 4 May 2026 07:44:05 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Mon, 4 May 2026 16:43:44 +0200
Subject: [PATCH net 3/4] net: sparx5: fix wrong chip ids for TSN SKUs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260504-misc-fixes-sparx5-lan969x-v1-3-6604306b5743@microchip.com>
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
	<steen.hegelund@microchip.com>, <linux-rt-devel@lists.linux.dev>, Andrew Lunn
	<andrew@lunn.ch>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_074409_518299_4810D8F5 
X-CRM114-Status: GOOD (  12.54  )
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

The TSN SKUs in enum spx5_target_chiptype have incorrect IDs:

  SPX5_TARGET_CT_7546TSN    = 0x47546,
  SPX5_TARGET_CT_7549TSN    = 0x47549,
  SPX5_TARGET_CT_7552TSN    = 0x47552,
  SPX5_TARGET_CT_7556TSN    = 0x47556,
  SPX5_TARGET_CT_7558TSN    = 0x47558,

The value read back from the chip is GCB_CHIP_ID_PART_ID, which is a
GENMASK(27, 12) field, i.e. at most 16 bits wide. It can never match
these IDs, so probing a TSN part fails with a "Target not supported"
error.

Fix the enum to use the actual 16-bit part IDs returned by the
hardware: 0x0546, 0x0549, 0x0552, 0x0556 and 0x0558.

Reported-by: Andrew Lunn <andrew@lunn.ch>
Fixes: 3cfa11bac9bb ("net: sparx5: add the basic sparx5 driver")
Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 drivers/net/ethernet/microchip/sparx5/sparx5_main.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_main.h b/drivers/net/ethernet/microchip/sparx5/sparx5_main.h
index 8ef4050ceecc..70ca707b5ce4 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_main.h
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_main.h
@@ -31,11 +31,11 @@ enum spx5_target_chiptype {
 	SPX5_TARGET_CT_7552       = 0x7552,  /* SparX-5-128 Enterprise */
 	SPX5_TARGET_CT_7556       = 0x7556,  /* SparX-5-160 Enterprise */
 	SPX5_TARGET_CT_7558       = 0x7558,  /* SparX-5-200 Enterprise */
-	SPX5_TARGET_CT_7546TSN    = 0x47546, /* SparX-5-64i Industrial */
-	SPX5_TARGET_CT_7549TSN    = 0x47549, /* SparX-5-90i Industrial */
-	SPX5_TARGET_CT_7552TSN    = 0x47552, /* SparX-5-128i Industrial */
-	SPX5_TARGET_CT_7556TSN    = 0x47556, /* SparX-5-160i Industrial */
-	SPX5_TARGET_CT_7558TSN    = 0x47558, /* SparX-5-200i Industrial */
+	SPX5_TARGET_CT_7546TSN    = 0x0546,  /* SparX-5-64i Industrial */
+	SPX5_TARGET_CT_7549TSN    = 0x0549,  /* SparX-5-90i Industrial */
+	SPX5_TARGET_CT_7552TSN    = 0x0552,  /* SparX-5-128i Industrial */
+	SPX5_TARGET_CT_7556TSN    = 0x0556,  /* SparX-5-160i Industrial */
+	SPX5_TARGET_CT_7558TSN    = 0x0558,  /* SparX-5-200i Industrial */
 	SPX5_TARGET_CT_LAN9694    = 0x9694,  /* lan969x-40 */
 	SPX5_TARGET_CT_LAN9691VAO = 0x9691,  /* lan969x-40-VAO */
 	SPX5_TARGET_CT_LAN9694TSN = 0x9695,  /* lan969x-40-TSN */

-- 
2.34.1


