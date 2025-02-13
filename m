Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E13BEC0219D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 11:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wCrNDPpSmr0ghjZQHln3wrW9wdkB0T1+1LgU4/+ksGM=; b=y6c7yrZRFCokSp6YuGCLBWOozr
	vHS2BpZEY+dn0mCEqJmknpjDCV1T1QnufHC0a6xYlP1dMM6mbzVwJHb6dXZ2alB/6zolyUOTSnaqS
	RLSLBHC5pk8a2sHKZxMhAlGUpo9Jq49ash5EEHgZT4qXBnoWW3AdggLORAiWnKE+78WZJso6KgaOy
	HWGdGJgWTjKWdo3zriYVeD2+0beHpWoefG1s8jl50biksUKm4AWuqwZmfCDQcU5PTGANrEOXA9DyB
	qgol4TFLnBduQTtt8PYyyBgRSp57vy5EH/AtWBOyeJEhEbAF9v01zR5ejkqL2WDecRmmaEckQ4SFa
	7Q0m/JYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiX7i-0000000AmkK-1Omy;
	Thu, 13 Feb 2025 11:11:14 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiVyW-0000000AYfe-2ZAE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 09:57:42 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 09F6244284;
	Thu, 13 Feb 2025 09:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739440658;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wCrNDPpSmr0ghjZQHln3wrW9wdkB0T1+1LgU4/+ksGM=;
	b=M2WPbCU3Ms+NJaOcFhYVZLVfK0a36bi/qXyx2rTssWCj/fOmmXL4sbCZz+wjRTIGub5h2f
	FyV4oEb73P7f6eiGZAllSvelM5XC20sDXUcK04NLaYvIgTFhajq87hSEPqKwFgk2QnfjXL
	IG3ovhR8GO5T5SEBXrsGQDzvjtGJ/6xc247bBIky9fKPeZ5+PeCltHqdT/mIrSv9HmR9+A
	51xpZ9tBkO+0jfc1hA6zgANbs8ZRpRfxIlRQVcmtzQapYd9GYZab5yKaqL2jQtApf5IzNy
	Hn7nMYU0qr3olfg+nqaIbLFjPLS/7kZktfzC+6V6Be+J/aa3nPccWdi2cIp98w==
Date: Thu, 13 Feb 2025 10:57:35 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 thomas.petazzoni@bootlin.com, Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski
 <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Herve Codina <herve.codina@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit
 <hkallweit1@gmail.com>, Vladimir Oltean <vladimir.oltean@nxp.com>,
 =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>, Marek
 =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>, Oleksij Rempel
 <o.rempel@pengutronix.de>, =?UTF-8?B?Tmljb2zDsg==?= Veronese
 <nicveronese@gmail.com>, Simon Horman <horms@kernel.org>,
 mwojtas@chromium.org, Antoine Tenart <atenart@kernel.org>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Romain Gantois <romain.gantois@bootlin.com>
Subject: Re: [PATCH net-next 00/13] Introduce an ethernet port
 representation
Message-ID: <20250213105735.748b5d1d@fedora.home>
In-Reply-To: <20250212194808.GA130810-robh@kernel.org>
References: <20250207223634.600218-1-maxime.chevallier@bootlin.com>
	<20250212194808.GA130810-robh@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegieegjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepofgrgihimhgvucevhhgvvhgrlhhlihgvrhcuoehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedugfelledvtdffvdekudeijeduueevvdevffehudehvdeuudetheekheeigfetheenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedvrgdtudemtggsudelmeekugegtgemlehftddtmegstgdvudemkeekleelmeehgedttgemvgehlegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkegugegtmeelfhdttdemsggtvddumeekkeelleemheegtdgtmegvheelvgdphhgvlhhopehfvgguohhrrgdrhhhomhgvpdhmrghilhhfrhhomhepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvdekpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohepnhgvthguvghvs
 ehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqmhhsmhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhg
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_015741_258773_AB03DB8A 
X-CRM114-Status: GOOD (  11.23  )
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

Hello Rob,

On Wed, 12 Feb 2025 13:48:08 -0600
Rob Herring <robh@kernel.org> wrote:

> On Fri, Feb 07, 2025 at 11:36:19PM +0100, Maxime Chevallier wrote:
> > Hello everyone,
> > 
> > This series follows the 2 RFC that were sent a few weeks ago :
> > RFC V2: https://lore.kernel.org/netdev/20250122174252.82730-1-maxime.chevallier@bootlin.com/
> > RFC V1: https://lore.kernel.org/netdev/20241220201506.2791940-1-maxime.chevallier@bootlin.com/  
> 
> That makes this series v3. RFC is not a version, but a condition the 
> patches are in (not ready to merge).

Fair enough, next iteration will be V4 then :)

Thanks,

Maxime

> Rob


