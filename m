Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A06D5D32D8D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 13:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yf/24sbBNDDoh13fZUjInsCA81I5s6NjSfUou39GZzo=; b=QLa6nJ1FZS1ioKR5qm8MTNdy9O
	VPwFQNlGHdDJjAk1Ajk8LcVFRLWEO4S8Bbrvd6rFQcrHwQM2m345AFJrrKNkmHrOWi/VXkNQAtnY4
	HZTyL1g2SAJyP2Sn1fJcqIvGrAtQryHVCQm6BaqwIwbP8YZn/u9bzKHsv+NbaDis6bNUPN8YWMR0Z
	xw+t85FFsar9IHcMYV5XXUgDzguVu/oGw8G8yKxjyEx/uaJ6Oiw2yQ4gefhRK/7095LkaVQHAWafW
	AiB1ECZlZJvWaB8tyc8v5s3wLVBrYgAeFmjj4l3ScjDFht5qoCPmJulSi4u6PIz3QhmEsLUOd955K
	3XkCQcow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAqd3-00000003V4n-3PW7;
	Tue, 12 Nov 2024 13:08:21 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAqZC-00000003UFN-1aGy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 13:04:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Yf/24sbBNDDoh13fZUjInsCA81I5s6NjSfUou39GZzo=; b=KudzVD96WhjqBFINviWDdpHa6r
	QGLsRhhmFYz5h85UzqrcF02t1lkbdDuRRYsT3Q2Kl+pCCe6QtmwqBIEqC9lQOjC+sGFMP+4BzUKTY
	SC2IQPSlOkMeqSssJLj70NqRqqan6sJtPQ5ABS9U1t3sl6t2W/NlfOlUa4ZkuPVvfv0Q=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tAqYt-00D1ky-CZ; Tue, 12 Nov 2024 14:04:03 +0100
Date: Tue, 12 Nov 2024 14:04:03 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Choong Yong Liang <yong.liang.choong@linux.intel.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net v1 1/2] net: phy: Introduce phy_update_eee() to
 update eee_cfg values
Message-ID: <71b6be0e-426f-4fb4-9d28-27c55d5afa51@lunn.ch>
References: <20241112072447.3238892-1-yong.liang.choong@linux.intel.com>
 <20241112072447.3238892-2-yong.liang.choong@linux.intel.com>
 <f8ec2c77-33fa-45a8-9b6b-4be15e5f3658@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f8ec2c77-33fa-45a8-9b6b-4be15e5f3658@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_050422_525774_0CC7DDA3 
X-CRM114-Status: GOOD (  13.68  )
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

On Tue, Nov 12, 2024 at 12:03:15PM +0100, Heiner Kallweit wrote:
> On 12.11.2024 08:24, Choong Yong Liang wrote:
> > The commit fe0d4fd9285e ("net: phy: Keep track of EEE configuration")
> > introduced eee_cfg, which is used to check the existing settings against
> > the requested changes. When the 'ethtool --show-eee' command is issued,
> > it reads the values from eee_cfg. However, the 'show-eee' command does
> > not show the correct result after system boot-up, link up, and link down.
> > 
> 
> In stmmac_ethtool_op_get_eee() you have the following:
> 
> edata->tx_lpi_timer = priv->tx_lpi_timer;
> edata->tx_lpi_enabled = priv->tx_lpi_enabled;
> return phylink_ethtool_get_eee(priv->phylink, edata);
> 
> You have to call phylink_ethtool_get_eee() first, otherwise the manually
> set values will be overridden. However setting tx_lpi_enabled shouldn't
> be needed if you respect phydev->enable_tx_lpi.

I agree with Heiner here, this sounds like a bug somewhere, not
something which needs new code in phylib. Lets understand why it gives
the wrong results.

	Andrew

