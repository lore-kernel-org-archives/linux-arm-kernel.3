Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BCC0D13588
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 03:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kn52y9HQNLKC2nRbhsI1WecpIBp46gjHfUlvO0bwqrs=; b=T4e0gFTRZ8hiYAkBDbfPoauuaN
	stBsjeLqolq8lzDHhIl7RBMnlulNUd8oj/v46NHXeYvtkijwlrezkBvgpu7aLbSS7ZG7WzSW4qci6
	IUZDXeyaO8PvEm9hrLUS8DypiBlUdRXqZ9tIDwU0iSadKfPXqqLANWRh0fEworuYmWnu7aaiWKpPo
	xorZufIqhMvGKjrpH24mWebWEQYMv658D3RnXpu7OEq3mA8L7bT5rRKCQPuXNiN1oFsjseLiDX486
	VGww10+1poT8cbxR03d8syQHXwoDXKHRbSIa7JG2NMcPpGUhP3SSpKis1WIdQNiIinD0x822+0R2e
	4sifa5MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5GUe-00000009Rgh-0cEX;
	Mon, 28 Oct 2024 03:32:36 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5G6z-00000009PGO-36iR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 03:08:10 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-7cd8803fe0aso2595490a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Oct 2024 20:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730084889; x=1730689689; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kn52y9HQNLKC2nRbhsI1WecpIBp46gjHfUlvO0bwqrs=;
        b=SGekamHDOfkqgQwlHTqZaK6EZXT9yvq4ndWpF2ZhmHtpzdR/yJWBcFFNoXpFlxMTbk
         qOloIYP9LhYesxWyVCikh+ygqkftfyUN7Yys1y2E3cUlGtLF4fDsoC8lWROtIIbB7d86
         UOdUW+ueswFQ3TIR1Z63fgudY6tweTtKo1dnrdbH0FgRMsdzRDgddnqQBnPrCqYQyJQs
         qzyS8UayWhS38qCBT5QJxYOZRv3nBxP3/g9nWwMVGM6Gk7gZtWwJ0+M7UqI64ilwckIt
         CrUuYmh3e0A50MWHYfPxGCi4GbEYQcPfSrjk8Llno71IpQp6R2EPfQ51EK9S/8AtSPj1
         bkdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730084889; x=1730689689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kn52y9HQNLKC2nRbhsI1WecpIBp46gjHfUlvO0bwqrs=;
        b=qvI/kGOPu/aq7xgG5WLgr63buc/yUGTVGDUaypOjznPNiXyvuDgiLwDtSUopTOgXJ6
         LfBYOr4TU33TAV1EDoQtypeZaRLzTC0Rz/rWY8ZDexYN3Fw8YYVwlwT6xFZxDEIhY8EA
         +18mgZFNJNeeHpUfznNwbSoCTZSqVCio99jcS2avRp3qA9m2nz6gY4ET/qAW44g+rCM7
         l2ITs8HjNQ7nOLu9lQ/A8dRQUp7Dk2rYS+LbwKaaxgF9GWTh3dEkkIo06+2c/rgovADS
         UXsR8o3pkN444eq/+r/tb/8uh7puqQ7m/1W1ioR1sN9Cc1Jol6u2GYyFMTxTAUkqt4d6
         rAOw==
X-Forwarded-Encrypted: i=1; AJvYcCUfQTlPvv57R6ZMIjMGMDjXfropNRfm4ctxvUySl9CVYLI6bhHV3wOIrI8nzoTG/rreZniXG5QhwNToPhNU/utw@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4w1f2SEx/BppqtBhPgcqPZFheuVRof0Visew3yojHZAsJez+m
	b7/BvDFA16x2TAWRklgjK53Bq96tF9rkOl3AjvSgG4oO0gWO61lz
X-Google-Smtp-Source: AGHT+IFEzrmGRpALAGVKconvFr3R884KqP941Fdm7RrIlzyHNj9gSTRob3wsZU6po/99rAkn3RP7Sg==
X-Received: by 2002:a05:6a20:b58b:b0:1d9:d04:586d with SMTP id adf61e73a8af0-1d9a8533e06mr9963979637.38.1730084888563;
        Sun, 27 Oct 2024 20:08:08 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-210bbf6d327sm41414155ad.67.2024.10.27.20.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 20:08:08 -0700 (PDT)
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
Subject: [PATCH net-next v5 4/6] net: stmmac: xgmac: Rename XGMAC_RQ to XGMAC_FPRQ
Date: Mon, 28 Oct 2024 11:07:27 +0800
Message-Id: <b6f701f7618b8dd659c0cf6e1c81e3d9cfbf131e.1730084449.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1730084449.git.0x1207@gmail.com>
References: <cover.1730084449.git.0x1207@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241027_200809_798096_2D32669A 
X-CRM114-Status: GOOD (  13.17  )
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
index 05a0e1a22155..ce5dc896f9d8 100644
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


