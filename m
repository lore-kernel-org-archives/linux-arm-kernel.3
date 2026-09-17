Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E82AC982CF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 11:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ePwmsMkUKDU1SxF8E4e113FncU/+AY22Hw2g6GemxcY=; b=O6+iNe+4ltsKNN1o4AHVi5xABB
	v5KQW7BF1jaBdrejCRyw4dfb4AghaybIn4+Heh7m7z9BZXLUOWuAglSlkREcCV4OyagFEOwXJvqmT
	GcObwULMw1aS2JFtLFsL1BGrf+iqbB/k/r09F2fkFYHxWON0l03eXfWEwDltGfzaybOKLJQ2fpM3q
	p5DC0lXr4M7Xt1CxdmNwxXv1z37e8QkDCniRKr15CCa4DHUGFiinRWMNg6V/Tc1J4h1VXdXWANss9
	B1jlmUVprpaiQ6uF0yoFE33bTl7cXjgFDSVgLxCBhI4Z/SQZjFbTMmdDTPYmIXTbGrACCioUd9fDS
	QPAOVXtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Ajg-0000000BEt1-3G0d;
	Thu, 17 Sep 2026 11:57:04 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Aje-0000000BEsX-33Ku
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 11:57:04 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49b912e4b11so4093075e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 04:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789646220; x=1790251020; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ePwmsMkUKDU1SxF8E4e113FncU/+AY22Hw2g6GemxcY=;
        b=jnQwLk7FenSjdeXl4jCFyJBZe4XMmiQrmMvkiJv8lT7G4X2Dry3DoZgI86Hb2ILpvi
         RcITOdjNJRlqL/ZjczNTsQQQ6LfbbpAFA4r0TkezbkPP2caomb+qdYmt8IyHZS4G2Nlb
         A4Q0FxzkIWubJ9/SCka3ct7gqxXEIbXvaV3lQjKL8gCUVVFeSeQ0V83op83Gf4D+vkaE
         U9wDC5KdbjtBa+OY1Hk3t1yCgnhthHJL0GMMb/4Gfq8VeTf8eq5stW2xzxd1dDB6ppUe
         el76EhZqhlpSj/N8gPEBRJZ/Qp+hoTSp2tBu4M2FJXNutdbyKB+YgxQv9vXE7gzFgnMf
         MH0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789646220; x=1790251020;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ePwmsMkUKDU1SxF8E4e113FncU/+AY22Hw2g6GemxcY=;
        b=a6XfJJeVibTK59udmDJ99OIQGWDg7ifH8DXzu+6uR2hTehPI6/xqFORMAw8qpc2zgP
         sGVqmOvinIyU9uJLWQiMmGORil/OcnV2DXRjNtRanRlAtP+t9uoX1ZHkLp9XpMdXuQg/
         3pcyq3kicKQvGYigjV5Ot/Mh2XtFhn+oaFLvg+z9My8mhGyRki5ZzegijveqOQqJIEhz
         g1FHWen6KHXzlOX0Cg0Wu5KL58FnR1jMDUVl6nhUBKtdjzV2CaG4e2kwATC3G5lMH6iW
         jlMcNAPe7MuGopEJ85kfGMQSa7FdQJXZEZQg4/uMsZ8p4oTQn2aeBD2dt4vHb3aEc6E/
         mU6Q==
X-Forwarded-Encrypted: i=1; AKwUvBwGt0E6OEArc2SZOhZGt0RxPnTyTE9wvcrB4SjrE66NZgVHOdXFWqPEJU/d4cyBe+X8Dk7UDE88Bt7ewObIKpG4@lists.infradead.org
X-Gm-Message-State: AFuF++kVOFzmkZBuTaw/8Hk3u2Lxckp42ToF2C3l5MShj8fEMBHiIBNV
	7QTFefD8sOUcXQPfal1UbXxehnAc5+e5De4RxUBmtl6CQDyM5MOjHdjm
X-Gm-Gg: AYBFou2XXywRIpjgfAZYkVjdmiIyxcD/D5dYhsJr7FuDbFzPRF60t4w3uNmfQZtVJLU
	JCY0D23IGJbXqxFF9i+/hzOUIDvAIKWpj3oocrr0DQrVFALEaqyt70DmpIpd0RG4A+ebrqjpm2N
	ysir28Hkkl36tjC8yc7sgLUkqPbw15FRv5Q/IdaMg53q8U/ZznTVsN9JxQHb7DQYhv3Wm3EVvcO
	EI9fFcHJxrPAUiagNfbLVGmobqcLOViui2aW3+e5z0o5DH3s4jg+ntu0qpyEfaM6XtSOoStltOo
	V4mjsTPFWwHJS/u+zSnLfQo7demkv+vRelST4ruKKf0HCmkSCI4iwtJ1VNVeDO8QyzaIT1x5iiw
	rYz8A2KvoA+krB0rE0n6iigRtiMVvh+D/fR1CrJm7XHGdJ0THkGAd/4DRIfl+9ZrscC1naOxioF
	BkOsTPdoFH8b1wsKi3qYxG8YQyGQFGspydkI5vs2CoVkJbVSa6XN0xvDTjs4a5qyUsO2ZhIV3Z2
	ynSiITn9FofouznVo/LJgYySgZbtNhEz64DztZo
