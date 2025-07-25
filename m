Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D699C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 20:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XXKRhRbkPdtCnHz5AqzwvY5fPC+7Cnxs+88nTiPHBpE=; b=Q0s6nmljZdkPuI+cS60qTNC3HP
	72h5jYcvF+A9W3FH5wFqKZbzWMe6Z0c6yxa736HeYhuyR/u6Zvbw9jeaXxlbxAHfP+SaTPo5Focvu
	wjKuyy0WUwh9K0fCQUFH9IIC054ywcnNJ5/zPTMqcVXm2jx+E8UaW6yqfruXq3cQIwHI5vqRp8KNF
	DjXBYwzkWVXgvWOIuSUelMxLLHANLmUNI8wbNYfibgbJtNW+BqSNJVw4tLyGlhicb5WXD8qqzQyHy
	DWOCzGPZM/5COdR+SegXkfFmmUGIQPTeJoY2VgwM8XsCk7P3LytOreYbGWKPM38dCEi2XhDrmpOUK
	oYrZGSmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufOhP-0000000AckB-2qct;
	Fri, 25 Jul 2025 20:07:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufOeu-0000000AcID-24Te
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 20:04:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6754B5C594A;
	Fri, 25 Jul 2025 20:04:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D533C4CEE7;
	Fri, 25 Jul 2025 20:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753473887;
	bh=XXKRhRbkPdtCnHz5AqzwvY5fPC+7Cnxs+88nTiPHBpE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Tc23PteexjiHb5GWF3qs9ivHEy+H5q1OPzvdp+dh44jd8vBm5+0bhm0wPPLVviUXE
	 h0YSPNOB3hyIqIx/PCzzoOv/mR81NhtPsZLpMBvgtvplYOR6JxNRmua2hgOMzNWGIW
	 HJq5u0pfTtT/aEUinWJeIBcsw3S1rRKrb8sarmtlkB51WR2vJa4YvJmE9JYC/2fld2
	 +esltBUXb6HBDed/ccndqjCLbsZmRc8tuAC6Mo7tlwtl3UdGQYyAQBXvcJLBrpf2ZD
	 GH2ibsBbo78pPXzBPImolt7SgxMAUO8LoRnHNrnnVkGvf2ZMP7hpk50IBI7iE5H+WW
	 tmW2/vlOh+DXA==
Date: Fri, 25 Jul 2025 13:04:45 -0700
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
 Dimitri Fedrau <dimitri.fedrau@liebherr.com>
Subject: Re: [PATCH net-next v10 00/15] net: phy: Introduce PHY ports
 representation
Message-ID: <20250725130445.32e0307f@kernel.org>
In-Reply-To: <20250722121623.609732-1-maxime.chevallier@bootlin.com>
References: <20250722121623.609732-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_130448_568084_B5CCB104 
X-CRM114-Status: UNSURE (   7.87  )
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

On Tue, 22 Jul 2025 14:16:05 +0200 Maxime Chevallier wrote:
> Here's V10 of the phy_port series. This version doesn't contain any
> significant change, it fixes the conflict on the qualcom PHY driver, as
> well as aggregates the reviews from Rob, K=C3=B6ry and Christophe (thanks
> again).

Looks like we gathered no reviews from PHY maintainers here.
We'll need to Defer this series to 6.18. Perhaps we should
have pinged PHY maintainers a bit more for their input, sorry :(
--=20
pw-bot: cr

