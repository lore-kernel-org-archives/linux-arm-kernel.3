Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C96AD10F3DF2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Mar 2026 19:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nV0vTDjXno/BRjs9UsVyAooL1Z9SQRTeEW/NqAyKUfY=; b=XOKDsXimUIt+kWhSMoGR8ZwYp8
	J9oJ3RCcD31tBpXodGiqsrA6LDfafxOQGBE25F4HNz97yHsNVHXvkuPwBUsn6zBRvrwI0GoBVSC0Z
	n71DCzBpgHMOfefxJGBuI9nyiUp2muyxhA/Afl1ioAnU444ItphcpHy7n+4/HT1C7/C4ExegCE3xG
	uxfznMMZdv0lPh0Le8wHrXy6xUTscqmnClytu+blcKzFi082zlBZJJDWlNPaTg3gDURDt+gOv7hi9
	zQ/enewBpUdjzggBe4uKc0QWg22Kdvv7xwRI5XscVyN1H+p9H+s5F3LSG4Xs3oswGEv3bGUTgZyEc
	1C/ZeKDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6Z5m-00000009EJS-1tTB;
	Sat, 28 Mar 2026 19:13:06 +0000
Received: from mail-dl1-x1230.google.com ([2607:f8b0:4864:20::1230])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6Z5j-00000009EIb-2D2K
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Mar 2026 19:13:04 +0000
Received: by mail-dl1-x1230.google.com with SMTP id a92af1059eb24-12732e6a123so562304c88.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Mar 2026 12:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774725183; x=1775329983; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nV0vTDjXno/BRjs9UsVyAooL1Z9SQRTeEW/NqAyKUfY=;
        b=kB96VTLLQFlcTXccoAyHvXlT9oNubTsUNNzIr+k5WF0BuowUsmUquRnr2aicPr6z2i
         vqwzI2l7BpW94UPGnq1DW5BHB3HN+pFu/TCoFfiHZ3EpW9u8PQrtRZNKPQqALozLMNfT
         uvv+V+gI3VNNJFOa8/DpynLI9NfWFxjSRu+vXdQMR3tLe0538Ue8bpLfOMV8Ke9n+eqc
         QSP+3+Oe6r0AM/PkKlgM155sAOpx1VF5wOFMNA6XZtplJ16GO1RdF7Ne1AA/LcIOZfWc
         tPmRcfLBp6Zuk1OPlzcn7ExX38BfBgIlysoso7NakkQcElHOWIkVlbe1i9oQQSOcW0KL
         +dPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774725183; x=1775329983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nV0vTDjXno/BRjs9UsVyAooL1Z9SQRTeEW/NqAyKUfY=;
        b=YVlr45s/YFpL1lDJqei1KHMxvM481gm2LMAK1rPSZ9gW+OhSDIWNwSpWv2hM9pKE0c
         65za9Oht6MO3It+VuIKE2VRisv/522N1Do107U2cNY03U2ws4QmnBeI6Kiiqv7ZHjeIx
         0jGbbbbvrIU7d/N/iF0K86PN44pstbrBZwwu71qBubu2XQPokA/ipz7jFpRaUlhphYqt
         iUWqIcY2+HPlKCZHbalp/y3hQ3BeD4yFj2vajmnaYywcKdfIiCK8VqMlyzg8/nhHOae6
         78UnDGtxvuxKEhla/wRp7n+fVW0FSC40xlsjDpbbYqNN0w7pJkd48y9wtyBRwbgVhMun
         OvUg==
X-Forwarded-Encrypted: i=1; AJvYcCXe5WfpAewK4e1VG9GRzDdYV0US7DQ+B8p/djpAQ+WVgTQpmQY26EpEEtZJvzfl6SY2JGzSWFLL37jg9iHRnD1Z@lists.infradead.org
X-Gm-Message-State: AOJu0YzBUqfgws4dsKWvX5ffl6W5GCrjoiclUv1C+BcA1GYFLL8EFP5/
	hbz2li4t6xtT8LrV3G7/99UCiCd0xZDRi2uq6iWlqLMTFP3gQcwv1jBU
