Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCF20C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 00:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=byxZ3eQ63Vk9Fkq/DUT6PLJClKF/+WKsC5v2xz1cokk=; b=o41FvJr6ImnhFtzXFtaNfLNkoA
	UtqEy5c0wQvljWmkEzFqHOkZ9ALjygaeebQqUJ9BX427eYFXvoCV+Q58yYMrb9z6ktbdqgUyZ+sqy
	50GwPdbkQ98r8nvlhtC85Wn21jKnUFwi5xxp+GWxki4HOHGIFtmagdOpeNJwO83DDtg35ohoo8kxj
	bhH8BgYwMnHs2Jox5uN1t6UVuOxKhV6cJe9xZN1wu6ZJCYIcaSZYzWjdWpTQxRthMbvmAlADuGIaj
	D0JMOtyMn1MPazdvscFuwoA1UAIwC2/LTMrg4w5ubgTbs7JZV30HYPrCszKou1wsWSjTjYhH3pOP1
	vfWEW5Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9B2a-00000006o8x-1Nl2;
	Wed, 23 Sep 2026 00:40:52 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9B2X-00000006o8N-3wUU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 00:40:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=byxZ3eQ63Vk9Fkq/DUT6PLJClKF/+WKsC5v2xz1cokk=; b=fVSSknXLY7SnkYsBrHenn0upvD
	aCkBvgdZGdFKY8xc8qqCgV4BXxncsWrorpDQpA7dzXqKYnXMpv8ZuUg2OT57RUdvjpSgoGn1Ig9uI
	NJqjRnaIo0uAhvaZHeSK2FLg23ECawRMG5qlDi6lMsF/tWZmExgMpuBkDSNSSS169eD4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1x9B23-006hOo-TG; Wed, 23 Sep 2026 02:40:19 +0200
Date: Wed, 23 Sep 2026 02:40:19 +0200
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
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Richard Genoud <richard.genoud@bootlin.com>,
	Alastair D'Silva <alastair@d-silva.org>,
	Maxime Ripard <mripard@kernel.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org
Subject: Re: [PATCH net v2 1/2] net: phylink: allow stopping a suspended
 instance
Message-ID: <f93298c9-33b1-4954-a213-828925df30a9@lunn.ch>
References: <20260922-submit-stmmac-reset-fixes-v1-v2-0-d92e609be996@gmail.com>
 <20260922-submit-stmmac-reset-fixes-v1-v2-1-d92e609be996@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922-submit-stmmac-reset-fixes-v1-v2-1-d92e609be996@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_174049_977296_9C574762 
X-CRM114-Status: GOOD (  10.11  )
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

On Tue, Sep 22, 2026 at 05:27:40PM -0600, James Hilliard wrote:
> If a network driver's system resume fails before phylink_resume(), the
> network device can remain administratively up with phylink suspended.
> Closing the interface then needs to terminate that suspended instance.
> Calling phylink_resume() merely to make phylink_stop() work is not a safe
> substitute: resume reconfigures the MAC and restarts link resolution,
> although the driver has not successfully restored the MAC.

The first thing phylink_resume() does is:

	if (phylink_phy_pm_speed_ctrl(pl))
		phylink_speed_up(pl);

Is it guaranteed that phylink_stop() followed by phylink_start() will
somehow do the equivalent?

	Andrew

