Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C668E6B278
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 13:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7AYX/UegsJeayFQV7mwBWHowTbFu2IFH/WWSPA7go14=; b=vIboygsyvKDP5vkwyMQyxlfK8O
	Ltev/xCl5PP39XaZ32LkOj6z5mYDiKOEkalz3DOZ9fzLj193Y8IOgyXXCXwqhWeZAg+QoP3Vp5ZWZ
	8tWEejq+AnmTKPrpi2C+ken1l0+v689s1p9PJ9fMuMGhyJWmH+cvb4vzBGXHg8LimodjjQq6Zgsd4
	l5rqvueMj3TXxg5U9GNTn4IgmT+gHAFJVsT2d0hKzg5MVYPtbdVDaHgTRhA9V/j2q628egDmF79Qd
	1JkWLbTBhPwNwuFhdf5jlc38JxpiTUZ7RaykgakCgYZg1qhYidmRsG+x/vcWF1mrn4IjaAO+BnQtL
	vFosv9Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6rxZ-00000007DLN-314z;
	Fri, 01 Nov 2024 13:45:05 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6rlM-00000007BSF-1UyL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 13:32:30 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-7db238d07b3so1547372a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 Nov 2024 06:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730467947; x=1731072747; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7AYX/UegsJeayFQV7mwBWHowTbFu2IFH/WWSPA7go14=;
        b=W9YU98k4jcBWyuVHpVS/A5VEjZWMf5K8p/3+ZxIJJNShW+di+8Xb+aiELmtcVoQTDd
         H5M1YIlLfp1S3eDt9hEDi091IPw2T5OfMbjnE7dbBfMD9Ar1u7xQbvaahbP9jalcD9LT
         d8fTaCdj63Qr3ap0whuaphgRKeZR/eTtIszOvG4Zf4Gqyi9vmrHD7Dc02wpgHxA/zcCg
         BwVUkQ2LpDqnkMBpJIcQYIOLl6xD7MjZTA8A+Nmhlt8byP8+8KJsymdWVahrM4YpeUkX
         0a0kx5qrXBY/KyqbZ+MOG6mZPgWdGIV8ZBQJTOnxzQksVN8HQSpLhqLK7GzWZhGib9Ef
         S6mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730467947; x=1731072747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7AYX/UegsJeayFQV7mwBWHowTbFu2IFH/WWSPA7go14=;
        b=BUBQ13d5sWOhhGqEr9cXGbO4hWTo4MwEEAP2Mo8Jj7laNku9bY8JLl+p18RATg2nVs
         2lcZ3FIvVJZiF1g+XKooZQFPmHIrGuNieaEJF7RoR1helkEMsW0Lo6D7m5sAAo0E/tfH
         2VCrgsYZ1ins/QtU5ndtW3pYPvBRaIgyxmynL957ytRp3phwh7OASGQEl07F+ohHqjk0
         V9lI9Fe3PZqwK/ajQitoC1Td5I7EdcTv3tvJypRjeYl1yreaqsYecnVDp4oHuHLCnmRH
         a4YLNWifHOiEhOjZ2uSrNUqv2KRfECVtqqfbwu+pWstj95fblz1u2Ck6wtlukQyWSVUT
         R+Fw==
X-Forwarded-Encrypted: i=1; AJvYcCWoCg2juQz7ZzP2e5EmqsQ5cW5YJA3moFIwx1Vl1h1UEa7nbMypbVP6ckMnQEtXwk6LB+3dO3oveBBAhE9C0wwb@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1HQlTRGPcdnlFrvBCTbLySjrk+y9XoMn7ePeEtElMi5WbirlP
	cjvXdMCMsCsRc9y7EE5ulG4+ngZ8uh56TBtF3mqpI9YMtCPsXQX4
X-Google-Smtp-Source: AGHT+IG8CKrWDPB/2PbcjHGCaNFZgB8BK2WVp3xqAYoGbvg7ecSpi/WZf9vbDUIiX/52SjUlfNjCRg==
X-Received: by 2002:a17:90b:3848:b0:2e2:aef9:8f60 with SMTP id 98e67ed59e1d1-2e8f0d531ffmr24629842a91.0.1730467946920;
        Fri, 01 Nov 2024 06:32:26 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-7ee452ac4ffsm2425552a12.25.2024.11.01.06.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 06:32:26 -0700 (PDT)
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
Subject: [PATCH net-next v8 6/8] net: stmmac: xgmac: Rename XGMAC_RQ to XGMAC_FPRQ
Date: Fri,  1 Nov 2024 21:31:33 +0800
Message-Id: <611991edf9e9d6fac8b29c3fe952791b193ca179.1730449003.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1730449003.git.0x1207@gmail.com>
References: <cover.1730449003.git.0x1207@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_063228_426572_C413E753 
X-CRM114-Status: GOOD (  13.64  )
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
index ab717c9bba41..5ccdc6887b28 100644
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


