Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2904CCA1002
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 02:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OGqMfvzN+RX7Fb2jN99pOzet46JCEP6Ns/m1waPPGeY=; b=wEZfRZU7EeGCrwegEJMu4I7hIt
	8kHVkcPY18pg6jLttqPzgfDF90pyqt1KVypb54WYgpg4KL9gg77zrwWmnjWqehbEcK+ttPuVRxDhn
	puVVceP5U5kKYIlh2Jj/JcmntjZNw7QVu4zQYboTbdCu8JKly2YJEuBu5sjdOQqzvIWHls7AJ7LBX
	m4SjooxCcwO2ew5zuxumCAjQ8WMp6QQw7lUPVvltiB95cqN1AL12Vch7ZSSLK137ADef5U11A7X27
	z0KlhVn1WEZXD9YLGH1pUtehzd/mGTR6OLLhsUFcqpEbZrnfUrRv1jMtj0PuNDKsLFvaQQJMA5tKd
	qB4MNmiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuM1f-0000000FzTS-42pa;
	Fri, 05 Sep 2025 02:18:08 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuFHj-0000000DoZS-3iwl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 19:06:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=OGqMfvzN+RX7Fb2jN99pOzet46JCEP6Ns/m1waPPGeY=; b=gziWJT8IaDrMtYth2Bj5gtAKKo
	i/ZuviPGV1xM7m4gD1C89+tn3QfECIZaugNDpekVxiEnc1rPZIs+/CEaTG9G0SwytKMwNLbyrRd75
	ziDoGkUjoM9/UP0qwlHnmlJQcVAuoUJ9WE2Euy6jnFagtdrJD5K943adUgPQjrkHxR94=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uuFHf-007GBa-4S; Thu, 04 Sep 2025 21:06:11 +0200
Date: Thu, 4 Sep 2025 21:06:11 +0200
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
Subject: Re: [PATCH net-next v2 10/11] net: stmmac: mdio: remove redundant
 clock rate tests
Message-ID: <cf78e814-a058-419e-ae7e-f84da4c47a8d@lunn.ch>
References: <aLmBwsMdW__XBv7g@shell.armlinux.org.uk>
 <E1uu8oc-00000001vpN-0S1A@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1uu8oc-00000001vpN-0S1A@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_120615_927690_01E9D6C1 
X-CRM114-Status: UNSURE (   9.54  )
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

On Thu, Sep 04, 2025 at 01:11:46PM +0100, Russell King (Oracle) wrote:
> The pattern:
> 
> 	... if (v < A)
> 		...
> 	else if (v >= A && v < B)
> 		...
> 
> can be simplified to:
> 
> 	... if (v < A)
> 		...
> 	else if (v < B)
> 		...
> 
> which makes the string of ifelse more readable.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

