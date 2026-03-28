Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C366F10F3DEE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Mar 2026 19:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FLw+KspfNI17fHokU2DyOGE90apcIrKC40CCDarAeuo=; b=HBlG1oKSP3wTklPExa561z/dsf
	W/I5IhlAg5FaZsiIxkJzofVEO+g5EKyZEIb7/S+cL4/rER9r46rPit51vmCYTxmUIUMW0IZ1in5i/
	Zgy3+XUQlWbmAAbHKgO6t05ufksdAe/LJhOtIFst1/AiXp+XnKXyoEUjmDSFWbrfrfZhbKUpLZIgu
	u9ndS+HnBDKtL0Cl645roBp9l5+VXXBm4AYjA5IJrXsTy5/lt57rXM+3Vfw2ceXiXe+gCrkXjA4sY
	Oj+AacSnjtIrMXVBbkcpfNjWxw7dzojDxH9zlM1gWJQTa16uTDkOCmgeDif0sQA/BrRfXVqNbcS0l
	7rPHE24A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6Z5l-00000009EJ6-2twt;
	Sat, 28 Mar 2026 19:13:06 +0000
Received: from mail-dy1-x1333.google.com ([2607:f8b0:4864:20::1333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6Z5f-00000009EHk-3Yc3
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Mar 2026 19:13:01 +0000
Received: by mail-dy1-x1333.google.com with SMTP id 5a478bee46e88-2c179d4e1a9so4031176eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Mar 2026 12:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774725179; x=1775329979; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FLw+KspfNI17fHokU2DyOGE90apcIrKC40CCDarAeuo=;
        b=nXR+T2iq9xERDmp811N98h1x/5WxVWl+Xj+nKoBiJ1XwFft01mniRwMa9JzLM3yU1n
         1Dp6/JwaddeQwmiiMpVRX5I2Or5Gdc+U581DgPOPwEz5u59C/XZZBJeCRwfpuKpgVKPS
         uQwSXERyN6aL0hQ3n6app2w8ZqzXM4DEIvcO2DfTHJ+F43Vm/cos27O5mg/0T/iabZ4X
         SNlCdtv8wgZk5fkFvrBxiq7Oqglkvw9fYGIcuIQwl33Nxpqb67dfL9Qq9Bai0u4Kj9i8
         wF57dYv7S5Dnm8p6DUvSYxTwGh82APl3BsdxCBqTP4YLc1VAEYCPdMsNkNIFYvJg80n5
         jC9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774725179; x=1775329979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FLw+KspfNI17fHokU2DyOGE90apcIrKC40CCDarAeuo=;
        b=lEQ+J/kYuVbJJYjgx9tQ/geCu+pmJHM4tnFmCKYwqh/8skjIUY9Lk/FAwdjQH7arg9
         2CwbitourROGFeUhDNsuumdP2vvi6Q67dyDGK/KN4ntBul0NQf+aJ1DTMSu+w72looQQ
         OXJNLVgnH8OwKrKD+wclNHrKHL5+usiRxgBchxGQ3N4xY4HKpub3S0fSQ4ucnsCtzgkc
         cFnadp8FMBrT00DNGTPVIs3Liexu1x7eqBFssEVDg9oFWa/gSI+dM4hj2EdLEZ5vj4f3
         lsGpDHOAZPGtxOoZujV+eAOVHQ/YMqLywP9zrDn2k17cbTwgXPvsh7uAO5+YcH69hOge
         1PDA==
X-Forwarded-Encrypted: i=1; AJvYcCXh3axMTkcIY7i++NXyPe5GUQwv7NCnTBtGpqXjAR00y9IPGAXSIL0cz5YwP5sDC1UTt4RJ6jhBjs8YtPJQyQ8b@lists.infradead.org
X-Gm-Message-State: AOJu0YxOV90mhFt3LiiIZk61cpQwubFTK05D/3AOVUMn/OqMGO15lAUD
	P8M4o8fewRSYczOHU8xXLi+IyR1T8gsz8tSQwySnjaw3YE3bMtrN3nlr
X-Gm-Gg: ATEYQzx8b7nAIQm//IBgfknWs71jYl0Tujz2B538FAzTxM1HapdQ5gQSF2HgIvvV4DG
	k+DJ3/s5Q6h0tJDwhp2DGcGSfRo4+1dNPiunnsdi6CBvEE2n6RREKbBkPEivUtF7+kibxktIwea
	bqIlWq+3ju2Z8yNoiXHo+wwI54zVCiQdfYXFMOaJsgzeEVbxqtvzd2++kVZN8n40oXVuCxdmIme
	X+CiDJ7PeSfYsvlcjAvJ9U8E2iBUxbIALG/6hJ6hEVHhTTwjqIB9hMvEhKz4Ogfu4sJnLhyU8Kj
	kkB3CSFagZvwrWjGRhVLLYXKe0svhGFUtuZ1fMRFznICDBk+WyoJpjihvn/YybV8H3Y31Ve6Y9I
	fwn9SUrWtdpXFWEJBN9qxkjTfcG+LFIaqQwgzzCkTX+vtiY2Qcc1yX2gdQLblsQX7zADagVnNWv
	xSZ56x781Ym+2cpqxlwsH6jmQANCtsJZrSRYH+cn4zOqMija5oDx0VOn0V
X-Received: by 2002:a05:7300:7fa4:b0:2c1:67e1:61c4 with SMTP id 5a478bee46e88-2c185ce8740mr4319411eec.5.1774725178830;
        Sat, 28 Mar 2026 12:12:58 -0700 (PDT)
Received: from localhost (static-23-234-93-211.cust.tzulo.com. [23.234.93.211])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-2c3c68b2721sm2508384eec.14.2026.03.28.12.12.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Mar 2026 12:12:58 -0700 (PDT)
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
Subject: [PATCH v3 1/2] net: stmmac: Prevent NULL deref when RX memory exhausted
Date: Sat, 28 Mar 2026 12:12:32 -0700
Message-ID: <20260328191233.519950-2-CFSworks@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260328191233.519950-1-CFSworks@gmail.com>
References: <20260328191233.519950-1-CFSworks@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260328_121259_889459_5A3973AC 
X-CRM114-Status: GOOD (  18.57  )
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


