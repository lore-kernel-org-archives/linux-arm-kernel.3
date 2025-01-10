Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14646E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 09:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ion4rvgZVuG6XSBAcwwShmk186Mw8JOkfuQ4D1b8sOM=; b=YKQ1OYIDU9if9+TJJf/iInqIRZ
	Ch0zjVMixyxSRoL0YK3NvgsGobnj8eLbHEyLsdhrBwwi5tBSFahO7dguYyYgV3+k0M8K9iBWGFtDC
	8TjSKpD7ExwZ7yMuRq956zia6vTKZtXO3giFwSbSOWivqmBjzgLEoyT+Nk+A2sE76uaJIFAidSKxI
	51RdWWiscASQczpot6VToxH3DoMaM/FECC98yzuqoCUmEHaZghjTr4pfutFC10UXQix316qb3h7yW
	zwfIIrJ4yCNg5xQfNBmpyKQfnqwCROAyQzTzYPe/eayx7kxK6wtuWtnk5RamWHzU5eHvQGjodkHsE
	UwDcdb5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWBnG-0000000EqlW-0P3y;
	Fri, 10 Jan 2025 09:59:06 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWBig-0000000EpS7-0OAB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 09:54:23 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2165448243fso34107295ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jan 2025 01:54:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736502861; x=1737107661; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ion4rvgZVuG6XSBAcwwShmk186Mw8JOkfuQ4D1b8sOM=;
        b=a/Ko6lvTXCyf0U+BEAq9x7iqTm7etiJakL2gKhmxixvERP2yoRfpzuc/H3XXD0l8t2
         RNHY1LRrjEl1o1ewUGw540wMVSXfQjyaXj+GbQcaDeTay9th6PWOHATkAeRp35vs+hjm
         U7gsg9Dom0bW9pk1ytBciAyrBc0rTGBEnvgu/zJv9HsiwQEI/PSq2CvF3JzCKlIBtdrC
         MRikG3hqTMMSAu0rV2WIbbIrVFCbgZUjcIrCRObgckSdFX+TMOCGzftbG1XOM153smQc
         PtY9ZofRxCFm5zTkQU8a1PX8H1PUNDB7ETntaOQectOLsaUXd1omHMe440yvE7RcLEYq
         JmyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736502861; x=1737107661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ion4rvgZVuG6XSBAcwwShmk186Mw8JOkfuQ4D1b8sOM=;
        b=fLLlZmzR3rkT2Pn8JBHyxUKWr5kmESrL/yd92fjcygD7fJA3zj2+U+GMpiEQryp3qV
         /9LZo7PPoMfeAKqRjQ7EmNUi3RLi3nUMoOtYwk6zpZWad955ZaDvKcUEzVbRPjMuXxKV
         sIbTGWNq77OFX259KMM5+jN4BI36nJ/thFcU9zzZR6FJqUgtvtSRUzhteskxVpzCD2Fd
         wnxUgNHUAvC8m4+mmbdFbGL0SNyX3vXX60GBxhztEHD9h6M0T9ZzrK+2lP1POPdw73wd
         liEZevMBdheyLvRj6kTp4abbAih9XARu6Hkt4axyTViDl2mPkfV5w3+wEiWB5Bgz7VZi
         G5xA==
X-Forwarded-Encrypted: i=1; AJvYcCW2zNu7dmtUicfl0SHrgoErqvYrCs4gViNAK4tQ7S9rVWoP4JBCYI/tn0v6/UURCKV9Ic4jS78IfbxhQc8t5yTW@lists.infradead.org
X-Gm-Message-State: AOJu0YzpFO1SRe3+b1jOVvYDh5P4HFdFBZjQvyGRGLfmt76fxvguGIah
	mbzSe4en7gVagVjDB3BWwZyNrpA7XCJHe8jAp9QYK7wMmsvgmRks
