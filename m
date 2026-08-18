Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF64FC5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 18:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pNul3rkBwj68pdTIxV9EmVP7uBYyUvCbr9LjUTFRotM=; b=DdSJlJ+N8c9fVi0ktQawLOUmSD
	9mCT9Ok04EJaNVoSEpIPpM3jQuIF4CN3iRXS0Yhyk/MOFopQvteBQliQS3LN5/5llBBP5yg+bZbcV
	ebZtrHJs1Q4qx/Ka8ppKYmgWTKtuFCwBfUaxGDHaRsaWF7bgh34zXk4qeXl0up3dtpXt/pWOhHG75
	RlGG88J9jjRagx8wfQweLLDMiHl7i022OQ6N3aMRibTy/b0kJts9KlCxXFiQ8H8bQ0u1a9gfezvqZ
	K953f/Fc/Q9NkBHKyvx5UQ53JFWrDadHpljplJEaEXnSr6zzwWqwJao7KwMBinoZ1PmieVQVxR4wq
	06KOZ62Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwOmK-00000008XIj-0nk7;
	Tue, 18 Aug 2026 18:43:16 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwOmH-00000008XHn-2vVf;
	Tue, 18 Aug 2026 18:43:14 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wwOlx-00000000050-4B4P;
	Tue, 18 Aug 2026 18:42:54 +0000
Date: Tue, 18 Aug 2026 19:42:50 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Vladislav Karmanov <vladislav.karmanov.dev@gmail.com>
Cc: netdev@vger.kernel.org, chester.a.unal@arinc9.com, dqfext@gmail.com,
	sean.wang@mediatek.com, andrew@lunn.ch, olteanv@gmail.com,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, yangshiji66@outlook.com
Subject: Re: [PATCH net] net: dsa: mt7530: do not advertise EEE on MT7621
 switch
Message-ID: <aoSnqurLLgdVT_Eu@makrotopia.org>
References: <20260818182829.1580811-1-vladislav.karmanov.dev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260818182829.1580811-1-vladislav.karmanov.dev@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_114313_735764_8EEC3D20 
X-CRM114-Status: GOOD (  20.32  )
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

Hi,

On Tue, Aug 18, 2026 at 09:28:29PM +0300, Vladislav Karmanov wrote:
> There are hardware defects in the MT7621 (MT7530) EEE support: with EEE
> advertised, some link partners cannot establish a stable connection.
> Notably, on a 2-pair (4-wire) cable where both ends advertise gigabit,
> 1000BASE-T training cannot succeed, and instead of falling back to
> 100 Mbps the port flaps in a loop and no link/DHCP lease is obtained.
> This is confined to the WAN / phylib bring-up path; the DSA/LAN side on
> the same device is unaffected.
> 
> The MT7530 internal GE PHY advertises EEE by hardware default. The
> eee-broken-100tx / eee-broken-1000t device-tree properties only take
> effect during the late PHY config_init path, which is too late for these
> link partners: they negotiate EEE before the OS disables it and then
> fail to fall back cleanly.
> 
> Commit af3b4b0e59de ("net: phy: mediatek-ge: do not disable EEE
> advertisement") removed the early EEE-advertisement disable from
> mtk_gephy_config_init(), on the rationale that "disabling EEE
> advertisement before the PHY driver initialises keeps it off", i.e. that
> the DSA subdriver already performs that early disable. That rationale
> holds for MT7531, whose mt7531_setup() clears MDIO_AN_EEE_ADV on each
> switch PHY -- but it does not hold for MT7621, whose mt7530_setup()
> never had such a loop. So af3b4b0e59de removed the only early EEE
> disable that covered MT7621, reintroducing the flapping on MT7621-based
> boards (regression reported on ramips/mt7621).
> 
> MediaTek's own recommendation (Landen Chao, 2021) confirms the hardware
> is the root cause: "EEE of the 10-year-old MT7530 internal gephy has many
> IOT problems, so it is recommended to disable its EEE."
> [...]
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
> @@ -2518,6 +2518,15 @@
>  	if ((val & MT7530_XTAL_MASK) == MT7530_XTAL_40MHZ)
>  		mt7530_pll_setup(priv);
>  
> +	if (priv->id == ID_MT7621) {

It'd be very surprising if this limitation doesn't also apply for the
nearly identical decicated MT7530 IC (found eg. on BananaPi R2).

I'd recommend disabling EEE advertisement on MT7621 and MT7530; and I
suspect that some of the older Trendnet/Econet SoCs which share common
linage with the MediaTek's Ethernet switch and PHY designs could also
be affected.

Hence I'd suggest to extend 'struct mt753x_info' with a 'broken_eee'
bool instead of maintining an in-code list of EEE-broken silicon IDs.

> +		/* Disable EEE advertisement on the switch PHYs. */
> +		for (i = MT753X_CTRL_PHY_ADDR(priv->mdiodev->addr);
> +		     i < MT753X_CTRL_PHY_ADDR(priv->mdiodev->addr) + MT7530_NUM_PHYS;
> +		     i++) {
> +			mt7530_phy_write_c45(priv, i, MDIO_MMD_AN, MDIO_AN_EEE_ADV, 0);
> +		}
> +	}
> +


