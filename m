Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 873BDF94CB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 04:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5Cj4omnP69kMXkBuQqesz50Z/3zgQMt+xBhIxIth3BY=; b=hqEgysuR0ieQ2PILTH0FsIjqmC
	zkb7LjYCPK56DEXjllrXrgd9399N1sSxhx5zPKUYCZpas7bAbqHYrI/Kd+HRF+IYFJjQH6et2pYYz
	sStigVd5+1HEBcLKFlOZANZEkdDfrY/nUDWpEb7urchwKG8jfgt71YBLpCz5MiFyT08jjtatUuig7
	vuTFaSm2QFO50sBunUHTk3kmT7R9UYUziHdPUiKjQnAjMoBqbSu2Gcby1zFlW4q8EI0XMhMgaGeaA
	6Zbsgip3WWdAFh6JS4GxqYFeUMN8EeoeYDjf/vwvo1SjYH2D3XiMj/D39LlN31e3wFwMsrxEgOQpY
	EiWfwRLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFPSd-00000009aeJ-2pLB;
	Wed, 22 Apr 2026 04:45:15 +0000
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFPSa-00000009adg-1JIM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 04:45:14 +0000
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-40ee9b945d5so3963157fac.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Apr 2026 21:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776833110; x=1777437910; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5Cj4omnP69kMXkBuQqesz50Z/3zgQMt+xBhIxIth3BY=;
        b=dQHqEy5/AP9GR5PlHmWMoCdjMK+mWjEsptmyfPpuc6DtSXYLImI//jcTP/nvT5j1Cw
         zpErbae8DhgXRkQeXxdu2q6PgXBnHqrgOKObrv+9+4ZDCP9gDNVVSeicDrhwLyaSNIrz
         4zl0+5qW9qvqhVGdccx9hX7SM8rc3U3tsVVasMxqjHNH0W9wrbREe1v2tQl2lstqa72Y
         HgzQBYVqsMRN9M1/bz7ronc7yzQRMOalw92IXLtfAgPq6ezTTJqjldeHAX0RvRO3LsbC
         KLfp2EVgHa5w0yXH+HAOljVMrcuGOyfmX89E1iVIQopVGDrKPB5+CI/a2cjf2dpn1dYY
         u0+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776833110; x=1777437910;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Cj4omnP69kMXkBuQqesz50Z/3zgQMt+xBhIxIth3BY=;
        b=LuJ7jPkermoJtO28MPEgvFAeHjkg0WWZLHEURltkCLixNByWf/wl+5UJQB1/pXA27u
         ybX5I1P3TnFXemPuEb1BPW1yda60P5DffDY0lZxDe2ONM4D6XLy95hn8HpB+r7ZVuLPC
         w/Gdf0v8/J0mH1JYqhgpmNX9Q+K/Pa3I3gcc4XcWOy5pLXuzMMUQ0+5RRaNcs4zUxvfB
         H1oC1WxeW/aMXxhD3EBxeXD9FEmj1Tb14KoOtTBQEaYM19MRZPCi8Y+ECTe/zUa+fQIT
         f33EkcHq1vsUC1rrN4rBgw1PEvym/J9pNrOaAVv7DrjVzxYH3riawSUrUVu5XFIPntBw
         5sHQ==
X-Forwarded-Encrypted: i=1; AFNElJ9jDYWrpSO+SCOic27rC9shIE6ce/jcLkAO8K9qwZct/eVSjAj51jRJZ+5Eu3Sc+XJYk3G1dfts36oOktCikZiH@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2P1vIr+TH/DHD9cu8PqyiPf1fSu+z/9hWvjrScP4a/5uV13kE
	d6xrt17n9F0/crxa+BKthVqn/n9K6pbm7ClyRNbaLCFPDlTQRF7valxm
X-Gm-Gg: AeBDiev+2Wi2oJrO7V6ytoPZJKrOl7/eKYPRVwCaWjVBbr1eSh0eVWMFzWovvOEr210
	FdehjQOJf6pkQBwoMqJeQWyJlGiVWDwrWaHEcFIo2GPdnpIK0XFPZ6vJG+55e7tqANdR12W1Dtk
	LPDysnSVfp6h89f7ktqwMe8ND+tZpZf3nZPLIZidq2Z+VPlC8MjKp6o86q+NdT4oKpVLeUTjgwC
	XVG8WE7UEkrCIWF6IZE5j+4Wu3fzXIm1TXh2fdFiYKdXUsdPFjeSspPgANaQXNtMI53mws657Pp
	aqUf73QzDcCvkdH3SnkLrXCANDtEEGDk2bX5Lf68G5zOKjC3KSLy85r76EhzzG7YeZqGq1EwjUI
	zTADhSWJReZP1GLuSSRMIFrKtrNJjZE6bSMrm8cLwtcEGsVehTh0SBoCovt0tQ4TIBkFa2uzMsG
	lUv6VoQP8yYywSUVdBASSfzCUf13+3zK3M35KZlZgZtuRjCU5rTTA49msOdPUrc49WTfzK5Q==
