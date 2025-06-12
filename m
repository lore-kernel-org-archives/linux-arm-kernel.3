Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84981C71151
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 22:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u7FNp85AG+1u0PhdELLROSe+8g3+hVzoNaTi8mFP2BU=; b=g0kVr3rejSQQzV3/Hl7eKimNQ/
	pFo6se6pTPPUhhNYn0zyXhNBMBAEdHUsoc/GjgYQct8RfsVQF7PwJTmxiyPoS44gzSjADz5Mm1N88
	LKO4NwxCDHkUUB3GtQv/YrZte/WM+rwGRcX3IfSZcqCcROuh3HrU19gA4k6LDVX2mmW7++NTmKiSH
	IIswkYUae/YfRBIWHBMKUOCBnp47tOmz4d36qhNrgSTT9xDBBGI60Pdxv9vkvA4lLDeQPbzfYPfvZ
	1kao9dOz8z54SOfNhEo81s+J3H0v/UFvtynHq5MPPfXzJtiXROpwVLfl6yNCCl/L7qZx5B9kMz4o/
	rdU78eUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPq7C-0000000EjWQ-0Ilw;
	Thu, 12 Jun 2025 22:09:42 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPk8n-0000000Dqt6-2mWs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 15:46:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=u7FNp85AG+1u0PhdELLROSe+8g3+hVzoNaTi8mFP2BU=; b=N6LsJfoAuqu5t+Yb4U6MXGrLfr
	fiuBFzGJCTTlkPke4l4Y/Ak79p/Gs/brc5zSrxlN5aARjY4RbNk9HuYb1FfNV+3ZpeL1pDhDNQt8w
	j1UlF9yUCm0KezJh/nXgre/FrJL8MiVBIjf/m1GyyUNcdOBK9slkcw65o2lV6XazVYVI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uPk8i-00FZ60-KU; Thu, 12 Jun 2025 17:46:52 +0200
Date: Thu, 12 Jun 2025 17:46:52 +0200
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
Subject: Re: [PATCH net-next 1/9] net: stmmac: rk: add get_interfaces()
 implementation
Message-ID: <d1b624ed-0c9e-4cfa-a632-84430110a605@lunn.ch>
References: <aEr1BhIoC6-UM2XV@shell.armlinux.org.uk>
 <E1uPk2j-004CF6-Mf@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1uPk2j-004CF6-Mf@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_084657_699822_73B18AF1 
X-CRM114-Status: GOOD (  11.25  )
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

On Thu, Jun 12, 2025 at 04:40:41PM +0100, Russell King (Oracle) wrote:
> RK platforms support RGMII and/or RMII depending on the SoC. Detect
> whether support for a SoC exists by whether the interface specific
> set_to functions have been populated, and set the appropriate bits in
> phylink's bitmap of interfaces.
> 
> This assumes all dwmac interfaces on a SoC have identical support,
> but it should be noted that this is not true for RK3528 which only
> supports RGMII on GMAC1. However, the existing code structure
> permits RGMII to be configured on GMAC0 without complaint, so
> preserve this behaviour even though it is incorrect to avoid
> functional change.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

