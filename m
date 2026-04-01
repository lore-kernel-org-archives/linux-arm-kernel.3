Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF1B8109B495
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 04:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DSD4qx/2JYM1VePcNlk14SPwVbO4qzamhYtHorOqJMs=; b=Xoj0VSjFUufNu1oTHL9WC4Qnxi
	qotfyepS1Di/lS1Ee2Fy+fFLs0pwkOSAoD7890zS9A0B9C25bNn5Ow7HhGlLqKYzbYorlbKtZkIr1
	oJMsQ7pixFZ1gyYD4ljdO5eJGCWdqG4Ao+FBISjDp9Kv3cXxMtIj36ljfNSM7zRTjVPf0bFm/J8j6
	TMbbjTrnM1GHh7jtX3cy0CunqaBbjmHEBbTkZqYkFMBTJjiSlI4ZHW4OpxokhpXtBKl4HpQnivl10
	l4+K3FDqcZj/q4XShlpqkCfZ/BXONFU6BlCQgWSgwQmzym3i8OlghgTfzbHzRnFnuZUM/X0tANbe7
	i+jT+pLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7n3S-0000000DwIm-1LUT;
	Wed, 01 Apr 2026 04:19:46 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7n3N-0000000DwHR-1e8I
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 04:19:42 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-7d750eeaec3so2863500a34.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 21:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775017180; x=1775621980; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DSD4qx/2JYM1VePcNlk14SPwVbO4qzamhYtHorOqJMs=;
        b=OrC2jDrxciBteoYF3KmN8TD3+bfUyU3nXUZX2etp8y+3CN2691RG4KXpsWSHFo96Uz
         E57BpgVScDgPSAVryB7ltCo1IhmbipTMhBpFJ0i4V618nplkKnTGXMcMgKF4xgzpJ/u1
         FMpK6A7GsCrBb7mVwmpJg55jQgUHMwp+cUzFXszF1nNko1PciUYQ51ltbI/iMs0k4NeX
         zTHk+qVChYjJRj1PwwNUvSrPfeLJysloxkQji96y8mCzoRS1qyecAsfP6VIyUyOtfw6H
         KvKOIArf90DchDLwyCculbYxV+h9sQyvFHVoa9iYYw2Cw/n3stYkOtwrJGp7rLCtHSku
         w5Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775017180; x=1775621980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DSD4qx/2JYM1VePcNlk14SPwVbO4qzamhYtHorOqJMs=;
        b=kH5PLL/eHwcXAcFFXoeRhWvmaCQRBhP4SRghJfh+HSdelLpga52mLhbh2KOu80ck9h
         hyhSA0dhlAsj0COpSXHo9lNIAiHMmCzr13gycsfzkCGU2gwRCVOgqycDlmkoPtAMMwEi
         QD51YEvPPC992wT4QHjDWoABCVDZl061Vx6p6OicRUF1AzOrv5tAzFeFyR/sw1/tjSxp
         Iw9QuQQy2PFSBnWOYi+3I3GK2hi1A4T2zUjaDxH2MQk9eLeakwFMXUtN/R4jLf8wXmYd
         fqxy659+5h+/4iHBTzWr4z75EwZnnvzrMAzjwJGJalOtQz3nNglVh7ivB/9MXXLtq5x1
         gkbw==
X-Forwarded-Encrypted: i=1; AJvYcCWu/VvodI1dBJYJ+8xIJARwJco0NVcs0Wr5csO3r8YyDIHlTOcrzE2YRS3uanXY524unEy34axKvjYFBb+2Izg8@lists.infradead.org
X-Gm-Message-State: AOJu0YzSJj7iOEctMsHMSgImXLJn0yDG4UvZLciRho607kkpGjJVlNpx
	T6qCF9T3daoBT82dBqsxUMhXB9fP5oXow4bGsX78gTr8dlOvoi2t9YbS
X-Gm-Gg: ATEYQzxEOXYpyxb5i1MTkwLgkmzMv2QPXX2dJur9bal8m9HmbDZmvEURXlIrxoEV99C
	zTZXXxMrHQidfZutMb9mcPGK2iN6Y1OHrujXLcS0Zkf8plsN5hxSI53tNmXYlF2/Ypji9RLqnOo
	cLiqGorS4eKL+luW/DRPr4V+PJmGT8Xsn4CcZNF3WnywEVas1c3RYcMOkqX0Jjw/QUxAbcukewU
	nbpQ+eXgt/1ER+pNBBsnnToxs8joWV+2cZZsvShF+PVsghl8IlWwgXKc7nd5pDHoTwiTSP3oQpD
	A+1FuSX3kQLu+sbDYihDlhs/47u+aWHYVrztmyZWVNaT6ytCbjd5HdKSFqO3TWVJZPL01zK5Hj5
	jVYeu9vVqvivNqw/PDYWW8Jw/iaEq1+Pl2ggRgzFqsxYmeu1943Wbt5tSO3BV24LVqWEKwDraCq
	w4zEB5AxvHZ9e0f3hyBtavSZDfaZ8wFyQCNmuttIk4P9eDKT+NwvN2Gha9yok=
X-Received: by 2002:a05:6830:452a:b0:7d7:db95:eee9 with SMTP id 46e09a7af769-7db994cf1b0mr1337728a34.30.1775017180356;
        Tue, 31 Mar 2026 21:19:40 -0700 (PDT)
Received: from localhost (static-23-234-115-121.cust.tzulo.com. [23.234.115.121])
        by smtp.gmail.com with UTF8SMTPSA id 46e09a7af769-7da0a384631sm9647188a34.7.2026.03.31.21.19.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 21:19:39 -0700 (PDT)
From: Sam Edwards <cfsworks@gmail.com>
X-Google-Original-From: Sam Edwards <CFSworks@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Ovidiu Panait <ovidiu.panait.rb@renesas.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Baruch Siach <baruch@tkos.co.il>,
	Serge Semin <fancer.lancer@gmail.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sam Edwards <CFSworks@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net v4 1/2] net: stmmac: Prevent NULL deref when RX memory exhausted
Date: Tue, 31 Mar 2026 21:19:28 -0700
Message-ID: <20260401041929.12392-2-CFSworks@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260401041929.12392-1-CFSworks@gmail.com>
References: <20260401041929.12392-1-CFSworks@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_211941_445858_47994CD2 
X-CRM114-Status: GOOD (  19.01  )
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
index 13d3cac056be..fc11f75f7dc0 100644
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


