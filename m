Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831CB606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Oct 2026 10:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XPDIUiTM;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=EpRGsXKH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ERZR5jPccvo3d9kJQynA8g8Qib1muJ8RwObTD5dMpYU=; b=XPDIUiTMhYlEtdm3nzHOUPPCZ5
	77RG5XOBFgO5F1iUiTPuq87savUccpFUyD1KJitNdqVTOaQ+EB+zY3hCdSHGYqRIzb7YHxCXQMVDl
	Ik/H34EgV/3bAbA5OYW5f5c3K7npOEgA2eV2DIULumpjeCHZrcFxdqYra1FPCLkkYYydkPD6kYIWd
	IR2Jm1nQPcSQ+YWGjLC6dPkBUqUgC1AeK6MjtGOXLYtct3qi7lGF/1JupplVKzvV488OlpwFkr9aj
	ZHHObGJ8AnwW8tK8KrUjciqM/Ck6bLuu5wC+wKf0v3RUJPJcsDrj4qjunvHaW6OL8dxGguk29pq/f
	Z3F0jo/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKv8d-00000000woF-0dAR;
	Sun, 25 Oct 2026 10:07:39 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKv8Z-00000000wns-2WFC
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Oct 2026 10:07:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=ER
	ZR5jPccvo3d9kJQynA8g8Qib1muJ8RwObTD5dMpYU=; b=EpRGsXKHNQiWf09er5
	fn++rTWt/yDaRGjh78dTM43gQOikzH2At5aooPhz45nunfxlYHb6Zdp0mPfa7bOl
	ASgwg+Fkdlx4hDJGFpdND30g2ZrB2oLHLnVzMrrf7Aok5wd2imN2oKAXSmkrEG2d
	UJepCeFIuHQYAmRSdPCZ+EQag=
Received: from 4CV529F122.company.local (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wD3_26u1N1q7fwbCQ--.3918S2;
	Sun, 25 Oct 2026 18:06:58 +0800 (CST)
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
	liuxuanjun@lixiang.com,
	zhoujing3@lixiang.com,
	fujiahui@lixiang.com
Subject: [PATCH net v5 0/2] net: stmmac: restore RX descriptors on resume
Date: Sun, 25 Oct 2026 18:06:34 +0800
Message-Id: <20261025100636.613670-1-dinghui1111@163.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3_26u1N1q7fwbCQ--.3918S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxAFy3Xw15trWUCw15CFy8Xwb_yoWrJFy8pF
	WSk3yYyr4kur18Kws5Zw4IqFySka1rArW7W3y0q34Fvw45WFy29rW2kF4YvFyDCrn7G3W8
	Xr4j9anrCF1DZFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jLeOJUUUUU=
X-CM-SenderInfo: pglqwx1xlriiqr6rljoofrz/xtbC9AN3o2rd1MM3zQAA35
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_030736_150023_4926D586 
X-CRM114-Status: GOOD (  12.44  )
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ding Hui <dinghui@lixiang.com>

This series fixes RX descriptor buffer addresses that hardware writeback
may overwrite between disabling NAPI and stopping RX DMA during suspend.
Restoring these addresses before restarting DMA on resume prevents a
fatal bus error.

Patch 1 fixes the ignored allocation flags independently. Patch 2 shares
buffer preparation with the normal and zero-copy refill paths and restores
RX descriptor addresses on resume. Missing primary and secondary pages
are allocated with GFP_KERNEL; failure aborts resume. Unavailable XSK slots
remain CPU-owned, and all address writes precede the final OWN update.

The earlier fix, commit 9c63faaa931e ("net: stmmac: re-init rx buffers when
mac resume back"), was reverted by commit 00423969d806 after a Jetson TX2
suspend/resume regression. This series retains attached buffers and their
DMA mappings and only allocates missing buffers. It does not repeat the
recycle-and-reallocate sequence of that fix. Jetson TX2 has not been tested
with this series.

Reproduction and testing:
On our hardware platform, run iperf traffic from a PC to the platform
(the platform is the receiver), and suspend/resume the platform while
traffic is running. Without the fix, a fatal bus error occurs after
resume in almost every run. With the fix applied, the fatal bus error
was no longer observed under the same test conditions.

This comparison was performed using a backport of this series to a kernel
based on Linux 6.12.41, running on our hardware platform that integrates
a Synopsys XGMAC.

Changes in v5:
- Target net and add Fixes tags to both patches.
- Split the allocation-flags fix into a separate patch, with a Fixes tag
  identifying the page_pool conversion that stopped honoring the flags.
- Share page_pool and XSK buffer preparation with the RX refill paths.
- Allocate missing secondary pages even when the primary page exists,
  using the current baseline's buffer2 capability check.
- Condense the reinitialization kernel-doc to two paragraphs.
- Restore descriptor addresses before the final dma_wmb()/OWN pass.
- Clarify that unavailable XSK slots remain CPU-owned and may stop DMA
  with RBU, rather than claiming that hardware skips them.
- Power down legacy SerDes if RX descriptor restoration fails.
- Link to v4:
  https://lore.kernel.org/netdev/20260627122533.1165324-1-dinghui1111@163.com/

Changes in v4:
- Document the return value of stmmac_reinit_rx_descriptors().
- Link to v3:
  https://lore.kernel.org/netdev/20260604144557.3175399-1-dinghui1111@163.com/

Changes in v3:
- Allocate missing page_pool buffers with GFP_KERNEL and abort resume
  on allocation failure.
- Try to allocate missing XSK buffers and clear descriptors when the
  fill ring cannot supply a buffer.
- Restore OWN after programming addresses and rebuilding chain pointers.
- Honor the flags argument of stmmac_init_rx_buffers().
- Restore RX descriptors after stmmac_clear_descriptors().
- Link to v2:
  https://lore.kernel.org/netdev/20260526022620.501229-1-dinghui1111@163.com/

Changes in v2:
- Introduce a helper to restore addresses from existing RX buffers.
- Update the commit message.
- Link to v1:
  https://lore.kernel.org/netdev/20260515053856.2310369-1-dinghui1111@163.com/

Ding Hui (2):
  net: stmmac: honor allocation flags when initializing RX buffers
  net: stmmac: restore RX descriptor buffer addresses on resume

 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 190 +++++++++++++-----
 1 file changed, 138 insertions(+), 52 deletions(-)


base-commit: 7076f684d5132e6a6145e1da2fa74771ecd052e5
-- 
2.34.1


