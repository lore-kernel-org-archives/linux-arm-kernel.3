Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5C80C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 16:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q0NF0L3kcXAIrlIUaY/JZCJLHtTs0ZlzHcUdeIHuQes=; b=wY7DVYMpS3xuCc2i6P9ubptK/D
	sEYe6c0hEaL7Wg7unhXzVMr0pQyl+SaM57jWipvdfBdMdFSED7Djhs+Bcvv217vFPx6EbesSORbQO
	awVdyb/RV1XhGogphHNHQT+g3F2/cmP6dvMYx9ozRUp9kVVuUG7wrQCHFPIXhaORusLmmHHDZKpPw
	RBC3G9crQ97/r7N2T60C3ZLSheg84jMTpTDrTW0vWZkJWvOWCW/HaAU0/28Mht9aIRnZk4PAPyKor
	DVYvyqKZ06E/O1LuH/kc7P2PwmMvK1RwGTsP+SgFusyF9STTfaa1fhTsgch3O+tzdSKBveRHMozb4
	dDO7e6Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugQsS-0000000F0AN-3cO8;
	Mon, 28 Jul 2025 16:39:04 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugPxc-0000000Er3Z-3Kaz;
	Mon, 28 Jul 2025 15:40:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=q0NF0L3kcXAIrlIUaY/JZCJLHtTs0ZlzHcUdeIHuQes=; b=YFdULwoBKH8lALuAaM6Ubz8QzV
	wjHrW0iCk5dDulWWurBeJg99G/q/tLpP0xi4V1TdN1kxGQPBiH6PR6QynS+fdE64dxYcbN7TwhsTR
	4f6sktlQnJnkvbKz846r+1LMZsditTsUH3f7N9H6w1yeviP3WbpZBLT6jX1CZ9c27kSc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1ugPxO-0036Tn-0m; Mon, 28 Jul 2025 17:40:06 +0200
Date: Mon, 28 Jul 2025 17:40:06 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Alvin =?utf-8?Q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Yao Zi <ziyao@disroot.org>, Chukun Pan <amadeus@jmu.edu.cn>,
	Heiko Stuebner <heiko@sntech.de>, netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 2/3] net: dsa: realtek: Add support for use of
 an optional mdio node
Message-ID: <2f942223-8683-4808-8f7a-4f46e18f402d@lunn.ch>
References: <20250727180305.381483-1-jonas@kwiboo.se>
 <20250727180305.381483-3-jonas@kwiboo.se>
 <2504b605-24e7-4573-bec0-78f55688a482@lunn.ch>
 <badef015-22ff-4232-a4d0-80d2034113ca@kwiboo.se>
 <9702f3da-f755-4392-bf2b-28814ee0a8c7@lunn.ch>
 <1c639c62-cc07-4b3d-a18b-77f93668b88f@kwiboo.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1c639c62-cc07-4b3d-a18b-77f93668b88f@kwiboo.se>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_084020_828564_39886910 
X-CRM114-Status: GOOD (  10.95  )
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

> When it comes to having the switch being described as an interrupt
> controller in the DT is also very wrong, the switch only consume a
> single HW interrupt. The fact that the driver creates virtual irq for
> each port is purely a software construct and is not something that
> should be reflected in the DT.

I think that is not always clear cut. Switches can be considered SoC
of their own. They have multiple hardware blocks, which can be
described independent, just like a traditional SoC and its .dtsi
file. The switch blocks can then be connected together in the same way
SoCs are.

I've not looked at this particular switch driver, but the Marvell
switches have a similar single interrupt output pin connected to the
host SoC. Within the switch, there are at least two cascaded interrupt
controllers. We implement standard Linux interrupt controllers for
these. That allows us to use standard DT properties to link the
internal PHY interrupts to these interrupt controllers.

	 Andrew

