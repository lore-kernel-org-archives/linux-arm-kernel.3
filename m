Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2263C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 16:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T+2f2XHv+af68YmdwG7YdmU8mGG4BCpNERxEZlAskTc=; b=2eX+3hRdriszXACS7uPEfGW2Ny
	aZdBg9XN8ACwG0qO36AYn5BftnFUME8I0BQbwyz1spzgdVg6F2ljCwTBhraoTvZOsStbxnjAFTHVl
	B7QOzpdF69U6H6FgSrD50ChVa+XzWuFyPOzkqTN9JJ+lbPeXmLr7sQEtChms/XA55856zgpuxI7UT
	UV1pY7PxLrB857EGyJ02nF28g1MFPfkZOtYSMKq+FA/G3kqJmJEYyPwXLKQ05qQWPyJ0h3ecJJVOB
	BQNt0blVJKWBxyIYfwcVTmvKJYSoACRDnN3yrECbTttJf0CgX8Iyb+37BOQKS00k8i4of4xsl/sm2
	1XFOSqxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1RQX-0000000CfT3-0KmL;
	Tue, 01 Sep 2026 16:33:37 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1RQV-0000000CfRm-0RAj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 16:33:36 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-3a20f56876eso72921fa.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 09:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788280413; x=1788885213; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T+2f2XHv+af68YmdwG7YdmU8mGG4BCpNERxEZlAskTc=;
        b=GJGylsHik8oquWzWX/CUBXA+xzvJM5DjQH44cQl/MX8VYkfg/CRJAUhiow5pG+eAd2
         3o/Gg/+r0AZ4993Q903xOkqI+4wrYlPYa5El68dCIIPPrnAV/vRE6GT5s4wyZSWSs8yQ
         tP2NmNh5fy0dQ8ACLumR3XWfFVBXfbLa/1t0/ksFXqQA/RZVkgLmRDd3p9BsdDEyuBr6
         KzRExb5NVzA/ScH/nRj+Z6MMSfTJ16G4gIh/WsqA+B/IyvSoqdPAVG1q/7oWpmkwYckL
         PyKRto3gLdtojoKnZsTelRUNexwFJMd3igvv8GU+GWqXfiwSReHgd8SnVBthiAQnWArv
         K1Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788280413; x=1788885213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=T+2f2XHv+af68YmdwG7YdmU8mGG4BCpNERxEZlAskTc=;
        b=iB7Lzo2h14cUbWJp4PhweptI9hkQDbxsCiOjo2vwRX8oDX1UDdSwbqvLLpu6wYCNhR
         EZ+lmw+EcMPN/EdIOmRlcUQnBT7AiyFcHsASzpoUIhn6zCATssRxCQj4HZ4eh/cg6RL4
         RK3MK4/GdEYWjWMo/ZUPPVf3vIyAJUdeyFllG1W1rhhDBqI2KVVrF7afGxQLF4byyg90
         qtlsud2FmaBCtNdHVieBg2ECCMF3hWTmjggwa7KkgzQQmv5q27i3jnZB6WZzqpjj3el8
         lZpbow9UzhWo4ZuntqAhWvZgmsp7Juagsd+qt7crHbRuF0t1d7vck9+tUGkeeSI61Bld
         8qpA==
X-Forwarded-Encrypted: i=1; AKwUvBxTt5gVRwZa/NCo3vv+n8FzzR1cJt5GhClUHjvQkOCaRq5ClbWmGVZj7Fq9f3FLVl795Pp/yxnm7poxTXc0+T2o@lists.infradead.org
X-Gm-Message-State: AFuF++nHpztGwKr1UdZ1n7ZQgMjcCo/tFvVuVW/+nXCqfGoYAHmAXAJY
	eUtGJIMt37K3ClAOvhCn3H8Na0yLOVW14fVORxKwjbwOIjLbgBte4nA=
