Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C2C31049524
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 09:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7M4qvN4KUZhWeHz0+r2If9XfOaCaAnmKNLe00xCAwms=; b=HtK4OdJNy/vTrb6wS2Cy3MyxUS
	LEiphBD1ZRUo79hlHqhlXwhLVgK7CN2zuBHUEEw0DLxjgRlBPpQmhoNHcZyWxxxYmb7JG+yzqHRAL
	idhwH6ILEZK0JvPM+fzhS07U7eAqZOr143VOqM0b0hqNjSmpLDO45icY6gQnUya3/nOvVPhBwvJ6x
	DEHqhsGWC2PyLz+uvbyuNN/f/KHfBhm0Ls98Z9Jn5VQZ7A5P052XZlMKXKxyR0J++yFhh9L2UiA8x
	q2l+lSgy3vuDDyT2Gx0G3/FIsNK+S2fmDpsmrKrDlTx1e2YT0PGkuNZmMVnTi9EpMHihAm60mA2BS
	VdDh8BQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0GG2-0000000BLHV-2mpw;
	Wed, 11 Mar 2026 09:53:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0GG1-0000000BLFy-3SeI
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 11 Mar 2026 09:53:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=7M4qvN4KUZhWeHz0+r2If9XfOaCaAnmKNLe00xCAwms=; b=rc+YxFkxug+i+2DzqDJTTOHFSY
	XTZHcscSzulYj9hV+R6qP+cFHZAM5hWH1h4xlNkg7vGBVZ3zhhPXXgoj8FwBFpDgVtNa0gcPKHBTA
	gEVKfhIwRH6sXUghdEd33zyveFcKkWDRyQ7X0z3boK3Wr5QpXDnWEkccnJSOe6DqLiT5nLVBdwKXP
	mQU6834HTfTg4IsThQaZTf3KxvpAdUWFlmCUthUj99M6nXvP6H4JIvRAfM17w9DYlsHuWoIebInEy
	j3s3/Vou7K78B99OM8K8HyEYHAty0tK/rummSkRrgxxyCXGGXleKC/R8OxoEiJHwuNFhUsYchmRbH
	nmeJYA6A==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0GFy-0000000GcXw-308N
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 09:53:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=7M4qvN4KUZhWeHz0+r2If9XfOaCaAnmKNLe00xCAwms=; b=vw80s27OGrWSBdMS28kVJqhLXm
	8+nQEnaK/rCF2wiVCRhlquXaD7PX04vMo4XnQZOCgyMjZFVnz97rd41Dq4CVhhWAknumt2/GXaN52
	zoboaY7LPOgF0USIvhgL3bM0/38MwI98akbGnXroHK8daDyOCMmGs2z1ru7CvOQ/WEQ40FTJ3ptQj
	XRm0zi/oNHFeXaQl/VxpeDnbOduOZMSYq1iv91ViB2MIHNk9Cd5mIdwBb5G4uWeg8hzIk921lUe8Q
	/pZ4fIq3Ye59DeoNaQcV+RExH8R8wqqajTR29O7hyaJ5SBBkz1w3rVs5GbOFukctO338Bvgut8WqF
	GUCudibg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:37994 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1w0GFj-000000006Ap-0alh;
	Wed, 11 Mar 2026 09:53:19 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1w0GFf-0000000CiTt-3qMB;
	Wed, 11 Mar 2026 09:53:15 +0000
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
Subject: [PATCH net-next 14/15] net: stmmac: remove tx_tail_addr
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1w0GFf-0000000CiTt-3qMB@rmk-PC.armlinux.org.uk>
Date: Wed, 11 Mar 2026 09:53:15 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_095334_826951_33A98B1A 
X-CRM114-Status: GOOD (  12.76  )
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

There is only one place where tx_q->tx_tail_addr is used - the new
stmmac_set_queue_tx_tail_ptr(). Make this a local variable and remove
it from struct stmmac_tx_queue.

This commit does not change the semantics - the hardware relies upon
the descriptor ring not crossing a 4GiB boundary as the high address
bits are programmed into a separate register via stmmac_init_tx_chan().
Hence, truncating the DMA address to 32-bit is fine as the register it
will be programmed into is 32-bit, and the high bits are handled
elsewhere.

Also change the type of desc_size to size_t, as this variable is
initialised from sizeof().

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h      | 1 -
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 7 ++++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index d1f8383d1c04..7cc5967aecd7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -79,7 +79,6 @@ struct stmmac_tx_queue {
 	unsigned int cur_tx;
 	unsigned int dirty_tx;
 	dma_addr_t dma_tx_phy;
-	dma_addr_t tx_tail_addr;
 	u32 mss;
 };
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 4521469c5e1d..55b79e9e637f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -389,12 +389,13 @@ static void stmmac_set_queue_tx_tail_ptr(struct stmmac_priv *priv,
 					 struct stmmac_tx_queue *tx_q,
 					 unsigned int chan, unsigned int index)
 {
-	int desc_size;
+	size_t desc_size;
+	u32 tx_tail_addr;
 
 	desc_size = stmmac_get_tx_desc_size(priv, tx_q);
 
-	tx_q->tx_tail_addr = tx_q->dma_tx_phy + index * desc_size;
-	stmmac_set_tx_tail_ptr(priv, priv->ioaddr, tx_q->tx_tail_addr, chan);
+	tx_tail_addr = tx_q->dma_tx_phy + index * desc_size;
+	stmmac_set_tx_tail_ptr(priv, priv->ioaddr, tx_tail_addr, chan);
 }
 
 static size_t stmmac_get_rx_desc_size(struct stmmac_priv *priv)
-- 
2.47.3


