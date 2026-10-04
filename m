Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C285CA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 06:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jUq35Mj7y/kPdp1eqVQTd7ny1GwkFBnwNODPDMNc1j4=; b=vOlcdxhyo2W87WAXoDpRkzdXRx
	OmyMwFf6atPNsUNTjNqb8rhj55mUK5etbmV+JkRw25CHBhYtuZculyHljHz2hujFiIsE0rtVniBPh
	W5RGp6pDja+uogO3B4JRowfxfpvmQmO1Jk1gCGHynSWhIHr67oYuDNT2WRzvX9cbL0XMdOiv9y4vy
	T/ZlTsk3jfZB32SU3sD0e7Am77UO9gfrLYlcI1QnbpVNzQf3bYhOg1bKghEmLGgce5XwI01m609RF
	35F8Tnp6B6CAy2TTweFA8IjmFANUzFXZJE83MsLvzacCLWwMf3igmXOP91TDLvhSHVQbarm3f0MaX
	EFRT3H1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDGCB-0000000ERdz-4AdB;
	Sun, 04 Oct 2026 06:59:39 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDGC9-0000000ERdU-0GOb
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 06:59:38 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-48c5358fc28so177341f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 03 Oct 2026 23:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791097175; x=1791701975; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jUq35Mj7y/kPdp1eqVQTd7ny1GwkFBnwNODPDMNc1j4=;
        b=iQ9X5RL3ec0RTuFHkqq5HhlAIZus2DpLqeBJhe5KwQqL7DGf/+8NSjpPDRw05p1tg/
         BOIu2GQcrfFtUstjQfza4N299H/D71obXgaEMxJZOIXqHkyyFmJsqENnGq0LCWFf796i
         sWTShnLy4DGmLGedDmBOW5jsRVgzAKyRoPF4EEM9Ad3Y9xhxMGEtsZn4cCrGtzC5gVPA
         KreAdvIz6wou3u4HCozkED/N0aY2CSPk9fi/y/VkKebjldOX0PrHrx67r9OD8YsfDa37
         T1MdPhErbIxUDy4X+rvLQ0yCxPtm0gGiphzpLLCXilLsxneCgZuQvBfuUs8YICbZcrzM
         IE7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791097175; x=1791701975;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jUq35Mj7y/kPdp1eqVQTd7ny1GwkFBnwNODPDMNc1j4=;
        b=gnbMrawmDuoHosXThLDEcYct/7CNRDkjTsmXWoHcaayqW+PW1jlbAl5+YZOWVWm5ar
         0sTUwKDZjocW6P/0+n5hle1stSg7CrlUvT1v68vhEGZDqycf/ZvCv32TSGWGlCUTd7BC
         s5zNiXLgJ9vysHtJdRDab1nc+ZPWxKiN6D40IcCBramVA+xpRMN9sXs8gL0ZgNrbKocD
         sKfh3E98goHl5Ni95qVm2Ni7+P03e2Eg2AdceV9JqdX06/UfLBEeAKhZNeF7qdVFna/Q
         uqqocZOJ8mJCT8cDP6XgWywoHNe+oF5mKhqa4rWRbeRfMlQAfvpsMrmw6/WhXeLkg8KS
         Xf1w==
X-Forwarded-Encrypted: i=1; AKwUvBxrVveR19H2xvjYohOwJwd/Udzyw0cYYHXtY3M0oRE4+KLIYv0Zi3+BZSGYsiIw7l930OsZ55oe0rnbuT1CZlfx@lists.infradead.org
X-Gm-Message-State: AFq9FYIsrplv68kVBXU3aCbFM21osvWJlS0tlPDH7vOw3t19SHrNc4I/
	kXsfO1lxTf9suId/erS4BD0HcXxC/8pMU/EREunBCX+iG6H63EXR9CG0
X-Gm-Gg: AYBFou1hEqDwzorj7dQnTr9bMoxkVYlhg+S0LXjWlF/lFqT3cIRC/AGOexaR9LbIQyz
	FwPkOvF9JAi7MgVQGpmMDeTV74jt5CEcOkx4FTV2qMNFwlGUDEYiWH3l0pIvi6IMfZh/bQMoz1G
	CRqxN9p7rbDLSy9fFL26nfDKkIkFY1T+3mBcegHomEUjQQfyn7ISzmnL6RyvXSAyB/25CGcKxTw
	cXItpOrpLCzgMtWFl2JCq5mvdbKfSPQAwDPdmbve55oEFA7UHP0KKnIo/hVkzPnT9+PKFdptCMH
	4+IESYq/19fzPMSBF4J2mJj+GbkR2QEjSWvEWghL6bRUZD2VrFsm4yx7TgkO8aJvwm3LI8zlnQN
	9vqo4Wr1zwG7FF7X21gk4M87NvTZurJh+Hlu1ptb9/wyM/Tz0e0itxdFmqxwU3kMnJPAkvO75Hr
	4CwI9qYETAO/yNrvvTi4SNud1H76A+F5Clg/BFll+H61NP3dYGypAKFIYAiLDyp85ZY5XZsFS1B
	+0FoAWgC/VKFUasqdrD/onNPNPqLzTQPIwCMoGERlfRRy9h7Gw=
X-Received: by 2002:a05:6000:2610:b0:48a:f11e:6d57 with SMTP id ffacd0b85a97d-48c47fe6a3fmr6495332f8f.19.1791097174408;
        Sat, 03 Oct 2026 23:59:34 -0700 (PDT)
