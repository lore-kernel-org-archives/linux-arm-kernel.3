Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D4C7C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 14:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hnXBrp6nZj1igjITrTimshdIDwjv73qcH+GOPbSCUXk=; b=DO5OLKfxyseeH0ayNlVdCv5kge
	pYLRzTLoGRwsNBjsDbGa9sv5QgWCyq32I4prMVcQS1IZ+bxOW76HLLbg5nK9yuO/YWcexA1o9N3B4
	FlnzwyoARtuAVv/gVJwNkBhjOU+uW03EkUIPsSslB2NkVKZHDSYuDdFWlWCNA9wTRkzKGwSnAUQhD
	VI4quonQ0CQbvcjQ+ILFp/gIuRy1agTpkY7Iwog5E5QKJYVDHJHxx8R2IuqimnApCpexxMUY3lH2q
	YmusCPNQncQscTpW0Eg8rDAuKAt6zjR5CCy5i2e4XuX6rDIq66GLsBRfzxntLtaf9K7FgCRyzZUKm
	Ilg9lCJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueaqX-00000005HYx-0iJk;
	Wed, 23 Jul 2025 14:53:29 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uea35-000000058Ri-3klp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 14:02:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=hnXBrp6nZj1igjITrTimshdIDwjv73qcH+GOPbSCUXk=; b=gdY94EqZaE3KR5jXzRnewjo9j5
	dUhX3/ZwF3t7tQ4kLjRQ80zgcsHZwbSkawzNvRgELZGmeQNNoi48mr4P3YBz1mIcSQbeHy1MooEf2
	hRQNbLaUae0+pOCg6XV7N9BQQ9gLi593mxlmQeeNAuui0kCR8nF763Il9lhWAOPOhSZI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uea2m-002aZn-6G; Wed, 23 Jul 2025 16:02:04 +0200
Date: Wed, 23 Jul 2025 16:02:04 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christophe Roullier <christophe.roullier@foss.st.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Simon Horman <horms@kernel.org>,
	Tristram Ha <Tristram.Ha@microchip.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 1/4] dt-bindings: net: document st,phy-wol
 property
Message-ID: <dea45ecd-c183-426b-abae-12220a2b6827@lunn.ch>
References: <f5c4bb6d-4ff1-4dc1-9d27-3bb1e26437e3@foss.st.com>
 <e3c99bdb-649a-4652-9f34-19b902ba34c1@lunn.ch>
 <38278e2a-5a1b-4908-907e-7d45a08ea3b7@foss.st.com>
 <5b8608cb-1369-4638-9cda-1cf90412fc0f@lunn.ch>
 <383299bb-883c-43bf-a52a-64d7fda71064@foss.st.com>
 <2563a389-4e7c-4536-b956-476f98e24b37@lunn.ch>
 <aH_yiKJURZ80gFEv@shell.armlinux.org.uk>
 <ae31d10f-45cf-47c8-a717-bb27ba9b7fbe@lunn.ch>
 <aIAFKcJApcl5r7tL@shell.armlinux.org.uk>
 <aIAKAlkdB5S8UiYx@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aIAKAlkdB5S8UiYx@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_070223_942668_7CD80E23 
X-CRM114-Status: GOOD (  19.51  )
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

> I've just read a bit more of the RTL8211F datasheet, and looked at the
> code, and I'm now wondering whether WoL has even been tested with
> RTL8211F. What I'm about to state doesn't negate anything I've said
> in my previous reply.
> 
> 
> So, the RTL8211F doesn't have a separate PMEB pin. It has a pin that
> is shared between "interrupt" and "PMEB".
> 
> Register 22, page 0xd40, bit 5 determines whether this pin is used for
> PMEB (in which case it is pulsed on wake-up) or whether it is used as
> an interrupt. It's one or the other function, but can't be both.

This sounds familiar.

> rtl8211f_set_wol() manipulates this bit depending on whether
> WAKE_MAGIC is enabled or not.
> 
> The effect of this is...
> 
> If we're using PHY interrupts from the RTL8211F, and then userspace
> configures magic packet WoL on the PHY, then we reconfigure the
> interrupt pin to become a wakeup pin, disabling the interrupt
> function - we no longer receive interrupts from the RTL8211F !!!!!!!

Ah. I thought that switch happened in the PHY driver suspend() call,
and it gets restored in the resume() call? That does required that
suspend/resume actually gets called despite WoL being enabled...

	Andrew

