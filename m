Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FAEEC71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 23:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7U66mXwcbciGnG8InnXr7UU0BGV3gljAYw3gTyUi1vE=; b=HOEEKaN90TWAsOxzsQwk8V4uQC
	ECjUwNzkr6TTj3O3QPo2cz3O+Fc4PbdHOAnGGVz+PcRutHx5a/fscD8tzCBvnJ3EzIXAIscdK0nMp
	2g4aoSnpbB9HEeOiGO0T9qzR4fmy0U+J07qdIrbNPPIQhZSpIX1sMFirNeUyITlbnqwAmqZBc82gW
	GlyjgfnXwbsIdnAI0QJ5ELjdHda3Q2x5vrAijr7gMJUp194BXw2Pv1A8cejNwL98SkSOum7vwJD1S
	529hlNFBS8T/3ioluf5og/bhL2S2utBZBFs5jROc3VjxXdiii8X5NPrcw2zZXDoALWhi8duaAQyof
	WZFhYTGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRJRn-00000005pxV-2VrU;
	Mon, 16 Jun 2025 23:41:03 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRJNk-00000005pjN-4C2H
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 23:36:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=7U66mXwcbciGnG8InnXr7UU0BGV3gljAYw3gTyUi1vE=; b=E31EaIDTvDlv1TkwMeGCVb9Nkb
	V4ra4rjueNOjW03xxRxzHsIIldKw1n858GPIlkDa9wxvZ3fpik88aDiTmkJl7IPlWK/y/iwVArkVq
	7MtgBF9EvvGfKOqyDd7hpcdD4AcpJoZjy6ej6OaFooKahhh12vjDmcbLTSPAWqDisH3k=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uRJNe-00G6Xm-SP; Tue, 17 Jun 2025 01:36:46 +0200
Date: Tue, 17 Jun 2025 01:36:46 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next 4/4] net: stmmac: visconti: make phy_intf_sel
 local
Message-ID: <cb36aa9a-a9ab-48b4-8259-5e31b69deb35@lunn.ch>
References: <aFCHJWXSLbUoogi6@shell.armlinux.org.uk>
 <E1uRH2G-004UyY-GD@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1uRH2G-004UyY-GD@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_163653_040132_E1FFA316 
X-CRM114-Status: UNSURE (   9.69  )
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

On Mon, Jun 16, 2025 at 10:06:32PM +0100, Russell King (Oracle) wrote:
> There is little need to have phy_intf_sel as a member of struct
> visconti_eth when we have the PHY interface mode available from
> phylink in visconti_eth_set_clk_tx_rate(). Without multiple
> interface support, phylink is fixed to supporting only
> plat->phy_interface, so we can be sure that "interface" passed
> into this function is the same as plat->phy_interface.
> 
> Make phy_intf_sel local to visconti_eth_init_hw() and clean up.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

