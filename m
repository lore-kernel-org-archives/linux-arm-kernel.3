Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88B95C88E77
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 23:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q2ZuQyJS79512rpBqQ9SQPYF74Va4OuO9/ElLmEy/yE=; b=PtIXda3C6Y4IoRXY/YT2rwGPga
	wrMNDVD7PUjGVrREyG9tMihLvAlGXLVdniMYY6a/YuNKv390P6wEj+a/BsvS1XuO/qf+1yZ97l4fQ
	s2PZTHEuHveO8pH4oOPDqdxKzMlj5Mh/jNnFFXtXVPw6eqiAOlI5jfHDVIRmk+bBYc1ag0U7UkUX+
	ayU0y+VoPzgJ3jh9ILM1gdacu0DmkphAevzmTAkHKWbWi8pjiIo3WQAPZi16znxt0DnnOj1wQtkcr
	02sRo+JBUH8HNno0PQg0CBt3sMq5L3kV/6gambafUsV52I/BztfGDCKoDkAqSasPrdyjnLv6rIjey
	l6OJDzYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6FuS-00000004qFJ-0EZP;
	Mon, 14 Sep 2026 23:16:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6FuH-00000004q5w-2s0t;
	Mon, 14 Sep 2026 23:16:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6BF7743F58;
	Mon, 14 Sep 2026 23:16:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA0C71F00893;
	Mon, 14 Sep 2026 23:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789427773;
	bh=Q2ZuQyJS79512rpBqQ9SQPYF74Va4OuO9/ElLmEy/yE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=IjjLwbvW6rSC5hKrhAdj9iumDgpEjVMROymLUr1lzIetsJj9+taPMyXnGD5TqIpwn
	 dMbyEZp56zqryLlKoHGbvxEKG8WTMOTIiS4Nfh6QgRPWiyrJ+eP9lQe4uXamM/BuBZ
	 m533BGE++thniLVOlWzrt5Rvv0xjT9ul0fKPMj1Ktq7Hg9IDzGFCKRtYpDIijqXvo3
	 CH12XFwss2d+UvHzKmHwE3vJO52jpFYLSH2bTjUnfrhlPOSL8VzHXYpyUlaYV0Atgu
	 hvqsGXR3CfTIqUaoFv9mLCmfWuAbV60PxFhLTWhaqmzDwJMn7kT+wk6KaPL5H5bXCk
	 2PVb0FNFLg+tA==
From: Jakub Kicinski <kuba@kernel.org>
To: bartosz.golaszewski@oss.qualcomm.com
Cc: Jakub Kicinski <kuba@kernel.org>,
	andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	vkoul@kernel.org,
	peppe.cavallaro@st.com,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	neil.armstrong@linaro.org,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	shawnguo@kernel.org,
	festevam@gmail.com,
	jan.petrous@oss.nxp.com,
	s32@nxp.com,
	mohd.anwar@oss.qualcomm.com,
	romain.gantois@bootlin.com,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mripard@kernel.org,
	christophe.roullier@foss.st.com,
	brgl@kernel.org,
	radu@rendec.net,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	dfustini@tenstorrent.com,
	linux-sunxi@lists.linux.dev,
	linux-amlogic@lists.infradead.org,
	linux-mips@vger.kernel.org,
	imx@lists.linux.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	bartosz.golaszewski@linaro.org
Subject: Re: [PATCH net-next v14 06/10] net: stmmac: qcom-ethqos: update phy_mode to the resolved interface in mac_finish()
Date: Mon, 14 Sep 2026 16:16:09 -0700
Message-ID: <20260914231609.704288-1-kuba@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260908-qcom-sa8255p-emac-v14-6-ec212b747a7d@oss.qualcomm.com>
References: <20260908-qcom-sa8255p-emac-v14-6-ec212b747a7d@oss.qualcomm.com>
MIME-Version: 1.0
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

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
---
net: stmmac: qcom-ethqos: update phy_mode to the resolved interface in mac_finish()

This makes ethqos_mac_finish_serdes() store the interface that phylink
resolved into ethqos->phy_mode, so that a later serdes_powerup() call
programs the SerDes for the interface currently in use rather than the one
read from the DT phy-mode property at probe.

A few questions below.

[Severity: Low]
The commit message says:

  "The next serdes_powerup() call, on a subsequent link cycle, then
  reinitialises the SerDes to the wrong mode."

That describes a concrete hardware failure, but there is no Fixes: tag and
no mention of affected platforms or kernels.

