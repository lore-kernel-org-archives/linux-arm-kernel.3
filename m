Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B82E6C71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 16:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pkPX3SdfRcKBJtj9YBuTt4Bunu0ITK5f/bnT+P8APAU=; b=ztgvyO+LT97/O/S+qshHcwk8LI
	YeYXM9yHTCS6IIhsJJ7mw03oVwaIIjeF4IBYuY4u7rjTny0t9YxzKe4sf1MbQgDBU/17SNQKm+cPo
	ySoU1gtYAnkXcSTMHTj3fVygo1I/ig4Lu7bhlESVXi5A39hI5rjNMkyhu0ywFq7Cy0D2kHd+VMy3Z
	Xj/QU64cYU5jyWGWzUBQ3J7P1SM1c/iZILWAWZFUiX3ay1bKB2tvQZcVJFAoSIw2Bq/RzAQlth/f6
	nDk/bm6OaeH3+ysRRtKwXmshDI5gG/S57H7qDl88HyQ2U9qub72HNSG3t+e0GTlwqT/fIcGzgvNfb
	wcN5Wezg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRCqG-000000051cq-1ctv;
	Mon, 16 Jun 2025 16:37:53 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRALA-00000004caN-1N1u
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 13:57:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=pkPX3SdfRcKBJtj9YBuTt4Bunu0ITK5f/bnT+P8APAU=; b=SmyhHYgFjbsyLdEkjvpqxcIaq3
	Bv9GKc8m+pG4+wcZIXD9TADXOEznHTSJuE3WZJYYSwpyJUK7yoMdRJf1NxIKDlWOoRAOC78N6hYpd
	3t/BmdJYqTYERaqG6bqbaORsXB+aQSmMK4BqzpFBUF8NilyI/LKBlpFbS2yY1XBi5raY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uRAL5-00G38x-I0; Mon, 16 Jun 2025 15:57:31 +0200
Date: Mon, 16 Jun 2025 15:57:31 +0200
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
Subject: Re: [PATCH net-next 2/3] net: stmmac: rk: use device rather than
 platform device in rk_priv_data
Message-ID: <fa271d3d-60db-42b0-bf41-f1fe75e18b9b@lunn.ch>
References: <aE_u8mCkUXEWTzJe@shell.armlinux.org.uk>
 <E1uR6se-004Ktz-Dx@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1uR6se-004Ktz-Dx@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_065736_365898_DEE1DC66 
X-CRM114-Status: UNSURE (   8.66  )
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

On Mon, Jun 16, 2025 at 11:15:56AM +0100, Russell King (Oracle) wrote:
> All the code in dwmac-rk uses &bsp_priv->pdev->dev, nothing uses
> bsp_priv->pdev directly. Store the struct device rather than the
> struct platform_device in struct rk_priv_data, and simplifying the
> code.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

