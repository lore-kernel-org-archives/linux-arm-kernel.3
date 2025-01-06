Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A63EDE77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 17:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VS+0b0qDAmY2DVRpWtJdhv1Wj/jUpe1PN7cG2IVVK6s=; b=djSQFtH788s6Tb2j993MmT3av0
	EXZkR+3LZ6RLmYJXodAzsDoFK07uuFoVMIFhgG2avTrwZMzzGUovne+ml7b1x9wjlB3Qn2hwS32Y7
	cR9feBZC4s6Ey/7qJ+qeJUT5h60YY+X9oaKMEUcQDoeaRYdKmRBDi8QBM8vNQ3X8U9NJhTJqtyZv2
	pBQ786QZjyiGoDNlLLUIuCJ4sAADHLgFHtRryx433ZCfa2xPMdMkPaloO/pfpZDSnjq56SI6vr8h+
	RbHprq0JQVpYgX5FYKM75BK+8jrwmgRY++qrZXT3eaoJVh3IDgXpjmZMqQUuJqZUFktJDrptmMHMY
	WQ+PPpUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUqVn-000000023dQ-1crR;
	Mon, 06 Jan 2025 17:03:31 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUqUc-000000023Xi-3iew
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 17:02:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=VS+0b0qDAmY2DVRpWtJdhv1Wj/jUpe1PN7cG2IVVK6s=; b=48N32v4mh61pgqdp728cPK8txe
	rsVkq89Q+XfRbVFnYlfltPXT+2NRuPeZy0GIX3l5I0rLRzM+aAHGmPP1jr8gHI1fTfPbCEuwzAACy
	S73OkkWiOP53ILosOVld/5x3N/GRDdMEhKzVmYmh65eRw/8AfEbG4CZO+MAwIUugONCw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tUqUT-001wHK-RT; Mon, 06 Jan 2025 18:02:09 +0100
Date: Mon, 6 Jan 2025 18:02:09 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next v2 09/17] net: stmmac: convert to use
 phy_eee_rx_clock_stop()
Message-ID: <a0fca6b4-9bf8-45dd-9ac5-0cc94cfe2195@lunn.ch>
References: <Z3vLbRQ9Ctl-Rpdg@shell.armlinux.org.uk>
 <E1tUmAj-007VXV-Lb@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1tUmAj-007VXV-Lb@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_090218_925304_18736B29 
X-CRM114-Status: UNSURE (   8.14  )
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

On Mon, Jan 06, 2025 at 12:25:29PM +0000, Russell King (Oracle) wrote:
> Convert stmmac to use phy_eee_rx_clock_stop() to set the PHY receive
> clock stop in LPI setting, rather than calling the legacy
> phy_init_eee() function.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

