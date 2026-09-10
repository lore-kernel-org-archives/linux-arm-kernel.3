Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C4AEC88E42
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 15:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6h68E5chXjQxsCdAvZaW4D7GIP/l2Su79aiZxrUfj0g=; b=cqKFRLOxX1ZUcpgywKxJ/YjDkY
	ysQBM1eaAhp2iXqhQ+A79WR5STejhhpp1WAAjn7Wlp61A6cPHRYCu5vOw5nNHbtdmyeJWKpnU4ptZ
	udZxahRra13hoEWYE0tWa544nrzKKlptJFLxUdi8Ncuop4F0GER4SCFFcvzhyWhsEeIWPdEZi+TMM
	9hvnWbJV2UxSFE2SxyaIGKF+GQJjXoZLAbVshfgQwNb3Esujr65ZkCXIKu4il6i5noPXGkD51ygv7
	1x6OJzPiAKgvUgWoLruwaK0y75NdMpbcujrHqVRXcXQ8M6G8xqxrA2oG6o3wCp8EPhX/78jDqFeso
	W2ZrjT4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4gUE-0000000EkWY-3sdr;
	Thu, 10 Sep 2026 15:14:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4gUD-0000000EkTp-0n8o
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 10 Sep 2026 15:14:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=6h68E5chXjQxsCdAvZaW4D7GIP/l2Su79aiZxrUfj0g=; b=DcdZH54ivb/XcMTOtwJhI4ll3h
	EwZnTlsVzFZ1s4nytyDXfpeyBWqyUKwDtM9I9LlQQjnl5G0/J8Lhqyt/nvUEm35NDvQONwGhFwRuK
	i7tKsnYDplUKfI0H1woSg9T7KsImGIETqjAwNzcuP7C+40lOvfszOiyaubtsn4hv9eVn5EdJfG7tN
	1f8srxZpXScT0olYQgK1FSsBxUGunOiesH1brkvDTlqY5wHz6D6BVP3/Vt87r0fd/o3coRaT8WgY3
	KssVG98d5u2UMlkY7u0jxcsLWXIiGJkB9GaujBFq3AbqxXRiYG++Z96+nx6VrFjTCmfKaIxZmIm5K
	+7pHdX7Q==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4gUA-00000002eyn-2JAl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 15:14:48 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id EC9211A0115;
	Thu, 10 Sep 2026 15:14:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BEB805FA2F;
	Thu, 10 Sep 2026 15:14:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4E29311C7A35F;
	Thu, 10 Sep 2026 17:14:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789053284; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=6h68E5chXjQxsCdAvZaW4D7GIP/l2Su79aiZxrUfj0g=;
	b=AZlAp3rWhVHW5N4oNIUir/C48BFFcLDeNw64yNgWdEWL4N4REL/Apjk2tWeNlLhvusrmK5
	vBzBzEIfuLCcYzhaeLl5OkWAu25By+JKS+mbFiLeGwyeG8jMrDVNukarI5kmP7pW0AMSJH
	IWNgBJ1Dk66nlG24n5ohxdB+Ow276Xf/hWmRCzt1hVwJSAxbLiqieAyPRoboeFTy1z+f26
	se4g3UOfTCA82KJdGe1aqQRSkP+BzO7dyeWeLzKCtYiyJhZPRIQYkNOd2QH+XaUUy3kUxO
	kJGMhY/asAZeC+Vcuk9wvznyzU4uIQrSqfee4yoBginPL0IrS3kGxnGRAnxe0g==
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
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Minda Chen <minda.chen@starfivetech.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jan Petrous <jan.petrous@oss.nxp.com>,
	Ovidiu Panait <ovidiu.panait.rb@renesas.com>,
	Jose.Abreu@synopsys.com,
	Nicolai Buchwitz <nb@tipi-net.de>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	thomas.petazzoni@bootlin.com,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	PKneuper@dspace.de,
	David Laight <david.laight.linux@gmail.com>
Subject: [PATCH net v2 5/6] net: stmmac: size the RX buffers from the frame length, not the MTU
Date: Thu, 10 Sep 2026 17:14:02 +0200
Message-ID: <20260910151404.976753-6-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260910151404.976753-1-maxime.chevallier@bootlin.com>
References: <20260910151404.976753-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_161446_648589_8D5F8850 
X-CRM114-Status: GOOD (  14.99  )
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

When picking the buffsize to use based on the MTU, we shouldn't check
only the MTU value, but also :
 - ETH_HLEN for the L2 header,
 - up to 2 VLAN tags,
 - the FCS,
 - the NET_IP_ALIGN

The default bufsize is 1536 bytes, which is enough to contain all the
above so this hasn't surfaced before, but the addition of NET_IP_ALIGN
to the start of buffer address tripped the Jumbo selftest, leading to
this discovery.

With that, we don't need the '>=' checks on the buffer len, we can use
more consistent comparison operators in stmmac_set_bfsize.

Fixes: 286a83721720 ("stmmac: add CHAINED descriptor mode support (V4)")
Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 20 ++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 5fe7e95fdd34..3664a298574a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1536,17 +1536,17 @@ static unsigned int stmmac_rx_offset(struct stmmac_priv *priv)
 	return NET_SKB_PAD + NET_IP_ALIGN;
 }
 
-static int stmmac_set_bfsize(int mtu)
+static int stmmac_set_bfsize(int len)
 {
 	int ret;
 
-	if (mtu >= BUF_SIZE_8KiB)
+	if (len > BUF_SIZE_8KiB)
 		ret = BUF_SIZE_16KiB;
-	else if (mtu >= BUF_SIZE_4KiB)
+	else if (len > BUF_SIZE_4KiB)
 		ret = BUF_SIZE_8KiB;
-	else if (mtu >= BUF_SIZE_2KiB)
+	else if (len > BUF_SIZE_2KiB)
 		ret = BUF_SIZE_4KiB;
-	else if (mtu > DEFAULT_BUFSIZE)
+	else if (len > DEFAULT_BUFSIZE)
 		ret = BUF_SIZE_2KiB;
 	else
 		ret = DEFAULT_BUFSIZE;
@@ -4063,7 +4063,7 @@ static struct stmmac_dma_conf *
 stmmac_setup_dma_desc(struct stmmac_priv *priv, unsigned int mtu)
 {
 	struct stmmac_dma_conf *dma_conf;
-	int bfsize, ret;
+	int bfsize, len, ret;
 	u8 chan;
 
 	dma_conf = kzalloc_obj(*dma_conf);
@@ -4073,13 +4073,15 @@ stmmac_setup_dma_desc(struct stmmac_priv *priv, unsigned int mtu)
 		return ERR_PTR(-ENOMEM);
 	}
 
-	/* Returns 0 or BUF_SIZE_16KiB if mtu > 8KiB and dwmac4 or ring mode */
-	bfsize = stmmac_set_16kib_bfsize(priv, mtu);
+	len = mtu + ETH_HLEN + 2 * VLAN_HLEN + ETH_FCS_LEN + NET_IP_ALIGN;
+
+	/* Returns 0 or BUF_SIZE_16KiB if len > 8KiB and dwmac4 or ring mode */
+	bfsize = stmmac_set_16kib_bfsize(priv, len);
 	if (bfsize < 0)
 		bfsize = 0;
 
 	if (bfsize < BUF_SIZE_16KiB)
-		bfsize = stmmac_set_bfsize(mtu);
+		bfsize = stmmac_set_bfsize(len);
 
 	dma_conf->dma_buf_sz = bfsize;
 	/* Chose the tx/rx size from the already defined one in the
-- 
2.55.0


