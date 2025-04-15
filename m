Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F05C5C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 17:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DSL23HcZL6KoCpUIDVQFu+IE7Bha2qwSLBwjMyfH8eY=; b=YPLndMOe2MldhulTgcqrlzku/j
	El8T3tevAfHlnCb1MDOAqGQcoqIXa0QyknBcTM3ZiHf0oDTR1xsqG6Ia7VeEfsC/5YbLgURSEzypj
	08zoIjqLFyxWbr17VVmWABEyQhyix9FqYAErrnbm5L9v9EEC46k/gnCfg76HcXQcpiO0ad5tvYUfw
	SuMKBRxdbcU0Ne3PX6IOoCF5VbmvX+McdpHF3wcIp+zNYOBCEVG9YuVTOMp4ywoeiLfsBhvz13bwk
	4ryyjlWZm2T1eBCaKfAbUCAdm3CkszifC9bTj8snVJl7wa3mm2Gxo7lyHbcqOtaugc3CQA2AnNno4
	3Y+SeZWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4jtF-00000006X8o-1i8K;
	Tue, 15 Apr 2025 17:16:05 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4jWm-00000006TKM-32KZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 16:52:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=DSL23HcZL6KoCpUIDVQFu+IE7Bha2qwSLBwjMyfH8eY=; b=ClKU8vnTzlxOX7pHD6XKJIbhgf
	Bh7R1xCKtAzahWbm0vUqK8Y7kAbk4s1/OT1ii4znynJo1CeKJSkVx+8OdGL/Xr3B5ikXUZgsHk6x0
	XCAPNOkyoPIHTTvpifSVVtxW5U5EsplQ2yVXKY/ve/n+XAHUjRaY3fZfyyB1usdeTR5Y=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u4jWh-009UTx-Pd; Tue, 15 Apr 2025 18:52:47 +0200
Date: Tue, 15 Apr 2025 18:52:47 +0200
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
Subject: Re: [PATCH net-next 2/3] net: stmmac: sti: convert to
 devm_stmmac_pltfr_probe()
Message-ID: <45094035-3d11-4e1b-ae38-5c4f688cb988@lunn.ch>
References: <Z_6Mfx_SrionoU-e@shell.armlinux.org.uk>
 <E1u4jMj-000rCM-31@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1u4jMj-000rCM-31@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_095252_762683_F3A5B5BA 
X-CRM114-Status: UNSURE (   8.12  )
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

On Tue, Apr 15, 2025 at 05:42:29PM +0100, Russell King (Oracle) wrote:
> Convert sti to use the generic devm_stmmac_pltfr_probe() which will
> call plat_dat->init()/plat_dat->exit() as appropriate, thus
> simplifying the code.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

