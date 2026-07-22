Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC2E3C44539
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 13:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wr+ewd5waDN6ADYJpilEPIvuynye3ldhe8wIwOoFlp0=; b=EeRYHPyiGbo1tdcSFX8/9Wsx5z
	UbOhy0uJ3b9/ydagWm4XF1njWy646TMrSBWz/CWphbCS+5MSp9P44fIe1fP6JJDx/UWwvuqaNfGW/
	e92RicZrWJgmkRGy4/G8Gvj0yIVXun3NSG+FTpf2WsjBv97tpf6f+dZ8VicwPWl6f3oxhpQlbfvkL
	AFTo4lQJRyyrbtloOQKTS1ftJ4NYy90t5occGOvQWrTK4gctMPWiLKkeLNb2BscRiPDWtdWz1X0Wo
	IBq9lKiGDGBlGy8AalmZHeOTXOo7r8qDvRSnqxYrE3UvESZZC1sxyeM/dM5opAqW5Z8MydvNKqcbw
	QtSus1uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmXBT-0000000BvXj-2xKo;
	Wed, 22 Jul 2026 13:40:27 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmXBP-0000000BvWW-2VWa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 13:40:25 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E38F54E40ECF;
	Wed, 22 Jul 2026 13:40:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AF3F360388;
	Wed, 22 Jul 2026 13:40:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6A6DF11BD03C7;
	Wed, 22 Jul 2026 15:40:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784727617; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=wr+ewd5waDN6ADYJpilEPIvuynye3ldhe8wIwOoFlp0=;
	b=OOO99RNAiChT0FMMosou7lSmLXLDP2UqgctMVht4RjYFcfQT7iyB40FxEX3mU5geMkypIb
	DfHxt/nFmORYZW78euYSK+LtlO7jR+8+WCMRCIQScXtCGzq8cCer3VmZlefHDrPVq2lWv3
	HbHK14gYV7Ep0bfNoyAuhcS/h5J7hkLpoWXrO7sUh+PeomdeGuVibTTtxdF2MuHWDfEsBW
	O/dxLhbSoT518ME6bO3dNotb5WdC8As/hP8tF9qL8zxysD7/ly/B2Xww4nwVrZto7Yr2bA
	xm+rp+LruZ5H1Bo65teOA3GqnS/hNg+6E4MvNDvreYCI1cLHfmH7OXuKXMDiBQ==
Message-ID: <b8f125be-e91f-4b44-8664-5746edb28f33@bootlin.com>
Date: Wed, 22 Jul 2026 15:40:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: stmmac: Skip PHY attach if custom PCS is in use
To: Zxyan Zhu <zxyan0222@gmail.com>, netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Russell King <linux@armlinux.org.uk>,
 Russell King <rmk+kernel@armlinux.org.uk>,
 Serge Semin <fancer.lancer@gmail.com>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Hariprasad Kelam <hkelam@marvell.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
References: <20260722131918.685761-1-zxyan0222@gmail.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20260722131918.685761-1-zxyan0222@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_064023_810266_D574F80A 
X-CRM114-Status: UNSURE (   9.59  )
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

Hi,

+Mohd

On 7/22/26 15:19, Zxyan Zhu wrote:
> When a platform provides a custom PCS via the pcs_init callback
> (e.g., for USXGMII with in-band autoneg), the MAC's phylink_pcs
> is already configured. In this case, phylink validates against
> the PCS's supported interfaces and manages link state through
> the PCS, so no traditional PHY device is needed.
> 
> Without this, stmmac_init_phy() falls through to the
> no-phy-node path and errors out with "no phy found" when
> the DT has no phy-handle for such interfaces.
> 
> Skip the PHY attach when priv->hw->phylink_pcs is already set
> and no phy-handle is specified in the device tree, allowing
> platform PCS implementations to handle the link autonomously.

Hmpf this bug again...

There have been multiple attempts at solving this, cf this thread :

https://lore.kernel.org/netdev/E1w66jW-0000000E3qS-23fW@rmk-PC.armlinux.org.uk/

Now, there wasn't any conclusion on that, but I _think_ the proper
solution is to re-apply Russell's original patch (the one in the link above)
and to add this current patch on top of it.

Russell states that this may (will ?) break qcom-ethqos, but OTOH
we're in need for a solution here, and with the pace of PCS-related
work that impacts stmmac, there's going to be a point where we may
need to think about compatibility.

TBF I don't understand the qcom-ethqos issue, maybe Mohd can help
with testing here ?

Maxime


