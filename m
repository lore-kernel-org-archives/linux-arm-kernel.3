Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 963D3C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 14:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U3cEbMgdG/cSxsTwGIcw+aHcYtjO45AnThYLCWBr9Ns=; b=24ZlD/Zz/gEBJ7msgcHh2jiup3
	O1nPBdNM0VgqdVw8dXyRO1hHCtXEMz48GgHgGs9nLkam3m8hMQGUrt/can36HVPmmnLnGcMDUBDY8
	gXrFu3/T9a2RG5NpQXIKhD2lD6G/80NtbocZ9yAzQ27wVki3kIHuCNSty+zqNi0JuFT/0vp+Umfbh
	jdQdFOk/Gymy9UYls10Wj0szPqhzoeR+/roiSgky1p36piOeCMIluWaPeb7Ac2QPJ1cGKdHC9+nbV
	oWlf2ew1qbRQ+ivrEvt+1LKV06vZ9FQS0wFL2Shz22sKV2eApm+C1F4kPMwEd1V7xgv9/dilkFUql
	wGsimiwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thr8r-000000046CE-1guO;
	Tue, 11 Feb 2025 14:21:37 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thr4s-000000045Yx-0kiE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 14:17:31 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 905ED442DD;
	Tue, 11 Feb 2025 14:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739283448;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U3cEbMgdG/cSxsTwGIcw+aHcYtjO45AnThYLCWBr9Ns=;
	b=XoZpnJdO7lsGL2P7mxYF0Ti8Rm8DTDdofRUkWH2Us/cNi+tQS5ZzA+7McFDisNb5hzLthn
	wqnDYt2Qknn18l8DHvezjeshVUY3CXY67Ih3TCJ/GJz059KBTHEZzsDkiyqKikCvto87fk
	6p+vtyeajKRhneYboAvf/wzuVe2ZR8RmoyKfIXI2mVbugt36sqnzBTP+m7UgowoJL/FGZl
	IC8fmP58UwVuEoyBqIRinlb55pYW0ZSmeNbHYVwBJI126Hb3diE7uJOdAddzwV4v8d36vm
	zYfp4NG8AWH2UBwM+mqmrmoj2HGe3UObW9+F7mBQJiuMKuv7gPnU99vcbzKvlg==
Date: Tue, 11 Feb 2025 15:17:23 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Kory Maincent <kory.maincent@bootlin.com>, davem@davemloft.net,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, thomas.petazzoni@bootlin.com, Jakub Kicinski
 <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Herve Codina <herve.codina@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit
 <hkallweit1@gmail.com>, Vladimir Oltean <vladimir.oltean@nxp.com>, Marek
 =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>, Oleksij Rempel
 <o.rempel@pengutronix.de>, =?UTF-8?B?Tmljb2zDsg==?= Veronese
 <nicveronese@gmail.com>, Simon Horman <horms@kernel.org>,
 mwojtas@chromium.org, Antoine Tenart <atenart@kernel.org>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, Romain
 Gantois <romain.gantois@bootlin.com>
Subject: Re: [PATCH net-next 03/13] net: phy: Introduce PHY ports
 representation
Message-ID: <20250211151723.22a922b0@fedora.home>
In-Reply-To: <0ae41811-e16b-4e64-9fc4-9cb4ea1da697@lunn.ch>
References: <20250207223634.600218-1-maxime.chevallier@bootlin.com>
	<20250207223634.600218-4-maxime.chevallier@bootlin.com>
	<20250211143209.74f84a10@kmaincent-XPS-13-7390>
	<0ae41811-e16b-4e64-9fc4-9cb4ea1da697@lunn.ch>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeguddvvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepofgrgihimhgvucevhhgvvhgrlhhlihgvrhcuoehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegveeltddvveeuhefhvefhlefhkeevfedtgfeiudefffeiledttdfgfeeuhfeukeenucfkphepvdgrtddumegtsgduleemkegugegtmeelfhdttdemsggtvddumeekkeelleemheegtdgtmegvheelvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeekugegtgemlehftddtmegstgdvudemkeekleelmeehgedttgemvgehlegvpdhhvghlohepfhgvughorhgrrdhhohhmvgdpmhgrihhlfhhrohhmpehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvkedprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdpr
 hgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhmshhmsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_061730_816875_E08748A0 
X-CRM114-Status: GOOD (  20.09  )
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

On Tue, 11 Feb 2025 15:04:27 +0100
Andrew Lunn <andrew@lunn.ch> wrote:

> > With net drivers having PHY managed by the firmware or DSA, there is no linux
> > description of their PHYs.  
> 
> DSA should not be special, Linux is driving the PHY so it has to exist
> as a linux device.
> 
> Firmware is a different case. If the firmware has decided to hide the
> PHY, the MAC driver is using a higher level API, generally just
> ksetting_set etc. It would be up to the MAC driver to export its PHY
> topology and provide whatever other firmware calls are needed. We
> should keep this in mind when designing the kAPI, but don't need to
> actually implement it. The kAPI should not directly reference a
> phydev/phylink instance, but an abstract object which represents a
> PHY.

That's fine by me for the port representation, and I'm on the same page
here. In the end, the ways for a NIC to register its interfaces would
be :

 - phylib, as done in this series. The port is controlled by the PHY,
the phy_port_ops are implemented in the PHY driver + phylib, we
discover the ports based on what the PHY reports, the new port binding
and the presence of an SFP phandle under the PHY.

 - phylink, and what I mean by phylink is actually SFP (phylink is the
SFP upstream in PHY-less SFP setups, so it would create the phy_port,
nothing more). what we cover here are MACs that are connected directly
to an SFP cage. This is simply because phylink parses the sfp phandle,
so it's an easy spot to make sure we create the NIC's port without
rewriting all drivers.

 - NIC drivers themselves, for drivers that don't use phylink/phylib.

For now this series only has the "phy_add_port" kAPI, which only really
covers case 1. But netdev_add_port() can clearly be implemented as well.

I'm having a hard time splitting that work in digestable chunks :(
I've focused on PHY as a reference use for ports, but the end-goal
clearly is a generic way to expose what interfaces a netdev has, either
through PHY, SFP or firmware.

Thanks,

Maxime

