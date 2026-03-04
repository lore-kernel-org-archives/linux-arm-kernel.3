Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B43DCEF8FFC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 16:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4E81S360LZJasm+z9mMQB95l0sk0q8GKUxtXCQeVoTg=; b=GpqdF6v8sDsQlWhIDzECLliIU/
	zHsotFxlreSxU8KuiRBvI0j1TiU3QrBygxINHurxiyzzJVtDBiZNbghCybdqnfSXFOb/lFE+PWeEZ
	J/2fdGx7pxQ9Mkc1/oRiUe5Cbic59/hCrQdEOG1Y0eulDLY0HH+qa/tesKSoLi0IX0MeprfCuvEhi
	xxlt9ZT5gPNo8aVdBjvlfKT/5ZlABl1BQXdJ1q+JhErEn+dn6/FVVWVSC4u9HPmpgl7TFQ4c7C3OP
	u7CxVT2IF3t7CVkeWYvXBxE64Z9z6URFabvTT8byeYKhk0JnlGiLxNOs53cAGytHLM2CV2Dbpbosv
	HassoqFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxp9K-000000005EP-2WSb;
	Wed, 04 Mar 2026 16:32:38 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxp9H-000000005De-1N6P;
	Wed, 04 Mar 2026 16:32:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=4E81S360LZJasm+z9mMQB95l0sk0q8GKUxtXCQeVoTg=; b=kcAhc82XV2zj4ATHfuIl5oAz9H
	UPBtKS/AafU12aOJQMXH35D//2gq8JYzL3mNfaqnaTYYFO/5+sGwgybnjea9DTJQYbf+gkQ3PiJGQ
	7+8gKBfoPFnKyJv2KXp9d+gkA8/THuduL5z8Ch4B78IMQEdnoendq2zWEMG0HxbXGE4BqzmSgYvek
	er0OB5Y6bfjxP41aJPnZGKoLtRTGqVBuAc+GMh4Hg8Iq90oKKMh0tOjYJjcjeRs1mvzdehedLVz79
	y3Y1uJH9Bx9MpiWee51iTuYKzuH2hoH9A5ngD4rBH1UnS8Azh0X3NgxnuGWkaKnnhZON21RDILiRb
	s4+hQCSw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56966)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vxp8w-000000006lU-3Xbg;
	Wed, 04 Mar 2026 16:32:14 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vxp8s-0000000082X-3150;
	Wed, 04 Mar 2026 16:32:10 +0000
Date: Wed, 4 Mar 2026 16:32:10 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>, kevin-kw.huang@airoha.com,
	macpaul.lin@mediatek.com, matthias.bgg@gmail.com,
	kernel@collabora.com, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 2/2] net: phy: Introduce Airoha AN8801/R Gigabit
 Ethernet PHY driver
Message-ID: <aaheilkwpQ90xMmR@shell.armlinux.org.uk>
References: <20260304-add-airoha-an8801-support-v1-0-0ae4ee5a2f9d@collabora.com>
 <20260304-add-airoha-an8801-support-v1-2-0ae4ee5a2f9d@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304-add-airoha-an8801-support-v1-2-0ae4ee5a2f9d@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_083235_372388_615CB3C8 
X-CRM114-Status: GOOD (  16.97  )
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

On Wed, Mar 04, 2026 at 10:35:29AM +0100, Louis-Alexis Eyraud wrote:
> +static void an8801r_get_wol(struct phy_device *phydev,
> +			    struct ethtool_wolinfo *wol)
> +{
> +	u32 reg_val;
> +
> +	air_buckpbus_reg_read(phydev, AN8801_BPBUS_REG_WAKEUP_CTL1, &reg_val);
> +
> +	wol->supported = WAKE_MAGIC;
> +
> +	if (reg_val & AN8801_WOL_WAKE_MAGIC_EN)
> +		wol->wolopts |= WAKE_MAGIC;
> +	else
> +		wol->wolopts &= ~WAKE_MAGIC;

Please only support WoL if you know that the PHY has been wired up in
such a way to allow it to actually wake the system. The PHY itself
merely supporting WoL is insufficient.

Please look at my recent change to realtek_main.c in commit
b826bf795564 ("net: phy: realtek: fix RTL8211F wake-on-lan support")
to see a possible way to achieve this.

> +static int an8801r_config_init(struct phy_device *phydev)
> +{
> +	u8 led_default_function[AN8801R_NUM_LEDS] = { 0 };
> +	int prev_page, ret;
> +
> +	ret = an8801r_of_init_leds(phydev, led_default_function);
> +	if (ret)
> +		return ret;
> +
> +	/* Disable Low Power Mode (LPM) */
> +	ret = phy_write_mmd(phydev, MDIO_MMD_VEND2, AN8801_REG_PHY_INTERNAL0,
> +			    FIELD_PREP(AN8801_PHY_INTFUNC_MASK, 0x1e));
> +	if (ret)
> +		return ret;
> +
> +	ret = phy_write_mmd(phydev, MDIO_MMD_VEND2, AN8801_REG_PHY_INTERNAL1,
> +			    FIELD_PREP(AN8801_PHY_INTFUNC_MASK, 0x2));
> +	if (ret)
> +		return ret;
> +
> +	/* Disable EEE by default */
> +	ret = phy_write_mmd(phydev, MDIO_MMD_AN, MDIO_AN_EEE_ADV, 0);
> +	if (ret)
> +		return ret;

Are you sure this is safe, e.g. over a suspend/resume, and doesn't
cause the hardware vs software state to desync?

> +
> +	prev_page = phy_select_page(phydev, AIR_PHY_PAGE_EXTENDED_1);
> +	if (prev_page < 0)
> +		return prev_page;

No, this is buggy. Please read the phy_select_page() documentation to
find out why.

> +
> +	/* Set the PHY to perform auto-downshift after 3 auto-negotiation
> +	 * attempts
> +	 */
> +	__phy_write(phydev, AN8801_EXT_REG_PHY,
> +		    FIELD_PREP(AN8801_EXT_PHY_CTRL1, 0x1d) |
> +		    FIELD_PREP(AN8801_EXT_PHY_DOWNSHIFT_CTL, 1) |
> +		    AN8801_EXT_PHY_DOWNSHIFT_EN);
> +
> +	ret = phy_restore_page(phydev, prev_page, ret);
> +	if (ret)
> +		return ret;

However, the bug could've been avoided by using the appropriate
accessor:

	ret = phy_write_paged(phydev, AIR_PHY_PAGE_EXTENDED_1,
			      AN8801_EXT_REG_PHY,
			      FIELD_PREP(AN8801_EXT_PHY_CTRL1, 0x1d) |
			      FIELD_PREP(AN8801_EXT_PHY_DOWNSHIFT_CTL, 1) |
			      AN8801_EXT_PHY_DOWNSHIFT_EN);
	if (ret < 0)
		return ret;

> +static int an8801r_read_status(struct phy_device *phydev)
> +{
> +	int prev_speed, ret;
> +	u32 val;
> +
> +	prev_speed = phydev->speed;
> +
> +	ret = genphy_read_status(phydev);
> +	if (ret)
> +		return ret;
> +
> +	if (!phydev->link)
> +		return 0;
> +
> +	if (prev_speed != phydev->speed) {

Maybe:

	if (phydev->link && prev_speed != phydev->speed) {

?

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

