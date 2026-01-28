Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77959D25B78
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 13:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J0KcY7Fsfvbjfd/GXsJlX0QhIkev7bIX3GqdcG+qxZM=; b=TQx//SxXfC9s2mscD+RLji92+H
	sRkRP9d2f8440s7MIZYv7ULUIyCUnv+M6J3j/RwDBRJvJIoNXtyck3wxMOW8ahdZJrlQ1eUSkv3xe
	EdA+c+PAFol+Fa8t9mwXhuRIMxZVLAfnT7JubAghIyr2tjQmRxZXen2nKv5GXhOxRR4QXObVQM7+C
	KlskIg/QntHLJo8DsEYe4v/jzu/CDxN/niDvP87VfhsDShKNIOZYgq8/mXNKusByGbxIpzOlEoaQA
	yO3uymQ590Nyuja78ETIyXUOmTOH1A5NoM8aLmmIDqct8FJfkdoXlg86+y1CXnS5E+o2cAVkl03x/
	LC2YWezQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl5gU-0000000G52g-0f3O;
	Wed, 28 Jan 2026 13:34:14 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl5gR-0000000G51D-0hNM;
	Wed, 28 Jan 2026 13:34:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=J0KcY7Fsfvbjfd/GXsJlX0QhIkev7bIX3GqdcG+qxZM=; b=V7PWZBKMvlEZzzoE5wl2irsdY1
	j0GjLSrReUh6U4SNiHG9ctT1LbAY00sSG267v5t0tnx8QsVhqsj1f+8EglDOHih1+liiJC+oSoWQJ
	Qrr/NCuk9YI2ODkGi8cX3Gy+upz8GAIYHIC5sHCTFBH27LpTYUBCUu9Ir69TWpm/2saM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vl5gG-005BWr-8a; Wed, 28 Jan 2026 14:34:00 +0100
Date: Wed, 28 Jan 2026 14:34:00 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Heiko Stuebner <heiko@sntech.de>, Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH net-next 1/3] net: stmmac: rk: fix missing
 reset_control_put()
Message-ID: <30e0bcd5-6366-44f5-8d79-8a2eb3560246@lunn.ch>
References: <aXnrzIbZN-gaZTia@shell.armlinux.org.uk>
 <E1vl3Fv-00000006v3L-215v@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vl3Fv-00000006v3L-215v@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_053411_204357_07209FB6 
X-CRM114-Status: UNSURE (   8.98  )
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

On Wed, Jan 28, 2026 at 10:58:39AM +0000, Russell King (Oracle) wrote:
> rk_gmac_setup() delves into the PHY's DT node to retrieve its reset
> control using of_reset_control_get(). However, it never releases it
> when the driver is removed. Add reset_control_put() to rk_gmac_exit()
> to clean this up.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

