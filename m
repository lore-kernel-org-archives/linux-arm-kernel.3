Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5654109190D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 18:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FLw+KspfNI17fHokU2DyOGE90apcIrKC40CCDarAeuo=; b=bMYSXQp/nj7Q/G+sEbXKNQjYkK
	UsPtwhi5WR9Eh+5jVrgxNyWh+9gT8kPQACtUcd5iUo3S2vRWQvy8KJ2Y+Pe3S0KyvdT8JWndZBpl6
	TOcQIL6m4UARxEDHhVQ28yWF6dVNuTZ3WaZHcG5d0S1dxxS/mmQty6iGl5F0h1F2Thrp2PdiPHb4v
	/THFkraGQSL2hT79JrC7e0XawnnZ55WRn7jBo1QmII2MB1TmlwEWBH3MEhKhOnwx8iZ68K+K+migL
	OaHKsYclkn/dF5R33kFSgQmBoN7+41HaSndlwMSAjuQJYIulADcaa7qeXdUCdzb9qu9CRGFdis8NV
	7VOeDB3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3IIz-0000000BN48-443b;
	Thu, 19 Mar 2026 18:41:13 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3IIu-0000000BN2b-30YJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 18:41:09 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-7d7e94e0db7so167856a34.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 11:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773945667; x=1774550467; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FLw+KspfNI17fHokU2DyOGE90apcIrKC40CCDarAeuo=;
        b=gF/vhny6Tc3+1DcOZhOuoU7l3G5YPFIEi528HFZDMr6Br3do3IuM4xgI0vJ6iQZTWP
         gDEMGTMctxvh5fbmA3dG7mYxd4DoKWkpgzVZBR1x5y3jwKtAl8WKh4sQHsDjyawEpQ8t
         Gv8vbfEUPWyJeIWvwHVv41lATzO15n2ghYSIjZBy2uc/lSMkT0XOr/dfUP9w7/iFVd8z
         0Xpe4sbBbl98nwxNIe7Uw+bHEEjBSxucFafF+WqWd4a0SfmK7LGk006skLbn1OZPJ3Dm
         6r8qb7Fy3tewVuX/URlzP0dlgVjDC7gzJE/PyDvmsQX2yZTIkTeOqkT/DBhWBLhdKNeJ
         Tq6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773945667; x=1774550467;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FLw+KspfNI17fHokU2DyOGE90apcIrKC40CCDarAeuo=;
        b=Ly0wPPAKDEfeyN3qhd+eDu8N8eVxoqBG6AEcXXrRZLst/Eg/1Lt9S5rGMrGy57qBMO
         9CJUHuxgTiwmvO6os9EbUhWrmxM+bZsAwlvvR+RtzV8/4y44WMoiFWHmhPZk3D6Kv5iB
         hYvOCbYAoIKMo1HigEFMsrmdAiqlrmsdToMjao7H89I8V3Fh4/gu4fI1q5befcBcL+He
         kGpLeJxW4Ax0HOHS1q9i0FKPRQ3jFVycZ497WQKtcD3FWrN4HTzuzp95ZR/2fkGjDTli
         54TRcMcsnuMCoDxqIXr1JeytNPA93au/6Q/OKgYt+NEfy5DHEP1DaNNmPJpfnD+NZetK
         B2BQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4VbAWCq4QEokqSQpw4SUYpkvGtChle7cFpvnlbaNhENib5eMDPA8eJe3/0PQu3Qle2gCU1NRk8hxY1ejJyJKH@lists.infradead.org
X-Gm-Message-State: AOJu0YwpZegRgeeb9yBHpIpYR81U6zKXySyVIOlWFZSFFBjQ9MHxqyde
	+Pgu7LIf5N6od7Qr2e2zpaJEloTe643ehe44UPQ5vOnzc2PQ3UhH8Afk
X-Gm-Gg: ATEYQzzdUjLSSocc0080/PIxQTFVIgppnPzzJqmG8L1Vluuh6Hm4En0eN+3w9mCbBsr
	TvA/vU/qzTKnw5YW0nAG0aCoFa75ApZDF1GG1JPBzkBEuVyVsfLZppOzhzS6GSMvlcZagLtorpk
	w3S3iWYxsj3we54WDGHWF5anOo/mJbJoGLKpJEGI9scwCgn+gDAmUA0c3DLADIKY1Rtp8g6opzc
	ntTvCjz0fgIxUwWOh3HQ89Ncwu0Fa6yjl3r2wpZ5GIEmfS3HIrFqg0PK1swYVLrQu+Azz46VNaX
	ZeArE5gYK4SGXQ8xMAJ7zqgrPCbwl8NbFvvohXkMy1EvvBaz3uxLtjHtgv22joDxmbgwSxmrHHi
	nIuIUVmZKJxyB5MMSwHdvEOLQJINMyuNb2a1KfPP6klfH6Dc64O0hkYPVGva5fgxIYHaAThFU89
	36K39TmdlC8ZQXfGkiqhL7Y/cOclWJEklz3MZ9WEZQjcrrIjdExIMmFl9UUgXwVkOQo5n46MJj7
	L0dQrrTOhg=
