Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F253C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 12:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N3zAADUWYmg6MnWP7lx8XkjYe4YOB+urybqd0LojM+g=; b=KEE/1xyFjXyQQW8rT120zWIiCm
	WhU0W+jGpkQLJRhTaVrhiH3Fen992PGXH6BAUfPiqXTmhA+vzeOCg44gYLJ1oyPyitSkrLIEHnb57
	xSrk7HUjCSPk07fwNtIeMB72iRMsymuxMaOKwF8baJw19BqNmOIa6yDN2PH/myXCSFoEs3DMSk77x
	ZFuuv82DkdpLAQaGeoNqgQfI8QfSe+fUe8h8MpiStAm3jlRFLeF0pQ+hz9QIoveCd3B3uYuasDDJK
	CBSTg6FOFLEV72Ec0sPoGZZd+1YTIQo1QVZkHO9Ll5YMJ5Ip9IoqGReBjqKp/IuJphKzyQIjJ6QDP
	i+Pbs0xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8zOO-00000005HCx-3d7U;
	Tue, 22 Sep 2026 12:14:36 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8zOL-00000005HCT-1x7J
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 12:14:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=N3zAADUWYmg6MnWP7lx8XkjYe4YOB+urybqd0LojM+g=; b=sABnGHj5WECTpWvSh/0ZTFobE3
	t+EMo74agGY7Pbl20OtCRr2EoT105e66LwTQteIg7liCFbKJ76yQGd/dG8dU70SBjhbulh9eQ7rfv
	hXN5wqSs74AFco8vuoLqdcC7/l2wWz7xoqZd/b6iSrpr6t+OKmpwC0RTG0+fGHemhJfw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1x8zNy-006aAe-66; Tue, 22 Sep 2026 14:14:10 +0200
Date: Tue, 22 Sep 2026 14:14:10 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Joakim Zhang <qiangqing.zhang@nxp.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Tiezhu Yang <yangtiezhu@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	Richard Genoud <richard.genoud@bootlin.com>,
	Alastair D'Silva <alastair@d-silva.org>,
	Maxime Ripard <mripard@kernel.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net 1/3] net: phylink: allow stopping a suspended instance
Message-ID: <231c84e6-7ead-497e-b2f3-ef19cfa1a978@lunn.ch>
References: <20260921-submit-stmmac-reset-fixes-v1-v1-0-87a4e431ee00@gmail.com>
 <20260921-submit-stmmac-reset-fixes-v1-v1-1-87a4e431ee00@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921-submit-stmmac-reset-fixes-v1-v1-1-87a4e431ee00@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_051433_504651_46F827E7 
X-CRM114-Status: UNSURE (   8.22  )
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

On Mon, Sep 21, 2026 at 10:54:02AM -0600, James Hilliard wrote:
> A MAC which cannot restore its hardware after system sleep may need to
> close the network device instead of calling phylink_resume().

You need to explain this in more detail. It sounds like you are
pushing a workaround for a broken MAC into the core of phylink. This
is generally wrong.

	Andrew

