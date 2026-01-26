Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F7B2D19510
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 18:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qh2+4EAwmLQeQZACP33br3DlT9jNVGAtBcqIW3K6GBY=; b=BOs4zOxEqJt7/+MHp6gou7S8QD
	jlFVqVwthP+FZU2wh9aumjHTaQ/2jTJhRTutgVS8potRMSWHHGUWu2Ald5PpijH+Ew1oJeYzJ83bi
	RovvVdyp/3Sn4cpolXS/VLzlx1YiWsqk3vWGw3fHrlWNLTyNfyB6p5bhCLSQfCpxDZcY84QPhTJo3
	3r+Uk+MDVbyS7Jx1Vtq9a+SVxBQsLMJFh+pfqUSOVBvE7kRvJP9qPeozVvtGdSYWwzz8hJDnwhTXi
	eCveevKfOoS4Aj9VFDpH38tP09m1+Af1vyw5526cCs7XOIM4WWQCoUAfmpXpUlNDSfXHUNoNHFEX1
	Ie5opxQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkRLE-0000000D4yj-3Zwh;
	Mon, 26 Jan 2026 18:29:37 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkRLC-0000000D4yO-1dpz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 18:29:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Qh2+4EAwmLQeQZACP33br3DlT9jNVGAtBcqIW3K6GBY=; b=1oXHcVOEbBsPeKtD7teuUoyUKA
	rEBoh0VAB/JUFwdTHamwVXxwBqSyg+KkaZ322sjhe0tRa2s7gqMStIkRCsySN7cZA88CYuQcsSHcC
	j+TqI2EKxYDKw1sNcGyXmSgoTZXLfKB32XKFjCtebURP5xz4/EEQyoTsQwric7NIr0IyMg97NRH5Y
	v+FcwuOtnXLHiujV4gsTpe3Hmt/e8M9mUR5dZFRTH42BRUeA/DlcylNQGh2GVhWuy+m+QMtUSl6ik
	w4uHLniv9u0Vqhat1i6uZLKRlsN0UazPmmom41ZzD8iCUNRvSJFj15FQw+6nX2T4rG7lZK0J1cKuP
	n20j5Y7A==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:58892)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vkRKr-000000005Ew-2moS;
	Mon, 26 Jan 2026 18:29:13 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vkRKn-0000000059Q-1LXH;
	Mon, 26 Jan 2026 18:29:09 +0000
Date: Mon, 26 Jan 2026 18:29:09 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Min Lin <linmin@eswincomputing.com>
Cc: Bo Gan <ganboing@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	=?utf-8?B?5p2O5b+X?= <lizhi2@eswincomputing.com>,
	devicetree@vger.kernel.org, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	netdev@vger.kernel.org, pabeni@redhat.com,
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	ningyu@eswincomputing.com, pinkesh.vaghela@einfochips.com,
	weishangjuan@eswincomputing.com
Subject: Re: Re: [PATCH v1 1/2] dt-bindings: ethernet: eswin: add clock
 sampling control
Message-ID: <aXeydXuWEMDz-yVM@shell.armlinux.org.uk>
References: <308b676.2d03.19bb0caebed.Coremail.lizhi2@eswincomputing.com>
 <59cec617-0189-4dc3-bc3f-6346155a62ae@lunn.ch>
 <4e2a55e7.3662.19be8cb9c3c.Coremail.lizhi2@eswincomputing.com>
 <c5c0bfdb-316d-4796-afa0-f6f018ceb414@lunn.ch>
 <abf12a3f-9cdd-472d-a02e-af4da594b84f@gmail.com>
 <e6f7da45-3dec-4af6-a5b1-a72210bf24f4@kernel.org>
 <43923bf9-6202-4147-8eac-5bd7bb653fd4@gmail.com>
 <bd202cfa-d6eb-4d0e-982d-b49795dd25f7@lunn.ch>
 <009aefc4-fbc9-4f91-9230-23d18c281bf3@gmail.com>
 <73ea5619.2b71.19bf847c80d.Coremail.linmin@eswincomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <73ea5619.2b71.19bf847c80d.Coremail.linmin@eswincomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_102934_452735_EADE0537 
X-CRM114-Status: GOOD (  10.23  )
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

On Mon, Jan 26, 2026 at 11:10:12AM +0800, Min Lin wrote:
> Due to chip backend reasons, there is already a ~4-5ns skew between the RX
> clock and data of the eth1 MAC controller inside the silicon.

Let's analyse this.

	TXC / RXC	TXC / RXC
Speed	Clock rate	Clock period
1G	125MHz		8ns
100M	25MHz		40ns
10M	2.5MHz		400ns

The required skew for TXC and RXC at the receiver is specified to be
between 1 and 2.6ns irrespective of the speed. The edge of the clock
is also important: the rising edge indicates the lower 4 bits, and
the falling edge indicates the upper 4 bits.

At 1G speed, with a "4 to 5ns" skew in the chip. If this is accurate,
then inverting the clock and adding 1ns of additional skew by some
means (PCB trace, or at the MAC or PHY) will give the required clock
at the receiver.

The timing table in the RGMII standard (3.3) allows for Tcyc (the
clock rate) to be scaled, but there is no allowance for scaling
TskewR (the required 1 to 2.6ns skew.) This skew parameter is
fixed.

So, at the other speeds, you are completely unable to meet the timing
specification, whether irrespective of the clock inversion. In effect,
the only speed that you can meet the specification is 1G.

Thus, I think this is something that needs a lot more than just "do
we need to invert the clock". You also need to prevent 10M and 100M
being supported IMHO.

I can't get my head around why someone would come up with this crazy,
crippled design, but maybe they didn't bother reading the RGMII
specification and ensuring that their design met the requirements
before implementing the hardware.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

