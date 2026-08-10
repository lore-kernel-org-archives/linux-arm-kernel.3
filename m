Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 566E0C5AD4E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 10:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FVhnTJBrATFNd+yhmpURH5NgNQs7Wgyvv9zxL1wJeP4=; b=Ydh4VJGseZ/JoVWCSCtgUYrrDs
	FItlcf1KO3XhzDYMjdWEPIANwCqFTXW31PpzRTN1ABmS1daVQZ8deSNCFvo3L5sNjCWTWxEfy008i
	AkOs4AFcHcXdmMoGqnHC0Z4UCkTpY8RI0hOAUby4uCPAkjQfphy/HhPMWzfM+mfQsUErbShDbZ6V9
	W+oBuCxI3Fzwff6WpUjx6JLxljEZiR1xwGAudUbovIZAUidgcVPBkUZIPdmteZJLTvUBrizNl3HsO
	alStKa5QDXT7FaYTjrOe6Ju0xwhehLIz1l9jqF7ru+ScTfMGNGIAZpq2RHvUkz22bDGUdctCnFHdQ
	nmvPw5Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtN83-0000000BUaE-1MsZ;
	Mon, 10 Aug 2026 10:21:11 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtN80-0000000BUZI-2NMi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 10:21:09 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-84a2dcede83so2153870b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 03:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786357267; x=1786962067; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FVhnTJBrATFNd+yhmpURH5NgNQs7Wgyvv9zxL1wJeP4=;
        b=knW1okXzD8HxrovUb8pjsPU8LBH/UnlUQblfs6nLm1d/SoSgh7q+6Qkpte52QSzxAj
         fZs3RUIADVAHp/W3tyFefwWHhlwvdixMO+h3l0tBwXl8a3YZn79R7an+K85oKrw1BlXj
         obyid7HPamEzbLr6JiRORt6V7cWbUOPckQC+Uk/xArBqE35mjft+R5g9jpOvkz8LQItF
         wBBXCpUslUiPnBgHBfah1F+Za23Ut0avTJ7jMh9Q6wwF+cKtDQB2UsPtcHHA42YHa2kR
         LfDpk6aOA6RBvohFBwYbueemLy6LZh6Gi0n83rI7upIAmJvwpjsSxiIu8eps8SUaDzqQ
         QbBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786357267; x=1786962067;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FVhnTJBrATFNd+yhmpURH5NgNQs7Wgyvv9zxL1wJeP4=;
        b=rUDeqyzHQOL4kLpAU2KCPv5x6u4ieD3XCPojtWV5jBlm6UU3StxHgxri8ujQSAFI0c
         U7GfruwwNX6K7mJHS7fIBbcMZylMBKvGNkfN7mJN5sJRDYu31A0obVmiAokljAzKZPRN
         RTjxXqx/Sj6Qlg5lsWg2/pCdwClu0eUZmJC/Iv9U7EmDlVk6LKdnZl4cGCANr17dDfsy
         mKZyUsJwxjJaM13p6BysN59QjMz34nfdmC3DwsG0hOdSiNJSkyNsMaVB3s1hQHT0E9DL
         QYimS7dS3CpTQ1NT6I3Z1rZXEiz+nGp0e1Lq2JEDI46MRNqI42gm6doHfugbB0qoHAaf
         MhKA==
X-Forwarded-Encrypted: i=1; AHgh+RpQ6/VYe425nI/zcGxmzKkWHISwHCLsNyrpIk1Qy3XcAGP/xY9yn4rnjtAPtd+mwziQ2s9d/QkBZ6IBsQ/4nAoy@lists.infradead.org
X-Gm-Message-State: AOJu0Yz67p3WMCYWBB7UMou/rjtY3KKXIHnc9T+IaiQZ1y/51n+Oi2yT
	Na/hgbdgFOZEYReS95MHrP8kdSgrkmmfBP9xeW2zFxS4AlVSsLtPMMuq
X-Gm-Gg: AR+sD12Q+D4Ng3yYBBmL6r4Tqd/ZWYgDTIcg4+SVWZcAJk/y44VPUQH2qRQGRIKCC4l
	uBVOu5kPzvWkKIT//heuYyuqYrgd1NMYMDXaKf0fBBSs8tzNk+UhxQ3Qr1XBb7tYi2pSwaupGmK
	UlQvRoeOH6Mew8An0uQa039s72mt5Us4GxFzOt9ZT8p/wbSu8x98KmaYe+jCIKUCyPpZ07rBpmh
	TnNk91pZdcLvVZgdTV0iOwJzJbLr/pCJvyuIGdJjRFK9nOghH+ijiRzmTxGKeWuSZMC28NVdIc4
	53s7NTFcHMDlMB2Osnf2FOx4P9UU7Y7PhhmP6x324oNxcRO8+5oEVMPI3ubLipLIVmkMtfn2PQE
	7tt6felVLAXMTmIovg1TFOV/OEPAKvBGVAwrEy5dFWBMUd9/EVOOtAs0vP5DhTbKrL9/SbWMffm
	o7zfQgUMsrPDcfLbrxea8VkSXKAlbsuScXG+Ve9i4CUoB6JynEMgq0B1lWtIrxUyKO4S2BQ+nM2
	Q==
