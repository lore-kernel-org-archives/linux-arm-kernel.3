Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05A29C021BC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 20:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CIpOtzexZO/dRH67+AhOoCDsO/RGYxRqqj3n0timC8g=; b=WnX8sLX4XKePPvI8yKBoLDZMLA
	C4EIIUo121rnptUvCjM49+a1mWXRVio5MuqQ0NwOjHlaNW3d7syX5OM/Nr6+sA60BJBHI28VlWWpb
	iXZYCIN9ZEUNQC8QMi9hNfvz1U+QlgduDg9oRiP8+a3Q/mBjcnpZUD2+0ikEp1u50NLXw/s3thECQ
	GdFqplUz3a9UkdAYgVghutPWwfW7vHVVyHh1bc6S/nIo2Q01Cv5gSjobbkj8m+SMgNiYCpuETIm3J
	MtkTt3R1LyozsWBiyENGgngz+aGs23wD3kcAPL3pPjKyw1CdtoG1BlYes/MlRBG+h+Epd3FMjp83F
	M3D5s1uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmeqJ-0000000F3p1-3YAQ;
	Mon, 24 Feb 2025 20:14:19 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmelV-0000000F2vf-2N4X
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 20:09:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=CIpOtzexZO/dRH67+AhOoCDsO/RGYxRqqj3n0timC8g=; b=H0oe1VznxZ+3gZ7FcXbrYJTeo7
	yxeBZIA8motT+W/P4u64SIUSjzce8cPrIyeQqmAkDzU9aBb/w9DMOFHMBL6avSS0mIeD4JzcQve2Y
	KFFOhpSctHVsh5mel5IYWbydPI8jcIUAJv/NxpnGfcc2X/4aHStGLZHtAQrdVzTUipAw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tmelQ-00HHSc-4g; Mon, 24 Feb 2025 21:09:16 +0100
Date: Mon, 24 Feb 2025 21:09:16 +0100
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
Subject: Re: [PATCH net-next v3 2/2] net: stmmac: dwc-qos: clean up clock
 initialisation
Message-ID: <aa8e3e8a-0999-471a-826b-c1b5886866e1@lunn.ch>
References: <Z7yj_BZa6yG02KcI@shell.armlinux.org.uk>
 <E1tmbhj-004vSz-Pt@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1tmbhj-004vSz-Pt@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_120921_601008_99177D07 
X-CRM114-Status: UNSURE (   7.64  )
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

On Mon, Feb 24, 2025 at 04:53:15PM +0000, Russell King (Oracle) wrote:
> Clean up the clock initialisation by providing a helper to find a
> named clock in the bulk clocks, and provide the name of the stmmac
> clock in match data so we can locate the stmmac clock in generic
> code.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

