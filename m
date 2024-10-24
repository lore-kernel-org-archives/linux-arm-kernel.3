Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D612DD0BB71
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 08:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TDj2W1cEB0I3jNJZkoU/AfaGHAZZ+DZNAW15dg9eAkc=; b=y/Nq6/0NbZBIWff1BZTafWLXTD
	RmIgYgBeJTM+QC2YLjnoaVfCAflkcYki24b5OD3LqpEvT7MZzScjd40f/53+fTuP4hxpCcpQz1YJr
	U6uuale5IyEtokyJWn3e+b3P8jdyR6XR3vvKd09YBTuCjmqMawPNaSJ8SU7/237UZ5+lx38aNtsZ0
	xhO+ADjcDAplaZE45P0P2Fh2lT6NHMARjA+nXIwGZ92B0VWse/dS6cQBBpj4O2CXELfBIOGJaP5Qn
	c5KFDR5AbKzJd/Fsg5PA9ghBgSJjU6wBb0m+0194KTEdWQNtg6tZeID/5TYVimj7XGVczZeJFxbPt
	ynbdNEIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3tRS-0000000HKxy-1lZl;
	Thu, 24 Oct 2024 08:43:38 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3tGH-0000000HIVg-3JBu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 08:32:06 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-2e2b9480617so532680a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Oct 2024 01:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729758725; x=1730363525; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TDj2W1cEB0I3jNJZkoU/AfaGHAZZ+DZNAW15dg9eAkc=;
        b=YC0G4APzWCcjRXypBqhCNeeAQ8yU3A9IFQ1JPm8Ao/926bBUlnRVCa7BHX7NrCgZMY
         cRwcczrlokaeLZe/q0E562sF4zlAkKsPmYjL0mGK6Jts6k8mXScWR43t8SFdayZC4ZE6
         C1mkDRAAS9pSC6p6qTTV+QpfqNgu+gBBFQHkYpGdrv+vc1QDGLNLs95/c+9pK+PXLGbX
         DJ5kM93WwywAL6HKFudY/eF5TYfAVx8EmephfiNyKFYVGvccOn55MnlApP8CPMgGJy/8
         WdvW0t+oN/KRphbfNrEmGyP2MjnijvqBUWTUk4nDSFWxoufKBa6urpl/pXG1G9XARL72
         KRAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729758725; x=1730363525;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TDj2W1cEB0I3jNJZkoU/AfaGHAZZ+DZNAW15dg9eAkc=;
        b=J2/CYfbgXRrkhwOxxqC0J866rn+gnEgAMVkuKnY7PJluxTQZJutyPqcLDiuWAWDQ+P
         o2oxfqV6SzUOb8e3aVA2CKWFRCcFj4DnMgNxh52t4ToZoBWTym9h2cN+zoN2nynA6C+m
         CICLeSJT2lEWh6273q1x4ds0pYhj6LYVMzQe7vnj0zWmRpIkMPQrWAqI2IlcozlL//eo
         WXGPIS1x6h/w9LAIfKS4u6rB0HRdygl2Y6nO0HkUMRwmz/FhoAZK4ovXY1hApbzMT2+C
         ovb2lQ1+3vkVjn3PpcN59X6tDZJApiI8k79gXs7gLBlWPFF00Pp5HbIg4VPbu5U4g00u
         2Pdg==
X-Forwarded-Encrypted: i=1; AJvYcCWXK0kva53zHiRYiIDMNa1MaH3Mkx1VKtZAH1zav820hD2SiYojvJ88zgcg7CMORHLWKH2luJLbh5nmY0DuBA9S@lists.infradead.org
X-Gm-Message-State: AOJu0YzL4RClfrCbsnBKQlq/6ndyAObVbLJGLtC9I8gNaP0Kcd3zspno
	6JROxKn1VnEWv60K+10MkSB1wVPVDuuAiowaZlwtpKHX8yOQ1K9E
X-Google-Smtp-Source: AGHT+IG6vbAWvEZkyrLEBAt6yAw8DnNP0HXpy3nSTdKEniwkKtcm4fM/Jmd+UmyvW9+VJxVf1itXOA==
X-Received: by 2002:a17:90a:cf93:b0:2e2:abab:c45b with SMTP id 98e67ed59e1d1-2e76b605b0amr5267789a91.21.1729758724940;
        Thu, 24 Oct 2024 01:32:04 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2e77e5a4ec4sm868773a91.54.2024.10.24.01.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 01:32:04 -0700 (PDT)
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
Subject: [PATCH net-next v4 4/6] net: stmmac: xgmac: Rename XGMAC_RQ to XGMAC_FPRQ
Date: Thu, 24 Oct 2024 16:31:19 +0800
Message-Id: <12beaf54b466600fb4fd6a068fbd3ed204ab33fe.1729757625.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1729757625.git.0x1207@gmail.com>
References: <cover.1729757625.git.0x1207@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_013205_848345_7B56BFFD 
X-CRM114-Status: GOOD (  13.26  )
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
index f934c0510968..c9c2e0b00a0c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
@@ -363,7 +363,7 @@ const struct stmmac_fpe_reg dwxgmac3_fpe_reg = {
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


