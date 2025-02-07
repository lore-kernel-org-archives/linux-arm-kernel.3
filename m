Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC682C02192
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 09:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0Vx3ELvMf0qmQJJFnyKbMyptnWywqfF72JyrwcCPkjc=; b=bzGjVW9tCMpTIDyQ6lR7F3kATv
	jV6wO82Joaoaon52anwlhcNEdT+Ytrkb9TC1MEs8EiguWjjuy1yBIPs1n4fl+9GZeuS24760hI7WO
	DWtjca9PWNG/Jnh57b2tbnlcG9E9KXxjK5Piv46wQO9yro+CYNpVhpkYOA0GfQpbOGj0Ij+QjWGDa
	eQxRQzeMJJj6aQrwVfQobjsRGkqW2HW7KPmq2BXvRAUJg41sgFqn9bG7M3ev6ACcf1FzIVYLtRJJE
	0830EyFk+KXYmCAr6lYtP/SqnDgCuCHpvu1lS/ayqg1u8BKDDwpozPgxQaI3s+K5sYD/TOb4h4exC
	MWpRKRAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgKL2-00000008wvE-3AbL;
	Fri, 07 Feb 2025 09:07:52 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgKAY-00000008uKI-27FP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 08:57:03 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-219f8263ae0so35981655ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Feb 2025 00:57:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738918621; x=1739523421; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0Vx3ELvMf0qmQJJFnyKbMyptnWywqfF72JyrwcCPkjc=;
        b=gBOVvqwm146Tl5wWTwFfoMKaYyBJsy9zZPwkFouaXGAXcc7ig+1VAQM4KXZNhFHLLT
         nFz0KARxIZ8noxmO8OGcQ85qATkv3RJsyanVD1N3ERtigF6cRZ+avbb4P3+d65RRYcQm
         NiLXXasbWBofD2r5cM7JfDOi8r6p5KTX4z3bfFQYarWNSscsVVG+wTkI7ePMjscq8zRD
         hIsSdRtjah+on0o/epfKch9GRheIgW4X0zBF2vyLet2yudykLdBcy3YpHuIUYNwRGr9a
         pK4ebaaZ78bb8KVPANLWsOI53GJIv2RAvWs03oSteCM09CjWM7jUkd0jJUjpWfrC+o/B
         0CiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738918621; x=1739523421;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Vx3ELvMf0qmQJJFnyKbMyptnWywqfF72JyrwcCPkjc=;
        b=nM73aQ9XjGAGfTMq+YsJ6wlOqbGgXi1ThAMecmAteyt1rBGMLLCX+4xCl2C9xoHpJZ
         xtGSJV3NPopLCMjigZrKKZm685jT0lKL931gcri5LYQaZIWeO4MF69cPyqkRvcc7YLSB
         l1LM3rpSfUB9P8NMxQOtK7MIC1EU41sPClpqHdQIcB/PDzUMh3bgHK15xI8bWMK78+qR
         ccIFnLq6hM7NUlOofENdGkUkZCza84W/y0O9/Vmn36ipKA9Hz/nO40XbtWWysnol2LLp
         tFtl0bmZS0OzHn4vG4KdU4bmuX+OrKSG3cN/uALVmhwgVNlQVy7B0TOG9Pz4r1zSo5te
         I+vw==
X-Forwarded-Encrypted: i=1; AJvYcCVlFS2+SvKqslLmYXySll0PDqCC30hBUC/qW1cL0qo7GJY+YQCnuZBmiEAGHEoRlRGSmQ/drKNxDdall1IjAGrM@lists.infradead.org
X-Gm-Message-State: AOJu0YwiDJmyMQeJ1lMXU5LJSvZS4TW+mITuu1LdzmlMI3pe3fO6S9DH
	xdl0cHj0qh5itQDTjd9XUBkOVNfecBEBwULXZiMvru2/Y2sLrwuu
X-Gm-Gg: ASbGnctH/e96FNaG/+MIZ6oKV589WflG6P6Va+UfVz2pWZJq2GRFjx+vStd4ocVfBUS
	CXwIdhl51QhEMnrAL5bjENNZ4+iqRGzJ+VYB7A2DOtdnl+bDBe3I9InlxGeGa2gqMypSCu065nb
	6W1k5lBe5UlVqRzWa0oBnMxXbU8NV1W7xNfnb3+0nH1JU8Ofw8HfOTZVgzWPfFmLNtKYas6Mfdd
	+uIrCbFpjz6jvTIkyOGmiNS5q7Cc0XuajFEq6jrSlDhOljeFEpeszK1JDEAJXj1abSrPipufUSz
	lf76sQu8Lo9qmZItNnC6CrIbbRy7
X-Google-Smtp-Source: AGHT+IFlNjPnbw667WtlBgeKpirAAyliI8fxFRqc6Br/oWFk5pHJMGbuj7/4JbGsPe3J/2mcAIkPMA==
X-Received: by 2002:a17:903:19cc:b0:21f:35fd:1b6a with SMTP id d9443c01a7336-21f4e76cb06mr47882695ad.51.1738918621258;
        Fri, 07 Feb 2025 00:57:01 -0800 (PST)
Received: from localhost.localdomain ([129.146.253.192])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2fa2716c1ecsm945042a91.25.2025.02.07.00.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 00:57:00 -0800 (PST)
From: Furong Xu <0x1207@gmail.com>
To: netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	xfr@outlook.com,
	Furong Xu <0x1207@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	Brad Griffis <bgriffis@nvidia.com>,
	Ido Schimmel <idosch@idosch.org>
Subject: [PATCH net v1] net: stmmac: Apply new page pool parameters when SPH is enabled
Date: Fri,  7 Feb 2025 16:56:39 +0800
Message-Id: <20250207085639.13580-1-0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_005702_541175_23ACD931 
X-CRM114-Status: GOOD (  14.01  )
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

Commit df542f669307 ("net: stmmac: Switch to zero-copy in
non-XDP RX path") makes DMA write received frame into buffer at offset
of NET_SKB_PAD and sets page pool parameters to sync from offset of
NET_SKB_PAD. But when Header Payload Split is enabled, the header is
written at offset of NET_SKB_PAD, while the payload is written at
offset of zero. Uncorrect offset parameter for the payload breaks dma
coherence [1] since both CPU and DMA touch the page buffer from offset
of zero which is not handled by the page pool sync parameter.

And in case the DMA cannot split the received frame, for example,
a large L2 frame, pp_params.max_len should grow to match the tail
of entire frame.

[1] https://lore.kernel.org/netdev/d465f277-bac7-439f-be1d-9a47dfe2d951@nvidia.com/

Reported-by: Jon Hunter <jonathanh@nvidia.com>
Reported-by: Brad Griffis <bgriffis@nvidia.com>
Suggested-by: Ido Schimmel <idosch@idosch.org>
Fixes: df542f669307 ("net: stmmac: Switch to zero-copy in non-XDP RX path")
Signed-off-by: Furong Xu <0x1207@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index b34ebb916b89..c0ae7db96f46 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -2094,6 +2094,11 @@ static int __alloc_dma_rx_desc_resources(struct stmmac_priv *priv,
 	pp_params.offset = stmmac_rx_offset(priv);
 	pp_params.max_len = dma_conf->dma_buf_sz;
 
+	if (priv->sph) {
+		pp_params.offset = 0;
+		pp_params.max_len += stmmac_rx_offset(priv);
+	}
+
 	rx_q->page_pool = page_pool_create(&pp_params);
 	if (IS_ERR(rx_q->page_pool)) {
 		ret = PTR_ERR(rx_q->page_pool);
-- 
2.34.1