X-Gm-Gg: ASbGncucnz86Lh89GNvzHu8YrUgpPnDotbMJW78uBMjpkqj8QbyDo2Mc39OKi/yD4Qc
	ZiC3ZRZc1Wd07Awcs0JRjWgwSsgPppplH4esNJlqVJ82nQOAjrkSPCc/v8Tt6g09frEafkkjyTO
	vdwrmgVNOFBrY+lnLBKCsKcVb5nU6fCL0hFyL9r/rb+DPgDkWHAowlcLeBsAh6mCWFB+TMF6iBH
	t421lPMCNXWR0sZFZ1DSF+W6c0jU6yQAa24qKW4pABPW8PR6aTwJx+czqMOApy9WjG38A==
X-Google-Smtp-Source: AGHT+IFujh/KkTTFRhKx5MyKUB6ge9k+IJCqCvJTkEaAIWn/8HcGt05DziMhWszOmGBiewczqCOY1A==
X-Received: by 2002:a05:6a21:339b:b0:1e8:bd4e:c330 with SMTP id adf61e73a8af0-1e8bd4ec502mr734199637.30.1736502861030;
        Fri, 10 Jan 2025 01:54:21 -0800 (PST)
Received: from localhost.localdomain ([129.146.253.192])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-72d4069217dsm1186183b3a.151.2025.01.10.01.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 01:54:20 -0800 (PST)
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
	xfr@outlook.com,
	Furong Xu <0x1207@gmail.com>
Subject: [PATCH net-next v1 3/3] net: stmmac: Optimize cache prefetch in RX path
Date: Fri, 10 Jan 2025 17:53:59 +0800
Message-Id: <b992690bf7197e4b967ed9f7a0422edae50129f2.1736500685.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1736500685.git.0x1207@gmail.com>
References: <cover.1736500685.git.0x1207@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_015422_128600_AE27BB62 
X-CRM114-Status: GOOD (  12.56  )
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

Current code prefetches cache lines for the received frame first, and
then dma_sync_single_for_cpu() against this frame, this is wrong.
Cache prefetch should be triggered after dma_sync_single_for_cpu().

This patch brings ~2.8% driver performance improvement in a TCP RX
throughput test with iPerf tool on a single isolated Cortex-A65 CPU
core, 2.84 Gbits/sec increased to 2.92 Gbits/sec.

Signed-off-by: Furong Xu <0x1207@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index c1aeaec53b4c..1b4e8b035b1a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5497,10 +5497,6 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 
 		/* Buffer is good. Go on. */
 
-		prefetch(page_address(buf->page) + buf->page_offset);
-		if (buf->sec_page)
-			prefetch(page_address(buf->sec_page));
-
 		buf1_len = stmmac_rx_buf1_len(priv, p, status, len);
 		len += buf1_len;
 		buf2_len = stmmac_rx_buf2_len(priv, p, status, len);
@@ -5522,6 +5518,7 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 
 			dma_sync_single_for_cpu(priv->device, buf->addr,
 						buf1_len, dma_dir);
+			prefetch(page_address(buf->page) + buf->page_offset);
 
 			xdp_init_buff(&ctx.xdp, buf_sz, &rx_q->xdp_rxq);
 			xdp_prepare_buff(&ctx.xdp, page_address(buf->page),
@@ -5596,6 +5593,7 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 		} else if (buf1_len) {
 			dma_sync_single_for_cpu(priv->device, buf->addr,
 						buf1_len, dma_dir);
+			prefetch(page_address(buf->page) + buf->page_offset);
 			skb_add_rx_frag(skb, skb_shinfo(skb)->nr_frags,
 					buf->page, buf->page_offset, buf1_len,
 					priv->dma_conf.dma_buf_sz);
@@ -5608,6 +5606,7 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 		if (buf2_len) {
 			dma_sync_single_for_cpu(priv->device, buf->sec_addr,
 						buf2_len, dma_dir);
+			prefetch(page_address(buf->sec_page));
 			skb_add_rx_frag(skb, skb_shinfo(skb)->nr_frags,
 					buf->sec_page, 0, buf2_len,
 					priv->dma_conf.dma_buf_sz);
-- 
2.34.1


