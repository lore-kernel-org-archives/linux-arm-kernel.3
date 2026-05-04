Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C0BBCD3430
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 14:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k+cBiRZ4X5MDENOygxFJep/5qJlzEzmK4R86tr4zNgY=; b=sChUtYzP2cQuLPxdrCsUoqeIay
	jpa9Q8LiXxcdwwl9A5m5KWpUA27DtmprsSeZy7kvntwijLkhwUE+UjdBKyon2gP9/OJ3plGKLqAPd
	eKZGajCzDgymGygKBUK0ZISf6o/YRcGI4zzgyqLo0musqkXnuuga+akfoFxtl87J670iM7+xCZs+c
	TvMCHZIm+Zrb86g9la53FB4HRLfw800GoArO3wA79HWOPewpBjSQwsuVGVUQPd5hYI1EBusuaTWoM
	CocdoPt4JDs0LK1FEfd84ppUCUbgL26YnoiHSjKNtgMNWel9vcxG690ngK4XYXo/WcC1o1ojgeIUL
	VO9JcdTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJuWt-0000000DUUc-0oJh;
	Mon, 04 May 2026 14:44:15 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJuWq-0000000DUSt-3nTY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 14:44:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1777905852; x=1809441852;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=MEHpsXH9lNIJOnJl8LRK8fvASgeNl0B9kl50QUAwWqE=;
  b=vAh2cZmqAEP/fbQjkcvGDiVtwi8Oz8dFL3eSwrjtxeHsFAXQ/00CJhWg
   8xozWbCAd6hg3Se4Z7ALSwPT+rFhl42NkMlIYs90EMdLxlW7HWQw0eva1
   TDg5wVdiehkXrDlcsfXAQTEZSZjWfQ+sFVFN5qExYH/WoDXbYFPisfsHP
   zdonlT/BGaY1FzV9vXoFQCpoZc628NE3k9+EJAS1bZC/ihTLOEbg+iiDD
   1r5SfvoUkSLTD1fefIQ1GT1PY+TieTaR8JPtqeoJ6tNBhODqywkOYl+Bb
   JtER2glL2j0fMBSpuSyJM+72QwRLNXikgZicEpJqKDfjRmZk9iQGD700a
   w==;
X-CSE-ConnectionGUID: f6FNNhZuRiuYZMD8mQLEXA==
X-CSE-MsgGUID: AB2JYIKvQpaCASb5LbruRA==
X-IronPort-AV: E=Sophos;i="6.23,215,1770620400"; 
   d="scan'208";a="57409533"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 04 May 2026 07:44:12 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 4 May 2026 07:44:11 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 4 May 2026 07:44:08 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Mon, 4 May 2026 16:43:45 +0200
Subject: [PATCH net 4/4] net: sparx5: configure serdes for 1000BASE-X in
 sparx5_port_init()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260504-misc-fixes-sparx5-lan969x-v1-4-6604306b5743@microchip.com>
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
X-CRM114-CacheID: sfid-20260504_074413_022971_A119FEF9 
X-CRM114-Status: GOOD (  12.57  )
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

sparx5_port_init() only invokes sparx5_serdes_set() and the associated
shadow-device enable and low-speed device switch for SGMII and QSGMII.
On any port with a high-speed primary device (DEV5G/DEV10G/DEV25G)
configured for 1000BASE-X the serdes is therefore left uninitialized,
the DEV2G5 shadow is never enabled, and the port stays pointed at its
high-speed device rather than the DEV2G5. The PCS1G block looks
healthy in isolation, but no frames reach the link partner.

Add 1000BASE-X to the check so the same three steps run.

Reported-by: Andrew Lunn <andrew@lunn.ch>
Fixes: 946e7fd5053a ("net: sparx5: add port module support")
Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 drivers/net/ethernet/microchip/sparx5/sparx5_port.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_port.c b/drivers/net/ethernet/microchip/sparx5/sparx5_port.c
index 04bc8fffaf96..62c49893de3c 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_port.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_port.c
@@ -1128,7 +1128,8 @@ int sparx5_port_init(struct sparx5 *sparx5,
 		DEV2G5_PCS1G_SD_CFG(port->portno));
 
 	if (conf->portmode == PHY_INTERFACE_MODE_QSGMII ||
-	    conf->portmode == PHY_INTERFACE_MODE_SGMII) {
+	    conf->portmode == PHY_INTERFACE_MODE_SGMII ||
+	    conf->portmode == PHY_INTERFACE_MODE_1000BASEX) {
 		err = sparx5_serdes_set(sparx5, port, conf);
 		if (err)
 			return err;

-- 
2.34.1


