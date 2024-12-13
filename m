Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30DA9E77182
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 17:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qh9Zm1VmGUbfUfimsR2fhN/wfQpXtijhFkCUNze7318=; b=h9uNfatAkclXu8euxv527BL9Fy
	2HdfNlQE0Hi1E2WHGeABAGn6VR24QZ08bdcnK3Tan/AEi49DvjJTqtV5bZrXqszUDy0R9A2ib00R3
	FxSJCfEIXhxOwhWH6Qdsl3L5AY0yW0hY2eF1zpCvC4ZaIjAMSU1jkd7D+CZyPW9leM9gW7d2WGHyS
	etVqJh78V86wnpuYufHTwvJ9UkddODEd9O955W/81GLOu2oK3f7JJKEySSI4bREDMQ1IHhlhWe/Uw
	3K97kzAyGSbItAmeVpIv3sNLMZgxcngr2wVTnINwczYRilG26nqmaCK/p8P11EcZhXTq+0LDQcL6w
	iK1OMuGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM9UY-00000004Z8n-2PuO;
	Fri, 13 Dec 2024 17:30:18 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM9TS-00000004Z0A-3gMs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 17:29:12 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B246AC0006;
	Fri, 13 Dec 2024 17:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734110947;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qh9Zm1VmGUbfUfimsR2fhN/wfQpXtijhFkCUNze7318=;
	b=AQalMVSihDbNV7GO0/TcVv+Jhxil4XJ9NFon+gfZ3+6jeSdAs/h2D5x4du/rqyku1zjsEV
	jHledJm9X3nJ9w/4ZYxXw0VGSJimYUxqJ2s7zL1IRogsrEsmFXny/JyaNE4JgKPxUltoXy
	bbOy0xSAhT1e+eUsKmwMHTGP17gg9mYmUQW4nwllTH/iqF08QdwVGr37xpWqsLFGtsWoW5
	jZshQRSQEbs4NovEj0tT4w4O937zHMToa5TiLjA7aQyKPOnG8nS8dGnN/uSWCG71EeKxtF
	Gm+ZyztxUyEfCuw6id5w3/SylvJxbMdvOSj166I4N4yZfmDzMOv0yGa8ls6Z4A==
Date: Fri, 13 Dec 2024 18:29:04 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu
 <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexis =?UTF-8?B?TG90aG9yw6k=?=
 <alexis.lothore@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 2/2] net: stmmac: dwmac-socfpga: Set interface
 modes from Lynx PCS as supported
Message-ID: <20241213182904.55eb2504@fedora.home>
In-Reply-To: <Z1wnFXlgEU84VX8F@shell.armlinux.org.uk>
References: <20241213090526.71516-1-maxime.chevallier@bootlin.com>
	<20241213090526.71516-3-maxime.chevallier@bootlin.com>
	<Z1wnFXlgEU84VX8F@shell.armlinux.org.uk>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_092911_057060_522F7ACB 
X-CRM114-Status: GOOD (  24.57  )
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

Hi Russell,

On Fri, 13 Dec 2024 12:22:45 +0000
"Russell King (Oracle)" <linux@armlinux.org.uk> wrote:

> On Fri, Dec 13, 2024 at 10:05:25AM +0100, Maxime Chevallier wrote:
> > On Socfpga, the dwmac controller uses a variation of the Lynx PCS to get
> > additional support for SGMII and 1000BaseX. The switch between these
> > modes may occur at runtime (e.g. when the interface is wired to an SFP
> > cage). In such case, phylink will validate the newly selected interface
> > between the MAC and SFP based on the internal "supported_interfaces"
> > field.
> > 
> > For now in stmmac, this field is populated based on :
> >  - The interface specified in firmware (DT)
> >  - The interfaces supported by XPCS, when XPCS is in use.
> > 
> > In our case, the PCS in Lynx and not XPCS.
> > 
> > This commit makes so that the .pcs_init() implementation of
> > dwmac-socfpga populates the supported_interface when the Lynx PCS was
> > successfully initialized.  
> 
> I think it would also be worth adding this to Lynx, so phylink also
> gets to know (via its validation) which PHY interface modes the PCS
> can support.
> 
> However, maybe at this point we need to introduce an interface bitmap
> into struct phylink_pcs so that these kinds of checks can be done in
> phylink itself when it has the PCS, and it would also mean that stmmac
> could do something like:
> 
> 	struct phylink_pcs *pcs;
> 
> 	if (priv->hw->xpcs)
> 		pcs = xpcs_to_phylink_pcs(priv->hw->xpcs);
> 	else
> 		pcs = priv->hw->phylink_pcs;
> 
> 	if (pcs)
> 		phy_interface_or(priv->phylink_config.supported_interfaces,
> 				 priv->phylink_config.supported_interfaces,
> 				 pcs->supported_interfaces);
> 
> and not have to worry about this from individual PCS or platform code.

I like the idea, I will give it a go and send a series for that if
that's ok :)

Thanks,

Maxime

