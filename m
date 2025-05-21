Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14D4BC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 07:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2oQ/JrcoS/t5UerpUTGgcXwKsZYBNxpl3mFRnQrj/vw=; b=Hk1njPzMziYYtK7EkhjmGy7FN3
	Fr9Jn5q2YtJTgRcBTU1kcjAAlaAqji8AMLviYw0QeH6PrREWJMsIlos0IZTbKCRUWlYKb2A+7sSBe
	X1Z945NAofmqm98TTMIVvzmp2hwaVnxBW8UiVRpPIZ53Iih1qmMZvtumUd94J7iQ0LfFRgVuLcyI9
	4ds2o6UFBQG9M50rtu5242zHmE0ysjQ9r+jrVXxoRXHiHpR1Q1ha0yubQ7YY9It1eCUQ5Ao3Wn3k4
	hDBsJJyvysleH8D7XymrE8iH/LyZD4Pu7YV4HZEpwzWdJ9hb6eKM60bn21bV+5iP2nRFlQNnzmb1r
	ILsiwilg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHdyg-0000000F4cc-1eua;
	Wed, 21 May 2025 07:35:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHdhL-0000000F2bi-2hZ6;
	Wed, 21 May 2025 07:17:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 61E654A241;
	Wed, 21 May 2025 07:17:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE1CEC4CEE4;
	Wed, 21 May 2025 07:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747811827;
	bh=vNByI9DAgnLUKkUIf0r392GAk6x7OYD8NqJcPezRtpI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=u3tQt4EZlS7G3C0b3tVmE1JQwpC4IJU6YruNIxU6BNcuRN1fIORRt5uzOAmVR6Ubq
	 CMf6HXqB2FUC17NV2uxDB/cgE3K5YvfoYDdLbM688WuHVuWmIGifDQDjZy2pkQ7vEY
	 hGebd/LEYQCTarVV57K4WqzBKuGJ/Nsj9VOfFqfO2QuhWkJ3pnt3HlXZJkUREnaPY3
	 psloT9ONvH2jtcH/lHrOEeE1SFYCdOLFrKdqYBq4PkACrChlPbSuffCUGWHZqUQE+/
	 69zVXpG/39yhXuATa5MjqZ2aCvjen8l/I4TQj39KQJ7X7GdepBy6ipWTKpOwgFn3ea
	 rjYuxBoiJpmNA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 21 May 2025 09:16:39 +0200
Subject: [PATCH net-next v3 4/4] net: airoha: Add the capability to
 allocate hfwd descriptors in SRAM
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250521-airopha-desc-sram-v3-4-a6e9b085b4f0@kernel.org>
References: <20250521-airopha-desc-sram-v3-0-a6e9b085b4f0@kernel.org>
In-Reply-To: <20250521-airopha-desc-sram-v3-0-a6e9b085b4f0@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_001707_737080_10EC7257 
X-CRM114-Status: GOOD (  12.14  )
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

In order to improve packet processing and packet forwarding
performances, EN7581 SoC supports consuming SRAM instead of DRAM for
hw forwarding descriptors queue.
For downlink hw accelerated traffic request to consume SRAM memory
for hw forwarding descriptors queue.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 11 +----------
 drivers/net/ethernet/airoha/airoha_eth.h |  9 +++++++++
 drivers/net/ethernet/airoha/airoha_ppe.c |  6 ++++++
 3 files changed, 16 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 20e590d76735e72a1a538a42d2a1f49b882deccc..3cd56de716a5269b1530cff6d0ca3414d92ecb69 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -71,15 +71,6 @@ static void airoha_qdma_irq_disable(struct airoha_irq_bank *irq_bank,
 	airoha_qdma_set_irqmask(irq_bank, index, mask, 0);
 }
 
-static bool airhoa_is_lan_gdm_port(struct airoha_gdm_port *port)
-{
-	/* GDM1 port on EN7581 SoC is connected to the lan dsa switch.
-	 * GDM{2,3,4} can be used as wan port connected to an external
-	 * phy module.
-	 */
-	return port->id == 1;
-}
-
 static void airoha_set_macaddr(struct airoha_gdm_port *port, const u8 *addr)
 {
 	struct airoha_eth *eth = port->qdma->eth;
@@ -1128,7 +1119,7 @@ static int airoha_qdma_init_hfwd_queues(struct airoha_qdma *qdma)
 			LMGR_INIT_START | LMGR_SRAM_MODE_MASK |
 			HW_FWD_DESC_NUM_MASK,
 			FIELD_PREP(HW_FWD_DESC_NUM_MASK, HW_DSCP_NUM) |
-			LMGR_INIT_START);
+			LMGR_INIT_START | LMGR_SRAM_MODE_MASK);
 
 	return read_poll_timeout(airoha_qdma_rr, status,
 				 !(status & LMGR_INIT_START), USEC_PER_MSEC,
diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index 3e03ae9a5d0d21c0d8d717f2a282ff06ef3b9fbf..b815697302bfdf2a6d115a9bbbbadc05462dbadb 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -597,6 +597,15 @@ u32 airoha_rmw(void __iomem *base, u32 offset, u32 mask, u32 val);
 #define airoha_qdma_clear(qdma, offset, val)			\
 	airoha_rmw((qdma)->regs, (offset), (val), 0)
 
+static inline bool airhoa_is_lan_gdm_port(struct airoha_gdm_port *port)
+{
+	/* GDM1 port on EN7581 SoC is connected to the lan dsa switch.
+	 * GDM{2,3,4} can be used as wan port connected to an external
+	 * phy module.
+	 */
+	return port->id == 1;
+}
+
 bool airoha_is_valid_gdm_port(struct airoha_eth *eth,
 			      struct airoha_gdm_port *port);
 
diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ethernet/airoha/airoha_ppe.c
index 2d273937f19cf304ab4b821241fdc3ea93604f0e..12d32c92717a6b4ba74728ec02bb2e166d4d9407 100644
--- a/drivers/net/ethernet/airoha/airoha_ppe.c
+++ b/drivers/net/ethernet/airoha/airoha_ppe.c
@@ -251,6 +251,12 @@ static int airoha_ppe_foe_entry_prepare(struct airoha_eth *eth,
 		else
 			pse_port = 2; /* uplink relies on GDM2 loopback */
 		val |= FIELD_PREP(AIROHA_FOE_IB2_PSE_PORT, pse_port);
+
+		/* For downlink traffic consume SRAM memory for hw forwarding
+		 * descriptors queue.
+		 */
+		if (airhoa_is_lan_gdm_port(port))
+			val |= AIROHA_FOE_IB2_FAST_PATH;
 	}
 
 	if (is_multicast_ether_addr(data->eth.h_dest))

-- 
2.49.0


