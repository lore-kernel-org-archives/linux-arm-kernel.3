Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4826DCF3189
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 10:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0nTWHIx4Dctv5EXusL1J/hHr97kNJ1bSy5pO5kUUQNg=; b=EI+Z1zde6xqXXaW8wCaI0BF0B+
	TVuZO/39WnYd/FTGgRLu3bU33pTLNjeLLa+b3nD5t+xuFiJN67oJvEUwIkNP1YZRTSgdFshotBQjE
	EpQ59E2y/ifQf0bkdZSUYHqSYdcpMfngr3Nb1a6fz3Q5TpKiLJnQIESRo39w1cnqdeiwEM9ekdFtE
	TcHmvGRbREsRVs5GmCVwtb68cNAb6ln1Xyr+o89gzzDTZdvXbIta4/Bky8GhjyXguQSn305ZRqME+
	BLgwAJRLRK6VZMGHvfv4CADy1RnXVfAnmbFt4s5gibGzxPfjXT7GXEpeyUmzF48Q6VJoRre5jb2dN
	c/HDmK2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLfLN-00000002xIv-3yiJ;
	Wed, 19 Nov 2025 10:23:21 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLfLL-00000002xHj-3hDL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 10:23:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=0nTWHIx4Dctv5EXusL1J/hHr97kNJ1bSy5pO5kUUQNg=; b=Kbo/jik9svCmqoRmpP0yr7EOGi
	e7mn2hLsU/nfP59SJ6YVT2GlwEr7QtVKCH1mke1HI8yUQt+fUeUWpkNyvSOVhiAf7cDPO2cnP1zlC
	FO7tXuQ1vKMdcVEbHGn3f6MkV8ehvP/2ROpHmk84ly3GprTovc8fpQFJ4ci1FiXFGqMTg0Kc3B+Sq
	tCKqj7zT55Q3m7gxf6RvL9kJ4qYrQx43ezZYrC4AWezez1CdU+uot2sJKotPSs7dkl5AFGFUBqqrP
	E8L0WfWEWaKPMww/gDmyJu+CaupqR2S0PA6mftc0oU9s6PfD3PSZOEDFxqfWXq46E7VN6AEPGIyF2
	PeMwlKuA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:52102 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vLfLH-000000004Uf-2TZr;
	Wed, 19 Nov 2025 10:23:15 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vLfLG-0000000FMai-3fKz;
	Wed, 19 Nov 2025 10:23:14 +0000
In-Reply-To: <aR2aaDs6rqfu32B-@shell.armlinux.org.uk>
References: <aR2aaDs6rqfu32B-@shell.armlinux.org.uk>
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
Subject: [PATCH net-next 1/6] net: stmmac: dwc-qos-eth: simplify switch() in
 dwc_eth_dwmac_config_dt()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vLfLG-0000000FMai-3fKz@rmk-PC.armlinux.org.uk>
Date: Wed, 19 Nov 2025 10:23:14 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_022319_918375_384B4C31 
X-CRM114-Status: GOOD (  12.56  )
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

Simplify the switch() statement in dwc_eth_dwmac_config_dt().
Although this is not speed-critical, simplifying it can make it more
readable. This also drastically improves the code emitted by the
compiler.

On aarch64, with the original code, the compiler loads registers with
every possible value, and then has a tree of test-and-branch statements
to work out which register to store. With the simplified code, the
compiler can load a register with '4' and shift it appropriately.

This shrinks the text size on aarch64 from 4289 bytes to 4153 bytes,
a reduction of 3%.

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
--
v2: remove "the the" in commit description
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


