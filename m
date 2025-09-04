Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CAA7CA1002
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 02:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2XxwIb9cEpOzD+jKESQeG9xxvQlZKxby81gZM0Qml6A=; b=rJXrsOfWX403nlfHpvM3rj3BOB
	Ox7uZ7b382uk7nqLExyCeXi1FOELF/R4bDFxR6xauhwkawawZv2At7F+vm5LE6tOnIQVCOkh7eNo+
	6zSBBlXPz8vbHSYnlRm2UA6fwHzU0fKGbskPAD7Lo+TyBri+KYonfOHxcTCMC+14up1m4ltwhcn79
	5L15jeMhARN5G3x1YE+5fO5jD74GiOibIzgZlNPcda/jPiR6v5hgfp8CN1YwaA5WphzDdy5rwWJVn
	rmq+nlT7aE6C4PlDBRzCL2B1ylgEbMOTPo43mfClaCA4MODN2cQBFQJoawcj9V32hELg5b9ie0A/D
	5ctpqDog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuM1S-0000000Fz3T-1AIj;
	Fri, 05 Sep 2025 02:17:54 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuFCZ-0000000DnAv-0vqT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 19:00:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=2XxwIb9cEpOzD+jKESQeG9xxvQlZKxby81gZM0Qml6A=; b=xTLoCH3OMnPJ4EIQh9GOeFzWsH
	SVZHEieH5xegTmc3ZnnxpZ8j0lIMxxrVAE8wzG/aIzqVgPiCdSJWHeUUNzrc+CnIy3Yt8pYqTvab7
	MZau6prgjuYt0dAdRk7Jc8QAKuy0hKuFCZgNcoZWFAOR3qNk+cmWUuA24+o/5663TYwg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uuFCT-007G5r-Kk; Thu, 04 Sep 2025 21:00:49 +0200
Date: Thu, 4 Sep 2025 21:00:49 +0200
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
Subject: Re: [PATCH net-next v2 05/11] net: stmmac: mdio: merge
 stmmac_mdio_read() and stmmac_mdio_write()
Message-ID: <fab13c83-157a-41c9-a006-c10aa2392c0f@lunn.ch>
References: <aLmBwsMdW__XBv7g@shell.armlinux.org.uk>
 <E1uu8oC-00000001vos-2JnA@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1uu8oC-00000001vos-2JnA@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_120055_257612_DEE7B7B2 
X-CRM114-Status: UNSURE (   7.47  )
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

On Thu, Sep 04, 2025 at 01:11:20PM +0100, Russell King (Oracle) wrote:
> stmmac_mdio_read() and stmmac_mdio_write() are virtually identical
> except for the final read in the stmmac_mdio_read(). Handle this as
> a flag.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

