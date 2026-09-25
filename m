Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3CBBC98321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 19:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GAVSnJmPMwarDSH1jMfx2Fzr75wqXb1P/mqnFUbv2M0=; b=KPvn2pPWZFjmfhbZjkq0+eqme1
	fqqg6tiua0xZ5UuSWwB/lzBq+40a8aFEUAQOo66LwN30eKAmt6S19wv35tsdUttFy86ccinv7r0kw
	tHtowgGEML+/nHapRziNs+YHHdHaX0EehQvYTCzbgQFXUawE//k6J1CMLY4qDqMTpIxInnhxvSmYE
	BKsxGO/EJjHix0F8trIBebSktugS9kBfCpZuB6RuTUL+m6pJBBE0r7Ctu/OQSaHyq2yZKucfeGIT+
	AQTOA1alZtDdOmowXJmhpbwidzucTA3u6+fVQwBNSj27elP23ybU/e5GvP5lfBM37Ya7XMQSYDrbh
	1OIY9SNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xABUj-0000000EFvq-3qBR;
	Fri, 25 Sep 2026 19:22:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xABUi-0000000EFvb-3Jmx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 19:22:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CF9D96022F;
	Fri, 25 Sep 2026 19:22:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA65C1F000FF;
	Fri, 25 Sep 2026 19:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790364123;
	bh=GAVSnJmPMwarDSH1jMfx2Fzr75wqXb1P/mqnFUbv2M0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=MZBPnFeAeoghE+EgKKyZzLFVschIMrk2xqMn30WH7K7HIbj7jB4My4bP48C9HkvV/
	 ga/K7rB8MTnDiVtu0Bz1IxhWyH5a3jzHKIe3qUkpW6ZB+ykaLXWm+Mk9fpmb9crv6k
	 vn+gmYZ3huP2nDxS2hLHf+pJILALr5PP/Ffc2HF7dMCPvaFySOns3jFoYChOJmgmc2
	 MNIoTLVjZ5YyRia8IOUFqdi5Jxs7HzjVgK2HMU0bAPQzCQSkOyRx/yiO3ovUCyUo+t
	 WeWndhSy7RQr/mOclDIOZB0rWeLpUbbmg2vXk4FVGI15Kz6IrhhNLqplJp35omYzwu
	 WVcEs2D2v97aQ==
Date: Fri, 25 Sep 2026 12:22:02 -0700
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
Message-ID: <20260925122202.611d655a@kernel.org>
In-Reply-To: <f8fc89b7-15ff-4915-8f1c-49c3b2357699@bootlin.com>
References: <20260917215339.2022523-1-maxime.chevallier@bootlin.com>
	<20260921152202.64d4c67a@kernel.org>
	<f8fc89b7-15ff-4915-8f1c-49c3b2357699@bootlin.com>
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

On Fri, 25 Sep 2026 10:20:59 +0200 Maxime Chevallier wrote:
> On 9/22/26 00:22, Jakub Kicinski wrote:
> > On Thu, 17 Sep 2026 23:53:31 +0200 Maxime Chevallier wrote:  
> >> This is V4 of stmmac selftest fixes, addressing Sashiko's issues over
> >> the MTU patch. This lead to the introduction of a new one. The
> >> dev_add_pack races have been addressed, however the double-vlan issue
> >> stayed there. Ovidiu is actively working on it, let's wait for his work
> >> to land before fixing that.
> >>
> >> Nicolai, I took the liberty of keeping your review tags on affected
> >> patches, let me know if this isn't ok.
> >>
> >> This is another round of stmmac selftest fixes, mostly about the selftests
> >> themselves but a few things were discovered w.r.t MTU and buffer size
> >> handling, see patch 5 anf 6.
> >>
> >> After this is merged, I consider the selftests to be now reliable enough
> >> to run them nightly on every stmmac series that's sent, and I'll be requiring
> >> clean selftests for new glue drivers.  
> > 
> > This got to the top of the stack for me, LMK if none of the AI feedback
> > is legit. You mentioned the VLAN one, not sure about the rest.
> > The EEE complaints look like nit picks but also some are easily
> > addressable? LMK..  
> 
> Thanks for applying :)
> 
> Much greener now :
> 
> https://minimaxwell.github.io/stmmac-ci/

Nice :)

BTW - I see you have a thing called "netdev series report"
I've been meaning to ask someone if they want us to add to SUIE
subsystem tracking (https://netdev.bots.linux.dev/suie.html)
I could easily add a drop down to filter just stmmac patches there.
On the scale of 1 to 10 how useful would that be?
Is there something beyond "active series" that you need to see?

