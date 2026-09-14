Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B890C982C2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 23:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7A8bsZwZtUn262lTk7IyubDp7W1YXYAVchUWgLtGXAY=; b=4EG/B2QKheois9eabsSU0kiark
	Z0K8mzoXzFNgiZicP71M5c1kJwJJ5dr2jTH2Og3RSpZ0hhflCFPUh/BvNyBHFPjfJhcWA8T+ds/1B
	RMM/UPad7s5CeLRrQ34ZAEhKzTdZWxKByIzDNnRg0EW0Au0OurR6JgELqwkSSocehj/gCjaMGCOGg
	ECCmvVh2IX/Xu8oCSpN2y8ncnYLcUx/JipmGe8uhm2Du49pIm9gkhAD+2GGA8kte/fGPp6CcKjXpb
	4B7jGo6C90B/3w7O8AbhKLiaDRi6zNL3u5/d1wusXQAkj268eodVonvoRt2w/UpjZHlBLfeAgMLnE
	5tiIFj0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Fu7-00000004px4-39wE;
	Mon, 14 Sep 2026 23:16:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Fu6-00000004pwB-3TcR;
	Mon, 14 Sep 2026 23:16:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D0D3B60267;
	Mon, 14 Sep 2026 23:16:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C80E21F008A1;
	Mon, 14 Sep 2026 23:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789427761;
	bh=7A8bsZwZtUn262lTk7IyubDp7W1YXYAVchUWgLtGXAY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=goQyM3FMdS+4uy3kh/E+DEd0gKrJrl1LoJbQcpJPU0pkEDMFeumZC0rXeero67oLZ
	 UL22IAP3R+QJtqR6PvhWIJJA3dMSY7jor7+OdCVkVXX/HUTwXZeks/ARs7R8amjpzU
	 /nLqxAwDyW2bcL8Yiu/0tJt+BmpW3pIU98xbnXJk5yIY/wKim2uozigmulByf4m96K
	 R0gMPMCCcgbMv/YbH9fcjrxymwylQyIaSMwpBxJWvY5FypWkbAgT9akEKa/7+4I+bN
	 hpuH7Uj2RH2iVoUjp5iUdWOU8/IztdooqGpHc4UgbVf7nwH7MhceescwmwNPEEvzt7
	 ueVIITBb+cGfw==
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
Subject: Re: [PATCH net-next v14 01/10] net: phy: aquantia: fix system interface type not updated in forced mode
Date: Mon, 14 Sep 2026 16:14:47 -0700
Message-ID: <20260914231447.702704-1-kuba@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260908-qcom-sa8255p-emac-v14-1-ec212b747a7d@oss.qualcomm.com>
References: <20260908-qcom-sa8255p-emac-v14-1-ec212b747a7d@oss.qualcomm.com>
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
net: phy: aquantia: fix system interface type not updated in forced mode

This drops the phydev->autoneg == AUTONEG_DISABLE test from the early
return in aqr_gen1_read_status(), so that MDIO_PHYXS_VEND_IF_STATUS is
decoded into phydev->interface whenever the link is up. The commit is
marked for stable and carries Fixes: 110a2432c520 ("net: phy: aquantia:
add downshift support").

> diff --git a/drivers/net/phy/aquantia/aquantia_main.c b/drivers/net/phy/aquantia/aquantia_main.c
> index e95d391a6dc23..b720e4e9028cc 100644
> --- a/drivers/net/phy/aquantia/aquantia_main.c
> +++ b/drivers/net/phy/aquantia/aquantia_main.c
> @@ -544,7 +544,7 @@ static int aqr_gen1_read_status(struct phy_device *phydev)
>  	if (ret)
>  		return ret;
>  
> -	if (!phydev->link || phydev->autoneg == AUTONEG_DISABLE)
> +	if (!phydev->link)
>  		return 0;
>  
>  	/* The status register is not immediately correct on line side link up.

[Severity: Medium]
This early return was also gating the rest of aqr_gen1_read_status(), not
just the MDIO_PHYXS_VEND_IF_STATUS decode. With the autoneg test gone, the
tail of the function now runs in forced mode too:

drivers/net/phy/aquantia/aquantia_main.c:aqr_gen1_read_status() {
	...
	phydev->interface = aqr_translate_interface(phydev, interface);

	/* Read rate from vendor register */
	return aqr_gen1_read_rate(phydev);
}

aqr_gen1_read_rate() overwrites both speed and duplex unconditionally from
the autoneg MMD vendor register:

drivers/net/phy/aquantia/aquantia_main.c:aqr_gen1_read_rate() {
	val = phy_read_mmd(phydev, MDIO_MMD_AN, MDIO_AN_TX_VEND_STATUS1);
	if (val < 0)
		return val;

	if (val & MDIO_AN_TX_VEND_STATUS1_FULL_DUPLEX)
		phydev->duplex = DUPLEX_FULL;
	else
		phydev->duplex = DUPLEX_HALF;

	switch (FIELD_GET(MDIO_AN_TX_VEND_STATUS1_RATE_MASK, val)) {
	case MDIO_AN_TX_VEND_STATUS1_10BASET:
		phydev->speed = SPEED_10;
	...
	default:
		phydev->speed = SPEED_UNKNOWN;
	}
}

In forced mode the speed and duplex were just established from the PMA by
aqr_read_status() -> genphy_c45_read_status() -> genphy_c45_read_pma(),
which reads the PMA MDIO_CTRL1 speed select and sets DUPLEX_FULL. Is
MDIO_AN_TX_VEND_STATUS1 still maintained by the firmware after
genphy_c45_an_disable_aneg() (called from genphy_c45_pma_setup_forced()
and aqr105_setup_forced())?

If it is not, a zeroed or stale rate field decodes as SPEED_10 with
DUPLEX_HALF, and an unrecognised code as SPEED_UNKNOWN, so a forced
1000BASE-T full duplex link would be reported to phylink at the wrong
rate and duplex. There is no validity qualifier and no "leave unchanged"
path in aqr_gen1_read_rate().

On gen2 parts a wrong or unknown speed also feeds the rate matching
lookup, which silently keeps the previous value when nothing matches:

drivers/net/phy/aquantia/aquantia_main.c:aqr_gen2_read_status() {
	for (i = 0; i < AQR_NUM_GLOBAL_CFG; i++) {
		struct aqr_global_syscfg *syscfg = &priv->global_cfg[i];

		if (syscfg->speed != phydev->speed)
			continue;
		...
			phydev->rate_matching = RATE_MATCH_PAUSE;
	...
}

The guard being removed came from the Fixes: commit 110a2432c520, where it
was added to keep the autoneg vendor rate handling out of the forced path.
Would it work to move the AUTONEG_DISABLE check onto the
aqr_gen1_read_rate() call instead of deleting it, so the interface decode
is always done but speed and duplex keep coming from the PMA in forced
mode? Alternatively, could the commit message state that
MDIO_AN_TX_VEND_STATUS1 is valid with autoneg disabled, since the message
currently only argues this for MDIO_PHYXS_VEND_IF_STATUS:

    MDIO_PHYXS_VEND_IF_STATUS is set by the PHY firmware based on the
    negotiated link speed, not based on whether autoneg was used to reach
    it.

This matters for the stable backport since the change is larger than the
one described.

