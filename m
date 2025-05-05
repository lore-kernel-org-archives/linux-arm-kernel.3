Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCCFEC3ABB6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 23:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6VsFKnokdUvicm5hdRVEH/XfEi+/vQCCPCD/PEWs998=; b=YCQc6q0fsIMzShfNbU1WH2SgkY
	hvBg5FHz53aepIXRQ7xKvL7QyfcTxI9KcR6VctdaMz60nmMvtFVNTnUYJMCSRStoniun0msUpfT1E
	TduK/7o7IALGpnd9/cCax2QzJQqSWGq0gYq4IM39NJzsp7TqNN0cb6EE7HnfXxKup9/dlDIwy7P76
	XLdaC0higmxKjtXfojsDI8FjQh+TyOHmVtHMaXdr5qkvL+h3HI+weonO+rLBQ8v/QCmt+U6khzx5p
	y43q/fqt3LU7JdqHmlRiLzlpP1zv5vHW19FQceUmlIgbCZXsaF9FGOJEYCM35UhM80PgsH0+9r2db
	SjVZFhsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC5gJ-00000009AUU-0480;
	Mon, 05 May 2025 23:57:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4I4-00000008lZH-0blr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 22:28:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A4F42629C6;
	Mon,  5 May 2025 22:27:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3BFAC4CEE4;
	Mon,  5 May 2025 22:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746484079;
	bh=8QB1qWbQMWXdg2olIa2PcGR3GhKyBvi+KW+5UPu/fRg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cxcF/OnFa3vfZgfBQ0lloRErHHwL3YfnxVS5xKcB/uw7NGQVwJajtxrf1fwt4+Khf
	 J19oiPYlzpOjlEXbB2ccgbyI0mw2UAkLO8Mq3XgCMJbZ+dVBtHz6A0VOy02TJn7ZfE
	 CsCA0REDF0lZk29JxFqqMlj0FXOuufqFzxao6kXOL9RKwdBaE2cFcV+6dsXg9il+ZI
	 q5xoBI6QCDSJtyjPIFbUfPfdo0V+47kDxI29DXsLmw/i7PpKNt0ghKrNGmYfm+rpd9
	 rqVRVyWxZqC3U46UjO4tWbFF1ou5tMXl82ZvCg7h9gU+GvS+iXVMvwONQ2CEBDG7P7
	 4dgsT0KsQS/Tw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Russell King <rmk+kernel@armlinux.org.uk>,
	Huacai Chen <chenhuacai@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	maxime.chevallier@bootlin.com,
	fancer.lancer@gmail.com,
	jan.petrous@oss.nxp.com,
	si.yanteng@linux.dev,
	0x1207@gmail.com,
	olteanv@gmail.com,
	xiaolei.wang@windriver.com,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.14 338/642] net: stmmac: Correct usage of maximum queue number macros
Date: Mon,  5 May 2025 18:09:14 -0400
Message-Id: <20250505221419.2672473-338-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
Content-Transfer-Encoding: 8bit
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

From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>

[ Upstream commit 352bc4513ec3907db71cb5674fb93a76fc341ca9 ]

The maximum numbers of each Rx and Tx queues are defined by
MTL_MAX_RX_QUEUES and MTL_MAX_TX_QUEUES respectively.

There are some places where Rx and Tx are used in reverse. There is no
issue when the Tx and Rx macros have the same value, but should correct
usage of macros for maximum queue number to keep consistency and prevent
unexpected mistakes.

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Reviewed-by: Huacai Chen <chenhuacai@kernel.org>
Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Link: https://patch.msgid.link/20250221051818.4163678-1-hayashi.kunihiko@socionext.com
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/ethernet/stmicro/stmmac/common.h | 4 ++--
 drivers/net/ethernet/stmicro/stmmac/stmmac.h | 7 +++----
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
index e25db747a81a5..c660eb933f24b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/common.h
+++ b/drivers/net/ethernet/stmicro/stmmac/common.h
@@ -101,8 +101,8 @@ struct stmmac_rxq_stats {
 /* Updates on each CPU protected by not allowing nested irqs. */
 struct stmmac_pcpu_stats {
 	struct u64_stats_sync syncp;
-	u64_stats_t rx_normal_irq_n[MTL_MAX_TX_QUEUES];
-	u64_stats_t tx_normal_irq_n[MTL_MAX_RX_QUEUES];
+	u64_stats_t rx_normal_irq_n[MTL_MAX_RX_QUEUES];
+	u64_stats_t tx_normal_irq_n[MTL_MAX_TX_QUEUES];
 };
 
 /* Extra statistic and debug information exposed by ethtool */
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index f05cae103d836..dae279ee2c280 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -257,7 +257,7 @@ struct stmmac_priv {
 	/* Frequently used values are kept adjacent for cache effect */
 	u32 tx_coal_frames[MTL_MAX_TX_QUEUES];
 	u32 tx_coal_timer[MTL_MAX_TX_QUEUES];
-	u32 rx_coal_frames[MTL_MAX_TX_QUEUES];
+	u32 rx_coal_frames[MTL_MAX_RX_QUEUES];
 
 	int hwts_tx_en;
 	bool tx_path_in_lpi_mode;
@@ -265,8 +265,7 @@ struct stmmac_priv {
 	int sph;
 	int sph_cap;
 	u32 sarc_type;
-
-	u32 rx_riwt[MTL_MAX_TX_QUEUES];
+	u32 rx_riwt[MTL_MAX_RX_QUEUES];
 	int hwts_rx_en;
 
 	void __iomem *ioaddr;
@@ -343,7 +342,7 @@ struct stmmac_priv {
 	char int_name_sfty[IFNAMSIZ + 10];
 	char int_name_sfty_ce[IFNAMSIZ + 10];
 	char int_name_sfty_ue[IFNAMSIZ + 10];
-	char int_name_rx_irq[MTL_MAX_TX_QUEUES][IFNAMSIZ + 14];
+	char int_name_rx_irq[MTL_MAX_RX_QUEUES][IFNAMSIZ + 14];
 	char int_name_tx_irq[MTL_MAX_TX_QUEUES][IFNAMSIZ + 18];
 
 #ifdef CONFIG_DEBUG_FS
-- 
2.39.5


