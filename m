Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EBAFC5AD7B
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Aug 2026 17:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eg7DRK6dMUJej+ht+LW9yIFJ4JaBecaPx8FR8PWTaeA=; b=p7oFOVFryqcaqT0LsHP+RdsCRG
	cx8qi/48Si7PEwfMQDEaFme0p+pZjMvC77bFPZ3NtaQZ+HW0jxo5+aCeRBzzzo6xp1uRMiW6HzJ/Z
	oSNKqfrN77RmNFSdUQ5b1+FOrjDBQ7B500vFiRreQNqV2j8XDINHWgNUhK47GzzSvKhwaSEWKPTkA
	n4wU+xn1KrzeHr5Hc8Vlf5tj0bMGJ6eQ69+ulw90+/eCPoMk4HQ1Lnse6Hskp6Dv4SBemwK0vztXY
	ZjJ4vUxm50k4hMMMcZJyN8SqVHm9U1HSeo3qDCBEm91zd/p/l9+PI/6o6eSpRTX5UG/qDKSQG09+e
	85lSS0Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt7aA-0000000AYNF-31G1;
	Sun, 09 Aug 2026 17:45:10 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt7a8-0000000AYMo-1dxA;
	Sun, 09 Aug 2026 17:45:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=eg7DRK6dMUJej+ht+LW9yIFJ4JaBecaPx8FR8PWTaeA=; b=C3nZo2n62+uKCCnCUZs/k/kw1Q
	/sKvWP5860UuBFknFOYWHzw0S8560ib2H1PAO/rV+/icA9W6bfCBdg+GBsdBvZ7/qUUr1//nnO5D3
	XJJXKG4aCO4sAfaMjs+jZR/v9dvTUDAoXvevblCehV4mZjObRmrKqIn1YQyKrxZNnJlc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wt7Zv-00Gq0k-SA; Sun, 09 Aug 2026 19:44:55 +0200
Date: Sun, 9 Aug 2026 19:44:55 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [PATCH net-next v11 00/12] net: pcs: Introduce support for
 fwnode PCS
Message-ID: <4c595c15-17d9-4c23-bb44-344c48d36e9a@lunn.ch>
References: <20260807131301.192060-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260807131301.192060-1-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_104508_449002_7170DD91 
X-CRM114-Status: GOOD (  10.35  )
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

On Fri, Aug 07, 2026 at 03:12:42PM +0200, Christian Marangi wrote:
> This series introduce a most awaited feature that is correctly
> provide PCS with fwnode without having to use specific export symbol
> and additional handling of PCS in phylink.

One of Russells complaints was the phylink has too many bits of code
for ideas which did not work out and were replaced by new ways of
doing things.

We want .mac_select_pcs to go away, this framework should replace it.
Please could you convert one of the exist users of .mac_select_pcs, so
we get an idea of what that involved. If that conversion is pretty
mechanical, i think we should have a second patchset which converts
all the current users, and then remove support for .mac_select_pcs.

Overall i think the direction of this patchset is good.

   Andrew

