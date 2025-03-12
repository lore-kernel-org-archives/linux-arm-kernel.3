Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3735C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 09:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=coDruLhzUwUWr9PQ9J/pkDgkm+WduLU7r2hwaAyS0V4=; b=RmCnv237QiX5xYQrmaZpRe8g2z
	OQyU0tFtAvA5mfqMgvuNsc9Ahc1sF5PLQ5FqP6qVpNBB9kKXEBp2BZkjM0Nk8G/8A9lJARUkJTlaB
	bOUTB5ANOdCgd4DD6LhvoJJC8Ez3OaQqfF4f3+1ftem0cP5J1kX7XA0gXRYNLls0f1rmfdm0NVrwq
	/1V366F1zbUH9icVJAOz8bbAMPpZsKpz70cOScgP3aI9ina/KB92nksQgdOSQ+Uebd1dNEECYzTM8
	9sbADXCNP7FeffTG5Kt52QuAw0QTxgsKhH0y5r10t2YrRlvUtC7/VrLYDhu70x2OBvf3GVgVM8BCo
	xwz6hiZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsIps-000000083Cf-3jof;
	Wed, 12 Mar 2025 09:57:12 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsIV1-00000007zdc-3ucj;
	Wed, 12 Mar 2025 09:35:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=coDruLhzUwUWr9PQ9J/pkDgkm+WduLU7r2hwaAyS0V4=; b=l38TbMDTtPijQLznVdXj9eUSID
	TXt78Gu7RakE9elMNI1mHpUmrCgm5/3bcl5H24UbxTmu1TLZ6m3qY5r2KpyIKdkNfpkB0whgy3InQ
	OVOGqdKoQQpfFJNy6wXOtGshaQgfPEJgIUBxCii7pdLlQ9v/IoICsNead6z3Co52C+rNPx7ix8/cU
	efEWjXjWPyiBVn9LCkCjZ9Zqr4rjEjNHAr96iAomHz8qTf1Ar1w0KHwCEA/BnRCEAEMFOCP+kRmiH
	7H7NQmceeb1piiH4O4S5WTs53KwPr9P2azvAfEzgoXOVx8zHtlcRbDeCh1BRd9zNX9yuJdfytPWVq
	52ML+odA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:42846 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tsIUi-0005Ie-08;
	Wed, 12 Mar 2025 09:35:20 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tsIUK-005vGk-H7; Wed, 12 Mar 2025 09:34:56 +0000
In-Reply-To: <Z9FVHEf3uUqtKzyt@shell.armlinux.org.uk>
References: <Z9FVHEf3uUqtKzyt@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Conor Dooley <conor+dt@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	devicetree@vger.kernel.org,
	Emil Renner Berthing <kernel@esmil.dk>,
	Eric Dumazet <edumazet@google.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jose Abreu <joabreu@synopsys.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Minda Chen <minda.chen@starfivetech.com>,
	netdev@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH net-next v2 7/7] net: stmmac: deprecate
 "snps,en-tx-lpi-clockgating" property
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tsIUK-005vGk-H7@rmk-PC.armlinux.org.uk>
Date: Wed, 12 Mar 2025 09:34:56 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_023539_971283_5B9E9580 
X-CRM114-Status: GOOD (  14.16  )
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

Whether the MII transmit clock can be stopped is primarily a property
of the PHY (there is a capability bit that should be checked first.)
Whether the MAC is capable of stopping the transmit clock is a separate
issue, but this is already handled by the core DesignWare MAC code.

Therefore, snps,en-tx-lpi-clockgating is technically incorrect, and
this commit adds a warning should a DT be encountered with the property
present.

However, we keep backwards compatibility.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 8dc3bd6946c6..c73eff6a56b8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -497,8 +497,11 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
 	plat->force_sf_dma_mode =
 		of_property_read_bool(np, "snps,force_sf_dma_mode");
 
-	if (of_property_read_bool(np, "snps,en-tx-lpi-clockgating"))
+	if (of_property_read_bool(np, "snps,en-tx-lpi-clockgating")) {
+		dev_warn(&pdev->dev,
+			 "OF property snps,en-tx-lpi-clockgating is deprecated, please convert driver to use STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP\n");
 		plat->flags |= STMMAC_FLAG_EN_TX_LPI_CLOCKGATING;
+	}
 
 	/* Set the maxmtu to a default of JUMBO_LEN in case the
 	 * parameter is not present in the device tree.
-- 
2.30.2


