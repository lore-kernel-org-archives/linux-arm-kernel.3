Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C42F8CD6E6E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 01:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lJZ0RqgIk8/DP02YY4aEMI6Gbsvdjs3yNWLkzeFClOw=; b=ZVH6j6Dg4+oMepG769LT/PEfA7
	8Re2Dua/tqoPFwzZ5aiNvGQF8LqEnKWQXjqWSh/vVJgnSLQ1+U+LHkFNF40vmDSZTXVwNPZ4ABb2r
	8KMrI0cAmWFPumRcD1ihHKK97mg6G2XnsYptz1UbgPPxjoWY1gGNNLsd0xaRVhlHPbh62uI6w2CQy
	lupZa8m1Jq8W0uVWY0dwWIvte6DtG05Fy1hLSTeHvvuo+zq0qAxkiLmOGhilFAFuNrPGLe3B/ATQk
	ftk5iTC3yE11PWjwS9s47ZSxmNsSEgb3t/LTHilVRih7s5VeaqE2l6aFr/yFODkjf5BxXBh3lKuD7
	IRfRQCsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVIvg-0000000HTr6-2HZv;
	Fri, 05 Jun 2026 01:00:56 +0000
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVIvb-0000000HTlA-1l1z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 01:00:54 +0000
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-485ecc0f2dfso1164098b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 18:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1780621250; x=1781226050; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lJZ0RqgIk8/DP02YY4aEMI6Gbsvdjs3yNWLkzeFClOw=;
        b=B6+AjwB6+mTpQsfuGW5hOHtdP9bsdugL3ckRmbK+QQKeUxYbDBiHFACGFsuBTxDfkm
         ysibx32W2pKH7W4Vi3nlDPemgwW0LdGBGTdaUHD+PxHQ+y2b4puRw/jYECAwmCF4EfJd
         qTBF9+ltiGNyWWKQLiK7oon6SR+9SoPt9XFTL6UUCV+Hz4ZhjFpqRNAjnRFyFRpWX2hA
         YKD9yss3a2jsCfv9SnqylHaxrZFQjtFjCT16632MMqo/YMWC6ADCc94YeWUH4W8blO2V
         RI6ExK4qscWsOpeBldHf9vWPMBI8qETTvxfkNEQDaMlx25b7iwwvaSdx6spNRpQE+a2J
         mW8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780621250; x=1781226050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lJZ0RqgIk8/DP02YY4aEMI6Gbsvdjs3yNWLkzeFClOw=;
        b=IvqkiCTb5z7NxOlRS6AjNycExx6el/McJxpndSCesqnbemIqFu8jF7mS1Wy2aTW33N
         8nfvNVyIcrs2BbxgkOASOZzSVrY4LsBkIdpk8t4Gnj8uomh/GqUn5+2LQhYivxpY2/I7
         aWdLPNTdEU8c7oXlDoO++TzdEUFexYulfV6/nNCRJVPpV0hGvGX79HxjmOpwAWk6DxkL
         wQQOOaPON9uX6g4SmwvL2hCKRNLtu/f8cAcOTnAGE6B+PE0N93xWauqLKLCciMn+VNwL
         AsnUM7dBWfss/Mb8ZusMAgfz6zQ6q21P7U46mZk5tgVISzzA6hvA6hXPcMukDnRNRDfC
         FW5w==
X-Forwarded-Encrypted: i=1; AFNElJ8XvESls6rAhogeh3Jxk3sfJKI0BJdP8uqFXVKHXAT9wMIWeY8XdNXIcpf6EOkqE6norigmdKGsYu7yXEQRo3EJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yyy2jUEUYmNyod/yEPqdjaIYhUxlL7zsELw0+/1df5kWBREC+3H
	HkKtPIww3poMJLWUf/DV4kdDBv7gIi5oVZHsrNpbckUQVaiv7MNkDegwTtjhJkVKoU4=
