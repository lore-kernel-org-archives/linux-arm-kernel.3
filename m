Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3DD9C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 03:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8UUplh7fAcpeM7Q5zE9FRPEWMTlb68cB4RMo0G5W1ro=; b=DtS/5qwlN8kTBZU5iwwlUH6V1i
	Xm2lWZXaBB5VlADOA/RiKNXO78pHqHurY8t3zh1nThYyYXNiNQZ8qCO4gdAkvJh/bp9hzT6EMtsmp
	1Hk5iDiz6T+qtjb4OojHFaQLZG2AkXJwhdnotnZWQRjtqLhftSLm18WvZEyRJws0XZP6296cxK4yE
	nGxJIiYqDoyIoVpLdijM2Eyi2OZK8DL5Uv63y0Im0NCWIZNC1kOqjpPkrfSmhgGeTDOXiBfSHDBs9
	aoPRn7Vd5teXrjyzTigFoQwp+fR2oKspD0+Ccaj3ZDhodFGIrFGqXdpsLqDvYVFLcCA42fa5vfLU5
	+0fYBQYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXu7l-0000000AVsf-0E4V;
	Wed, 15 Jan 2025 03:31:21 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXu49-0000000AVFs-0l6O
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 03:27:38 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-21670dce0a7so135234615ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jan 2025 19:27:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736911656; x=1737516456; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8UUplh7fAcpeM7Q5zE9FRPEWMTlb68cB4RMo0G5W1ro=;
        b=AyA0vTO05rWdhJevl8Cd6fGLLe7B9bkWUheYTqWeuiFWb/c0v6CYuv8atMqgc8CUv9
         oQvOc3QDBvURqWYzr27YYXn90g4ykSBldWfsTO2vqVZ5s8s5sC6YZNR0/giYvY2Jba9D
         1cRyFZr1K7yLplAoTNU7ZU8Wq0dSRJUmfOVw7aeGynlYOJP/DposEus8Z4ucnH+EY3wr
         Lbchda+MvjMAS7WaDuWt9lx+aXDYRXVt5Xi27mpr64TSh6J3Imux1yQkapE2EE3qU371
         XztODV9xl7fwC47iKADA4DwDPRT+j8wM5TFJJZuMmAL7Ofa5+L6fx74EMcznMj16aeEo
         hZ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736911656; x=1737516456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8UUplh7fAcpeM7Q5zE9FRPEWMTlb68cB4RMo0G5W1ro=;
        b=mDae969dhMulWbYUw7V6S8jG9yS3cR8QUbZG/JJa/R6iFgYiRF1ULGC7TVWgPOXMQf
         m34CqwP1wuj7CvP0Q/uihjdB49hggIAJuQzZ5nYLvPna4tzWssu1xqiKmdmmOneasUi/
         T1MaJglae0WyTzRmgrBCEzAiAp0S8TAkJxYYAHCq6qVmyIwTdJthyr1DU4xX/yvAKOJ0
         OB2lw+jBH5dDTao5tAUeRK54VFzX0O2HQ7U7qa+KDASBWPnOFQTQvV4A5S4UhFZBsw6i
         5VK9sGhqUCePjOSsCnN0LyWkK1Ap77co00gGI/QCH628WrfsWz9O5wRlxRJHLKXEL/Ms
         +JWw==
X-Forwarded-Encrypted: i=1; AJvYcCVqw4yILF9XpJrv4Y//ycsJOrX/6yT7sPheAnmitN6aY7PlqrvhVwm1uEn4hbpVF5JKp2sVwRC2rFfMZ7gdLSLf@lists.infradead.org
X-Gm-Message-State: AOJu0YwGj03P8Zzsr/MRNmDaEqSohtwxYvSmU5n+5lZvspF7sjLz7d+q
	k50aeYJIN18Z5NM1uPL0du9L2zG+7NnGdQi985EDdDzgh/b5EwznhJg/Rw==
X-Gm-Gg: ASbGncssePv1zBZguzDoeQlxkvAReNr6gkovlY5bPVx9cJJf6F9jxurG+uz4Yrs8BWh
	RamwIAZBKJqSWm6FKUtObDJbRM/RFtnhVRMfcGZLA1GT4sUkNfeGKr97c2DMzz4V0rjM84EExmv
	6E012rOYeXefAFGd/0ouI2HfQTw9GlID1lXrVxO7En1Oe0WjMlJ/3jbgg2wkpBfeI19/VCefDyX
	ERw+70gptnP30809sLIHK1ymyZ6wOPVet99hw51v3wJg1URMRWGUR1Y6xu2YvPRdTqi4w==
X-Google-Smtp-Source: AGHT+IFNvLpuNXbqq/IV5KYaf3Nik/z1qK9SvaIPNMSsFV2O8gjEl3T3nKlKoNCJXm0ou755RaN0PQ==
X-Received: by 2002:a05:6a00:340c:b0:725:e015:908d with SMTP id d2e1a72fcca58-72d21f459b9mr35478358b3a.1.1736911656332;
        Tue, 14 Jan 2025 19:27:36 -0800 (PST)
Received: from localhost.localdomain ([129.146.253.192])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-72d405493basm8166452b3a.27.2025.01.14.19.27.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 19:27:35 -0800 (PST)
From: Furong Xu <0x1207@gmail.com>
To: netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexander Lobakin <aleksander.lobakin@intel.com>,
	Joe Damato <jdamato@fastly.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	xfr@outlook.com,
	Furong Xu <0x1207@gmail.com>
Subject: [PATCH net-next v3 2/4] net: stmmac: Set page_pool_params.max_len to a precise size
Date: Wed, 15 Jan 2025 11:27:03 +0800
Message-Id: <538f87c8bdd0ba9e2b9cb5cd0e2964511c001890.1736910454.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1736910454.git.0x1207@gmail.com>
References: <cover.1736910454.git.0x1207@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_192737_218323_14BFC32C 
X-CRM114-Status: GOOD (  14.15  )
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
Reviewed-by: Alexander Lobakin <aleksander.lobakin@intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.h  | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 1d98a5e8c98c..811e2d372abf 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -2059,7 +2059,7 @@ static int __alloc_dma_rx_desc_resources(struct stmmac_priv *priv,
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


