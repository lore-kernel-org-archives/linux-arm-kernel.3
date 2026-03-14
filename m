Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2849105F79E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Mar 2026 09:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tWUNNp6YFhZcSa6rDVrWkFfDII00kYuQk+eRtQg9bY8=; b=pk6OGtd9VH90CMyo78kL7pJpr0
	MEhBhh0SorvxSk+KMQ/t77XHsSYwQYHKijCwA+EKTvnyfmltqmLY3OaVoODxnE44Q6bMkIAORBUC7
	kSc98x/LvOmvJKaDSVckEeLni6r1k8RVIBQ+9/ScD+kmOsR1xtobbgmLCcfh8IXRq/krHRwc2aZQh
	EFgFDbCpH+XMRmQUKgMAHt245TKDv8x9G1XBuP3Y2Fho3QJjo9g2+//m8NPW+nHGw0AwDXCkipVDA
	tt/qPO+WRoZoR1pHN+A578gfJCKhsHZhQobgaZUQ8124iqfYd3vhrJXWu7r7IdkBkzJ5DIlY9T4gS
	erPBWrng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1LW2-00000001h2K-1mdE;
	Sat, 14 Mar 2026 09:42:38 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1LW0-00000001h1g-0HCf
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Mar 2026 09:42:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=tWUNNp6YFhZcSa6rDVrWkFfDII00kYuQk+eRtQg9bY8=; b=Rabh65NdMHQyYlSvBQ4iqeH5As
	Jjfw4pMOXC+UkoLd9WSQb+/p61P/hKNQxIfj6M9HnHsfYblTB1OLYac3lBAfxo1wzn1fD3nkwHAHK
	is9wCrUfCfNh3Aa9he0p2JlTOj7rnRaO9EB3wiT6+torl3oq0RDLAmHygRmvBZz+Xe8VLMjsoERv7
	DOrEp0c3445FtIe3zf9StfTC52/AJrw76RVUX8ZK3oULSg4yyOg58nM8BY/KzJFbp6pSLAnkaodo4
	Q4JwmwW/j2jD7UkoF9OiZM3cx4nSRozbdBFQl1B8uIFfaAkbLI9sL/IH7qq8a4noROxYSOz5MFU44
	efamlP5g==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:36466 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1w1LVp-000000001zo-32NV;
	Sat, 14 Mar 2026 09:42:25 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1w1LVo-0000000DGRl-44lt;
	Sat, 14 Mar 2026 09:42:25 +0000
In-Reply-To: <abUtGH9KB03PH5Ne@shell.armlinux.org.uk>
References: <abUtGH9KB03PH5Ne@shell.armlinux.org.uk>
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
Subject: [PATCH net-next v4 01/15] net: stmmac: rearrange stmmac_tx_info
 members to pack better
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1w1LVo-0000000DGRl-44lt@rmk-PC.armlinux.org.uk>
Date: Sat, 14 Mar 2026 09:42:24 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260314_024236_097999_4B08CDDE 
X-CRM114-Status: UNSURE (   8.69  )
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