Looking at the baseline, qcom_ethqos_serdes_powerup() does not read
ethqos->phy_mode at all:

  static int qcom_ethqos_serdes_powerup(struct net_device *ndev, void *priv)
  {
        struct qcom_ethqos *ethqos = priv;
        int ret;

        ret = phy_init(ethqos->serdes_phy);
        if (ret)
                return ret;

        ret = phy_power_on(ethqos->serdes_phy);
  ...

The phy_set_mode_ext(..., ethqos->phy_mode) call that consumes the stale
value is added by the preceding patch in this series, "net: stmmac:
qcom-ethqos: set serdes mode before powerup" (7bf7d5daca55). So the
condition being repaired here does not exist upstream, and a Fixes: tag
would have to point at an unmerged in-series commit.

Would it make more sense to fold this hunk into that patch, or reorder the
two, and reword the message so it does not read as a fix for a shipping
regression? As posted it is hard for a backporter to tell whether this is a
stable candidate or preparation work.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index 47b70b5e706f2..fd7414a50eb4e 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -634,6 +634,12 @@ static int ethqos_mac_finish_serdes(struct net_device *ndev, void *priv,
>  
>  	qcom_ethqos_set_sgmii_loopback(ethqos, false);
>  
> +	/* The interface mode is only known once phylink has resolved it and
> +	 * may change at runtime, so keep it in sync for later
> +	 * serdes_powerup()/serdes_powerdown() calls.
> +	 */

[Severity: Low]
This isn't a bug, but does qcom_ethqos_serdes_powerdown() really depend on
this field?

  static void qcom_ethqos_serdes_powerdown(struct net_device *ndev, void *priv)
  {
        struct qcom_ethqos *ethqos = priv;

        phy_power_off(ethqos->serdes_phy);
        phy_exit(ethqos->serdes_phy);
  }

It takes no interface argument and never reads ethqos->phy_mode. The two
readers of the field are qcom_ethqos_serdes_powerup() and
qcom_ethqos_set_sgmii_loopback(); the latter is the one whose behaviour
this assignment changes, and it is not mentioned in the comment.

> +	ethqos->phy_mode = interface;

[Severity: High]
Can this break qcom_ethqos_set_sgmii_loopback() on sa8775p?

That helper gates on phy_mode being exactly the DT interface:

  static void
  qcom_ethqos_set_sgmii_loopback(struct qcom_ethqos *ethqos, bool enable)
  {
        if (!ethqos->needs_sgmii_loopback ||
            ethqos->phy_mode != PHY_INTERFACE_MODE_2500BASEX)
                return;
  ...

and it is called from ethqos_clks_config() with the clocks just enabled:

  ethqos_clks_config()
        /* Enable functional clock to prevent DMA reset to timeout due
         * to lacking PHY clock after the hardware block has been power
         * cycled. ...
         */
        qcom_ethqos_set_sgmii_loopback(ethqos, true);
        ethqos_set_func_clk_en(ethqos);

ethqos_clks_config() runs at probe and again on every resume through
stmmac_bus_clks_config() -> plat_dat->clks_config(), i.e. before phylink
has resolved anything for the new session, so it reads whatever the
previous session left behind.

emac_v4_0_0_data sets .needs_sgmii_loopback = true, so on a 2500base-x
board that last linked at 1G SGMII:

  ethqos_mac_finish_serdes()  -> ethqos->phy_mode = PHY_INTERFACE_MODE_SGMII
  suspend / ifdown
  resume -> ethqos_clks_config(true)
         -> qcom_ethqos_set_sgmii_loopback(ethqos, true)   /* returns early */
         -> DMA soft reset with no RX clock

Does dwmac4_dma_reset() then time out and fail open()/resume?

The next patch in this series, "net: stmmac: qcom-ethqos: fix SGMII
loopback not set on resume after speed change", describes the same symptom
("any subsequent resume with a 1G SGMII link skips the loopback setup and
the DMA reset hangs") and widens the guard to also accept SGMII. Could the
guard change be squashed into this patch, or this patch ordered after it,
so that a bisect landing here does not hang resume?

Separately, even with the widened guard the workaround is keyed on
{2500BASEX, SGMII} only, while phylink hands mac_finish() whatever the PHY
reported:

  drivers/net/phy/phylink.c:phylink_resolve()
        ...
        link_state.interface = pl->phy_state.interface;

Would keeping the DT interface in its own field for the wrapper workaround,
and using the resolved interface only for the SerDes mode, avoid coupling
the two?

>  	if (interface == PHY_INTERFACE_MODE_SGMII ||
>  	    interface == PHY_INTERFACE_MODE_2500BASEX)
>  		ret = phy_set_mode_ext(ethqos->serdes_phy, PHY_MODE_ETHERNET,

[ ... ]

