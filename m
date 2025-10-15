Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3168CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 16:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JJ6rH+xzmRM4qbGD1O8szCgtSQ2QdUeo9drcU82TAhs=; b=VkhUT8A2dfXGO5yWGOUwdm9adG
	SDFPb+S0aE9EUc429DmmpDCvHcpWtqFUA7jz2bIoeKfhEG+Aj8xkCUJ0NlSGFQnaIYm7Ert+1y4pS
	enyvCTrakz5PqKQqbLXAk3yo1MuLSr8O6ohlygTd7G2YQ2VZkaeeWcaWdwOFx4rDTW8BHcoyF8f6o
	dquE3Sx9Xe9R9XI67tya77GQ8shFuGhEEl3uFIU8/h8cm9179m+QKFX+44oDYvV42ALggMbxtMEEh
	Q5GjjTU32WwvIpW5YegP+TOgXfInaLKtUtAO+GJ016bnP3Hnk/W32LXpKBioijdYjuIKvjP2IJsDs
	vzbChNVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v94Es-00000002GwS-2kbk;
	Wed, 15 Oct 2025 16:20:34 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v94En-00000002GuQ-2J4X
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 16:20:32 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 82D1C1A1361;
	Wed, 15 Oct 2025 16:20:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 487D560673;
	Wed, 15 Oct 2025 16:20:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 138CA102F22DF;
	Wed, 15 Oct 2025 18:20:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760545219; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=JJ6rH+xzmRM4qbGD1O8szCgtSQ2QdUeo9drcU82TAhs=;
	b=wtHq3Gd0pQyjV6eyAK7fkRd9w/l0K0lC4FEfqkfWEo6k637Nboqx9312H1X9fnaRV/2wfb
	QaZ6QKn/SgxEG7NppA04nggZ69c6MQyB2QdfPZpPZs7aRKxHJD8eY66Gr283U2WCMTmDak
	88guPcGFdZVaksfpnPKksUJJnae0T4LLkdX0RllszUHzwp8koW7AkW3d42+ZT82a7iuP7G
	nDuOFOMUrmu/iMcqebvj3mX2x8m7+8+umoL7QjmNGO4Lxs1r06oZx9uCz+/jpvM07WporL
	jqoVHJIuWENfI7kHqcyASHjuMNN1yYfK86sc1rke62SvxbTpWJvvR1KIZpJ/0g==
Message-ID: <27800f8c-eb0d-41c2-9e45-b45cf1767c23@bootlin.com>
Date: Wed, 15 Oct 2025 18:20:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 1/3] net: stmmac: Move subsecond increment
 configuration in dedicated helper
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 =?UTF-8?Q?K=C3=B6ry_Maincent?= <kory.maincent@bootlin.com>,
 =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251015102725.1297985-1-maxime.chevallier@bootlin.com>
 <20251015102725.1297985-2-maxime.chevallier@bootlin.com>
 <aO-4hnUINpQ0JORE@shell.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <aO-4hnUINpQ0JORE@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_092029_899429_95BAA053 
X-CRM114-Status: GOOD (  17.87  )
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

On 15/10/2025 17:06, Russell King (Oracle) wrote:
> On Wed, Oct 15, 2025 at 12:27:21PM +0200, Maxime Chevallier wrote:
>> +static void stmmac_update_subsecond_increment(struct stmmac_priv *priv)
>> +{
>> +	bool xmac = priv->plat->has_gmac4 || priv->plat->has_xgmac;
> 
> Just to say that I have patches that get rid of these has_xxx flags for
> the cores, and these changes (and the additional platform glue patches
> that have been posted) will conflict with them.

Fair, I was in your position not so long ago :)

For this particular series, it should be straightforward to fix the
conflict, but for the pending new glue divers we'll have to
find the sweet spot for these changes.

Maybe send it as an RFC so that people can see what to expect ?

> Given the rate of change in stmmac, at some point we're going to have
> to work out some way of stopping stmmac development to get such an
> invasive cleanup change merged

Agreed.

 - but with my variability and pressures
> on the time I can spend even submitting patches, I've no idea how that
> will work... I was going to send them right at the start of this
> cycle, but various appointments on Monday and Tuesday this week plus
> work pressures prevented that happening.

To give your more visibility, that's the only work I plan to do on
stmmac for that cycle, the rest is going to be phy_port,
and probably some netdevsim-phy.

> So, I decided instead to send out the first stmmac PCS series... which
> means I now need to wait for that to be merged before I can think about
> sending out anything else stmmac-related. (and there's more PCS patches
> to come beyond the 14 I sent today.)

Do you plan to send the next round of PCS stuff next, or the cleanups
for the has_xxx flags you were mentioning ?

In any case, I'll be happy to help testing :)

Maxime

