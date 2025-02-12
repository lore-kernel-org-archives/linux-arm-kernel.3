Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53883C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 15:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Nvg4QglQodfKQr7m6fSz0niTjDrBbuKs7TKOdeAwXU=; b=MyhvOg4XQmuX5F7zxFKhuttHVa
	DHoUY/iVtQ8gw5CwZaf/V1XYel1mvCUf0R5Sumb1bBI49k8HjoqJC5Pb94LPUdIFraC/QlIxXCcFg
	I9JX+xxYvhI4PShIOnAK80wZBeAUPSrGqIbhNVVIl9xi6aRiyWdw6tSV0aSNjQmpxgh3WkS1ZDrgY
	SoZL9K1lma/oC+toA3RxHjlbABshSQYCVjiwWuJbLkImYp/AvvGLcNj5dUZU+jy6GcQB9YyiIJAES
	0J0snOdQUByC4xFWH/aWB+lCoRSLfvGhKjF8qkmeiNNo+nbVKBN1s3h21DrgdwLAd5fe7otxJytgL
	JmWBS2BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiEvx-00000007ugc-1LjD;
	Wed, 12 Feb 2025 15:45:53 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiEuU-00000007uJF-45MO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 15:44:25 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1E980442D6;
	Wed, 12 Feb 2025 15:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739375058;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2Nvg4QglQodfKQr7m6fSz0niTjDrBbuKs7TKOdeAwXU=;
	b=GQCOmaBSnC/i8iAsgY0efCfiAYTph6AI1qwgDbCc/xKGaEGtfOjA75c13OJfSiIX+WIlzW
	39yW+7hD3mBQ8Y/uitR2/zs9njJpnio5rOM6ZZGHiJo4ZPwYmA3Pvy/D6TFIyh5Csu5Yev
	kSMYw8PtUxEgE6yUCTzJuwjwjE466REOQAIFBtvWS1LrGOtnBmwja6nPstr5FvNNKkjKt3
	vUjxrLnITnk50g3TFKciPai+9I4abS0fD/Xnixd9dtbv5jNlkh3UscX2V6l+J8h0oYeJAU
	KOiqlTLOedhisvAE4IOeMpMn3Nk/vCpAtFprgSYfTw7OsBSL0AiMJVB8+FGPtw==
Date: Wed, 12 Feb 2025 16:44:15 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Sean Anderson <seanga2@gmail.com>
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
 Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, Romain
 Gantois <romain.gantois@bootlin.com>
Subject: Re: [PATCH net-next 00/13] Introduce an ethernet port
 representation
Message-ID: <20250212164415.02ad5cec@fedora.home>
In-Reply-To: <c927247b-e39c-8511-d95c-77fb23b82808@gmail.com>
References: <20250207223634.600218-1-maxime.chevallier@bootlin.com>
	<8349c217-f0ef-3629-6a70-f35d36636635@gmail.com>
	<20250210095542.721bf967@fedora-1.home>
	<c927247b-e39c-8511-d95c-77fb23b82808@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeggedvjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepofgrgihimhgvucevhhgvvhgrlhhlihgvrhcuoehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegveeltddvveeuhefhvefhlefhkeevfedtgfeiudefffeiledttdfgfeeuhfeukeenucfkphepvdgrtddumegtsgduleemkegugegtmeelfhdttdemsggtvddumeekkeelleemheegtdgtmegvheelvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeekugegtgemlehftddtmegstgdvudemkeekleelmeehgedttgemvgehlegvpdhhvghlohepfhgvughorhgrrdhhohhmvgdpmhgrihhlfhhrohhmpehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvledprhgtphhtthhopehsvggrnhhgrgdvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrghdpr
 hgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhmshhmsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_074423_322772_72699B96 
X-CRM114-Status: GOOD (  10.12  )
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

Hello Sean,

On Wed, 12 Feb 2025 10:39:48 -0500
Sean Anderson <seanga2@gmail.com> wrote:


> > Sorry if all of that was blurry, I did make so good of a job linking to
> > all previous discussions on the topic, I'll address that for the next
> > round.  
> 
> Thanks for the detailed explanation, especially regarding PHY redundancy.
> Could you add it to a commit message (or even better to Documentation/)?

Sure thing :)

Thanks,

Maxime

