Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAAB3FEFB5A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 14:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oTU6JsxU3Hhy8HvY7VYTjnBelFsYSL61oMc3ORiSkhQ=; b=nme6Subo21E7Ewzm93aWnUIl8F
	7mJK9rS6572inrRHIaRjTXXzOK+C1QVA+kj9FwoNZj95J86JF9AVSFOGkvqF3FnN8j/SB7nYA3OfK
	9qjm7gaJk1VyWqx3APcAFPJTRKdCiju/h9clkIDPo9IwXJhMxJay+kTohATnsEbiWikhVeN93mMdc
	6ieHhGI477FGrqbGksfnw2wJ01zUHjbtNcw8OnsQuAZZGRPLfZ6UJKiMuXIL6AGYc3R2LLwDFn/iP
	ynEn4vCRWRYO4idJNpzxiQrNMlIQqKqTXdk371zDfeGBvbKetJjXN21Ujr4QMqCTMpyQfy/BbU7i2
	mcq60xGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzHs-00000008XJT-3169;
	Fri, 27 Feb 2026 14:57:52 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzHp-00000008XDd-19n2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 14:57:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1772204269; x=1803740269;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=iZqObIlnGsrxaMJ/K/m7e8CKplLt7VJNcogmW6z0W/U=;
  b=E1tAmXtOcXe3wr9GfG+WaYuKnsDxy5QOPs8+/7MNQW7Ret+RFdBf/jxj
   SWv2tWgDHOMRUUWZNH6wEAoHlUHAc13fOWNnX+0tsPQNt2kLVhCsMdWNU
   4UuE+qHsu2Ag+Xe+D+nXmzXd800MXj6EtVgpmsf+4VMRp24mCq9ISalwT
   tQ3nVdRkqjs514MWOKFC0wir1YTg46JcYx83ghi4DfJFzxqLmwW6QTzG5
   I0KYIpNmRAP+ez2Co+yMA9haWQ9iI4Wx+q/EffHr6zW1iikexlapLqWPb
   yjXIOggrOUXx9E6CBZOoUAhGX84Rf/uEO0yqHwJG9ALzB/Vytyw7pJlAn
   Q==;
X-CSE-ConnectionGUID: wDbLW9d7SnOseX1061A6kw==
X-CSE-MsgGUID: 5z+WZYXARCGYoexIWYfVfg==
X-IronPort-AV: E=Sophos;i="6.21,314,1763449200"; 
   d="scan'208";a="221253471"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 07:57:44 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.35; Fri, 27 Feb 2026 07:57:21 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Fri, 27 Feb 2026 07:57:19 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Fri, 27 Feb 2026 15:56:47 +0100
Subject: [PATCH net-next v2 9/9] net: sparx5: replace sparx5_start() with
 sparx5_forwarding_init()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260227-sparx5-init-deinit-v2-9-10ba54ccf005@microchip.com>
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
X-CRM114-CacheID: sfid-20260227_065749_439452_287680AE 
X-CRM114-Status: GOOD (  11.88  )
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

With all subsystem initializations moved out, sparx5_start() only sets
up forwarding (UPSIDs, CPU ports, masks, PGIDs, FCS, watermarks).
Rename it to sparx5_forwarding_init() and make it void since it cannot
fail. This removes sparx5_start() entirely.

Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 drivers/net/ethernet/microchip/sparx5/sparx5_main.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
index e4a448fd2b30..cab5daf265c2 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
@@ -735,7 +735,7 @@ static void sparx5_board_init(struct sparx5 *sparx5)
 					GCB_HW_SGPIO_TO_SD_MAP_CFG(idx));
 }
 
-static int sparx5_start(struct sparx5 *sparx5)
+static void sparx5_forwarding_init(struct sparx5 *sparx5)
 {
 	const struct sparx5_consts *consts = sparx5->data->consts;
 	u32 idx;
@@ -779,7 +779,6 @@ static int sparx5_start(struct sparx5 *sparx5)
 	/* Enable queue limitation watermarks */
 	sparx5_qlim_set(sparx5);
 
-	return 0;
 }
 
 static int mchp_sparx5_probe(struct platform_device *pdev)
@@ -944,12 +943,7 @@ static int mchp_sparx5_probe(struct platform_device *pdev)
 	sparx5_pgid_init(sparx5);
 	sparx5_vlan_init(sparx5);
 	sparx5_board_init(sparx5);
-
-	err = sparx5_start(sparx5);
-	if (err) {
-		dev_err(sparx5->dev, "Start failed\n");
-		goto cleanup_ports;
-	}
+	sparx5_forwarding_init(sparx5);
 
 	err = sparx5_calendar_init(sparx5);
 	if (err) {

-- 
2.34.1


