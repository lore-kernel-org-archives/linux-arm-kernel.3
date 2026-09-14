Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1E2FC88E77
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 23:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tIIjh/Uf6BNc6qFW23Fkd03LNzbGrXqGSgv6kpFBBBk=; b=Q/8duROjGNC5D73RYvMPu9RYLk
	PScXyZ8UD47TP17fsagNrkHM4Vr7UPzRtx7LuceckpCRX+1eY6VzaHbXjtbAXCNqIk3gJ4janH6ao
	7SFfnn5U7nd/MkIk9eY0OX83aiHERrcHKYgLwsMP7y35k/U0rXs3OVOTlfAlYAxDN3SgU0T4KX4K+
	9JJWgY0srQm9GzIYn4YKnbkz6go41WicaClm7iA/E3pslgE7dHjeZHEEKrWbCyuH3OP9AzdxXBE+4
	EZIHw9rq+oqyKx+rt8I/yJbztKpKS87XhdpzRj2AVa0O14C27uwBVQ6v8ocA1PZ3MTbKKt/n6l6MJ
	M3gp+A3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Fuf-00000004qTM-2tOW;
	Mon, 14 Sep 2026 23:16:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6FuL-00000004q9c-0Ulu;
	Mon, 14 Sep 2026 23:16:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D4F6942A28;
	Mon, 14 Sep 2026 23:16:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 586901F000FF;
	Mon, 14 Sep 2026 23:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789427776;
	bh=tIIjh/Uf6BNc6qFW23Fkd03LNzbGrXqGSgv6kpFBBBk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Z0MKwixYFejC9aXB2ou9gDyVgw+IXUfla6yha+G1h+pdjyd9O2GMLR6rfbmVCIqRh
	 qnCgaS96Y5zdrUGXyZHeCOvJUyELkRb+9fGwuS5j2u7zwvM0KNnIOldogKIDh75OXI
	 UU1X49g4kycw28XdTtqVEurHf9Wwkc//rViLO6ZtoDml0qlU8ptCINWW4hrt54jJG2
	 hAPr0WuTs5yk74shR3GBcrH+k1Xa8WmdEfWKZAyL5keV+wX4e0ljXisLoEP1cRbpgh
	 4LO1uDw+LaWAO/9Fcz1VWy59hEVIdQMtiu7jS8LG28h+tTb8lnAcVAxnFEOPTpkgHm
	 sgjmnSADR5CMg==
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
Subject: Re: [PATCH net-next v14 07/10] net: stmmac: qcom-ethqos: fix SGMII loopback not set on resume after speed change
Date: Mon, 14 Sep 2026 16:16:13 -0700
Message-ID: <20260914231614.704318-1-kuba@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260908-qcom-sa8255p-emac-v14-7-ec212b747a7d@oss.qualcomm.com>
References: <20260908-qcom-sa8255p-emac-v14-7-ec212b747a7d@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
net: stmmac: qcom-ethqos: fix SGMII loopback not set on resume after speed change

This extends the guard in qcom_ethqos_set_sgmii_loopback() so that the MAC
wrapper TX-to-RX loopback is also armed when ethqos->phy_mode holds
PHY_INTERFACE_MODE_SGMII, not only PHY_INTERFACE_MODE_2500BASEX. Without
the loopback, dwmac4_dma_reset() polls an RX clock that never toggles and
times out.

No Link: tags were present in the commit header.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index fd7414a50eb4e..e067ceee01621 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -190,7 +190,8 @@ static void
>  qcom_ethqos_set_sgmii_loopback(struct qcom_ethqos *ethqos, bool enable)
>  {
>  	if (!ethqos->needs_sgmii_loopback ||
> -	    ethqos->phy_mode != PHY_INTERFACE_MODE_2500BASEX)
> +	    (ethqos->phy_mode != PHY_INTERFACE_MODE_2500BASEX &&
> +	     ethqos->phy_mode != PHY_INTERFACE_MODE_SGMII))
>  		return;

[Severity: Medium]
Should this hunk be squashed into the preceding patch of the series, or at
least carry a Fixes: tag naming it?

The commit message says "mac_finish() now updates phy_mode to the
runtime-resolved interface", which is the change made one patch earlier in
this same series:

  f40e72d57bcb38 ("net: stmmac: qcom-ethqos: update phy_mode to the
  resolved interface in mac_finish()")

git blame at this commit shows the assignment in ethqos_mac_finish_serdes():

	ethqos->phy_mode = interface;

came from f40e72d57bcb38. Before that, ethqos->phy_mode was written only
once, in qcom_ethqos_probe() from the DT phy-mode property, so the
2500BASEX-only guard could not go stale at runtime and the DMA reset
timeout described here did not exist.

Does that leave f40e72d57bcb38 broken on its own, e.g. as a bisect point or
a stable backport? On a needs_sgmii_loopback platform (emac_v4_0_0_data)
with DT phy-mode "2500base-x" whose link resolves to 1G SGMII:

  ethqos_mac_finish_serdes()      -> ethqos->phy_mode = PHY_INTERFACE_MODE_SGMII
  suspend / ifdown
  resume / ifup
  ethqos_clks_config(ethqos, true)
    qcom_ethqos_set_sgmii_loopback(ethqos, true)
      if (... ethqos->phy_mode != PHY_INTERFACE_MODE_2500BASEX)
              return;                 /* loopback never enabled */
  dwmac4_dma_reset()                  /* polls a non-toggling clock, times out */

Also, the subject line reads as a standalone fix for a pre-existing
problem, which hides the dependency on the previous patch. Would either
squashing the guard change into f40e72d57bcb38, or adding

  Fixes: f40e72d57bcb38 ("net: stmmac: qcom-ethqos: update phy_mode to the resolved interface in mac_finish()")

make the ordering requirement explicit?

One more note on the commit message wording: the second paragraph reads
"qcom_ethqos_set_sgmii_loopback() gates this on phy_mode being 2500BASEX.
mac_finish() now updates phy_mode to the runtime-resolved interface, any
subsequent resume with a 1G SGMII link skips the loopback setup" — the
sentence joining is missing a connector such as "so that" or "and since",
which makes the causal relationship hard to follow.

