Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C067109B495
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 04:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p8Gs/LCy7pdaKThZ7lAOXGPZaybDiCKVdDXO7zMbjMs=; b=zFF5KUuaxGBQ+h9VU+XNiaITPV
	UcFytlW3whNs9zzfC4LQyddheGC4/KT+718OCXU5Zkdpw4JJ9lJy6oA/0zkGPQ25AFIkY22ik2GTP
	XcITJmMlxSQtklOBLGHmaWQDCkaL2riDZP0ETQb9pGUDx3zqf15n+Bxz6t81a//VUlfqJiDr3gi/z
	v17gDe7du0MmyGVn4loQF9q04gPtawGK0WLBAZKgIELs3H0vINoAv1xIDl77lsbpbYYPTnQwlMaQf
	fmlDUdppvI+ZseOEVMNxbjGM//xbtRaLBRmnvHGFaM+p40EUh79ikCr2zEpIYJMOXLD8f+1d6e9D5
	d1mk6ocg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7n3b-0000000DwLS-0fNg;
	Wed, 01 Apr 2026 04:19:55 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7n3S-0000000DwIT-0jYd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 04:19:47 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-7d74dbfe84cso4399000a34.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 21:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775017185; x=1775621985; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p8Gs/LCy7pdaKThZ7lAOXGPZaybDiCKVdDXO7zMbjMs=;
        b=h4z8ndQpeauUNixtt54qZR7/C/+EcKjzMK3qClSGuf7hgBxneLmvfV6shz49oBS3Cb
         GY/XgPq/vCYBZ8VD6Ym3VeJEWMXBmpHmOMStCx2WAe59A3ugDjIjPS9TT1rMIIJvmlQX
         I+kCCYQpndagCTxbzF+enYxfWDamrFgXRjMxHCeac9xCKGbmlQ1NVqs5T2EE3EFw+0n4
         Gyo/D1cP7VFliDQyzamFTe4BsMMLDlS9rVfU0m37U/ooNR/P89jFkp1pQ+eNTEb0yUdt
         o10jmFJc4tjhPqlPXpjvrQdJCRciCSEUkSxw1ACkaH+Cn6dR8U9IzPvYnWpP7jgR3yXU
         IrMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775017185; x=1775621985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p8Gs/LCy7pdaKThZ7lAOXGPZaybDiCKVdDXO7zMbjMs=;
        b=SkqSwIUjCiDuTLloSUxdMVsm+toy4V3BNYql5Me3W1YP9NEIY2Kg2yvln2ufP7Xsv7
         IBBt0EGIprona+d3sfR2pWXvQnwYggkhvZLeye9gAM+HpqMe1ekhmOAjhZ4GUG3a6ryz
         vWRbqcmym23tqKesoWh8t1MVcneP5505bGrUuZAeQjRXK+kp+wY6/yvyF40zJCqlSNFG
         hMvWPZcvZetdJjH/8cZbFR4BxR531BFY7vslgndj+D6TBM1yzc8frmWG8CsIvYM++zzf
         UMXZ1rR/vYEeEvXF4JE2l18EU15fG+HUpejVCNILjBrepSblDm0qKW9ksQVYYdDUFEfe
         Zjhw==
X-Forwarded-Encrypted: i=1; AJvYcCXqXR/UF4sF3OVSJD7Sw7rooBVNFsH57mlqGQqH9I6plViFCdV0U79kdcAdcSLWq9Gnf8oURuejRiC4hbTFt5GT@lists.infradead.org
X-Gm-Message-State: AOJu0YxRHDKvjmyPJ6oPHwxbk4bd2T5dk2ZmeouvToiFoGAnUI7MZ7Aq
	STl9bW2dGtVU2jx8y+hWVgH7DnRom/xsn6MUGHLh/qQN6J+dGPWnSKeB
X-Gm-Gg: ATEYQzz9CMLKrwYLy6jgfiydzYuilS60dw/ZcnvdIeDmjxcFMXIu84W9TKx2BwPINbh
	ClRgfaMXKGMaItXI03QL62t64RukDvL8MMR7rN/C14RB0b5J5DA8mlJuogq6aSmNPus3W6odnQq
	5DguxgDxbX05MB44dOEKUxv+Q3eUbmeYdJeysFCzTYJp5X6quLRl0M4IEclXX/n7CSXfC5vodcz
	NTvrwnI964H01uR9DkGrIzbED6xaZt7e6Fhbgw9Rd4KcnEqMcpm03CBaJZx57/IwVEdD45DGghQ
	v32tOD3SLwpG8QYry2pHbgWiiRbF9VW3tbZhLCfbOCLiI/YHr1BGh4LIbz//uWsNwwc+mss7wz6
	ege13p3G+/9Jck63rBe4ikARZ0mk1xiI6u/KaBcN7LmHvY20ps/AVX85NWiIxmbdISjtCg5vn6j
	IBskvVxtE7N9F6cj5Xh3aBqhXx+uHiduLfIkJcgycWAB4Oo7aQc0WuJ+Akl2A=
X-Received: by 2002:a05:6830:3709:b0:7c7:69c8:2d2 with SMTP id 46e09a7af769-7db9925b999mr1505891a34.13.1775017185265;
        Tue, 31 Mar 2026 21:19:45 -0700 (PDT)
Received: from localhost (static-23-234-115-121.cust.tzulo.com. [23.234.115.121])
        by smtp.gmail.com with UTF8SMTPSA id 46e09a7af769-7da0a7b5b41sm9925868a34.15.2026.03.31.21.19.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 21:19:44 -0700 (PDT)
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
Subject: [PATCH net v4 2/2] net: stmmac: Prevent indefinite RX stall on buffer exhaustion
Date: Tue, 31 Mar 2026 21:19:29 -0700
Message-ID: <20260401041929.12392-3-CFSworks@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260401041929.12392-1-CFSworks@gmail.com>
References: <20260401041929.12392-1-CFSworks@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_211946_255235_64719FFF 
X-CRM114-Status: GOOD (  17.69  )
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

Also: even if not all descriptors are dirty, letting them accumulate
risks dropping frames in the next incoming traffic burst, if large
enough to exhaust the remaining valid ones.

Fix both of these problems by checking stmmac_rx_dirty() before return:
Use the same threshold as the zero-copy path (STMMAC_RX_FILL_BATCH) for
an unacceptably high number of neglected dirties, and tell NAPI to keep
polling (i.e. return budget) when that threshold is met.

Fixes: 47dd7a540b8a ("net: add support for STMicroelectronics Ethernet controllers.")
Cc: stable@vger.kernel.org
Signed-off-by: Sam Edwards <CFSworks@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index fc11f75f7dc0..6822ca27cb0f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5604,6 +5604,7 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 	unsigned int desc_size;
 	struct sk_buff *skb = NULL;
 	struct stmmac_xdp_buff ctx;
+	int budget = limit;
 	int xdp_status = 0;
 	int bufsz;
 
@@ -5870,6 +5871,14 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 	priv->xstats.rx_dropped += rx_dropped;
 	priv->xstats.rx_errors += rx_errors;
 
+	/* stmmac_rx_refill() may fail, leaving some dirty entries behind.
+	 * A few is OK, but if it gets out of hand, we risk dropping frames
+	 * in the next traffic burst; in the worst case (100% dirty) we won't
+	 * even receive any future "DMA completed" interrupts.
+	 */
+	if (unlikely(stmmac_rx_dirty(priv, queue) >= STMMAC_RX_FILL_BATCH))
+		return budget;
+
 	return count;
 }
 
-- 
2.52.0


