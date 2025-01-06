Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6CD1E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 16:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qna5S093nBbRkl20/MOVRPodP8BDCikiUJuROyhXVgI=; b=s7Belx4Jk5UVWd431Ba6fQtzoh
	3H6kRr1TR/ccPDKMJd7GUO+WXlGFbzfFJH4TZamXVngD83+4ljEYzS7hTY93ld8alf7F8rdtCuobq
	n6YYi2KCqcHGz+uWfXAYMMRGNGOzc/32zWb7Z/Z1Ci6Cga5mpQRwNVw5LDMIO2IuS8G8TYW0hRxEU
	EY9JpJrDTldnuZqDn9/oc2CMNdK5QbP8bmDS3EuM+hh9ehx6qheuxUzjulr56TpaduOleP35EmYnJ
	d/yJMbdUlL5vuZky9+UjEwVj1e+Bn+lWhF4eQ4Uq81FeVK8tM4xxU51LXOjw/xlgf+NlxOhLCKR2Q
	SqF5y+4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUqJn-0000000217y-2Fkg;
	Mon, 06 Jan 2025 16:51:07 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUqID-000000020vY-2Xnf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 16:49:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=qna5S093nBbRkl20/MOVRPodP8BDCikiUJuROyhXVgI=; b=gzbu6GThbiT1OZ4tfL4yvjvSKf
	mTUjX5xfuWPGLoSDw4ewW8YQDy4XTPD5JVHgboHzTQdO73hMlgpiXwh/oNGN4gSAYDFBqUL1bliOl
	6Iobp8uc+VOR8Bh/zjVK64ZDPdhF8Z2YiVvB06QFtk8kAHiuOfcBhW825t3oTEsZ87+o=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tUqI5-001vyd-ME; Mon, 06 Jan 2025 17:49:21 +0100
Date: Mon, 6 Jan 2025 17:49:21 +0100
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
Subject: Re: [PATCH net-next v2 05/17] net: stmmac: remove redundant code
 from ethtool EEE ops
Message-ID: <1b9bf0ad-a929-45b2-901a-b997d7686dec@lunn.ch>
References: <Z3vLbRQ9Ctl-Rpdg@shell.armlinux.org.uk>
 <E1tUmAP-007VX7-5s@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1tUmAP-007VX7-5s@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_084929_642303_8AFFE324 
X-CRM114-Status: GOOD (  11.11  )
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

On Mon, Jan 06, 2025 at 12:25:09PM +0000, Russell King (Oracle) wrote:
> Setting edata->tx_lpi_enabled in stmmac_ethtool_op_get_eee() gets
> overwritten by phylib, so there's no point setting this.
> 
> In stmmac_ethtool_op_set_eee(), now that stmmac is using the result of
> phylib's evaluation of EEE, there is no need to handle anything in the
> ethtool EEE ops other than calling through to the appropriate phylink
> function, which will pass on to phylib the users request.
> 
> As stmmac_disable_eee_mode() is now no longer called from outside
> stmmac_main.c, make it static.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

