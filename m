Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CD19C61DBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 02:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zVE2SzTabNG8jcZz0PwA/kz3j8ilu3QHZ2JTIs77byU=; b=uuTocpdsasL8j4EJBKDIYQ8L+U
	VoGJ7CwSEHko1NM2X4EdkX3MB/BuH63cEs46T1+24RnVIT0gEDQAVoemf+JbL/2BTA3fLgv9N7N3E
	UjgKsix6GCnkbXtyGDVWYoghly12wExAgV5ij8OUAEpZgbBYJYN3KX0MUqlMEjAgmMoOeR01GITbB
	nxZ+oDUv/9CT/plZXf69CG9HaiESoYSOGoCMBgZB4Z6XQUHTgaIR93Jm1nF8G3JY0vlgvMhROh3UX
	tC54VzXjw939BLItc3tv1EoR/RXwqE7khlzSNQgTBT1go78x5rHu8z4G1/ebLsZqg04ZkSESoVEH0
	xF6pIzWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzQHQ-00000003KkQ-1qDj;
	Thu, 27 Aug 2026 02:55:52 +0000
Received: from smtpbgsg2.qq.com ([54.254.200.128])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzQHN-00000003Kjj-0Nnf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 02:55:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1787799287;
	bh=zVE2SzTabNG8jcZz0PwA/kz3j8ilu3QHZ2JTIs77byU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=WbJ0MuxAuYBgsQGd1XsXvj6iWAK+fjGXtWDbeB2URmobk8zdQIytI5vNcw6OW4OS5
	 pBkJms4gY2FmXVweVIegZi1u3TFF3YPQ7Dd+ktpT38qGZEPAoXf8DAFmCjSr8N5B5n
	 16Hb8D7Sv6EUj5jyFA6hUWf0kuZZZtREz6QaZ0Jc=
X-QQ-mid: esmtpsz17t1787799270td1fb8d54
X-QQ-Originating-IP: RlPSDMQ0IW+5J7jKbMsuzznADAl+ByN6fHqr9Ry+Dps=
Received: from PEN002676 ( [1.202.39.170])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 27 Aug 2026 10:54:19 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 9149043113890004404
EX-QQ-RecipientCnt: 16
From: ZhaoJinming <zhaojinming@uniontech.com>
To: netdev@vger.kernel.org,
	maxime.chevallier@bootlin.com
Cc: andrew@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	boon.leong.ong@intel.com,
	weifeng.voon@intel.com,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	ZhaoJinming <zhaojinming@uniontech.com>,
	joabreu@synopsys.com,
	f.fainelli@gmail.com
Subject: [PATCH] net: stmmac: stop DMA before freeing descriptors on open
Date: Thu, 27 Aug 2026 10:54:15 +0800
Message-ID: <32EB352EB66D74E7+20260827025415.2684733-1-zhaojinming@uniontech.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:uniontech.com:qybglogicsvrsz:qybglogicsvrsz4b-0
X-QQ-XMAILINFO: OAj0aC3PzlKaMMBWUaDehZLYzVSnFbCTleYQasjHh/DoBPwGwWRkMK5Q
	F3RbWwfhppc69p5CTSZRAHKyLdmarsId9jApsVtbncNpZyELX0QBMhVV9awnFD+hC65hRJ/
	V2IyDVgHFQalpScm01CVsNfo5Ejrmj+RyjatX8yIxkMx4wU1NVXYvo96lemi4CS46g0rRk4
	x/skT2f/MycIZ+dxUsMlvrvo5WPQcqsGsyEpwDLKuO8vTZgKuRBPZarsxfy10cH5ex4cT01
	RaW0ztJjqQbpJzhOCxCB4a5Qpoey8WAOw6BD84bM6wyRvj9B4P6205U6kNilVtNTVq9cPQv
	6fKY1lqXIK3JzHD1z9YV5xc0yCreIiAOEhfbr0GBVz695xuulitC89zutZxl/uBA2tZgCLY
	lARSmI3sF1HraM6CW2e3shiHPQrxy+cnfZSvVty+KZu4nVzOjYZDLt0dXIrBMula9YsPHKf
	zRMh21xmXz5W6JfSPm60v1Na/eXKB1cfIPtRoREdEPqcVri4IBokY7wKAqCsSyrzaQVMZ61
	/8zBpgEtAQ5s3XxOQEFvtv4CA8hip6aVLr4knqd6jfyL6RhDnUFZsUVMnIEk2CZMPPcENQX
	CZ9XnpIWOoCS9SrIQ0AwMxrnkzT/yTP9MFlhZ57xJggZ6yC7O37pmHL/hjIgQokq6fczkwO
	12l8A+Pze5jdwyXB6aTSb46/J0Pp2LlFHHt2FbYLqOAWtSBp2yRSunxnNOIu6adnjkGAX/F
	s7oCn4TJiWen6IKxSWfJjSsDuW4/lE1nFX/+cGx65aIcYJbV0I2+NBsu1VWqtf4yy2MOl4N
	61ViVYRUP5qcf7a0/j9wYNXsxd8flndYpCmGFZc+T3yn+06qHdJH9QbMjNJx6Ir+/pw5Nlw
	t3eE7o39AShkddq5pm2jXPcrSL8UMi2BSemH8EL6QG5bHGhBqAeYHRPzIzCRfWnh3BFYEIw
	89z/9t2JAwJp8RS1hxPN5MCNSW5HfBev0ffwrUPqGBAAnbPfGOro3uyRlsMbbc2W6VETddT
	I3D6vP4SUDqY0WSLE1DnHNMgxUOrY=
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_195549_751082_718B6617 
X-CRM114-Status: UNSURE (   9.67  )
X-CRM114-Notice: Please train this message.
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

In __stmmac_open() and stmmac_xdp_open(), the DMA engine is started
before stmmac_request_irq() is called.  If the IRQ request fails, the
clean-up paths free the DMA descriptor rings via dma_free_coherent()
without stopping the DMA engine first.

With the DMA engine still running, hardware may continue to access the
descriptor ring memory after it has been freed.  Add stmmac_stop_all_dma()
to both error paths, matching the teardown order in __stmmac_release().

Fixes: 8532f613bc78b ("net: stmmac: introduce MSI Interrupt routines for mac, safety, RX & TX")
Signed-off-by: ZhaoJinming <zhaojinming@uniontech.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index b2b7d0242dd3..f76d762c314c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4176,6 +4176,8 @@ static int __stmmac_open(struct net_device *dev,
 irq_error:
 	phylink_stop(priv->phylink);
 
+	stmmac_stop_all_dma(priv);
+
 	for (chan = 0; chan < priv->plat->tx_queues_to_use; chan++)
 		hrtimer_cancel(&priv->dma_conf.tx_queue[chan].txtimer);
 
@@ -7203,6 +7205,8 @@ int stmmac_xdp_open(struct net_device *dev)
 	return 0;
 
 irq_error:
+	stmmac_stop_all_dma(priv);
+
 	for (chan = 0; chan < priv->plat->tx_queues_to_use; chan++)
 		hrtimer_cancel(&priv->dma_conf.tx_queue[chan].txtimer);
 
-- 
2.51.0


