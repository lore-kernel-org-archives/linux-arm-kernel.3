Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F655D3514A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 07:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dtZ756YY08U7bg9gCLlbHxheqzmQ87Emq5OyGQIx0cI=; b=IzQ290DTOyIsymLamwhlcCiCKZ
	003F3HG7EWbNNj/KCfl2ctiHkopa8fTw/yMELQ/97F55wClqVHdHDwnupdF+WWVT4gRPSoh5fLtSF
	EPJiXgrmUgZAdTrkTj4NvQL9T80Efn7qyqlQCl4D1uZbH257SWeNCl3jAJ/qrd0asx/Vkm9Zp8TPI
	wjEg61Gc+TEJYhsPYhOF7CsBjcThZxiGQNCqgdBVP2zeQG+lo7oxEXzMwX/UB7m0YyAG9PazxQDKC
	6I73pTnnq8Nb9dm+SFBz1++SOz55Hf/hVkhhoZ3eSDp3zL/pkVaJ7CZnX9Ci/7PzF4N9DiagXf3F1
	9kmBWtuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7psu-0000000EC6m-28Bm;
	Wed, 01 Apr 2026 07:21:04 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7psr-0000000EC6Q-2z6d
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 07:21:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=dtZ756YY08U7bg9gCLlbHxheqzmQ87Emq5OyGQIx0cI=; b=LKFiCl0RCjhzJ3C+P5IS8FxFBb
	3BHkBjOpVXcISPhGwNG5h60PeNLqYYn9vKChFdm4c6MLX0tdzHkrNlHVb2hvz+orK1b74B1MhxJdU
	7i9Sm1uXrovvajmGSMAa5BvNlXfJk619PVxp5PfPkq4duZtjBKRxF7EWWrwADc6XK4ZykcLSCAhjm
	iMpBsDrjqXuwa+6EZjxqlh849Vm1cXwP8NA7ES/MTyxPsLqZQt1MRqHIJtYORUUYxbxO9gXc++R5j
	tgXlSJ81IL/dzjic9fnGN/f8hFfKZ6BEaoV0if/9PeTQbVfeEss3GupRLcsdfbtpRsX1+wgwFSxIW
	xllbjzZw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:48410)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1w7psl-000000002fC-40Ef;
	Wed, 01 Apr 2026 08:20:56 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1w7psi-000000004be-2FE0;
	Wed, 01 Apr 2026 08:20:52 +0100
Date: Wed, 1 Apr 2026 08:20:52 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
	Ong Boon Leong <boon.leong.ong@intel.com>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next v2 00/14] net: stmmac: TSO fixes/cleanups
Message-ID: <aczHVF04LIGq_lYO@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_002101_779609_27B78859 
X-CRM114-Status: GOOD (  20.16  )
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

This is a more refined version of the previous patch series fixing
and cleaning up the TSO code.

I'm not sure whether "TSO" or "GSO" should be used to describe this
feature - although it primarily handles TCP, dwmac4 appears to also
be able to handle UDP.

In essence, this series adds a .ndo_features_check() method to handle
whether TSO/GSO can be used for a particular skbuff - checking which
queue the skbuff is destined for and whether that has TBS available
which precludes TSO being enabled on that channel.

I'm also adding a check that the header is smaller than 1024 bytes,
as documented in those sources which have TSO support - this is due
to the hardware buffering the header in "TSO memory" which I guess
is limited to 1KiB. I expect this test never to trigger, but if
the headers ever exceed that size, the hardware will likely fail.
While IPv4 headers are unlikely to be anywhere near this, there is
nothing in the protocol which prevents IPv6 headers up to 64KiB.

As we now have a .ndo_features_check() method, I'm moving the VLAN
insertion for TSO packets into core code by unpublishing the VLAN
insertion features when we use TSO. Another move is for checksumming,
which is required for TSO, but stmmac's requirements for offloading
checksums are more strict - and this seems to be a bug in the TSO
path.

I've changed the hardware initialisation to always enable TSO support
on the channels even if the user requests TSO/GSO to be disabled -
this fixes another issue as pointed out by Jakub in a previous review.

I'm moving the setup of the GSO features, cleaning those up, and
adding a warning if platform glue requests this to be enabled but the
hardware has no support. Hopefully this will never trigger if everyone
got the STMMAC_FLAG_TSO_EN flag correct. Also adding a check for TxPBL
value.

Finally, moving the "TSO supported" message to the new
stmmac_set_gso_features() function so keep all this TSO stuff together.

 drivers/net/ethernet/stmicro/stmmac/stmmac.h      |   3 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 214 +++++++++++++++-------
 2 files changed, 150 insertions(+), 67 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