X-Received: by 2002:a05:6830:651c:b0:7d7:d0d5:5bf6 with SMTP id 46e09a7af769-7d7eaf4f4femr168906a34.21.1773945667481;
        Thu, 19 Mar 2026 11:41:07 -0700 (PDT)
Received: from celestia.turtle.lan (static-23-234-115-121.cust.tzulo.com. [23.234.115.121])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d7eadcb757sm181486a34.15.2026.03.19.11.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 11:41:06 -0700 (PDT)
From: Sam Edwards <cfsworks@gmail.com>
X-Google-Original-From: Sam Edwards <CFSworks@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Russell King <rmk+kernel@armlinux.org.uk>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Ovidiu Panait <ovidiu.panait.rb@renesas.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Baruch Siach <baruch@tkos.co.il>,
	Serge Semin <fancer.lancer@gmail.com>,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sam Edwards <CFSworks@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net v2 1/2] net: stmmac: Prevent NULL deref when RX memory exhausted
Date: Thu, 19 Mar 2026 11:40:30 -0700
Message-ID: <20260319184031.8596-2-CFSworks@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260319184031.8596-1-CFSworks@gmail.com>
References: <20260319184031.8596-1-CFSworks@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_114108_765528_2DF1DB02 
X-CRM114-Status: GOOD (  18.93  )
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

The CPU receives frames from the MAC through conventional DMA: the CPU
allocates buffers for the MAC, then the MAC fills them and returns
ownership to the CPU. For each hardware RX queue, the CPU and MAC
coordinate through a shared ring array of DMA descriptors: one
descriptor per DMA buffer. Each descriptor includes the buffer's
physical address and a status flag ("OWN") indicating which side owns
the buffer: OWN=0 for CPU, OWN=1 for MAC. The CPU is only allowed to set
the flag and the MAC is only allowed to clear it, and both must move
through the ring in sequence: thus the ring is used for both
"submissions" and "completions."

In the stmmac driver, stmmac_rx() bookmarks its position in the ring
with the `cur_rx` index. The main receive loop in that function checks
for rx_descs[cur_rx].own=0, gives the corresponding buffer to the
network stack (NULLing the pointer), and increments `cur_rx` modulo the
ring size. After the loop exits, stmmac_rx_refill(), which bookmarks its
position with `dirty_rx`, allocates fresh buffers and rearms the
descriptors (setting OWN=1). If it fails any allocation, it simply stops
early (leaving OWN=0) and will retry where it left off when next called.

This means descriptors have a three-stage lifecycle (terms my own):
- `empty` (OWN=1, buffer valid)
- `full` (OWN=0, buffer valid and populated)
- `dirty` (OWN=0, buffer NULL)

But because stmmac_rx() only checks OWN, it confuses `full`/`dirty`. In
the past (see 'Fixes:'), there was a bug where the loop could cycle
`cur_rx` all the way back to the first descriptor it dirtied, resulting
in a NULL dereference when mistaken for `full`. The aforementioned
commit resolved that *specific* failure by capping the loop's iteration
limit at `dma_rx_size - 1`, but this is only a partial fix: if the
previous stmmac_rx_refill() didn't complete, then there are leftover
`dirty` descriptors that the loop might encounter without needing to
cycle fully around. The current code therefore panics (see 'Closes:')
when stmmac_rx_refill() is memory-starved long enough for `cur_rx` to
catch up to `dirty_rx`.

Fix this by further tightening the clamp from `dma_rx_size - 1` to
`dma_rx_size - stmmac_rx_dirty() - 1`, subtracting any remnant dirty
entries and limiting the loop so that `cur_rx` cannot catch back up to
`dirty_rx`. This carries no risk of arithmetic underflow: since the
maximum possible return value of stmmac_rx_dirty() is `dma_rx_size - 1`,
the worst the clamp can do is prevent the loop from running at all.

Fixes: b6cb4541853c7 ("net: stmmac: avoid rx queue overrun")
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221010
Cc: stable@vger.kernel.org
Signed-off-by: Sam Edwards <CFSworks@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 6827c99bde8c..f98b070073c0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5609,7 +5609,8 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 
 	dma_dir = page_pool_get_dma_dir(rx_q->page_pool);
 	bufsz = DIV_ROUND_UP(priv->dma_conf.dma_buf_sz, PAGE_SIZE) * PAGE_SIZE;
-	limit = min(priv->dma_conf.dma_rx_size - 1, (unsigned int)limit);
+	limit = min(priv->dma_conf.dma_rx_size - stmmac_rx_dirty(priv, queue) - 1,
+		    (unsigned int)limit);
 
 	if (netif_msg_rx_status(priv)) {
 		void *rx_head;
-- 
2.52.0


