Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3686CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 20:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6CrXeVHCCjWAnUHKzdRq5G94t14tfPK4no6FrPxZGYw=; b=NxMx+xBGYZEWdpdTaK4jvziw9F
	l14ezolIGFm8eoTv47goFbiU94Gl7qB1LmicbsEnLyYZl5WDqWJLtyRlkj64Z2+6UBFSakgCTbrXB
	Q555qHXh1KBy91beZ2N2a7r3vwXk1Wh8i2s5Ln8lCnjsnIOrvJhOhDVSbrFBRZnI9CUWl/PTzQI7w
	yNpmvIN/Z/O03psPnyematqjyNtEL8vdZJmQI++pEWv9h9uMImUgTyGCSkBQRPZD6tAa+xiOyPh2s
	N1eF4NFjS4fbUrgyWU7AP6uA0+JBNFFofsBsqZRdddwyU7l/O53d98wBeKZHqoFFFNWdHahUmbDqw
	V+UwTbbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9UO6-00000005s8F-1aYZ;
	Thu, 16 Oct 2025 20:15:50 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9UO3-00000005s7u-3yPO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 20:15:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=6CrXeVHCCjWAnUHKzdRq5G94t14tfPK4no6FrPxZGYw=; b=q0Q4e/vJgMozlhWcnumOuOJYFJ
	GvKGIg+N7XvWRNfzA94l0+H16ee2tKF7shqGNLB1lVaHSM15FcjZ4Bc2uzZljHBUYLyAHz/4IKgiK
	WgzP0TnQGBfX8/JMQ2pLgN9M67EX2Nv3VLIjkZn5hiBRE3E+6J+/Z9n0mdUtdGeY71fI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1v9UNy-00BCfC-FC; Thu, 16 Oct 2025 22:15:42 +0200
Date: Thu, 16 Oct 2025 22:15:42 +0200
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
Subject: Re: [PATCH net-next 2/5] net: stmmac: place .mac_finish() method
 more appropriately
Message-ID: <43d3c43c-ad4c-4a4e-96fa-d6cb026bf63f@lunn.ch>
References: <aO_HIwT_YvxkDS8D@shell.armlinux.org.uk>
 <E1v945O-0000000AmeP-1k0t@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1v945O-0000000AmeP-1k0t@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_131548_092699_9BDB27D7 
X-CRM114-Status: UNSURE (   7.45  )
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

On Wed, Oct 15, 2025 at 05:10:46PM +0100, Russell King (Oracle) wrote:
> Place the .mac_finish() initialiser and implementation after the
> .mac_config() initialiser and method which reflects the order that
> they appear in struct phylink_mac_ops, and the order in which they
> are called. This keeps logically similar code together.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

