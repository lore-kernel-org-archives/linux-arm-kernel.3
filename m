Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25759FEFB56
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 14:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JXiLBeHT/f+7FmN8ixyQWQMdHT9at8kpdVH8JJyp/bg=; b=A2UFg0DuDyT40A2Ng/SUaTTHiM
	v5zKV7ecz0CwRt+BBxqCKUJUm6SvzyOV0yJA895VJikgaYSdXBk8RKJXZDpkwTh3fu2Xqhs4udl90
	qmxfM0yKySY0jvPzSz4K2TDYIkR/KfEz0qju7ZFE0NlDc7JeKz5iFNBfr/ykhX5V/w/WejGjt69Pe
	YaFq0pAB2vhevEUIuGku7NsMYNCf860Wp/gE3SsHyPUrvZzp4uXHsJwkJozScv5IfXlpQiJ6CjMCf
	91sOLMcgf80SSBbeGfD5HlzCOFwT9V3EL27EBk55XLofm0V9iXq6DJoC1tgT86qTmjDxXi5r7niMj
	S0fCk8Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzHs-00000008XIt-1mDS;
	Fri, 27 Feb 2026 14:57:52 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzHn-00000008XDd-0esk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 14:57:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1772204267; x=1803740267;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=gVcNnj+ZlXLYFHsDMZvUG7C8eoXS0EkcdZXKECQ31PQ=;
  b=Tv4s2gLSqTRk834DtYsLGBrXHrUl4XsoKj+yLHLFh5pTgmhFEAFbsLqg
   saYdXKpVdeur9p2YE8jiK69tR4vLgwq8lJ/P+53xF7I9s5YV/003/TlUM
   zEdKX8s4kscrlqu9hwGf+Ky6rDEMhCa7y6ULwQVero0WvY/hAfI58O0id
   F5MnkrgGG5esw2cjtWiyYUd01KSAnJFSJJOhtOaa3c1WK3h5XybwpEQ3D
   mW3krz4XfZRBzwOOl9yqXnZLZ0G5HbMUBxJeKIttFgLjZqPvGKZAMXwTh
   Dj3xzarI+A/CcK8vMPcBdb8kllc05MXVb+exoW6uNTqFUQGiCgCLR5X8V
   w==;
X-CSE-ConnectionGUID: wDbLW9d7SnOseX1061A6kw==
X-CSE-MsgGUID: qJfegyn5QBW4ymcFlia6Gg==
X-IronPort-AV: E=Sophos;i="6.21,314,1763449200"; 
   d="scan'208";a="221253469"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 07:57:44 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.35; Fri, 27 Feb 2026 07:57:14 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Fri, 27 Feb 2026 07:57:11 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Fri, 27 Feb 2026 15:56:44 +0100
Subject: [PATCH net-next v2 6/9] net: sparx5: move remaining init functions
 from start() to probe()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260227-sparx5-init-deinit-v2-6-10ba54ccf005@microchip.com>
References: <20260227-sparx5-init-deinit-v2-0-10ba54ccf005@microchip.com>
In-Reply-To: <20260227-sparx5-init-deinit-v2-0-10ba54ccf005@microchip.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Steen Hegelund
	<Steen.Hegelund@microchip.com>, <UNGLinuxDriver@microchip.com>, "Richard
 Cochran" <richardcochran@gmail.com>, <maxime.chevallier@bootlin.com>,
	<rmk+kernel@armlinux.org.uk>
CC: <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_065747_264600_C51E062A 
X-CRM114-Status: GOOD (  10.66  )
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

Move sparx5_pgid_init(), sparx5_vlan_init(), and sparx5_board_init()
from sparx5_start() to probe(). These functions do not require cleanup.

Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 drivers/net/ethernet/microchip/sparx5/sparx5_main.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
index a58c79a6e873..d37f34197e84 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
@@ -726,17 +726,9 @@ static int sparx5_start(struct sparx5 *sparx5)
 			 ANA_CL_FILTER_CTRL_FORCE_FCS_UPDATE_ENA,
 			 sparx5, ANA_CL_FILTER_CTRL(idx));
 
-	/* Init PGID table arbitrator */
-	sparx5_pgid_init(sparx5);
-
-	/* Setup VLANs */
-	sparx5_vlan_init(sparx5);
-
 	/* Enable queue limitation watermarks */
 	sparx5_qlim_set(sparx5);
 
-	sparx5_board_init(sparx5);
-
 	/* Start Frame DMA with fallback to register based INJ/XTR */
 	err = -ENXIO;
 	if (sparx5->fdma_irq >= 0) {
@@ -943,6 +935,10 @@ static int mchp_sparx5_probe(struct platform_device *pdev)
 		}
 	}
 
+	sparx5_pgid_init(sparx5);
+	sparx5_vlan_init(sparx5);
+	sparx5_board_init(sparx5);
+
 	err = sparx5_start(sparx5);
 	if (err) {
 		dev_err(sparx5->dev, "Start failed\n");

-- 
2.34.1


