Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C7CAC83F0A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 15:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t79h60EOE9SVzV/lSAFUANryOijd3ceSpP+xl2sr/zo=; b=JpoOh6d3fZ0OdYult2jZRrHyf9
	l/f2tTugG8AvzEVAZ8IcC7Ki4Pj2+jFb6SYy0kIf+QwyVdzE/jZz4Y6hkxrkTjpmlWnc1pfcK0yuD
	4VESA1o590AgAs9BnUcyy7VxP1ITShuHVzaR4cnZOp9Vf+/T3+3P2Acx4AxI0nDSWS8KzSwQyhXaj
	ILWE6ugIdmswta13PLV54j5a9Z5x8ksGU/pB7QYv4spSPELNL7w71q4nIM7c/0g7XxEMUEhK94QNx
	gH2uxr0u+aSm4TnJ+lc67y/8A9lZ/ImFAMVsDacJ5/mZhTv7ysrUuLg1EE8o/513FR1Df3gynujLK
	BT7okceg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZWbz-000000099DU-2Va0;
	Wed, 09 Jul 2025 15:21:31 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZUJx-00000008h7x-40Qe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 12:54:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=t79h60EOE9SVzV/lSAFUANryOijd3ceSpP+xl2sr/zo=; b=us
	p4w+HpkHUACw9jAJA+G2O9+nD3UMKn8yluu61YrP7Maq0gfFET9IcIIAaaGtzzYe4xWKa8EI4eA26
	+tOH+Dmcj1nQ5UFzZA763YXpz5Zld1dO+GjmqqbkH1KTPpSy6wACvmOJQ/lr2jWKgopP5uUgJQp4d
	y5zbOerb4VCgeBA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uZUJX-000wOt-Ak; Wed, 09 Jul 2025 14:54:19 +0200
Date: Wed, 9 Jul 2025 14:54:19 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: lizhe <sensor1010@163.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, rmk+kernel@armlinux.org.uk,
	vladimir.oltean@nxp.com, maxime.chevallier@bootlin.com,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: Re: [PATCH] net: stmmac: Support gpio high-level reset for
 devices requiring it
Message-ID: <30933244-bfc0-4f6c-9dec-0db4bb33ba58@lunn.ch>
References: <20250708165044.3923-1-sensor1010@163.com>
 <52b71fe7-d10a-4680-9549-ca55fd2e2864@lunn.ch>
 <5c7adfef.1876.197ece74c25.Coremail.sensor1010@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5c7adfef.1876.197ece74c25.Coremail.sensor1010@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_055445_991591_9F4B1866 
X-CRM114-Status: GOOD (  11.72  )
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

On Wed, Jul 09, 2025 at 09:57:50AM +0800, lizhe wrote:
> Hi， Andrew
> 
> Thx,
> 
> 
> i conducted an experiment, and no matter whether i configured it as 
> 
> GPIO_ACTIVE_LOW or GPIO_ACTIVE_HIGH in the dts, the resulting
> 
> GPIO pin state was 0, indicating a low level.

You need to keep digging and understand why.

Scatter some printk() in the gpio core code. Does it recognise the
option in DT? Is GPIO_ACTIVE_LOW, FLAG_ACTIVE_LOW being set?

Put some prints into the actual GPIO driver, what is passed to it.

There is something interesting in gpio.txt:

Most controllers are specifying a generic flag bitfield in the last cell, so
for these, use the macros defined in
include/dt-bindings/gpio/gpio.h whenever possible:

It says 'Most'. Is the GPIO controller you are using not actually
doing this?

	Andrew

