Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03CEDE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 01:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DEmq3dMUp5m9GKeluLVTd9jOC1Eh336p24wnFddE1CQ=; b=SQkdVedjpvn5JqNlmSvDy4NZ6M
	dgvjzRNrEY+IJwWb6l0QDEekqKlfk+eUyy9hgYpFwL5ew4/O4ztof1mfaDBAAAH6H1LMAkkX3Aiov
	3FpZToBWmAIFQMvzSoFT759dljbV/JYrAiHGnwkR0hXbvcWs7u45ITgV6iSgFVa2LwojdniSv6a0B
	cxNPPYMQpshTj/DIptK+Q/avmRny36+SG940tLPk0fpEzfWsPAGspNZJPyZdF4P39TEMH+rXBN9NH
	vbh4geznbS7Kdbw+IWzgJQk3x9GZLYNkm+IwknB30K7B84A8JzvsWVvXt1mCcuawQoz/YwDV/cYDM
	5Kz8/oIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNMTy-0000000BseK-2xqX;
	Tue, 17 Dec 2024 01:34:42 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNMSt-0000000BsZL-3DVJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 01:33:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6E9FC5C4D5E;
	Tue, 17 Dec 2024 01:32:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB17BC4CED0;
	Tue, 17 Dec 2024 01:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734399214;
	bh=jQx59o3wR/vFzoPfSo4zsecm2GePz+OK8mpQNupeUek=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=gCP71Z9nQNwt3IAPUQAkOKGdvWzMoRegQfY4Q2lItX3gZwmaSSQwC0+fbg3frju1S
	 uty3sd2bWabuzWOiFoLSvfex6vwv1+Tes8g7HDi7Ye1WqIFyKQZdYsQPQ/ktnQoSn3
	 MGw9zq6CdwIlxVFo4tcgRm2BKNqkFq/hhy6aO8r11h0/PF09mfxySUTJvlxhst1XIV
	 c6jQWxs00GjjCy/5jqfxmwc8zYxzG+Hrwi9GYwl7s5ZP+Iwh/gFLoHaS3+OG/arcR+
	 bZv+bOnwlsDQd4YYIx/JFQtKGyhGzszyxexsbIfjy7XSIqsjCJiJ7tbEIVPkelYwIo
	 1PF5qPnajJM/A==
Date: Mon, 16 Dec 2024 17:33:33 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>, Andrew
 Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexis =?UTF-8?B?TG90aG9yw6k=?=
 <alexis.lothore@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 2/2] net: stmmac: dwmac-socfpga: Set interface
 modes from Lynx PCS as supported
Message-ID: <20241216173333.55e35f34@kernel.org>
In-Reply-To: <20241216094224.199e8df7@fedora.home>
References: <20241213090526.71516-1-maxime.chevallier@bootlin.com>
	<20241213090526.71516-3-maxime.chevallier@bootlin.com>
	<Z1wnFXlgEU84VX8F@shell.armlinux.org.uk>
	<20241213182904.55eb2504@fedora.home>
	<Z1yJQikqneoFNJT4@shell.armlinux.org.uk>
	<20241216094224.199e8df7@fedora.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_173335_865068_6C9DB34F 
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

On Mon, 16 Dec 2024 09:42:24 +0100 Maxime Chevallier wrote:
> > I've actually already created that series!  
> 
> Woaw that was fast ! I'll review and give it a test on my setup then.
> 
> Maybe one thing to clarify with the net maintainers is that this work
> you've done doesn't replace the series this thread is replying to,
> which still makes sense (we need the
> stmmac_priv->phylink_config.supported_interfaces to be correctly
> populated on socfpga).

Ah, sorry. Should have asked. 

I assumed since Lynx PCS will have the SGMII and 1000BASEX set -
Russell's patch 5 will copy them for you to
priv->phylink_config.supported_interfaces. Your patch 1 is still needed.
Did I get it wrong?

