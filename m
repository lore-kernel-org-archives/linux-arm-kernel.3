Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AAE2C021B0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 10:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UJi/ZZDPytMZa3Hcg3Ha7wf64wi1Jm9YQ1zlxDcQewI=; b=lmXgNV+yI7qH0Vx/EhcVQWXMvL
	AECbkGhEUF7iAWVzo/Ot9mZgiXJrDXpHFrMOASOZAvLNB/Ro4dCVPSN8K73Xk3rYZMmvplWN2TFsa
	ojnA9mxVI33Suz5SjJ6tedSJnWMIKMVkyPt2er91PYx2wem8Korm6TMomOzM1qjQ/XUHEyEgVA9Nc
	BjCTr/DVzVmVNcgnNsIZCFt1sMfg2rFheIpDUDrrCCfWbFriIC3Nx2ojbuX9E9F5YeTEfF+B25rck
	mFLZJYcxWTLNsLOJSTuXY5sH/qP2tLPNOSkIVq2srbiTYxmQ93CwSNYgA/nTj5zLkZQR41gpPg4U1
	ILyaysTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkgzA-0000000C3Si-1XYB;
	Wed, 19 Feb 2025 10:07:20 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkgT1-0000000Btlq-1ebA;
	Wed, 19 Feb 2025 09:34:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=UJi/ZZDPytMZa3Hcg3Ha7wf64wi1Jm9YQ1zlxDcQewI=; b=Zy9X1JhIJ3vzwjwF5hdcaVF4Db
	ynvZJFXSrpv0cw2uz0MMbMIkrPon/gvwpwuh5rS1Aa1cBRD4/Cls3j5fLmFc6OiK8FNI51VuuFJt3
	pE6buavaSuWku/q4XoDdjp2O6OD4deN3GRczII7XEAoXcZ9U5rWOrSuxm5WE9C5UVB/kl94kP65ki
	R64kRQJsqthOC1M3eenqlafeh4IcXuf1Y0gA7/s4VrEM7lNnlEiPeaUz9DsOek21R5htLzxGEEVmh
	BCvYtfJFtvi1lkSXIc+7+lzzvUIYwAnfy9K4gMjZznd2v0zt7AU+6v6H+mi8xJlZo6TE9SaHD/S6G
	XHfhKYqg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:52572)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tkgSj-0005Bw-2d;
	Wed, 19 Feb 2025 09:33:49 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tkgSe-0008Gi-1m;
	Wed, 19 Feb 2025 09:33:44 +0000
Date: Wed, 19 Feb 2025 09:33:44 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Sky Huang <SkyLake.Huang@mediatek.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Simon Horman <horms@kernel.org>, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Steven Liu <Steven.Liu@mediatek.com>
Subject: Re: [PATCH net-next v2 3/3] net: phy: mediatek: add driver for
 built-in 2.5G ethernet PHY on MT7988
Message-ID: <Z7WleP9v6Igx2MjC@shell.armlinux.org.uk>
References: <20250219083910.2255981-1-SkyLake.Huang@mediatek.com>
 <20250219083910.2255981-4-SkyLake.Huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250219083910.2255981-4-SkyLake.Huang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_013407_702144_7ECF636F 
X-CRM114-Status: GOOD (  11.92  )
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

On Wed, Feb 19, 2025 at 04:39:10PM +0800, Sky Huang wrote:
> +static int mt798x_2p5ge_phy_config_init(struct phy_device *phydev)
> +{
> +	struct pinctrl *pinctrl;
> +	int ret;
> +
> +	/* Check if PHY interface type is compatible */
> +	if (phydev->interface != PHY_INTERFACE_MODE_INTERNAL)
> +		return -ENODEV;
> +
> +	ret = mt798x_2p5ge_phy_load_fw(phydev);
> +	if (ret < 0)
> +		return ret;

Firmware should not be loaded in the .config_init method. The above
call will block while holding the RTNL which will prevent all other
network configuration until the firmware has been loaded or the load
fails.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

