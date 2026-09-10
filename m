Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4707C79FBF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 18:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4CaEfw1iqgEa+C7dVfyRUqNDVvrpugZEtCfu0akm+So=; b=P5gwABeZljB5iLWxk6PLNdKo41
	pR4Zsea/zDvcx4UqWExSm/7ooYKt6hg+XpDjH5156a0AQF3eugRvMcTjC1bBwcUTrcC7oBbuOAo+E
	HdBWcS8ZPwAiXbL9JIDA2r+6G/rrmYiVLhmFZ9+pUXUQJBHPg9xl9JWpZ0BKG29fEvaN2QGgaVtNo
	fbYPL2ubMOPDiLKyWYdFtvCym6CpV/7coroRi9l3ZATRmQuBN1ZpXpnq/DGg5s5UFpIh9ak+9mYIX
	13msAaMc66J/5Mw/rqW1YKdPsA+MIE3XBJxIdib1keXepPJGIJ8S2kMx5DbUd/S/SCqvSp/J7vphP
	NBPLs1bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4jGk-0000000F84p-49zL;
	Thu, 10 Sep 2026 18:13:06 +0000
Received: from mail.tipi-net.de ([2a03:4000:43:185::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4jGi-0000000F84Q-38dy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 18:13:06 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D6306A561B;
	Thu, 10 Sep 2026 20:12:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1789063980; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=4CaEfw1iqgEa+C7dVfyRUqNDVvrpugZEtCfu0akm+So=;
	b=cr69UKyB6Yusde/ckElSBYTgezjbN7b9OLuyvAsZFZ6zuNl79sDgAOMb9/oSPBI+Ns3vFx
	bLPzDGWPZNpFHJg3Og0D89uvVu/7Br59Zeh45zK333fycwlxBjxiX1wd/E2LtEMQYBowLo
	DsNQDXWtHYJrvJajPfRD5RECEOhNg4mFf1SmppEM5BnqOCysZZK7wtZ3xfXPnpRi0AZ6hA
	hhfv1ubKOGSlrjW5XHDbGMH9G4UWf3iPg+5eAjPd4aP43hWe6NrLfrI9amnrzuBfkracnT
	Cw/Jy0Y4Drrz9g4ALWqrzOJRJmdyhlL8i5IqDJ/gDnq7lACn8vm/fdgR4XSorA==
MIME-Version: 1.0
Date: Thu, 10 Sep 2026 20:12:51 +0200
From: Nicolai Buchwitz <nb@tipi-net.de>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>, Heiner Kallweit
 <hkallweit1@gmail.com>, =?UTF-8?Q?Alexis_Lothor=C3=A9?=
 <alexis.lothore@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Emil Renner Berthing
 <kernel@esmil.dk>, Minda Chen <minda.chen@starfivetech.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Jan Petrous <jan.petrous@oss.nxp.com>,
 Ovidiu Panait <ovidiu.panait.rb@renesas.com>, Jose.Abreu@synopsys.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, PKneuper@dspace.de, David Laight
 <david.laight.linux@gmail.com>
Subject: Re: [PATCH net v2 1/6] net: stmmac: selftests: Support running
 selftests on DSA conduits
In-Reply-To: <20260910151404.976753-2-maxime.chevallier@bootlin.com>
References: <20260910151404.976753-1-maxime.chevallier@bootlin.com>
 <20260910151404.976753-2-maxime.chevallier@bootlin.com>
Message-ID: <fd9dc3cf645b4a78d28846d7d6e1fc81@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_111304_965524_EC44F5E1 
X-CRM114-Status: GOOD (  13.23  )
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

On 10.9.2026 17:13, Maxime Chevallier wrote:
> Most stmmac selftests rely on dev_add_pack() to add custom handlers,
> that validate the packets sent to ourselves through MAC loopback.
> 
> However, when the stmmac-driven interface is a DSA CPU conduit, all
> frames that are received have ETH_P_XDSA as a protocol, even though 
> they
> don't actually contain any tag as they come from the loopback and not
> the switch.
> 
> This will prevent any incoming packet to match our packet handlers.
> 
> Let's register a ETH_P_ALL packet handler when we detect that we're a
> DSA conduit, and use a proxy packet handler to filter the h_proto.
> 
> Note that we may still receive incoming packets from the switch, but
> these frames shouldn't interfere with the very specific frames used for
> selftests, and stmmac selftests in general aren't safe against external
> traffic interferences.
> 
> This was validated on a WPQ864 devkit for IPQ8064, that has the SoC
> connected to a QCA8k switch.
> 
> The ARP offload's packet handler is left alone, this feature is just 
> not
> implemented in stmmac and due for removal.
> 
> Fixes: 091810dbded9 ("net: stmmac: Introduce selftests support")
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> ---

> [...]

Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>

Thanks,
Nicolai

