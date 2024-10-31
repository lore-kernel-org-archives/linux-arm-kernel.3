Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96FD4D74958
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 13:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gr5byz9uGWQ6qTVVNyRJz2fcSvGGfWOU5qQmAfQjTs0=; b=H8M/EBgKUDpowAuvzJiAImmVWh
	Zhw9+sXIjcARW7s7ov1J3L/6+gIESlgEBulON9F3CCXrNuqjaueblZpCl5YrI2XMTWkSHbYxvX6p+
	9BG2rTGcEPfqZUNblz28g5ALfHWNnZtcPwV7p+orZW+5iCXDbrWkoHOL4pqUQZZxVvPWTfgQyd3nt
	im3qj6A2Q3ApryQWznqvESnV2nHoJ0Sogr9GKbe5F0/VWBSx6m5ZDk2S4t/KZlU8oLBbrViZ7fhWm
	aKvBXUjj2mvJUCuSbiOw0hMMEIswmWYgLUdZ3woKU+J03wEJJLjuzelXkZh5cbKNhVhhqbxJ1+W6d
	ZJ3uDOJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Us3-00000003d4c-2P7i;
	Thu, 31 Oct 2024 13:05:51 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6USC-00000003YRx-1pXC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 12:39:09 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-71e70c32cd7so642559b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Oct 2024 05:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730378347; x=1730983147; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gr5byz9uGWQ6qTVVNyRJz2fcSvGGfWOU5qQmAfQjTs0=;
        b=V3gNUvfwqA3OuzJWe16s1qnUWQoYoPP4kP6COZ6amMNeJDHlRaiK9N4iXQqOjxqHYj
         EiscR6tGLIMP3xSoXD+FJALVVeyRj4crPXHlD0+jm6hxEpMggVo1lpt6yC4mHJ4gy3ih
         dXGW6TceJsIqnr7ZRC9IwC2gzK5XHqv2XKwuaOHbL9PTxNeF/8ky5q2IwWZni6HzPV6V
         oIJx5F5DEPJ4yQuPEqY53nQ2Bzqe/+92shBHWllMVKSuUt5IOShp1DNDnpt869DOyR5e
         FeQCgeuy7z7PdbkwhihkmfggkK/nTArcy7sJ0iYdKBkjwH0aNT10VpsiiRM6tODB8fEa
         LcgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730378347; x=1730983147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gr5byz9uGWQ6qTVVNyRJz2fcSvGGfWOU5qQmAfQjTs0=;
        b=oseIVnuluYks6fP5SO2GteYvBrM/hP9dfdXpq2ecUpUF3md+A5yPqmq3rIQXxVxWDK
         WpVlg48DRRBTQELDdtjvreyekYI2KqLPQXjaNadQtFLRv1XCbQ4WMZGaiEzlJZ2gQ6MS
         v/6EmodMf/ViSnhPc4Ko0nwafcl+0KOGcrTwwRhqmM6X+vl/Ze330d6rZq0PPjiAFqEo
         gUNGs84wlU7ih37P7ZT3wCzb8+5X7qVj7CJGWqa3evkTa2Xlp+4CstQXzRQScUe7HVWV
         OeCnPdBDIY2j203WcOERYIhAp6D6x1uZ7LOtNjqOdIIRVNt5HUCmariClwV7a/sK0IUT
         mlVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKbMsBubUjL6mJOHBE/djfXCoQ9kWTQUVqZMqqxxx2+Jn5/AxCiqXg/8v8droJ7wQm+6d1P+fTYhOSPCvNQLTf@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3JdyBNv6whtqJzYGEtXBzAUhAuFxS60VoiE2ggWiBasbZY6ME
	LZv3Z605hWMTXK35gUl532RCqvzq/4NvL8RMIT40C+PfZ6KH0TVj
X-Google-Smtp-Source: AGHT+IFrvqh3fZqXzS4zBEWib3+Sale7tzbI8D4zdSrUqBXu2tE+RWOF0X7aeH5toWPKujtUAdjN9w==
X-Received: by 2002:a05:6a00:2384:b0:71e:68ae:aaed with SMTP id d2e1a72fcca58-72062f81e6dmr24955795b3a.1.1730378347148;
        Thu, 31 Oct 2024 05:39:07 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-720bc20f50esm1075931b3a.94.2024.10.31.05.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 05:39:06 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Vladimir Oltean <olteanv@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Simon Horman <horms@kernel.org>,
	andrew+netdev@lunn.ch,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	xfr@outlook.com,
	Furong Xu <0x1207@gmail.com>
Subject: [PATCH net-next v7 6/8] net: stmmac: xgmac: Rename XGMAC_RQ to XGMAC_FPRQ
Date: Thu, 31 Oct 2024 20:38:00 +0800
Message-Id: <de8a31fe931152b569c4addb22bd9359c7eafddd.1730376866.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1730376866.git.0x1207@gmail.com>
References: <cover.1730376866.git.0x1207@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_053908_502866_870135B4 
X-CRM114-Status: GOOD (  13.14  )
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

Synopsys XGMAC Databook defines MAC_RxQ_Ctrl1 register:
RQ: Frame Preemption Residue Queue

XGMAC_FPRQ is more readable and more consistent with GMAC4.

Signed-off-by: Furong Xu <0x1207@gmail.com>
Reviewed-by: Simon Horman <horms@kernel.org>
---
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h   | 2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
index efd47db05dbc..a04a79003692 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
@@ -84,7 +84,7 @@
 #define XGMAC_MCBCQEN			BIT(15)
 #define XGMAC_MCBCQ			GENMASK(11, 8)
 #define XGMAC_MCBCQ_SHIFT		8
-#define XGMAC_RQ			GENMASK(7, 4)
+#define XGMAC_FPRQ			GENMASK(7, 4)
 #define XGMAC_UPQ			GENMASK(3, 0)
 #define XGMAC_UPQ_SHIFT			0
 #define XGMAC_RXQ_CTRL2			0x000000a8
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
index f07972e47737..b833ccf3e455 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
@@ -364,7 +364,7 @@ const struct stmmac_fpe_reg dwxgmac3_fpe_reg = {
 	.mac_fpe_reg = XGMAC_MAC_FPE_CTRL_STS,
 	.mtl_fpe_reg = XGMAC_MTL_FPE_CTRL_STS,
 	.rxq_ctrl1_reg = XGMAC_RXQ_CTRL1,
-	.fprq_mask = XGMAC_RQ,
+	.fprq_mask = XGMAC_FPRQ,
 	.int_en_reg = XGMAC_INT_EN,
 	.int_en_bit = XGMAC_FPEIE,
 };
-- 
2.34.1


