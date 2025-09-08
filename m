Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D7B5CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 20:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GM5YS0VBx8Kphkepw+zbMrc9QOjuaXqI+BI+rLpHDcI=; b=iG0g6Xv1T8txBRM+wCEifHsL8W
	WmPdaC6IS80dNY9HJPF79NfmI4Pvf3fxNBMfxWsWnJG/Q3zZbXIuZZDSiTFB7e8CTUTjckPjuD3Oc
	lUTQtVocGjHzQ2vUExmrBejldLDOQNcvJS7Y025aSaGqEirgT9i40j6ltllHLNvOyr3fG2YjKSnan
	sRSEGCTdyKvuQQlN5linr8D2ZVT+ILXv7vVzyP7EanA//aOL549rdyqrvwtLjUT5lnVphU314sV6I
	0UVuVepi+1ZrYJknmOdfTY2GPpfTnbpdDYZ0HWxXEESgjubUaPjdOfsXEpSkQzWuIvciX8zl2ENJw
	V9/ghcdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvieD-00000002F9X-3nAt;
	Mon, 08 Sep 2025 20:39:33 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvf8J-00000000wNc-2L03;
	Mon, 08 Sep 2025 16:54:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=GM5YS0VBx8Kphkepw+zbMrc9QOjuaXqI+BI+rLpHDcI=; b=TcR16sDN44Y2x3ALwDirJzBpup
	LUZUCoTu0QcSQuqWsfB/hRKVEVNeXTi+rG3xMFDHMR6plx0dmlZFbhBYhu9QMIQ+Zu3V9BP1xFVFC
	FBmY5sSZzBTN5nVyDTLXrFizPdwJAdy/RchrrnT7+spz7QKJhgv1n7wZeCE5EPQwlFso=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uvf8B-007gtm-Ma; Mon, 08 Sep 2025 18:54:15 +0200
Date: Mon, 8 Sep 2025 18:54:15 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] pinctrl: airoha: fix wrong MDIO function bitmaks
Message-ID: <583981f9-b2ed-45fe-a327-4fd8218dc23e@lunn.ch>
References: <20250908113723.31559-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250908113723.31559-1-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_095423_591740_97E83460 
X-CRM114-Status: GOOD (  11.26  )
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

On Mon, Sep 08, 2025 at 01:37:19PM +0200, Christian Marangi wrote:
> With further testing with an attached Aeonsemi it was discovered that
> the pinctrl MDIO function applied the wrong bitmask. The error was
> probably caused by the confusing documentation related to these bits.
> 
> Inspecting what the bootloader actually configure, the SGMII_MDIO_MODE
> is never actually set but instead it's set force enable to the 2 GPIO
> (gpio 1-2) for MDC and MDIO pin.

Is the MDIO bus implemented using the GPIO bitbanging driver?

	Andrew

