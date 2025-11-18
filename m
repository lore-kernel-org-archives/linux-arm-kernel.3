Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F4B7CED606
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 11:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Gw2RAS9z2/AKPOpj9C3KeuA6m32UimKQaTe/G+VHdaE=; b=2lHR14H5d68X5VP1Oz47+MGKKE
	0PNsoHLk8s7atkjgTARYdze8W1PR4qr4EHf7+epSK78gRHRyDqIR7E3UA6EaN1CLPo0WaPhZuPVi0
	N7yJKXmFZwxpJYy3+nJqNJwediLOdEyLVrFnGmvhCfwwmh/vDwRW1fv1LcSnHYV9Qh7S0Beg8RQSf
	h8+DYnKtPILZjIJYBsU3YxCFhaEQxHIo7NrmD5t2AUKPq+pEINhImCikdj3bAbCtQk9D3Tn7/Tecn
	IyuUFX/BH9zBhmLIlof/9j/g978Ssy5rQW0mBd8+HNu1VjJnuHzsMD7X+3JxtNIE/uvW/mZEm4EgI
	Lwj4JJlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLJit-00000000KHh-0C8E;
	Tue, 18 Nov 2025 11:18:11 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLJiq-00000000KGv-047L
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 11:18:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Gw2RAS9z2/AKPOpj9C3KeuA6m32UimKQaTe/G+VHdaE=; b=jhYjBCC+RZJsFwpImZv35aSNd7
	7DgFCeD6yzUJOdWGMUH+2zB3A1lOU7gmkGVDf0PLk/Fn5vUunP7N/SRT4cjW9yixxIc/YHxAQpqhX
	zr1XCrRxmhT+2dQZspqPSWGGt5hC6OHdBdyJRS7swVA8zBSXT1KpMFgi4pOAjrTxumlQTcWWZTAh1
	JJnWfV3ujDvz4SMtsmO1C2Whk9wRc6TxhmWT13xGDDn7p2Ah1h88fMTughel8iUPB+fkv8Dr2OAzX
	CombRCgVYXTyWhvpsLVVlyw/DfKBYdxgdn3yq5dv7houpuLPfe05MUii9U2woqG34NzAwzaU7iyn1
	Yib9ydsQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:57464 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vLJik-0000000039I-2tXE;
	Tue, 18 Nov 2025 11:18:02 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vLJij-0000000ExKZ-3C9s;
	Tue, 18 Nov 2025 11:18:01 +0000
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next] net: stmmac: dwc-qos-eth: simplify switch() in
 dwc_eth_dwmac_config_dt()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vLJij-0000000ExKZ-3C9s@rmk-PC.armlinux.org.uk>
Date: Tue, 18 Nov 2025 11:18:01 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_031808_262917_ABA1B22F 
X-CRM114-Status: GOOD (  11.94  )
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

Simplify the the switch() statement in dwc_eth_dwmac_config_dt().
Although this is not speed-critical, simplifying it can make it more
readable. This also drastically improves the code emitted by the
compiler.

On aarch64, with the original code, the compiler loads registers with
every possible value, and then has a tree of test-and-branch statements
to work out which register to store. With the simplified code, the
compiler can load a register with '4' and shift it appropriately.

This shrinks the text size on aarch64 from 4289 bytes to 4153 bytes,
a reduction of 3%.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../stmicro/stmmac/dwmac-dwc-qos-eth.c        | 26 +++----------------
 1 file changed, 3 insertions(+), 23 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
index c7cd6497d42d..e6d5893c5905 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
@@ -84,29 +84,9 @@ static int dwc_eth_dwmac_config_dt(struct platform_device *pdev,
 	device_property_read_u32(dev, "snps,burst-map", &burst_map);
 
 	/* converts burst-map bitmask to burst array */
-	for (bit_index = 0; bit_index < 7; bit_index++) {
-		if (burst_map & (1 << bit_index)) {
-			switch (bit_index) {
-			case 0:
-			plat_dat->axi->axi_blen[a_index] = 4; break;
-			case 1:
-			plat_dat->axi->axi_blen[a_index] = 8; break;
-			case 2:
-			plat_dat->axi->axi_blen[a_index] = 16; break;
-			case 3:
-			plat_dat->axi->axi_blen[a_index] = 32; break;
-			case 4:
-			plat_dat->axi->axi_blen[a_index] = 64; break;
-			case 5:
-			plat_dat->axi->axi_blen[a_index] = 128; break;
-			case 6:
-			plat_dat->axi->axi_blen[a_index] = 256; break;
-			default:
-			break;
-			}
-			a_index++;
-		}
-	}
+	for (bit_index = 0; bit_index < 7; bit_index++)
+		if (burst_map & (1 << bit_index))
+			plat_dat->axi->axi_blen[a_index++] = 4 << bit_index;
 
 	/* dwc-qos needs GMAC4, AAL, TSO and PMT */
 	plat_dat->core_type = DWMAC_CORE_GMAC4;
-- 
2.47.3


