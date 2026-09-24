Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19DD4C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 17:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NxlMLeY3xGhSrBi9Qa91jcGZfKU8ZnUsiaHuYqFMG9Y=; b=qdKt3NJu2I3Wz5I2hDeF9rgU7G
	5P+MbtKmJtC/viKciX8LZB/8UWiN6FdAcTgGAHz8VM2nUOdWBDJZrHB7Zr1i7RwbBfiMdz4X4tyom
	mDbsEn/XA2PoOluF8F/F/aeJUYhf01KDPgbkwW0aak+JWw/hCNr80SvFhuo/Q44JnQsNyehFMYnah
	5aPHJxCPl5A/R3DdqzWcdtOnFyE8j868BIwWzi3U6bfdAAHjWeqZDaAyHIVLxHm0YH4l4VxipktAZ
	ccJPQyvleA7aKLLWTCFx/JF4llKixTt78Mpc8nodJ9T6NiqLsuv/xkFfXNZpUPzI2F4vNdl/DI7H6
	e+sByxew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9nVj-0000000BoiX-28L5;
	Thu, 24 Sep 2026 17:45:32 +0000
Received: from mail-oa2-x26.google.com ([2607:f8b0:4864:30::26])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9nV6-0000000BoPw-2SXP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 17:44:53 +0000
Received: by mail-oa2-x26.google.com with SMTP id 586e51a60fabf-466cc88a9b9so110496fac.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 10:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790271891; x=1790876691; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NxlMLeY3xGhSrBi9Qa91jcGZfKU8ZnUsiaHuYqFMG9Y=;
        b=mrb80hswjbeycZqKZ6uW4MVdYIJ0qLcDNRn3513F9rGT3j66lntWR5+idSYN7qArl4
         MuqyMni0vIgrNct/46X2j0xfsCDYLbzqOmtjeIZeW2MeQgqya4+rlFowbLyIvCNUNbh9
         xNE1ufLLCIHW6U8HuqnI3PxQfqVz/Ow4EzOZQpufcaa8tFN+mrIguBk+OOLSeCiKPrkj
         9bHnTelYxazO+g1JtQt9fcIfM2mUhSZw4i5XlyxgOlzBHd68S6cFVk6TnneX/sQ5Nh+c
         BJpwazHHCIq0577/WCODPmFUNLZTa57/aWMTcskh7KvZs7egq42DuTj3+nKUPoBu9zb+
         GLBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790271891; x=1790876691;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NxlMLeY3xGhSrBi9Qa91jcGZfKU8ZnUsiaHuYqFMG9Y=;
        b=MlVBzkksdjR7lMmVs8LGv2DihKgZ+eByuzFnaqc3HwXWg6BPMF3+FBvSqTxF86d/3p
         ILZdvm1SH5YncRbZZfUNn1fGmAwGBfCawdasLZvqjqNCfAxA73UdtVdmEcgfhpIkdTW0
         V/qTh4Ol6Tk6S5FCpXZxy6vixS8re23GdLxF/3Br8kNN+83b5cd6PTK7LhmGiB/mav3p
         +jBr7I37QtBNN0/2ax+aNC29ZLkeKYAmUaYLXCzWL17x2QVQiwiEo3UsYwduQlV1A+1r
         iEMAmjEPSOkaPwfVPASRP6Dt+9O16IVPVGY+DJ3TlqRKwPbR/26L7UDaG1++K8u9MN8S
         CgoQ==
X-Forwarded-Encrypted: i=1; AKwUvBymPeuRB9/oVnUl86dSbm+w9IHzJasBtZ5lYAk3VqqYir9kMSe3cXS9t7gEwOyh9euNY3hamcVM8P4ASGGwdUp+@lists.infradead.org
X-Gm-Message-State: AFuF++nO1f4XrG57VATOPqqm/+njG68RSTGpmtr+pxB2R8EXbtRxOUVn
	SnvxE0PcFA6WiiDT3tXHUjTjmte0Si7RbdDgP5Lqr/OTaHYxr1m22pbX
