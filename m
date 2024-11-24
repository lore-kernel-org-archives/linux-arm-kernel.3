Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D59F3E66887
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Nov 2024 13:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hayRSNi0jWyKNyavL+YFtKPW1//rhKXfIoUe0dk8tcI=; b=jyVTejL03ZZT9q+lnv6kHJfjI1
	u4X4D+ncOQOk44SKLHYNYaXTyhEy3fv+pl0PUDO8cIdKlG8rIdxBFf8zA9viKzoigrirkXfM88O37
	T/gI/3sq1A3A57F+MpOBQw5yQVPvD+LgoCb4bfyCbiLhnsnmug2yC9vJoyvH51EqAtPJITdZouJUx
	iV38kociSS2o39oCA1WQBxDAZLFtrgmh/D3x6duNYfw2xySa2sPhfcMpxAfAdJVq1thWd+kuIlNel
	aqJtrMopJ/GKpw4YGdnY2i/pHz0AwUeMQ3tB1i6tZkMHIqkILpbIzcgkZG1UqejrWlK9ds7Su49z2
	q3o28lng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFCyp-00000005zaY-2oRX;
	Sun, 24 Nov 2024 13:48:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFCxr-00000005zMm-2wJ2
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 Nov 2024 13:47:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9246F5C5760;
	Sun, 24 Nov 2024 13:47:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21DF8C4CECC;
	Sun, 24 Nov 2024 13:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732456070;
	bh=ed7jiiYh5GQ9RyyFpCE7Q1pI2GXOL3yHwT8I9/zjG0k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fy3ebVLX2617ZgLMu1MyFF+P4LcFO1YoXMA4lhRYz9m5/byf2v4LaafzBip9BgLFf
	 zjWJF847mKXNX9Ng1ojufIvXiHzxkfq7a27Dwo7UGbgN3JXzTMqXB8P8qdWmLAgzXr
	 Wxm3K10IAzmt+/kVy/hyne7iNb9CTQFk+npdronUpzzsGNJnp/RLkXABLlseUTNcHd
	 0ln0qin5VdBYqCV5uyTfzoHp8qvi+z+9s+Wt0F0eAdG/0hTWt9lsKVaQSWkFo6oE90
	 kARnu79KB1xkWb63zyABjx/aqtSYqaaBbjpjyJlGNWo18tQ/istGfKqFX2F6etFlRd
	 Za4GDCbtQsJ+Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Abhishek Chauhan <quic_abchauha@quicinc.com>,
	Simon Horman <horms@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Sasha Levin <sashal@kernel.org>,
	alexandre.torgue@foss.st.com,
	joabreu@synopsys.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	mcoquelin.stm32@gmail.com,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.6 31/61] net: stmmac: Programming sequence for VLAN packets with split header
Date: Sun, 24 Nov 2024 08:45:06 -0500
Message-ID: <20241124134637.3346391-31-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241124134637.3346391-1-sashal@kernel.org>
References: <20241124134637.3346391-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.63
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241124_054751_830097_0EF6BBE4 
X-CRM114-Status: GOOD (  14.15  )
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

From: Abhishek Chauhan <quic_abchauha@quicinc.com>

[ Upstream commit d10f1a4e44c3bf874701f86f8cc43490e1956acf ]

Currently reset state configuration of split header works fine for
non-tagged packets and we see no corruption in payload of any size

We need additional programming sequence with reset configuration to
handle VLAN tagged packets to avoid corruption in payload for packets
of size greater than 256 bytes.

Without this change ping application complains about corruption
in payload when the size of the VLAN packet exceeds 256 bytes.

With this change tagged and non-tagged packets of any size works fine
and there is no corruption seen.

Current configuration which has the issue for VLAN packet
----------------------------------------------------------

Split happens at the position at Layer 3 header
|MAC-DA|MAC-SA|Vlan Tag|Ether type|IP header|IP data|Rest of the payload|
                         2 bytes            ^
                                            |

With the fix we are making sure that the split happens now at
Layer 2 which is end of ethernet header and start of IP payload

Ip traffic split
-----------------

Bits which take care of this are SPLM and SPLOFST
SPLM = Split mode is set to Layer 2
SPLOFST = These bits indicate the value of offset from the beginning
of Length/Type field at which header split should take place when the
appropriate SPLM is selected. Reset value is 2bytes.

Un-tagged data (without VLAN)
|MAC-DA|MAC-SA|Ether type|IP header|IP data|Rest of the payload|
                  2bytes ^
			 |

Tagged data (with VLAN)
|MAC-DA|MAC-SA|VLAN Tag|Ether type|IP header|IP data|Rest of the payload|
                          2bytes  ^
				  |

Non-IP traffic split such AV packet
------------------------------------

Bits which take care of this are
SAVE = Split AV Enable
SAVO = Split AV Offset, similar to SPLOFST but this is for AVTP
packets.

|Preamble|MAC-DA|MAC-SA|VLAN tag|Ether type|IEEE 1722 payload|CRC|
				    2bytes ^
					   |

Signed-off-by: Abhishek Chauhan <quic_abchauha@quicinc.com>
Reviewed-by: Simon Horman <horms@kernel.org>
Link: https://patch.msgid.link/20241016234313.3992214-1-quic_abchauha@quicinc.com
Signed-off-by: Paolo Abeni <pabeni@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac4.h     | 5 +++++
 drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4.h b/drivers/net/ethernet/stmicro/stmmac/dwmac4.h
index d3c5306f1c41f..26cbb8f2ac2d0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4.h
@@ -44,6 +44,7 @@
 #define GMAC_MDIO_DATA			0x00000204
 #define GMAC_GPIO_STATUS		0x0000020C
 #define GMAC_ARP_ADDR			0x00000210
+#define GMAC_EXT_CFG1			0x00000238
 #define GMAC_ADDR_HIGH(reg)		(0x300 + reg * 8)
 #define GMAC_ADDR_LOW(reg)		(0x304 + reg * 8)
 #define GMAC_L3L4_CTRL(reg)		(0x900 + (reg) * 0x30)
@@ -284,6 +285,10 @@ enum power_event {
 #define GMAC_HW_FEAT_DVLAN		BIT(5)
 #define GMAC_HW_FEAT_NRVF		GENMASK(2, 0)
 
+/* MAC extended config 1 */
+#define GMAC_CONFIG1_SAVE_EN		BIT(24)
+#define GMAC_CONFIG1_SPLM(v)		FIELD_PREP(GENMASK(9, 8), v)
+
 /* GMAC GPIO Status reg */
 #define GMAC_GPO0			BIT(16)
 #define GMAC_GPO1			BIT(17)
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c
index 071f128aa4907..7805a66a0bc08 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c
@@ -534,6 +534,11 @@ static void dwmac4_enable_sph(struct stmmac_priv *priv, void __iomem *ioaddr,
 	value |= GMAC_CONFIG_HDSMS_256; /* Segment max 256 bytes */
 	writel(value, ioaddr + GMAC_EXT_CONFIG);
 
+	value = readl(ioaddr + GMAC_EXT_CFG1);
+	value |= GMAC_CONFIG1_SPLM(1); /* Split mode set to L2OFST */
+	value |= GMAC_CONFIG1_SAVE_EN; /* Enable Split AV mode */
+	writel(value, ioaddr + GMAC_EXT_CFG1);
+
 	value = readl(ioaddr + DMA_CHAN_CONTROL(dwmac4_addrs, chan));
 	if (en)
 		value |= DMA_CONTROL_SPH;
-- 
2.43.0


