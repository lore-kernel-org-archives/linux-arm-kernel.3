Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6049D74963
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 05:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CFXbwqz75x0dcmhtSdDEARZ9DfDgZuyYgYubYl4uDMY=; b=06wcDlvUBOyxCqs3dLSgC8DT2h
	LTrH1rShF96hk/rrYkH9OkSNKbCRqEHm4grIl0YI3dPKfmdsYUtoNShAJ0l7C2XzeMPP8CWdHLkhi
	DSvkDawZs4Lc3+Z1SGpORBF74vLqLJQNGkm2QgyQlhXFpkI9NPXlxP8XtHCQ4V40MX3cXTAVDtG83
	eJQ7mIlWvh9C8hhX1/0t29vcyBQF2cJ536q2vpMw7TJypcze+oMitLOcwZIy5n8padsBG+3psdj/X
	BR5QGoGkp86cXUyZeXfsUgHoteD4l2DP/Uuy/GMNIXcHtepHRpjNmKrJ9s7RUYNogXlDCDc+SNgjs
	+fFFkS8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t61W5-0000000GoLo-26rj;
	Wed, 30 Oct 2024 05:45:13 +0000
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t61OC-0000000Gmkw-3owk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 05:37:06 +0000
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-3a5075ed279so8591035ab.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 22:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730266623; x=1730871423; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CFXbwqz75x0dcmhtSdDEARZ9DfDgZuyYgYubYl4uDMY=;
        b=EX0KNQLLfrEQzHeHDhcUjdw2i8Wr6g4/m06Bbi14IDI5rWVawjgAFUFvmlv3fIXTy9
         1Qrih1K/xcvVh7J25VySp+b3U5e1kz1VhiKId0VmeZAqdwkZI8oKGYvDUhHi4jF8KH1n
         hSLlU2bGIh35Wq2SJ7xO9m3IcT0VIWZYqfWEnd2lk1cr3uYn49MK+A+dUHVM2PZvN3Zf
         VDPh41SH0ssDBhT/d5F+amearMQtUgUJixqgjF3/xMzLZJ6GxLORz3EDR1PaHd8LnwgH
         eXF/24kLaN266i8137Q/aBiOi7tNOeAAySuyclNnDiPswEFW7Vk45jTvYE3ub6VumFBP
         Ru6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730266623; x=1730871423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CFXbwqz75x0dcmhtSdDEARZ9DfDgZuyYgYubYl4uDMY=;
        b=Ld2u2RQDcOYHBa0YQkyJH01eOg1ViaAARMc8hr7nlKzYF0nAjzLBBk89HDRBJpsMgk
         eMgUl8aOX+VWBNwP2BtNqOV0/Z3r3J0KUOg3kaunLO9gh70Zm67vwKUn3GTtXNF5emg3
         AQJgWaSTlMx3Pmw/AIcYmemzzgpeGD6jv3VNTpVOEHJfyzBPDsdqt2xtUygyFt2apuZS
         8MVU+XqVGgCCBgxYU8nrGt9PNDN9sPQI0oXqxcCePx3CsvIyfKEkH59GixGNAZIoMeoL
         wlJ4bgHkQCOL2TF2RgOrq9g4dvsLk/9UrTjdJG1+baUGmgca8E3z8tEi2gHdEOk4Uqh7
         iDBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfqAvofieYrDX0XuYZq4vusFhya9sTUtrvHmBmFek/mBrP/oc7zBeSrqG5WaSsEQMzi9ZLOxGqKGtMl6e7luH+@lists.infradead.org
X-Gm-Message-State: AOJu0YySACna7AiUmI9H3GAKOC3xrO5uunbGHT37ydTGfAba4xTlA9x0
	BkVkHRlTSby5Y4DIdkRcDYWl6uGpZQsSNIzFf8i+fJg2w4NxRCbF
X-Google-Smtp-Source: AGHT+IGlk7MCTYOqLt8nKHysJ7yCgLJD39sJP78kc8zMKZandqcgyCERDYvDZvq5YlTQ37RKXLzqJA==
X-Received: by 2002:a05:6e02:1a25:b0:3a3:f86f:2d0f with SMTP id e9e14a558f8ab-3a4ed27a9a1mr143587155ab.3.1730266623427;
        Tue, 29 Oct 2024 22:37:03 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-7edc8661098sm8516595a12.8.2024.10.29.22.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 22:37:03 -0700 (PDT)
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
Subject: [PATCH net-next v6 4/6] net: stmmac: xgmac: Rename XGMAC_RQ to XGMAC_FPRQ
Date: Wed, 30 Oct 2024 13:36:13 +0800
Message-Id: <b3e99ec1e53bdeddaca3d018f8217aac0986287e.1730263957.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1730263957.git.0x1207@gmail.com>
References: <cover.1730263957.git.0x1207@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_223704_971693_8DEE9F39 
X-CRM114-Status: GOOD (  13.72  )
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
index ee86658f77b4..46a4809d5094 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
@@ -356,7 +356,7 @@ const struct stmmac_fpe_reg dwxgmac3_fpe_reg = {
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


