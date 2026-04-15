Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EA67F9D0CE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 02:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/4pZEJvuS7ozDbMvLtLQ4Yf4fNz+jgNzCYp57Or0UAE=; b=E4mLkLWM/9pwkpyVFQvzq7xkV/
	wMBDfM0AiNBAjcduMH8AaD1lTI+v2Fr+eceJu9Kc/K7VLxj1z64E1TvIsBY+FI/bK3TIlvetBfU8m
	Vd9Ha5o84rwiIJwqqzGBxQwiVS8i2PzELNxCNt/WQ3d1JZWsfImSbSqvhGcwRWrZLjV0Xm9h9hEK7
	hyMJNokJ01OUt17vl/EomE36l5Hh7LSJTGWx0iHJvfkJ87wv6zt9Qa0b0AGRlz1eCLyE7GO2Nd9F9
	73xkKvri4fOv1wtawKgQ/7A7sHVBSHg1mXwQCoCFlF2x+RkVnYUU59XN1xgNKiUzL0jM3XCBIAnPb
	hwvceMfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCqAV-00000000UVD-2fKj;
	Wed, 15 Apr 2026 02:39:55 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCqAT-00000000UUq-1YUX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 02:39:54 +0000
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-7dbd08144deso5750826a34.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Apr 2026 19:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776220792; x=1776825592; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/4pZEJvuS7ozDbMvLtLQ4Yf4fNz+jgNzCYp57Or0UAE=;
        b=asJa6aV70hcf9rVRkYsgQ2lQ74TWHtUUc5c/jQidCc3fDAnRnfzkHrb5gI+blo6p/r
         oulSIDmyCU0Q/OpK5YqihDvoMrAiNZEiR8iXwWvAYuUlMWjiKMbVAQwuJ6AG7nONR5nj
         HMD9EMZ47X0/2n4VLnjLRElEy00+XV/X7+k9fkdLrv5A7CFyJreGOFi/OzpqIWUi034I
         JW2uvHLoE8aa9XVrQQ3oK4MtGxugA/xnDOFnL7iBFRthESG2Funr0eu7HrgJA0aQEJxb
         gxcn24wxOjYI1IVGkbMH4+2XGvYCFtAH1KRHfBOsdIwIzZJU7NR7acm1JXcSTt9szio/
         Jleg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776220792; x=1776825592;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/4pZEJvuS7ozDbMvLtLQ4Yf4fNz+jgNzCYp57Or0UAE=;
        b=hQkSDTU+eeS+JJ7tZ4y6S6pukQGn+WqvZK2aLrhL0AFDSIZ+jD4wcpl8JSZPTYjJGq
         oIP8zyCzJ0xhyPrDKVLRlQS00yVhekKkGtSvi3OJdo9y8ZX+aYxTsw22kUhYQut2UAI6
         APXWN0EVJsPEZOlERZ0gC4I0fOBSYVWZQeN9T6OtK7Ff/Sp2HJX0waq7GWtE4p42Jnnc
         QQWvPIRo42XnTBMj7crPFUp0bigE484AAga7gpquGxOsFsZ13IT6HTIE2UM5iExDs6vS
         FZ3t/8yquP3jSSXXt9XYVg2+5ip1MwXYfFmF0BCRXCC8PaOR1NBH9EOJBkoOWZSL5foc
         jong==
X-Forwarded-Encrypted: i=1; AFNElJ/ntSnvkC0tSKVJKRFBZS1l364OCTinPIU8TBF5QqLxXvgreGtWcc3tz8akDEP0dETYfb03kTGUYJtOWS4/5W0s@lists.infradead.org
X-Gm-Message-State: AOJu0YyOOvyaUiGvM+ASXCaPnG2mIWauRZg1waPVczbu6qA5d2kWSxnZ
	7Tl62QpQZkjnttfMgIKJuTqgDNqjj7ZXK9dhWDcHwROiSfYgslA3cIdH
X-Gm-Gg: AeBDiesxQtN3eRFkKafo3p8gvsL5C6fHW+GwFENvVR0TT4SPkiSkGwiMPt5NZqdhA7O
	Dc2r4zekFBSE23XTCr4jF9JWVaNimOD9xlQNHsZaeaRfdCVy653a8QCCl47VZutF9cmLxKzKIFi
	F8jkodbqoIwyxKG+CO8zfYgh5jCw5Z0qZTn+LMdKSuodxjjZ2pyTbiR3qjzyeBy7DlMKCPoUlfa
	loq0c2GghaRp8zU+CQ+DRH8Vvr0wY0x0wgtqDVbG5rOGQXHy7t+ozp4zfjT52ecKkN5fgqp954v
	vC1vDrCJ/F3srim0rZUQEEtturSIRMzfmL+xTLiL21p2ovPGXx7xsktyHT+4SQIwpH+J6E7bgFd
	z9gtBqe7m+PCqNPytZoimZxAXLvmTWOKJ+SKfiHbzJVQNI1JXPiKfR/9T/W6dho5ATCbNbz8Y7Y
	AcHbHWJQQGBUs1oGRHqeejwon+YMvIRlhhDYACqwm4KPh9kY+QZtVSdWK7n22pG1cISaF0Ig==
X-Received: by 2002:a05:6830:25c5:b0:7d9:f50f:96cf with SMTP id 46e09a7af769-7dc27c6632amr11719357a34.6.1776220792258;
        Tue, 14 Apr 2026 19:39:52 -0700 (PDT)
Received: from localhost (static-23-234-115-121.cust.tzulo.com. [23.234.115.121])
        by smtp.gmail.com with UTF8SMTPSA id 46e09a7af769-7dc76a333e8sm406838a34.8.2026.04.14.19.39.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 19:39:51 -0700 (PDT)
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
Subject: [PATCH net v5] net: stmmac: Prevent NULL deref when RX memory exhausted
Date: Tue, 14 Apr 2026 19:39:47 -0700
Message-ID: <20260415023947.7627-1-CFSworks@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_193953_449791_7C543C6E 
X-CRM114-Status: GOOD (  22.38  )
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

Hi list,

This is a single patch broken out of [1]. The second patch in that series,
which proactively refills the RX ring buffer when memory is low, still has some
unresolved feedback: it should use a timer to avoid nuisance polling while the
system is suffering OOM.

Further discussion makes me wonder whether that second patch should even be
threshold-triggered at all, or if it should be a handler for the RBU
("Receive Buffer Unavailable") interrupt instead.

So, while that patch is back at the drawing board, I am submitting this one
(which is higher-priority as it resolves a *panic*) separately.

Regards,
Sam

[1] https://lore.kernel.org/all/20260401041929.12392-1-CFSworks@gmail.com/

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


