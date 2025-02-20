Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49F67C021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 08:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wyzKqon1JbAJ6mkMIiukBpMAf6qqIZUI0/iiyhHUGis=; b=aZDRTG7E/yHBLwUT1KhvEkRbb/
	kMnFWOrpm7mOZheIyTM/KYFG2TuZOPzqtVaak75QN3efUCzt/8lDG/2EhnohMpIqqwxVwU7qdahUa
	7CGOfNQWzB9MJAWnHz0xHKL7zDWzcgIN1azXfRmiUKjO+l12a++m1xmL+rAlESDfB7V+qMsCC+JGR
	HpIilDjEqg3G0cz/NzW8wpnpo/x6SytrZgYx/JZkl+S/b49gFTZXeul/HoUZndfDoRq8HV793Bf3p
	44KkLE+pevgTE3YQKyVJFCqo1XalvVuZ1G4DcBLErhXkKEWR4R+2BE5aUEcXW0Q9V2Bviwt9WlrAN
	6YoYvjAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl23o-0000000HOi8-2OJV;
	Thu, 20 Feb 2025 08:37:32 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl22I-0000000HOKX-49M7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 08:36:01 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9827F44466;
	Thu, 20 Feb 2025 08:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740040554;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wyzKqon1JbAJ6mkMIiukBpMAf6qqIZUI0/iiyhHUGis=;
	b=c0zN2rqCeC+rI0FLMsinjEvErTzYmL96OZEJGEI4zeni0feD5W9esdgFjE7dVGu8/B0o6k
	zv1/mw9SK3w19NgU48bsSqY7ribJi6SCo31NIwJeATEkZ0qM2WpW+zlkF+6HYij/QOQWlH
	laYEq2Ux/PzKvEmmeG5YUZ29pTy0lPDNqWRC666P27XkjEnxMSw0xyOSA12j6LIyN1pHiY
	R6TkRZGSxzhKiTNNJBWoINAoToOsDVQ0JpF5PN1GqFeIczpZheiihi9zY/iUzzneIW7+uU
	CFgQHjBACUqX0XwEmY7MfbXdaXOsRLBOmMurm0HQ1YwvuiVT+2tW/ygNHhjusg==
Date: Thu, 20 Feb 2025 09:35:50 +0100
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
 Kozlowski <krzk+dt@kernel.org>, Romain Gantois
 <romain.gantois@bootlin.com>, Daniel Golle <daniel@makrotopia.org>, Dimitri
 Fedrau <dimitri.fedrau@liebherr.com>, Sean Anderson <seanga2@gmail.com>
Subject: Re: [PATCH net-next v4 15/15] dt-bindings: net: Introduce the
 phy-port description
Message-ID: <20250220093550.55844ab9@device-126.home>
In-Reply-To: <20250219223530.GA3083990-robh@kernel.org>
References: <20250213101606.1154014-1-maxime.chevallier@bootlin.com>
	<20250213101606.1154014-16-maxime.chevallier@bootlin.com>
	<20250219223530.GA3083990-robh@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeiieejtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepofgrgihimhgvucevhhgvvhgrlhhlihgvrhcuoehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegveeltddvveeuhefhvefhlefhkeevfedtgfeiudefffeiledttdfgfeeuhfeukeenucfkphepvdgrtddumegtsgduleemkegugegtmeelfhdttdemsggtvddumeekkeelleemheegtdgtmegvheelvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeekugegtgemlehftddtmegstgdvudemkeekleelmeehgedttgemvgehlegvpdhhvghlohepuggvvhhitggvqdduvdeirdhhohhmvgdpmhgrihhlfhhrohhmpehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefuddprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrg
 hdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhmshhmsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_003559_359730_EB661496 
X-CRM114-Status: GOOD (  22.38  )
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

Hi Rob,

On Wed, 19 Feb 2025 16:35:30 -0600
Rob Herring <robh@kernel.org> wrote:

> On Thu, Feb 13, 2025 at 11:16:03AM +0100, Maxime Chevallier wrote:
> > The ability to describe the physical ports of Ethernet devices is useful
> > to describe multi-port devices, as well as to remove any ambiguity with
> > regard to the nature of the port.
> > 
> > Moreover, describing ports allows for a better description of features
> > that are tied to connectors, such as PoE through the PSE-PD devices.
> > 
> > Introduce a binding to allow describing the ports, for now with 2
> > attributes :
> > 
> >  - The number of lanes, which is a quite generic property that allows
> >    differentating between multiple similar technologies such as BaseT1
> >    and "regular" BaseT (which usually means BaseT4).
> > 
> >  - The media that can be used on that port, such as BaseT for Twisted
> >    Copper, BaseC for coax copper, BaseS/L for Fiber, BaseK for backplane
> >    ethernet, etc. This allows defining the nature of the port, and
> >    therefore avoids the need for vendor-specific properties such as
> >    "micrel,fiber-mode" or "ti,fiber-mode".
> > 
> > The port description lives in its own file, as it is intended in the
> > future to allow describing the ports for phy-less devices.
> > 
> > Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> > ---
> > V4: no changes
> > 
> >  .../devicetree/bindings/net/ethernet-phy.yaml | 18 +++++++
> >  .../bindings/net/ethernet-port.yaml           | 47 +++++++++++++++++++
> >  MAINTAINERS                                   |  1 +
> >  3 files changed, 66 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/net/ethernet-port.yaml  
> 
> Seems my comments on v2 were ignored. Those issues remain.

My bad, I apparently completely missed it :/ Let me get back to that :)

Thanks,

Maxime

