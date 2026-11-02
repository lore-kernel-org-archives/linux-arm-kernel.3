Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5D8606A326
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 08:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lGvKN39m;
	dkim=pass (2048-bit key, unprotected) header.d=kernelriot.com header.i=@kernelriot.com header.a=rsa-sha256 header.s=kr2026 header.b=0b5DIR22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Ysgu5v3eB4ToaKQ09/3znJj2IM+I6eUAuOt4TqVE94w=; b=lGvKN39m0L4H99xE1Y7AEjlpPY
	zfYLyR2J/zIVq9WbyWRDVRDsyFiWfT5piIMwlSF2Xpb9+3TSGVWyYBxPH3WB4jnSGTXEJdXuJ1pv8
	lRsQA9QfuAuN6z5j3Wu640MsIcodiVAr550U79l3EA4QCjIJaJ+ZLEJ4cJEs2eeJC3PvD4QorbDM3
	bMb+ddCuigyOnmm/zdVq1IE53aD66ZJWmx5LhTBnRGos4LjS+6ieyVmMSg6yjVz2boV7uFlDKLs3E
	qQnT41pvctt9iUV67/CpvvdfyS7Kt5xss/U6CLuhXimu64jtYi3M4EQ5T6HrEBGiZwFP2qwvMJdjC
	ANfTniNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNn7b-0000000Fpzx-3DR9;
	Mon, 02 Nov 2026 08:10:27 +0000
Received: from mail.kernelriot.com ([74.208.142.49])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNn7Y-0000000Fpyx-2UhI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 08:10:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernelriot.com;
	s=kr2026; t=1793607020;
	bh=grCTlBxrI9QvxJqQg5lsXzodkISaca8fxUUkda8novc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:From;
	b=0b5DIR22zqTZl3Za56pRR/PekIahY9BVK9nCQSB1jiIx+FdsN0ca0gimJ5evBju6D
	 0Pf//CGM9LsGSYk/y3STMlK6sv6Xy4Q9cFup6ioK8ZejLtHMMhDuYnfTpFsZwsw30V
	 OszqDWltgcVFgSF3anb9Cr/qIrH53WjE3S/xQ+DbR4TvwUJmXRAK6Pme6epwngqGcS
	 Fe3Tec4xsEwDX4Hke0KgnWuUVHvMtcXt1ImlTm+UR8zQlpthm3yV0Pb5zgeMw2NN8/
	 bEu3iV4JKovrvK4dIjzOrj4Ejmjv//hXgt81sjtgUyEnlbQzR01DpKDm6+5+hc67lx
	 QqlGyfcNs0How==
Received: by mail.kernelriot.com (Postfix, from userid 995)
	id 7572480E76; Mon,  2 Nov 2026 08:10:20 +0000 (UTC)
From: Magnus Leatti <magnusleatti@kernelriot.com>
To: Yao Zi <me@ziyao.cc>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] net: stmmac: dwmac-motorcomm: mask the MISC interrupt
Date: Mon,  2 Nov 2026 05:09:38 -0300
Message-ID: <20261102080938.2955-1-magnusleatti@kernelriot.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_001024_715254_226EE3B9 
X-CRM114-Status: GOOD (  14.52  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

motorcomm_init() writes 0 to MGMT_INT_CTRL0, which unmasks the MISC
interrupt. MISC arrives on MSI-X vector 5, which stmmac requests as its
MAC interrupt, and nothing in stmmac clears it. The vendor driver masks
it.

Since commit 1b9707e6f1a9 ("net: stmmac: enable RPS and RBU interrupts"),
heavy RX load sets MISC and it never clears again, even though every
status register I could find reads zero. Vector 5 then fires about 120k
times per second and the machine stops responding until the TX watchdog
resets the adapter, or does not recover at all. A 64-byte UDP flood
from another host is enough:

  iperf3 -c <host> -u -b 0 -l 64 -R -P 4 -t 10

Mask MISC, as the vendor driver does. I could not find anything else
that depends on it here: EEE is not supported, and Wake-on-LAN uses PME.

Tested on one YT6801 board with net at cb284914e749. Without this
patch the flood above hangs the board within a second. With it, no MAC
interrupt fires under that flood or heavier ones, including after link,
ring, MTU and speed changes and a module reload, and throughput is
unchanged. Suspend could not be tested. The register values were read
with a debug build of stmmac.

Fixes: 02ff155ea281 ("net: stmmac: Add glue driver for Motorcomm YT6801 ethernet controller")
Signed-off-by: Magnus Leatti <magnusleatti@kernelriot.com>
---
Russell, d3265c19b35d ("net: stmmac: xgmac2: disable RBUE in default RX
interrupt mask") describes a similar storm on xgmac2. Should dwmac4 do
the same? I have only tested the glue change.

 drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c
index 124fcd55a..610d533b9 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c
@@ -30,6 +30,7 @@
 #define OOB_WOL_CTRL				0x1010
 #define  OOB_WOL_CTRL_DIS			BIT(0)
 #define MGMT_INT_CTRL0				0x1100
+#define  MGMT_INT_CTRL0_MASK_MISC		BIT(21)
 #define INT_MODERATION				0x1108
 #define  INT_MODERATION_RX			GENMASK(11, 0)
 #define  INT_MODERATION_TX			GENMASK(27, 16)
@@ -172,7 +173,11 @@ static void motorcomm_reset(struct dwmac_motorcomm_priv *priv)
 
 static void motorcomm_init(struct dwmac_motorcomm_priv *priv)
 {
-	writel(0x0, priv->base + MGMT_INT_CTRL0);
+	/*
+	 * Nothing services the MISC source, and once raised it never
+	 * deasserts, so keep it masked.
+	 */
+	writel(MGMT_INT_CTRL0_MASK_MISC, priv->base + MGMT_INT_CTRL0);
 
 	writel(FIELD_PREP(INT_MODERATION_RX, 200) |
 	       FIELD_PREP(INT_MODERATION_TX, 200),

base-commit: cb284914e749388eef402938bdb3115fe1f6d337
-- 
2.54.0


