Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2686CF394D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 16:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cma2rSHaFDXNjxg/v70ZfhJruTka6+8gbpMAfDrbxaE=; b=LjfYxLRB9NneGBmqzYUJ9LQyKg
	fwdUAgyfznM1mF4Cl4JF5sDeK7Ity083TrgXbw5H91Hhhv7GQ4VtBDm206JKDXgnnkUU7X/zAH1BR
	7q0oWtC/ShR8JYiOTJ/YY7wZ4TeMFF+LP61X4sP5mHG4Z6xT7Yl/y3mQ5VtYllkYuUD8UTbRvZ5F+
	bioWF1B4tIIvB/VLckSMqh4lS1nTltz9F09QVy5n0nlJ6w8YmIgA+TmV3Xd1PSt1BWyAMSlgHUJGH
	aZu+8UrX43PL5rHpo3wOnkU433Awp1XJWJ/XF1ieM00XswhdVxvxt19UGRAv++N7H62mvAXJKIjfL
	CcB1nriQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkuB-00000003g9r-3t5E;
	Wed, 19 Nov 2025 16:19:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkuA-00000003g8d-2crj
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 19 Nov 2025 16:19:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=cma2rSHaFDXNjxg/v70ZfhJruTka6+8gbpMAfDrbxaE=; b=oTApByNyNwRHb4p5NIMgafpLpD
	Sw/O0Utsu20PVcoGwzfPUucV7kj1q9x91+/1xJ3t7eXL5eEjQCZRr5W3jR55M52phfV/ToLIVL1W3
	JU7Mha+tgDPixNLjTj5hLS5G5fVe/dHHLPTDeQ54KOPCt7GQ1N01iwiI/sVJxF30BRTeKqFOOzIl3
	WnHySbqhxiViaA4aj3nlgClTbRmud+rtrB++xWihp3EPz6UCYZoyIUiL//ff8zmwV3ems44zSguOD
	cVU32hRBjESwgleV1vxuHRKlEl+KCdlT3wpcymcKCxL1UNWJ9KOg7VSc2fcrJu/rdCtCqYxPh1PAz
	WGEPW38w==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLk2R-0000000CerP-06Ge
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 15:24:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5B63B40243;
	Wed, 19 Nov 2025 16:19:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E806EC116B1;
	Wed, 19 Nov 2025 16:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763569168;
	bh=BPzTK2gEFsViZFmyOno1UxdtkaYyPLFM9cgU3Gme0aY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qT0M/WXX2B9Kv1nVbIu43kmraVe20viEsQAOxsj+uCaOZTXTFtX5KOnOvI5cfNmZm
	 1fSlTx54W2q3AxaOoKrmQ5pzDOPg+pJvj3VKLpbGobNGSgppaNPXtlUIWhPBR50WJh
	 Sybx5lTWfm5yXaL76r02PUgOwjW90/L9Zjl0USXTbFCERWWrMzx+17YRsqTwijis8Q
	 u0JdTIiPOpqWZjC3uWRDxBEVjq+u+lKKpHddPkhK8sBHV0LoczsBu6274ZzhzcU0FC
	 Sm151mMoH8kI9mCj1Er9C34XhLeKg+50DT2lamDVDt3hO8+WOpEkC5xAdI5oU845dQ
	 ooQgLNOwT7Uaw==
Date: Thu, 20 Nov 2025 00:01:36 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 resend] net: stmmac: add support for dwmac 5.20
Message-ID: <aR3p4NBK-AnCGK6a@xhacker>
References: <20251119153526.13780-1-jszhang@kernel.org>
 <aR3snSb1YUFh9Dwp@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aR3snSb1YUFh9Dwp@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_152407_326813_ED057A12 
X-CRM114-Status: GOOD (  19.22  )
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

On Wed, Nov 19, 2025 at 04:13:17PM +0000, Russell King (Oracle) wrote:
> On Wed, Nov 19, 2025 at 11:35:26PM +0800, Jisheng Zhang wrote:
> > The dwmac 5.20 IP can be found on some synaptics SoCs. 
> > 
> > The binding doc has been already upstreamed by
> > commit 13f9351180aa ("dt-bindings: net: snps,dwmac: Add dwmac-5.20
> > version")
> > 
> > So we just need to add a compatibility flag in dwmac generic driver.
> 
> Do we _need_ to add it to the generic driver? Do the platforms that are
> using this really not need any additional code to support them?
> 
> Looking at all the DT that mention dwmac-5.20 in their compatible
> strings, that is always after other compatibles that point to other
> platform specific drivers.
> 
> So, can you point to a platform that doesn't have its own platform
> glue, and would be functional when using the dwmac-generic driver?

Synatpics platforms use the dwmac-generic driver, it's enough now.
But we haven't upstreamed related platforms, but will do soon.
> 
> For reference, the dts that refer to dwmac-5.20 are:
> 
> arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> arch/arm64/boot/dts/renesas/r9a09g056.dtsi
> arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> arch/arm64/boot/dts/st/stm32mp251.dtsi
> arch/arm64/boot/dts/st/stm32mp253.dtsi
> arch/arm64/boot/dts/st/stm32mp233.dtsi
> arch/arm64/boot/dts/st/stm32mp231.dtsi
> arch/riscv/boot/dts/starfive/jh7110.dtsi
> 
> Thanks.
> 
> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

