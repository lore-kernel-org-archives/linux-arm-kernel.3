Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B36AC98321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 20:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RloHWNhcOY6jiXO7W98mGw5Z5KAg+PTBGMdz0OxO5xI=; b=ornAjnGxGD5Xdv9untfuMqSKqd
	qRj45PXQiIJdP38+FCLRVGyeCQXLkofH1Cg6U5KQWRA7swnnHceOPpFcwfKIc6yF3VePtvlNwVoi4
	YxsT2iVUw1ARZyS8UI/QCVJMIKneY36oMlQxK03ABEMt+d9pmBNP4002mkKkObajAk7h6/3dP1P0F
	ZzIYPqZPGyWRhyd/8txUElO69eDVOnXg+tQK1lT4zy2Ky6HtNgv834p2RpgTt5tP02vPU3VHFQwhv
	OZmTVX3XJQvz+H0UyJ58f7PQHRLWPu8nUh1SGHGxSRTZMQuj5Vx3+rLurkZK8/aqyqXop/BhbwKN8
	Acpll4wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xACQq-0000000ENeX-1lRv;
	Fri, 25 Sep 2026 20:22:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xACQp-0000000ENeM-2Nw3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 20:22:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A011860136;
	Fri, 25 Sep 2026 20:22:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 912611F000FF;
	Fri, 25 Sep 2026 20:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790367726;
	bh=RloHWNhcOY6jiXO7W98mGw5Z5KAg+PTBGMdz0OxO5xI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=WMvASfwH8cTlHEs2kfQc6XOiEh8inJJzJPrnhrApPd+OJ/IrbE5ELpNNeSXGnAY8q
	 tAai8ITY8ZPO17UZ+XVXlIskorpSY6c8fWMUc0lW9AUVf5oyq/U3qyXm1r5k9Ra1Av
	 bj6nn4VaHwGmCPsr25kt2WrKgF/G8OT1nnFQa93xHy+1wYcsdcg7GDIa080zVeBcPF
	 6vC2gahk8/8FTrxlw8pz0yz7ecRJmPtUJhIxIVviDd74rpGLej1c4l1g/H5XgZN/wS
	 Tt8jFr9gT+AKbVIqEb7PuyJ66sxdiZj2d4ph+IbmckjnozQ3rZ03LctHkZ7jSmYEnR
	 TaFnt5YFgrAgg==
Date: Fri, 25 Sep 2026 13:22:04 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Russell King
 <linux@armlinux.org.uk>, Heiner Kallweit <hkallweit1@gmail.com>, Alexis
 =?UTF-8?B?TG90aG9yw6k=?= <alexis.lothore@bootlin.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Emil Renner Berthing <kernel@esmil.dk>,
 Minda Chen <minda.chen@starfivetech.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Jan Petrous
 <jan.petrous@oss.nxp.com>, Ovidiu Panait <ovidiu.panait.rb@renesas.com>,
 Jose.Abreu@synopsys.com, Nicolai Buchwitz <nb@tipi-net.de>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, PKneuper@dspace.de, David Laight
 <david.laight.linux@gmail.com>
Subject: Re: [PATCH net v4 0/7] net: stmmac: More selftest-related fixes
Message-ID: <20260925132204.03ce9495@kernel.org>
In-Reply-To: <d704ea9d-6cca-4f2f-b18b-0267a9082e18@bootlin.com>
References: <20260917215339.2022523-1-maxime.chevallier@bootlin.com>
	<20260921152202.64d4c67a@kernel.org>
	<f8fc89b7-15ff-4915-8f1c-49c3b2357699@bootlin.com>
	<20260925122202.611d655a@kernel.org>
	<d704ea9d-6cca-4f2f-b18b-0267a9082e18@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Fri, 25 Sep 2026 22:02:25 +0200 Maxime Chevallier wrote:
> On 9/25/26 21:22, Jakub Kicinski wrote:
> 
> > BTW - I see you have a thing called "netdev series report"
> > I've been meaning to ask someone if they want us to add to SUIE
> > subsystem tracking (https://netdev.bots.linux.dev/suie.html)
> > I could easily add a drop down to filter just stmmac patches there.
> > On the scale of 1 to 10 how useful would that be?  
> 
> I'd say, 10/10. To give you a very concrete example, I was on training
> for the past 4 days, with little time to look at my inbox.
> 
> Today was a struggle to just browse through the stmmac pending
> patches, some being straightforward patches, some complex but from
> well-known contributors, some large glue series that are 10+ patches,
> and then some likely AI-generated series sent as-is without real clarity
> on whether the author actually fully grasps what's being sent.
> 
> So, I resorted to SUIE, ctrl-f stmmac, and going over that list in order...
> 
> I think you're asking this question at the best possible time, at least
> for me :)

Excellent, let me work on this over the weekend.

