Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86A80C624CE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 21:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T+2f2XHv+af68YmdwG7YdmU8mGG4BCpNERxEZlAskTc=; b=Oh186nb4XURuiK5dHYfdVi2TuS
	fIWEzAC3UiMRQcq543sQ6yRH4okfzfEPzgw2Bjz+gyhfjmJElnaTW9+0k5bBja7ClMBwCVyRJoZQ3
	rjEuoU3EsmsnKlteINTDBS+0O1YufqxON1PtVdRMuw1h50MFsgAoDf/h1mVNGuinnpTg9EqaoRVb3
	lnoR5h36omu8MWBg+MgchgIesG7ya6S/VSL+gtITjIiAYpYNua4VqXXidms6HoZl/RxxwuKZha5Uu
	yVmbrzZueyL1v+lQ5BGIlAhRhEm1wY9DLslXctiwfbK7DguExu7aoFKeIqcynGLs9UqUMXruhyZki
	MUAwBMWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x19qz-0000000AYcU-0Di1;
	Mon, 31 Aug 2026 21:47:45 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x19qu-0000000AYaJ-0lng
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 21:47:43 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-3a2b4743936so1230801fa.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Aug 2026 14:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788212858; x=1788817658; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T+2f2XHv+af68YmdwG7YdmU8mGG4BCpNERxEZlAskTc=;
        b=qpdeun3FQcpMfiFiV9nTQSdPZRlN+rhmv3QX+8hwXV/fA/2EKTBUp3xMinhP6Sd9pZ
         AvmNo4PTsP6hYzxLayNhbTgjWBHv5sGsoj+/wOGJFWLOskRGZQgmYt92IBlT1kiTuSP4
         KZ1FzhP891zc1pAQcXiy8YA5aIDxKxVBIOOgd+5PMxfgLNkZ9vHpgLOdetJyogZEihFO
         umtYZulGrVsHNwHySLHAgbpRu+fL4rCCAZ9gKYAUcDz/FkaTEHBT1IYcpiY9pLs1OzgP
         s8hEMmTv2ZAtSvGIgwA38fzdVN6wdGDYOUJQUxScdwNP9BkOWLeS1la6RYhaXumlmefL
         KoFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788212858; x=1788817658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=T+2f2XHv+af68YmdwG7YdmU8mGG4BCpNERxEZlAskTc=;
        b=kq4Dz/SdDGc9pyrN3GXomCjP1TSWW9pV56Mhvic6aFEjWYYrm7b3lSRdSLP2F/T1kt
         qK2EG9b6CGfN1WJhanfQIFDX0fEvX4KLhWoKL8mY4IVl1KIAAr96keA693PDm9voBYkB
         jjAsLnTvKgvlV4jFC52AC95M20eRxLkgNlsyOFYTPj1sOSSXIvZWDUQapcyYTx7nOiKp
         Ke0VKKQSx51oGEmW3gAgBLlkNWIHjzh0F3e4rGlM1ICtSJBa0X+132povUJzHHbylHHz
         gre3q1OuBlng4T6/JAIRoKwgvWDFdnD+oWxMQh3lYX3emxHBsqipCyNkIB9gWNQLmcej
         0mDw==
X-Forwarded-Encrypted: i=1; AKwUvBwlCNQSwsbPKBGmF+5o3QegaeLB8kBNvipTG3Cvg8adYcGBXu7XK6me/PQlAZt8COEEPuFRF/MIlzLzfyNOBT/7@lists.infradead.org
X-Gm-Message-State: AFuF++n1I9i8w3PBFIKpm9V3XFCq2zUf1Xaa8Ew9GNkPZa4MwYJSFR3I
	Tdk8wJXxJlMxhmTmKH6ycax7vlBYX8q9AUCXVNXGV+NshoBxivoOJeg=
X-Gm-Gg: AYBFou3JUtxhccD32HpRZjHGW1sijI7kCkcLcvqD+t8PD329+xfarN9VTbyQBjuiscP
	9BE4SM2W7R7CvNzrf/fs6uYc/F+CifYxr7bY5Rgk4l8YXAimFUbfThPpHE1XaQh/CiXK0htCEla
	Wy2mXDL591c/pWAf55fazgQ2Nm/rglx4cCXMfhIp4Mk3V+DpMo2izUiaQFzwkUB+GSmeAUoQwo2
	iKM+fduSIhpYLM0rZ9FZSLbRx3NdtM4s/19CuzOIuB43zgWziGiCvSlqcdmMDFV+akRWcRtxOAI
	QfD2aRC3rYx/0wKtrDzANmI30ObRW+tyB6xDOU85OMwmvmINSnPp+ttQfev1wJM7cu7potGJypM
	BkeZj97mHztuzmvv9zP3gKZZrYI/hIa8G+kUkNd7TKRFldUiHa4v5zBmoFVLWcdzkygazAUhzy4
	Mf/bPBmGkBoIEv6yPIIt/a27YAJ+ipsaYoV1ZeYSe63gpFlcBlbQ==
X-Received: by 2002:a05:651c:325a:b0:394:1254:10d2 with SMTP id 38308e7fff4ca-3a30175f2aamr61513991fa.0.1788212857793;
        Mon, 31 Aug 2026 14:47:37 -0700 (PDT)
Received: from fedora ([92.36.9.2])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a31550cefbsm18299201fa.9.2026.08.31.14.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 14:47:37 -0700 (PDT)
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
Subject: [PATCH net v2 1/3] net: airoha: handle RX_NO_CPU_DSCP interrupt, not just RX_DONE
Date: Tue,  1 Sep 2026 00:46:59 +0100
Message-ID: <20260831234701.206021-2-sochnev.v.74@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260831234701.206021-1-sochnev.v.74@gmail.com>
References: <20260830095717.37218-1-sochnev.v.74@gmail.com>
 <20260831234701.206021-1-sochnev.v.74@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_144740_248775_8282D914 
X-CRM114-Status: GOOD (  19.53  )
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


