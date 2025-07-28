Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2B6EC83F26
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 17:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VkH0crfTUwXB5DNXuH8yBQyTTJsazdYrj1Yis/M7piY=; b=egrCcHwASAx1dM2nheiNiw+DIT
	EERHo99GYG7qSw+KWgve9g3QAjRl0LxVy4AmPdlOVFx1mJbCWrhBV2NQcTOwV4hHtKYpoBcUNvq+P
	s9uuoa8odrBrIBi7pt2tCB9rR+pPsH+Wka/nhe7KkgDgf6PITZHXj5Q74V6SuZ+jFUKe+I+SsBhvl
	FYZ4IJ+ZhlpZQVsRB/r+0mWcnQ4SMhXtheNs0ogt/Y9+usnXwRbMuI/bSHFV3KO7JukxPwkIe4yQq
	LxM1jHrp7oSgagLE6wvhgYf357goI6A3JUHZSlmIuRW2Ka9tSAKDW2DcpMwMMKOFYbskvNLGXqiTU
	zCgMc53g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugRfp-0000000F6ny-2Y5l;
	Mon, 28 Jul 2025 17:30:05 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugRIu-0000000F3zV-2PCZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 17:06:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=VkH0crfTUwXB5DNXuH8yBQyTTJsazdYrj1Yis/M7piY=; b=gCUiNtTuGXlowIW+QHz40Nn5zY
	8MC70ZfKb7RuvQOy4n7CyiXiBf0bMnigFPsEFeXdlqbk/R4P8Pa8eY39B6qb2AHumFKx6eJ3ztiT0
	mHNMnOVPzfWfdJejDDW0ecM9TfNgCZ6XnbvdTVzAf96HnO0MxpwA9gRgou5eBcSSbwno=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1ugRIp-0037HF-Mc; Mon, 28 Jul 2025 19:06:19 +0200
Date: Mon, 28 Jul 2025 19:06:19 +0200
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
Subject: Re: [PATCH RFC net-next 3/7] net: stmmac: remove redundant WoL
 option validation
Message-ID: <2f61fc10-fad3-442f-bfb7-5cd13dd6711f@lunn.ch>
References: <aIebMKnQgzQxIY3j@shell.armlinux.org.uk>
 <E1ugQ2o-006KD9-EB@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1ugQ2o-006KD9-EB@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_100624_610561_E58FC32E 
X-CRM114-Status: UNSURE (   9.89  )
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

On Mon, Jul 28, 2025 at 04:45:42PM +0100, Russell King (Oracle) wrote:
> The core ethtool API validates the WoL options passed from userspace
> against the support which the driver reports from its get_wol() method,
> returning EINVAL if an unsupported mode is requested.
> 
> Therefore, there is no need for stmmac to implement its own validation.
> Remove this unnecessary code.
> 
> See ethnl_set_wol() in net/ethtool/wol.c and ethtool_set_wol() in
> net/ethtool/ioctl.c.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