Received: from fedora-tap.advaoptical.com ([82.166.23.19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c57d927cdsm1761318f8f.6.2026.10.03.23.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 23:59:34 -0700 (PDT)
From: Sagi Maimon <maimon.sagi@gmail.com>
To: netdev@vger.kernel.org
Cc: kuba@kernel.org,
	pabeni@redhat.com,
	suraj.gupta2@amd.com,
	radhey.shyam.pandey@amd.com,
	michal.simek@amd.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	robert.hancock@calian.com,
	sean.anderson@linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sagi Maimon <maimon.sagi@gmail.com>
Subject: [PATCH net v5] net: axienet: do not report TX completions as NAPI work
Date: Sun,  4 Oct 2026 09:59:30 +0300
Message-ID: <20261004065930.1004953-1-maimon.sagi@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_235937_162532_E451F8F2 
X-CRM114-Status: GOOD (  18.97  )
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

axienet_tx_poll() reclaims every completed TX descriptor in one pass:
it passes lp->tx_bd_num to axienet_free_tx_chain() as the descriptor
limit, and @budget is only used as the napi_consume_skb() bulk-free
hint.  It then returns the number of packets reclaimed, which is bounded
by the ring size rather than by the budget, so the poll can report more
work than it was given.  This was seen after TX completion interrupts
had not been taken for a while and a full ring was reclaimed at once:

  eth0: NAPI poll function axienet_tx_poll+0x0/0x180 [xilinx_emac]
        returned 96, exceeding its budget of 64.

netpoll is affected as well.  poll_one_napi() polls with a budget of 0
to reclaim the TX path only, and warns once if any work is reported.

TX completions are not budgeted work: Documentation/networking/napi.rst
lets a poll process any number of them.  Do as bcmgenet does since
commit a58cdf56b6eb ("net: bcmgenet: complete Tx NAPI after one reclaim
pass"): reclaim the ring, complete NAPI with no work done, re-enable the
TX completion interrupt and return 0.  Re-enabling the interrupt raises
it straight away if more completions are already pending, so none is
left behind.  This also drops the extra poll that used to follow a full
budget's worth of completions, which only found an empty ring.

netpoll polls with a budget of 0 and must not complete NAPI, so skip
the completion then; napi_complete_done() refuses it in that case
anyway.

Suggested-by: Jakub Kicinski <kuba@kernel.org>
Fixes: 5a6caa2cfabb ("net: xilinx: axienet: Fix packet counting")
Assisted-by: LLM sparse
Signed-off-by: Sagi Maimon <maimon.sagi@gmail.com>
---

Notes:
    Changes in v5:
    - Complete NAPI with 0 and return 0, following commit a58cdf56b6eb as
      Jakub suggested, instead of capping the returned packet count at the
      budget.  Subject changed to match.
    - Dropped Suraj's Reviewed-by, as the change is different now.
    - Build-tested only; not yet run on hardware.
    - v4: https://lore.kernel.org/netdev/20260930071536.627964-1-maimon.sagi@gmail.com/
    
    Changes in v4:
    - Keep reclaiming the whole ring and cap only the value returned, as
      Paolo Abeni and the review of v3 suggested, instead of stopping the
      reclaim at the budget.
    - Fixes: now names 5a6caa2cfabb (review of v3).
    - v3: https://lore.kernel.org/netdev/20260924135052.185129-1-maimon.sagi@gmail.com/
    
    Changes in v3:
    - Report no work for a budget of 0, so netpoll cannot trip the
      WARN_ONCE() in poll_one_napi().
    - v2: https://lore.kernel.org/netdev/20260917115657.20697-1-maimon.sagi@gmail.com/
    
    Changes in v2:
    - Treat a budget of 0 as no limit, so that netpoll still drains the TX
      ring.
    - v1: https://lore.kernel.org/netdev/20260914114821.55503-1-maimon.sagi@gmail.com/

 drivers/net/ethernet/xilinx/xilinx_axienet_main.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
index 09443623a3e2..a13323a9399f 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
@@ -985,9 +985,9 @@ axienet_start_xmit_dmaengine(struct sk_buff *skb, struct net_device *ndev)
  * axienet_tx_poll - Invoked once a transmit is completed by the
  * Axi DMA Tx channel.
  * @napi:	Pointer to NAPI structure.
- * @budget:	Max number of TX packets to process.
+ * @budget:	NAPI budget, or 0 when polled by netpoll.
  *
- * Return: Number of TX packets processed.
+ * Return: Always 0.  TX completions are not counted against the budget.
  *
  * This function is invoked from the NAPI processing to notify the completion
  * of transmit operation. It clears fields in the corresponding Tx BDs and
@@ -1019,7 +1019,12 @@ static int axienet_tx_poll(struct napi_struct *napi, int budget)
 			netif_wake_queue(ndev);
 	}
 
-	if (packets < budget && napi_complete_done(napi, packets)) {
+	/* The whole ring was reclaimed above, so there is nothing left to
+	 * poll for: complete with no work done, as TX completions do not
+	 * count against the budget.  netpoll polls with a budget of 0 and
+	 * must not complete NAPI.
+	 */
+	if (budget && napi_complete_done(napi, 0)) {
 		/* Re-enable TX completion interrupts. This should
 		 * cause an immediate interrupt if any TX packets are
 		 * already pending.
@@ -1028,7 +1033,7 @@ static int axienet_tx_poll(struct napi_struct *napi, int budget)
 		axienet_dma_out32(lp, XAXIDMA_TX_CR_OFFSET, lp->tx_dma_cr);
 		spin_unlock_irq(&lp->tx_cr_lock);
 	}
-	return packets;
+	return 0;
 }
 
 /**

base-commit: 6dc989ea46b96ce170840174b4a38c4a387fb005
-- 
2.47.0