X-Received: by 2002:a05:6a20:728c:b0:3c0:b4f8:bbfb with SMTP id adf61e73a8af0-3cbc03b5531mr22783805637.22.1786357267350;
        Mon, 10 Aug 2026 03:21:07 -0700 (PDT)
Received: from amd.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315bec68468sm44276912eec.31.2026.08.10.03.21.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 03:21:06 -0700 (PDT)
From: Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	dmaengine@vger.kernel.org
Cc: Frank Li <Frank.Li@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
Subject: [PATCH] dmaengine: sun6i: fix use-after-free in descriptor error path
Date: Mon, 10 Aug 2026 10:20:44 +0000
Message-ID: <20260810102044.1725649-1-nagachaithanya9911@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_032108_611410_21C2681D 
X-CRM114-Status: GOOD (  11.80  )
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

The err_lli_free cleanup loops in sun6i_dma_prep_slave_sg() and
sun6i_dma_prep_dma_cyclic() free each LLI node with dma_pool_free()
and then dereference the freed node to obtain v_lli_next and
p_lli_next for the next loop iteration.

Save the next pointers before freeing, matching the pattern already used
in sun6i_dma_free_desc().

Fixes: 9aa48806edb8 ("dmaengine: sun6i: Do not use virt_to_phys")
Signed-off-by: Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
---
 drivers/dma/sun6i-dma.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index f47a326dd7ff..2439fa6564f2 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -720,10 +720,10 @@ static struct dma_async_tx_descriptor *sun6i_dma_prep_slave_sg(
 	struct sun6i_dma_dev *sdev = to_sun6i_dma_dev(chan->device);
 	struct sun6i_vchan *vchan = to_sun6i_vchan(chan);
 	struct dma_slave_config *sconfig = &vchan->cfg;
-	struct sun6i_dma_lli *v_lli, *prev = NULL;
+	struct sun6i_dma_lli *v_lli, *v_next, *prev = NULL;
 	struct sun6i_desc *txd;
 	struct scatterlist *sg;
-	dma_addr_t p_lli;
+	dma_addr_t p_lli, p_next;
 	u32 lli_cfg;
 	int i, ret;
 
@@ -789,8 +789,11 @@ static struct dma_async_tx_descriptor *sun6i_dma_prep_slave_sg(
 
 err_lli_free:
 	for (p_lli = txd->p_lli, v_lli = txd->v_lli; v_lli;
-	     p_lli = v_lli->p_lli_next, v_lli = v_lli->v_lli_next)
+	     p_lli = p_next, v_lli = v_next) {
+		v_next = v_lli->v_lli_next;
+		p_next = v_lli->p_lli_next;
 		dma_pool_free(sdev->pool, v_lli, p_lli);
+	}
 	kfree(txd);
 	return NULL;
 }
@@ -806,9 +809,9 @@ static struct dma_async_tx_descriptor *sun6i_dma_prep_dma_cyclic(
 	struct sun6i_dma_dev *sdev = to_sun6i_dma_dev(chan->device);
 	struct sun6i_vchan *vchan = to_sun6i_vchan(chan);
 	struct dma_slave_config *sconfig = &vchan->cfg;
-	struct sun6i_dma_lli *v_lli, *prev = NULL;
+	struct sun6i_dma_lli *v_lli, *v_next, *prev = NULL;
 	struct sun6i_desc *txd;
-	dma_addr_t p_lli;
+	dma_addr_t p_lli, p_next;
 	u32 lli_cfg;
 	unsigned int i, periods = buf_len / period_len;
 	int ret;
@@ -870,8 +873,11 @@ static struct dma_async_tx_descriptor *sun6i_dma_prep_dma_cyclic(
 
 err_lli_free:
 	for (p_lli = txd->p_lli, v_lli = txd->v_lli; v_lli;
-	     p_lli = v_lli->p_lli_next, v_lli = v_lli->v_lli_next)
+	     p_lli = p_next, v_lli = v_next) {
+		v_next = v_lli->v_lli_next;
+		p_next = v_lli->p_lli_next;
 		dma_pool_free(sdev->pool, v_lli, p_lli);
+	}
 	kfree(txd);
 	return NULL;
 }
-- 
2.43.0


