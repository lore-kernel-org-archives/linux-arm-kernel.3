Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E38F3C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 13:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LurvroALJiFFUqQVBPfZNyUS7B5O5JecXIdBbGhWMuQ=; b=tbL386LRtjtBRbG00cxI6WydH9
	wstRe36/EHljDmfi8UbWKMfLNrpUngsHAWt70MMhnk8OlB2imnEwVd/OLvFJLAOhY51gOj/JXSCpa
	tNyknbN8P9zgxoEYZ/8/vsWMWnTlZwId7dpppQROukM1jYrKDXbSJrJN7JU9rXqin8bEKHSz1mox8
	ReU6mNCE65bMmbZtbM+VC34tMM70h1fbblmqf3E+YyrJ2yRJeALOFxvGt4+anX6+9XEl8SEwZNmgh
	iLfEOPQoMV7fTEaqWcKGbLsCJUtGm4hwYxGgT8e+h72nyluFOADAdjUvCY0bLHv1EGySlwfpbw9zw
	M0rPeGFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsiiD-0000000BOi6-2w9U;
	Thu, 13 Mar 2025 13:35:01 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsig2-0000000BOUC-3IYu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 13:32:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=LurvroALJiFFUqQVBPfZNyUS7B5O5JecXIdBbGhWMuQ=; b=f6kUMBlq4MkGaeexc5NT0xriiQ
	4rpww/4LWQ9zSeK9gC5NNzyJhfrpLUk75OQbZ9wL1/Yoim+9fhE7LDC6F1LpU16RGniRZpDMhGuJB
	2B/X27ncZjcp99C3NML0rT8VGHfnL2xJB9Kaq4HqqdyHL5YCt/gjeCqb0UMjUS6gyXuM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tsifp-00505E-BD; Thu, 13 Mar 2025 14:32:33 +0100
Date: Thu, 13 Mar 2025 14:32:33 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Joao Pinto <jpinto@synopsys.com>,
	Lars Persson <larper@axis.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net] net: stmmac: dwc-qos-eth: use devm_kzalloc() for AXI
 data
Message-ID: <a889db9a-1aa9-4a17-9762-01c74911e39b@lunn.ch>
References: <E1tsRyv-0064nU-O9@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1tsRyv-0064nU-O9@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_063246_827354_BC58932B 
X-CRM114-Status: UNSURE (   7.60  )
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

On Wed, Mar 12, 2025 at 07:43:09PM +0000, Russell King (Oracle) wrote:
> Everywhere else in the driver uses devm_kzalloc() when allocating the
> AXI data, so there is no kfree() of this structure. However,
> dwc-qos-eth uses kzalloc(), which leads to this memory being leaked.
> Switch to use devm_kzalloc().
> 
> Fixes: d8256121a91a ("stmmac: adding new glue driver dwmac-dwc-qos-eth")
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

