Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D85C5C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 06:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=91QabIyHUeDDbVbgDDW38HeCEEGmj7YCmJ79O7+U7QQ=; b=CQ24psMmFjkLwydtTRtQ7NR2Z1
	V6U/rBcdxxUCLcXg4jFnwqi75bNaIR5QiCagcRgfmzDDlJIGsOtM3L+g0Z3yUWraAosnNxdmiHTqT
	WwH8tnPJrg+bz+dDjzOYzd0Hm2fU1AG4KDyEpwXeCnzyJ9394znq+TUBW8gUWr9cVnmOcqwv4WNc2
	CtcOEEESK9PB4wsWh6Mja1gTCr4e2Ztnqhg81lepfHYOtCNXZbdeMkdzmcGBQ9T6CwIN1rPcdFRQL
	Rn6cz+i6BI/c0Y28rEZZiTfleu7Rl9JcrHhN9tQLEFD3rwqKgAbvk6tIaLh5hsV3GIHVBY8sVIBio
	VlAOVGQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzrv5-00000005HjY-1Xai;
	Wed, 02 Apr 2025 06:49:51 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzrsj-00000005HJ4-2yOy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 06:47:27 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 15CDB4432F;
	Wed,  2 Apr 2025 06:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743576442;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=91QabIyHUeDDbVbgDDW38HeCEEGmj7YCmJ79O7+U7QQ=;
	b=QXUCBHUNUfi1vLcXOftm6Wj0p9c/FfloQ6SezD61YmMYPA3m8FcDc9A7A5C1VBwS1/4VM6
	el1ik/ux7jYuCcCMUNnyQXiJ1dpobRl4Q+mplDZUuUb5l/lFJ35wI3/xc6t13vfxS/XvcL
	gaWvZboR58uI/7CTkylFBvl+TjfefxRTIVXb9/5JPwRkMlyJ6/018NQEPmlC8ejjDqoXJN
	Y7+VOnTBpK6R9nPdbIMiAnMmWbYvpQeCaL87vxT7YXxGpu8MUaQmyEMlDjHPChxdcGyeAt
	vKzDxmEZuGFSYrz4LMt2oOqqLl8wi0juYqNTrCXir501yVdHNqWTB4hlUPrajg==
Date: Wed, 2 Apr 2025 08:47:15 +0200
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Alexander H Duyck <alexander.duyck@gmail.com>, davem@davemloft.net,
 Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Heiner
 Kallweit <hkallweit1@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
 linux-arm-kernel@lists.infradead.org, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Herve Codina <herve.codina@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean
 <vladimir.oltean@nxp.com>, =?UTF-8?B?S8O2cnk=?= Maincent
 <kory.maincent@bootlin.com>, Oleksij Rempel <o.rempel@pengutronix.de>,
 Simon Horman <horms@kernel.org>, Romain Gantois
 <romain.gantois@bootlin.com>
Subject: Re: [PATCH net-next v5 09/13] net: phylink: Use phy_caps_lookup for
 fixed-link configuration
Message-ID: <20250402084715.3090c6c2@fedora.home>
In-Reply-To: <Z-wQ1Ml_9xNz0XtV@shell.armlinux.org.uk>
References: <20250307173611.129125-1-maxime.chevallier@bootlin.com>
	<20250307173611.129125-10-maxime.chevallier@bootlin.com>
	<8d3a9c9bb76b1c6bc27d2bd01f4831b2cac83f7f.camel@gmail.com>
	<20250328090621.2d0b3665@fedora-2.home>
	<CAKgT0Ue_JzmJAPKBhe6XaMkDCy+YNNg5_5VvzOR6CCbqcaQg3Q@mail.gmail.com>
	<20250331091449.155e14a4@fedora-2.home>
	<3517cb7b3b10c29a6bf407f2e35fdebaf7a271e3.camel@gmail.com>
	<Z-wQ1Ml_9xNz0XtV@shell.armlinux.org.uk>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeegleelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeevledtvdevueehhfevhfelhfekveeftdfgiedufeffieeltddtgfefuefhueeknecukfhppedvrgdtudemtggsudelmeekugegheemgeeltddtmeeiheeikeemvdelsgdumeelvghfheemvgektgejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkegugeehmeegledttdemieehieekmedvlegsudemlegvfhehmegvkegtjedphhgvlhhopehfvgguohhrrgdrhhhomhgvpdhmrghilhhfrhhomhepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddtpdhrtghpthhtoheplhhinhhugiesrghrmhhlihhnuhigrdhorhhgrdhukhdprhgtphhtthhopegrlhgvgigrnhguvghrrdguuhihtghksehgmhgrihhlrdgtohhmpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlo
 hhfthdrnhgvthdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepvgguuhhmrgiivghtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehprggsvghnihesrhgvughhrghtrdgtohhmpdhrtghpthhtohephhhkrghllhifvghithdusehgmhgrihhlrdgtohhm
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_234726_387048_ACF19AAB 
X-CRM114-Status: GOOD (  20.18  )
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


> > Basically we still need the value to be screened by the pl->supported.
> > The one change is that we have to run the extra screening on the
> > intersect instead of skipping the screening, or doing it before we even
> > start providing bits.
> > 
> > With this approach we will even allow people to use non twisted pair
> > setups regardless of speed as long as they don't provide any twisted
> > pair modes in the standard set.
> > 
> > I will try to get this tested today and if it works out I will submit
> > it for net. I just need to test this and an SFP ksettings_set issue I
> > found when we aren't using autoneg.  
> 
> This code used to be so simple... and that makes me wonder whether
> Maxime's work is really the best approach. It seems that the old way
> was better precisely because it was more simple.

Sorry to hear you say that. Fixed-link was the main pain point with
this work, I've stressed it out. I agree that for fixed-link, it
ends-up not looking too good, hopefully the rest of the series
compensate for that.

Maxime

