Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F06FDCAC5AC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 01:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=assGq103RPrICLsM4dNacpjJsDh2E9vjRjhZk8lo27w=; b=XQoYV6gSzAAL/XJFI2DQ1aU384
	YPcgAIjYbHlViCoX0vJm0Vpacwjyjj1Ovwz19W5+vNytnBDOFLhxhxx3Y6QGHR1VR2wQLK3twuCjm
	kabtS7kFzlLEgytL/Wu+izxlF+jAR4/yYxibaLNRzEGUeY5pp9GRWr2evD5FH0NHj0042+Z/gNV70
	b3Zh9uIuxxz7XEr4HebkVDOPAGLRViepI46OpQBwiaGrCZ6P2zM/trwYhTc4jZTHnQ+zEU/WdBMP8
	4lNzRvIJN5MOIUxHGP8M3Mll+X/9XK8ggtwkMzv6SF+GvuYZwR4FeJxyNvx/XnD8SCHRQ+N75nk6A
	0s3wp8Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1EFH-0000000FI4a-0oeM;
	Wed, 24 Sep 2025 01:24:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1EFF-0000000FI4D-0DG7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 01:24:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4D40044BA5;
	Wed, 24 Sep 2025 01:24:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C63CBC4CEF5;
	Wed, 24 Sep 2025 01:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758677072;
	bh=4nT0zPGLX2EGPKXvnIPJ3K4R/r9yo2It3m8dFaJbhn8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=CQVVnCS0cLpIk/4a4LNXWEdlDb7ljFy13ZlIFwUp4DQ1PP2SM2Y0RW5+Mveepj1b5
	 IMEpPpvGuPyX+JWQHG46TqZ3u+a8OSatCoMVMHhvtMaFula8jjUJOhVeAFQVUE4eSR
	 cHYOpyMyHFxVvsiCji/w+wSHs2qSFdlQUgVKloZQOhyBbFDgEA4d62J5zeeABG1dIR
	 90M3XocHuNEyYPVPyEuotWHUdJ5j/wVDogBPAhKKfT1VgkysbNZFtvQBZZkkm/rPOZ
	 m6DFWx9B2tkXETWFCisT4IPlMBHoraMTPRIGfFJzIzenFZwVD2noK8IU/LS3n+sloP
	 Y6Q0i40gZetqQ==
Date: Tue, 23 Sep 2025 18:24:29 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: davem@davemloft.net, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 thomas.petazzoni@bootlin.com, Andrew Lunn <andrew@lunn.ch>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Russell King
 <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, Christophe
 Leroy <christophe.leroy@csgroup.eu>, Herve Codina
 <herve.codina@bootlin.com>, Florian Fainelli <f.fainelli@gmail.com>, Heiner
 Kallweit <hkallweit1@gmail.com>, Vladimir Oltean <vladimir.oltean@nxp.com>,
 =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>, Marek
 =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>, Oleksij Rempel
 <o.rempel@pengutronix.de>, =?UTF-8?B?Tmljb2zDsg==?= Veronese
 <nicveronese@gmail.com>, Simon Horman <horms@kernel.org>,
 mwojtas@chromium.org, Antoine Tenart <atenart@kernel.org>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, Romain
 Gantois <romain.gantois@bootlin.com>, Daniel Golle <daniel@makrotopia.org>,
 Dimitri Fedrau <dimitri.fedrau@liebherr.com>, Florian Fainelli
 <florian.fainelli@broadcom.com>
Subject: Re: [PATCH net-next v13 13/18] net: phy: marvell10g: Support SFP
 through phy_port
Message-ID: <20250923182429.697b149b@kernel.org>
In-Reply-To: <20250921160419.333427-14-maxime.chevallier@bootlin.com>
References: <20250921160419.333427-1-maxime.chevallier@bootlin.com>
	<20250921160419.333427-14-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_182433_116666_AD50E283 
X-CRM114-Status: GOOD (  11.15  )
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

On Sun, 21 Sep 2025 21:34:11 +0530 Maxime Chevallier wrote:
> +/**
> + * phy_port_restrict_mediums - Mask away some of the port's supported mediums
> + * @port: The port to act upon
> + * @mediums: A mask of mediums to support on the port
> + *
> + * This helper allows removing some mediums from a port's list of supported
> + * mediums, which occurs once we have enough information about the port to
> + * know its nature.
> + *
> + * Returns 0 if the change was donne correctly, a negative value otherwise.

kdoc likes colons after return so:

 Returns 0 -> Return: 0

sorry for only providing an automated nit pick..

> + */
> +int phy_port_restrict_mediums(struct phy_port *port, unsigned long mediums)
-- 
pw-bot: cr

