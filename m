Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2A52C282C5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 08:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pOa3s22YAm/GS76NctbdlTN04itDWk+8Ouif3lZJgQ8=; b=cbK/TG206d+it3jsVjPUoW9dWC
	2NvEQqJIueBThPT+VLDQH325PnEegDlqJhZ/fZ2XM+yGY1e32VNoCeqLPIdrRZ0p0eDarpx2cP/2e
	3mKx2JKC679KsocZHg5RKw+WnD7P8gvK+pvD1gB1TFXD1efvs7Sm9xk1unNzj9UZGf7bTkicX4IdA
	Qf584T4fxNFp6upLZJkQltWnywTXZEYyGgssxcGY99YgQHOhn1rsAdtaP+BcjYzrWFSg3Z5+rza7R
	Gi669UiEIiAVGa1M/uec7KWsB07qaCEbC66+Bdh+kAIjEEVPCJsCb3p2LPpt0KsBh/fgbD4TfUYrN
	bDjEYnSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnvaY-0000000A9VC-3ZB4;
	Fri, 28 Feb 2025 08:19:18 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnvVW-0000000A7lQ-0VL5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 08:14:08 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B4C8B4452E;
	Fri, 28 Feb 2025 08:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740730443;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pOa3s22YAm/GS76NctbdlTN04itDWk+8Ouif3lZJgQ8=;
	b=GLOqmQrXUKtxZL+GRVzAyv1Mj0DEAQcSkiraYQ0fH0XoogpE7H53q4W40Y4kK58LVLSt4a
	4iAGeQGRMndlOVFbbW3oIpfeyqb9c8WbK/eaxfroxXX5nAQRpw2j9VFFNRL3umEFkqMjyb
	TIPrcZdTLBqr1YXB4VGu0zlOr6cct5NDux3Bbntk+SzTW2IjaIki2KwPT//8jpsy4iu3Ig
	7VRJddudCQb9+2gT1iuBFBqCCHdA88CW7ShHX4fXpBcbCqnWbxDP9kfrP62UHP3b4KCJxo
	xQ4RnWQ99rs1q/P4AyRtF8MS+9/v8yc+ypK14Wv2QJgHV8k9Tg/2QxiZ+fyd2Q==
Date: Fri, 28 Feb 2025 09:14:00 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: <Parthiban.Veerasooran@microchip.com>
Cc: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <thomas.petazzoni@bootlin.com>, <linux-arm-kernel@lists.infradead.org>,
 <christophe.leroy@csgroup.eu>, <herve.codina@bootlin.com>,
 <f.fainelli@gmail.com>, <vladimir.oltean@nxp.com>,
 <kory.maincent@bootlin.com>, <o.rempel@pengutronix.de>, <horms@kernel.org>,
 <romain.gantois@bootlin.com>, <piergiorgio.beruto@gmail.com>,
 <davem@davemloft.net>, <andrew@lunn.ch>, <kuba@kernel.org>,
 <edumazet@google.com>, <pabeni@redhat.com>, <hkallweit1@gmail.com>
Subject: Re: [PATCH net 0/2] net: ethtool: netlink: Fix notifications for
Message-ID: <20250228091400.7ed7237c@fedora.home>
In-Reply-To: <c6df7040-40d2-46e0-b8f3-a28227d2d98c@microchip.com>
References: <20250227182454.1998236-1-maxime.chevallier@bootlin.com>
	<c6df7040-40d2-46e0-b8f3-a28227d2d98c@microchip.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekleekjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeevledtvdevueehhfevhfelhfekveeftdfgiedufeffieeltddtgfefuefhueeknecukfhppedvrgdtudemtggsudelmeekugegtgemlehftddtmegstgdvudemkeekleelmeehgedttgemvgehlegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkegugegtmeelfhdttdemsggtvddumeekkeelleemheegtdgtmegvheelvgdphhgvlhhopehfvgguohhrrgdrhhhomhgvpdhmrghilhhfrhhomhepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddtpdhrtghpthhtoheprfgrrhhthhhisggrnhdrgggvvghrrghsohhorhgrnhesmhhitghrohgthhhiphdrtghomhdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrn
 hgvlhdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopegthhhrihhsthhophhhvgdrlhgvrhhohiestghsghhrohhuphdrvghupdhrtghpthhtohephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepfhdrfhgrihhnvghllhhisehgmhgrihhlrdgtohhm
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_001406_316291_C9A8115A 
X-CRM114-Status: UNSURE (   7.93  )
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

On Fri, 28 Feb 2025 06:19:18 +0000
<Parthiban.Veerasooran@microchip.com> wrote:

> Hi Maxime,
> 
> I did a quick test with your patches and it seems working fine without 
> kernel crash.
> 
> Best regards,
> Parthiban V

Thanks for testing, good to hear that this solves the issue :)

Maxime

