Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5545BC02181
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jan 2025 16:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xNs+0v/MS6t8eju7mr6BWfenMDdj2wARnf6j1yi+EWs=; b=1ItqMgEaRnni3F3zcU/iJVzHmW
	YXZs+8I+BV1HMDLLGYW5thje1czgcihRMtJSWAPZ5gpQXf1UmCkwtyTCDFwSW1Bmko/QSVd5VmaNR
	0pa4w3R+7YcRw6B+H7oZN3FaYvlwj4/xroZ5UskNJ4QQ7A7olCsdDWwp1jt0DJB7AoFapRJ/7mpLe
	qVGRGjCr4A2z+OUBGk1jHMoRDwFFEPvOYqHOMQe5Vobg6S83V54SAmu2H2D9Ni5MIvsEYh7y8gIbe
	6yq6zEOToGYsElfDammZnSQeJS5xhbOUBX1A2BE2RK/ikyPoBLVKFCTE3eK2Qq+7v552T134nvMyF
	kMgI7naA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZufe-0000000607S-17D5;
	Mon, 20 Jan 2025 16:30:38 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZueM-00000005zvz-1uta
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jan 2025 16:29:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=xNs+0v/MS6t8eju7mr6BWfenMDdj2wARnf6j1yi+EWs=; b=YH6hCH9SB34cbJRXo8i1rANxQ8
	tzEmNZK2Goar9mf3nJApaxNcxQ3N5uajFQSwNr4V9K2kA2XQGIYLU7bxwP3YlMdqub4YTbJoUd5db
	YkvvBAUmjL6ieLFNcVWF6Hy5zi/Zd1Ug6e/ZiCZa5d61NvezqDPhXwAvK8fDUTnOHpTs=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tZue5-006NvO-CL; Mon, 20 Jan 2025 17:29:01 +0100
Date: Mon, 20 Jan 2025 17:29:01 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net 1/2] net: stmmac: Limit FIFO size by hardware feature
 value
Message-ID: <0c54a6ef-83ab-4739-bf2e-414c4d4621dc@lunn.ch>
References: <20250116020853.2835521-1-hayashi.kunihiko@socionext.com>
 <636bad71-8da8-4fda-a433-1586d93683a5@lunn.ch>
 <6aa0671d-beb2-429b-a34e-cb35651e1c12@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6aa0671d-beb2-429b-a34e-cb35651e1c12@socionext.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_082918_497558_F4939C34 
X-CRM114-Status: GOOD (  22.03  )
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

On Mon, Jan 20, 2025 at 02:20:23PM +0900, Kunihiko Hayashi wrote:
> Hi Andrew,
> 
> On 2025/01/17 5:16, Andrew Lunn wrote:
> > On Thu, Jan 16, 2025 at 11:08:52AM +0900, Kunihiko Hayashi wrote:
> > > Tx/Rx FIFO size is specified by the parameter "{tx,rx}-fifo-depth" from
> > > the platform layer.
> > > 
> > > However, these values are constrained by upper limits determined by the
> > > capabilities of each hardware feature. There is a risk that the upper
> > > bits will be truncated due to the calculation, so it's appropriate to
> > > limit them to the upper limit values.
> > 
> > Are these values hard coded in the platform layer? Or can they come
> > from userspace?
> 
> My explanation is insufficient and misleading.
> "From the platform layer" means the common layer of stmmac described in
> "stmmac_platform.c".
> 
> > If they are hard coded, we should also fix them. So maybe add a
> > netdev_warn(), and encourage the platform maintainers to fix their
> > platform. If they are coming from userspace, we should consider
> > failing the ethtool call with an -EINVAL, and maybe an extack with the
> > valid range?
> 
> These values are derived from the devicetree and stored in the stmmac
> private structure. They are hardware-specific values, so I think this
> fix is sufficient.

But if they are coming from device tree, the device tree developer has
made an error, which has been silently ignored. Do we want to leave
the device tree broken? Or should we encourage developers to fix them?
Printing a warning would facilitate that.

	Andrew

