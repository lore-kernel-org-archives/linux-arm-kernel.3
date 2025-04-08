Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07E01C36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 19:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kxhy/MU+jM2mvtkwqYk+GNtd8TQv1qCRiZaPwKzXy6w=; b=vrWWXSbhhKwBE74YaxYKrTD4Fo
	MM0mrbWibPkzMEA12OSbjU+X9S5gwrEHzI+m6HLx0XCw5BWGwB/LSLHMK7+IGjmclGMjnpvGch7DW
	xaP/cyzgF+Equ0y/YRCCTnL+5fk8pOM+qT/eT8oH7AEoyCGh4mZ8uJBuQyYIctUmYlUyPk6VSISSi
	5aJy4rEiSSMK5DXiwjMj2SxJiFaFxL1i992RJ21ldAdmOZXFMPXH1KRat05bg8RXUO+toPsMGIt8+
	/V0xdjB44uX5MZkEPYQIZrGwDDx//dvWKxB+kBYAW/DKuKUO/BuZKYu+Zuy+UEIYOXy/fZQGV/E0q
	/hijvGZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2EBM-00000005BH2-3BeY;
	Tue, 08 Apr 2025 19:00:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2E8P-00000005Ah6-0ano
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Apr 2025 18:57:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Kxhy/MU+jM2mvtkwqYk+GNtd8TQv1qCRiZaPwKzXy6w=; b=iwrfULz+lquE3FMR//UQfUMsMq
	nOAOrygYocaIxzvCpeAkBsB8+1Rn/8O8jGibSu58Vs9pHdvvqigMVybklJvYlWyinU8Fx5Pvky/Wu
	lNMAM4vHQW5HrVXImtWenHArsLbAcZMICpZ+umtdn/FRSk3LpZhDpNJrhlrlIeMAc+lHK2jzLGCjI
	vC3ht0QGiLDjEKolbujD0pKw42XHD8kcNu67GbrLOAUCrFhhFzeWfbQVBhnpUEa1rtLRpXegfHcLS
	kfeGIZC6QUuuo8JsnDmlb73Q+iaBOd//qiPeQ59/YnU9wOSwtrl3M21nzXMCHFprWNETjpdwlBaVF
	XZ8r6EGw==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2E8M-00000008Ova-1L3h
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 18:57:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Kxhy/MU+jM2mvtkwqYk+GNtd8TQv1qCRiZaPwKzXy6w=; b=f7wmzVm0yENgf1jtAMnXqOppa6
	4dZG4oHrxR6uv7oY3lW8PbQKQAvxaioN1VCv+qC6zGfiazdj0xWav37licIejUgUbni5gFnB8o+HP
	ssAe+bQFfAwO7ta0oOB4iF+0mfbHq7hwDOqvIKUI8F5Sh5+E/sTPmNxd61oAMqvBTGNk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u2E8I-008RG0-Cp; Tue, 08 Apr 2025 20:57:14 +0200
Date: Tue, 8 Apr 2025 20:57:14 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Jon Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Richard Cochran <richardcochran@gmail.com>,
	Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH net-next 2/5] net: stmmac: intel: remove eee_usecs_rate
 and hardware write
Message-ID: <f8fe981e-3351-469b-9d76-803eb4563932@lunn.ch>
References: <Z_QgOTC1hOSkIdur@shell.armlinux.org.uk>
 <E1u1rgO-0013gj-5r@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1u1rgO-0013gj-5r@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_195718_515551_BE054E8B 
X-CRM114-Status: GOOD (  12.57  )
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

On Mon, Apr 07, 2025 at 07:58:56PM +0100, Russell King (Oracle) wrote:
> Remove the write to GMAC_1US_TIC_COUNTER for two reasons:
> 
> 1. during initialisation or reinitialisation of the DWMAC core, the
>    core is reset, which sets this register back to its default value.
>    Writing it prior to stmmac_dvr_probe() has no effect.
> 
> 2. Since commit 8efbdbfa9938 ("net: stmmac: Initialize
>    MAC_ONEUS_TIC_COUNTER register"), GMAC4/5 core code will set
>    this register based on the rate of plat->stmmac_clk. This clock
>    is created by the same code which initialises plat->eee_usecs_rate,
>    which is also created to run at this same rate. Since Marek's
>    commit, this will set this register appropriately using the
>    rate of this clock.
> 
> Therefore, dwmac-intel.c writing GMAC_1US_TIC_COUNTER serves no
> useful purpose and can be removed.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

