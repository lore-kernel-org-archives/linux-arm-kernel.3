Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08ABBC02180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 14:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YMPRQoz16EyCK3xxuYYjiNmaFFaTgtlHtG3fh6pk8TQ=; b=JqJyDo01DcoygFOKu/07Edgub6
	RBM1Ba3z+M7tfo091kNZHb8vm7+7HqUgJTgjGtzMIpOBM2oObq/NE+4JqZMgSkxStNcTOpiEwgdqH
	bhIEdaF0P+nrUi0muUFarSgWdsFF0Usgw+IhfJ90hhB8G/vhTPyPllKRYOU+4PnVEku2Mx/L5YF+z
	ELGML9jcxHAtmNpK4JHjizByp7DGl4B0SaRn2uKTY+rBKvSMTdik30X2H742OUYMJFkqdy8aOIwGz
	YZyFxo6GEy934vht6F0AJSZS/ODw12hWAwo0KqWNdgz3hcFfKZUdenrmWE08ItBF4WWvmGNmTUyWg
	WCWlUQIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXLMs-00000005OYw-2pj0;
	Mon, 13 Jan 2025 14:24:38 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXLJO-00000005Npf-0llL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 14:21:03 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-21670dce0a7so92244005ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jan 2025 06:21:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736778061; x=1737382861; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YMPRQoz16EyCK3xxuYYjiNmaFFaTgtlHtG3fh6pk8TQ=;
        b=l9tJfCD+oMSIfN6akmaL9LSvhMZZbHNejlRd1HN4XGwUN1QonyvI3mkqdFIi1mCAoO
         yp0UhVFj28C06aD9olPLM/SOBOQFcus2fnBhNGMH0yUd/sQNDzm9mnQjFt/EPEAyR7ks
         NObwGaSi+BJiQtNn94xNoSGVqTqLhG5p26ra9W/BmXVuX2V8nWr8yMVrCgWGJeEq6eYp
         /OF2BA4x3cECg5mRMOBSk9b4mBFwMKZFs8h/NpRLAqPrfbCQ5cUX98mbA4xwChO/FjCC
         jB+jXqBk4sn6j/9CcHBopS7lUBS6HJGw7gl7nQQm5U8x0kN31gxS4GMhw6CQaCyX7IKl
         Kz1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736778061; x=1737382861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YMPRQoz16EyCK3xxuYYjiNmaFFaTgtlHtG3fh6pk8TQ=;
        b=acrNI7x7az3mvK9aQ/7vDVmZm06wE2rF47BKNMN1bOrbWGOShnR/Z+ARbvudqkkubn
         OMFflXhaRZyiiRBq/JwuK6RpyvBJw9GfrNAmguApXN8ZDCQ0asyOq5obfKnsMb+b6Ge4
         bkTlkWH8BmWU0msCwswpQkfhnVbhmJG+Pq/MMASjZsZHl2EgZaT1ia4WX9/sgLOW86S3
         iw56PykpO1MKR3aHy60rwChR52BhCfkvQdZWjHnao/cYt0RAT0AOo9f8i4itydP5Dh77
         brTp+P6NYoqMrJHWrA6rI2UAt+XqUQYN3zhLvm2fvKn07tONJI9LR2PLlDosS86p/cmL
         6X2g==
X-Forwarded-Encrypted: i=1; AJvYcCWyBcbKNol19t0wDsM/TXfhhfLy//8rHfGL629MlvGbBh26nLPknsQyDfmocPPc1J15w69zNMF9pAapzLuma/mR@lists.infradead.org
X-Gm-Message-State: AOJu0YzkALOs9tFzNBdIZmxuslTiXJQfqTG6/lCsohiyFjj4y0bxwlCi
	tO2JFCZjAYOby2UC7h871UlarqlRRkyU1Eaezh0CDZbF/+fQbGV3
