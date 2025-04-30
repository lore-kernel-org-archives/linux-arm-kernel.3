Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DD10C3ABA9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 16:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VHw++ueBqMA9gHPPexHywPa7lWGoLeLxlqgC8EeY1Tg=; b=k8UWyAS1+494KrYKGWrcpfAh0y
	T5ztuUAvbhr38ByydjGhjS/lcVsBp/3qwYHa6MPDV6+DdErD/rh1KOESFC+wjQowitFwuoQ1kkZtI
	r1mb0oFZ/R0T844Aw/l2hYVCf69jVl7Lr9X/nBJuuRt/or2FJx8c6RCf8dpmmWquGKH4RaaaKZ04I
	aNdn5tQAr2V2omG6EKqg5suP3jDH041+HyPm9AA6lWP6tSTtdHC4l+rGeFjq0YbA4KvJbkgYekIPN
	1w9Dr1BFdGc6kP8cpeWD7iPAIedR/oDlHNvShJWiPzs2EfydT4DBsH3ac8iTAZ6E0RkyrJ+OiEldd
	cgaXu6DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAA8g-0000000DPTK-20eO;
	Wed, 30 Apr 2025 16:18:26 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAA6j-0000000DP7E-14SX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 16:16:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=VHw++ueBqMA9gHPPexHywPa7lWGoLeLxlqgC8EeY1Tg=; b=l6ZVDLUpbXfufkgK/4b2kUf+jE
	nsA4cuy09Jzm8ybkngc8Pu5wOAY/mAprZYa442w/X14ne7YT0VvKpV4hEomb2YzzMpEcODfmf4bBf
	d85owhf7d6dld/+bD84rEQUrFmpQwZ2jgahbx8NMTutobJXEnlM8qoDXRjrAlG4C3cmM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uAA6J-00BFbx-N9; Wed, 30 Apr 2025 18:15:59 +0200
Date: Wed, 30 Apr 2025 18:15:59 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Roger Quadros <rogerq@kernel.org>
Cc: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Whitcroft <apw@canonical.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Joe Perches <joe@perches.com>, Jonathan Corbet <corbet@lwn.net>,
	Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Tero Kristo <kristo@kernel.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com
Subject: Re: [PATCH net-next 3/4] net: ethernet: ti: am65-cpsw: fixup PHY
 mode for fixed RGMII TX delay
Message-ID: <26696cfd-85f2-4876-9a56-f005eedc8380@lunn.ch>
References: <cover.1744710099.git.matthias.schiffer@ew.tq-group.com>
 <32e0dffa7ea139e7912607a08e391809d7383677.1744710099.git.matthias.schiffer@ew.tq-group.com>
 <07c540a2-c645-460c-bfad-c9229d5d5ad0@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <07c540a2-c645-460c-bfad-c9229d5d5ad0@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_091625_289643_15A52D52 
X-CRM114-Status: GOOD (  10.61  )
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

On Wed, Apr 30, 2025 at 05:56:29PM +0300, Roger Quadros wrote:
> Matthias,
> 
> On 15/04/2025 13:18, Matthias Schiffer wrote:
> > All am65-cpsw controllers have a fixed TX delay, so the PHY interface
> > mode must be fixed up to account for this.
> > 
> > Modes that claim to a delay on the PCB can't actually work. Warn people
> Could you please help me understand this statement? Which delay? TX or RX?

See if this helper:

https://patchwork.kernel.org/project/netdevbpf/patch/20250429-v6-15-rc3-net-rgmii-delays-v1-1-f52664945741@lunn.ch/

There will be a V2 soon.

      Andrew