X-Received: by 2002:a05:600c:198d:b0:49e:7a00:b9a5 with SMTP id 5b1f17b1804b1-49eac4642ffmr84127505e9.4.1789646220111;
        Thu, 17 Sep 2026 04:57:00 -0700 (PDT)
Received: from fedora-tap.advaoptical.com ([82.166.23.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e847eab65sm91365315e9.2.2026.09.17.04.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 04:56:59 -0700 (PDT)
From: Sagi Maimon <maimon.sagi@gmail.com>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	netdev@vger.kernel.org
Cc: Robert Hancock <robert.hancock@calian.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Michal Simek <michal.simek@amd.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sagi Maimon <maimon.sagi@gmail.com>
Subject: [PATCH net v2] net: axienet: bound TX completion cleanup by the NAPI budget
Date: Thu, 17 Sep 2026 14:56:57 +0300
Message-ID: <20260917115657.20697-1-maimon.sagi@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_045702_794025_A56A4F1B 
X-CRM114-Status: GOOD (  20.94  )
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

axienet_tx_poll() passes lp->tx_bd_num to axienet_free_tx_chain() as
@nr_bds, and @budget is only forwarded to napi_consume_skb() as its
bulk-free hint.  Nothing limits the cleanup loop to the NAPI budget, so
the number of packets returned is bounded by the TX ring size rather
than by the budget, and the poll can report more work than it was
given:

  eth0: NAPI poll function axienet_tx_poll+0x0/0x180 [xilinx_emac]
        returned 96, exceeding its budget of 64.

Returning more than the budget breaks the NAPI contract.  It also makes
the "packets < budget" test in axienet_tx_poll() false, so
napi_complete_done() is skipped and TX completion interrupts are not
re-enabled on that pass.  NAPI reschedules the poll, so this recovers,
but the accounting is wrong either way.

In steady state fewer descriptors complete per poll than the budget
allows, which is why this is rarely observed.  Triggering it needs more
than @budget completions outstanding at once - for example when TX
completion interrupts have not been taken for a while and a full ring is
reclaimed in one go.

Stop the loop once the budget is spent.  cur_p->skb is only set on a
packet's last descriptor, so breaking there never leaves a packet
half-freed.

A zero budget must not be treated as a spent budget.  netpoll calls
napi->poll() with a budget of 0 to reclaim the TX path only, and
axienet_tx_poll() forwards it unchanged with @force false; testing
packets >= budget alone would break out before examining a single
descriptor, leaving skbs unfreed and lp->tx_bd_ci unchanged.  Since
cur_p->cntrl is cleared only here, axienet_check_tx_bd_space() would
keep reporting the ring full and netconsole output could stall.  Zero
therefore means no limit, which also covers the @force callers that
clean up after a DMA mapping failure with a budget of 0.

Fixes: 9e2bc267e780 ("net: axienet: Use NAPI for TX completion path")
Signed-off-by: Sagi Maimon <maimon.sagi@gmail.com>
---
v2:
- Do not treat a zero budget as a spent budget.  netpoll polls with a
  budget of 0 to reclaim the TX path only, and v1 broke out of the loop
  before examining any descriptor, so nothing was reclaimed and the ring
  could stay full.  Reported by the Sashiko AI reviewer.
- Update the @budget kernel-doc: it bounds the cleanup when @force is
  false, and zero means no limit.  It previously read "use 0 when not
  called from NAPI poll", which after v1 would have meant "reclaim
  nothing".
- Compile-tested only; the board this was found on is not available to
  me at the moment.  v1 was verified on hardware with the napi:napi_poll
  tracepoint (8424 polls, max work 64 against a budget of 64).

v1: https://lore.kernel.org/netdev/20260914114821.55503-1-maimon.sagi@gmail.com/
 drivers/net/ethernet/xilinx/xilinx_axienet_main.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
index 782f903d318f..f643453261f1 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
@@ -772,7 +772,9 @@ static int axienet_device_reset(struct net_device *ndev)
  * @force:	Whether to clean descriptors even if not complete
  * @sizep:	Pointer to a u32 accumulating the total byte count of
  *		completed packets (using skb->len). Ignored if NULL.
- * @budget:	NAPI budget (use 0 when not called from NAPI poll)
+ * @budget:	NAPI budget. When @force is false, cleanup stops after this
+ *		many completed packets. Zero means no limit, as used by the
+ *		netpoll TX reclaim and by callers outside NAPI poll.
  *
  * Would either be called after a successful transmit operation, or after
  * there was an error when setting up the chain.
@@ -788,6 +790,15 @@ static int axienet_free_tx_chain(struct axienet_local *lp, u32 first_bd,
 	dma_addr_t phys;
 
 	for (i = 0; i < nr_bds; i++) {
+		/* A NAPI poll must not return more than its budget.  Stop on a
+		 * packet boundary once it is spent - cur_p->skb is only set on
+		 * a packet's last descriptor, so no packet is left half-freed.
+		 * A zero budget means no limit: netpoll polls with a budget of
+		 * 0 to reclaim the TX path only, and must still clean the ring.
+		 */
+		if (!force && budget && packets >= budget)
+			break;
+
 		cur_p = &lp->tx_bd_v[(first_bd + i) % lp->tx_bd_num];
 		status = cur_p->status;
 
-- 
2.47.0


