Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23D6DC98321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 17:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VrMqc8Q1NW4R8bM+PWgpFGuXOWv8RLSIAwP5mrNvnTc=; b=3P7smqeArEdjMqgz9QK8P97D69
	2doISl/eduQUtcuRksXFcGlGfEzCQTCsPTO5hfwEVF2/ZCUUHJS2rM5s0L3FVUJN6ALx5RnyXtGWE
	bejao72/Jf9Vntg42ulL63OXiGL2tiQNcGL57yucMN5nLvuclWOZ2Ft/tYa4Y1zWWi+MHLa4CeGvF
	bHrhR2c2IPg88tLbtM17XLFCvuxC08TNGPgXeQqy7TkwLE9fXLwGyXSofOFgxOkD2jk/kx804moep
	pLTDwy6GVjc7feAynBDIV8e7czW2fHjS4HU3y1iGEMySFBCsPwj4IyrEZKxSkBHxrc9jGgL/xVwgr
	ADtd4NeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9nVj-0000000Bohx-0ylg;
	Thu, 24 Sep 2026 17:45:31 +0000
Received: from mail-oa2-x0f.google.com ([2607:f8b0:4864:30::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9nV2-0000000BoMO-3GyX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 17:44:51 +0000
Received: by mail-oa2-x0f.google.com with SMTP id 586e51a60fabf-4906fabf6deso130240fac.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 10:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790271887; x=1790876687; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VrMqc8Q1NW4R8bM+PWgpFGuXOWv8RLSIAwP5mrNvnTc=;
        b=qEXoVDdR6tKULW/3nxlS2w3gEZlwl8+ouaduEGS6dMhdWiqvr4iyO0MGzJjReeoSMk
         AG96Rs0feKxUMHiEAmMd+dUqGbStgkYIXaOarVFEd41vRQ6MGP8yBXtrO9rSGs8gt1Ev
         lLj+3+HckMGoP23G8JZjc2OpON5BuDZ39zPccKmZoFZh64pTdpUIez3E9iiSphzr47JF
         +S+QwPs271+GpmhaGxzPWQZSgOa6ZVpoDV3mCxD9HGroURx2RfdjVD45FD8cp9SxPNA8
         bp7CQLveqsgmlViY5deI2FABInuOLpzl2CxmZDav5mcZWVzfIyi8OJtE/zA9tYdxhYVu
         /hcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790271887; x=1790876687;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VrMqc8Q1NW4R8bM+PWgpFGuXOWv8RLSIAwP5mrNvnTc=;
        b=VE2yJnxxaemxQylVpZr9QxHhA22blk7EvE2n+/hLJzYGjuOtWiO7StlxFzQvOuXGFW
         QOKjD/bEpGzFAyxjNaXchtJpYIM+sjwWeuEcjSgtiMU1wBD112m7W+SwmXD5ghWdSLJo
         W19rha0G3GbzxOsu2ZwschcN3PRTSU3vImak0yC+hxRRiRoQobn51Yv600ZxytLK2v7W
         KLdqriI/6ID05etR4FnuUv9uWN5afvwq6/gTq45XZBNgJkUKE8gfcI2K8LN4ySQ4/yak
         nJwZhZaY2W4/VqFjddgEYXtazSnUgXZHnFuKbI/SJhFNSOyFOdnB8WSwY2cFkvdGel9t
         pj9w==
X-Forwarded-Encrypted: i=1; AKwUvBwkhk1XWgdKCwHsWktjhes4V2jq9Dfwmfbh5iiM115t4wXuCPSgobcT33AvL3qM9tgfaHgp9jD/Fok1a9NDJP/Q@lists.infradead.org
X-Gm-Message-State: AFuF++n4NM4iRGwMkFJXiN6FbChjt8Hr4nhpwcabkhlZzdTD3asMoflk
	M3uS+uueUFyoPDSIWeNd75Rksz0BpzSFuez48uoYc63A3eHFrnqyBXBk
X-Gm-Gg: AYBFou3zMDUcrEy3E/qtX74t8600BYwdukMbARih0MPCp9DUcV/IpX0lD2NLd85qc2I
	4wRoKxzQrOcp1XNRqZ+i0loDij8lBpNJoBzzbhMKDQvR9x79DJMtjIMVb+Ss59aTqG2XeBUJ6eQ
	/sgWs2HYZLMBVFIpTxMuDy5mQ5o0H/YgDjnr4bXnwcNBHsrKxFaltYISIzDCYRs2HXDYuvrok1L
	6gxYZscugXtSG+bnkJ85OaPBb/JAJwVYyEvLhNVsolNQ7IaBxd6Klt3PGhHDED9cJDdqhC/iYBd
	vrsBvI9VrnbDKmtfL3OWJ58qt+sfjnkNy1dKRiKk6ZtYUmtsSg2Obels1C1HMADlNrqiEW1NXJl
	cWIN0F5RLN6BbSXwRk1fsREUuj5/XQZIVvGv6vQ+OBLYDdQ/N51WN8J6LePmkr/kWa+vf0+ptEI
	QuOaNdbqOtMD9eSaIfsmvbsQOWy0vOP/9OgZLCe+kGSJ9Fx/pwIfKb3ksr0e9C80FjHwNIeqo5W
	invblN33o8euSg3Bc6ViKRaisjg2NRIbf9E6nNyr8PZ52jaw+BLwb8Mq22nqut41SxFZ6XgRtIR
	Mpw9MNaquvNu4lGA0Y/Aul4wttX2OafBtGaNYxmaRg5n3qyPCecPp+KeDQ7+yTV6u/t90tXK5mK
	xzdj8L4V5fTK1uSNlqP5SIw==
X-Received: by 2002:a05:6870:d88f:b0:47c:f956:c7bd with SMTP id 586e51a60fabf-491e4e5f03emr3167632fac.3.1790271887477;
        Thu, 24 Sep 2026 10:44:47 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-491e8f8d14asm3027802fac.0.2026.09.24.10.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 10:44:47 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 24 Sep 2026 11:44:37 -0600
Subject: [PATCH net v3 07/10] net: stmmac: account for failed live XDP
 reopening
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-submit-stmmac-reset-fixes-v1-v3-7-c031e3f3a282@gmail.com>
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
X-CRM114-CacheID: sfid-20260924_104449_880371_380E5D1A 
X-CRM114-Status: GOOD (  21.12  )
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

The XDP-specific release/open pair bypasses the ordinary datapath
bookkeeping, and its caller ignores reopen errors. A failed allocation
therefore leaves the device marked running with NAPI disabled and rings
released. A later close disables NAPI again. An IRQ-request failure also
frees descriptors after starting DMA without first stopping it.

Detach and stop phylink while replacing the XDP datapath, update its
ownership state, and reattach only after successful reopening. Preserve
the existing PTP registration on success, but release it on failure so a
DOWN datapath has no residual PTP ownership. Drain transmitters and timer
producers after freeing IRQs which can restart TX queues, including on
the ordinary release path.

Keep the old program reference until the change has succeeded. On an
attach failure restore the old program and return the error, allowing the
core to release the proposed program. Program removal must still succeed
when the non-XDP datapath cannot restart: BPF link teardown cannot retain
the detached program. Leave the interface administratively up but detached
for an ordinary down/up recovery in either failure case.

Fixes: ac746c8520d9 ("net: stmmac: enhance XDP ZC driver level switching performance")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 47 +++++++++++++++--------
 drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.c  | 31 +++++++++++----
 2 files changed, 54 insertions(+), 24 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index ce598b575763..467f471874cf 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4314,12 +4314,10 @@ static int stmmac_open(struct net_device *dev)
 	return ret;
 }
 
-/* Quiesce NAPI and transmit queues without releasing their resources. */
-static void stmmac_quiesce(struct stmmac_priv *priv)
+static void stmmac_stop_tx_queues(struct stmmac_priv *priv)
 {
 	u8 chan;
 
-	stmmac_disable_all_queues(priv);
 	netif_tx_disable(priv->dev);
 
 	/* A poll function can still arm a timer after napi_complete_done().
@@ -4332,6 +4330,13 @@ static void stmmac_quiesce(struct stmmac_priv *priv)
 		hrtimer_cancel(&priv->dma_conf->tx_queue[chan].txtimer);
 }
 
+/* Quiesce NAPI and transmit queues without releasing their resources. */
+static void stmmac_quiesce(struct stmmac_priv *priv)
+{
+	stmmac_disable_all_queues(priv);
+	stmmac_stop_tx_queues(priv);
+}
+
 static void __stmmac_release(struct net_device *dev)
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
@@ -4350,6 +4355,9 @@ static void __stmmac_release(struct net_device *dev)
 	/* Free the IRQ lines */
 	stmmac_free_irq(dev, REQ_IRQ_ERR_ALL, 0);
 
+	/* TX error IRQs can restart a queue after the first quiescence. */
+	stmmac_stop_tx_queues(priv);
+
 	/* Stop TX/RX DMA after draining IRQ handlers which can restart it. */
 	stmmac_stop_all_dma(priv);
 
@@ -7244,19 +7252,15 @@ void stmmac_enable_tx_queue(struct stmmac_priv *priv, u32 queue)
 void stmmac_xdp_release(struct net_device *dev)
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
-	u8 chan;
-
-	/* Ensure tx function is not running */
-	netif_tx_disable(dev);
 
-	/* Disable NAPI process */
-	stmmac_disable_all_queues(priv);
-
-	for (chan = 0; chan < priv->plat->tx_queues_to_use; chan++)
-		hrtimer_cancel(&priv->dma_conf->tx_queue[chan].txtimer);
+	netif_device_detach(dev);
+	phylink_stop(priv->phylink);
+	stmmac_quiesce(priv);
+	priv->datapath = STMMAC_DATAPATH_DOWN;
 
 	/* Free the IRQ lines */
 	stmmac_free_irq(dev, REQ_IRQ_ERR_ALL, 0);
+	stmmac_stop_tx_queues(priv);
 
 	/* Stop TX/RX DMA channels */
 	stmmac_stop_all_dma(priv);
@@ -7271,7 +7275,13 @@ void stmmac_xdp_release(struct net_device *dev)
 	 * watchdogs during reset
 	 */
 	netif_trans_update(dev);
-	netif_carrier_off(dev);
+
+	if (stmmac_fpe_supported(priv))
+		ethtool_mmsv_stop(&priv->fpe_cfg.mmsv);
+
+	/* Keep PTP across the immediately following stmmac_xdp_open(). That
+	 * function releases it if reopening fails, before returning DOWN.
+	 */
 }
 
 int stmmac_xdp_open(struct net_device *dev)
@@ -7350,19 +7360,22 @@ int stmmac_xdp_open(struct net_device *dev)
 
 	/* Enable NAPI process*/
 	stmmac_enable_all_queues(priv);
-	netif_carrier_on(dev);
-	netif_tx_start_all_queues(dev);
 	stmmac_enable_all_dma_irq(priv);
+	priv->datapath = STMMAC_DATAPATH_RUNNING;
+	phylink_start(priv->phylink);
+	netif_device_attach(dev);
 
 	return 0;
 
 irq_error:
-	for (chan = 0; chan < priv->plat->tx_queues_to_use; chan++)
-		hrtimer_cancel(&priv->dma_conf->tx_queue[chan].txtimer);
+	stmmac_stop_tx_queues(priv);
+	stmmac_stop_all_dma(priv);
+	stmmac_mac_set(priv, priv->ioaddr, false);
 
 init_error:
 	free_dma_desc_resources(priv, priv->dma_conf);
 dma_desc_error:
+	stmmac_release_ptp(priv);
 	return ret;
 }
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.c
index 909219775507..7ecb7addd2ea 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.c
@@ -108,6 +108,7 @@ int stmmac_xdp_set_prog(struct stmmac_priv *priv, struct bpf_prog *prog,
 	struct bpf_prog *old_prog;
 	bool need_update;
 	bool if_running;
+	int ret;
 
 	if_running = priv->datapath == STMMAC_DATAPATH_RUNNING;
 
@@ -119,25 +120,41 @@ int stmmac_xdp_set_prog(struct stmmac_priv *priv, struct bpf_prog *prog,
 		return -EOPNOTSUPP;
 	}
 
-	if (!prog)
-		xdp_features_clear_redirect_target(dev);
-
 	need_update = !!priv->xdp_prog != !!prog;
 	if (if_running && need_update)
 		stmmac_xdp_release(dev);
 
 	old_prog = xchg(&priv->xdp_prog, prog);
-	if (old_prog)
-		bpf_prog_put(old_prog);
 
 	/* Disable RX SPH for XDP operation */
 	priv->sph_active = priv->sph_capable && !stmmac_xdp_is_enabled(priv);
 
-	if (if_running && need_update)
-		stmmac_xdp_open(dev);
+	if (if_running && need_update) {
+		ret = stmmac_xdp_open(dev);
+		if (ret) {
+			netdev_err(dev, "failed reopening after XDP change: %pe; interface remains detached\n",
+				   ERR_PTR(ret));
+			if (prog) {
+				/* The core retains the old program on error and drops
+				 * the reference it passed for the proposed program.
+				 */
+				xchg(&priv->xdp_prog, old_prog);
+				priv->sph_active = priv->sph_capable && !old_prog;
+				return ret;
+			}
+			/* Uninstalling a BPF link must release its program even
+			 * if the non-XDP datapath cannot be restarted.
+			 */
+		}
+	}
+
+	if (old_prog)
+		bpf_prog_put(old_prog);
 
 	if (prog)
 		xdp_features_set_redirect_target(dev, false);
+	else
+		xdp_features_clear_redirect_target(dev);
 
 	return 0;
 }

-- 
2.53.0


