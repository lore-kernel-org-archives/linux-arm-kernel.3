Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E6E7C369B1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Apr 2025 08:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7oUr2hcCjGg3jEIX+23EL5ydP7tjG/UO6W9TUaokiLM=; b=CH+eTvI7tmV/CFbj9lMH3p7UGc
	wT0oDAJhM5xOS8Vtl5tG7O7LagrzPIMtkQcLKHMhey2c+Cxvw+jvJ+ABHhMb+pATTtJzWrUL8JM8z
	Zq6N8GaO/EPqocpyjIbnTrgPVnFf7/0KAVqSyKLPaZw0TB5Ex8nJwOpcwA2k1ca/tjGBLegU63AVE
	cOpqnTG1YppOxsuub0I+c64UAYq1Aklp9RVcPVxwCDy8VdY+ZiMFK+Nr+/rHAFnn4mF4CHaMXarxu
	5MLpvCgnN6xr4nNU4FhzxrLw0llZO8LHhhsgE5fYwxOrc7h5TB9VdxRzQZdKo3xVb0aJ0g401EOUK
	478rNf0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3W30-0000000FdkU-3VLX;
	Sat, 12 Apr 2025 08:17:06 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Vvd-0000000FdEg-1Hwp
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Apr 2025 08:09:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=7oUr2hcCjGg3jEIX+23EL5ydP7tjG/UO6W9TUaokiLM=; b=tyWewPOvnkhVW1eMV98TyPrXOs
	Ztf8QDyc8Y/770DupqK8LpdI6arUl7DQrbjVP4GXbMKsojfQDA7wWAlMv/HgoU8rYqt3ebMJF1ig/
	yTPzLyj9KvlA2JqqZiqZU+1UFZ/ZMaatz1v3BYuY5yJw7emziw2FgkoDFmo4pqtwJXGpdtn87ZYGZ
	0KVfhXiW0VfBOGetrE8bmCFSrxZ0y1dhD0IcsmLBoFexE6uQmQzex0/iDj3/SPYKw5ff6fvDmZG2u
	vkuAjItPxpK+/G4TjGDuf+WUMuCA6KeDpcWE1Uw2217qOFu1nMF0hlorJBtxnkbtG6A4yiYQkuWtB
	KaaJU27w==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:33814 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1u3VvW-0004Me-2R;
	Sat, 12 Apr 2025 09:09:22 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1u3Vuv-000E7y-9k; Sat, 12 Apr 2025 09:08:45 +0100
In-Reply-To: <Z_oe0U5E0i3uZbop@shell.armlinux.org.uk>
References: <Z_oe0U5E0i3uZbop@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Richard Cochran <richardcochran@gmail.com>,
	Thierry Reding <treding@nvidia.com>
Subject: [PATCH net-next v2 4/5] net: stmmac: remove eee_usecs_rate
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1u3Vuv-000E7y-9k@rmk-PC.armlinux.org.uk>
Date: Sat, 12 Apr 2025 09:08:45 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250412_010929_343513_2E321D63 
X-CRM114-Status: UNSURE (   8.82  )
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

plat_dat->eee_users_rate is now unused, so remove this member.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 include/linux/stmmac.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index c4ec8bb8144e..8aed09d65b4a 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -276,7 +276,6 @@ struct plat_stmmacenet_data {
 	int mac_port_sel_speed;
 	int has_xgmac;
 	u8 vlan_fail_q;
-	unsigned long eee_usecs_rate;
 	struct pci_dev *pdev;
 	int int_snapshot_num;
 	int msi_mac_vec;
-- 
2.30.2


