Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6D69C369AE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Apr 2025 14:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9FSsaukLF8royeXNwHBuaIKUVxUX+OAyF91g37Orbx4=; b=LW5IlHLUsMP4kCI9PsAsUtI/fL
	t7hK39hYq39kL0wK2JoYYk21/8OQodLD3X4jJ37YSkrDPlA/nMU1lUINJiGCDU71pKVQUkpOPBzPi
	QyofjQofHYaZM2Kigt2DTl8mIA3qnpS7hWyNH4M+dKWzp9HC9wQmiWeBSzyStxGnXsMj0HuamkaLm
	k4MjZ2MRvznBWBusvwZBisy6C3MA5l9Rirvf1+mLl74IbxE3M9JZcQKM0+lkLF3qRvxtO93jXXkQG
	L3RN7D1JmyXSH2frV1hgJvmKkdUk7oW99P7fGL6HG1s0R/z4G/w7cqz7H+F7Lpn3izVQIa+cdaoPz
	OxLteq5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3blD-0000000G0dc-12nj;
	Sat, 12 Apr 2025 14:23:07 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3bfu-0000000Fzw2-2G1G
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Apr 2025 14:17:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=9FSsaukLF8royeXNwHBuaIKUVxUX+OAyF91g37Orbx4=; b=dBOO0Ydfxn5g7p0sW8qa3xoVny
	QX/V9c/9/O793CIfBsZEEKhDIaU8vgaljiCmO2d9WJrCgz+iS/zPqi8XVh1xl82Jh1WzQTUQ8Z9LT
	3PNQm8SLNFTmt4QOBGZXyG/PuGYwpMT9Q3XzUbO/shGQSPN30635uKpQBgxi04E5E7g5UVjGaNuh9
	7ekzA+ojoRXlFBGOKSAhu+aqky+asHuMdzd2eyFEprVJBTKqobdWQUmyr0xDognUqevDcH+NyVTAO
	KIE/tQSpMUwm3juY3627jLcxyBgvmkSA/bb03Ds5+eAiNdsVWFZOCiU1REwBIA8roizH4AswoQR7m
	H63pfzdQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:60238 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1u3bfq-0004c0-1u;
	Sat, 12 Apr 2025 15:17:34 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1u3bfF-000Eli-C5; Sat, 12 Apr 2025 15:16:57 +0100
In-Reply-To: <Z_p16taXJ1sOo4Ws@shell.armlinux.org.uk>
References: <Z_p16taXJ1sOo4Ws@shell.armlinux.org.uk>
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
Subject: [PATCH net-next 1/4] net: stmmac: anarion: clean up
 anarion_config_dt() error handling
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1u3bfF-000Eli-C5@rmk-PC.armlinux.org.uk>
Date: Sat, 12 Apr 2025 15:16:57 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250412_071738_577316_60EAE76E 
X-CRM114-Status: UNSURE (   9.08  )
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

When enabled, print a user friendly description of the error when
failing to ioremap() the control resource, and use ERR_CAST() when
propagating the error. This allows us to get rid of the "err" local
variable in anarion_config_dt().

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-anarion.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-anarion.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-anarion.c
index 37fe7c288878..232aae752690 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-anarion.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-anarion.c
@@ -65,13 +65,12 @@ anarion_config_dt(struct platform_device *pdev,
 {
 	struct anarion_gmac *gmac;
 	void __iomem *ctl_block;
-	int err;
 
 	ctl_block = devm_platform_ioremap_resource(pdev, 1);
 	if (IS_ERR(ctl_block)) {
-		err = PTR_ERR(ctl_block);
-		dev_err(&pdev->dev, "Cannot get reset region (%d)!\n", err);
-		return ERR_PTR(err);
+		dev_err(&pdev->dev, "Cannot get reset region (%pe)!\n",
+			ctl_block);
+		return ERR_CAST(ctl_block);
 	}
 
 	gmac = devm_kzalloc(&pdev->dev, sizeof(*gmac), GFP_KERNEL);
-- 
2.30.2


