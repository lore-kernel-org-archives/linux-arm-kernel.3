Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9CBBD5E15A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 11:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XulOllBIkuytFC+Y8jjBL4AZiw+lKhgqpGZMJSaBx5k=; b=amVzzpZkpwCsM0hJhr9N4BKxCz
	2Q1OLJPyDEpPVwGf6PC++OXBXHTNMKD9mMosFxGjrJCtQ3fVZcmgfgq5gLjYjIDdE5M0npZMwuSpO
	QC2NBos05103fwRwhEs2sDHNuJYQcmvlokMnjEzvP8+R5u2EYprrOrjAvSh/SiYlI9mLFcndTZXPX
	rTNhBX7lmwUxTMbcWvR0ezw6M4wupIELdnqb1Fd225aWT4iwGp20gkgxy+ufeNRnWBc7mtKHUv67i
	tqUbxy5368p84hpxZj+oNWrHriX28DXH/fc8qd8yiZoMcWwjzyPRAOEiZvrdMpWvma9S7siD836ZU
	e3iqumJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9NXu-0000000AQ58-15H1;
	Fri, 08 Nov 2024 11:52:58 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Ms5-0000000AIDj-1PNB;
	Fri, 08 Nov 2024 11:09:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=XulOllBIkuytFC+Y8jjBL4AZiw+lKhgqpGZMJSaBx5k=; b=c1xowD7s4OuJURB6/lfb3SpnaM
	WCf+aB8UmNdac55vpex+o8Z4RQxK3FPf7BaUvS3r9k4rnVslK0z49jwLb/WjuUCazjE78wGNNcQUg
	U+i9FcmUCfXGvWlFZcYTXhbH5QEcuEQ2BlyxacYunkZSSOpiiTYje7VyI7PZYl+xIUls7OsGhYEcE
	SOjOS2pZ1DhtQv8jGu5HWWtkQH3/E2DHnEdNnZyoFKKgoF9pALFMgjUsgGY9QM1wUpUaMa20JI0fb
	qGDoN0d4LJmWqcP22iXd73XqPWk92zq073ALIAv2fKHzkJkRt4jqD5EhycRwy3VBshLroYG63IjGr
	X85XvVKA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:43764)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1t9Mrt-0004yj-0n;
	Fri, 08 Nov 2024 11:09:33 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1t9Mrq-0002ER-17;
	Fri, 08 Nov 2024 11:09:30 +0000
Date: Fri, 8 Nov 2024 11:09:30 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	upstream@airoha.com
Subject: Re: [net-next PATCH v3 3/3] net: phy: Add Airoha AN8855 Internal
 Switch Gigabit PHY
Message-ID: <Zy3xaviqqT6X8Ows@shell.armlinux.org.uk>
References: <20241106122254.13228-1-ansuelsmth@gmail.com>
 <20241106122254.13228-4-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241106122254.13228-4-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_030945_407390_D6B633C8 
X-CRM114-Status: GOOD (  14.83  )
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

On Wed, Nov 06, 2024 at 01:22:38PM +0100, Christian Marangi wrote:
> +/* MII Registers Page 1 */
> +#define AN8855_PHY_EXT_REG_14			0x14
> +#define   AN8855_PHY_EN_DOWN_SHFIT		BIT(4)

Shouldn't "AN8855_PHY_EN_DOWN_SHFIT" be "AN8855_PHY_EN_DOWN_SHIFT"
(notice the I and F are swapped) ?

> +static int an8855_get_downshift(struct phy_device *phydev, u8 *data)
> +{
> +	int saved_page;
> +	int val;
> +	int ret;
> +
> +	saved_page = phy_select_page(phydev, AN8855_PHY_PAGE_EXTENDED_1);
> +	if (saved_page >= 0)
> +		val = __phy_read(phydev, AN8855_PHY_EXT_REG_14);
> +	ret = phy_restore_page(phydev, saved_page, val);
> +	if (ret)
> +		return ret;

This function is entirely broken.

phy_restore_page() will return "val" if everything went successfully,
so here you end up returning "val" via this very return statement
without executing any further code in the function. The only time
further code will be executed is if "val" was successfully read as
zero.

Please use the helpers provided:

	ret = phy_read_paged(phydev, AN8855_PHY_PAGE_EXTENDED_1,
			     AN8855_PHY_EXT_REG_14);
	if (ret < 0)
		return ret;

ret now contains what you're using as "val" below. No need to open code
phy_read_paged().

> +
> +	*data = val & AN8855_PHY_EXT_REG_14 ? DOWNSHIFT_DEV_DEFAULT_COUNT :
> +					      DOWNSHIFT_DEV_DISABLE;

Here, the test is against the register number rather than the bit that
controls downshift. Shouldn't AN8855_PHY_EXT_REG_14 be
AN8855_PHY_EN_DOWN_SH(F)I(F)T ?

> +static int an8855_set_downshift(struct phy_device *phydev, u8 cnt)
> +{
> +	int saved_page;
> +	int ret;
> +
> +	saved_page = phy_select_page(phydev, AN8855_PHY_PAGE_EXTENDED_1);
> +	if (saved_page >= 0) {
> +		if (cnt != DOWNSHIFT_DEV_DISABLE)
> +			ret = __phy_set_bits(phydev, AN8855_PHY_EXT_REG_14,
> +					     AN8855_PHY_EN_DOWN_SHFIT);
> +		else
> +			ret = __phy_clear_bits(phydev, AN8855_PHY_EXT_REG_14,
> +					       AN8855_PHY_EN_DOWN_SHFIT);
> +	}
> +
> +	return phy_restore_page(phydev, saved_page, ret);

This entire thing can be simplified to:

	u16 ds = cnt != DOWNSHIFT_DEV_DISABLE ? AN8855_PHY_EN_DOWN_SHFIT: 0;

	return phy_modify_paged(phydev, AN8855_PHY_PAGE_EXTENDED_1,
				AN8855_PHY_EXT_REG_14, AN8855_PHY_EN_DOWN_SHFIT,
				ds);

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

