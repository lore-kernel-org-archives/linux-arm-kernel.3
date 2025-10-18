Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D907CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Oct 2025 20:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HZVFyQFH/N6BlbXZw7Nya2jm1NlFu/aT9k9hJeAWYd0=; b=YPulBT9xqp4B1ysoRpvfMKBrbf
	VytquSoOVn+b0Y/E+HVsnO3H6Z9u8fCKrI85xXakgm5zMwuDchyQit3qlv89HCvBYExr1Jd53mQTa
	GikxoNJHRjcBLG4+DG71JREWrLZeeA9JV1W3KNrBz4RvYj07atywN23BKTXNqBOgCKGhsLlCqxQZ7
	Ghq6+2HQY45pFmu84k4WFLYiTWSCwkKQIb1fXgJRtxaaxzh9iokTvtBImCz3fJNekJyOIwjAEQGKU
	eaTIPtjvrIZIH0h35O3aon3JOcdilVSdhmaopbNVET74X9x5RJozpGZTz9/bIN85SO0ERwkvMKDDm
	4lqnCZ7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vADsp-0000000AS6x-0LVx;
	Sat, 18 Oct 2025 20:50:35 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vADsm-0000000AS6U-0qMS
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Oct 2025 20:50:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=HZVFyQFH/N6BlbXZw7Nya2jm1NlFu/aT9k9hJeAWYd0=; b=S8RVQB9gc5V85YTnJ25mLHH2Vs
	jYcPLDoDMEB7wJ3GereehfiJA/tHV9Qc71uSKDF4TlPs8FyhXlcyaUoJeUPZvlz6Y5JdQoX+Zhr+r
	RVmVRq0wk05pUUXtc+J/P39mOXEN0XPmRT7ibqUkCTOk9rcM3BewqOYeBBrylj6u7A9uoowpHa5o3
	Azqt2pju1pTzqbWHNYythB3qFjEh+M+rzQSEuX++nmhDN1RnCdfXLybWNYJSJuJow+KFvo+9qSYcY
	kUew1Zpz4oNZttZXiC3p1WzmZjUcNMjGH72MEDReMLkZnFqKZTiKDlJUd8ZcMACGg5XA+as8/OW/K
	ukzTLkjw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:50152)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vADsJ-000000000i9-1B5b;
	Sat, 18 Oct 2025 21:50:03 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vADsA-000000005aS-0gvN;
	Sat, 18 Oct 2025 21:49:54 +0100
Date: Sat, 18 Oct 2025 21:49:54 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Han Gao <rabenda.cn@gmail.com>, Icenowy Zheng <uwu@icenowy.me>,
	Vivian Wang <wangruikang@iscas.ac.cn>, Yao Zi <ziyao@disroot.org>,
	netdev@vger.kernel.org, sophgo@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH] net: stmmac: dwmac-sophgo: Add phy interface filter
Message-ID: <aPP9cjzwihca-h6C@shell.armlinux.org.uk>
References: <20251017011802.523140-1-inochiama@gmail.com>
 <34fcc4cd-cd3d-418a-8d06-7426d2514dee@lunn.ch>
 <i5prc7y4fxt3krghgvs7buyfkwwulxnsc2oagbwdjx4tbqjqls@fx4nkkyz6tdt>
 <c16e53f9-f506-41e8-b3c6-cc3bdb1843e1@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c16e53f9-f506-41e8-b3c6-cc3bdb1843e1@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251018_135032_509935_312C61CF 
X-CRM114-Status: GOOD (  19.52  )
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

On Sat, Oct 18, 2025 at 10:38:17PM +0200, Andrew Lunn wrote:
> On Sat, Oct 18, 2025 at 08:42:07AM +0800, Inochi Amaoto wrote:
> > On Fri, Oct 17, 2025 at 08:16:17PM +0200, Andrew Lunn wrote:
> > > On Fri, Oct 17, 2025 at 09:18:01AM +0800, Inochi Amaoto wrote:
> > > > As the SG2042 has an internal rx delay, the delay should be remove
> > > > when init the mac, otherwise the phy will be misconfigurated.
> > > 
> > > Are there any in tree DT blobs using invalid phy-modes? In theory,
> > > they should not work, but sometimes there is other magic going on. I
> > > just want to make sure this is not going to cause a regression.
> > > 
> > 
> > I see no SG2042 board using invalid phy-modes. Only rgmii-id is used,
> > which is vaild.
> 
> Great, thanks for checking.

Hang on. Is this right?

The commit says that SG2042 has an internal receive delay. This is
presumably the MAC side.

To work around that, you map rgmii-id to rgmii-txid for the PHY, to
prevent the PHY from enabling its receive-side clock delay.

It seems to me that you're saying that rgmii-rxid and rgmii-id
should not be used with these MACs, and you're fixing up to remove
the receive-side delay.

"rgmii-id" doesn't mean "there is a delay _somewhere_ in the system".
It's supposed to mean that the PHY should add delays on both tx and
rx paths.

Confused.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