X-Gm-Gg: AYBFou2qjOfLsR+lo/RXYRbYf1eH6HThuT4kP5sMFHw3cI9TkrJe+6u8FY9rFA/i7FS
	UExXpm6MmbCsXUSD2IN/LWq24drX+XsDOIWEq2LHbj7hr0czp/S62czuiVA9g6Y/kkxvLahToPa
	YurWd8Xg7y8syWwgtm++1ntpXCTQOvGaQQZ0e0/j+SPyl2kCgsTY/5dFKd50jc9A9tdLwudSUuM
	EJZHnfks0KDOu37sNnc7p1kGNAWUu4cGDsvQxeFXo4LlTidy6CZ587PyxOzVUbdPSzw5dDRGbzV
	VrL/1ORyi4hS4EqnpMOLHnwBBFcE2tceOdSPURUXyO1TfObon39p1z37rwxwmbrK+p+O537QHGW
	lwGrSwVVRtFUF85N66ZEknJoC7u0S4eznCilhedZBfQTerarL0uQfh6qrs4iTEWxi3HFY/0tJH9
	QcerkieuaMnQ3LdnBpzFVjdRbei+UNZXe69vZGXroz7EttTAmYDdQp
X-Received: by 2002:a05:651c:41d8:b0:39d:b5b9:f0f4 with SMTP id 38308e7fff4ca-3a301abb820mr82093501fa.10.1788280412821;
        Tue, 01 Sep 2026 09:33:32 -0700 (PDT)
Received: from fedora ([92.36.3.203])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a34a8ed967sm678251fa.7.2026.09.01.09.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 09:33:32 -0700 (PDT)
From: Vitaliy Sochnev <sochnev.v.74@gmail.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	netdev@vger.kernel.org
Cc: upstream@airoha.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Vitaliy Sochnev <sochnev.v.74@gmail.com>
Subject: [PATCH net v3 1/2] net: airoha: handle RX_NO_CPU_DSCP interrupt, not just RX_DONE
Date: Tue,  1 Sep 2026 19:32:53 +0100
Message-ID: <17f1beec505b87a4acf16557386a978c98f94b97.1788286284.git.sochnev.v.74@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1788286284.git.sochnev.v.74@gmail.com>
References: <20260831234701.206021-1-sochnev.v.74@gmail.com> <cover.1788286284.git.sochnev.v.74@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_093335_195470_74A050AB 
X-CRM114-Status: GOOD (  19.94  )
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

airoha_qdma_hw_init() unmasks the per-ring NO_CPU_DSCP interrupt, which
fires when an RX ring runs out of free CPU descriptors, but
airoha_irq_handler() only extracts the RX_DONE bits from the same status
word. The NO_CPU_DSCP bits are acknowledged and dropped.

Once a ring is drained to zero posted descriptors no further RX_DONE can
fire for it - nothing is left for hw to receive into - so NAPI is never
rescheduled, airoha_qdma_fill_rx_queue() is never called again, and the
ring stays dead until the interface is reconfigured.

This is reachable on RX ring 4, which airoha_fe_vip_setup() force-routes
~15 VIP-classified protocols onto (BOOTP, PPPoE Discovery, ISAKMP,
DHCPv6, SIP, LLDP, PPP LCP/IPCP/CHAP/PAP/IPv6CP, ...) while it sits on
the 16-descriptor RX_DSCP_NUM() default. A DHCP renewal or a PPPoE
negotiation burst drains it faster than the CPU reposts, after which all
of those protocols silently stop being received.

Treat NO_CPU_DSCP like RX_DONE for scheduling NAPI:
airoha_qdma_rx_process() already calls airoha_qdma_fill_rx_queue()
unconditionally at the end of every poll, so scheduling NAPI is enough
to make an emptied ring refill itself. Re-enable the bit alongside
RX_DONE in airoha_qdma_rx_napi_poll() so it is not left masked after
first use.

Whether NO_CPU_DSCP re-latches while the ring is still empty is not
documented. If it does, a ring that cannot be refilled (page_pool
returning NULL) keeps reasserting it. Masking it until a refill succeeds
is worse: a starved ring never fires RX_DONE either, so it would stay
dead after the memory pressure clears.

