Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F941CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 06:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Uq+UrIAjX4AZwds/jvySlMBzvhIQPTWIB6Jqv3g81b4=; b=fz0BrzzA4V9hnwCHE50AThH73U
	fGbKoqD4zq+ax2yCwVqF8pPkMI+l1ETUXiZNtqR+uCSP/zhEkbjVIQ/d14Vt0YOgrF5p1p1dPjjwY
	BkrtS9i52jy92MWLO28OsHcSNZr6js+zPfjoOHE+DkN/5/xbukGIScmV0NUp8XMYCh94SGRMzjBqF
	J129uIdcJnRkcT6Pn82uq6u9hXS3JxtMTAfYpN4FcNqOa4XP6Tt3PhjDT/nVZzd447UjRXIP16LTn
	J99QuJOhb8GXq7q+DYuUS0PohxGvpz9m//8OLA8e5q1pj7pt9Zz/CAqIzWg02yra6C25TbEu/lVaa
	BSF2n+iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa6Ru-00000000hgT-0iKY;
	Thu, 18 Jun 2026 06:42:02 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa6Rr-00000000hfh-0cCH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 06:42:00 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-c85b2139015so248558a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 23:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781764915; x=1782369715; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Uq+UrIAjX4AZwds/jvySlMBzvhIQPTWIB6Jqv3g81b4=;
        b=ql5OVigPpEbRuGGs83PWvj1uCX2nhF51vPOCkKlKxr9ThL6J4aRuwiouOG5eLrfy2o
         eDcKUjkCuNycd161rDKuat5izt2xJGzqpyIOcGNsT0fNQ4Ua4rdJ1elMRwJoa1FS8BUV
         iM3OqslkgHERacgSagwXsE2eOhScXG9wjn+pJWgxZ8A9yaiJ7JQNL0mDhtGV18k9n6ag
         pZxfG78xlY8CrIEbfwX6VZ+KfY0dJOcfqINdNee5KND61nGkrC2AM2Tl8wVyxKnycL5B
         +/1cP3WdsTRca9ozDy+NTwjgJF+fj9JBpwkP/U2cbhNV16uN6sj1o+iq9WiNNrWNdUQU
         Rp9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781764915; x=1782369715;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uq+UrIAjX4AZwds/jvySlMBzvhIQPTWIB6Jqv3g81b4=;
        b=omfNmp78JTJ6zdwxTGRiAkyJ4AZDdnWEftpZ3wMC1qSyIMwcB+aJZfRI4IuhjKJZ/c
         SJDAfPD0h7Xpn8aQAaVlqHwL3uUAFkOyHayBC7Gnzscu+2lv2JjvW39UxaPFcExhBvMz
         +U7FyF1zfQkyZV6719Y2GrGv3L3sQorNbLRpR4AoWp2+hxpx5iUgsXYxEIJVrMfADwaE
         q285hnMkbbsV+hPX4b1vCLEX+Uc/q1xHOZZMTEaOa8rURnNpLIPXk8vQmV71QZ+/sKb7
         2lUvq1JL4kfIAm6Fzpe8aI93m4P2Verxhbla7iEKHUV/xXKurb0K0835k/308g1eYjCQ
         egRw==
X-Forwarded-Encrypted: i=1; AFNElJ/hx5pgbmWgADQBDKT1ESN8pqZsGbRV3PZz/L4wDmprnXnN6oZbN8ygbo0sCYXCdjzk558D0dnI+SY0H6zxVpId@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5sIjiHMv2kZIwwa7dZjif2fFlrYzyNO7jaaQOO1ByZssortzW
	Tfi6vqJX3nv1C9FY0RrQzbOlynyl229lxK1rxufz8B6WVgH24wF1yDkZ
