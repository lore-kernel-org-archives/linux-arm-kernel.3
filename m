Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2E90C02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 10:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=7WvP02qICs8Ho2OpuTmY61FFwlzbkHaH5jA0+tFbyIY=; b=ck5KBmBMoYaXBmiwAggJ8t3E19
	xtWOeA0kJEjP2hs0n7zi2MYZC/uvgn5HNdi0fQ11tKJ12+p0OhqNOEE4oSjSl4Zy0RrjJVkVjV0rT
	eY1W3q9pdrEwTWeDLHyLoBxAkHLUIZyRbfSzoD5rCyQyCGzZMBL+ssCUJ1ykxtODwg6sc+q1OZ2tG
	l8ohreS/fkQuhOpQDYSpLX6O7/+tFJMCsEGPFGtBW/iIDZZ6RUt/4vxdV0fEOdaaliyKzyaP3Ga3S
	ERRphdnTxKP3WX/2nEGrvYv6DRSKN2SKepoDD9cxM8GJEGoGjbix0+8a0QFz/a8c6Pgp/5byfoGvk
	yjrmpPhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfzEc-00000005z4U-1XTj;
	Thu, 06 Feb 2025 10:35:50 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfzDE-00000005yuc-3snw;
	Thu, 06 Feb 2025 10:34:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2138CA440A0;
	Thu,  6 Feb 2025 10:32:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1E42C4CEDD;
	Thu,  6 Feb 2025 10:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738838063;
	bh=HtJGuuBPY7GzLXY3kxC0VzXl+lpKcP1odVWAB06tJ9Q=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=Iot787BECykWp2gtP3LBBfpkGun7l00fOPAElaA5BAiQCtwwTeI+lVecYMzKwAnts
	 4mcyF+D7fWht1j+3rEu3Cj1DeyPer4iHjAMiI9YUWs+kcZZlBXtr31rsdaxfYzyLlo
	 W04h+ye22xoupObrmhPOhQ3wmdVoNLUsufgqTPam+umbVH0CCgAW87+XGI3BvdHj7B
	 6bGGqk9nn8pKjJ1FUWcQSS28fa1KRdLaD1dIgqoGtHBv8bFZMZk/H7/f1DvM+JP+ZX
	 woAuP/pEtkO6VckSw7t2BXzkqiKH0LqFV0wwy5n6jYGwhxehp1ZAZDN0bLIEDFYrQR
	 6h+Szxrv3EMNQ==
Date: Thu, 6 Feb 2025 10:34:18 +0000
From: Simon Horman <horms@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>,
	"Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Heiko Stuebner <heiko@sntech.de>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Steven Price <steven.price@arm.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
	stable@vger.kernel.org
Subject: Re: [PATCH netdev] net: stmmac: dwmac-rk: Provide FIFO sizes for
 DWMAC 1000
Message-ID: <20250206103418.GO554665@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z6OjmtiZ4A8BzvsP@shell.armlinux.org.uk>
 <CAGb2v64CZWZwC7T9NNN7Re8pkCLQZEh3bcraYjcQRyVxtJgS5w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_023425_028260_32044DFD 
X-CRM114-Status: GOOD (  14.26  )
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

On Thu, Feb 06, 2025 at 01:40:17AM +0800, Chen-Yu Tsai wrote:
> On Thu, Feb 6, 2025 at 1:38 AM Simon Horman <horms@kernel.org> wrote:

...

> > I think the point is that someone needs to formally
> > submit the revert. And I assume it should target the net tree.
> 
> Russell sent one a couple hours ago, so I think we're covered.
> 

On Wed, Feb 05, 2025 at 05:44:58PM +0000, Russell King (Oracle) wrote:
> On Wed, Feb 05, 2025 at 05:38:24PM +0000, Simon Horman wrote:

...

> > I think the point is that someone needs to formally
> > submit the revert. And I assume it should target the net tree.
> 
> For what I think is the third time today (fourth if you include the
> actual patch...)
> 
> https://lore.kernel.org/r/E1tfeyR-003YGJ-Gb@rmk-PC.armlinux.org.uk

Thanks, I see it now.