X-Gm-Gg: ATEYQzxbbq1506LowX+7cIdoZ2fcV3uFQyVUhWLRribfn2CjRw7X/j5jmqjYLCb+dCW
	WoeRbs5IZjqbh/RQoHH2fpPAU396/duhqSe9XpE4Ryo98rxqML11v5DaW5FoC8C0op4ppSWj6V3
	D3tgvtc72+ARyENiW2g+u8wwnFQsuRuYfvdIEzNcxDK61KJYfLoFx+J79fPezDupzaPt1ShMddf
	wXaXtlBM9sB1SR7b4SXjHIvuIPxp0sJZPMrzea9x4hfqB0DjXPeP5iKtPFlJqYJbpS7TDJKE3Pc
	Qmq1dYiHJvJUZ61GrqbW9thyR+QjxkhJoMQC3WU6zLlYSAUOA/7HhIc0kd9VICD/Pde55fzoYwz
	SWLKVrVRzCYWEfWhn22tpsjNXZDG7S4GLM2paz4qpZc9MvInAJposqDeXjQKH8GYsMoy6221vIO
	Q0jmQ0xy9RqmA4r6j/K/TqjCRcDTwa4tCwO0mm9kppmqLB/8GRbmsMHFzh
X-Received: by 2002:a05:7022:f102:b0:11d:fd26:234e with SMTP id a92af1059eb24-12ab28cdebbmr4140608c88.16.1774725182824;
        Sat, 28 Mar 2026 12:13:02 -0700 (PDT)
Received: from localhost (static-23-234-93-211.cust.tzulo.com. [23.234.93.211])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-12abbe21787sm2071517c88.11.2026.03.28.12.13.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Mar 2026 12:13:02 -0700 (PDT)
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
Subject: [PATCH v3 2/2] net: stmmac: Prevent indefinite RX stall on buffer exhaustion
Date: Sat, 28 Mar 2026 12:12:33 -0700
Message-ID: <20260328191233.519950-3-CFSworks@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260328191233.519950-1-CFSworks@gmail.com>
References: <20260328191233.519950-1-CFSworks@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260328_121303_567712_F05D48A0 
X-CRM114-Status: GOOD (  17.48  )
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

The stmmac driver handles interrupts in the usual NAPI way: an interrupt
arrives, the NAPI instance is scheduled and interrupts are masked, and
the actual work occurs in the NAPI polling function. Once no further
work remains, interrupts are unmasked and the NAPI instance is put to
sleep to await a future interrupt. In the receive case, the MAC only
sends the interrupt when a DMA operation completes; thus the driver must
make sure a usable RX DMA descriptor exists before expecting a future
interrupt.

The main receive loop in stmmac_rx() exits under one of 3 conditions:
1) It encounters a DMA descriptor with OWN=1, indicating that no further
   pending data exists. The MAC will use this descriptor for the next
   RX DMA operation, so the driver can expect a future interrupt.
2) It exhausts the NAPI budget. In this case, the driver doesn't know
   whether the MAC has any usable DMA descriptors. But when the driver
   consumes its full budget, that signals NAPI to keep polling, so the
   question is moot.
3) It runs out of (non-dirty) descriptors in the RX ring. In this case,
   the MAC will only have a usable descriptor if stmmac_rx_refill()
   succeeds (at least partially).

Currently, stmmac_rx() lacks any check against scenario #3 and
stmmac_rx_refill() failing: it will stop NAPI polling and unmask
interrupts to await an interrupt that will never arrive, stalling the
receive pipeline indefinitely.

Fix this by checking stmmac_rx_dirty(): it will return 0 if
stmmac_rx_refill() fully succeeded and we can safely await an interrupt.
Any nonzero value means some allocations failed, in which case we risk
dropping frames if a large traffic burst exhausts the surviving
non-dirties. Therefore, simply return the full budget (to keep polling)
until all allocations succeed.

Fixes: 47dd7a540b8a ("net: add support for STMicroelectronics Ethernet controllers.")
Cc: stable@vger.kernel.org
Signed-off-by: Sam Edwards <CFSworks@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index f98b070073c0..81f764352f3d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5604,6 +5604,7 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 	unsigned int desc_size;
 	struct sk_buff *skb = NULL;
 	struct stmmac_xdp_buff ctx;
+	int budget = limit;
 	int xdp_status = 0;
 	int bufsz;
 
@@ -5870,6 +5871,10 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 	priv->xstats.rx_dropped += rx_dropped;
 	priv->xstats.rx_errors += rx_errors;
 
+	/* If stmmac_rx_refill() failed, keep trying until it doesn't. */
+	if (unlikely(stmmac_rx_dirty(priv, queue) > 0))
+		return budget;
+
 	return count;
 }
 
-- 
2.52.0


