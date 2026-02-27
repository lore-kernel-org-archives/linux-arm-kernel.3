Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA592FD5327
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 09:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eS9rupgpIxcOxJ6kq6XUeoOt3FlGtJ7fyDMVdsz4J5Y=; b=SZCRh0lWQtXbmrmnWKQf4PiEFF
	dF3RFov8/rSdZK6oBrSb63lP0LPAD2j6PruRt4skMs9aXaFKGLdMnYjEoskmIBzoN5/PkuXX3xzdI
	83R3ZZtlW9Y5rP6FC7lsGCOBXLyDdrxgGPHFNP4zfIDyRLiTh26AErB0qgbZMN66JPBZj5mlkdosK
	yRJGT/4UTqr7BiA3c/9HbtKORc2XrYH5y7VV1axWWkVHZpLiCjYtbyZSa6sf/fcoSmshdy4NGLVQm
	veHEyXFuDg9ghjspg+9H7hJgTRr4qxJ5N1Q0ouke9wF65H3E/TgsUhO9adP3p9rjhcFjAzigAD4A3
	WN/k8WoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvuXu-00000008BW3-3Qce;
	Fri, 27 Feb 2026 09:54:06 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvuXs-00000008BQv-0v7Y
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 09:54:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=eS9rupgpIxcOxJ6kq6XUeoOt3FlGtJ7fyDMVdsz4J5Y=; b=KE8f+Eon/Ske70O71uDarOGWSQ
	ss6RTWJ/Y/i2my+egHuGkpv+eJ33D7WWphnwN1qfUVGqZJzGGdtofXP4lT2aG763Iq5XyMlwkc9AY
	Ru2I1B6s2E99xQoAbY7pBRtZT+PdA3u9KOQbAd7DS01gLFwHgmLnRKNyg4iyJi2ol1eB0XKyVvBBu
	ow8iCs78bb3pQQRsuUjO3FgGqMlRt83Nhyc08+cCKI2/ixsDQnNM6j9N3Fbzfe59l/pPXPMtgBu4g
	fVdKibFAWnVBlLGYbTFRIAEbm6wRUjz7mvJWq7FiDy0InHicaBdgqiYaa9OftFzZ0uBL35EDBraDO
	VEfeJQ6A==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:42706 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vvuXc-000000000dk-24Am;
	Fri, 27 Feb 2026 09:53:48 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vvuXY-0000000AvnF-2ccv;
	Fri, 27 Feb 2026 09:53:44 +0000
In-Reply-To: <aaFpZvuIzOLaNM0m@shell.armlinux.org.uk>
References: <aaFpZvuIzOLaNM0m@shell.armlinux.org.uk>
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
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 08/14] net: stmmac: remove mac->xlgmac
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vvuXY-0000000AvnF-2ccv@rmk-PC.armlinux.org.uk>
Date: Fri, 27 Feb 2026 09:53:44 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_015404_414476_B7A9E81F 
X-CRM114-Status: UNSURE (   9.57  )
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

mac->xlgmac is only ever written to by the dwxlgmac2_quirk() function.
Remove mac->xlgmac, and the quirk function that then becomes redundant.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/common.h | 1 -
 drivers/net/ethernet/stmicro/stmmac/hwif.c   | 7 -------
 2 files changed, 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
index d26e8a063022..42a48f655849 100644
--- a/drivers/net/ethernet/stmicro/stmmac/common.h
+++ b/drivers/net/ethernet/stmicro/stmmac/common.h
@@ -635,7 +635,6 @@ struct mac_device_info {
 	unsigned int mcast_bits_log2;
 	unsigned int rx_csum;
 	unsigned int pcs;
-	unsigned int xlgmac;
 	unsigned int num_vlan;
 	u32 vlan_filter[32];
 	bool vlan_fail_q_en;
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.c b/drivers/net/ethernet/stmicro/stmmac/hwif.c
index 7e69ff4b9a98..1fcc91be7589 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.c
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.c
@@ -97,12 +97,6 @@ static int stmmac_dwmac4_quirks(struct stmmac_priv *priv)
 	return 0;
 }
 
-static int stmmac_dwxlgmac_quirks(struct stmmac_priv *priv)
-{
-	priv->hw->xlgmac = true;
-	return 0;
-}
-
 int stmmac_reset(struct stmmac_priv *priv)
 {
 	struct plat_stmmacenet_data *plat = priv->plat;
@@ -293,7 +287,6 @@ static const struct stmmac_hwif_entry {
 		.mmc = &dwxgmac_mmc_ops,
 		.est = &dwmac510_est_ops,
 		.setup = dwxlgmac2_setup,
-		.quirks = stmmac_dwxlgmac_quirks,
 	},
 };
 
-- 
2.47.3


