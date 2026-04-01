Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11CA0D3514B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 07:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9/5jetOXR4x4aaSx1QBWBlZ8VD7jqIHKoH/Y1tbFC5A=; b=4MjF422AnzoKXHoTEZ20AzTZZA
	HJVy/M0hXStPMCT7VIwL8E6PEmxqo7b837bzNNLoZl4nbIv85IefRFl9V8n5ml5vWZ+HVFk8U9/tg
	tJk7Yfm5FxaXdyk05WK6VZFuB2IQKcKg0LxKI/4W11711dLsAGylvO8Xtys28X6vCYjifoFGPXgdQ
	gD/xhnb4e8LyZ+T9/0HRG5ch2GSfGkYcm9WOe0PqWPAPZE4cDvW1tbPWi06R+K8Rz3AZYdvA58Zck
	OVaNElbEw+7/K+Fk7YzYyCzq1argG/AhARubnHgztgB4ajghsZYd9bSrhAR8vGkofz1TSSJZQ0jJh
	R8IRb/DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7ptg-0000000ECMI-0AXP;
	Wed, 01 Apr 2026 07:21:52 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7ptd-0000000ECJt-11rD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 07:21:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=9/5jetOXR4x4aaSx1QBWBlZ8VD7jqIHKoH/Y1tbFC5A=; b=GqNvIqZoA5gd71eKX/QcHVN/Ne
	6vOstvxdHEkR/WksCL4ZEG5MFw6rLXC3FFX0/h+IBaVRdWl1AlzdHSFwYyhCBGNtb259KPE8NJR2e
	H1vMmv5rkqBJ3vd0TSNKIgCndWc4kKAA4KWtk18fMzNkxf0xOrsIFEs0p9c8OY1jdUfw5Z9Nps5Wq
	OZZijREV9nIu4j+hwJ5g+lj3r1FpAPd5injy3CSH2Gfn4r9NiVrZpzrAK4WH+0fCDQ6xsSTDx3P6q
	7wjAIfwazR6WjigZwtDfCoMzlPAwlljRxzole+14iAraJKnTuq3E6kCT7Vcr+gcFzmAlhgd9i2GOH
	yV+9zWlA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:41312 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1w7ptU-000000002gu-3v66;
	Wed, 01 Apr 2026 08:21:41 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1w7ptT-0000000EatI-3feh;
	Wed, 01 Apr 2026 08:21:39 +0100
In-Reply-To: <aczHVF04LIGq_lYO@shell.armlinux.org.uk>
References: <aczHVF04LIGq_lYO@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	netdev@vger.kernel.org,
	Ong Boon Leong <boon.leong.ong@intel.com>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next v2 06/14] net: stmmac: add GSO MSS checks
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1w7ptT-0000000EatI-3feh@rmk-PC.armlinux.org.uk>
Date: Wed, 01 Apr 2026 08:21:39 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_002149_284990_B55A2DD3 
X-CRM114-Status: GOOD (  11.59  )
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

Add GSO MSS checks to stmmac_features_check().

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 031ffb78f40d..b4cc34dd0d76 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4391,12 +4391,19 @@ static size_t stmmac_tso_header_size(struct sk_buff *skb)
  *
  * While IPv4 is limited to MAC+VLAN+IPv4+ext+TCP+ext = 138 bytes, the IPv6
  * extension headers aren't similarly limited.
+ *
+ * Fall back to software GSO for these skbs. Also check that the MSS is >=
+ * the recommended 64 bytes (documented in ETH_DMACxCR register description),
+ * and that a the header plus MSS is not larger than 16383 (documented in
+ * "Building the Descriptor and the packet for the TSO feature").
  */
 static bool stmmac_tso_valid_packet(struct sk_buff *skb)
 {
 	size_t header_len = stmmac_tso_header_size(skb);
+	unsigned int gso_size = skb_shinfo(skb)->gso_size;
 
-	return header_len <= 1023;
+	return header_len <= 1023 && gso_size >= 64 &&
+	       header_len + gso_size < 16383;
 }
 
 /**
-- 
2.47.3


