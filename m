Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27790C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Jul 2025 00:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ARG1qguY2jtBwxfh5tjwdiFEx7VrtV1hsPQWzD06ToY=; b=DoFr6NqQHdT+p7Ffa95O+OxteL
	1jB1p44obK6tBNG6Eka+Bfa4Ju1d38zqHKRDbjIKIypx4QRSDyHFno1W0CdpT/AL2ocGfM2N0HdLr
	5evNXmF9xK4YU4EVcKiTD022OfJFTr7XnGz7S2M7BqEY3WN5W5Z3lkrVrQUEVCXyzmigLSX5oeziv
	e0xYtG4p3wCIF3CmF0vL60ZU84ODysUrkxUxgkrDDW91ZjR/ZCF94lWNGZjW7T+nEznJKZZ6Era+i
	HmqnCBPnqt7ApAgHvfGgnT/CSrPL/0vU2TnN0laL+hAEff0sKjNBhZ/226Z7JD2goo5RXiadDFZnh
	NEfkVDHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucvKH-0000000De7q-2eDO;
	Sat, 19 Jul 2025 00:21:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucvHo-0000000Ddwm-00f7
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Jul 2025 00:18:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 76A4143594;
	Sat, 19 Jul 2025 00:18:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77940C4CEEB;
	Sat, 19 Jul 2025 00:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752884323;
	bh=i8kfI0t8YXJOh7Nta4MzjlKHughkKRcvCBx/fiPnVeo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=brBANwRehx9lpmB3NmOOG1AesXtgHe4kuApPMYeE2FSONLgLd5na4A6qhLMnrO9q0
	 GxyF/JljKYZJDuLHMuj+8yIHFsdrY4psW3zaZbxCNR1ibtKBXUmelLxYh6hKMwh7HM
	 nkfrCDhgwtyPcKfjIG/IaZJK9iXunMuwJ+GtDi4bxUIbkMb8vMKqelc6UCt55cDDmK
	 rPiGTJHCSaelCPgMw9ypOSEWC6FMWZ/EPN1nFB57NRLXreVkVmz77Iu9BjQrgZUjos
	 XA4T8bHp4WP4iA2l+entG9kIN3eti01D/wKFcGmQJnEXpW5/rM13CFPClMIowxPhbn
	 DUBHlLPqDuUKg==
Date: Fri, 18 Jul 2025 17:18:41 -0700
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
Subject: Re: [PATCH net-next v9 00/15] net: phy: Introduce PHY ports
 representation
Message-ID: <20250718171841.795daa9b@kernel.org>
In-Reply-To: <20250717073020.154010-1-maxime.chevallier@bootlin.com>
References: <20250717073020.154010-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_171844_064930_615334AC 
X-CRM114-Status: UNSURE (   7.90  )
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

On Thu, 17 Jul 2025 09:30:04 +0200 Maxime Chevallier wrote:
> Here's a V9 for the phy port work, that includes some fixes from Rob's
> reviews, by addressing a typo and the mediums item list.

Sorry to report but this doesn't apply any more.
-- 
pw-bot: cr

