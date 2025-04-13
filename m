Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B56E8C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Apr 2025 21:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UfX9FuNz/xoujw3pgB2m7ZmTW064Rlef0hhXLoTluGo=; b=1p0fim+J8ORjZjHdM0GUrHeMFE
	HSxWRNk88gYcvK28t1Bed+5S/x9D6KtJQzdGb9/adnEYIsylvd8R3K1O+eiV9u3g4SDRPkKzyX6yg
	NaHC8yVqGNXEK2EbI/9XbvH5PY9n1KfHPpHwZ9EDw1pMTMqQGGrI0PhZeuAjwTf6xC09fo9f/SGuJ
	c1dVk7HWevJxVRbMx30vq2uoKxs0gYCx3AHpjWrOUA6tM5pN8CQGX9me4fVwJ8pIteTzWA5w0GR2o
	c5tuokTtnOuxv+cxe5ajQtX7nPmS8M25MhvtnAsCiIE/e8TekOhzS3T4L6NyEc+aqni2GAlEmEo1Z
	hhGpP4gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u44h5-000000009u0-2n8W;
	Sun, 13 Apr 2025 21:16:47 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u44a9-000000008zi-2OhG
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Apr 2025 21:09:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=UfX9FuNz/xoujw3pgB2m7ZmTW064Rlef0hhXLoTluGo=; b=oSfh+knYqeFyoNjFEmu20gUUvP
	S6iIN9hcNRD58S4Zokevy47Hvuo33kNtH6IxEZWR65neVd5VDFisTm/Q1lFhocIdv2Fs8iYVWcISq
	TmrA+6slPl/PgBoBYw4xdZnlM+uFdZ9RqBRbpRb8W0Z4errNL3LkGfPLBqlLxA8GcCJA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u44a2-0096Lr-8v; Sun, 13 Apr 2025 23:09:30 +0200
Date: Sun, 13 Apr 2025 23:09:30 +0200
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
Subject: Re: [PATCH net-next 2/4] net: stmmac: anarion: clean up interface
 parsing
Message-ID: <a5d370d0-2f21-4f7c-92a3-922e17fe81ff@lunn.ch>
References: <Z_p16taXJ1sOo4Ws@shell.armlinux.org.uk>
 <E1u3bfK-000Elr-Fa@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1u3bfK-000Elr-Fa@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250413_140937_610778_366628DC 
X-CRM114-Status: UNSURE (   8.56  )
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

On Sat, Apr 12, 2025 at 03:17:02PM +0100, Russell King (Oracle) wrote:
> anarion_config_dt() used a switch statement to check for the RGMII
> modes, complete with an unnecessary "fallthrough", and also printed
> the numerical value of the PHY interface mode on error. Clean this
> up using the phy_interface_mode_is_rgmii() helper, and print the
> English version of the PHY interface mode on error.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

