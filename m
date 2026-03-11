Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BF891049524
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 09:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WWguanKzx4dLZRgBponms/+CBeTYJZLbKyDkuByIfqc=; b=QQQCBICEdSn563JL0VHoYEi5vb
	eAY96Efqcz8ZsIqcrkEDmtzyOSnECaPYX8G5Rq0nOpr6ERRR254AqkSmWnCsgw6aVlMyBQx2weWrg
	CKS5L5KihOiu2mVNTTtyFgcFsKPvQSI30JMlehFFEM1XdUpxT+TW3MCiIeByszhgxAq/5VasQ9D8u
	IVJ72PBhJF9J1oUkd5L++UldjeJi8WCiN5zMz//5Djbi24AWFscaT7+4m7c+rZbDB7jtXmgiZE9ti
	omCz3vK17rM2iOh1OoWDp5GUMK6UgFnXtLWb0yPm5dEZOSzGVipwb/S06cwEX0mqslARtEdUi9I5R
	+qv3oG1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0GFS-0000000BKnT-0xxC;
	Wed, 11 Mar 2026 09:53:02 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0GFO-0000000BKjQ-18TR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 09:52:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=WWguanKzx4dLZRgBponms/+CBeTYJZLbKyDkuByIfqc=; b=LUsOYvdfsZNxH/+4Oh7hdJM6JI
	9GdHPNozCncllaJEnkGqHWAeOZ/9LDfUziwHJrf1IimhbXH3KDb2ydiicUSzloLEVfeO0UmIQSVVx
	YelzhnbDyqS3TgHh11aWX9GPiEv8BPIfLGyQvHuXfJBOmkOwHEBmaA6CDsV9yrvj+RRMtz411O1qW
	kfxFmqEzd/NsejtbsKqJW7u4qZ4wQq8bdgKkOCtMQb7RqMXW6DSgmtXax9wtns0u95lQlAofLdmG1
	d3xiKTrV3Mzvx7TRG5qsSq59KMPDY8SPrJHPYzRAsAzIO3gkPv5L1eNwdyeW/MocVy9+G7DRBQZ2O
	Psv5iP8w==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:59096 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1w0GF8-0000000068L-19bq;
	Wed, 11 Mar 2026 09:52:42 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1w0GF6-0000000CiTD-0KgM;
	Wed, 11 Mar 2026 09:52:40 +0000
In-Reply-To: <abE7LWj04-JNxgS2@shell.armlinux.org.uk>
References: <abE7LWj04-JNxgS2@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	bpf@vger.kernel.org,
	Daniel Borkmann <daniel@iogearbox.net>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Stanislav Fomichev <sdf@fomichev.me>
Subject: [PATCH net-next 07/15] net: stmmac: remove rx_tail_addr
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1w0GF6-0000000CiTD-0KgM@rmk-PC.armlinux.org.uk>
Date: Wed, 11 Mar 2026 09:52:40 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_025258_311365_C1FBE4D7 
X-CRM114-Status: GOOD (  12.94  )
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

There is only one place where rx_q->rx_tail_addr is used - the new
stmmac_set_queue_rx_tail_ptr(). Make this a local variable and remove
it from struct stmmac_rx_queue.

This commit does not change the semantics - the hardware relies upon
the descriptor ring not crossing a 4GiB boundary as the high address
bits are programmed into a separate register via stmmac_init_rx_chan().
Hence, truncating the DMA address to 32-bit is fine as the register it
will be programmed into is 32-bit, and the high bits are handled
elsewhere.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h      | 1 -
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 5 +++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index b096a9e090e3..d1f8383d1c04 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -131,7 +131,6 @@ struct stmmac_rx_queue {
 	unsigned int buf_alloc_num;
 	unsigned int napi_skb_frag_size;
 	dma_addr_t dma_rx_phy;
-	u32 rx_tail_addr;
 	unsigned int state_saved;
 	struct {
 		struct sk_buff *skb;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 8823f8f5b053..1d40168ec68d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -388,8 +388,9 @@ static void stmmac_set_queue_rx_tail_ptr(struct stmmac_priv *priv,
 	 * descriptiors are only supported with dwmac1000 (<v4.0) which
 	 * does not implement .set_rx_tail_ptr
 	 */
-	rx_q->rx_tail_addr = rx_q->dma_rx_phy + index * sizeof(struct dma_desc);
-	stmmac_set_rx_tail_ptr(priv, priv->ioaddr, rx_q->rx_tail_addr, chan);
+	u32 rx_tail_addr = rx_q->dma_rx_phy + index * sizeof(struct dma_desc);
+
+	stmmac_set_rx_tail_ptr(priv, priv->ioaddr, rx_tail_addr, chan);
 }
 
 /**
-- 
2.47.3