X-Received: by 2002:a05:6870:82a4:b0:41c:3db:58d8 with SMTP id 586e51a60fabf-42aded57eccmr12187382fac.29.1776833110389;
        Tue, 21 Apr 2026 21:45:10 -0700 (PDT)
Received: from localhost (static-23-234-115-121.cust.tzulo.com. [23.234.115.121])
        by smtp.gmail.com with UTF8SMTPSA id 586e51a60fabf-42fb269f69bsm2841483fac.12.2026.04.21.21.45.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2026 21:45:09 -0700 (PDT)
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
	stable@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>
Subject: [PATCH net v6] net: stmmac: Prevent NULL deref when RX memory exhausted
Date: Tue, 21 Apr 2026 21:45:03 -0700
Message-ID: <20260422044503.5349-1-CFSworks@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_214512_373464_3C16F254 
X-CRM114-Status: GOOD (  26.22  )
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

Fix this by explicitly checking, before advancing `cur_rx`, if the next
entry is dirty; exit the loop if so. This prevents processing of the
final, used descriptor until stmmac_rx_refill() succeeds, but
fully prevents the `cur_rx == dirty_rx` ambiguity as the previous bugfix
intended: so remove the clamp as well. Since stmmac_rx_zc() is a
copy-paste-and-tweak of stmmac_rx() and the code structure is identical,
any fix to stmmac_rx() will also need a corresponding fix for
stmmac_rx_zc(). Therefore, apply the same check there.

In stmmac_rx() (not stmmac_rx_zc()), a related bug remains: after the
MAC sets OWN=0 on the final descriptor, it will be unable to send any
further DMA-complete IRQs until it's given more `empty` descriptors.
Currently, the driver simply *hopes* that the next stmmac_rx_refill()
succeeds, risking an indefinite stall of the receive process if not. But
this is not a regression, so it can be addressed in a future change.

Fixes: b6cb4541853c7 ("net: stmmac: avoid rx queue overrun")
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221010
Cc: stable@vger.kernel.org
Suggested-by: Russell King <linux@armlinux.org.uk>
Signed-off-by: Sam Edwards <CFSworks@gmail.com>
---

This is v6 of [1], which was itself split out of [2]. This patch prevents a
NULL dereference in the stmmac receive path, and (at Russell's suggestion) in
the zero-copy path as well.

The approach is different from the previous version and checks the dirty_rx
index in the loop proper, copied directly from Russell's suggestion [3]. Parts
of the commit message also use his phrasing. For these reasons he is credited
with `Suggested-by`.

The commit message now acknowledges the pipeline stall that can occur in case
of failure of the next stmmac_rx_refill() after the MAC consumes the final
descriptor. I still intend to fix that bug when I can find the time to finish
investigating and implement the timer as requested by Jakub, however I'm
sending this patch now to resolve the outright _panic_ and simplify review.
The stmmac_rx_zc() path is not affected by this stall.

[1] https://lore.kernel.org/netdev/20260415023947.7627-1-CFSworks@gmail.com/
[2] https://lore.kernel.org/netdev/20260401041929.12392-1-CFSworks@gmail.com/
[3] https://lore.kernel.org/netdev/ad-LAB08-_rpmMzK@shell.armlinux.org.uk/

---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index ca68248dbc78..3591755ea30b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5549,9 +5549,12 @@ static int stmmac_rx_zc(struct stmmac_priv *priv, int limit, u32 queue)
 			break;
 
 		/* Prefetch the next RX descriptor */
-		rx_q->cur_rx = STMMAC_NEXT_ENTRY(rx_q->cur_rx,
-						priv->dma_conf.dma_rx_size);
-		next_entry = rx_q->cur_rx;
+		next_entry = STMMAC_NEXT_ENTRY(rx_q->cur_rx,
+					       priv->dma_conf.dma_rx_size);
+		if (unlikely(next_entry == rx_q->dirty_rx))
+			break;
+
+		rx_q->cur_rx = next_entry;
 
 		np = stmmac_get_rx_desc(priv, rx_q, next_entry);
 
@@ -5686,7 +5689,6 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 
 	dma_dir = page_pool_get_dma_dir(rx_q->page_pool);
 	bufsz = DIV_ROUND_UP(priv->dma_conf.dma_buf_sz, PAGE_SIZE) * PAGE_SIZE;
-	limit = min(priv->dma_conf.dma_rx_size - 1, (unsigned int)limit);
 
 	if (netif_msg_rx_status(priv)) {
 		void *rx_head = stmmac_get_rx_desc(priv, rx_q, 0);
@@ -5733,9 +5735,12 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 		if (unlikely(status & dma_own))
 			break;
 
-		rx_q->cur_rx = STMMAC_NEXT_ENTRY(rx_q->cur_rx,
-						priv->dma_conf.dma_rx_size);
-		next_entry = rx_q->cur_rx;
+		next_entry = STMMAC_NEXT_ENTRY(rx_q->cur_rx,
+					       priv->dma_conf.dma_rx_size);
+		if (unlikely(next_entry == rx_q->dirty_rx))
+			break;
+
+		rx_q->cur_rx = next_entry;
 
 		np = stmmac_get_rx_desc(priv, rx_q, next_entry);
 
-- 
2.52.0


