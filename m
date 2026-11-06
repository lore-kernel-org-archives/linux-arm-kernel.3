Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD823606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 09:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zQuANUbz;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=ETUQ/8Er
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=q1H95/3jUArP09V4hzLaUE0XBUgQ2k28lsOurBPd7c8=; b=zQuANUbzQlYJJwDNXue6H259eq
	4MdaIW5qzSHGhsVg62TirtmUbcbdh+hZJVOyAnXyfGOSTxkFiQsmJOJ8Ztq3ecOdQ5ShNTU1rH/2W
	HyQZ+H4gsBEDcdat2ub2zlvflK1vPxbgHycrvRiFB/B13DT7o5Ylek9XTEnKZWPrVW4twHsZB4fY/
	hUlewfabfycXw2kgyB0Bh0zDQI41QGRwhKiE4LkiwnKs6TRRxhHYtydlBHk0k+xoSw/iIBNK1An1u
	DW2j/0Gr3xW5Xv6vV8vmwyYQJRTPapUmxJnp41dCfujYwUYJ+mLXjfV7WQWBlclKyv02WqSaaYZIt
	uwED7BbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPFte-0000000Bepr-3eex;
	Fri, 06 Nov 2026 09:06:06 +0000
Received: from m16.mail.163.com ([117.135.210.5])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPFtc-0000000Beob-0Dvj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 09:06:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=q1
	H95/3jUArP09V4hzLaUE0XBUgQ2k28lsOurBPd7c8=; b=ETUQ/8ErmweduNzLfe
	rBILfqHyBPbKH7HUgdKY5q+xKHcf1aBazRi6DbR0smOY5pWsx2QSQRJ2+1reOgku
	iDDigAjh0gNv9MeHsaNl7AOCF/Fu1A+0ZvnY130/XT3nsKFBgniz6R/kMuZ6mjTA
	QHvinM241W6gEIo/jrAdYhfFc=
Received: from 4CV529F122.company.local (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wD3_7hJmO1qqwdQFQ--.15084S2;
	Fri, 06 Nov 2026 17:05:28 +0800 (CST)
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
Subject: [PATCH net-next v6 RESEND 0/4] net: stmmac: fix DMA descriptor ring cleanup issues
Date: Fri,  6 Nov 2026 17:05:02 +0800
Message-Id: <20261106090507.1020751-1-dinghui1111@163.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3_7hJmO1qqwdQFQ--.15084S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxXw4UAF4kKw15XrW5JF1DZFb_yoWrGw1Dpa
	yfKan8tryDXr18JwsxCw4xWF18Aa1fCF4Ygr17Jw1fua15uryF9rWS9rWYgFyDCryqkw1j
	qF15ZasrAF1UAa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jayxiUUUUU=
X-CM-SenderInfo: pglqwx1xlriiqr6rljoofrz/xtbC0RlSfmrtmFlPrAAA3B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_010604_471625_0466AD25 
X-CRM114-Status: GOOD (  10.44  )
X-Spam-Score: -1.8 (-)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ding Hui <dinghui@lixiang.com>

Hello,

This is a resend of v6, originally posted on October 24, 2026,
when net-next was closed. The four patches are unchanged.

Previous posting (v6):
https://lore.kernel.org/netdev/20261024071319.875921-1-dinghui1111@163.com/

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

The original v6 series was based on net-next commit
734bef548a96 (Merge tag 'net-next-7.4' of
git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next).
This resend retains the same base.

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


