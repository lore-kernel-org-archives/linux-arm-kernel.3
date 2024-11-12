Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D12CBD42BB5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 17:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m/dDOU3IXt6wqdCpft8g2WA+gm1F7IyRLWSAkath9us=; b=pdbDJteIOt5HvEvdKOECO501sQ
	15PdxiGMqLcjZCSMtT3AclBndVpEJGjErjo2K3R1qLrmvX2ju1wgvHFq5rPgqUiK0GWaNg3pWr9eU
	aKZ9jgxoLKyDkmsqIjv/iuJGpq1b/H4naKI0dIbmItMSdXJRLqhhSQtlaS5bmAkZ2hX2woIouPCuX
	00aeuNdqvDgaGEiry4ec0dyXghC1WhS3nJj9dl6iYvv0DtwH05/IQOplyklpJkZWauatiJpr7WC9g
	JjwGmKXTrqvBpvNy8TTrEjsYYxsEB2+XyiaY6ppH4FvIULV7jP8AQYik1tGdM9feCIzW05g+1ZRsa
	MI6WaG5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAuii-00000004N1I-1Zx9;
	Tue, 12 Nov 2024 17:30:28 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAuMA-00000004IBo-0IT9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 17:07:11 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id AE45BE0006;
	Tue, 12 Nov 2024 17:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731431228;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m/dDOU3IXt6wqdCpft8g2WA+gm1F7IyRLWSAkath9us=;
	b=pCZ3G208S6C7+vr6FbnjjLuPSZn1hB6+bG/Sw0rV2pLS3RY+60iMBN+iTvTtFc3YGhaY4U
	eKYsJYIVbwmY0fkH1W8W84zLs0HUTcPkAoLr55oVXgM7z/MOrpqy379XMdpFtmIcm2jF5m
	8MRuw1Ste6W3uavBZqWPYDfzv+Nb1mJ4Uew/7GCyU0Q9n64sNBGbfnevPA9jnCZtCu8Lvd
	J+HJWr/SKdVRgJsbFYfV+ix4TKeslx12ZcBtcrsi4VqzRU90bb8E5LV7CcTY4HLQ4blmA/
	dA5o/VBcl9EDyGxch8efc1c2LkADJMGF67rF2Nt358z36JcXn43TO8MTN+MAHg==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	=?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Daniel Machon <daniel.machon@microchip.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v4 7/9] net: stmmac: Don't include dwmac4 definitions in stmmac_ptp
Date: Tue, 12 Nov 2024 18:06:55 +0100
Message-ID: <20241112170658.2388529-8-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241112170658.2388529-1-maxime.chevallier@bootlin.com>
References: <20241112170658.2388529-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_090710_284716_24A61F3A 
X-CRM114-Status: UNSURE (   8.28  )
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

The stmmac_ptp code doesn't need the dwmac4 register definitions, remove
the inclusion.

Reviewed-by: Daniel Machon <daniel.machon@microchip.com>
Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
index 430905f591b2..429b2d357813 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
@@ -9,7 +9,6 @@
 *******************************************************************************/
 #include "stmmac.h"
 #include "stmmac_ptp.h"
-#include "dwmac4.h"
 
 /**
  * stmmac_adjust_freq
-- 
2.47.0


