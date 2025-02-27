Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A65DBC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 22:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0vW2upRPSd5LLd1via6CVZkp3pUHMr3UQjB71gJgNPE=; b=oIKl2Vi9tjVEKpHTre1HcUtDKY
	uCpV2WFML7Fj+sQ8mYo2NWcgSPlDK3tA2R8Fa7qWSmlxHgnMj/ezYNSdaISHe/Z6V3knf9nSwj5FM
	AxoPT/oHTinllsgCAoIkc8zgmzJFxEFlcwbAE/rxcyVysBhWsPrnG2V6RoO/S00XzgDzC2qWMdryU
	C4Gykg//phTGz7FDJSqr9KpZWYnufWlDvkrFqvvu0dkCa95hREZWjjmp6i9/uA05IdinfcTVaSyRU
	PmSZcZ6n3aaqNx9DP/AO3Q32/zRxTUkossThBGaqfelqrQGLYVr3BYpo6oYsuioxK7/cVoBM5FipP
	6M4qHlBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnmD5-00000008zAD-3gS7;
	Thu, 27 Feb 2025 22:18:27 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnmBX-00000008ytY-0Rxx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 22:16:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=0vW2upRPSd5LLd1via6CVZkp3pUHMr3UQjB71gJgNPE=; b=DMHpKzLamSx1RRMiNoYsM6m+ci
	1szkNqwNx0Bvn9TIM8if0t6a/A/dAc0WPfyi4eABJic8LWrdHYeF57qhQgLzR0LyKAVONHee/0tSL
	oZov52lh0f+TPqk75GsYNQUm2ErXinpjcf1PBFy1fB7HE51/1cl0WErp+cxvrG2Y20E8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tnmBN-000jjN-A5; Thu, 27 Feb 2025 23:16:41 +0100
Date: Thu, 27 Feb 2025 23:16:41 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Jon Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH RFC net-next 2/5] net: stmmac: remove redundant racy
 tear-down in stmmac_dvr_remove()
Message-ID: <c8117288-5ef9-445c-a14d-28b2756e5944@lunn.ch>
References: <Z8B-DPGhuibIjiA7@shell.armlinux.org.uk>
 <E1tnfRj-0057SF-9t@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1tnfRj-0057SF-9t@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_141651_145451_3C413A1C 
X-CRM114-Status: GOOD (  11.94  )
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

On Thu, Feb 27, 2025 at 03:05:07PM +0000, Russell King (Oracle) wrote:
> While the network device is registered, it is published to userspace,
> and thus userspace can change its state. This means calling
> functions such as stmmac_stop_all_dma() and stmmac_mac_set() are
> racy.
> 
> Moreover, unregister_netdev() will unpublish the network device, and
> then if appropriate call the .ndo_stop() method, which is
> stmmac_release(). This will first call phylink_stop() which will
> synchronously take the link down, resulting in stmmac_mac_link_down()
> and stmmac_mac_set(, false) being called.
> 
> stmmac_release() will also call stmmac_stop_all_dma().
> 
> Consequently, neither of these two functions need to called prior
> to unregister_netdev() as that will safely call paths that will
> result in this work being done if necessary.
> 
> Remove these redundant racy calls.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

