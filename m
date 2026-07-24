Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDEB2C531FC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 22:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NMNOc/In+fWMgaFH9Omi735YDJBG/gXGBfILoP1ztBQ=; b=DVbuiF60IKeBbR5jENPzs+NCDL
	bybgiF2v99U14GLXLrkpWT55fBp133NWMA2Jze7VBrEoxwN2V6MVm8J9bHsKLDHxfyDfuB5a8zAEn
	DDKK55M3casBdvhg2YIxPP7nntvXOU/IAuQQpm4+RJ39+myr81z95vdpjq8AHyVVt679kdj5w1jWk
	wNAvO8UxzEB14NWYNoxb+psYCZFyDKZeERuf6JHp64vCz5/HrIyp+ysXXkse7rKoDHe6b+x6g+eGJ
	Lmo7r8y6c4OSkFmPiLAK2U5LRRd+sdD12GETWJKp3iHT9R4IdfxnvP7g6gfrw9Ts+4GH0b+ND4ja7
	g2qt2G/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnOf1-0000000HKUt-2toR;
	Fri, 24 Jul 2026 22:46:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnOeZ-0000000HKDb-06gD;
	Fri, 24 Jul 2026 22:46:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7E1D5438AA;
	Fri, 24 Jul 2026 22:46:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B35881F00A3A;
	Fri, 24 Jul 2026 22:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784933162;
	bh=NMNOc/In+fWMgaFH9Omi735YDJBG/gXGBfILoP1ztBQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bX9Zr4D/LezvZIgMRUL1/Y6JZMzid0uz4HB42PhG9lZ+PJcEN99y4/pWQYi1vYEGG
	 7m5MkBADwk+RPybApZ8J2wjXuNVd1nDRkdybcPI8tchX21wCu1VuExWAULiBRosMC7
	 1dcMWc7XyYLftbkZw/D9sTa07UbX7rQR9hD0AVOyVcB2CNbdYw4DQsFF80yeqS8ZTY
	 WhS3qzoX2on/sRmaOR/TO8jot7UJPz1fmqtxzvWbRYPcPnKCAHzFgrJ9e99DQmS7BU
	 +0HCuf4xYtLNSlfZLry2sHbBTZcWk0h64W5cOSNw4jpzRn1IUFBJO51R0wSrUGpcHs
	 bVg7A6UxVK9og==
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
Subject: Re: [PATCH net-next v13 06/10] net: stmmac: qcom-ethqos: update phy_mode to the resolved interface in mac_finish()
Date: Fri, 24 Jul 2026 15:45:59 -0700
Message-ID: <20260724224559.1649383-1-kuba@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260713-qcom-sa8255p-emac-v13-6-119f8699ef8e@oss.qualcomm.com>
References: <20260713-qcom-sa8255p-emac-v13-6-119f8699ef8e@oss.qualcomm.com>
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

This patch updates ethqos->phy_mode from the interface argument in
ethqos_mac_finish_serdes() so that it always reflects the last resolved
interface, avoiding a stale value being observed by later
serdes_powerup()/serdes_powerdown() calls when the runtime interface
differs from the DT phy-mode.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index 47b70b5e706f..9d19203ae4bd 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -632,6 +632,12 @@ static int ethqos_mac_finish_serdes(struct net_device *ndev, void *priv,
>  	struct qcom_ethqos *ethqos = priv;
>  	int ret = 0;
>  
> +	/* The interface mode is only known once phylink has resolved it and
> +	 * may change at runtime, so keep it in sync for later
> +	 * serdes_powerup()/serdes_powerdown() calls.
> +	 */
> +	ethqos->phy_mode = interface;
> +
>  	qcom_ethqos_set_sgmii_loopback(ethqos, false);

[High]
Is the ordering here safe with respect to qcom_ethqos_set_sgmii_loopback()?

That helper early-returns unless ethqos->phy_mode equals
PHY_INTERFACE_MODE_2500BASEX:

    static void
    qcom_ethqos_set_sgmii_loopback(struct qcom_ethqos *ethqos, bool enable)
    {
            if (!ethqos->needs_sgmii_loopback ||
                ethqos->phy_mode != PHY_INTERFACE_MODE_2500BASEX)
                    return;
            ...
    }

Because ethqos->phy_mode is now overwritten with the freshly resolved
interface before the qcom_ethqos_set_sgmii_loopback(ethqos, false) call,
does that clear-side path still fire when the interface transitions away
from 2500BASE-X?

Consider a needs_sgmii_loopback platform (for example sa8775p) with a DT
phy-mode of 2500BASE-X. At probe time ethqos_clks_config(true) asserts
SGMII_PHY_CNTRL1_SGMII_TX_TO_RX_LOOPBACK_EN in the wrapper while
ethqos->phy_mode is still the DT value 2500BASE-X. If phylink later
resolves the interface to SGMII and calls ethqos_mac_finish_serdes():

    ethqos->phy_mode = interface;                   /* now SGMII */
    qcom_ethqos_set_sgmii_loopback(ethqos, false);  /* early-return */

Does the port then enter SGMII operation with the wrapper TX-to-RX
loopback bit still asserted, which is the exact 2500BASE-X to SGMII
runtime-transition scenario the commit message says it wants to make
work?

Would calling qcom_ethqos_set_sgmii_loopback(ethqos, false) first,
against the old phy_mode, and only then assigning
ethqos->phy_mode = interface avoid this?

The commit message describes the change only in terms of
serdes_powerup()/serdes_powerdown():

    ethqos->phy_mode is read by serdes_powerup() and
    qcom_ethqos_set_sgmii_loopback() to configure the SerDes and its
    wrapper for the correct interface.
    ...
    Update ethqos->phy_mode from the interface argument in
    ethqos_mac_finish_serdes() so that it always reflects the last
    resolved interface.

Should it also mention that the assignment changes what the immediately
following qcom_ethqos_set_sgmii_loopback(ethqos, false) observes?

For reference, this appears to be addressed later in the same series by
commit 8d1efdf990fc ("net: stmmac: qcom-ethqos: fix SGMII loopback not
set on resume after speed change"), which extends the guard in
qcom_ethqos_set_sgmii_loopback() to also match PHY_INTERFACE_MODE_SGMII.
That follow-up commit message frames the fix as a set-side DMA-reset
timeout on resume, but does the same guard change also happen to unbreak
the clear-side path introduced here? If so, would it be worth either
reordering the two statements in this patch or folding the guard update
in ahead of this one to avoid a bisect window where the SGMII wrapper
loopback stays asserted after a 2500BASE-X to SGMII transition?

>  
>  	if (interface == PHY_INTERFACE_MODE_SGMII ||

[ ... ]

