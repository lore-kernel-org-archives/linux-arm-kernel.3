Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEBA7CED603
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 11:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NTa574HkLl4KDyxXIf08bFd9xl+XV9qO5xzIy1sFatA=; b=KVFvyoggDE+0k/xoR4ksNGa6jW
	N3F5xfOIZfduwQ2QBT8NHxKMZcfaQdZvmJ1th5rKBP+nY6Ta2iZRWmtFHzY9LRkgUV9MUH5tALiCA
	PNqCs1DbAV/2iL1l3Mhf7coG9FQ0XHgkSXWBJO/B7nN2WTxt56XKgS3JwGtx5UpHvoYTtwBk4MnTb
	J+yQaOntCRrQQuAMOlFszchh/XfUdg1D4I5SIdJkA+umF/huSwCrK7vqQ8ocxBHAGdEWakYqPHRMu
	wz94TJBytK67OY0zxZyyYNP9GX67OT+lgaQ0XYHvLHOuzXw+2uXP/Cw2kesomzdam2i2kJA8vrT4V
	ikI9pWvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLJcY-00000000J7N-0vCt;
	Tue, 18 Nov 2025 11:11:38 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLJcR-00000000J5I-31ID
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 11:11:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=NTa574HkLl4KDyxXIf08bFd9xl+XV9qO5xzIy1sFatA=; b=MN7DkEzlF9+jrfcda8eoCuAWTg
	miq3i3aKDlP0/sdtc+vjbQetJZgk9k45Q2DZnklKivliniL5MAZTrdN5q9rElBpEQnx/lqltbwHyz
	bvWJyVXi3qwVel5+kBhTFWuopUs4zX8YY8SwAoxlvNx1ORI9m2RbxL+wargpl2Gf8uPaHLunF3f0D
	F6vDfvDOelOB9epaE47cruDj62iEKLAm4KmxOcp6WZT5khdFJzTNPh10ELPLMnVbDSXP800kOOwcf
	z+zLZ/xpPVhLAcVFy0YsllPxOQdosG+AcIA6jMAioH+OBtY9P6Ret55y34w1QfGc1N8y23zzCKKAq
	+uqzD8tQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:58818 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vLJcL-00000000380-3It2;
	Tue, 18 Nov 2025 11:11:25 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vLJcL-0000000ExBL-0GFe;
	Tue, 18 Nov 2025 11:11:25 +0000
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
Subject: [PATCH RFC net-next] net: stmmac: document (buggy?) maximum MTU setup
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vLJcL-0000000ExBL-0GFe@rmk-PC.armlinux.org.uk>
Date: Tue, 18 Nov 2025 11:11:25 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_031131_756835_BF891AE8 
X-CRM114-Status: GOOD (  12.11  )
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

Add documentation for the ndev->max_mtu determination. I'm not sure
this is currect - specifically, having the "everything else" case
depend on the kernel's page size, which is a build-time choice for
some architectures and could be e.g. 4KiB, 16KiB or 64KiB.

E.g. when standard descriptors are used (enh_desc is false) and the
core is younger than v4.00, the buffer length is limited to 11 bits by
the format of the buffer size fields in the descriptors (TBS1/TBS2 in
TDES1 and RBS1/RBS2 in RDES1). So, when page size is greater than 4KiB,
a packet of max_mtu will not fit.

Also, dwmac4 cores (indicated with core_type == DWMAC_CORE_GMAC4) use
the descriptor format in dwmac4_descs.c, even when priv->synopsys_id
is less than DWMAC_CORE_4_00 (see the first DWMAC_CORE_GMAC4 entry in
the stmmac_hw table in hwif.c.)

So, I think this max_mtu is buggy.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 15b0c08ebd87..644dccb29f75 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -7813,6 +7813,12 @@ int stmmac_dvr_probe(struct device *device,
 	/* MTU range: 46 - hw-specific max */
 	ndev->min_mtu = ETH_ZLEN - ETH_HLEN;
 
+	/* Set the maximum MTU.
+	 *  For XGMAC cores, 16KiB.
+	 *  For cores using enhanced descriptors or GMAC cores >= v4.00, 9kB.
+	 *  For everything else, PAGE_SIZE - NET_SKB_PAD - NET_IP_ALIGN -
+	 *   aligned skb_shared_info.
+	 */
 	if (priv->plat->core_type == DWMAC_CORE_XGMAC)
 		ndev->max_mtu = XGMAC_JUMBO_LEN;
 	else if (priv->plat->enh_desc || priv->synopsys_id >= DWMAC_CORE_4_00)
-- 
2.47.3


