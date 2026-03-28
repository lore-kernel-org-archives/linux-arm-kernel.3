Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FA9410BA423
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Mar 2026 19:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FLw+KspfNI17fHokU2DyOGE90apcIrKC40CCDarAeuo=; b=IY4OYAg+XC/CC7sXu3eHG55CD+
	hhWMbQYFL8JbApqMO1PRUF6CNTEunypqb0PAsZRqz0DiJLi/BAbfMoxvUv3fu9MByxOejxNTeY/4a
	3/alflMvvdW5rNvWWySjltznqW96+vkegcek1iRpl5QT83Eml3C0refu602EewEpTwiPJvjweBeEM
	TzkuCD1+Yx+bvVMNY+zzM6iOCyGZ/p0RtpHu1pNEy+xSSLD6CBmi5xBeYBerf4f5WAEPL2gBsvVPL
	fE0qrgkgCU3jkg7V1jPFQPhFyeMYZP2NI/yX6XMEslrUN475fvqxjm4QEDHnl5Q7cp0Td4pbw67GY
	TWcJMqzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6ZHq-00000009FPC-0qex;
	Sat, 28 Mar 2026 19:25:34 +0000
Received: from mail-dy1-x132e.google.com ([2607:f8b0:4864:20::132e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6ZHj-00000009FNM-2tp9
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Mar 2026 19:25:29 +0000
Received: by mail-dy1-x132e.google.com with SMTP id 5a478bee46e88-2bd9a485bd6so6174940eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Mar 2026 12:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774725927; x=1775330727; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FLw+KspfNI17fHokU2DyOGE90apcIrKC40CCDarAeuo=;
        b=p5TAULVkICK1PKsp17SLXFavoT7zwKof2+h3UrIXrO6AeApDpCiw5GFYB3SuaWeqcD
         IN50HQ7D2MsZmn8BzbutM0VAd5wXSESRDi7a+PF9exoOngVuL3m7bczGMl1DKBfopI/O
         X2Wrt9AdSzYRNqGhhF2J8AFZQfQKMOch7zWBaxlR4nM2H+GQfgKiNWCHM/dt5K7AscJd
         JI3wLI+GV/DF4RPBpHaFryIhMCqPp3jHv9LWkfh3/Ab4LohZE9pf3GmBLQsfBBSjmZVb
         BkHjH/d/hXfvye8Im3ifvEqYfDTJfmSq2EnWVR8grLy8+rZemHSCue3vEkkgoI8WqRAJ
         QP8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774725927; x=1775330727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FLw+KspfNI17fHokU2DyOGE90apcIrKC40CCDarAeuo=;
        b=Mi/XxzDbSj65OJFPQx5L7Iv3g0TmQAJNzmk9DwK5XWivMuqUA7OxuSrAzz+TGLZV2C
         Xjp8ZxU6RXDfpe+M4kbCkMMS+JSIoZKZD0XvjttUWq4Kf0JrOjtIBZX1c4iuIY83ZsUg
         HfKpEDBl1fACsqfVmq/vTiA//AODTX1m1VcR0qvgiTZj97gVH+jls1hd28cfocxYV7Qd
         f8Sfo0yKNMcBuRCIPhTD6KwDmpDz98IFWMa1aIXNEyCEynNulo5D9N1vN+xvYPYnmexN
         EvUgaMIEzfz7kLx5QCKWeideJyF0W4RGud7LRPJG/54AIE0QAoUehn2dy0KGT2LECVjj
         YmLw==
X-Forwarded-Encrypted: i=1; AJvYcCXviKQHIVJUX6eJXyIAu8CrwFERn7AdaMzIWtmTzy/5RaZE/c3JLrLjZD7a8q+6LB1P/hZuRdOiKFxUardSXI9t@lists.infradead.org
X-Gm-Message-State: AOJu0Yyn6onUPcPT6lnlbADMwY/8gNsXktnRG8cgGJE4WdY6UGSM8DkM
	wk8cNUwuMiDwHPqFMvls7J9BypnQbAo/fhJXf7k8K/31hh7ryqE0tMQZ
X-Gm-Gg: ATEYQzwx5LOjAuCYnky5vvqSwwcbBMCzTHAhBD26gFuh3lq19WfTzR+tGVw/COTBaz4
	YkWFswnaNAp01uLou2qxrMow7mH8UCgZL40o5cKO1g05/dhqOEYFNdJI1FnZwprZioeZ4i/g11o
	vHKAtRwLcMiPVb0XiSPvT6ldr5a2cOmXJOvXfMKFy5Kj7CKxfBhg3nz5FclnKs3rmUUZBZougV+
	Xf1wvBnCCwvfX/BTIIBr26CxtfXesHROVGyTMXmz0qnfS+NbPaqTzoVHPrmwYLvoM1jRMq4BfS2
	2YJz65czuf1Ljotye46V4FNj2BNcSOC0wq4xeUooo4Uen0CjiLGUj3ob9tZjiF4atIc+hm5d4Cg
	VLQQpfUVQvoEe8TZWPG2B/ENMx7p5YijpJr7kbCKK+tC5t6ccNj+I1t51gIxLrjXidIxnfJi8ez
	qtc2Qa+MMcEqd8TUEAT2vX6U4X6tgTxrCipcH+dzBseHGlnKq3eJ0rXLVX
X-Received: by 2002:a05:693c:3282:b0:2c0:c96a:a4db with SMTP id 5a478bee46e88-2c185d8e84emr3824454eec.4.1774725926850;
        Sat, 28 Mar 2026 12:25:26 -0700 (PDT)
Received: from localhost (static-23-234-93-211.cust.tzulo.com. [23.234.93.211])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-2c3c79722e0sm2905771eec.31.2026.03.28.12.25.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Mar 2026 12:25:26 -0700 (PDT)
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
Subject: [RESEND PATCH net v3 1/2] net: stmmac: Prevent NULL deref when RX memory exhausted
Date: Sat, 28 Mar 2026 12:25:02 -0700
Message-ID: <20260328192503.520689-2-CFSworks@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260328192503.520689-1-CFSworks@gmail.com>
References: <20260328192503.520689-1-CFSworks@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260328_122527_939112_86477631 
X-CRM114-Status: GOOD (  17.99  )
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


