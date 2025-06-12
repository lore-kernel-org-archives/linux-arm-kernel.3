Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92B15C71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 19:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tl6gf3BsudiugB8GNn23Uxwzfaj/4i/zGk6I30c4b/E=; b=L2zaC1EIYnXKTD3PasPs4Hkpfb
	DuEntsDAX8KsiEVaVtGh3bEHnkZLy0N8NgZgNN5h5HH4CDB8pEeyATZN0iEAFPxOz+b1lDKBL5MD8
	N2QNz2icWBxe2VlVnRnlErkuNVBbB7nYFIMLQIQAEckETVO2EGD1r8ZKZMEeKKPSBhRS6z2J2Ihtw
	wHBVLZj4uYKvbD/CmmaQJ6dInc/de8ElMKPdk3mLNZ/QcNKt2TbD/b0LD2eQg6u9Cz+yAqe64kUaD
	qqRbcGGW+Tp+xgMup4MYtBIWjonMtV2Ptxgio6YT5HK0uAmosD5CBb2dGjU9umjSimeLYhzBbZygM
	lx5dRUIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPns1-0000000ELMa-2yCy;
	Thu, 12 Jun 2025 19:45:53 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPkET-0000000Drjv-0g0u
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 15:52:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=tl6gf3BsudiugB8GNn23Uxwzfaj/4i/zGk6I30c4b/E=; b=Fk3lYuGtlmH5rLsYlbgkNpVrBI
	EnrJbMZWXIDp5p8h6JEomCE63NxH71/TGJj8V150uRPfRUl0VhRVJGR+yfVOxHa5PuI99Iuzta8wD
	Zl9ONfRifL6tbj6a3X3SHOvOBDcAm/95YFMwq3K5AlRkM7GLABBYrNb+YHkT/RZEcPfs=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uPkEO-00FZGh-8h; Thu, 12 Jun 2025 17:52:44 +0200
Date: Thu, 12 Jun 2025 17:52:44 +0200
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
Subject: Re: [PATCH net-next 8/9] net: stmmac: rk: convert
 px30_set_rmii_speed() to .set_speed()
Message-ID: <377ee4ec-5fe5-4bf8-abe7-5eb5c0076b1e@lunn.ch>
References: <aEr1BhIoC6-UM2XV@shell.armlinux.org.uk>
 <E1uPk3J-004CFr-FE@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1uPk3J-004CFr-FE@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_085249_204306_21F2FAAA 
X-CRM114-Status: UNSURE (   6.66  )
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

On Thu, Jun 12, 2025 at 04:41:17PM +0100, Russell King (Oracle) wrote:
> Convert px30_set_rmii_speed() to use the common .set_speed() method,
> which eliminates another user of the older .set_*_speed() methods.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

