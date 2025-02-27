Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76640C197BF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5OHpeTevapjpXns0af8rWtmgUSNADa+twmLoVsFzfNw=; b=S/GTNs4EunH1gErm754B9ucWvY
	x55r1/2bbduJKGRQkS8rWL0d62j6P9+ieen1ouatW7fsGa+OeJER/L6lkyX9stgoYUeKNYNjWPqD1
	M4EJahIjR4yFQGkU9DdmYtEQQIjbNYQxycOQcaL7eLJrfrL/op7voRqcgz+3VASmf9c3gnnivvZUU
	xpkVnpGLDVv5zyLqrvsLW+i4ctkqr8xFZjzlV3Y32L50XQhh4Xf1s6+LTnK50FSZGfkwRcPhFZm1b
	0gWQpPecU2IPTZSTs2EU/kZ7h0q2Vvjdt42ccs0XISr9+cUMK9xBVnvIAjP/Jyaqb+aPt2t27R7Ge
	RQBcEdpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjmK-00000008dEC-2Mih;
	Thu, 27 Feb 2025 19:42:42 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnias-00000008KAi-08wE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 18:26:47 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3EC654452A;
	Thu, 27 Feb 2025 18:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740680803;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5OHpeTevapjpXns0af8rWtmgUSNADa+twmLoVsFzfNw=;
	b=UgMIkYq/Rap3m9+gQ9n+sDO3Y1wOZBbkadd0W0TL65PmbZ3GvZHxeFV2bl47/RbsjWBge2
	LgfBvhxPC+Qr4O45KflSGhWdvvmGwq6tQ7rTupYX9msZzavgTMjz1b4Of9E+bCqhyjHhKr
	CtReEKOs4uG4ZxZRB9cIpf7HeLxcOnyWMVy3o/VyqY3caHrXNly/+oncTCvCXxCMgycKJg
	+0/56YhTqGNHFV9aqzjq8awPHBPM3YMR5ejcROz2/pEXtAP4YJsKacC1VqbOF9SvzhN+N3
	FmJa45GmMgdiBFhBJEBmuFb60B2U67C7EvSOFoPl8ZT+u8vKWFKTegCNsAtA+g==
Date: Thu, 27 Feb 2025 19:26:40 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: davem@davemloft.net, Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski
 <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Heiner Kallweit <hkallweit1@gmail.com>, Parthiban
 Veerasooran <parthiban.veerasooran@microchip.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com, linux-arm-kernel@lists.infradead.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Herve Codina
 <herve.codina@bootlin.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>, =?UTF-8?B?S8O2cnk=?= Maincent
 <kory.maincent@bootlin.com>, Oleksij Rempel <o.rempel@pengutronix.de>,
 Simon Horman <horms@kernel.org>, Romain Gantois
 <romain.gantois@bootlin.com>, Piergiorgio Beruto
 <piergiorgio.beruto@gmail.com>
Subject: Re: [PATCH net 0/2] net: ethtool: netlink: Fix notifications for
Message-ID: <20250227192640.01bae3b4@fedora.home>
In-Reply-To: <20250227182454.1998236-1-maxime.chevallier@bootlin.com>
References: <20250227182454.1998236-1-maxime.chevallier@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekkedukecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepofgrgihimhgvucevhhgvvhgrlhhlihgvrhcuoehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegveeltddvveeuhefhvefhlefhkeevfedtgfeiudefffeiledttdfgfeeuhfeukeenucfkphepvdgrtddumegtsgduleemkegugegtmeelfhdttdemsggtvddumeekkeelleemheegtdgtmegvheelvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeekugegtgemlehftddtmegstgdvudemkeekleelmeehgedttgemvgehlegvpdhhvghlohepfhgvughorhgrrdhhohhmvgdpmhgrihhlfhhrohhmpehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvtddprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegvughum
 hgriigvthesghhoohhglhgvrdgtohhmpdhrtghpthhtohepphgrsggvnhhisehrvgguhhgrthdrtghomhdprhgtphhtthhopehhkhgrlhhlfigvihhtudesghhmrghilhdrtghomhdprhgtphhtthhopehprghrthhhihgsrghnrdhvvggvrhgrshhoohhrrghnsehmihgtrhhotghhihhprdgtohhmpdhrtghpthhtohepnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_102646_227764_F2200EDD 
X-CRM114-Status: UNSURE (   4.89  )
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

On Thu, 27 Feb 2025 19:24:50 +0100
Maxime Chevallier <maxime.chevallier@bootlin.com> wrote:

Oops subject got truncated, should be :

net: ethtool: netlink: Fix notifications for PHY commands 

Maxime :(

