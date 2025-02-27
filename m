Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E617C19F2E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 14:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PnsVUwZvLtZEZe84Ekk1jKFmKSz1fM8ls2BhK6vT+ys=; b=eJoahj9/1nxKfRY5/7/BjmbsEQ
	boVExoyEZQLYIsO/Lh0C5n9WjsE9Lgaon1knx2YFhY9vkFCsDnJ4c7iuYw1sWZViaCfvwHfH6kYCe
	XZ50BaHHD8+eIqWpqgcvY58Uo5BAmN2iG0M+b2ay+kiK1zOriAQxIQC7s4+cCJRoa+E7ayiQzwM9f
	auas8FZ0Av25/5UkodqCkYUBWjo1HmTvhkJ1t0T4Cku96iV2sYR1lKFr2+T0V/KixuELzqw/3bl5m
	4uXvh2EcmKNgwtUOwxZHMVrmxQK+qJlu6I796mDTYCT+75I2AUKcLBxPq22BN65Ay8oytnetB78UC
	0cEz9gjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tneXl-00000007ejB-1S9v;
	Thu, 27 Feb 2025 14:07:17 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tneQc-00000007d8l-3Ims
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 13:59:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=PnsVUwZvLtZEZe84Ekk1jKFmKSz1fM8ls2BhK6vT+ys=; b=xw3EMLPy1GGXcjd7EVpv0sio7Q
	2cStZWCMmg8+9ADM12w+gVPULhWf+j+zWgt+PiGk73ncIo/d6Hb8P+88+NjOj+93LnZpGdpf5hXLR
	WUEI/Er49qDzUbvQ+xq1tvuT92bTGu5weALXt/nJ5Fb/KJpf1TrbSvMvh1yNoCgSDKv0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tneQT-000bsO-4n; Thu, 27 Feb 2025 14:59:45 +0100
Date: Thu, 27 Feb 2025 14:59:45 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Minda Chen <minda.chen@starfivetech.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next 04/11] net: stmmac: starfive: use generic
 stmmac_set_clk_tx_rate()
Message-ID: <8bbdbad8-b6cb-4ef4-ae32-0661d85aa412@lunn.ch>
References: <Z8AtX-wyPal1auVO@shell.armlinux.org.uk>
 <E1tna0V-0052sk-1L@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1tna0V-0052sk-1L@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_055954_821743_2B6E4563 
X-CRM114-Status: UNSURE (   6.61  )
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

On Thu, Feb 27, 2025 at 09:16:39AM +0000, Russell King (Oracle) wrote:
> Use the generic stmmac_set_clk_tx_rate() to configure the MAC transmit
> clock.
> 
> Reviewed-by: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