X-Gm-Gg: Acq92OE1c21PeVTf1OHEchEv/tU3kJhBT0kJwgSoIZhcORDi419Bm66+VT2HNaquJKH
	IvZzeuzSV6Euvcq5ag+ldkCTtHQoPXeSXlgTrYX1DYzSd7EMjkhy2YNSuG0LTVmucUhn/50j9+F
	UPEf7i87o1UEkvCtRRGt6IxKNSmALr/LGgKJtzNf4Nq3Rk14uIzN1CXTIUvDPV0r1c0C4LKGmlk
	5AAKnaLbBvikawhlry875JkutceHsHVbNMHhDfMNCKo3mB7VIKzP1PBdFo3t3KRxG0dqJ4pGUHR
	r3t42FulDU5Ieo0BWH2h2+xSOwO0DYjeR3QmcKF1PnCxZw4EPZONV3M3U0VijW47My9XYmz9MRO
	2eCDGvraJW+KdZFHNYuQLvKtg6FgQqPr2E51tSDJRLZHm2qLxchfQI0ERyD1vt8BSgcjTMrRr5L
	wyOMxUx75kKeBpB8VGYaMm5tBfBcNX9U2kQekroQ==
X-Received: by 2002:a05:6808:d4d:b0:485:4601:9c84 with SMTP id 5614622812f47-4868de44d92mr853906b6e.29.1780621250160;
        Thu, 04 Jun 2026 18:00:50 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4865b6ec694sm5544631b6e.5.2026.06.04.18.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 18:00:49 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	maxime.chevallier@bootlin.com,
	rmk+kernel@armlinux.org.uk,
	andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linusw@kernel.org,
	brgl@kernel.org,
	arnd@arndb.de,
	gregkh@linuxfoundation.org
Cc: Daniel Thompson <daniel@riscstar.com>,
	elder@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	a0987203069@gmail.com,
	alexandre.torgue@foss.st.com,
	ast@kernel.org,
	boon.khai.ng@altera.com,
	chenchuangyu@xiaomi.com,
	chenhuacai@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	hkallweit1@gmail.com,
	inochiama@gmail.com,
	john.fastabend@gmail.com,
	julianbraha@gmail.com,
	livelycarpet87@gmail.com,
	mcoquelin.stm32@gmail.com,
	me@ziyao.cc,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	richardcochran@gmail.com,
	rohan.g.thomas@altera.com,
	sdf@fomichev.me,
	siyanteng@cqsoftware.com.cn,
	weishangjuan@eswincomputing.com,
	wens@kernel.org,
	netdev@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 07/14] net: stmmac: dwxgmac2: Add multi MSI interrupt mode
Date: Thu,  4 Jun 2026 20:00:14 -0500
Message-ID: <20260605010022.968612-8-elder@riscstar.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260605010022.968612-1-elder@riscstar.com>
References: <20260605010022.968612-1-elder@riscstar.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_180051_516109_E39CF9AA 
X-CRM114-Status: GOOD (  11.98  )
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

From: Daniel Thompson <daniel@riscstar.com>

Currently there are no XGMAC platforms integrated using the multi MSI
interrupt mode. In other words no existing driver sets both
DWMAC_CORE_XGMAC and STMMAC_FLAG_MULTI_MSI_EN.

In order to support systems that do enable both options (such as the
Toshiba TC9564 whose driver is currently being developed) we need to
add logic to the XGMAC DMA callbacks. Happily we can simply
replicate similar code from GMAC4. Let's do that!

Signed-off-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h     | 2 ++
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c | 8 ++++++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
index 51943705a2b03..9b0b5cc619556 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
@@ -320,6 +320,8 @@
 /* DMA Registers */
 #define XGMAC_DMA_MODE			0x00003000
 #define XGMAC_SWR			BIT(0)
+#define XGMAC_INTM_MASK			GENMASK(13, 12)
+#define XGMAC_INTM_MODE1		0x1
 #define XGMAC_DMA_SYSBUS_MODE		0x00003004
 #define XGMAC_WR_OSR_LMT		GENMASK(29, 24)
 #define XGMAC_RD_OSR_LMT		GENMASK(21, 16)
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
index 03437f1cf3df3..a84601ac32153 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
@@ -31,6 +31,14 @@ static void dwxgmac2_dma_init(void __iomem *ioaddr,
 		value |= XGMAC_EAME;
 
 	writel(value, ioaddr + XGMAC_DMA_SYSBUS_MODE);
+
+	value = readl(ioaddr + XGMAC_DMA_MODE);
+
+	if (dma_cfg->multi_msi_en)
+		value = u32_replace_bits(value, XGMAC_INTM_MODE1,
+					 XGMAC_INTM_MASK);
+
+	writel(value, ioaddr + XGMAC_DMA_MODE);
 }
 
 static void dwxgmac2_dma_init_chan(struct stmmac_priv *priv,
-- 
2.51.0


