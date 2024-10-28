Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E40D5D13595
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 03:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XZgSPrHkP+5PHa4TM3CPdf/GMcXQ4aZTX0bTblaWKZw=; b=h/J0hQluuxQlJndYOckxEcPg/P
	SwTxS3e/3OHAGlihHInB9esULaGw+O4LA2dL9dAsd7jwobbDOHNJBNr7e3Pqw+f1qNZyRvgdZ46Pa
	xw87D4z2GXmYM8L18h1n4lKulYzZUAwnl3krA7iErndx3M2t1JooMH0sFcCKmH7PJHl9/7cGD9HEx
	o+jjYSDnfgg8XxZkR+f2DUotZfKDEX41QCnUNPblgwmdvHSxjib3pFMTh/L25q97uOnppmqxq+anD
	t+q5u43kHR4dMyycuFkyK5FosMOlhjDTISDye0/PjtBKqs6fPEvhqLxTz2ooiFg23CEBGCBpGY4a4
	Lajmbzew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5GXj-00000009Rwx-3HxF;
	Mon, 28 Oct 2024 03:35:47 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5G79-00000009PIm-44pQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 03:08:21 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-20c9978a221so39897835ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Oct 2024 20:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730084899; x=1730689699; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XZgSPrHkP+5PHa4TM3CPdf/GMcXQ4aZTX0bTblaWKZw=;
        b=Oog8MJeN2Ewdju2NICgGeKCwsEVXTg8+9Iq/VCoBKm7MddZa6XHAFdr8lAqFkgQSDc
         vUhBIWXdZ6xAKKeWUVtCQScmNPtnuBAnFkz1oq6QXSgY7A6piubJ3fW4Fmjr0umKJbLQ
         S0VL8bZfHid/wc6nTT52ZeHaPN1jMN9DWK/k2aiTPShmZSsDl20vECR3swRaXvxr140r
         391mcOMWwEjpjGd/aUXlT9b0IPobcl+lbptgvHLRLQ4wZq24zSK0P8Y5ks12xMDP4K2P
         73b85zKgf7PGI8pmqdFT/V1eBTcj0V1Ufav2TrSqtKbmDWrwNY/kJZiz2kHr2hsN5/9W
         TyTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730084899; x=1730689699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XZgSPrHkP+5PHa4TM3CPdf/GMcXQ4aZTX0bTblaWKZw=;
        b=cKeWFkYTPLGx4/Pd+ctYW1K8BW6SJkig7iGWrGz4eZILfR3wKbX6tov2UxAiLBZeL4
         yEskbOZzmzUHm+5aYrNmzpvGB6cVB2GW8VLSZr9t3tK4Ct1LDZsx09c1o5rTd2sjlQZP
         DbNDaaXuiiuDC5oC4yjRwuE9vwMG4bU71nPwr+r0Bg18iK+inBXPujF7Trewwc0IgQoB
         yjf+YuI0vbnUWYBzM0rOo/PhOYx/F0AeLk/LddaDkWSsYfSZiOkmH/CnRvdg+/dXRUvO
         +ZK2iXvdS9qVaCRB7AWo5s35/9B7nZISJD+aEQPJ+Q4V/QAh/BvhXkYmgMymn3n5KPsR
         s7VA==
X-Forwarded-Encrypted: i=1; AJvYcCXxRrOZvvwN6V+FSg1LIIkFVoMA0+hV6M69GWNENfuQgu6NaEsK6LwbUUaevCthQNgjJj31xIRzBJvGajKwRl7G@lists.infradead.org
X-Gm-Message-State: AOJu0YxELWbZ3WWSrLYLPsEXw2vtpQN4RIzD7Gf9pdM4wR2BZ2MDWj68
	ldKFxperLBSxAGfdpwwowMbpn78I6FISp7KNBhFfAX6rlvq4Cd6O
X-Google-Smtp-Source: AGHT+IFchisKXMXu4T+iCy7SrFqbq7c/JyULflLF19QqNcWyjDqPmVKAegFzkUP62qdTFlLz5UXVQQ==
X-Received: by 2002:a17:902:f607:b0:20b:ab4b:544a with SMTP id d9443c01a7336-210c6c6d591mr113535035ad.43.1730084899264;
        Sun, 27 Oct 2024 20:08:19 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-210bbf6d327sm41414155ad.67.2024.10.27.20.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 20:08:18 -0700 (PDT)
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
Subject: [PATCH net-next v5 6/6] net: stmmac: xgmac: Enable FPE for tc-mqprio/tc-taprio
Date: Mon, 28 Oct 2024 11:07:29 +0800
Message-Id: <aa950a5cea1f7b2ac1ff49c3eb958c01d46ee778.1730084449.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1730084449.git.0x1207@gmail.com>
References: <cover.1730084449.git.0x1207@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241027_200820_026825_9AE89E1B 
X-CRM114-Status: GOOD (  12.57  )
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

The FPE on XGMAC is ready, it is time to update dwxgmac_tc_ops to
let user configure FPE via tc-mqprio/tc-taprio.

Signed-off-by: Furong Xu <0x1207@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
index 75ad2da1a37f..6a79e6a111ed 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
@@ -1290,8 +1290,8 @@ const struct stmmac_tc_ops dwxgmac_tc_ops = {
 	.setup_cls_u32 = tc_setup_cls_u32,
 	.setup_cbs = tc_setup_cbs,
 	.setup_cls = tc_setup_cls,
-	.setup_taprio = tc_setup_taprio_without_fpe,
+	.setup_taprio = tc_setup_taprio,
 	.setup_etf = tc_setup_etf,
 	.query_caps = tc_query_caps,
-	.setup_mqprio = tc_setup_mqprio_unimplemented,
+	.setup_mqprio = tc_setup_dwmac510_mqprio,
 };
-- 
2.34.1


