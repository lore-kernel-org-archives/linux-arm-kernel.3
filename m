Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C84DBCA5FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 12:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RpxymfVofoWeJsFlJ5P2vwYEqoxBbg4TTGHUHS+KpRU=; b=D/hlPBHBd8hJbOv1zhjK5YIZhP
	54uy1VlvKZE4nH37uLdzTJtRAgXV4JnFLoS8xE3qlJ8snP5Vd5iZ9XgNOQtEekHj/gQRBXyuXnYzM
	Dy787kcT0pValtC6woMFNlw8gZxZy7ejck8CzmjfljklMKUGGJ+Lobj5y0UBYETxittLEcub4yN3q
	e4qefJjSkP7SQ4M9CFxU9GXyA8e/UrdSb/Tn7v2+S+Z4vsUzBKpv5+I+gzWwk6qruzj44mtTRkqBh
	HE/EmTEr53Fs7kHe3cFNMNJM8YQmx8Zi7zdDwv/WZv3usXRtL6xXwAPB1zd7wV50DKALASNDYiAyt
	BCC5WycQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCG5u-000000094md-0R4Y;
	Thu, 01 Oct 2026 12:41:02 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCG5q-000000094l3-0CPf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 12:40:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=RpxymfVofoWeJsFlJ5P2vwYEqoxBbg4TTGHUHS+KpRU=; b=rgsndd40Q7LCqxSRIJxEbwkR6x
	4Dtpt6Qp53kGiTA1b4woTlhPntj/DEUmsYBSwceFU8qojbKK/+Q3NPXVn6qZodt/OrKJK44tBqM+7
	c1KkJ82a5zpjoJ14smol5cMngwBfDJOKDPn0Jwg+MKN6EQJGmI34v+dVuOQVL551qchM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xCG5e-008Nb2-Bp; Thu, 01 Oct 2026 14:40:46 +0200
Date: Thu, 1 Oct 2026 14:40:46 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: iav@iav.lv
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] net: stmmac: mask the MAC interrupt while
 resume resets the MAC
Message-ID: <47a5be82-c09f-486b-a7e3-35e6edb89ad6@lunn.ch>
References: <20260930-stmmac-irq-shut-v1-1-104d1a1dcb28@iav.lv>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930-stmmac-irq-shut-v1-1-104d1a1dcb28@iav.lv>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_054058_259949_A6236A9B 
X-CRM114-Status: UNSURE (   6.94  )
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

> stmmac_resume() resets the MAC in stmmac_hw_setup(). On dwmac1000 the
> reset clears the interrupt mask

For my understanding, it is the hardware reset which clears the mask,
not software?

If it is hardware, that is an odd hardware design.

   Andrew

