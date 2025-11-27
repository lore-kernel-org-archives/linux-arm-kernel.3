Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A52AD116F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 03:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yc6vcimvTk9sIEmUsRqo8K5HsZSgFwOvAJ8ZXqBb61k=; b=t7sBX6GpaSQI3d6R4e0rzCEQxJ
	epvnaZ1g+lK2tprkGuT01tbr6zu9ZgTjP0WEY8oTTOVNgNaAPY9zVtVzlQlC8Qq05IR960tThhzjE
	/RqiY1gZCLEcbmefIwfPwR/dikqH3r41JIQOBEaPgxTdzKhxOM15sZ3Y7z01rmtnkENZBGawGX8d0
	s9H3w+99hK0FWWQ8bx2jEXHjcUGTr5idpJddTiY1kLdDcx3c/17QM8WjKLAhnIqjXKBjMPuE1/mn2
	v5nyVQXA9A/OWctoSMj59IL3ytv8OChz7MxNlmPKo5ElxvCkrW4fHFbPPz/3GMGwHEgcRIg7dHMNm
	CT4OnImg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOSFP-0000000FuiA-2tpD;
	Thu, 27 Nov 2025 03:00:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOSFN-0000000FuhU-41p3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 03:00:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 314F44150C;
	Thu, 27 Nov 2025 03:00:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5B1BC4CEF7;
	Thu, 27 Nov 2025 03:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764212438;
	bh=v2WQNfal91+gWtKQBH1S6BdVlVROCwiYaZ7ZQoZBk1Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=LmWQoFG+K2x4+zLvpAOtkz5iXNNnVAO+FfbYqKfocyTo7bEVVoHek7Xak8bai9wWD
	 JJXdXt6+GxyQeSTV6WoQRL41EZiQmdxg9L9i7yBimodEjJleglV5xFFIz0EpcdhXhs
	 d2pjSrL/gfF7PiZA+fCkN2nZezcwQbUZNPUgGlL4f3bvdovO7LI1Vkem0kJZ+zbWI3
	 SmABmF1MoMi0GiyWpQgyMy419+1zQk3gLCuOgmm3em4wLMx5HQ4BP+NqdYcwkEqXni
	 yNsKm0gKPYSmvDR/ovyr5HW6GHAA4wWTts1IA8MHwfxES9N7+3jGnbrI97VuZ8wKXK
	 VeBD/c5xQm/YQ==
Date: Wed, 26 Nov 2025 19:00:35 -0800
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
 Dimitri Fedrau <dimitri.fedrau@liebherr.com>, Tariq Toukan
 <tariqt@nvidia.com>
Subject: Re: [PATCH net-next v19 00/15] net: phy: Introduce PHY ports
 representation
Message-ID: <20251126190035.2a4e0558@kernel.org>
In-Reply-To: <20251122124317.92346-1-maxime.chevallier@bootlin.com>
References: <20251122124317.92346-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_190042_023930_0222BD56 
X-CRM114-Status: UNSURE (   8.84  )
X-CRM114-Notice: Please train this message.
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

On Sat, 22 Nov 2025 13:42:59 +0100 Maxime Chevallier wrote:
> This is v19 of the phy_port work. Patches 2 and 3 lack PHY maintainers reviews.
> 
> This v19 has no changes compared to v18, but patch 2 was rebased on top
> of the recent 1.6T linkmodes.
> 
> Thanks for everyone's patience and reviews on that work ! Now, the
> usual blurb for the series description.

Hopefully we can still make v6.19, but we hooked up Claude Code review
to patchwork this week, and it points out some legit issues here :(
Some look transient but others are definitely legit, please look thru
this:

https://netdev-ai.bots.linux.dev/ai-review.html?id=5388d317-98c9-458e-8655-d60f31112574
-- 
pw-bot: cr

