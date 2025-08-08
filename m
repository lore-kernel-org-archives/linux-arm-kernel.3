Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 737C8C87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 13:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6DIZIE2XWtJ0IHcXz/f0LbG01WOu6+XfF1vcnpU/qwg=; b=ROTz2w8NSnOSg5SApwIhRemzYT
	6m3c1zLQkvkdH+oDaBcbM1E1ck0BCK/RMI06Z9jYz6aEFcxrTj+Ph8JE7C0L1bQYIQy38KRXoa099
	ZSgHZF/FtPRoVSozmF43/VS+DxHvEIWKUKXoJWr5JtlGdQ2/7nhxH9pdLqFBBM++K3Qt6wo0b6W5K
	g0Es+hCb6MxfhUfBRDxoYwizGAil0Vag6Fop82sIi/D2pv3725/TjMzoKPqQ/VXyVHd2d/Rrv5sCt
	GlOowfsm/bx7mdsge/dXuPV3XnQXSJgPOduRhRhkSWP3nunlhOptoyYxAVK+CSomlJdHA1DdSgNPx
	cmlOY1jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukNdO-00000002yUj-1pRW;
	Fri, 08 Aug 2025 13:59:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukNar-00000002yAi-2mvc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 13:57:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1D5665C6832;
	Fri,  8 Aug 2025 13:57:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29736C4CEED;
	Fri,  8 Aug 2025 13:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754661432;
	bh=AgMrnqxhNaxCNBFzW1CbjSj7+1BQvkwh3Ak4/ManYq8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n2EzPM4nZP1QcAlZ2twuc6dYXtrX046zg9nolGES4MFdm9zE1vVUiCwVbbZcrZUkq
	 8MsDCMRT/j1bJ1by3EKEKcJ+EyKNVRQyRaNZaQZAv9D5S2NVYU+6+w4wIR9kkAdl8G
	 YEK5X/uSDR5qfFnqqWpQiCVTLFHoflYMh8ZYAmuRA7upA/QBkKt8DE+43Heob76niF
	 s0fxTYvCxFbM1rqIUIXv/tmoMUSTtQoeIBRojgMhHTwJkHrL2Okg15442yUdORHMMc
	 NsN+a7LihHhlyyD0Z1MmnOMIDrdSbHVirL1Cw7/xiOBCNhQtdcAqnQds49wexNRLz9
	 oF6XD8AsFZAwg==
Date: Fri, 8 Aug 2025 14:57:07 +0100
From: Simon Horman <horms@kernel.org>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, David Wu <david.wu@rock-chips.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net v2] net: stmmac: rk: put the PHY clock on remove
Message-ID: <20250808135707.GE1705@horms.kernel.org>
References: <E1ukM1S-0086qo-PC@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1ukM1S-0086qo-PC@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_065713_737771_4F6F9721 
X-CRM114-Status: GOOD (  14.27  )
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

On Fri, Aug 08, 2025 at 01:16:34PM +0100, Russell King (Oracle) wrote:
> The PHY clock (bsp_priv->clk_phy) is obtained using of_clk_get(), which
> doesn't take part in the devm release. Therefore, when a device is
> unbound, this clock needs to be explicitly put. Fix this.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
> Spotted this resource leak while making other changes to dwmac-rk.
> Would be great if the dwmac-rk maintainers can test it.
> 
> v2: fix build error

Thanks for the update Russell.

This fix looks good to me.
Reviewed-by: Simon Horman <horms@kernel.org>

And I guess it ought to be marked with.
Fixes: fecd4d7eef8b ("net: stmmac: dwmac-rk: Add integrated PHY support")

If correct, then I don't think any further action is required as supplying
tags via email should be sufficient.


