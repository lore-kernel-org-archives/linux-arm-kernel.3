Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0717CEFD01
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 20:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DlaMolTnmoyru2QWdXRs/qQwh1y0/qtF6ho6FZ81efs=; b=vENO4PgMKH3L5FTRQUN/3p6bmw
	p0Kg8BtLE+Mf6qk+6KRujVEgHg3iHDEyD2CgfiVS6qRE54gTqWpo7OW9Teq34SR9PWRxr3c9GSQP5
	dsRsOD0emVYNnmgNr3Ir5Ys39qMbI9ioEGV3YBRNhJUo/Y5Lg4NH8HPTdQNCfhoHakE9H8z5xKInc
	VbQwPv27BEP6IdVyINXMmMx/InzaGmkF+vq+QfViux/vp19gVLwucDQLT+SrCQvCXAwN+cVLYo2XX
	fNqYIpiyEDfwJPt/dN+1kIg4nvslQMzZ5XkLOMBvKpkeXjrYS5ZZm7TFTNftTAw/HcipLS+wVwAnl
	TdKDZdcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdDiQ-0000000Dozg-0MFo;
	Tue, 06 Jan 2026 20:31:42 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdDiO-0000000DoyE-0akv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 20:31:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=DlaMolTnmoyru2QWdXRs/qQwh1y0/qtF6ho6FZ81efs=; b=mbQzOL++6Ez8wbDG1fxNOXfnlk
	oPzSrgGTbcAfbSKJVoNjVY7wSS07aObSS550BIzvcuijXY1XURfMPVrj3F2JiTx3nsrRAnkoMyU8K
	rRe4Oayy32lS+q+EwHIGBPWH8zdVOD9OG4n03TqPRfn6lst68qSInJrXOwr19j+g2aOmqq32umtgz
	w1yEs6iX/DvTDbLQEVOhTcdxHGtuOVcX6aOQtvUD0N4Bt0MrzFgaHii1K6kCDZPZft6k+BYcHHQ3d
	PnjU5SBCTh5jerAGZ10dBUMVzS1MVhNSlsSLr5ZUJDtOh4T9JJfoMRTvlL5ne8QxhQ3/8GiyFvF8C
	+deBSzkw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:38080 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vdDiH-0000000011N-1Uek;
	Tue, 06 Jan 2026 20:31:33 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vdDiF-00000002E1d-30rR;
	Tue, 06 Jan 2026 20:31:31 +0000
In-Reply-To: <aV1w9yxPwL990yZJ@shell.armlinux.org.uk>
References: <aV1w9yxPwL990yZJ@shell.armlinux.org.uk>
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
Subject: [PATCH net-next 4/9] net: stmmac: descs: fix buffer 1 off-by-one
 error
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vdDiF-00000002E1d-30rR@rmk-PC.armlinux.org.uk>
Date: Tue, 06 Jan 2026 20:31:31 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_123140_178285_8327F356 
X-CRM114-Status: GOOD (  12.23  )
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

If this field is zero, buffer 1 is ignored, and thus is equivalent
to transmitting a zero length buffer.

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


