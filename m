Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC8C3D0BB73
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 08:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XZgSPrHkP+5PHa4TM3CPdf/GMcXQ4aZTX0bTblaWKZw=; b=svYQ41dsRwkZTa6+PXq7oGSARc
	o5NNgZQOvkBpNSsduf3Cdjvpa9dV+uNVho6f2+zqPrrxYBLGHCK+huiEvp521g+VsZbg1PQvpEm+F
	qNGtGaQRayVtcrYYJbYIt81aaNi5ihHIBwoZ9tKMR7zPAb2PL6Fw+TnpUkj8KtiMLYCAZ1WVjd4v+
	hWcP3J8ju0RBicMRqJcYU0YPiTaFGSMou4jZsWkG4LSfPxnoP1kAJrP/FH3haO0m3chXnJrpvSsY8
	UeticFa40b3vQuoGuUOo667KIMnDpwwyD8ZtCtKA7PmbnX0mc1mwNYZZg1F+5+UA9JpvmTa2M8Mzw
	T6G4gNEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3tUX-0000000HLaJ-1YFO;
	Thu, 24 Oct 2024 08:46:49 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3tGT-0000000HIZ4-1XPB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 08:32:18 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-2e34a089cd3so542480a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Oct 2024 01:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729758737; x=1730363537; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XZgSPrHkP+5PHa4TM3CPdf/GMcXQ4aZTX0bTblaWKZw=;
        b=S3SQeieoNJSEaCD+/6PDGcHxVZ1ZwZHXh5WbHFdtqzZahUmDXxFdG1bsKpiVExxQR9
         oblDQe87m2r91zhOjXkjaZw5nBpGRkf7dZ++XPwV5/RTTG8tfpdngGpEBab27wL1me98
         V5VnYoIcT5vtmdzHAWmWZWTHJhXw8A175iUSLdVHN41CePF4gM3ZiW/XeDc65frrMP3Z
         MqUnwq7qk0tvWd8gz1Y6xC2VJZIjk5LBgKAC/853Lei2WIci+f/TE0R03nlgCw7dHTSe
         ZuLDbFh5RfsoEyXfqvObcYk0/XByjvGScoK6OwKf5g04jFfi3nKsWF9fNLwVUJkikz+2
         nk5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729758737; x=1730363537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XZgSPrHkP+5PHa4TM3CPdf/GMcXQ4aZTX0bTblaWKZw=;
        b=GqV0PWGYJBYjoDhyrR3E8ZuVw0iRHVjMwDY1e+dSqkbRyiqU6MblyEspCgopHJEael
         WxZxs/NaGpGnUJukHY6E3dV58RkLuZPCsa/oUYGMEKKslXLj5iXMFjtPbw8jSw+JG2S6
         L6E8IP4YyVXXaHHG/vBamM2BimuIF9wSVb1Ay4VEdpoMophyx6wjxDglQNRUszUv0qEp
         0XtCIXOn04f6fh7Ec6r1WFkcv+ZzS7StnL9JWwN/h/GFz6uBwnTRznea10MzgEp4Xxma
         AEKsSq5oBidHj0UxA/DiGkyCQn33wTQfbaRy24bxqIjj1OVmTKNFhQxBXdHLNNnr7/NY
         +l9A==
X-Forwarded-Encrypted: i=1; AJvYcCUD7zrf27azwO+BHo44Frn7BLmXl3OFdAXyByt/CtkJMxfhS1BSNya1j/RExaM6eIZpgkUACPO7v2KJbHC0xD3Q@lists.infradead.org
X-Gm-Message-State: AOJu0YyDlnYaGq6ocFbPc8LLU+Nv6ixyjOUjw9tjWWo9/kai9y0MHRFl
	fbHwra3DyBW972TgGEu34sbx5pH/1NDXBbM0zgGsd/nvsxCXYbRa
X-Google-Smtp-Source: AGHT+IGxeqb9FJneLkOG4JiyKKdDqgjaUa5zcOHcKRWNDzxb+oLM2QjS6gqg9VGE59w8X6F7T8e92A==
X-Received: by 2002:a17:90b:380c:b0:2e0:d693:7884 with SMTP id 98e67ed59e1d1-2e77f322767mr1337661a91.5.1729758736720;
        Thu, 24 Oct 2024 01:32:16 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2e77e5a4ec4sm868773a91.54.2024.10.24.01.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 01:32:16 -0700 (PDT)
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
Subject: [PATCH net-next v4 6/6] net: stmmac: xgmac: Enable FPE for tc-mqprio/tc-taprio
Date: Thu, 24 Oct 2024 16:31:21 +0800
Message-Id: <e26a39e2b8f1165b855f03fc767efd83cb554993.1729757625.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1729757625.git.0x1207@gmail.com>
References: <cover.1729757625.git.0x1207@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_013217_409793_301627E7 
X-CRM114-Status: GOOD (  12.40  )
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


