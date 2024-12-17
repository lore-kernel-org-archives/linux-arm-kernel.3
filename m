Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 394DFE77184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 13:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nI25amw8mKM1HUCW0J89cbc4oV1eC9Wev0IA+2/p98M=; b=ArMeiwcpihyxPjZkTggVQut9oa
	RE7JaRuRusz1ntZl4rzzI0HKsB69n9hxW6LzO/sLk4LKB3pE4vPQcaysBB/mFvRpVcAr6Ob6mXoED
	9sp3gYH05UxgaDzimNRnVSsadIQtA5DWRpXGf8W4yG3coiJYL4Bl61j5mc4XGYpz32T0t/mthRCfD
	y4P2so6856lvwUdlT/5wq4KU1dBcvAVM3lOrA9NeNTtog78RFXp+jzzTOPzR7SE1WZeyzT7xiYuHM
	THNJPfsk666spcnRPJKXQ2g7Mabs6lvpuz9ejR/PStqQsKBg7clUT22p8b9RQUsIRAb1IKfzNXEd4
	VXLUBtXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNXBx-0000000DS6y-00JG;
	Tue, 17 Dec 2024 13:00:49 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNXAs-0000000DRxj-18U6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 12:59:43 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 20B3460002;
	Tue, 17 Dec 2024 12:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734440377;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nI25amw8mKM1HUCW0J89cbc4oV1eC9Wev0IA+2/p98M=;
	b=b9Mvdrgk1gOB+P6K9XMFfCT86n5yIqey2T6btCwQpOPjmkMEhdo+bdktDZbWNe8soVdAE3
	LowYzA2SUu2X0MPvuk5nJxStHOkDykumdcRoIHfmAsnqYUtEiRFlUG85B5TcYvihSNfvAb
	5J9pCRemqeaF5jrWwhAB5AdAKc1JtpDALj3nANjEuatRhLSxmoQCEdSZhYLH3dz6hkNoET
	bNOdqFyci3R+hRclrlTymBcRCeXcnHJZdgh2Cwiw5Ii5Uyq8BIWDCuicrW9B7jCw4fxJGE
	cQfPFYGtcPFsmXt2wUaFeqxIXUmleh0kGWs5jFHT4jbTaXQodFc2EsrmudIWjw==
Date: Tue, 17 Dec 2024 13:59:32 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Jakub Kicinski <kuba@kernel.org>
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
Message-ID: <20241217135932.60711288@fedora.home>
In-Reply-To: <20241216173333.55e35f34@kernel.org>
References: <20241213090526.71516-1-maxime.chevallier@bootlin.com>
	<20241213090526.71516-3-maxime.chevallier@bootlin.com>
	<Z1wnFXlgEU84VX8F@shell.armlinux.org.uk>
	<20241213182904.55eb2504@fedora.home>
	<Z1yJQikqneoFNJT4@shell.armlinux.org.uk>
	<20241216094224.199e8df7@fedora.home>
	<20241216173333.55e35f34@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_045942_450651_EC2E86BE 
X-CRM114-Status: GOOD (  17.79  )
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

Hi Jakub,

On Mon, 16 Dec 2024 17:33:33 -0800
Jakub Kicinski <kuba@kernel.org> wrote:

> On Mon, 16 Dec 2024 09:42:24 +0100 Maxime Chevallier wrote:
> > > I've actually already created that series!    
> > 
> > Woaw that was fast ! I'll review and give it a test on my setup then.
> > 
> > Maybe one thing to clarify with the net maintainers is that this work
> > you've done doesn't replace the series this thread is replying to,
> > which still makes sense (we need the
> > stmmac_priv->phylink_config.supported_interfaces to be correctly
> > populated on socfpga).  
> 
> Ah, sorry. Should have asked. 
> 
> I assumed since Lynx PCS will have the SGMII and 1000BASEX set -
> Russell's patch 5 will copy them for you to
> priv->phylink_config.supported_interfaces. Your patch 1 is still needed.
> Did I get it wrong?

Both are needed actually :) There are 2 issues on socfpga :

 - 1000BaseX needs to be understood by the socfpga wrapper
(dwmac-socfpga) so that the internal serdes is enabled in the wrapper,
that would be patch 1

- The priv->phylink_config.supported_interfaces is incomplete on
dwmac-socfpga. Russell's patch 5 intersects these modes with that the
PCS supports :

+		phy_interface_or(priv->phylink_config.supported_interfaces,
+				 priv->phylink_config.supported_interfaces,
+				 pcs->supported_interfaces);

So without patch 2 in the series, we'll be missing
PHY_INTERFACE_MODE_1000BASEX in the end result :)

Thanks,

Maxime

