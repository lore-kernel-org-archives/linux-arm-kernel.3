Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DD06CA5FBB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 07:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=F/SbVhMvqYrGxK11cD/q4PA+nXETskb6eXmSE0ztKU4=; b=zpiStgzYzfZaejLBjeFMdBAzvG
	OVqU7HX3kFHe4L5DRkV6zLMmUS/AQKye4zWot/CuyDR753I/m3ax2vJHl0nZzhPow80ZkCiJAc7Iq
	FCeNyRuhG5zc7q93yUmOJQEgPtalrzVRl+2S3ya/PRWD7dLKCLGHI2mmzyRpglHzPp1K9hkJ0MEyT
	Ih/0Bezo/OwHPw5HcBiNI0dNP9eLe+ZA59vd1Ohz+e7c5jpt76/gUOHZvBsqMOR0BHEHitZPIC4ck
	yEPTiEC/9+nm+hd2qymFJDrjYHPnr05sWnkVyVkd8k9QJmWzJZ6Y2bOxLQKZ5Y7edg8rLck6WFfLJ
	bt2nzu5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBoXb-00000005FOq-02oy;
	Wed, 30 Sep 2026 07:15:47 +0000
Received: from mail-wr2-x0e.google.com ([2a00:1450:4864:30::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBoXX-00000005FNV-2Urm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 07:15:44 +0000
Received: by mail-wr2-x0e.google.com with SMTP id ffacd0b85a97d-48af929e59dso852249f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 00:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790752541; x=1791357341; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=F/SbVhMvqYrGxK11cD/q4PA+nXETskb6eXmSE0ztKU4=;
        b=eYck/GXBbMWckTXXhlAeD1VCmYQzUqgJnmrSEEnmV3TqO+PIheldf3938vqS9het75
         vHQIgEV6IpfTEx724pibpgJE0Rw5opLWzmLVrVuVktkHz056n3C+PvL5ephSpnY4jvKh
         mTY2Dy4NVogIbNTUMvKCygOHPIgW8qu8eFMVYHocOe9LaOaQLiNK0XJELrb2TjFdf2VD
         5HCEuPQIkd5exyvx8lGxK5MNhVmdqWJDYv3xWrnMtK7rA4Ws0+ZIhLPbtIe1hmd8n+RZ
         Upe0P+5/UYkanC4mb3/9wQqKt9//t9kTS4aXoELXXkj+9EJs15SKAxhQj7fV3dkme0uT
         1fhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790752541; x=1791357341;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F/SbVhMvqYrGxK11cD/q4PA+nXETskb6eXmSE0ztKU4=;
        b=Fb4SgvpTMf+5nyo5xKNrm6kHgC2QpcjgsiJSp2Y2VX09UeuHxnxfX1qg6JnCUkzGjw
         wZgRSvtxP8EhT3qbo//PZ82TmA4tblYxlrHGnpJ1Qu5lkJ5n7RVlPEXrYpCDrex7U0HQ
         5FqFygBiTjK3U3XOx2xF2bRaZ11bX0MITlL3zq72b0vzB/WOlB2F8PPtyiKFDdcQo+yM
         sSFAd4qXS4Z3bG+Q+AG3beH7hRvuBTvCHSjnjeMxWNUPmhl4etfustY5Z9z3hdwIInOy
         bEGAB7Us7kPbmMT6YwIaylTEspYhDLe/vQtGK3+mqkxsdgGYv5vw+gJueZ8W3/8ziYaR
         KUPQ==
X-Forwarded-Encrypted: i=1; AKwUvBy92xnw3Gg+YV9IyPN/BWvWEd4IJtZBqGmA1DJsow7fEedVgEI5AffpCwNZzBOlBdlJHFo78HJEG3fXZDSKpfl2@lists.infradead.org
X-Gm-Message-State: AFq9FYIoNRPBBBKR/JnPz9fBdr2ECgfVFXsg9pLylcdFA9U62HWgI/FB
	LnO3nwjq3MykE13jbcjICAcMrzLk5J5p4md956436z1/cCVqD+Laxoat
X-Gm-Gg: AYBFou2pBkxYMx2RrkL2SdOh75v1kHMBcRTD450uJGVFgxx5pjAmW7DdyMihBP8ZHu1
	ZebrV30JCqTmQqb8SR+M9e3bhMRI6ekgoSV5j6whjAbpBVgIHtLKlBRLzlhytWzgmsI3+LKnZzT
	tbVcUotxDmvdnvT26eH2CtLpBk9d1/hHpfdLY9jWWffdfy20AtUzfxXaaxf+Ze9s4Z5fgBhxlhr
	B1HnjXwRy8CqDghrDR5DELNdWxdj48tPrZrXZ3U5TE6lC9LrA+4lu5qV8lYOTEVJpvyixcNiKUA
	nJorgZvCShmFxkMEf8Mx0oagRadULBIzKa/vGcESFcUi3BRSnJNElfwFKRdMjylCTsP098zK4Ln
	nkyyR3vtArc3kvyDVL/e5dUqadwKOElhCUoDa+vD9BAFMtyLqHMELd5aQWxFw2E0YZyVmq/gcYH
	KkHyrixi1Ju4jDzXFLdp91xPOQIuPwbt74KzTV7z1sVP7HrCkzhcqDB6epEBPbay3zGFdGJiHH8
	01ZTazpjfVK+l9ANauMwfjAv9p923OOT4ZafCyT
X-Received: by 2002:a5d:6f1c:0:b0:487:489:7af0 with SMTP id ffacd0b85a97d-48b024bd025mr1059857f8f.17.1790752540836;
        Wed, 30 Sep 2026 00:15:40 -0700 (PDT)
Received: from fedora-tap.advaoptical.com ([82.166.23.19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b02e7b0d0sm735890f8f.14.2026.09.30.00.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 00:15:40 -0700 (PDT)
From: Sagi Maimon <maimon.sagi@gmail.com>
To: netdev@vger.kernel.org
Cc: pabeni@redhat.com,
	radhey.shyam.pandey@amd.com,
	michal.simek@amd.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	robert.hancock@calian.com,
	sean.anderson@linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sagi Maimon <maimon.sagi@gmail.com>
Subject: [PATCH net v4] net: axienet: cap the TX poll return value at the NAPI budget
Date: Wed, 30 Sep 2026 10:15:36 +0300
Message-ID: <20260930071536.627964-1-maimon.sagi@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_001543_666728_64DFE14A 
X-CRM114-Status: GOOD (  17.85  )
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

Keep reclaiming the whole ring and cap only the value returned.
Documentation/networking/napi.rst allows a poll to process any number
of TX completions; it is the reported work that must stay within the
budget.  Stopping the reclaim at the budget instead would also leave
completed descriptors for a later poll, which does not come when
napi_disable() is pending.  When more than @budget packets were
reclaimed, returning @budget keeps the poll scheduled, and the next poll
completes NAPI and re-enables the interrupt as before.  A budget of 0
now yields 0.

Suggested-by: Paolo Abeni <pabeni@redhat.com>
Fixes: 5a6caa2cfabb ("net: xilinx: axienet: Fix packet counting")
Assisted-by: LLM sparse
Signed-off-by: Sagi Maimon <maimon.sagi@gmail.com>
---

Notes:
    Changes in v4:
    - Different approach, as Paolo Abeni and the review of v3 suggested:
      keep reclaiming the whole ring and cap only the value returned,
      instead of stopping the reclaim at the budget.  napi.rst allows any
      number of TX completions per poll, and stopping early could leave
      completed descriptors behind while napi_disable() is pending.
    - Subject changed to match; v1-v3 were "net: axienet: bound TX
      completion cleanup by the NAPI budget".
    - Fixes: now names 5a6caa2cfabb, which made the return value unbounded
      (review of v3).
    - Only axienet_tx_poll() and its kernel-doc change now.
    - Suggested-by: Paolo Abeni.
    - Build-tested only so far; v3 was tested on hardware, v4 not yet.
    - v3: https://lore.kernel.org/netdev/20260924135052.185129-1-maimon.sagi@gmail.com/
    
    Changes in v3:
    - Report no work for a budget of 0, so netpoll cannot trip the
      WARN_ONCE() in poll_one_napi().
    - Add the Assisted-by: tag that v1 and v2 omitted.
    - v2: https://lore.kernel.org/netdev/20260917115657.20697-1-maimon.sagi@gmail.com/
    
    Changes in v2:
    - Treat a budget of 0 as no limit, so that netpoll still drains the TX
      ring.
    - v1: https://lore.kernel.org/netdev/20260914114821.55503-1-maimon.sagi@gmail.com/

 drivers/net/ethernet/xilinx/xilinx_axienet_main.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
index 1722b7038f34..243b07fd5be8 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
@@ -984,9 +984,9 @@ axienet_start_xmit_dmaengine(struct sk_buff *skb, struct net_device *ndev)
  * axienet_tx_poll - Invoked once a transmit is completed by the
  * Axi DMA Tx channel.
  * @napi:	Pointer to NAPI structure.
- * @budget:	Max number of TX packets to process.
+ * @budget:	NAPI budget, or 0 when polled by netpoll.
  *
- * Return: Number of TX packets processed.
+ * Return: Number of TX packets processed, capped at @budget.
  *
  * This function is invoked from the NAPI processing to notify the completion
  * of transmit operation. It clears fields in the corresponding Tx BDs and
@@ -1027,7 +1027,12 @@ static int axienet_tx_poll(struct napi_struct *napi, int budget)
 		axienet_dma_out32(lp, XAXIDMA_TX_CR_OFFSET, lp->tx_dma_cr);
 		spin_unlock_irq(&lp->tx_cr_lock);
 	}
-	return packets;
+
+	/* The whole ring was reclaimed above, which may be more than the
+	 * budget, but a poll must not report more work than it was given.
+	 * netpoll polls with a budget of 0 and expects no work reported.
+	 */
+	return min(packets, budget);
 }
 
 /**

base-commit: a7bfaba4823e3c165bb2004c74eff7c096672bc7
-- 
2.47.0


