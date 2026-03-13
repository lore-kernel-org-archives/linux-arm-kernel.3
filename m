Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AFB1105F784
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 09:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tWUNNp6YFhZcSa6rDVrWkFfDII00kYuQk+eRtQg9bY8=; b=ywdEPaHAZo1EuBPTxdZKZiQuj7
	gJB4FRClZnUKlRamfSIs80Dtc4PTPT+cp/K+iVaicJZ1gBPTSXq8Oxa1Wxhj6VzWJsQO2eqKV4qSM
	SMhF9UV9GuTPtXtbn1006fS189qXOQWGqyxqlAlulq1krPNQkau4/dMtiUPAkidaZu19PggEQiinD
	zT1yYsgJOCQgoAhAvbXfFBQBHpnECDd+psuJsjDvwiBp3j4baxk7F4QTAiaizEdaR2VVZfp0+GhuB
	w4c1joIJ+zWd2IaVjRIeEjZDaLw8j53OOXoIUCe/PeiSba91ad4cZJTp+0FH0N384QQjLOlSdj0i5
	TfKaeMQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0zAq-0000000HQox-1NXE;
	Fri, 13 Mar 2026 09:51:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0zAo-0000000HQoY-3CHh
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 13 Mar 2026 09:51:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=tWUNNp6YFhZcSa6rDVrWkFfDII00kYuQk+eRtQg9bY8=; b=IVNNtMXj5YHR+BJPGkKkXPgz0Q
	6qgL6MWA6LgoG5HV4AzOMDpHhf2gBH1KIcJO0P775RipcJwZIkxpdxds0LHCEjbTySLZkipthvD4M
	Hn5RaZIFLP/TfVq82VR1E9slf71r9aO2jQlWcxLt0V6c2jBb0o8mII8neXXRAGrfjlPlV7IH+U2yz
	FYUbaGZlbaoTB3Td0ZIK6F6oacEzvZovBuMB6S54GfjHp1luXqJJSX64V7IILIWEhb9pFKYwfoZfB
	hxubTPyntGN8UgS5cy+SyPgbxuA0S3fAiHFzQDbBsCP5wvY+DTVXXyI961Quhf12RED1GKAZtY4ST
	M7cedp6g==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0zAl-000000030yG-1BZZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 09:51:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=tWUNNp6YFhZcSa6rDVrWkFfDII00kYuQk+eRtQg9bY8=; b=Fo2qyXoEipmMO4pm2O89ahcrSu
	pRLqW1sOPRVPVD5ExJS7JfaxGb8kZnxw8nRV1NUKCBowMe72heyHbZRrYNUnp6KognhxUiS9LHX5L
	UnKDi8pNT96vOipFTpnvVYJOfOEemgwzNQ0JNCjEXRMfpDXb2Z+pWs99+m9HeJP/pTzXoXX5CJ+Lg
	sydaj+0YZMKOURtZ9wwjhbtgnTx6Fx5rpRtSW41AXXVquet0OqkRN5BwzLH8h722X/JIQjj2B2OLI
	WF/HSRkQiwqh6ZE1fMHveNdyigNitNFbDk+atVmXMKSeevrFmjBtHS8VwuJmbiRuhY7eT15b2iAJO
	WD3rAchw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:35546 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1w0zAd-000000000cM-26IN;
	Fri, 13 Mar 2026 09:51:03 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1w0zAc-0000000D4Ey-36GC;
	Fri, 13 Mar 2026 09:51:02 +0000
In-Reply-To: <abPdzyXJHqt5v3bi@shell.armlinux.org.uk>
References: <abPdzyXJHqt5v3bi@shell.armlinux.org.uk>
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
Subject: [PATCH net-next v3 01/15] net: stmmac: rearrange stmmac_tx_info
 members to pack better
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1w0zAc-0000000D4Ey-36GC@rmk-PC.armlinux.org.uk>
Date: Fri, 13 Mar 2026 09:51:02 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_095111_559282_A749663C 
X-CRM114-Status: UNSURE (   8.74  )
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


