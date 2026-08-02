Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97177C55162
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 11:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VxVdnKc+/FhAvBYsYt2BDF3N409QLaiV2tmViDCNuLY=; b=RAtIsO7JEtmc6qGPDVcPnSqSaF
	YkA91LJXdvHkjVwq4f4/u3CKfHxyphpC7h1JgB8JJ7Gghg8GjtKLiSB3EhgoOr5AyfLxDW1AnY9y1
	wL50y0ISqYXxoUBGAWzcEgXrpYJjLB7jjxx6WQt3lnFp6sszwHJZ4zFRatvHANfb/+QOI1pEaSrBw
	QKK+vu6WKbo/IcLRxr6zK/8h3xObgSm7pgYvDczyxTqbsWEiMdTDUCCCKknDLNzAFqCpXBXiequ8v
	7cIGx9riuMZCjomYdX8KKU47Mp9hBW7ytyPoxCF0ozABv9lnIfrH6e22FhxBtltqHHGDKNfeDkHyH
	dxrtIRZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqUYa-0000000FaQ5-3dI0;
	Sun, 02 Aug 2026 11:40:40 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqUYX-0000000FaPK-27S9
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Aug 2026 11:40:39 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id BB8951A13B0;
	Sun,  2 Aug 2026 11:40:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 73C526029B;
	Sun,  2 Aug 2026 11:40:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 71A1311C1757D;
	Sun,  2 Aug 2026 13:40:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785670825; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=VxVdnKc+/FhAvBYsYt2BDF3N409QLaiV2tmViDCNuLY=;
	b=JaqMTTBDcaKTn/CzASTnwfG/jYpGkbF/IzGwgYv7uZOk7FDd8hwdoly7MQFTI+rZ/gM46B
	2Af2aKmlqwDp7jVFpFMXQ3TQGCjG9iazVMW/Kwc2QsEVwHQgAafKlV9OxeHzQFjf+fNzPI
	HKywCTO814Ka+P5rw5JbrxHikVI2N8bgzVpwy4IHvIsXaZSJJXLRoLnWZ4+eNvDoOdVXt4
	yjDiNddKZ57mBUGH6sTSRs4errjxeYl+fmW3eNKOc1lo4L3VmkMntTIvNsTpHhGdltgMaJ
	sGl/2tbfcBgETDq9GdPnzMRGy8ltOGI7gbiaHM00zpmL7H/FFQ+b/mH5zc/jrQ==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Russell King <linux@armlinux.org.uk>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	thomas.petazzoni@bootlin.com,
	=?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH net-next 0/2] net: stmmac: Cleanup rx coalescing computation when using RIWT
Date: Sun,  2 Aug 2026 13:40:12 +0200
Message-ID: <20260802114015.214212-1-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_044037_724462_80616101 
X-CRM114-Status: UNSURE (   8.88  )
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

Currently when configuring interrupt coalescing on devices that relies
on the Receive Interrupt Watchdog Timer feature of dwmac, the
computation of the RIWT timings leads to off-by-one values when
reporting the timings back to userspace.

RIWT works by arming a watchdog timer upon receiving frames with the RI
bit not set in the descriptor. The timer duration is expressed in units
of 256 stmmac clock ticks, and therefore requires a bit of computation
to derive it :

riwt = (rx_usecs * n_clk_ticks_per_usec) / 256

and conversely

rx_usecs = (riwt * 256) / n_clk_ticks_per_usec

This computation as-is leads to a consistent off-by-one when setting
then getting back the rx-usecs value due to rounding errors (by truncation):

ethtool -C eth1 rx-usecs 42
ethtool -c eth1
 -> reports rx-usecs: 41

Let's use DIV_ROUND_CLOSEST instead for the computations. It does have
one side effect, the accepted boundaries for rx-usecs also shifts by one
now, going from [16us, 246us] to [15us, 245us]. For that reason, I'm not
targeting the net tree here, and it's overall a very small issue.

Maxime

Maxime Chevallier (2):
  net: stmmac: ethtool: Comment the magic numbers in RIWT computation
  net: stmmac: ethtool: Address off-by-one when reading the coal
    rx-usecs

 drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

-- 
2.55.0


