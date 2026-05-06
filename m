Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98A31CD3424
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 07:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wnUM6RrYruKQMrMk4JZNxgt+Rsgu7BvOTvQGVuYSDt0=; b=S7uVzBuYdvJ3acbwZVIGf1sK+Y
	7kYysnV80iwGC1swwKLWVhT7SPM7wNWofnqxuGpQsPoD3D2P/ZVPTp0TvYTCV6yJqscMCowUyajZF
	fJrAC1RddH+fRPB++cZsMguM1U5mkMFbqmLXzp8VcYeauyy/LFgeVCa0CLyCCRscJQGsn0AfulIh+
	6eXr01nagLfbMqL1l33/r1WdNfHwaOqd8WV967OmI884AueTYHREyJdDsueey5S/S8gOWM7477gJh
	uTuzdDoEYprse0QE+JtY90gyXZZBBGJjnto13+GKedfHC23zYK0/sYRvSpH1t1UZJ62MqzJrdMeg0
	bwdk/gLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKWeG-000000001JN-3Fi1;
	Wed, 06 May 2026 07:26:24 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKWeF-000000001IU-25q9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 07:26:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1778052383; x=1809588383;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=619p+RzrpqmDK4uuw5RRQJ+j6sdBsG4AloG918xNeJE=;
  b=xK5GeinFUlxREBrpF3laA18I7u6f78eAAqNy3Txu46wGd/QQrSwvFx7E
   UdWzX7n4LYscMgL9s2/JnxpskHu3Bkojw5aSQKqNaNUH3sDgLUgE286fN
   Ad8HZbNWD3Ly8JSPAN513HN4UG2C3GF7M/5rZ/mcroHLbsB6xh0RAFdnU
   52b5zldlpdQjPDx7Sc2BHZ9OXkHSlavKKK9ONwPrlnVLcC9MyawZ04BrW
   bdq9gByIdV9Lmd8H1wrmZwY1va8Cd3K7zo+vq8I5UhkXBVA9fe5reYhOb
   gJLKk/y/SLIGGcZ+V5QGV6FOLgiq5oAKzPC9WyoOMqwqUHTxi2KKQV5ys
   w==;
X-CSE-ConnectionGUID: NddUM9SwQN+U4k2D3/Zahg==
X-CSE-MsgGUID: 3sJC9WEQSLe3yX2/JKra7w==
X-IronPort-AV: E=Sophos;i="6.23,219,1770620400"; 
   d="scan'208";a="288477306"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 00:26:23 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.37; Wed, 6 May 2026 00:26:22 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Wed, 6 May 2026 00:26:18 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Wed, 6 May 2026 09:25:39 +0200
Subject: [PATCH net v2 4/4] net: sparx5: configure serdes for 1000BASE-X in
 sparx5_port_init()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260506-misc-fixes-sparx5-lan969x-v2-4-fb236aa96908@microchip.com>
References: <20260506-misc-fixes-sparx5-lan969x-v2-0-fb236aa96908@microchip.com>
In-Reply-To: <20260506-misc-fixes-sparx5-lan969x-v2-0-fb236aa96908@microchip.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Steen Hegelund
	<Steen.Hegelund@microchip.com>, <UNGLinuxDriver@microchip.com>, "Sebastian
 Andrzej Siewior" <bigeasy@linutronix.de>, Clark Williams
	<clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Bjarni Jonasson
	<bjarni.jonasson@microchip.com>, Lars Povlsen <lars.povlsen@microchip.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, <kees@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Steen Hegelund
	<steen.hegelund@microchip.com>, <linux-rt-devel@lists.linux.dev>, Andrew Lunn
	<andrew@lunn.ch>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_002623_552603_FFBB465E 
X-CRM114-Status: GOOD (  13.10  )
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

Note: the same issue might apply to 2500BASE-X, but that will,
eventually, be addressed in a separate commit.

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


