Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7233BC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 15:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kkTI4wx7eSKKrJF7Dqco5icCoVpxeTgXztZTB3jQ1Ew=; b=BVwoNbWok9cWiIAcHj6sJRNnqp
	RrH8r+H6IIT4lRO+ObA4ikpTJxfv/3ymbhOXsjJboqO1NNMuwvSdvqIyWQwCasDGgOUY80Qk9pDDz
	qbbSiYP2Tct4J+u0lheoQfniWXaLQHowxIhWJTf4x9BFNoJliAK65H63Bc4R9NPb1XdXwN+EJD+1o
	+kCcSdKOsCSkxDkIyoGwwPP5Ht6Pq4tO+Kvep9hcLRdjiZ+kqN+RMIeYt3CqhLRJLgaLAMdEQ1uvG
	E5CYy6jdRZ8SVwRPQVDq6lX8Fr9+GzPqkWxbf3y3YzIVjtPjjy3ESVOMF2NebYk0hBgh2c4N4uI1q
	IRu8ptMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuYvi-00000006MVe-1dgn;
	Tue, 18 Mar 2025 15:32:34 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuYu1-00000006M87-0j5Q;
	Tue, 18 Mar 2025 15:30:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E34D6A48947;
	Tue, 18 Mar 2025 15:25:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0244DC4CEDD;
	Tue, 18 Mar 2025 15:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742311848;
	bh=HVBz2aT+/RHcd9VZQ6XrEog43pPGxZQceGs8IeJP6oc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XUoW4tgeJI1qkqHA8wzUVgYQSoY+aOz8Q2mvlmnDsT5jlUIWvVvsDrwcAh+mvdJcm
	 FchVJjLo9kTuxGacsk79c7OAUx7NJO7BGusb58YMjDYBAaFqR3a5jariprgb4DkfTH
	 Y4Abf0av5IvwjG3TkwPUayTU/4+zYb3JUSs5x20FqUwAe5P9ifDprpWqiqeJZING8T
	 NT1bfAo3ZBnaTXUfdUFYE/P3Q4koEGvV4PrKANZ4bk+PMB93RQTfbHOAf5evdgKIqy
	 t/cBbkemhscPWWaViv47JUZikUvLqPE6HgfRL4/G5oymAbGbo3Hlvc93ImhCmfDcKF
	 iWkA4ztEDM2fA==
Date: Tue, 18 Mar 2025 15:30:43 +0000
From: Simon Horman <horms@kernel.org>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Heiko Stuebner <heiko@sntech.de>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Wu <david.wu@rock-chips.com>, Yao Zi <ziyao@disroot.org>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] net: stmmac: dwmac-rk: Add GMAC support for RK3528
Message-ID: <20250318153043.GE688833@kernel.org>
References: <20250309232622.1498084-1-jonas@kwiboo.se>
 <20250317194309.GL688833@kernel.org>
 <db3bf1cb-3385-4676-8ba4-41fea0212bf2@kwiboo.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <db3bf1cb-3385-4676-8ba4-41fea0212bf2@kwiboo.se>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_083049_343740_E3E1DA09 
X-CRM114-Status: GOOD (  31.14  )
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

On Mon, Mar 17, 2025 at 08:50:34PM +0100, Jonas Karlman wrote:
> Hi Simon,
> 
> On 2025-03-17 20:43, Simon Horman wrote:
> > On Sun, Mar 09, 2025 at 11:26:10PM +0000, Jonas Karlman wrote:
> >> The Rockchip RK3528 has two Ethernet controllers, one 100/10 MAC to be
> >> used with the integrated PHY and a second 1000/100/10 MAC to be used
> >> with an external Ethernet PHY.
> >>
> >> This series add initial support for the Ethernet controllers found in
> >> RK3528 and initial support to power up/down the integrated PHY.
> >>
> >> This series depends on v2 of the "net: stmmac: dwmac-rk: Validate GRF
> >> and peripheral GRF during probe" [1] cleanup series.
> >>
> >>
> >> Changes in v2:
> >> - Restrict the minItems: 4 change to rockchip,rk3528-gmac
> >> - Add initial support to power up/down the integrated PHY in RK3528
> >> - Split device tree changes into a separate series
> >>
> >> [1] https://lore.kernel.org/r/20250308213720.2517944-1-jonas@kwiboo.se/
> > 
> > Hi Jonas,
> > 
> > This patchset looks reasonable to me. However it will need
> > to be reposted once it's dependencies ([1]) are present in net-next.
> 
> The dependent series ([1]) has already been merged into net-next [2].

Thanks, and sorry for not noticing that.

> Do I still need to repost this series?

Yes, I think that would be best so there is a CI run over the series
(the CI doesn't understand dependencies).

> [2] https://lore.kernel.org/r/174186063226.1446759.12026198009173732573.git-patchwork-notify@kernel.org/
> 
> > 
> > And on the topic of process:
> > 
> > * As this is a patch-set for net-next it would be best to
> >   target it accordingly:
> > 
> >   Subject: [PATCH net-next] ...
> > 
> > * Please post patches for net/net-next which have dependencies as RFCs.
> > 
> > For more information on Netdev processes please take a look at
> > https://docs.kernel.org/process/maintainer-netdev.html
> > 
> 
> Thanks, I see, netdev seem to use a slight different process than what
> I am familiar with compared to other Linux subsystems and U-Boot :-)
> 
> Regards,
> Jonas
> 

