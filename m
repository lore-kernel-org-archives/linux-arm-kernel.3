Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2516DFED2FE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 10:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tWUNNp6YFhZcSa6rDVrWkFfDII00kYuQk+eRtQg9bY8=; b=uCxBz3sSEwmRBh5FCwIoEhriIm
	pafycCfDbY/cp9UG+wN2B+JfgRaqbyFFuzsCRIAZskvNi4dpjBLWPU5wBNDZ5nzLI6pdjuN5rQWl/
	M433Cngs/x3G7LicRWF6sY6RV7ONShYdo1tJKhElHFWna/QtvZWwD2+Up9piTtuSQVN1JQKokTIZ7
	btwOckQnWJiX0eqcXdgMIXIYx2ZHJM+i2sJqwfhNTjfFPpM/8hXrmxFsg/7X7V3kNjsDgK7wotSJc
	f3DAbRoLBl1EOFQrb61hQPy6ng42JtY2a6JNIEShDStWdRZU1m0yU3xqZrCz/qk3kg7tb6VtTM1fW
	YgP0+vzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0cyc-0000000Dp7i-1KV2;
	Thu, 12 Mar 2026 10:09:10 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0cyZ-0000000Dp6P-1v2e
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 10:09:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=tWUNNp6YFhZcSa6rDVrWkFfDII00kYuQk+eRtQg9bY8=; b=MMJ/LURe6HuHpmxDJswJRmX0Qi
	3ircF5cNb5lsN47yRG05oVsKlxlqeTGZzBgZK0gQclGx6WZAwrf2I1Nuly7DTxuNVE94Ed6WgQ3V5
	3F+JP/hvjp+7ZJuZBTOPWFDu86frAd2qs7PqdjR+BGq+iXZXR1k8iYw/iPMPmm22rRjjtRS6tcvK7
	b1hJ8gCT5+zLpC1z5691Uakbd/i9abY8OgW9Qa8Xd9cKCk4fKErgU5NMXpxpdIc0oeFxtv9Kg/zSp
	7puY7s/ANdWyTPtc6J6hN2iujkr4O+RpoAkyNBCWc4XjzE1Pjm77xqseBu4p4dOD1DjeW5Pcuvjkw
	hXLDUAqQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:42744 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1w0cyL-000000007XD-2X5o;
	Thu, 12 Mar 2026 10:08:53 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1w0cyK-0000000CzFs-395A;
	Thu, 12 Mar 2026 10:08:52 +0000
In-Reply-To: <abKQWloxp9_4OuJh@shell.armlinux.org.uk>
References: <abKQWloxp9_4OuJh@shell.armlinux.org.uk>
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
Subject: [PATCH net-next v2 01/15] net: stmmac: rearrange stmmac_tx_info
 members to pack better
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1w0cyK-0000000CzFs-395A@rmk-PC.armlinux.org.uk>
Date: Thu, 12 Mar 2026 10:08:52 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_030907_488141_6E8DFCAD 
X-CRM114-Status: UNSURE (   9.03  )
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

Rearrange the struct stmmac_tx_info members to pack better, essentially
by sorting by type size:

xsk_meta	embeds only a pointer - 32 or 64 bit
buf		dma address, 32 or 64 bit
len		normally 32 bit
buf_type	dependent on arch
map_as_page	normally 8 bit
last_segment	normally 8 bit
is_jumbo	normally 8 bit

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index bba9bb9c95bf..b096a9e090e3 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -47,13 +47,13 @@ enum stmmac_txbuf_type {
 };
 
 struct stmmac_tx_info {
+	struct xsk_tx_metadata_compl xsk_meta;
 	dma_addr_t buf;
-	bool map_as_page;
 	unsigned len;
+	enum stmmac_txbuf_type buf_type;
+	bool map_as_page;
 	bool last_segment;
 	bool is_jumbo;
-	enum stmmac_txbuf_type buf_type;
-	struct xsk_tx_metadata_compl xsk_meta;
 };
 
 #define STMMAC_TBS_AVAIL	BIT(0)
-- 
2.47.3


