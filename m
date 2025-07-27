Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9480DC87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Jul 2025 20:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8hEsloU/e5SnX4wmvFRSNKqlkwL0lNp6OodxTTFUtc0=; b=r3sCSM+dY22nI7LMC84pgA1C2i
	1vsXxUkij1YG8AJeCZdRw9D6/mcCY1/1KQsRKuSIX2lsZl25g74085ExsmTtJ+DrhP7Qd8iGMB9Gq
	8o1b18T4HB7MNTCxYcQDvfz9VsWiQSsj0DeRwi/oUZYXqRMIlT/hqWCctERHbP3ULrZ0MtgDC2ue1
	3KqwbXtROurPsD7N3kmLADRR6Ut3DqXGEcs29ZuG6sqIE6uPwwFLsXFQ/OSfdeO+gwB8z0i+ze2x5
	kAAFeXYWC9Up3VgmEM9vj4lP81G7eM9kDQF02AiFKsR5gUN0VjI2o3DbbqrGNF4EvcTWrwGb8YxqJ
	2Rti+XRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ug7Xr-0000000DAvE-0w6r;
	Sun, 27 Jul 2025 20:00:31 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ug7VJ-0000000DAIk-1A5S;
	Sun, 27 Jul 2025 19:57:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=8hEsloU/e5SnX4wmvFRSNKqlkwL0lNp6OodxTTFUtc0=; b=xg02+3ANIpeQD3xeG/u8lRQDRe
	yuSKoIF78ltBcE7+xWkS+XUGpjsCBTSqeQa78LWnwjZuwk52634YJEra0hQAR/sotpxZtyczV8Krp
	pN08ZsKToAcuyA3R+6qutEz/freUUTJEH53k8Qljib7q+oV+z+21zeya99W4XQU64mewL+z2QuZQ2
	4HoMxaKXa0u5qXZQYmfHcgLzfJ2oJYfz4g5PhkWT6QeEGpCvhuw/INYmdhfSUcx/HZtjKUiVlpkjs
	jdgFhGJQYUD2Xqx+yOIb/H9vC4CvnICBwCoxBPeDmsD7YT9xtvcnrgwkgWoTb5mYvJUvFnRbN21o6
	P40lfMMQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34694)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1ug7Uy-0007gA-2a;
	Sun, 27 Jul 2025 20:57:33 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1ug7Us-00042L-1o;
	Sun, 27 Jul 2025 20:57:26 +0100
Date: Sun, 27 Jul 2025 20:57:26 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Alvin =?utf-8?Q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
	Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Yao Zi <ziyao@disroot.org>, Chukun Pan <amadeus@jmu.edu.cn>,
	netdev@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: rockchip: Add RTL8367RB-VB switch to
 Radxa E24C
Message-ID: <aIaEpkZtPt6wqaiL@shell.armlinux.org.uk>
References: <20250727180305.381483-1-jonas@kwiboo.se>
 <20250727180305.381483-4-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250727180305.381483-4-jonas@kwiboo.se>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250727_125753_325077_4E354B71 
X-CRM114-Status: GOOD (  34.05  )
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

On Sun, Jul 27, 2025 at 06:03:00PM +0000, Jonas Karlman wrote:
> The Radxa E24C has a Realtek RTL8367RB-VB switch with four usable ports
> and is connected using a fixed-link to GMAC1 on the RK3528 SoC.
> 
> Add an ethernet-switch node to describe the RTL8367RB-VB switch.
> 
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> ---
> Initial testing with iperf3 showed ~930-940 Mbits/sec in one direction
> and only around ~1-2 Mbits/sec in the other direction.
> 
> The RK3528 hardware design guide recommends that timing between TXCLK
> and data is controlled by MAC, and timing between RXCLK and data is
> controlled by PHY.

Assuming RK3528 is the MAC side, then that makes sense - it's basically
suggesting that the _producer_ of the signals should appropriately skew
them.

> Any mix of MAC (rx/tx delay) and switch (rx/tx internal delay) did not
> seem to resolve this speed issue, however dropping snps,tso seems to fix
> that issue.
> 
> Unsure what is best here, should MAC or switch add the delays? Here I
> just followed DT from vendor downstream tree and added rx/tx internal
> delay to switch.

Okay. Heres'a an in-depth explanation, because I think many people need
this for MAC-to-MAC RGMII links. A MAC to PHY link:

	MAC1 ------- PHY1

The PHY mode in the MAC1 description controls the application of delays
at PHY1. This is relatively well undersood. Now, for a MAC to MAC link:

	MAC1 ------- MAC2 in a PHY

Let's say MAC2 is part of a PHY. Okay, so this is quite simple because
it's a PHY on the other end, and thus the situation above applies.

In both these cases, the MAC driver will pass the PHY interface to
phylib, which will in turn pass it to the PHY driver, which is expected
to configure the PHY appropriately.

There is a side-case, where a MAC driver is allowed to configure the
delays at its end _provided_ it then passes PHY_INTERFACE_MODE_RGMII
to phylib (telling the PHY not to add its own delays.)

Now let's look at something that isn't a PHY:

	MAC1 ------- MAC2 in a switch

In this case, MAC2 isn't in a PHY or part of a PHY that is driven by
phylib, so we don't have a way in the kernel of passing the PHY mode
from MAC1 to MAC2 in order for MAC2 to configure itself. It's tempting
to say that which RGMII mode is used doesn't matter, but consider the
side-case above - if we're talking about a MAC driver that interprets
the PHY mode and adds its own delays, then it *does* very much matter.

It also matters for MAC2. This could be a switch port that can be used
as a CPU facing port, or a switch port that is used as a PHY. In the
latter case, it becomes exactly as the first two cases above.

Let's take a theoretical case of two ethernet MACs on the same system
connected with a RGMII link:

	MAC1 ------- MAC2

They both use the same driver. What RGMII interface mode should be used
for each? Would it be correct to state "rgmii-id" for both MACs?
Or "rgmii" for one and "rgmii-id" for the other.

You may notice I'm not providing a solution - this is a thought
experiment, to provoke some thought into the proper use of the phy-mode
property at each end of a MAC to MAC link, and hopefully gain some
realisation that (probably) using "rgmii-id" for both MACs probably
isn't correct given the model that phy-mode _generally_ states how the
opposite end of the RGMII link to the MAC should be configured.

However, currently it doesn't matter as long as we don't end up with
two MACs that are back to back and the MAC drivers decide to insert
the RGMII delay (the side-case I mention above.)

Personally, I don't like that we have this side-case as a possibility
because it causes problems (if you go through the thought experiment
above, you'll trip over the problem if you consider the combinations
of MAC1 and MAC2 that do/do not use the side-case!)

So, I would expect a MAC to MAC link to have "rgmii" at one end, and
"rgmii-id" at the other end, rather than both having the same RGMII
mode.

> Vendor downstream DT also adds 'pause' to the fixed-link nodes, and this
> may be something that should be added here. However, during testing flow
> control always ended up being disabled so I skipped 'pause' here.

Does it get disabled at the switch, or the stmmac end?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

