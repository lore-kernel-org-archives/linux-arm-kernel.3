Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C11B7C44539
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 13:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YkleSo/mHT7B7/DelUTKo1SDFA3O4GZirFnblobGSyk=; b=4MrWPgZes7hVQ4q32eR+SRwOAm
	hkwhwvkKmZLpWNWpEbQwiMr8hBBekNwYkpWLH3ys0pIRrSRM7uKMHv2V0qPXSpSkKzT1HgJznGw8c
	cQwSpulk31ZPjemxtzbOVQThCxyEFxI4OATuqDAsVbOkpDPdfu+shHJPKK/dgkT0ho6FXjcl6F0nz
	Uf0zXiLYNK4c5XXbhoQonhkHTlw5nZK/pCu9WPINNqOzoadvHOcrzPODG4dvfgj42V5ShgK/5NhHF
	2ZxGQUdbTvb7tjT8GhDUSzz4zF7IilnefTNbDlxDaFcriAU8c9oGrNS6qYw7rrDP/L3e3wD7v8Odg
	51paD96A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmWri-0000000Bsqo-0HMg;
	Wed, 22 Jul 2026 13:20:02 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmWrf-0000000Bspo-1BYi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 13:20:00 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-ca7bea5e5b3so8996800a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 06:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784726398; x=1785331198; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YkleSo/mHT7B7/DelUTKo1SDFA3O4GZirFnblobGSyk=;
        b=EabYW2YIWnNgeDAwS+rEUP0Z2A9eaALPBJw+ZcPSXc0ubabVVF2iAiI93Ims4ArZtk
         /gTh8rcP6t/St//JKsRDyqJElWWxdO3i/MUjZFWvkYNdct7TMo1/dydiVxbd5w9k/eGk
         /x7tLh/0wy/gggbIYYIpKpnlsIRmPnGoc3lzhxOUhBGyEGd2PmRGrStnIsUau95iiFhw
         +oOPYWso4nZMgvTon/F3ipkejBx6pvgvZ7a+OPRJSSREdnuFfroSb8zicCRqGERpYqul
         JYak/fRBZTuziDJEuKLrnZmo+uSaxIgaGfsKzyG7IxvaJJ2dQRd8k6BTIFoGEfU+k2Ap
         185Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784726398; x=1785331198;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YkleSo/mHT7B7/DelUTKo1SDFA3O4GZirFnblobGSyk=;
        b=Ds7HAPAD0o4rcV/QlDsW1qzyoxl6D9FLcVJt1EIMPkNV3XSG6yYfZggZA/ay/4qS1i
         rxXRSTa3M8TcUv09Uzb8rv6ljscgW/CWmZVAY/c0gsPwv93R31De/7JKWX7cN+SELMHT
         VFlCaILHk9D0lnPqF3eHtON/7mnHZqw/BF6wfBNOPrTZvb+B9us5pKo+rPASDbR150BV
         R2gkLClcNOECCH6iT1WhHQnQjTyOSjoQHVPz/cFJ59CSrl4piord5kOgE3BZ6ZkpCi5S
         0jUZnn7jT13KJGO8gL4aJMcPhmSMpuYf+fJx/VX4aSl54lXJh7CF5a2+qZ0LvgrJdVA7
         HPGA==
X-Forwarded-Encrypted: i=1; AHgh+Rq/CxN0FMRYkNyIXICunMtKBuGystH9l77oWl1KfIe3LjbIl0BvBwJtaF1P+MrctDvTW99ZNSNghHgh4pkQiBc7@lists.infradead.org
X-Gm-Message-State: AOJu0YzCF1gIhKMmA7hxibdbMou4dMExXD1FE+Lvly9CIfJLxhmKc/BY
	+WHw+zs2ikN4X+H7UKh7p1W2tu4rMlBkVjAFnylEu8hHpDERZy+36cU1
X-Gm-Gg: AR+sD10bcRGrpUYkEfwYe/P5MpbbVmxEu9h46h0QC/cxZMhIPwp7hF2IG33aT3CXMOD
	AwkVvnJ2raoA0acJ1+p8saXMQaANJyis2pTOxZo5SFqtUCsk4mUSZn7VG3urxptZzqwjywd01uE
	+uczD/AHfVnqizydBKA9pNXBUJpS/65/SIjyPjy3M28eVriajDte87odJbKwbe72vp4Rtxl4X+z
	4+Slj7BFetNL923wZ9YR4hbodXbsAztAicJnLEIEMSNq2f2nHJuM70Q8wYdnOjF/bS4scBYPcFb
	W3Po50EwxVdhi1n2bREMbHHqb0v4qOH43zYh8EWd+FT/UqdDTTJuXjMWQ0GprjazvzXGBkf905V
	9bk3RmeK9n+htQsJD/AaozamrmUXCUkhx0MH+pdkBmlHjqp8VYX/u3yzhXezy7x0Ob1JH+2SyzM
	uh
X-Received: by 2002:a05:6a21:6110:b0:3c3:a140:938a with SMTP id adf61e73a8af0-3c3ad947db0mr26030102637.45.1784726397859;
        Wed, 22 Jul 2026 06:19:57 -0700 (PDT)
Received: from server227.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbb8f18ba96sm1112292a12.17.2026.07.22.06.19.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 06:19:57 -0700 (PDT)
From: Zxyan Zhu <zxyan0222@gmail.com>
To: netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Russell King <linux@armlinux.org.uk>,
	Russell King <rmk+kernel@armlinux.org.uk>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Hariprasad Kelam <hkelam@marvell.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zxyan Zhu <zxyan0222@gmail.com>
Subject: [PATCH net] net: stmmac: Skip PHY attach if custom PCS is in use
Date: Wed, 22 Jul 2026 21:19:18 +0800
Message-Id: <20260722131918.685761-1-zxyan0222@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_061959_372983_C6CD8FFD 
X-CRM114-Status: GOOD (  13.80  )
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

When a platform provides a custom PCS via the pcs_init callback
(e.g., for USXGMII with in-band autoneg), the MAC's phylink_pcs
is already configured. In this case, phylink validates against
the PCS's supported interfaces and manages link state through
the PCS, so no traditional PHY device is needed.

Without this, stmmac_init_phy() falls through to the
no-phy-node path and errors out with "no phy found" when
the DT has no phy-handle for such interfaces.

Skip the PHY attach when priv->hw->phylink_pcs is already set
and no phy-handle is specified in the device tree, allowing
platform PCS implementations to handle the link autonomously.

Fixes: f0ef433fc264 ("net: stmmac: introduce pcs_init/pcs_exit stmmac operations")
Signed-off-by: Zxyan Zhu <zxyan0222@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 2a0d7eff88d3..54c5281e91ab 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1346,6 +1346,10 @@ static int stmmac_init_phy(struct net_device *dev)
 		int addr = priv->plat->phy_addr;
 		struct phy_device *phydev;
 
+		/* If a custom PCS is in use, no PHY is needed */
+		if (priv->hw->phylink_pcs)
+			return 0;
+
 		if (addr < 0) {
 			netdev_err(priv->dev, "no phy found\n");
 			return -ENODEV;
-- 
2.34.1


