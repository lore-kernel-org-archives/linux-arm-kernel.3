Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D39CDFB518C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 09:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uwM2BKpIP8DPPmF9GEljD2GJ7H5E0kHEdj42FXP3+Cs=; b=pImthEJJMgAYfJ5xixpF6hMbCM
	phOA/5dOVPkxG/Iw0Mq9cIN6E8mvQMOwgsdfNQJdWURheRV5DSUXUtBB9O8TR6uX97LxQ9L7WhjIF
	+we/tv+H/DUtYqiFLGij0II9pN1mrl05/NN7eOIvhCjcb7sAYIfiTgcD/1gH1+9trZ17QsvYm0JNA
	ImGOUjl35+8R7/ZSPkJ+fLtTWNuixlw5gMGCm9hucmi3g6nimtGQ3U4c9VNBYIEcRj6qR771VrRMd
	pSrc/OhpCaIEVcWtc98YktmHuDk0QSSfX+zz8hcNVM/ZJbltNpKIXKoVkjyEdb9KUQbmBzhhHyn2G
	Accmb+qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAPCH-00000008bjI-3g82;
	Wed, 08 Apr 2026 09:27:41 +0000
Received: from pandora.armlinux.org.uk ([78.32.30.218])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAPCF-00000008bgt-035c
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 09:27:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=uwM2BKpIP8DPPmF9GEljD2GJ7H5E0kHEdj42FXP3+Cs=; b=uH/u34qk6GM24zIbXzce3UMsVL
	UmfldgOTD9CAxHzHo77TAr8gaP5peTsoUbEQwZL6lNORhwxQ5vHtQ9rFytveMZ3OUm8y3tP+IHhAF
	v6EzFmNn+jToBnkiLxR4YArC/ggecfOmEVcT7BXmmhhQWYczVWMBlmhO0ZOfZUDOrEApDuaTNnAjz
	VmGO7AXmVb2xsiDtwcrl3iHvwJjez50wAM376Ldq56NZ5FgcvL9Sj2QuceQnxgaJrmSFH5wiJXYiI
	g2/lwRgvGK/jhujIqBkoGo79wPx6vQUq4WwpmKBQ0ZUBoEnYfVPYOR/dzxGoyr+miNsNN3tUku9YB
	+jBEVZYg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:33374 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1wAPBi-0000000023N-3rkZ;
	Wed, 08 Apr 2026 10:27:07 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1wAPBb-0000000F7k5-2d0y;
	Wed, 08 Apr 2026 10:26:59 +0100
In-Reply-To: <adYfPBHsXxQUsMyr@shell.armlinux.org.uk>
References: <adYfPBHsXxQUsMyr@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Chen-Yu Tsai <wens@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Samuel Holland <samuel@sholland.org>
Subject: [PATCH RFC net-next 04/10] net: stmmac: use ver->userver and
 ver->snpsver to print version
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1wAPBb-0000000F7k5-2d0y@rmk-PC.armlinux.org.uk>
Date: Wed, 08 Apr 2026 10:26:59 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_022739_047622_1641CFE8 
X-CRM114-Status: UNSURE (   9.33  )
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

Rather than using FIELD_GET() twice, reorder the code to extract the
version fields into struct stmmac_version, and then print them.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/hwif.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.c b/drivers/net/ethernet/stmicro/stmmac/hwif.c
index aacf78d4a2ee..7f95a2a5be4c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.c
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.c
@@ -42,12 +42,11 @@ static void stmmac_get_version(struct stmmac_priv *priv,
 		return;
 	}
 
-	dev_info(priv->device, "User ID: 0x%x, Synopsys ID: 0x%x\n",
-		 FIELD_GET(DWMAC_USERVER, version),
-		 FIELD_GET(DWMAC_SNPSVER, version));
-
 	ver->snpsver = FIELD_GET(DWMAC_SNPSVER, version);
 	ver->userver = FIELD_GET(DWMAC_USERVER, version);
+
+	dev_info(priv->device, "User ID: 0x%x, Synopsys ID: 0x%x\n",
+		 ver->userver, ver->snpsver);
 }
 
 static void stmmac_dwmac_mode_quirk(struct stmmac_priv *priv)
-- 
2.47.3