X-Gm-Gg: ASbGncvTbexkwvt4FBCZuTLg4om0MS74DQQ/AM+qOm1zWvO/el7C0aq0oMMOwOvYHXG
	BtYEeu4wNXpjGNUrWyQgSMTZpOMlnKnblbLzfllKrSU9FaC/tcqPiTdngFbVdYJWYzGd7tm0GMv
	t2PzXu4k6oAOlM2/D1zwHK3/Yw3K9ZEK9/znmEGx3AlG76yB26ftnufvF381g83DvxFpioFZAJF
	eYm4zeqMsy1PqR4hlkrHUZa8cSOa7k0iphogR6fl6ouOVRUmd/A0NoYtJHHGHT32sqJDg==
X-Google-Smtp-Source: AGHT+IEzC0EK5taqL22BOdLKvphG994lgupCqXrHRE6t3LRIiNlReqX+BVov6VJfmVVXuiJkjK9M/A==
X-Received: by 2002:a05:6a20:7491:b0:1e1:a06b:375a with SMTP id adf61e73a8af0-1e88d0ddc82mr38181731637.35.1736778061055;
        Mon, 13 Jan 2025 06:21:01 -0800 (PST)
Received: from localhost.localdomain ([129.146.253.192])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-72d4067f0d1sm6089222b3a.136.2025.01.13.06.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 06:21:00 -0800 (PST)
From: Furong Xu <0x1207@gmail.com>
To: netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexander Lobakin <aleksander.lobakin@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	xfr@outlook.com,
	Furong Xu <0x1207@gmail.com>
Subject: [PATCH net-next v2 2/3] net: stmmac: Set page_pool_params.max_len to a precise size
Date: Mon, 13 Jan 2025 22:20:30 +0800
Message-Id: <3f0cad344d45bb15957e20059f9cda44d6369419.1736777576.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1736777576.git.0x1207@gmail.com>
References: <cover.1736777576.git.0x1207@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_062102_226033_CD8E9435 
X-CRM114-Status: GOOD (  14.31  )
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

DMA engine will always write no more than dma_buf_sz bytes of a received
frame into a page buffer, the remaining spaces are unused or used by CPU
exclusively.
Setting page_pool_params.max_len to almost the full size of page(s) helps
nothing more, but wastes more CPU cycles on cache maintenance.

For a standard MTU of 1500, then dma_buf_sz is assigned to 1536, and this
patch brings ~16.9% driver performance improvement in a TCP RX
throughput test with iPerf tool on a single isolated Cortex-A65 CPU
core, from 2.43 Gbits/sec increased to 2.84 Gbits/sec.

Signed-off-by: Furong Xu <0x1207@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.h  | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 6ec7bc61df9b..ca340fd8c937 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -2048,7 +2048,7 @@ static int __alloc_dma_rx_desc_resources(struct stmmac_priv *priv,
 	pp_params.dev = priv->device;
 	pp_params.dma_dir = xdp_prog ? DMA_BIDIRECTIONAL : DMA_FROM_DEVICE;
 	pp_params.offset = stmmac_rx_offset(priv);
-	pp_params.max_len = STMMAC_MAX_RX_BUF_SIZE(num_pages);
+	pp_params.max_len = dma_conf->dma_buf_sz;
 
 	rx_q->page_pool = page_pool_create(&pp_params);
 	if (IS_ERR(rx_q->page_pool)) {
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.h
index 896dc987d4ef..77ce8cfbe976 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.h
@@ -4,7 +4,6 @@
 #ifndef _STMMAC_XDP_H_
 #define _STMMAC_XDP_H_
 
-#define STMMAC_MAX_RX_BUF_SIZE(num)	(((num) * PAGE_SIZE) - XDP_PACKET_HEADROOM)
 #define STMMAC_RX_DMA_ATTR	(DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_WEAK_ORDERING)
 
 int stmmac_xdp_setup_pool(struct stmmac_priv *priv, struct xsk_buff_pool *pool,
-- 
2.34.1


