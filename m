Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2D55CA6019
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 11:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zVj5EgFaUt8CCt70Iab1iZaQupj1cmsmhDjchvWpN7M=; b=yY8rr/h78u/pZX2Mrt7n7OWQQk
	+3DPN/ObovwsEjfJ+Lk356A+fJ1bk7FZhM5fofQJqrAYqxlo72/Qmf3I9Po/6EIuMOd9CfguVjCvo
	6J+vULXGTKyFbjsfp/xq5nLd8QYR46aaD9vMikRrTHPypLZf4oXoGrxSDj29ZpdSkJT5GQhpzwR2j
	j6B/Tx/xPKqJGRLROnMfHxtNzZofWzfTLjCBf+YKYcHm57RpqcORLtC5K+UgTvM5lJoNtPwzRiJtD
	0uqEnzuUn7KLhv2N19h5uWnUSaTFoC5SNlXSsy1478g9JHZmL+eyf+rOC1TbhR7SXzSF1jcxV/5Pm
	Tx0OMMSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF9Aq-00000006Ewe-3y0m;
	Fri, 09 Oct 2026 11:54:05 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF9Ao-00000006Evk-2H12
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 11:54:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1791546841; x=1823082841;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=k/DrZwt/txbghk+oMMW0njAMHR9UDJrkO1aW5QekoK0=;
  b=mwvgUD0WmPu/mpqYw3kHupQRzbZVmTBVce+FNRChFYr0mafk+ft7m7Fs
   8DapDtyw1m+yhgrnT3U6uYX7ANRTp8JmrhZ/CxSswb6aS2x863ez1o4uT
   pp1afK8y+Uw8vyPohE5oNcwWgHsmuzj2/YhiOg6WNMXKtUOyr+iGPVEa0
   zlYG9Nath2JkB4vrZHUBGeE+r66JjSzOASA9Ek3G0gkISgpzJJeAjRTp1
   bpiY9bB1lg0or1JYXupp0KtOhcd6Th7cB8SuEgdU0prcK4OEyfastbz3G
   ct3BdoA2KMKDvxdAti2GRJUOVuQM7nUkeqyRwYNUYYASxI3400YqFs2dv
   g==;
X-CSE-ConnectionGUID: 9phGX3nYQDuSN3q6/otKsQ==
X-CSE-MsgGUID: e9XyN5OeS6iFJxBjHIsDDA==
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="65089128"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Oct 2026 04:54:00 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 9 Oct 2026 04:54:01 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Fri, 9 Oct 2026 04:53:59 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Fri, 9 Oct 2026 13:52:01 +0200
Subject: [PATCH net-next 1/5] net: sparx5: Drop redundant POL_ prefix from
 POL_UPD_INT_CFG
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261009-b4-lan966x-pci-fdma-sparx5-lan969x-port-policers-v1-1-4916708a7ea2@microchip.com>
References: <20261009-b4-lan966x-pci-fdma-sparx5-lan969x-port-policers-v1-0-4916708a7ea2@microchip.com>
In-Reply-To: <20261009-b4-lan966x-pci-fdma-sparx5-lan969x-port-policers-v1-0-4916708a7ea2@microchip.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Steen Hegelund
	<Steen.Hegelund@microchip.com>, <UNGLinuxDriver@microchip.com>
CC: <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Daniel Machon <daniel.machon@microchip.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_045402_616924_6F5EAB2D 
X-CRM114-Status: GOOD (  11.16  )
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

The macros for the ANA_AC_POL:POL_UPD_INT_CFG register are named
ANA_AC_POL_POL_UPD_INT_CFG*, repeating the POL_ prefix that is already
part of the target name.

Rename them to ANA_AC_POL_UPD_INT_CFG*, so that the port policer
registers added in the next patch can use the same short form.

No functional change.

Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 drivers/net/ethernet/microchip/sparx5/sparx5_main.c      |  6 +++---
 drivers/net/ethernet/microchip/sparx5/sparx5_main_regs.h | 12 ++++++------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
index b530fb6d3d0c..4655de43f042 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
@@ -616,10 +616,10 @@ static int sparx5_init_coreclock(struct sparx5 *sparx5)
 		 sparx5,
 		 HSCH_TAS_STATEMACHINE_CFG);
 
-	spx5_rmw(ANA_AC_POL_POL_UPD_INT_CFG_POL_UPD_INT_SET(pol_upd_int),
-		 ANA_AC_POL_POL_UPD_INT_CFG_POL_UPD_INT,
+	spx5_rmw(ANA_AC_POL_UPD_INT_CFG_POL_UPD_INT_SET(pol_upd_int),
+		 ANA_AC_POL_UPD_INT_CFG_POL_UPD_INT,
 		 sparx5,
-		 ANA_AC_POL_POL_UPD_INT_CFG);
+		 ANA_AC_POL_UPD_INT_CFG);
 
 	return 0;
 }
diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_main_regs.h b/drivers/net/ethernet/microchip/sparx5/sparx5_main_regs.h
index d34467513648..7ae4f7ed8e50 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_main_regs.h
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_main_regs.h
@@ -939,15 +939,15 @@ extern const struct sparx5_regs *regs;
 	FIELD_GET(ANA_ACL_SEC_LOOKUP_STICKY_SEC_TYPE_MAC_ETYPE_STICKY, x)
 
 /* ANA_AC_POL:POL_ALL_CFG:POL_UPD_INT_CFG */
-#define ANA_AC_POL_POL_UPD_INT_CFG                                             \
+#define ANA_AC_POL_UPD_INT_CFG                                                 \
 	__REG(TARGET_ANA_AC_POL, 0, 1, regs->gaddr[GA_ANA_AC_POL_POL_ALL_CFG], \
 	      0, 1, 1160, 1148, 0, 1, 4)
 
-#define ANA_AC_POL_POL_UPD_INT_CFG_POL_UPD_INT   GENMASK(9, 0)
-#define ANA_AC_POL_POL_UPD_INT_CFG_POL_UPD_INT_SET(x)\
-	FIELD_PREP(ANA_AC_POL_POL_UPD_INT_CFG_POL_UPD_INT, x)
-#define ANA_AC_POL_POL_UPD_INT_CFG_POL_UPD_INT_GET(x)\
-	FIELD_GET(ANA_AC_POL_POL_UPD_INT_CFG_POL_UPD_INT, x)
+#define ANA_AC_POL_UPD_INT_CFG_POL_UPD_INT       GENMASK(9, 0)
+#define ANA_AC_POL_UPD_INT_CFG_POL_UPD_INT_SET(x)\
+	FIELD_PREP(ANA_AC_POL_UPD_INT_CFG_POL_UPD_INT, x)
+#define ANA_AC_POL_UPD_INT_CFG_POL_UPD_INT_GET(x)\
+	FIELD_GET(ANA_AC_POL_UPD_INT_CFG_POL_UPD_INT, x)
 
 /* ANA_AC_POL:COMMON_BDLB:DLB_CTRL */
 #define ANA_AC_POL_BDLB_DLB_CTRL                                               \

-- 
2.34.1


