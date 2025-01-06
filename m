Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15182E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 17:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xVK3OuoKPRRhKUwmrmkPiCJ+TccugzJyyYcNsoxCanY=; b=xsCx6GTarzFKpqMzBT9aX986Gy
	FIiic1NvPH5bWb0OpULsckQa2zQBLRTNlyKVFu5Pixy1CBeK+5ebWESRkNnuyajtY1VSGRPI+q/1p
	72RuDdoUfz3CsI6rcSj9+X99upkXVaFeGKG+Sm0ktAm/Fc5rLsRzqdepueo1mx9MVmZQjlC6FcF4C
	Ar7CFKeLwZ7xAWq+G2Xg4W5+xbC7lH1midikRswqehatRNZQCneZ9cr3bJGtbqIRAR5shISPbbFC+
	3nheNfCplYOW8LDC5lxCYo0jDDsYh7bm+KqPbRtYS+F5k67rCn1Bn4W0kddrmXYYNWpY4/jHzCjQG
	ITKhBQag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUqaP-000000024QD-31O3;
	Mon, 06 Jan 2025 17:08:17 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUqXb-000000023xY-0FWY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 17:05:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=xVK3OuoKPRRhKUwmrmkPiCJ+TccugzJyyYcNsoxCanY=; b=LKSdrFhIzCcIlqu3LdHPECSTog
	9L625YOQ9TmFQKNbgmSrFnhIc2MHJRbJw99gkBhyCX9sNvzjdJIsrLq+mFpHB6EgoCtHkiJtTRajg
	u72lYMupNpqfQGJN7Ii1vyqLrh1dV5kM8jzI3n0Am7NUPEscF4bPU6OCgduyofLJX0rg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tUqXT-001wN7-U1; Mon, 06 Jan 2025 18:05:15 +0100
Date: Mon, 6 Jan 2025 18:05:15 +0100
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
Subject: Re: [PATCH net-next v2 13/17] net: stmmac: use boolean for
 eee_enabled and eee_active
Message-ID: <5e8b280b-acb5-4b84-8abb-ee7a48a84004@lunn.ch>
References: <Z3vLbRQ9Ctl-Rpdg@shell.armlinux.org.uk>
 <E1tUmB4-007VXt-4o@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1tUmB4-007VXt-4o@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_090523_094324_93CF437C 
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

On Mon, Jan 06, 2025 at 12:25:50PM +0000, Russell King (Oracle) wrote:
> priv->eee_enabled and priv->eee_active are both assigned using boolean
> values. Type them as bool rather than int.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

