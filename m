Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C754710D1485
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Mar 2026 21:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0c0lfEh5H8seUCOVI74FNjnlV4nffYfL9v87bxvlRaw=; b=ke2TGA8f1iODnBTm+jHgg97niR
	HsQjsrottXYGuFJJlecKhLRqmrC3CcroEkZdFW21P/QQWedImtjqS8lb7XibWwrxn3LqiSvtBQcBt
	CIXKVfZW2sbMVLLMWcOrjb6XLcFYzUBOaICVC/APs4o2prXhlBdRRTjSZotXnBqtCidRf6iZx3ueP
	t1ypwDCo5lXj6KeRqBhBpSVXL3Xk1mdRK3rdK5b9X9bmhORyBIL6j2FRyMnXjuvFeICHcNauXYzgm
	k+o1hnnhqKmSColgyOGXeSv92lGosM8i0ZPWhiSKzhpT1p4ONM6loh8/l5Q1dKJ/arhChuE/vQfKE
	AkVHA4DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6bL0-00000009Jf7-3pam;
	Sat, 28 Mar 2026 21:36:58 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6bKv-00000009Jcm-0ImV
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Mar 2026 21:36:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=0c0lfEh5H8seUCOVI74FNjnlV4nffYfL9v87bxvlRaw=; b=1oF8aeq+jv/m19MfNDxOhVk4hs
	OXO3ZWCMwmRnKTT9PyTeS096XzFlj9pCz6fjgXKa/j0/JS435XY3/fJT4rLwvfx1GAXaCAswPn5Yz
	A7hX4asgm8eWhSR+9MW+cuXslWKvLS0DmakkfCAk7jPT8oOR67vtxkuzoi3M/BLzJUHefmYProquQ
	L0pfnCWVoYm0Wwak6KsqxEMD59LYgyMrncxXwN/sU0/EydolILzUqang+qX/pw4iHy3yhwSQH9uvs
	DpjWMsipJcmq1C7N4O0ovLzt6Zd3nDB5DRgO1LCprwRWRqFrwjXx6CX/Fq1CT3NjhUBjKgjpykoSX
	lc2x/sRQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:60850 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1w6bKp-000000007Rl-48dF;
	Sat, 28 Mar 2026 21:36:48 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1w6bKp-0000000ELtl-05Xr;
	Sat, 28 Mar 2026 21:36:47 +0000
In-Reply-To: <achJ1dfeT6Q8rBuX@shell.armlinux.org.uk>
References: <achJ1dfeT6Q8rBuX@shell.armlinux.org.uk>
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
Subject: [PATCH net-next 02/10] net: stmmac: add TSO check for header length
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1w6bKp-0000000ELtl-05Xr@rmk-PC.armlinux.org.uk>
Date: Sat, 28 Mar 2026 21:36:47 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260328_143653_108533_A3B28023 
X-CRM114-Status: GOOD (  10.29  )
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

According to the STM32MP151 documentation which covers dwmac v4.2, the
hardware TSO feature can handle header lengths up to a maximum of 1023
bytes.

Add a .ndo_features_check() method implementation to check the header
length meets these requirements, otherwise fall back to software GSO.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 2957ee4a43db..e21ca1c70c6d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4940,6 +4940,14 @@ static netdev_features_t stmmac_features_check(struct sk_buff *skb,
 		queue = skb_get_queue_mapping(skb);
 		if (!stmmac_channel_tso_permitted(netdev_priv(dev), queue))
 			features &= ~NETIF_F_GSO_MASK;
+
+		/* STM32MP151 (dwmac v4.2) and STM32MP25xx (dwmac v5.3) states
+		 * for TDES2 normal (read format) descriptor that the maximum
+		 * header length supported for the TSO feature is 1023 bytes.
+		 * Fall back to software GSO for these skbs.
+		 */
+		if (skb_headlen(skb) > 1023)
+			features &= ~NETIF_F_GSO_MASK;
 	}
 
 	return features;
-- 
2.47.3


