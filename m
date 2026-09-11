Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59D01C88E4D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 13:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kohi64dQ4DmaEMK+ZD5A/ULUjFhzKM3yV198CkL0Eeo=; b=vwLneQz6tqAzHAT3jaN7d42MuR
	5v1HTAoHCW0ac2hyd3MvYy5ejXdydCp1b3Q+gGjFhuko95TvCmpBiejkNdJrTX8bAC30OvJoYOMQK
	HY+QgeEcrcR1pr7//3GFPHJuIh7bilhkeN0pwvI/ApxtML992k90ONHIwIx94WeLV/QVHZ7IEI3lC
	sGlfxs/rSaJWkVjEIKaXapVWrbfbJDwxm3Ih0Mcl91XUumlCeKevz8U9crDz34pVqTq+aJJ9Ak+sE
	mNlYY5SR2XK1A+eB/5rzDsQOU7Rbymaig28Y7qltylj7jLe3nUpnzjlxUMBtsz/eD5DVtONdSLFMv
	/AwjuCLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4zue-0000000GYqh-25oZ;
	Fri, 11 Sep 2026 11:59:24 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4zuc-0000000GYpa-0UHC;
	Fri, 11 Sep 2026 11:59:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Kohi64dQ4DmaEMK+ZD5A/ULUjFhzKM3yV198CkL0Eeo=; b=LJWkaAISz58qWqwN3J5USwTBy0
	nDqz9tMtZPPWdDv+LNbrzfhJylQzHihUh3HHb7tR7Vt3HWLVor+DQa1CmlhdqLtKLV9T3fvw8DUMQ
	qkeNdc05QS9115NWIPVLpEPp/Au8Hgs6+uho90r7lWTapEEht0LE+Uozb9d1CxZBZuCU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1x4zuC-004gRj-Iw; Fri, 11 Sep 2026 13:58:56 +0200
Date: Fri, 11 Sep 2026 13:58:56 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: netdev@vger.kernel.org, daniel@makrotopia.org, dqfext@gmail.com,
	SkyLake.Huang@mediatek.com, hkallweit1@gmail.com,
	linux@armlinux.org.uk, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>
Subject: Re: [PATCH v2 net-next] net: phy: mediatek: support MT7530 PHYs on
 EN71221 MCM
Message-ID: <8396aeb6-c43e-453e-a7d3-52349b93c528@lunn.ch>
References: <20260909213250.3184238-1-cjd@cjdns.fr>
 <20260911103910.4123567-1-cjd@cjdns.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911103910.4123567-1-cjd@cjdns.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_045922_153400_177ECB8D 
X-CRM114-Status: UNSURE (   7.14  )
X-CRM114-Notice: Please train this message.
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

> +	/* Clause 22 local data. */
> +	ret = phy_write(phydev, MII_CTRL1000, 0x1e00);

Didn't i ask for 0x1e00 to be replaced with standard macros?

> +	/* Vendor profile disables 100/1000BASE-T EEE advertisement. */
> +	ret = phy_write_mmd(phydev, MDIO_MMD_AN, 0x003c, 0x0000);
> +	if (ret < 0)
> +		return ret;

And didn't i ask if EEE is broken? We have infrastructure for that,
please use it.

Also, please start a new thread for every version of a patch
series. The CI tools don't always pick up replies to previous patch
versions, it thinks it is just ongoing discussion.

    Andrew

---
pw-bot: cr

