Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DA74CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 09:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3vHk8yv00/JQMYrmI8CKdJho/+2xxViBt86X+AiwkXs=; b=0uQOhwtGuNzkU5SSTsxeM5prz8
	eIeYogfBlKOwJ43xdoaTTI7LvQvu6F2yMdrqZO5VGrEkLSdPcKfOSUJhLS4AoXdlg7+Mc76CKBeG0
	NP5u4W475Swi5vGUNvGFFom+aXM2lw1md0V32UlxbwZRcWF3FCEXrQqDDe0MGlh/KxVaQqEnOXeXR
	CmD5jisiTKX9hj0vRYf8C2DCPOa/cgIsxZ0Z+xpVK0LZ8j2JQO64aAcKU8aJ0MW4S63wgpYJIH8Nh
	InLBzymVRxDmxCFT5quHhAl9JzFD2qdCyPnb8waBaNtiw8lWPKQQpb8MxGHz0RS06+mR6vpu+Fm7H
	3HkmQS9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIkzy-00000006sIJ-16L0;
	Tue, 11 Nov 2025 09:49:14 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIkzv-00000006sHF-2ZQL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 09:49:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=3vHk8yv00/JQMYrmI8CKdJho/+2xxViBt86X+AiwkXs=; b=lpAMrkJkFiawgDhsUd7cK2vYGW
	HHuZnAakrmemk6S3lWl3WIxalRsV0Fxr6TsaMz743ajjVlUUk8WVJAXlPVJ4cjEayDYBDB8DFO2k+
	/t83snfNII/EsKt1zpPpqhB/UFTr86lPP433nbohp8PheXFfoQl1QMn3iLbIrURUN5rocusBJH1A+
	C+ab8nwdr5Z4uc1LqBrHaDwvLLGqT+flXKWN+gz9/A7udKvpVzW8CPyhMcxtUbETtgDIRnBzM0A0+
	E4sH7O377i+vT70DtUZvs6qJcZ2e7vHFUNY0l4ir1hy3qP+eKy5+rp/RbEZjUVLbfU21f0q3LsfEV
	d4kkO1rA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:43662)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vIkzh-000000002It-12u1;
	Tue, 11 Nov 2025 09:48:57 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vIkzd-000000002qb-21yZ;
	Tue, 11 Nov 2025 09:48:53 +0000
Date: Tue, 11 Nov 2025 09:48:53 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, maxime.chevallier@bootlin.com,
	boon.khai.ng@altera.com, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 2/2] net: stmmac: Disable EEE RX clock stop when
 VLAN is enabled
Message-ID: <aRMGhXohIK5swFSM@shell.armlinux.org.uk>
References: <20251111093000.58094-1-ovidiu.panait.rb@renesas.com>
 <20251111093000.58094-3-ovidiu.panait.rb@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251111093000.58094-3-ovidiu.panait.rb@renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_014911_657815_6A60114C 
X-CRM114-Status: GOOD (  19.17  )
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

On Tue, Nov 11, 2025 at 09:30:00AM +0000, Ovidiu Panait wrote:
> On the Renesas RZ/V2H EVK platform, where the stmmac MAC is connected to a
> Microchip KSZ9131RNXI PHY, creating or deleting VLAN interfaces may fail
> with timeouts:
> 
>     # ip link add link end1 name end1.5 type vlan id 5
>     15c40000.ethernet end1: Timeout accessing MAC_VLAN_Tag_Filter
>     RTNETLINK answers: Device or resource busy
> 
> Disabling EEE at runtime avoids the problem:
> 
>     # ethtool --set-eee end1 eee off
>     # ip link add link end1 name end1.5 type vlan id 5
>     # ip link del end1.5
> 
> The stmmac hardware requires the receive clock to be running when writing
> certain registers, such as those used for MAC address configuration or
> VLAN filtering. However, by default the driver enables Energy Efficient
> Ethernet (EEE) and allows the PHY to stop the receive clock when the link
> is idle. As a result, the RX clock might be stopped when attempting to
> access these registers, leading to timeouts and other issues.
> 
> Commit dd557266cf5fb ("net: stmmac: block PHY RXC clock-stop")
> addressed this issue for most register accesses by wrapping them in
> phylink_rx_clk_stop_block()/phylink_rx_clk_stop_unblock() calls.
> However, VLAN add/delete operations may be invoked with bottom halves
> disabled, where sleeping is not allowed, so using these helpers is not
> possible.
> 
> Therefore, to fix this, disable the RX clock stop feature in the phylink
> configuration if VLAN features are set. This ensures the RX clock remains
> active and register accesses succeed during VLAN operations.
> 
> Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>

Thanks for the patch. I guess there is no other way around this, since
as I've previously noted (and as you say above) we can't sleep in the
VLAN ops to access the PHY.

I would like a comment in the code above this if() to state that EEE
RX clock stop is disabled to allow access to VLAN registers to work.
With that added, please add:

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

