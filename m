Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77843D65525
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 20:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8bk0eDi4lhzSA0jEmiEZSOhunHrYMNImxYTUhwQ+4mo=; b=BVegEC10xnn3M/QTVhpOxOmu+X
	uWCGXmqHYXfodGERLYC6rzuoiBGV6aoELmsWdI171H24t7xzMMx5CVbTknO+QwzswLTwhzygK5rwP
	q6TqVATTh5hCEdqAB4fTwQwBdbxxcLPsKBFOmPkg+pYYrPNYrMR/HkgPkDdyGvfH9fmNo9fN0VNvJ
	ZtWhzeH1WRgb1K5bf6YQlktCWJm5f2wXuUD5A7GPLPBG73wtTJK7mVyw2hK5+I1S1fCCVe7eRcMTt
	oqQtYcoll7uafWlh5kReTUMWysOzO9LueRNKA+J7hhFhs1OnYtPhVPh06a1T8YIyfyumTCcNfIF08
	6U+qymMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tG2dJ-0000000BhPr-2OhK;
	Tue, 26 Nov 2024 20:58:05 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tG2cK-0000000BhJ9-1bRS;
	Tue, 26 Nov 2024 20:57:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=8bk0eDi4lhzSA0jEmiEZSOhunHrYMNImxYTUhwQ+4mo=; b=wx9R1gAjXtyw7VRv8VzC+CBjfB
	zy/UdOGExHBw7LZgdoAqOacDJ2KHU5JO87lWgMemogbZc/H9BkbfZWnQ369rnwIvWxCtZ9v4nuQe0
	LbF2L6auyTVFpgoi+sZ3RZ6x2Th2KbJns+PJof+n/evLF8fAS9PhFJ4qIEDCc8urY9U0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tG2c3-00EZ5A-Tj; Tue, 26 Nov 2024 21:56:47 +0100
Date: Tue, 26 Nov 2024 21:56:47 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Alexander Couzens <lynxis@fe80.eu>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Daniel Golle <daniel@makrotopia.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jose Abreu <Jose.Abreu@synopsys.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Marcin Wojtas <marcin.s.wojtas@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH RFC net-next 04/16] net: phy: add phy_inband_caps()
Message-ID: <4484cd63-87f7-4b3b-8251-b99b35b4d3a8@lunn.ch>
References: <Z0WTpE8wkpjMiv_J@shell.armlinux.org.uk>
 <E1tFroB-005xPw-Vd@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1tFroB-005xPw-Vd@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_125704_422294_E72CC7F8 
X-CRM114-Status: GOOD (  15.81  )
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

On Tue, Nov 26, 2024 at 09:24:35AM +0000, Russell King (Oracle) wrote:
> Add a method to query the PHY's in-band capabilities for a PHY
> interface mode.
> 
> Where the interface mode does not have in-band capability, or the PHY
> driver has not been updated to return this information, then
> phy_inband_caps() should return zero. Otherwise, PHY drivers will
> return a value consisting of the following flags:
> 
> LINK_INBAND_DISABLE indicates that the hardware does not support
> in-band signalling, or can have in-band signalling configured via
> software to be disabled.
> 
> LINK_INBAND_ENABLE indicates that the hardware will use in-band
> signalling, or can have in-band signalling configured via software
> to be enabled.
> 
> LINK_INBAND_BYPASS indicates that the hardware has the ability to
> bypass in-band signalling when enabled after a timeout if the link
> partner does not respond to its in-band signalling.
> 
> This reports the PHY capabilities for the particular interface mode,
> not the current configuration.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

