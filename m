Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2425D42BB5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 17:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KmB45n0EFDDxVFATGrPwAYkLgt0gPIeYSjIsRXHFoik=; b=2xuCZSC1kJh6gRl2AORzyN5uh1
	U9wEP2XUV132H94sNxLbhQcrQUW3AzVJsMS5TJzkQoU+oNZRc17ME6PXceim+Hs7dZPki7u3hjIuq
	/rsxhfJe07NovqVuL5HIy65t01lJFtFgzL8pzHpzECNfYazlNNVPgeEn56FRrHhn1U1Y2X3mJC3xS
	NbHWBhkqXfjIakUdCXidInHKKS5oPRBJhctlu33q9wnUdtODFW+YxzuC/HGFxS49V3sIHLaMvinDi
	jTU46tQR8pqu/k1Z0py489HbN761lzr0ppLZNzGqj4QieF69B9QI0Yzm8w6YzEBtmLoH8rNXlaMPc
	62w5c5ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAumI-00000004NwU-3qsh;
	Tue, 12 Nov 2024 17:34:10 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAuMB-00000004ICZ-3huX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 17:07:13 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8597AE0002;
	Tue, 12 Nov 2024 17:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731431230;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KmB45n0EFDDxVFATGrPwAYkLgt0gPIeYSjIsRXHFoik=;
	b=Hn4L25KJ6Bk4NzyNodJ2N99gxYyx6ubpJJGX7MCAK3Z3L+1TpHWP+CqFqNoz/FXGe6ixKK
	FFsatBb6wPQtSbA2DVpmOVpK94HUpgvj8XYYlwK0nSPXphisXAUEeGRsz84iXDKDRUz5Vz
	wva2wuIa+NGeR7/r9FQsi9Qx6UT7sHPqGVIJxfZfRGym0AJujFs55fpLJdJuksF4UbGeH6
	ByE9mD8mojXQiM1BlkR2n6PC0WqN1g9yl1tFf0uZqiJXH0OBz+DgK5kWgrGqSlL+nR/6k3
	UyJIUYuc+VxnaW8QEPmPZ4hZuuKDvp1d+1JpAYblzQK2WNMuug4k1ZDK7VZePw==
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
Subject: [PATCH net-next v4 9/9] net: stmmac: dwmac_socfpga: This platform has GMAC
Date: Tue, 12 Nov 2024 18:06:57 +0100
Message-ID: <20241112170658.2388529-10-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241112170658.2388529-1-maxime.chevallier@bootlin.com>
References: <20241112170658.2388529-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_090712_098772_48C5CEDF 
X-CRM114-Status: UNSURE (   8.62  )
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

Indicate that dwmac_socfpga has a gmac. This will make sure that
gmac-specific interrupt processing is done, including timestamp
interrupt handling. Without this, the external snapshot interrupt is
never ack'd and we have an interrupt storm on external snapshot event.

Reviewed-by: Daniel Machon <daniel.machon@microchip.com>
Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
index 0745117d5872..248b30d7b864 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
@@ -485,6 +485,7 @@ static int socfpga_dwmac_probe(struct platform_device *pdev)
 	plat_dat->pcs_init = socfpga_dwmac_pcs_init;
 	plat_dat->pcs_exit = socfpga_dwmac_pcs_exit;
 	plat_dat->select_pcs = socfpga_dwmac_select_pcs;
+	plat_dat->has_gmac = true;
 
 	ret = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
 	if (ret)
-- 
2.47.0