X-Gm-Gg: AYBFou18Vv4TbFApsdjqAZAvhnNCDjE7/Jjc37weqs5FqovHfyzdfFyhwcF2zGnYxq1
	sq3hDjAXxJ5BcKC/teAFGlzeQeKTec1Znwg8eI0FeD3xfmZYLU1oIDNtB9yln80KuEKCG4adz7b
	EpzebVMSgj4UiKNWkAQQ/ZehHZHyj/v01Vs/IVt3UVwiuuiiK9Lu1tFTQKINfV9aBqtY0Ar3/5f
	qkzD15LaUqihoMjj/wNPjsnOM1yzjvEK5ZeuNkSw6KJ823sM9UKC/VtfDT0f0TvIKYPMSPatCzO
	03o4X9VS96x+exo6cTF97PTfU+Idy8yyu0rsB61rKMpyKGcdQlqSLjwc430WFZh1dLIeWq5miDD
	sxlC1hlttAqXpMREKSbb3qLpcA0SKJp9PuFSliJ6NuaQIahDMeaed+h+kBdHiaL1id3huULCTM4
	0wP1NZi2kXZa9G9gmXiOygDNOS0dc6IqszEzreoI83wETQRv6Hw01jUwf0NdTp69FgCtfaEKJgy
	MCeuubS9KAPuYnGfBC2NtBzu/D0mWWVWkfYv6KWkifR5FjPzxI+leTOxqx6npN798jKCPKp2G2r
	UM5TDKgxGaFSY+HVgOt98zHxT/L9xbVpCwxdZAOwnDv8q+QvphuiSWSLOFvm1QQLrQCBQSbMCv7
	+GEltV+x3ttaKM5eldi3OeA==
X-Received: by 2002:a05:6870:888c:b0:48f:e0f6:c033 with SMTP id 586e51a60fabf-491e753aef1mr3023509fac.49.1790271891303;
        Thu, 24 Sep 2026 10:44:51 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-491e8f8d14asm3027802fac.0.2026.09.24.10.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 10:44:50 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 24 Sep 2026 11:44:39 -0600
Subject: [PATCH net v3 09/10] net: stmmac: retain PHY and PM ownership
 during ethtool reopening
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-submit-stmmac-reset-fixes-v1-v3-9-c031e3f3a282@gmail.com>
References: <20260924-submit-stmmac-reset-fixes-v1-v3-0-c031e3f3a282@gmail.com>
In-Reply-To: <20260924-submit-stmmac-reset-fixes-v1-v3-0-c031e3f3a282@gmail.com>
To: Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Joakim Zhang <qiangqing.zhang@nxp.com>, 
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Christian Marangi <ansuelsmth@gmail.com>, 
 Tiezhu Yang <yangtiezhu@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Jesper Dangaard Brouer <hawk@kernel.org>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Stanislav Fomichev <sdf@fomichev.me>, Serge Semin <fancer.lancer@gmail.com>, 
 Suraj Jaiswal <quic_jsuraj@quicinc.com>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Joao Pinto <Joao.Pinto@synopsys.com>, 
 Vladimir Oltean <vladimir.oltean@nxp.com>, 
 Ong Boon Leong <boon.leong.ong@intel.com>, 
 Voon Weifeng <weifeng.voon@intel.com>, 
 "Song, Yoong Siang" <yoong.siang.song@intel.com>
Cc: Richard Genoud <richard.genoud@bootlin.com>, 
 Alastair D'Silva <alastair@d-silva.org>, Maxime Ripard <mripard@kernel.org>, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org, 
 ZhaoJinming <zhaojinming@uniontech.com>, 
 Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>, 
 Ding Hui <dinghui1111@163.com>, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_104452_649482_5750F066 
X-CRM114-Status: GOOD (  18.51  )
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

Changing ring sizes or channel counts calls the complete ndo_stop/open
pair while the interface remains administratively up. If reopening fails,
the PHY attachment and runtime-PM reference have already been dropped, but
the next ordinary close drops them again. The device also remains present,
allowing an MTU change to quiesce NAPI which is already disabled.

Detach the device and release only the datapath during these live changes.
Use a common reopen helper which retains the PHY attachment and runtime-PM
reference and reattaches only on success. Restore the previous ring sizes
or channel topology after failure so a subsequent down/up retries the old
configuration. Leave the failed device detached and reject further live
ethtool reconfiguration until administrative recovery.

No additional outer-lifetime flag is needed: PHY and PM ownership continue
to follow the successful ndo_open/ndo_stop pair instead of being changed
by live datapath reconfiguration.

Fixes: aa042f60e496 ("net: stmmac: Add support to Ethtool get/set ring parameters")
Fixes: 0366f7e06a6b ("net: stmmac: add ethtool support for get/set channels")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 76 ++++++++++++++++++++---
 1 file changed, 68 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index d56b7f911db0..d17c68f55caf 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4361,6 +4361,8 @@ static void __stmmac_release(struct net_device *dev)
 
 	/* Stop TX/RX DMA after draining IRQ handlers which can restart it. */
 	stmmac_stop_all_dma(priv);
