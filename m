Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C756CC61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 21:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WEAPghw2V8FwZFDzIv86krQ5odb//lbOQ2ObiCLEC1A=; b=eIKNnzgs8HgxDBcf5VUi85CZzD
	A/Xb6giYOVyLdEiCWUivQXFLJ8YVk+augiU2Fy5t8zuXVNbYcI5tL1n32QKu1+GwYPoTemE5zSzD5
	aUPIzeZ6XS2jXIvnp0946c5hw73JsyUdGfz1J5P39hosdUOFqNzdFkhSltbuQ36gjwlOdQS2xXgY7
	xHMFtQZCkst3qew1YbgA8kmy3+GQYQTp34HudN1P/z68phuv9OREfBkxy9zKCnqnDCaJ7VIvhUUPZ
	eXf4NarygHoLabPIJKMLUNNX6wqWWVopGg/xoewd3TVzYjiT+RdOEPcOIPULtHZZMLk0SjdBe6wiX
	mm4dbzVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyyX4-00000001Ufx-1LxZ;
	Tue, 25 Aug 2026 21:18:13 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyyX0-00000001Ueo-0ZLR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 21:18:08 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id DB9C74E413B2;
	Tue, 25 Aug 2026 21:18:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8D35A604C4;
	Tue, 25 Aug 2026 21:18:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 590C511C7A346;
	Tue, 25 Aug 2026 23:17:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787692677; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=WEAPghw2V8FwZFDzIv86krQ5odb//lbOQ2ObiCLEC1A=;
	b=InTOlJtrPp/dS5U6KdgdcRJIjxmQ80uyE2tEVykWMb+uY2KzEEWzgtmV2E7mYouQ63g/eK
	fVK2j6w3P5+o9Qj8WQe+lrbxSyexGFtdBXVasRudU/K1BTI5aQqwBJp1bPMWO0dr3ld1x0
	3OkWL599vz7TCPejRGcotuObV5mHh2dllwInLasraiXcmo5WsGNShpyfSGHHYDxLMd5tp6
	vWxXt/963xV1p121WUQftbijMxQ8ja8VTHneC5WuBsRdjZItYHvrfOxcwXYAEUgRVeXx3j
	JayRQEFPOfglZpnLDRUlseAJJi5+YocCqZ2+Zex4MRAgBsRc4zW/9pQiKb29Pg==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	=?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	thomas.petazzoni@bootlin.com,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH net v2] net: stmmac: selftests: Pass the IP proto mask in the TC selftest
Date: Tue, 25 Aug 2026 23:17:46 +0200
Message-ID: <20260825211748.360935-1-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_141806_319336_C0B55F1E 
X-CRM114-Status: UNSURE (   9.86  )
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

The stmmac TC filtering rules have recently gained sanity checks to make
sure the passed keys and their respective masks are aligned with the HW
filtering abilities.

The stmmac selftests failed to pass the mask in the match data for L4
filtering tests, and are now failing consistently with -EINVAL :

$ ethtool -t eth1
[...]
23. L4 DA TCP Filtering          -22
24. L4 SA TCP Filtering          -22
25. L4 DA UDP Filtering          -22
26. L4 SA UDP Filtering          -22

Let's pass the ip_proto mask in the l4 filtering tests match data. Found
on imx8mp, which now have passing L4 tests :

$ ethtool -t eth1
[...]
23. L4 DA TCP Filtering          0
24. L4 SA TCP Filtering          0
25. L4 DA UDP Filtering          0
26. L4 SA UDP Filtering          0

While at it, initialize the masks and keys to avoid re-using whatever
was on the stack.

Fixes: 5536d7c84363 ("net: stmmac: fix l3l4 filter rejecting unsupported offload requests")
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
index 1df26c217f9a..a2b917dd60e5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
@@ -1432,11 +1432,11 @@ static int __stmmac_test_l4filt(struct stmmac_priv *priv, u32 dst, u32 src,
 	struct {
 		struct flow_dissector_key_basic bkey;
 		struct flow_dissector_key_ports key;
-	} __aligned(BITS_PER_LONG / 8) keys;
+	} __aligned(BITS_PER_LONG / 8) keys = { };
 	struct {
 		struct flow_dissector_key_basic bmask;
 		struct flow_dissector_key_ports mask;
-	} __aligned(BITS_PER_LONG / 8) masks;
+	} __aligned(BITS_PER_LONG / 8) masks = { };
 	unsigned long dummy_cookie = 0xdeadbeef;
 	struct stmmac_packet_attrs attr = { };
 	struct flow_dissector *dissector;
@@ -1489,6 +1489,8 @@ static int __stmmac_test_l4filt(struct stmmac_priv *priv, u32 dst, u32 src,
 	keys.bkey.ip_proto = udp ? IPPROTO_UDP : IPPROTO_TCP;
 	keys.key.src = htons(src);
 	keys.key.dst = htons(dst);
+	/* Match the full IP proto field */
+	masks.bmask.ip_proto = 0xff;
 	masks.mask.src = src_mask;
 	masks.mask.dst = dst_mask;
 
-- 
2.55.0


