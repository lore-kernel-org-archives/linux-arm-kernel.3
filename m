Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58F0BCCD1A2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 01:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EugXNac9lB9Ukn2f6RLuamHfu3sMj8vRsZPtmESHgLA=; b=cxbQNh1VivuYVztB0X/Vjb2TKF
	XaOjvSN0Z/Lo309H7I+MWK8EzlqR953ZmoD6q65CsLxaKLcovVKLRXvq+Qa1IDo2bTikVVrRmsroT
	O1D14GwXSZe3euK6P7SsyZxjmMt/pPLdNnoUH8HosjvMlexfGioxeVLTe508rQ7vruz8ZAjypN0h9
	s22571jmx7s+zIuHselIWs+dzABs8nhC0vfMihFJaeLopOkOKhjJMM8ESGS2QCR38abhOhNy2ddEw
	5TpxmB0fmwjGZaardx5q+OiFdu20ag7PpjsS1mgEqw5UAxbGgOlgnsZBICn3HROhPwqcv7iXtcZXt
	bripd+BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB1Yh-0000000FVow-3oxs;
	Tue, 21 Oct 2025 01:53:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB1Yh-0000000FVoB-0D2y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 01:53:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 28CBB62233;
	Tue, 21 Oct 2025 01:52:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DB1CC4CEFB;
	Tue, 21 Oct 2025 01:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761011571;
	bh=DYZ+NvvXDV3GLpnrmo/lEqoRa29w7O428mCra33ZZ18=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=d7bFmOvYou2jVLWtmxieZwAGRgonwPmZSCPDWuIolmQx0M4Y5zhvniT/tOcwtn9RQ
	 l2IhR3X6Al2Nb290zycAxVMwew6eXS1PI5Z67wY71A2YkQI/IfsttMCvOaqSkhvpF0
	 th8NqPcpgNXEvT3EQhfp9MjJxqybhWV9hzuelw2I0d4fsK75z09aGiVeF9Shcgta5Y
	 msD9yFUVjqF4ApvAhN6aqAuh2zgN4AAYin+y4AI02O5nfP5FgIbPrDykx/5mseg/SY
	 8HriN8sx5C1HeVJBpPnNlXEY33sV04wvbvNoXZtFN0KhTuxSZjB7RrUAbb4fKtxFio
	 Xvn8rrwWJU8Rg==
Date: Mon, 20 Oct 2025 18:52:49 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn
 <andrew@lunn.ch>, Russell King <linux@armlinux.org.uk>, Heiner Kallweit
 <hkallweit1@gmail.com>, Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: davem@davemloft.net, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 thomas.petazzoni@bootlin.com, Eric Dumazet <edumazet@google.com>, Paolo
 Abeni <pabeni@redhat.com>, linux-arm-kernel@lists.infradead.org, Christophe
 Leroy <christophe.leroy@csgroup.eu>, Herve Codina
 <herve.codina@bootlin.com>, Florian Fainelli <f.fainelli@gmail.com>,
 =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>, Marek
 =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>, Oleksij Rempel
 <o.rempel@pengutronix.de>, =?UTF-8?B?Tmljb2zDsg==?= Veronese
 <nicveronese@gmail.com>, Simon Horman <horms@kernel.org>,
 mwojtas@chromium.org, Antoine Tenart <atenart@kernel.org>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, Romain
 Gantois <romain.gantois@bootlin.com>, Daniel Golle <daniel@makrotopia.org>,
 Dimitri Fedrau <dimitri.fedrau@liebherr.com>
Subject: Re: [PATCH net-next v14 00/16] net: phy: Introduce PHY ports
 representation
Message-ID: <20251020185249.32d93799@kernel.org>
In-Reply-To: <20251013143146.364919-1-maxime.chevallier@bootlin.com>
References: <20251013143146.364919-1-maxime.chevallier@bootlin.com>
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

On Mon, 13 Oct 2025 16:31:26 +0200 Maxime Chevallier wrote:
> Hi everyone,
> 
> Here is a V14 for the phy_port work, aiming at representing the
> connectors and outputs of PHY devices.

I can't help but read the lack of replies from PHY maintainers
here as a tacit rejection. Not entirely sure what to do here.
Should we discuss this at the netdev call tomorrow (8:30am PT)?
Would any PHY maintainer be willing to share their opinion?

