Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F4B8CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Oct 2025 08:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DiTcJgJML7VPWotE97Q4MxQQlpiwpQepFZOTkMMNb1w=; b=p64NrgO3idERWXLkqnp/EPZ6cr
	Yeqy4ZhoJ/CfMSdjUsclIIL7emZu2sNwqrTaCZHcWy9kd2XPefs7eZsX2cJodTTGnor43YIwiSzzo
	fRh1xB1JK0ec/DlhXcPojNgObGEkwKeqZdw69JhqOmYfOoUsQuDkeTcyB5SD7FYmHPvlx+ZGmfFMw
	PA4Jbtvog1JxkfUNDLKfYm1o5ceGSKZ++WiWmQpLqFkmcJjN4gFfL9GRib4TiUCWVK3W+eSDWHEoO
	TIJPckA9Pxgc9jyKrkJy6jAxc9/1or1ExlHx6+2D//tJFO1OZ8AcEZVGx06V0vkRAh/sb8knkE4T2
	Lk4EHCQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCZEr-0000000B6iE-4Bub;
	Sat, 25 Oct 2025 08:03:02 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCZEp-0000000B6hN-1yyg
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Oct 2025 08:03:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=DiTcJgJML7VPWotE97Q4MxQQlpiwpQepFZOTkMMNb1w=; b=l1fpE7eNDN2Pio1MCdPSCLkAQq
	IqiddzouUUi+vK/4ATK6jSRXOuBhK4+IxdbhyjzslRPAOc5MrxM5kBBrK2IKdBJXX9CV1i58mxy0F
	mJQAddngLfempOQS1thJHdfCr3LPasqIvdT2EmI19meX+dMAd3Pm1xvLge6sg2LSjhmuEm+bGnAjc
	x5Q0IRoumx6GNBj6hJhIN6N9WAtch3jgY9jw0fGUtxYN4Gs3Av9NclVjzsPZytRW6AzbQKYIxvmGo
	JuIEDi4KXIKsKKK0o5ONByXkO/3Go4Kby0H5Gtqld5zDiqjDCMHh2tUDUSvWY0LeTP+NWwtlGODqr
	wU7Bo2Ig==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:47732)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vCZEh-000000008P1-2JUj;
	Sat, 25 Oct 2025 09:02:51 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vCZEe-000000003Vi-1fyn;
	Sat, 25 Oct 2025 09:02:48 +0100
Date: Sat, 25 Oct 2025 09:02:48 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next 1/2] net: stmmac: add stmmac_mac_irq_modify()
Message-ID: <aPyEKGCeXwnsn4OC@shell.armlinux.org.uk>
References: <aPn5YVeUcWo4CW3c@shell.armlinux.org.uk>
 <E1vBrtk-0000000BMYm-3CV5@rmk-PC.armlinux.org.uk>
 <20251024190159.60f897e5@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251024190159.60f897e5@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251025_010259_533799_0AE8EC57 
X-CRM114-Status: GOOD (  15.42  )
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

On Fri, Oct 24, 2025 at 07:01:59PM -0700, Jakub Kicinski wrote:
> On Thu, 23 Oct 2025 10:46:20 +0100 Russell King (Oracle) wrote:
> > Add a function to allow interrupts to be enabled and disabled in a
> > core independent manner.
> 
> Sorry for a general question but I'm curious why stick to the callback
> format this driver insists on. Looks like we could get away with
> parameterizing the code with the register offset via the priv structure.

Not quite - some cores, it's a mask (bits need to be set to be disabled).
Other cores, it's an enable (bits need to be set to enable). So one
can't get away with just "this is where the register is", it would need
three pieces of information - register offset, type of regster (mask or
enable) and then a core specific bitmask.

> Mostly curious. Personally, I'm always annoyed having to dig thru the
> indirections in this driver.

Me too, especially when it's not obvious what is an indirection and
what is not. There's the fun that a lot of the PTP-related indirection
actually has no difference. For example, at the bottom of
stmmac_hwtstamp.c, the struct stmmac_hwtimestamp initialisers have
almost all of the methods pointing at the same implementation
with the exeption of .get_ptptime, .timestamp_interrupt and
.hwtstamp_correct_latency.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

