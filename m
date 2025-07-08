Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6AF4C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 19:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HeTiWPyX1Uk+AB/SKOARIcNngzgui6r0hgRLKTkBHIA=; b=Er56tOzmfVvLiZSu7hG24eInMg
	hygKABMZlJ/HgfUzi4QxDYVbfhkBAyBiygUxckZQKZJCQqqvSWj7Ear5BqUt3sFhm2VDWz5wyi5ev
	bXm916f/1ARwqnYTLP4Xy7QseNE/sMyMRUetxZ5J0aBEI1SKbwOKMjsemhmF4Lb96ohy3XVlGyEk2
	y857RRMqbLJDx3f/yNUj/IeLgPlHzeS8BwRaNdlFher5jKmBRtjeZLY19aDqj34bHg++hB7P4ChWQ
	J9x5829FSgwJejozqly3ETqICjSJqXnXluO1ammsEK/wH+DdCeleKLBgv1dO+dNdIrLXXwiEX2ky4
	2l9vFOtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZEAA-00000006MjC-3mrH;
	Tue, 08 Jul 2025 19:39:34 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZCD9-000000067yI-1vWv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 17:34:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=HeTiWPyX1Uk+AB/SKOARIcNngzgui6r0hgRLKTkBHIA=; b=kGJYjVWq21LQqgydAHfeMNK8dp
	J+6sYTxzXjuLubKC7Msz6ENWEUhgmhPn7m7sPTbPabrY4Fba/Z4b1v/jshyrMB+sTdxoUK4iuh2/a
	w0SYNPthAl6FLk/Q0LS0blYMeW0hPMDJTZMy5Qe79sgTlbuRBhf8Er9jUGmxf6OxTVlY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uZCCl-000qlv-FD; Tue, 08 Jul 2025 19:34:07 +0200
Date: Tue, 8 Jul 2025 19:34:07 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Lizhe <sensor1010@163.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, rmk+kernel@armlinux.org.uk,
	vladimir.oltean@nxp.com, maxime.chevallier@bootlin.com,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: stmmac: Support gpio high-level reset for devices
 requiring it
Message-ID: <52b71fe7-d10a-4680-9549-ca55fd2e2864@lunn.ch>
References: <20250708165044.3923-1-sensor1010@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250708165044.3923-1-sensor1010@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_103431_498989_AC03B805 
X-CRM114-Status: UNSURE (   8.85  )
X-CRM114-Notice: Please train this message.
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

On Tue, Jul 08, 2025 at 09:50:44AM -0700, Lizhe wrote:
> some devices only reset when the GPIO is at a high level, but the
> current function lacks support for such devices. add high-level
> reset functionality to the function to support devices that require
> high-level triggering for reset

You can probably specify this in DT:

reset-gpios = <&qe_pio_e 18 GPIO_ACTIVE_LOW>;

The gpio core will then flip the meaning of

gpiod_set_value_cansleep(reset_gpio, 1);

such that a value of 1 will become low, 0 will become high.

     Andrew