X-Gm-Gg: AfdE7ckE9GDF6UvSG/WkyUfWXjdkW2/VFc2G/mnmV/LZ9ftzkqBhGWBENpGHAPc8ZGZ
	AhvNjU0E72yOPRamDWh71HZzyCbBCGzh/fSItdjC0xu5JkobNPgxBsLA0Uy4P/u2WZKyOvVWGuw
	Hs7lXI+NaoSYfiEBsgrQFjN7+zERls6rFpBqs8KLVx7vD/NvnXI35g+D2UXibfSMm0gejyDh+5i
	XhPLiXEpusDW2et/jIJr4iL444Bp6Bg+ZFUo71UOj4Wq8O+N/gJi4RnIxvgnSY4+K1deMUueMoQ
	EvemgLUGdUmiL19qrnNjossHP2CYCUK/ANrN6ztUSJoCwG6oLsOabwWl076LoBfrIWqCOo0B1h2
	voQq0uaGGeI4frTn4gJXnHu1/awY/SR6McJa7xhnbu+9+VJnJOHbf/+9itH355nj68yoBVcvf1v
	RThVqaZp2tiGs=
X-Received: by 2002:a05:6a21:4d17:b0:3b7:9aa8:3be3 with SMTP id adf61e73a8af0-3ba4d0e7999mr1744739637.2.1781764915177;
        Wed, 17 Jun 2026 23:41:55 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c866325d156sm16799602a12.13.2026.06.17.23.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 23:41:54 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Yixun Lan <dlan@kernel.org>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net] net: stmmac: dwmac-spacemit: Fix wrong ctrl register definition
Date: Thu, 18 Jun 2026 14:41:43 +0800
Message-ID: <20260618064143.1102179-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_234159_190699_A20B55F8 
X-CRM114-Status: GOOD (  12.13  )
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

There register layout of the phy ctrl register has something wrong,
fix it to match the right layout

Fixes: 30f0ba420ed3 ("net: stmmac: Add glue layer for Spacemit K3 SoC")
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac-spacemit.c    | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c
index 223754cc5c79..6feffaa3ef3a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c
@@ -18,10 +18,12 @@
 #include "stmmac_platform.h"
 
 /* ctrl register bits */
-#define CTRL_PHY_INTF_RGMII		BIT(3)
-#define CTRL_PHY_INTF_MII		BIT(4)
-#define CTRL_WAKE_IRQ_EN		BIT(9)
-#define CTRL_PHY_IRQ_EN			BIT(12)
+#define CTRL_PHY_INTF_MODE		GENMASK(4, 3)
+#define CTRL_PHY_INTF_RMII		FIELD_PREP(CTRL_PHY_INTF_MODE, 0)
+#define CTRL_PHY_INTF_RGMII		FIELD_PREP(CTRL_PHY_INTF_MODE, 1)
+#define CTRL_PHY_INTF_MII		FIELD_PREP(CTRL_PHY_INTF_MODE, 3)
+#define CTRL_PHY_IRQ_EN			BIT(9)
+#define CTRL_WAKE_IRQ_EN		BIT(12)
 
 /* dline register bits */
 #define RGMII_RX_DLINE_EN		BIT(0)
@@ -118,7 +120,7 @@ static void spacemit_get_interfaces(struct stmmac_priv *priv, void *bsp_priv,
 
 static int spacemit_set_phy_intf_sel(void *bsp_priv, u8 phy_intf_sel)
 {
-	unsigned int mask = CTRL_PHY_INTF_MII | CTRL_PHY_INTF_RGMII;
+	unsigned int mask = CTRL_PHY_INTF_MODE;
 	struct spacmit_dwmac *dwmac = bsp_priv;
 	unsigned int val = 0;
 
@@ -128,6 +130,7 @@ static int spacemit_set_phy_intf_sel(void *bsp_priv, u8 phy_intf_sel)
 		break;
 
 	case PHY_INTF_SEL_RMII:
+		val = CTRL_PHY_INTF_RMII;
 		break;
 
 	case PHY_INTF_SEL_RGMII:
-- 
2.54.0


