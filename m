Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 639A0606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Oct 2026 07:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tmipypWF;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=h318Nj9K
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ZAim7a7Mw2f4u2GqAJJCl39Hm/2+x8OUH9OyNgrjapQ=; b=tmipypWFBV9WdIRxdzqySeiweD
	XN0kigpvlCZwJDgWJjo8MXwn3AVgsUo42Xl7OLcDMnHGzT31YYklXqAnd7MLrOmQMe+S5BhtYIde9
	lyeEUYQaN9m7DcLJNgqPFMPN3e3GyTM9zALWdgq1XayF2JiUuje5sJVD2AAXM3VvXHqEzkx7uRJgj
	Wi2PAqJYWkJCeYBFB4fsd0t/ipf8xUbUyZ9hAFXDAPzbPSK8SVHzVeS6k2mrNuwrYDPV/XPwiP/7G
	LGppRKCI4dK2I8LVzs43Ve6dWgV/GuYfvX6VMVn8loVHkdqUTVsmIt7nMZeV/SCGorcN+GH8FjMYy
	DZ7mw6HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKVxK-0000000HXEs-0Zgb;
	Sat, 24 Oct 2026 07:14:18 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKVxC-0000000HXBg-3R0f
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Oct 2026 07:14:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=ZA
	im7a7Mw2f4u2GqAJJCl39Hm/2+x8OUH9OyNgrjapQ=; b=h318Nj9Khr/oE1jAIF
	SEnZ4JiNHqtZNfK5S8Omc10942WL/3JHKFO/e7SqTpN0NNEbQW4bjoCWXm6Oa8Q+
	29UJYqhYOzYzI8qEwMMuU8P78oLR0svw6Htuhn3f6lhL6g+WA51+X0oxUdBl6c/C
	HbL3qgYNqhZbhWnIOlrNzmZd8=
Received: from 4CV529F122.company.local (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD310ySWtxq_y0rCg--.41124S2;
	Sat, 24 Oct 2026 15:13:32 +0800 (CST)
From: Ding Hui <dinghui1111@163.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	netdev@vger.kernel.org (open list:STMMAC ETHERNET DRIVER),
	linux-stm32@st-md-mailman.stormreply.com (moderated list:ARM/STM32 ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/STM32 ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Cc: dinghui@lixiang.com,
	xiasanbo@lixiang.com,
	yangchen11@lixiang.com,
	liuxuanjun@lixiang.com
Subject: [PATCH net-next v6 0/4] net: stmmac: fix DMA descriptor ring cleanup issues
Date: Sat, 24 Oct 2026 15:13:14 +0800
Message-Id: <20261024071319.875921-1-dinghui1111@163.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD310ySWtxq_y0rCg--.41124S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxArWkCw4xJFy8Ww4rCw4fAFb_yoW5tFy3pa
	ySvws8tr98Xr1xJrsxCw4xW3W8Ca1fCF4Ygr17tw1fua15uryF9rWSkrWYgF1DCryjkw1j
	qryYvasrAFyUA37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jgXo7UUUUU=
X-CM-SenderInfo: pglqwx1xlriiqr6rljoofrz/xtbC8xyPu2rcWpxixgAA3P
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261024_001411_715089_3A9745E9 
X-CRM114-Status: UNSURE (   9.88  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.7 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ding Hui <dinghui@lixiang.com>

Hello,

This series fixes the NULL pointer dereferences in the stmmac TX/RX
DMA resource cleanup paths and the associated error path issues,
found on a DWMAC platform whose descriptor ring allocation may fail
under memory pressure.

Patch 1 adds NULL guards in the free helpers and makes them clear
the pointers they free, so that a NULL pointer reliably means "not
allocated" for the long-lived priv->dma_conf.

Patch 2 makes the per-queue allocation functions undo their own
allocations on error, instead of leaving the cleanup to the outer
error paths that would then walk partially-initialized queues.

Patch 3 releases the descriptor resources through priv->dma_conf
when __stmmac_open() fails after copying the temporary dma_conf, so
the long-lived configuration stays consistent with the resource
cleanup.

Patch 4 holds RTNL around the descriptors_status debugfs reader and
skips queues whose rings are not allocated.

This series is rebased on top of the current net-next.

Changes in v6:
  - Split the single patch into a four-patch series as requested
    during review: NULL guards and pointer clearing, allocation
    error paths, descriptor resource release through priv->dma_conf
    on open failure, and the descriptors_status debugfs locking.
  - Merge the descriptor resource release with the ptp_error unwind
    from 8181678a92f0 and rebase on top of the current net-next.
  - Use the "net-next" subject prefix, which was requested back in
    v1 but mistakenly kept as "net" in all previous revisions.
  - Link to v5:
    https://lore.kernel.org/netdev/20261012142458.2845385-1-dinghui1111@163.com/

Changes in v5:
  - Release the descriptor resources through priv->dma_conf when
    __stmmac_open() fails, avoiding stale pointers in the
    long-lived configuration.
  - Hold RTNL while descriptors_status reads the descriptor rings.
  - Link to v4:
    https://lore.kernel.org/netdev/20261001035045.3305816-1-dinghui1111@163.com/

Changes in v4:
  - Free the RX resources in alloc_dma_desc_resources() when the TX
    allocation fails.
  - Skip queues whose descriptor rings are not allocated in
    stmmac_rings_status_show() and print a hint instead.
  - Link to v3:
    https://lore.kernel.org/netdev/20260919121436.1642724-1-dinghui1111@163.com/

Changes in v3:
  - Use addr directly in __alloc_dma_rx_desc_resources() error path
    instead of the if/else block on rx_q->dma_erx/dma_rx.
  - Clear the freed pointers in __free_dma_rx_desc_resources() and
    __free_dma_tx_desc_resources().
  - Link to v2:
    https://lore.kernel.org/netdev/20260905154654.1725313-1-dinghui1111@163.com/

Changes in v2:
  - Instead of only adding NULL checks in the free helpers, also fix
    __alloc_dma_rx_desc_resources() and
    __alloc_dma_tx_desc_resources() to clean up their own
    allocations on error, as suggested by Andrew.
  - Link to v1:
    https://lore.kernel.org/netdev/20260830040610.1156008-1-dinghui1111@163.com/

Ding Hui (4):
  net: stmmac: guard against NULL pointers when freeing TX/RX buffers
  net: stmmac: clean up partially allocated DMA rings on error
  net: stmmac: release descriptor resources through priv->dma_conf on
    open failure
  net: stmmac: hold RTNL when reading descriptor rings in
    descriptors_status

 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 115 +++++++++++++++---
 1 file changed, 98 insertions(+), 17 deletions(-)

--
2.34.1


