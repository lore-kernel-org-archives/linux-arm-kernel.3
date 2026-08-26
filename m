Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7778AC61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 14:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9okZtrUEsYcypmkihf73ptQqCKfBdI120oZ7DuDCFIA=; b=qTvK5XTq0AEwhcCKxSlodDKBMe
	pPWaZ1Hu6ul8FQ2bDzwFq2vmYOKOijV+2nzLlWKI1YoMYo9IW0SGIi9X+q0wB9C9KeaYIw6bXKXgS
	Q43oZYapKV+icQ7LVc9Kz3uj4+xBgF3hVwIdJTof318IB39rjtZO0fA+QG+u0pfBWPKuYgxsPnXNo
	q7pFDqvYEPlzD0fCVDY6UA1luKOD1nQa91Y16YH0A/C+GLVK5sGCA1+EeGdKltOwrKNbI+r2B2/NL
	LQz7AGwwIZFwho6Yw+fPyB37cI/o2KFgFiqWgV8LZNGKFAJDUtxm0mfiwOSFzQSgTvBHG8TPdJJnP
	A8W9S/MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzEG4-00000002Yzj-0ewc;
	Wed, 26 Aug 2026 14:05:40 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzEFy-00000002Ywt-2lsZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 14:05:37 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 31B5C4E413AA;
	Wed, 26 Aug 2026 14:05:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 052E9604EC;
	Wed, 26 Aug 2026 14:05:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5D0DE11C78233;
	Wed, 26 Aug 2026 16:05:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787753131; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=9okZtrUEsYcypmkihf73ptQqCKfBdI120oZ7DuDCFIA=;
	b=px2xu6tmaR9TMoeddIK0ozSjHileMe+rSlnsuHhq4FXKGscskZQRK9uaIlymXwriPCnfOU
	yAeOLWyQNKGJYaTARnNfjvtCyZSeza0FNdKcL3ECQa6ffJszQqx6v/pZpzUnJtmB+jlTLW
	PpEXOotKw5+6ai3XOV8ea9KZ/pH9oMkmir10OKKcbrhW8tPUX4XbXqTFfPNctv+/JgR5Jp
	auzBjv1xBvAA8AtYZ5U6wVM7kQ2JyMsldaXkw0gtV4TluSCQj5Gs2Pe5Ehdhwzvxr1X1Qh
	/w6GI8ctIgUYpQb39RiT+kcj5QFEdOgUxnKrKG7NcBL5bUCs5fGb1Uy9w9X5xw==
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
	Jose.Abreu@synopsys.com
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	thomas.petazzoni@bootlin.com,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH net 3/6] net: stmmac: dwmac4: Account for the primary MAC address for UC filtering
Date: Wed, 26 Aug 2026 16:04:55 +0200
Message-ID: <20260826140500.616466-4-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826140500.616466-1-maxime.chevallier@bootlin.com>
References: <20260826140500.616466-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_070535_017935_015D1C2C 
X-CRM114-Status: GOOD (  12.72  )
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

The same filter slots are used to store the main MAC address as well as
the address for the unicast filter. Let's account for that when deciding
whether or not to use promisc when programming the UC list in hardware.

Fixes: 477286b53f55 ("stmmac: add GMAC4 core support")
Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
index c6fcfae27c3d..18b357b257cc 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
@@ -521,7 +521,7 @@ static void dwmac4_set_filter(struct mac_device_info *hw,
 	value |= GMAC_PACKET_FILTER_HPF;
 
 	/* Handle multiple unicast addresses */
-	if (netdev_uc_count(dev) > hw->unicast_filter_entries) {
+	if (netdev_uc_count(dev) + 1 > hw->unicast_filter_entries) {
 		/* Switch to promiscuous mode if more than 128 addrs
 		 * are required
 		 */
-- 
2.55.0


