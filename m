Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CB35C88E53
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 11:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cno/mSYxeYjSbwhVWHXxuFAZbbCgIhXNqp2t00lpUfo=; b=XlHJbk6nPkWLQCtXWCiCM8WVDB
	oQ8EM39UeQB/URTV+6v3XDAaI4cLKsUMOvse096wFrgRiffbNL4iYka4ZVHeCUVzs+FbdzkWZfs1t
	7L2lgm2HIjDDzgPKAtA6nmLDcY4BZ1uHoQHu3/EaCJnoJl8U85MzG3mQQxMLSu2yxpBTxNn0oIVIv
	rMhLGyAf6m2FMWooVC79uFbBNTYv1FOrJgRY3NEGMjHo2uwdF8lXePWe+1cqhJv/D81Np+phH39ey
	xPdlGp/0ATHWumeFx9h8AI9POFV6ln+lZ79jIkLOHAdSgfDEtoCajP6YGOB6J0ybqCr8h3y9Miors
	usPHDrLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Rdo-00000006Hl8-1FTL;
	Tue, 15 Sep 2026 11:48:00 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Rdm-00000006HkZ-32qj;
	Tue, 15 Sep 2026 11:47:59 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100)
	(envelope-from <daniel@makrotopia.org>)
	id 1x6Rdd-000000007qj-3QQb;
	Tue, 15 Sep 2026 11:47:49 +0000
Date: Tue, 15 Sep 2026 12:47:45 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: netdev@vger.kernel.org, dqfext@gmail.com, SkyLake.Huang@mediatek.com,
	andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>
Subject: Re: [PATCH v5 net-next] net: phy: mediatek: support MT7530 PHYs on
 EN71221 MCM
Message-ID: <aqkwYd5dTmHDCIW9@makrotopia.org>
References: <20260915113427.113296-1-cjd@cjdns.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915113427.113296-1-cjd@cjdns.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_044758_832492_6BCC47C1 
X-CRM114-Status: GOOD (  12.03  )
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

On Tue, Sep 15, 2026 at 11:34:27AM +0000, Caleb James DeLisle wrote:
> [...]
> +/*
> + * MTK_GPHY_ID_MT7530 ID is also used for an EcoNet SoC FE phy, but that PHY
> + * does not advertise ESTATUS_1000_TFULL.
> + */
> +static bool mt7530_is_gphy(struct phy_device *phydev)
> +{
> +	return phydev->phy_id == MTK_GPHY_ID_MT7530 &&
> +	       (phy_read(phydev, MII_ESTATUS) & ESTATUS_1000_TFULL) != 0;
> +}
> +
> +static int mt7530_phy_match(struct phy_device *phydev,
> +			    const struct phy_driver *phydrv)
> +{
> +	return mt7530_is_gphy(phydev) && !en751221_is_mcm_phy(phydev);
> +}
> +
> +static int en751221_phy_match(struct phy_device *phydev,
> +			      const struct phy_driver *phydrv)
> +{
> +	return mt7530_is_gphy(phydev) && en751221_is_mcm_phy(phydev);
> +}
> +
>  static int mt7531_phy_config_init(struct phy_device *phydev)
>  {
>  	mtk_gephy_config_init(phydev);
> @@ -135,6 +199,23 @@ static struct phy_driver mtk_gephy_driver[] = {
>  		 */
>  		.config_intr	= genphy_no_config_intr,
>  		.handle_interrupt = genphy_handle_interrupt_no_ack,
> +		.match_phy_device = mt7530_phy_match,
> +		.suspend	= genphy_suspend,
> +		.resume		= genphy_resume,
> +		.read_page	= mtk_phy_read_page,
> +		.write_page	= mtk_phy_write_page,
> +	},
> +	{
> +		PHY_ID_MATCH_EXACT(MTK_GPHY_ID_MT7530),

I'd suggest to actually use phy_id and phy_id_mask assigned by the
PHY_ID_MATCH_EXACT macro by calling genphy_match_phy_device() in your
match functions above instead of open-coding the ID match.
Or drop PHY_ID_MATCH_EXACT from *both* drivers.

