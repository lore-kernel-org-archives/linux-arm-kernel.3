Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DAE7EA8115
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 13:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GddQrSsMcv4BQCPXSovTvSk6IIPZ64wxBTb0ny6IvUs=; b=X1uZruAY8yn9TYJNO3U3L9MkDn
	52B76J5p5DbD7mD3GRGXmZ512AgY3snRohuba8+PFjWoobkexcD+nx1O3/7wCnuYqJlIKuElTIF2+
	OL89UegeSwqRWp8lJEc+045F3Y555aUkrpCqSr+N4bblPyAFG2W9QWbGZ6zZNOQTE0ZM4HniTNhKR
	+RkDsdMMVQxWCXWrTdKHoHJv57Pv5AVPsd0caehyaRjJiDsp+wasH0wTmtw7YhotJM1TxoxJ5scRn
	i+XUtYv3ncNnwCjxiOyBrJd3GlPCV6t0bXqWlqU1SEPVO5UqbTCfoTForm+HYcGG03HN/KspH2c9W
	xU0IIycg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpo33-0000000H0SD-2RIN;
	Tue, 10 Feb 2026 13:45:01 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpo31-0000000H0RX-0dFR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 13:45:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1770731098; x=1802267098;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=EhL0tpkBrxubwpdX/Ve5B+6GSp3hJZb9E1BrHeOhcmU=;
  b=jwkWsfYvcHXuPYq97S70mUwFCwtNJ8oIpd9wcjT/VLhMxMpdwITLtO9l
   eN3avesK2lcUlqiGwycb0uLGXdUtjDvg6k2lLkQBY6mHHdoCz5ptEnEyv
   HGlB8ty95Fr20AmGuEYoISBqBLZnvek9dbQb1Hbiimg7367yaVjO53Trf
   /PSEFDinWar42nsTHikSpRldSJ2CqyWT9UumNWjf9Mm6JxAD76AFtq0Cu
   YR1VxSUDadU/YK1oleLNqdwtVMSqpL/hN5vJydNf9ohKuOV8vx6D+bZAP
   9fOHHSMO5WHNZnvzja7wsKwPkwWK5wTuW2J4CtqnCOPeQRLvUpaHPBRpp
   g==;
X-CSE-ConnectionGUID: p+szQNDPSrmTr8I0ZeLXsg==
X-CSE-MsgGUID: 21H4pAP7SHi08a/lT8ZIsA==
X-IronPort-AV: E=Sophos;i="6.21,283,1763449200"; 
   d="scan'208";a="52474411"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 06:44:56 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.35; Tue, 10 Feb 2026 06:44:26 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 10 Feb 2026 06:44:24 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Tue, 10 Feb 2026 14:44:01 +0100
Subject: [PATCH net] net: sparx5/lan969x: fix DWRR cost max to match
 hardware register width
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260210-sparx5-fix-dwrr-cost-max-v1-1-58fbdbc25652@microchip.com>
X-B4-Tracking: v=1; b=H4sIACA2i2kC/x2MQQqEMAwAvyI5G6gFi/oV8VDaVHOwSiJaEP++Z
 Y8DM/OCkjApTM0LQjcrH7lC1zYQNp9XQo6VwRrrjO0M6uml9Ji4YHxEMBx64e4LpsHFcXApht5
 AzU+hKv3XM2S6YPm+Hx0/ntBvAAAA
X-Change-ID: 20260210-sparx5-fix-dwrr-cost-max-f86d986fdc50
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Steen Hegelund
	<Steen.Hegelund@microchip.com>, <UNGLinuxDriver@microchip.com>
CC: <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_054459_377939_33B0334B 
X-CRM114-Status: GOOD (  11.32  )
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

DWRR (Deficit Weighted Round Robin) scheduling distributes bandwidth
across traffic classes based on per-queue cost values, where lower cost
means higher bandwidth share.

The SPX5_DWRR_COST_MAX constant is 63 (6 bits) but the hardware
register field HSCH_DWRR_ENTRY_DWRR_COST is GENMASK(24, 20), only
5 bits wide (max 31). This causes sparx5_weight_to_hw_cost() to
compute cost values that silently overflow via FIELD_PREP, resulting
in incorrect scheduling weights.

Set SPX5_DWRR_COST_MAX to 31 to match the hardware register width.

Fixes: 211225428d65 ("net: microchip: sparx5: add support for offloading ets qdisc")
Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 drivers/net/ethernet/microchip/sparx5/sparx5_qos.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_qos.h b/drivers/net/ethernet/microchip/sparx5/sparx5_qos.h
index 1231a80335d7..04f76f1e23f6 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_qos.h
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_qos.h
@@ -35,7 +35,7 @@
 #define SPX5_SE_BURST_UNIT 4096
 
 /* Dwrr */
-#define SPX5_DWRR_COST_MAX 63
+#define SPX5_DWRR_COST_MAX 31
 
 struct sparx5_shaper {
 	u32 mode;

---
base-commit: 9384a1d1897a809f073a0f8cc252b7a41f9c05ac
change-id: 20260210-sparx5-fix-dwrr-cost-max-f86d986fdc50

Best regards,
-- 
Daniel Machon <daniel.machon@microchip.com>