+	/* Link resolution need not have reached mac_link_up() yet. */
+	stmmac_mac_set(priv, priv->ioaddr, false);
 
 	/* Release and free the Rx/Tx resources */
 	free_dma_desc_resources(priv, priv->dma_conf);
@@ -7658,13 +7660,37 @@ static void stmmac_napi_del(struct net_device *dev)
 	}
 }
 
-int stmmac_reinit_queues(struct net_device *dev, u8 rx_cnt, u8 tx_cnt)
+/* Rebuild only the datapath. The administratively-up device still owns its
+ * PHY attachment and runtime-PM reference, even if this reopen fails.
+ */
+static int stmmac_reopen(struct net_device *dev)
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
-	int ret = 0, i;
+	struct stmmac_dma_conf *old_conf = priv->dma_conf;
+	struct stmmac_dma_conf *dma_conf;
+	int ret;
 
-	if (netif_running(dev))
-		stmmac_release(dev);
+	dma_conf = stmmac_setup_dma_desc(priv, dev->mtu);
+	if (IS_ERR(dma_conf))
+		return PTR_ERR(dma_conf);
+
+	ret = __stmmac_open(dev, dma_conf);
+	if (ret) {
+		priv->dma_conf = old_conf;
+		free_dma_desc_resources(priv, dma_conf);
+		kfree(dma_conf);
+		return ret;
+	}
+
+	kfree(old_conf);
+	netif_device_attach(dev);
+	return 0;
+}
+
+static void stmmac_set_queues(struct net_device *dev, u8 rx_cnt, u8 tx_cnt)
+{
+	struct stmmac_priv *priv = netdev_priv(dev);
+	int i;
 
 	stmmac_napi_del(dev);
 
@@ -7676,9 +7702,31 @@ int stmmac_reinit_queues(struct net_device *dev, u8 rx_cnt, u8 tx_cnt)
 									rx_cnt);
 
 	stmmac_napi_add(dev);
+}
+
+int stmmac_reinit_queues(struct net_device *dev, u8 rx_cnt, u8 tx_cnt)
+{
+	struct stmmac_priv *priv = netdev_priv(dev);
+	u8 old_rx = priv->plat->rx_queues_to_use;
+	u8 old_tx = priv->plat->tx_queues_to_use;
+	int ret = 0;
+
+	if (netif_running(dev)) {
+		if (!netif_device_present(dev))
+			return -ENETDOWN;
+		netif_device_detach(dev);
+		__stmmac_release(dev);
+	}
+
+	stmmac_set_queues(dev, rx_cnt, tx_cnt);
 
 	if (netif_running(dev))
-		ret = stmmac_open(dev);
+		ret = stmmac_reopen(dev);
+	if (ret) {
+		stmmac_set_queues(dev, old_rx, old_tx);
+		netdev_err(dev, "failed reopening after channel change: %pe; interface remains detached\n",
+			   ERR_PTR(ret));
+	}
 
 	return ret;
 }
@@ -7686,16 +7734,28 @@ int stmmac_reinit_queues(struct net_device *dev, u8 rx_cnt, u8 tx_cnt)
 int stmmac_reinit_ringparam(struct net_device *dev, u32 rx_size, u32 tx_size)
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
+	u32 old_rx = priv->dma_conf->dma_rx_size;
+	u32 old_tx = priv->dma_conf->dma_tx_size;
 	int ret = 0;
 
-	if (netif_running(dev))
-		stmmac_release(dev);
+	if (netif_running(dev)) {
+		if (!netif_device_present(dev))
+			return -ENETDOWN;
+		netif_device_detach(dev);
+		__stmmac_release(dev);
+	}
 
 	priv->dma_conf->dma_rx_size = rx_size;
 	priv->dma_conf->dma_tx_size = tx_size;
 
 	if (netif_running(dev))
-		ret = stmmac_open(dev);
+		ret = stmmac_reopen(dev);
+	if (ret) {
+		priv->dma_conf->dma_rx_size = old_rx;
+		priv->dma_conf->dma_tx_size = old_tx;
+		netdev_err(dev, "failed reopening after ring change: %pe; interface remains detached\n",
+			   ERR_PTR(ret));
+	}
 
 	return ret;
 }

-- 
2.53.0


