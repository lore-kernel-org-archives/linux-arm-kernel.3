Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BCBDD1D478
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 17:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ol51REnBkcONdR3lXu77UErJ4M8e9HJNZBUczbA3AZQ=; b=AwVVWQsg9kgLBGl1w4k3rSr7gt
	1GrTiYnDbFxxhP2AztoqKHy9a6JFzISuzWNQjOX7b/ihNtvxJgVCl3bWBkT/yz3Q7gDTwx+MAga5t
	9ucKcn4FVSxmkp0QMVG1JSEHK5QKOpUQ6uYxsD8cUOknWlOtGS1EhHT1JIoPpc51UTJeAJvbnRGtl
	O7UAq1g++2sc3F93gw/18g1+2hnKvzkKRARU3Kt31A22LPfzti8DdDJYjhZV4i7zBNAm5VXGpT0Te
	xjMvsoArR4eHlJwgYJN6rV/cZN6tk2xqb/1rsnH0T909UER0OBpNPMcE/BGSqqpJFzkL6pXsxBDmp
	UBJQ4nxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdtw7-00000000S08-0Wqk;
	Thu, 08 Jan 2026 17:36:39 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdtvz-00000000Rvr-2ILH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 17:36:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Ol51REnBkcONdR3lXu77UErJ4M8e9HJNZBUczbA3AZQ=; b=sAlyu0tl1zdKYunzeoFuRL3z6B
	Q+77jMCKsB/A+S5QG7PTxvpJsBGckuSZ203KQ0GZnwBB9t7+cInH9DF8lRK9y0Rxkc+kZ/JP19JfA
	NZpDMjtaEBYvXTf350UlRNZmwbksKHo3JSzQvjGtgU3N8T6ogfa/bc9rlB0f7FkHmZpr2B9HpP8f3
	yNcplUrBJJ1HHU1xXNawMfUxcArlWK1KCHrVj+9DJSWzc5tXnxPrVrEAw3QVqeLmEdlO2l7XWhlLR
	EvolKxEMaWiWV5Tqx4dCr35QRdYZlPcOcWjsTxUqTiVO6swrn5HVW3OWZ80p1201Wzf1zLauyE/70
	Ald2jTNg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:42950 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vdtvt-000000002zQ-2aJ5;
	Thu, 08 Jan 2026 17:36:25 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vdtvs-00000002Gtb-2U9G;
	Thu, 08 Jan 2026 17:36:24 +0000
In-Reply-To: <aV_q2Kneinrk3Z-W@shell.armlinux.org.uk>
References: <aV_q2Kneinrk3Z-W@shell.armlinux.org.uk>
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
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next v2 4/9] net: stmmac: descs: fix buffer 1 off-by-one
 error
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vdtvs-00000002Gtb-2U9G@rmk-PC.armlinux.org.uk>
Date: Thu, 08 Jan 2026 17:36:24 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_093631_671394_888B0895 
X-CRM114-Status: GOOD (  13.11  )
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

norm_set_tx_desc_len_on_ring() incorrectly tests the buffer length,
leading to a length of 2048 being squeezed into a bitfield covering
bits 10:0 - which results in the buffer 1 size being zero.

If this field is zero, buffer 1 is ignored, and thus is equivalent to
transmitting a zero length buffer.

The path to norm_set_tx_desc_len_on_ring() is only possible when the
hardware does not support enhanced descriptors (plat->enh_desc clear)
which is dependent on the hardware.

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/descs_com.h   | 26 ++++++++++++-------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/descs_com.h b/drivers/net/ethernet/stmicro/stmmac/descs_com.h
index 40f7f2da9c5e..cb3bfc1571f9 100644
--- a/drivers/net/ethernet/stmicro/stmmac/descs_com.h
+++ b/drivers/net/ethernet/stmicro/stmmac/descs_com.h
@@ -39,15 +39,19 @@ static inline void enh_desc_end_tx_desc_on_ring(struct dma_desc *p, int end)
 		p->des0 &= cpu_to_le32(~ETDES0_END_RING);
 }
 
+/* The maximum buffer 1 size is 8KiB - 1. However, we limit to 4KiB. */
 static inline void enh_set_tx_desc_len_on_ring(struct dma_desc *p, int len)
 {
-	if (unlikely(len > BUF_SIZE_4KiB)) {
-		p->des1 |= cpu_to_le32((((len - BUF_SIZE_4KiB)
+	unsigned int buffer1_max_length = BUF_SIZE_4KiB;
+
+	if (unlikely(len > buffer1_max_length)) {
+		p->des1 |= cpu_to_le32((((len - buffer1_max_length)
 					<< ETDES1_BUFFER2_SIZE_SHIFT)
-			    & ETDES1_BUFFER2_SIZE_MASK) | (BUF_SIZE_4KiB
+			    & ETDES1_BUFFER2_SIZE_MASK) | (buffer1_max_length
 			    & ETDES1_BUFFER1_SIZE_MASK));
-	} else
+	} else {
 		p->des1 |= cpu_to_le32((len & ETDES1_BUFFER1_SIZE_MASK));
+	}
 }
 
 /* Normal descriptors */
@@ -73,16 +77,20 @@ static inline void ndesc_end_tx_desc_on_ring(struct dma_desc *p, int end)
 		p->des1 &= cpu_to_le32(~TDES1_END_RING);
 }
 
+/* The maximum buffer 1 size is 2KiB - 1, limited by the mask width */
 static inline void norm_set_tx_desc_len_on_ring(struct dma_desc *p, int len)
 {
-	if (unlikely(len > BUF_SIZE_2KiB)) {
-		unsigned int buffer1 = (BUF_SIZE_2KiB - 1)
-					& TDES1_BUFFER1_SIZE_MASK;
-		p->des1 |= cpu_to_le32((((len - buffer1)
+	unsigned int buffer1_max_length = BUF_SIZE_2KiB - 1;
+
+	if (unlikely(len > buffer1_max_length)) {
+		unsigned int buffer1 = buffer1_max_length &
+				       TDES1_BUFFER1_SIZE_MASK;
+		p->des1 |= cpu_to_le32((((len - buffer1_max_length)
 					<< TDES1_BUFFER2_SIZE_SHIFT)
 				& TDES1_BUFFER2_SIZE_MASK) | buffer1);
-	} else
+	} else {
 		p->des1 |= cpu_to_le32((len & TDES1_BUFFER1_SIZE_MASK));
+	}
 }
 
 /* Specific functions used for Chain mode */
-- 
2.47.3


