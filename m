Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3328CAC583
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 10:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W5yCldw9Ui0PQdaUryQ7+dVXsj2JWAh+weDkVvcZLVM=; b=5GSSutq+vmHtLlbiLp6hZsA7zt
	bvcSQchsGqu1WCfsogBVEe/0j3vyL15dHKMdAbbPc1jgSgk9IakoZ3PJyR1gJTPj/rdGWJJr/lKPV
	S08qBwCnAo2Ont0xWWJq1TPhRzbiZdHl4zglBER+4hUSYIB7gw2VkNVRx/Kxrx/prmlrZTZQU6HGJ
	Uwf+AwPDq5V08iODJJ+D9wPIufNQ2WzuCSS5vKz4IeGiRpzQY7ddQ0GyA8o/tnikwgT29UQ3zaLDK
	ppC32aLVbo5UzvzzKDbl8WVgD2eborGSyYEwB3hsQx578NBZtEemalFTMY+i4JXoQS0IPBLaAAJzM
	YwMzff/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvvg2-00000006Qug-1FLg;
	Tue, 09 Sep 2025 10:34:18 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvuM7-00000005pVy-11Zs;
	Tue, 09 Sep 2025 09:09:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=W5yCldw9Ui0PQdaUryQ7+dVXsj2JWAh+weDkVvcZLVM=; b=Lneve32F7PjadMleGWG34WGj6d
	VnT/OKOi/tMc+rXvp5mD1Ff9J5b9lK9TQnfudYPDmao6s68OS37tEK9qZTxsOpDiphIHxZ2GPD930
	j7Fr+D+VOsdEQUxC5dTOt8ZyiJPRtgiR61Yps7a8pn4+qocE8D91wLbOYeWdw7CoTNmvChiZrjht8
	x7VAMoi7i1ABsLOtxD0mU5LSTEqdf8dy/s5V9xnyf1R+hzhaL/5h9vwj1Y0XO2uBdD0VNhJ7CqZzc
	TmQX78staw+O8AMvMqWmCYwhx+xMJPFJCxyPdS0laLJ7JUCaM8EsGDIWbrjzi9l7eyWr9/RB8jNB6
	oLBzX/1w==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:37982)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1uvuLb-000000007vX-2AJK;
	Tue, 09 Sep 2025 10:09:07 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1uvuLS-000000000Gl-1UJ2;
	Tue, 09 Sep 2025 10:08:58 +0100
Date: Tue, 9 Sep 2025 10:08:57 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, Simon Horman <horms@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [net-next PATCH v16 06/10] net: dsa: Add Airoha AN8855 5-Port
 Gigabit DSA Switch driver
Message-ID: <aL_uqX90oP_3hbK6@shell.armlinux.org.uk>
References: <20250909004343.18790-1-ansuelsmth@gmail.com>
 <20250909004343.18790-7-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250909004343.18790-7-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_020939_586826_520AB95E 
X-CRM114-Status: GOOD (  12.05  )
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

On Tue, Sep 09, 2025 at 02:43:37AM +0200, Christian Marangi wrote:
> +static void an8855_phylink_get_caps(struct dsa_switch *ds, int port,
> +				    struct phylink_config *config)
> +{
> +	struct an8855_priv *priv = ds->priv;
> +	u32 reg;
> +	int ret;
> +
> +	switch (port) {
> +	case 0:
> +	case 1:
> +	case 2:
> +	case 3:
> +	case 4:
> +		__set_bit(PHY_INTERFACE_MODE_GMII,
> +			  config->supported_interfaces);
> +		__set_bit(PHY_INTERFACE_MODE_INTERNAL,
> +			  config->supported_interfaces);
> +		break;
> +	case 5:
> +		phy_interface_set_rgmii(config->supported_interfaces);
> +		__set_bit(PHY_INTERFACE_MODE_SGMII,
> +			  config->supported_interfaces);
> +		__set_bit(PHY_INTERFACE_MODE_2500BASEX,
> +			  config->supported_interfaces);
> +		break;
> +	}
> +
> +	config->mac_capabilities = MAC_ASYM_PAUSE | MAC_SYM_PAUSE |
> +				   MAC_10 | MAC_100 | MAC_1000FD | MAC_2500FD;
> +
> +	ret = regmap_read(priv->regmap, AN8855_CKGCR, &reg);
> +	if (ret)
> +		dev_err(ds->dev, "failed to read EEE LPI timer\n");
> +
> +	config->lpi_capabilities = MAC_100FD | MAC_1000FD;
> +	/* Global LPI TXIDLE Threshold, default 60ms (unit 2us) */
> +	config->lpi_timer_default = FIELD_GET(AN8855_LPI_TXIDLE_THD_MASK, reg) *
> +				    AN8855_TX_LPI_UNIT;

You're not filling in config->lpi_interfaces, which means phylink won't
LPI won't be functional.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

