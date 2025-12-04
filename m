Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC10BD2A532
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 20:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=90lPoCGIeZvibFvI+Jj7Aj4Z4grOEkzE4KDDgVz3fS8=; b=Xah1P138LpQibmqCHbTJgi6QJn
	QRQMpZi4JzLZCmc+xwFMmOOl8SFzPCzQ3KMbq1I/D0YLAdVwG72c2GRIPQWYolQJSXYod69/m5ofS
	rLxDrfqu4ldW4BlnnrfcR10+eEq1bNH4/K7A+uRZeFg1kouvVI5raRE3jGvkpujxbxJkbnmplTlVe
	2S4zIpW388i8XUDIXrzpevtWYyQwAuXyrDxddg31jR6T4ingbzWhSvn95cwNHPmqENDlTD3BozDVE
	yrJNuWMw1X5MlBAf6VWiBK4EihBzoMQJBfPga5tJEyRQ5Kfxm0CnDnWbZuy7mFDxnlAzKvMvoZmyt
	vLq1IYkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRGF0-00000008czN-1Df4;
	Thu, 04 Dec 2025 20:47:54 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRGEx-00000008cyb-0Ds2;
	Thu, 04 Dec 2025 20:47:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=90lPoCGIeZvibFvI+Jj7Aj4Z4grOEkzE4KDDgVz3fS8=; b=T/SIfiqDXVikO9O0tu4uZBNlLW
	6PMOsEibq8S9h3DE3ovp9EN5cl/7WTTpDdxenrHdNtAeCsqlo1hH8k3dnhCJenq/VnizEzAHbCv6s
	crE4bj22iCna436g2Iqoqwd8IKtACPqvPCtv1jAF2/vjBryDOi2SU3fbdHxccoBbjOluy3utx/Xhr
	WLzi/hGK0ayRycPwbfh1gsKYrrfEUwJelwKQGGbKTdnPgalqsgXxV6zwFLfmnn50PPjzzzpceDqKh
	KkZX+cS2QzNka7NhIIcEV6VS232P7EO2438bRCGz1z+PS7rKgOvELaLHLkm1INShBT18CE1oSEfdU
	Y71n0DPQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56322)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vRGEh-000000003wd-1CNC;
	Thu, 04 Dec 2025 20:47:35 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vRGEc-000000001L6-1Grf;
	Thu, 04 Dec 2025 20:47:30 +0000
Date: Thu, 4 Dec 2025 20:47:30 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vladimir Oltean <olteanv@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Frank Wunderlich <frankwu@gmx.de>, Andrew Lunn <andrew@lunn.ch>,
	Chen Minqiang <ptpt52@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH v3 2/2] net: dsa: mt7530: Use GPIO polarity to generate
 correct reset sequence
Message-ID: <aTHzYq5L7kvAPrjQ@shell.armlinux.org.uk>
References: <0d85e1e6-ea75-4f20-aef1-90d446b4bfa1@kernel.org>
 <00f308a1-a4b1-4f20-8d8e-459ddf4c39b1@gmx.de>
 <aS7Zj3AFsSp2CTNv@makrotopia.org>
 <20251204131626.upw77jncqfwxydww@skbuf>
 <4170c560-1edd-4ff8-96af-a479063be4a5@kernel.org>
 <20251204160247.yz42mnxvzhxas5jc@skbuf>
 <66d080f1-e989-451f-9d5e-34460e5eb1b0@kernel.org>
 <20251204171159.yy3nkvzttxecmhfo@skbuf>
 <178afbeb-168f-4765-bb0b-fad0bcd29382@kernel.org>
 <9f7da6ae-9e3e-442f-a203-28a8881dbe0f@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9f7da6ae-9e3e-442f-a203-28a8881dbe0f@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_124751_090709_0408D92B 
X-CRM114-Status: GOOD (  19.74  )
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

On Thu, Dec 04, 2025 at 06:32:23PM +0100, Krzysztof Kozlowski wrote:
> On 04/12/2025 18:23, Krzysztof Kozlowski wrote:
> > On 04/12/2025 18:11, Vladimir Oltean wrote:
> >> On Thu, Dec 04, 2025 at 05:48:07PM +0100, Krzysztof Kozlowski wrote:
> >>> Both are the same - inverter or NOT gate, same stuff. It is just
> >>> connecting wire to pull up, not actual component on the board (although
> >>> one could make and buy such component as well...). We never describe
> >>> these inverters in the DTS, these are just too trivial circuits, thus
> >>> the final GPIO_ACTIVE_XXX should already include whatever is on the wire
> >>> between SoC and device.
> >>
> >> Please read what Andrew said:
> >> https://lore.kernel.org/netdev/3fbc4e67-b931-421c-9d83-2214aaa2f6ed@lunn.ch/
> >>
> >>   Assuming there is not a NOT gate placed between the GPIO and the reset
> >>   pin, because the board designer decided to do that for some reason?
> >>                    ~~~~~~~~~~~~~~
> >>
> >> You two are *not* talking about the same thing. I dismissed the
> > 
> > 
> > It's the same thing. NOT gate is just pulling some pin down or up.
> 
> Although transistor would be still needed, so indeed that's still a bit
> more than a wire and resistor as I implied.
> 
> It looks like:
> https://www.electronics-tutorials.ws/wp-content/uploads/2018/05/logic-log47.gif

A bit more than even that... I do hope folk don't use exactly that,
that's the kind of thing that would be used in "learning about
electronics" projects! That's a recipe to drive a transistor into
full saturation, which makes it comparitively very slow to turn off.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

