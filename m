Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FB50C71155
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 22:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L+yLe+ZMSf3yk77UvKkyRGyzVGUmF0OKQ+1btIxnhOE=; b=bb5eNfSxdtv6bn5qCF3Q2PoZw1
	EZc5crDVE+FBJO4O0Fh2EPJ193T8xfp2QHvEPhBuuq12R1Kobuhv9Mo/zcBic+hM4sfGMUEigVEJt
	E/UeTgOL+e8GxXkxtBx7rHn5BYBSPNAaSu3huij8yPSJFe8BxKyJAHAdcJTTxoZLl0uYgaBlr4gPF
	kc3O8iaXWeHru5STx6CRujwNNEq/+XGkyyN27y4QzLVj9afZIpLdM/URm/3XSQ4+nXaWUCZq+SiQI
	PVFdkdBiGkpL3sBC5IS7YnKzaEM4isu+tgjV98Wue4/Bt3t35j9qJvsCC//ZApjSsTadBmYGO+rNa
	c/a/CHXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPq7C-0000000EjXL-2Wj4;
	Thu, 12 Jun 2025 22:09:42 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPkBZ-0000000DrJ0-13lH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 15:49:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=L+yLe+ZMSf3yk77UvKkyRGyzVGUmF0OKQ+1btIxnhOE=; b=jzPOPJI6MXqNn8Yg9oLmLM9hgl
	yzAH1dQkji+RkHEuI4xGJBue/st4deUUhpkAYl65GhNEb1Bxt6HMLVpULKSOLKo0t7WfSzZTo8JmR
	809l2akNLqVgMLuNyav5dZcktHoLn2TSjIyw9eX2ufb4IyCmDUnyvZ8PO6o9jZGaEfrU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uPkBT-00FZCi-NN; Thu, 12 Jun 2025 17:49:43 +0200
Date: Thu, 12 Jun 2025 17:49:43 +0200
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
Subject: Re: [PATCH net-next 5/9] net: stmmac: rk: combine clk_mac_speed rate
 setting functions
Message-ID: <65b9f847-7b94-406d-acc8-45e692beb507@lunn.ch>
References: <aEr1BhIoC6-UM2XV@shell.armlinux.org.uk>
 <E1uPk34-004CFZ-3y@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1uPk34-004CFZ-3y@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_084949_285501_A047B4BF 
X-CRM114-Status: UNSURE (   7.67  )
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

On Thu, Jun 12, 2025 at 04:41:02PM +0100, Russell King (Oracle) wrote:
> rk3568_set_gmac_speed() and rv1126_set_clk_mac_speed() are now
> identical. Combine these so we have a single copy of this code.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

