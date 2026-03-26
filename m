Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF95310A88F5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 17:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AxDSnNL/u8N3iCRzT8SvQaiyV0V6Lf/VVxcJwZ5quX4=; b=wl7w+yNPpPTyMzR4wkD/KW13xI
	X1Jrm6ubDnomrhrhxlMrt9j5qlHroDGI8wDhRa87BfaB7aApv5OXW2eQW0aFQp8vpQTdHSNcAccpB
	lE0LD8ddOGTsUbsD9BaOVm42WtpKe9710/jfk88MfnG5Bak2JdBu5lO+TWI9avJY/Fk+xFGiNKDzu
	PMoKbV8Dxu70iwIQkf3Z3vesEyx5MjFfRplSK2Rx+XQsrad4sbf9WB0oWnwzCdicic4BpBOckQOMX
	OjeF/75uoSDdrBYZ2PCKAL9p01qjPka0Bds6gX1b+fCvcLm2oOmhQ/OCJM3lkAZW6RoL87qXMfuVr
	hn4i2S2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5oo7-00000005z05-2FEJ;
	Thu, 26 Mar 2026 17:47:47 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5oo5-00000005yzO-2yM1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 17:47:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=AxDSnNL/u8N3iCRzT8SvQaiyV0V6Lf/VVxcJwZ5quX4=; b=XRgb8LsvWYsTTIlo8Zxg3c8Mg2
	SroOvC7VmpQrHi01O5KeJdSNXpz85f0PncL1ARLtaBuEHhNLTeOrAX3l1k7M4BgeMXUzy4BFO6nUz
	uIA5/7yikZ2Ba2kWKNxYmleFglUmhOyrDo1FZAIA4lvV3m9t80slEZwWjWi6I/CRVu3MBgHBH7Bp6
	Ozof29IoG+XDLRvsvYviwE3RkLTeBHSRl/qHyMr5MWHyJl/6Gw5H1wSE/TYY6ASRkuqEWYr6wK7G2
	Xsauw971tdYRmcOyvKPB55AyTzLe4pC8/g9wD6Sh1Cd79upmI1Owk88xXslWvnHd9k2H9sE6jO88U
	x3LYWhgg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34394)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1w5onv-0000000057d-27mi;
	Thu, 26 Mar 2026 17:47:35 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1w5ons-000000007Ec-4AcB;
	Thu, 26 Mar 2026 17:47:33 +0000
Date: Thu, 26 Mar 2026 17:47:32 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Simon Horman <horms@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Conor Dooley <conor+dt@kernel.org>,
	"David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org,
	Eric Dumazet <edumazet@google.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jakub Kicinski <kuba@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
	Yao Zi <me@ziyao.cc>
Subject: Re: [PATCH net-next 1/2] net: stmmac: remove axi_kbbe, axi_mb and
 axi_rb members
Message-ID: <acVxNBLE8Ck2qfjc@shell.armlinux.org.uk>
References: <acJh4z3pRKkeaFbR@shell.armlinux.org.uk>
 <E1w4ydo-0000000Dlpb-34jd@rmk-PC.armlinux.org.uk>
 <20260326172943.GR111839@horms.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260326172943.GR111839@horms.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_104745_769886_4C0B0792 
X-CRM114-Status: GOOD (  13.47  )
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

On Thu, Mar 26, 2026 at 05:29:43PM +0000, Simon Horman wrote:
> On Tue, Mar 24, 2026 at 10:05:40AM +0000, Russell King (Oracle) wrote:
> > axi_kbbe, axi_mb and axi_rb are all written, but nothing ever reads
> > their values. Remove the code that sets these and the struct members.
> > 
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> 
> Hi Russell,
> 
> FYI, AI review suggests that these fields should also be removed from
> Documentation/networking/device_drivers/ethernet/stmicro/stmmac.rst

I noticed. I've prepared an update if netdev folk want that to happen
as I've noticed that that documentation is fairly out of date now.

Do we think it's still useful, or should we consider deleting or
trimming it down? Would it be better to move the struct definitions
into the header file and making the header file part of the docs so
that the documentation is local to the structs?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

