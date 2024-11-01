Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E2C4E6B278
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 13:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XZgSPrHkP+5PHa4TM3CPdf/GMcXQ4aZTX0bTblaWKZw=; b=PA9WxvatbTOLtwMzcz657+rUNY
	R05z13KHx3jearcdtuvDYGVELQi8YxCBjDnKXT2G6J61lGWJmrNDTQMVZxSmBEFJANuRQeggU7PoH
	L+WfKLuhpZKH8tp91+s9dPTqXVJTNW6LBmy/LyrPpIGeEEUJtxlFPBMwsAESBwebb2hLvdcjUZ4z/
	a7pIdmJaYnMMb+HxQ7EL5xxvmNKr1XlLPyxPOz4SWggkG2x+r0fI+LNXhelkjKoUQ6xh59QA2trJM
	XiHjjdPOfWCZMOb/cvE3dkwXB/39Ho2ULX+lEOiG1w1zej8znzZehY5TAxDRGLpxcu6GJoTSoW9UE
	UABWGdMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6s0r-00000007DuV-23gr;
	Fri, 01 Nov 2024 13:48:29 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6rlX-00000007BVR-0wTU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 13:32:40 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-20c693b68f5so21435535ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 Nov 2024 06:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730467958; x=1731072758; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XZgSPrHkP+5PHa4TM3CPdf/GMcXQ4aZTX0bTblaWKZw=;
        b=Fhh0Bm4Hv+SXFMwIvLAD1EdpXwfZczXZ1M0i/Xrj/OdjT49KGch+kDS2WhpsD6nVKw
         jw00ufCp91TH8KnqRYWRs2jJDp+qk0K7hWTJvHWpAxaOd0s/mFhTUJh7aYrjngz+ESzL
         yt1EZDf0yDzA6E34uPJD+7WFnlEeMd4SlpiExirh0rJfmBxeZKN9qTJaj/Ws0wI9aMNg
         eQ7oouWA8LP/YbdUzPnOCwiWBCvg9x/H1bVnSdvBWQJwuv/gwIOgh5ifaQWxsJJfT9ut
         IHf56pUZoRvbr4aa+BSPNLXuRmASd1uYJRB1qHMPTsFdNJ0uQvcCe8a9DGjJhWtBqY03
         MZ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730467958; x=1731072758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XZgSPrHkP+5PHa4TM3CPdf/GMcXQ4aZTX0bTblaWKZw=;
        b=gvAYKJpu+MlzevkeqkfB7wYx/Q8/UKCtnfyf4EI4oMnJdMADJR44zLuBY4iapV7fz3
         lyw7mGJep2e8eCIkUEjHgOHhp70Vd1Ut/pa3wlr93ZRIjWjF87ATckdn8XDmKWES2XsZ
         zLDCZSnxemJZ1ShFCoa43MIV7ewWFnV3noXDTJ6fLmVG9cTROtRKmFA/qvtpOKV79Dgn
         F0Kw+8bHVW+jRPN3n9Q0q2eO7acsYAfpJSuA0LO/j15mgoIRwxHxShKmXrswa8PvtiKP
         wIWVcnGoPKVwfNtsG1MOo8E82mYCrWlnVxIV7Fb/vpPKtFu72Widf+P22AuVjxsSGhID
         sfUw==
X-Forwarded-Encrypted: i=1; AJvYcCVHL4xOq2BD8sHPaa2S9vfWjE2vLDi/uH2dbd3q9GcRuOMgvhM5r9fHWkvqPlQU/M6Zdri8BqjpSB7zN7Im0BDQ@lists.infradead.org
X-Gm-Message-State: AOJu0YwH/UyCIsQ4/ol24wl3FwQn0+evHfbDx3GQ5P747c5kV8Nzn58C
	CjDQLR/7nMjTP55e9su0UovLD9LQohHLM+0UEM19P/+b9FVuhcHb
X-Google-Smtp-Source: AGHT+IHTARvDrrbplxN/Ao00eWN31nXbIywcdD4rM9k0ODO/JUtkFyG0XgpgcHwQj45NcT/QvLH8bw==
X-Received: by 2002:a17:90b:38ca:b0:2e2:cf5c:8ee8 with SMTP id 98e67ed59e1d1-2e93c186141mr8591363a91.12.1730467958001;
        Fri, 01 Nov 2024 06:32:38 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-7ee452ac4ffsm2425552a12.25.2024.11.01.06.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 06:32:37 -0700 (PDT)
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
Subject: [PATCH net-next v8 8/8] net: stmmac: xgmac: Enable FPE for tc-mqprio/tc-taprio
Date: Fri,  1 Nov 2024 21:31:35 +0800
Message-Id: <0575ef1553d572b7c8bc1baafa3fb7ac641073e0.1730449003.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1730449003.git.0x1207@gmail.com>
References: <cover.1730449003.git.0x1207@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_063239_311190_EAE67FCF 
X-CRM114-Status: GOOD (  12.98  )
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


