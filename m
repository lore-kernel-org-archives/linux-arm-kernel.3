Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45FE1C71159
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 16:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kg6c7DN2SkuP8SyVzQMU1kpx6c5rN2uQONdKzQO88P8=; b=GGvWbyegJIZZLd9e7Xxc907vhS
	NA2X7bXO5aD9yLGlZ1Y4lD/uyl9q/pP7zKuHpfBdxHyubvpji6UF11pp4E1Ru4GF57LN1dVvSYeCg
	A387mzGKx7K2FxKYmpAkxyVgLKzOvz9OexoTS+X8+9+opfNedKxquQpDNE/YhuuRhPYORL7y1INd7
	n9U0Kb8sHKz2Z8cEyWPu+UIpvdNtCLF3HAYavcobfs5KmQ7JHQGGnN5LJZmZmFVgN4k3a1i/jmmvH
	SGOvGO5zeCLUNL4l5aWkc6IL3EsnfHYCHtyPwzboIrPy/NflyziWOReehKirbgcO7vI1/NEIDwj6i
	Hitf66fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRCqI-000000051dF-1MXS;
	Mon, 16 Jun 2025 16:37:54 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRALi-00000004chY-2KGn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 13:58:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Kg6c7DN2SkuP8SyVzQMU1kpx6c5rN2uQONdKzQO88P8=; b=Bc7MEjpxSz2rtE+MQ5cF1Xf0Aq
	FWU4V7snbXOIFZBpyiDqsh5XKtYsgp/FyzzBUJHx3reL6TwmBpeC0W+2tv0/Jn5mF5oe3UuwzIv1d
	U/htPOQ4CCEpITmr4A1dwqow/7BZqcRdXb52GivUpqzVS0YpnZxyjHAmxLBNccmUDHyM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uRALd-00G3AG-9h; Mon, 16 Jun 2025 15:58:05 +0200
Date: Mon, 16 Jun 2025 15:58:05 +0200
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
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next 3/3] net: stmmac: rk: remove unnecessary clk_mac
Message-ID: <66519abb-cf5a-4534-9e54-82850e11c15a@lunn.ch>
References: <aE_u8mCkUXEWTzJe@shell.armlinux.org.uk>
 <E1uR6sj-004Ku5-HR@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1uR6sj-004Ku5-HR@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_065810_590387_AC34032C 
X-CRM114-Status: UNSURE (   7.68  )
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

On Mon, Jun 16, 2025 at 11:16:01AM +0100, Russell King (Oracle) wrote:
> The stmmac platform code already gets the "stmmaceth" clock, so there
> is no need for drivers to get it. Use the stored pointer in struct
> plat_stmmacenet_data instead of getting and storing our own pointer.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

