Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D400DCA1012
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 02:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rxc+WFScWaMWMshrOaUEfaLNiPNmyIGxiIMV1CB7UL8=; b=vZ8816nFvgRAMZlkOE089kgvI/
	lUZlLO9u0dlWd5NsDgloxMiIfUIvZnYH9stbL/sW4arAnAu7m3lGfhqmQonwDyFAtXAT8B43aLKTb
	8Jx+V7jn7qr1qA9YJv2BhuOgZb/PHKg6rj7IyVtkCZc+rYo3mkvyHDBJk/Rb+/vtLZKUHTrwsCUzs
	bGyC9A/y7EKShMKHNMqJGPQt02VN020XuQAsvoyfDXI9r7mVHFaqLYdn8xmGgywZ6W8xkHr6drMB1
	gYG37dITkUP3C278KG8tt3ru9ciCeo6M3APw90QfCZTn3GNi6NFDf7naxCR6C0uIbpDlUfJd+1pf9
	dUloa1SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuM1Q-0000000Fz19-3dxK;
	Fri, 05 Sep 2025 02:17:52 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuFAY-0000000DmGh-0dAm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 18:58:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=rxc+WFScWaMWMshrOaUEfaLNiPNmyIGxiIMV1CB7UL8=; b=a1rNGZzoQR5nHNAhRMsWPrO4Ep
	zsM6tGyCruRbEEuRXTz01MC43O6E43UJ9qJDbLLboGM+/+hIMKfpC3QRtONnpxfls5QaLXaDBcLBD
	5so+8jsQGED0VK32X6QJV5sY5biwZTVsaiKtJLkqehdWBoRky26DFOXgR+1WWuBKqkhU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uuFAT-007G48-9D; Thu, 04 Sep 2025 20:58:45 +0200
Date: Thu, 4 Sep 2025 20:58:45 +0200
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
Subject: Re: [PATCH net-next v2 04/11] net: stmmac: mdio: move
 stmmac_mdio_format_addr() into read/write
Message-ID: <3e15839e-5bce-496c-82c0-9ac95cbd9b79@lunn.ch>
References: <aLmBwsMdW__XBv7g@shell.armlinux.org.uk>
 <E1uu8o7-00000001vom-1pN8@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1uu8o7-00000001vom-1pN8@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_115850_185666_B0BEB714 
X-CRM114-Status: UNSURE (   6.74  )
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

On Thu, Sep 04, 2025 at 01:11:15PM +0100, Russell King (Oracle) wrote:
> Move stmmac_mdio_format_addr() into stmmac_mdio_read() and
> stmmac_mdio_write().
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

