Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8B85D262B1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 02:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mheO3ltxjQSu7UurcExzxnPdN5AG4xYNsYNnJqYZSP8=; b=DFjD4ta6gbOKG56hr+EpZTca3W
	oqZdGry0XxZabYOj5oeic6e81XH2BxkVBt5uH1z9ueZVU0V5h8gQ6J8TUXZB3E+HokcrN8qhS6MTs
	hnc/EyLWdzLPW7CaKyFAnXea+83VmKPkiurldDsk/DHD3E3bNZEDNYmR4qc4aaYLbPA6He9jbyLDP
	0pQWIww1zHMLYoiseDeOzhWmKQ2dgHFqTxic8UhDRzZLWq/TL14ThCCYft5MpLHUp6i4T1hLd3LJO
	DDB0W35XirjES/mfJnN+zAd9NVzLf/m5hhFXyCZHbbN8GRWHQJo3Lg80r2CireR3RD8YVo2jt9s0s
	UCRsmCzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viNsu-00000004meN-1FT5;
	Wed, 21 Jan 2026 02:23:52 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viNsr-00000004mdl-3SXi;
	Wed, 21 Jan 2026 02:23:51 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1viNsX-000000008F4-1FWG;
	Wed, 21 Jan 2026 02:23:29 +0000
Date: Wed, 21 Jan 2026 02:23:17 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Alexander Couzens <lynxis@fe80.eu>,
	Daniel Golle <daniel@makrotopia.org>, Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Axel Gembe <axel@gembe.net>, Josh Bendavid <Josh.Bendavid@cern.ch>
Subject: [PATCH net] net: pcs: pcs-mtk-lynxi: report in-band capability for
 2500Base-X
Message-ID: <b1cf26157b63fee838be09ae810497fb22fd8104.1768961746.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_182349_863742_8DC21F03 
X-CRM114-Status: GOOD (  12.05  )
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

It turns out that 2500Base-X actually works fine with in-band status on
MediaTek's LynxI PCS -- I wrongly concluded it didn't because it is
broken in all the copper SFP modules and GPON sticks I used for testing.

Hence report LINK_INBAND_ENABLE also for 2500Base-X mode.

This reverts most of commit a003c38d9bbb ("net: pcs: pcs-mtk-lynxi:
correctly report in-band status capabilities").

The removal of the QSGMII interface mode was correct and is left
untouched.

Link: https://github.com/openwrt/openwrt/issues/21436
Fixes: a003c38d9bbb ("net: pcs: pcs-mtk-lynxi: correctly report in-band status capabilities")
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/net/pcs/pcs-mtk-lynxi.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/net/pcs/pcs-mtk-lynxi.c b/drivers/net/pcs/pcs-mtk-lynxi.c
index 149ddf51d7856..87df3a9dfc9bc 100644
--- a/drivers/net/pcs/pcs-mtk-lynxi.c
+++ b/drivers/net/pcs/pcs-mtk-lynxi.c
@@ -93,12 +93,10 @@ static unsigned int mtk_pcs_lynxi_inband_caps(struct phylink_pcs *pcs,
 {
 	switch (interface) {
 	case PHY_INTERFACE_MODE_1000BASEX:
+	case PHY_INTERFACE_MODE_2500BASEX:
 	case PHY_INTERFACE_MODE_SGMII:
 		return LINK_INBAND_DISABLE | LINK_INBAND_ENABLE;
 
-	case PHY_INTERFACE_MODE_2500BASEX:
-		return LINK_INBAND_DISABLE;
-
 	default:
 		return 0;
 	}
-- 
2.52.0

