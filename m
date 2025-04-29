Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 634E7C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 00:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BjltVrPeG+MwX4MxyisrjTKktC3MGkuR4BVTJALwLRU=; b=J2fTK/ly0DCMaO5RJsbw414p0d
	WCPK0020wPHoy4FkybH6g63WFFJpINE2JnsIJ5pP/px1lkBS5wLYxWCtmW3asQnunj9lQKcFrIA2m
	Tc5J6r93UqucgzFwjEh+bicaYYe0Cl4WIZ8T0k3zg2mflckeg6OY2fQj6RilTgyBdQ9ONWAUJ6Gf2
	FAHFiHVFH85WfoeJRE6vQgBNlEkmbNtywV8oUnBdIhswG44huJRGXVw9pPvxr24I3b37V6EUCBrLN
	jjb83GAefu+DY4D34BArA478SO+XUUUxm/sDhL04cfTCrwUxSopCMg1jzKWc5YrydLyW6rNcKhBE7
	5rz2sa7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Yco-00000007sNp-0q7l;
	Tue, 29 Apr 2025 00:15:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9YZV-00000007s3q-1svA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 00:11:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BD87C44986;
	Tue, 29 Apr 2025 00:11:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAA52C4CEE4;
	Tue, 29 Apr 2025 00:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745885496;
	bh=DVrq0+ozLB00QEXt1bw4mWGuFzEpnQXpfPtB1VF5uj8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ZpbcXX+ptzph1vmsG8OSHi+Sv2+ELaqX4uePfZQK1xgMaUZIHYpG3V7TPbWgxbCvs
	 DSGylViVIt8xpKawd4ImFuCqOL0nVcQ6L9WjyKyhy6d1OPug31VO5kTo/cLMGkVxsY
	 t+iPNgNcwVW/L0Loyt1FNckWNPnRgN15L8QaJ9XdJ7H8y+pwqLitq0qqtexVNggPtX
	 l6OgNW5EFPVbkzJlqMneEvgOLCUB/KJC7b+x3at+B+hFdOCAD9haJe7fOo4ejDTMXn
	 v0rBVvePXL57h/myOO2UVU4cDV0VcKZ8st9eL9OzF9WOqf+dC9jo2tcxjVlpILIpHW
	 JJ5hIEb7xwo9A==
Date: Mon, 28 Apr 2025 17:11:35 -0700
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
Subject: Re: [PATCH net-next v5 07/14] net: phy: marvell-88x2222: Support
 SFP through phy_port interface
Message-ID: <20250428171135.2fb182b4@kernel.org>
In-Reply-To: <20250425141511.182537-8-maxime.chevallier@bootlin.com>
References: <20250425141511.182537-1-maxime.chevallier@bootlin.com>
	<20250425141511.182537-8-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_171137_512171_11FD5959 
X-CRM114-Status: UNSURE (   6.88  )
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

On Fri, 25 Apr 2025 16:15:00 +0200 Maxime Chevallier wrote:
> The 88x2222 PHY from Marvell only supports serialised modes as its
> line-facing interfaces. Convert that driver to the generic phylib SFP
> handling.

Transient unhappiness:

drivers/net/phy/marvell-88x2222.c:523:34: warning: unused variable 'mv2222_port_ops' [-Wunused-const-variable]
  523 | static const struct phy_port_ops mv2222_port_ops = {
      |                                  ^~~~~~~~~~~~~~~

