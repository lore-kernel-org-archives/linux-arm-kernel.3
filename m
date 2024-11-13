Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86D2ED637C9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 21:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7d94Nq+mb7vSH9z9gtDeaDn4+mxP1sHMouqj/vxddJs=; b=kdzUPr+JOuxGt8cc6oBVSVNhTN
	lc5UxAklF+u1wQbW1agoEJkYUpF3NfeS6cSqpTxki2qTNK8vKfRKxlYId+DKda0vHbfkYGkykZYpD
	Y28eevW3g4T1NCHi3ruWzKQCkG4l9zEhg7sPeVywkmTPDebR5zXRxT7xkKafMue3FX5zkKs29g0Q8
	rVYpFRNYA403VnzOsimkLizG5m70v1O2RYoPm61JkB/EbZB6wNagMmcul3qpxCQnBjp82S0Es9Ic8
	1Vluvlt8ywSU1TWsCmRqvOvXk/JU26wPo7w5Hap45y1n4FlIHUn50LXmfriiDr4e4vOH0jU4BSBom
	Gtb1QluA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBKr0-000000084J8-3y4u;
	Wed, 13 Nov 2024 21:24:46 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBKf7-000000082Mz-0LO4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Nov 2024 21:12:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1731532349; x=1763068349;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=RcHLfgcSHz1AR6bIJm3t4pmOATMcmKjLpWbNz628tX0=;
  b=Mmvmgxs7c2Lbn2xvY8bN4B+m+p5d6XOeKGHNZcFa9ZfU7aEN7AI5Dukc
   v/etyDouV+IXEiFD7j/vU8rOaGTAd8Kr609bWkXTorI1uGtbiXPV6eJkh
   wZhHaOD/HZeF12y+3QLBiotYXF7G1BptF8vPCRVd80oNbfgxsxtxKjfWu
   nn9h785C2wSaDaHP0GokW4xZkSq6voSZRrh1vmVm3WwDZEJ4L/SN8I1s6
   Em1jSvyCQDKCgOmKYy7ySZNFm+n45gRmMRzLRTiNOJXRA43P8flkCwtQR
   Ui9KtryeGBHNWkkQO5tZKwl/EHw5cBWftZGEJo9Lgfnx8GS/Iy0F3Voyj
   A==;
X-CSE-ConnectionGUID: F8Mv1SaFTZWcTt5A65WwiA==
X-CSE-MsgGUID: PlvVJhjRTS2zbkXVkrCmNw==
X-IronPort-AV: E=Sophos;i="6.12,152,1728975600"; 
   d="scan'208";a="34014109"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 13 Nov 2024 14:12:24 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 13 Nov 2024 14:11:50 -0700
Received: from DEN-DL-M70577.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Wed, 13 Nov 2024 14:11:47 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Wed, 13 Nov 2024 22:11:13 +0100
Subject: [PATCH net-next v2 5/8] net: sparx5: verify RGMII speeds
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241113-sparx5-lan969x-switch-driver-4-v2-5-0db98ac096d1@microchip.com>
References: <20241113-sparx5-lan969x-switch-driver-4-v2-0-0db98ac096d1@microchip.com>
In-Reply-To: <20241113-sparx5-lan969x-switch-driver-4-v2-0-0db98ac096d1@microchip.com>
To: <UNGLinuxDriver@microchip.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "Lars
 Povlsen" <lars.povlsen@microchip.com>, Steen Hegelund
	<Steen.Hegelund@microchip.com>, Horatiu Vultur
	<horatiu.vultur@microchip.com>, Russell King <linux@armlinux.org.uk>,
	<jacob.e.keller@intel.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
X-Mailer: b4 0.14-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_131229_682190_792AE36D 
X-CRM114-Status: UNSURE (   9.62  )
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

When doing a port config, we verify the port speed against the PHY mode
and supported speeds of that PHY mode.

Add checks for the four RGMII phy modes: RGMII, RGMII_ID, RGMII_TXID and
RGMII_RXID.

Reviewed-by: Steen Hegelund <Steen.Hegelund@microchip.com>
Reviewed-by: Horatiu Vultur <horatiu.vultur@microchip.com>
Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 drivers/net/ethernet/microchip/sparx5/sparx5_port.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_port.c b/drivers/net/ethernet/microchip/sparx5/sparx5_port.c
index b494970752fd..9f0f687bd994 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_port.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_port.c
@@ -257,6 +257,15 @@ static int sparx5_port_verify_speed(struct sparx5 *sparx5,
 		     conf->speed != SPEED_25000))
 			return sparx5_port_error(port, conf, SPX5_PERR_SPEED);
 		break;
+	case PHY_INTERFACE_MODE_RGMII:
+	case PHY_INTERFACE_MODE_RGMII_ID:
+	case PHY_INTERFACE_MODE_RGMII_TXID:
+	case PHY_INTERFACE_MODE_RGMII_RXID:
+		if (conf->speed != SPEED_1000 &&
+		    conf->speed != SPEED_100 &&
+		    conf->speed != SPEED_10)
+			return sparx5_port_error(port, conf, SPX5_PERR_SPEED);
+		break;
 	default:
 		return sparx5_port_error(port, conf, SPX5_PERR_IFTYPE);
 	}

-- 
2.34.1