Fixes: f252493e1835 ("net: airoha: Enable multiple IRQ lines support in airoha_eth driver.")
Link: https://github.com/openwrt/openwrt/issues/24715
Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Vitaliy Sochnev <sochnev.v.74@gmail.com>
---
 drivers/net/ethernet/airoha/airoha_eth.c  | 16 +++++++++++-----
 drivers/net/ethernet/airoha/airoha_regs.h |  2 ++
 2 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 64619e9a704d..c59201aded26 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -784,13 +784,16 @@ static int airoha_qdma_rx_napi_poll(struct napi_struct *napi, int budget)
 		int i, qid = q - &qdma->q_rx[0];
 		int intr_reg = qid < RX_DONE_HIGH_OFFSET ? QDMA_INT_REG_IDX1
 							 : QDMA_INT_REG_IDX2;
+		u32 irq_id = qid % RX_DONE_HIGH_OFFSET;
+		u32 intr_mask = BIT(irq_id) |
+				BIT(irq_id + RX_NO_CPU_DSCP_LOW_OFFSET);
 
 		for (i = 0; i < ARRAY_SIZE(qdma->irq_banks); i++) {
 			if (!(BIT(qid) & RX_IRQ_BANK_PIN_MASK(i)))
 				continue;
 
 			airoha_qdma_irq_enable(&qdma->irq_banks[i], intr_reg,
-					       BIT(qid % RX_DONE_HIGH_OFFSET));
+					       intr_mask);
 		}
 	}
 
@@ -1468,16 +1471,19 @@ static irqreturn_t airoha_irq_handler(int irq, void *dev_instance)
 	if (!test_bit(DEV_STATE_INITIALIZED, &qdma->eth->state))
 		return IRQ_NONE;
 
-	rx_intr1 = intr[1] & RX_DONE_LOW_INT_MASK;
+	rx_intr1 = intr[1] & (RX_DONE_LOW_INT_MASK | RX_NO_CPU_DSCP_LOW_INT_MASK);
 	if (rx_intr1) {
 		airoha_qdma_irq_disable(irq_bank, QDMA_INT_REG_IDX1, rx_intr1);
-		rx_intr_mask |= rx_intr1;
+		rx_intr_mask |= (rx_intr1 & RX_DONE_LOW_INT_MASK) |
+				RX_NO_CPU_DSCP_INT_RX1_MASK(rx_intr1);
 	}
 
-	rx_intr2 = intr[2] & RX_DONE_HIGH_INT_MASK;
+	rx_intr2 = intr[2] & (RX_DONE_HIGH_INT_MASK | RX_NO_CPU_DSCP_HIGH_INT_MASK);
 	if (rx_intr2) {
 		airoha_qdma_irq_disable(irq_bank, QDMA_INT_REG_IDX2, rx_intr2);
-		rx_intr_mask |= (rx_intr2 << 16);
+		rx_intr_mask |= ((rx_intr2 & RX_DONE_HIGH_INT_MASK) <<
+				 RX_DONE_HIGH_OFFSET) |
+				(rx_intr2 & RX_NO_CPU_DSCP_HIGH_INT_MASK);
 	}
 
 	for (i = 0; rx_intr_mask && i < ARRAY_SIZE(qdma->q_rx); i++) {
diff --git a/drivers/net/ethernet/airoha/airoha_regs.h b/drivers/net/ethernet/airoha/airoha_regs.h
index 442b48c9b991..bde3d599d8b7 100644
--- a/drivers/net/ethernet/airoha/airoha_regs.h
+++ b/drivers/net/ethernet/airoha/airoha_regs.h
@@ -549,6 +549,8 @@
 #define INT_RX1_MASK(_n)							\
 	((((_n) << RX_NO_CPU_DSCP_LOW_OFFSET) & RX_NO_CPU_DSCP_LOW_INT_MASK) |	\
 	 (RX_DONE_LOW_INT_MASK & (_n)))
+#define RX_NO_CPU_DSCP_INT_RX1_MASK(_n)					\
+	(((_n) & RX_NO_CPU_DSCP_LOW_INT_MASK) >> RX_NO_CPU_DSCP_LOW_OFFSET)
 
 /* QDMA_CSR_INT_ENABLE3 */
 #define RX31_NO_CPU_DSCP_INT_MASK	BIT(31)
-- 
2.55.0


