Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45CFDC982EE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 13:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=505rhK+elsmWiU1fs3MwwoGHwe7b9tZRevoRsk65ahQ=; b=YprsinzPqiMo4zkc+OO/kh/ygk
	lkBatJdQmGwaFoqzFEGob62vWCig81/6cPvS9Ej2xY7uvAkaYBMih3kzZ0AhsrrxLJk9UvXZluhXe
	7jZ+aVgs0l6y+K23CyoESqtNkvGxuda7TUZi4x+GikqElckLKCJOq+Gh+Y0Ql0/hc2Oz0RfEF1Oul
	oDGl3Q2Fs1dExm5zfomHJtW78Xklf7fM7XeWT3xrxi/2R0mLHN/8pxQQHYNZauu5dxlPWhgt0dvCh
	+gcnn67nDVc4h8rG+KXPhQw9U7UzSlZAQrvw6ysjUQ/YtP5eafGzs2X/lQ+BwIRuctfhI6cR+MypK
	+07S2Pjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8eXA-00000002JOS-1IAd;
	Mon, 21 Sep 2026 13:58:16 +0000
Received: from m16.mail.126.com ([117.135.210.6])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8eX7-00000002JNp-0x5R
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 13:58:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=50
	5rhK+elsmWiU1fs3MwwoGHwe7b9tZRevoRsk65ahQ=; b=fcRNP8jJK1mcMFHqhC
	Zhc2c3n4AScqc+sDmqGZP2YwRjnUM58zZdt0m9so6JWYTp5NaQJDit2zY2PQOx63
	RS5rZSR9RR+A7T29O72/SKxIbujUDat4o7pHx2AmKz59IXgpaNMwYiMGc4IvbAlw
	bh29iLT14wgpv4bzRHu2VSbj8=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wD33wG+N7FqH9M7Bw--.62914S3;
	Mon, 21 Sep 2026 21:57:21 +0800 (CST)
From: Linkui Xiao <xiaolinkui@126.com>
To: maxime.chevallier@bootlin.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com
Cc: netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Linkui Xiao <xiaolinkui@kylinos.cn>,
	stable@vger.kernel.org
Subject: [PATCH net v3 2/2] net: stmmac: fix a divide by zero in stmmac_xdp_xmit_xdpf()
Date: Mon, 21 Sep 2026 21:57:16 +0800
Message-Id: <20260921135716.218420-2-xiaolinkui@126.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260921135716.218420-1-xiaolinkui@126.com>
References: <20260921135716.218420-1-xiaolinkui@126.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD33wG+N7FqH9M7Bw--.62914S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZFy8Zr1fCFW7Zw1fKr1UGFg_yoW8uryUp3
	yfCa90yr1kJr43Jw4kGw409Fy5Jay0yF47K3W8t393ZF45ZrZIqry3tayYqF17Ar4kX3ya
	kw4Dur1DC3Wqy3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UtDG5UUUUU=
X-CM-SenderInfo: p0ld0z5lqn3xa6rslhhfrp/xtbBqQEF22qxN8HcogAA3l
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_065813_735798_7855CF55 
X-CRM114-Status: GOOD (  12.86  )
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

From: Linkui Xiao <xiaolinkui@kylinos.cn>

tx-frames 0 is a valid coalescing request: it only stops the frame count
from raising TX completion interrupts, while the coalescing timer armed
by stmmac_tx_timer_arm() keeps reclaiming the descriptors. That is why
stmmac_xmit(), stmmac_tso_xmit() and stmmac_xdp_xmit_zc() all test
priv->tx_coal_frames[queue] before taking the modulo, and why
__stmmac_set_coalesce() rejects the request only when tx-usecs is zero
as well, since then nothing would complete the transmissions.

stmmac_xdp_xmit_xdpf() is the one transmit path that takes the modulo
without the test, so

	ethtool -C eth0 tx-usecs 10 tx-frames 0

followed by an XDP_TX or an ndo_xdp_xmit frame divides by zero, which
oopses in softirq context on the architectures that trap on a zero
divisor.

Add the missing test, which leaves set_ic false exactly like the other
transmit paths do.

Fixes: be8b38a722e6 ("net: stmmac: Add support for XDP_TX action")
Cc: stable@vger.kernel.org
Signed-off-by: Linkui Xiao <xiaolinkui@kylinos.cn>
---
v3:
- New patch. stmmac_xdp_xmit_xdpf() is the only transmit path that divides
  by tx_coal_frames[queue] without a zero test; add the missing test the
  way stmmac_xdp_xmit_zc() has it. (Sashiko review)

 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index e2e680dd980c..276187f50ee3 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5256,7 +5256,9 @@ static int stmmac_xdp_xmit_xdpf(struct stmmac_priv *priv, int queue,
 
 	tx_q->tx_count_frames++;
 
-	if (tx_q->tx_count_frames % priv->tx_coal_frames[queue] == 0)
+	if (!priv->tx_coal_frames[queue])
+		set_ic = false;
+	else if (tx_q->tx_count_frames % priv->tx_coal_frames[queue] == 0)
 		set_ic = true;
 	else
 		set_ic = false;
-- 
2.25.1


