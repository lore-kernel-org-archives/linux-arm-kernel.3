Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34DA9C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 07:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3xoURsCfOKW/dz0Jqi7uXc/ZFxx8fcEUzD+XtCJ3Q3s=; b=S1Fgw4i1bGNbMRDio2eFR2idaJ
	0H4Yf+SKNyKWjrsZIfepsMq+uzFiVP55DCvUQBwzvbe/OvE4Pj8Y8KjB+PioVyXhZrbyFCVky4VBh
	EofU68i83SeR9NVxkIsYmzbit2hF2KeHmWZDag7eOBlbz2FwaQRQ93ikcV373XCcluMDqxm0eD7J3
	7FnR9vcjVGzB3dZqMi9AzA8J0IBUmy5yFEbOw7I0CANzR1oHiVI0xnRBPjhKVX4k3ivSwAwOliELG
	kJEj15j5SBlHk9ZjDGaMqILqS4OaQSIkP6PPcM016qaU3tNJatPWnqvqR6+LeDa6jFC7VHeO0ArkJ
	TcEf6ZOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq5uT-0000000AF4m-1p6J;
	Thu, 06 Mar 2025 07:44:49 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq5rv-0000000AEgu-0kdE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 07:42:13 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0BD7D442CA;
	Thu,  6 Mar 2025 07:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741246928;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3xoURsCfOKW/dz0Jqi7uXc/ZFxx8fcEUzD+XtCJ3Q3s=;
	b=SuXMt55WxRBIvDxHEMAAOlvC/+AA+n7CeEr5M+yDIrFE5ml2rzwpg1c5GpDq7pwU6lp83B
	Bn+bnzV5UlLIfdz8g7Yovz9VfOw3UNNY2NzFBCaTCrzCyZs1OJUAmv71hZXq0H4i7eXogl
	mDcEPIq3ZxhtM3irJpADhradX2IGZl+oVYjmNoM0Xq+vrx1knAH614E9HwPm644aiDKxin
	W+EVtusIT70HhOjkFspQWVDEmWsjtfSDznxx+PenKppqQwWdEzIIrgD8FCd/JkqvXSpzO8
	BnkiZxUpeITdopx3NvEELgIdYMhXtURLNJu9YbPdDehtMQX/z/FSgec68y11IQ==
Date: Thu, 6 Mar 2025 08:42:01 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, Andrew Lunn <andrew@lunn.ch>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Heiner Kallweit
 <hkallweit1@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
 linux-arm-kernel@lists.infradead.org, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Herve Codina <herve.codina@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Russell King
 <linux@armlinux.org.uk>, Vladimir Oltean <vladimir.oltean@nxp.com>,
 =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>, Oleksij Rempel
 <o.rempel@pengutronix.de>, Simon Horman <horms@kernel.org>, Romain Gantois
 <romain.gantois@bootlin.com>, Piergiorgio Beruto
 <piergiorgio.beruto@gmail.com>, Stanislav Fomichev <sdf@fomichev.me>
Subject: Re: [PATCH net-next 0/7] net: ethtool: Introduce ethnl dump helpers
Message-ID: <20250306084201.23885f5b@fedora.home>
In-Reply-To: <20250305184749.5519e7a9@kernel.org>
References: <20250305141938.319282-1-maxime.chevallier@bootlin.com>
	<20250305180252.5a0ceb86@fedora.home>
	<20250305184749.5519e7a9@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddutdejudejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeevledtvdevueehhfevhfelhfekveeftdfgiedufeffieeltddtgfefuefhueeknecukfhppedvrgdtudemtggsudelmeekugegtgemlehftddtmegstgdvudemkeekleelmeehgedttgemvgehlegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkegugegtmeelfhdttdemsggtvddumeekkeelleemheegtdgtmegvheelvgdphhgvlhhopehfvgguohhrrgdrhhhomhgvpdhmrghilhhfrhhomhepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddupdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepvgguu
 hhmrgiivghtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehprggsvghnihesrhgvughhrghtrdgtohhmpdhrtghpthhtohephhhkrghllhifvghithdusehgmhgrihhlrdgtohhmpdhrtghpthhtohepnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_234211_832181_977EE3A5 
X-CRM114-Status: GOOD (  10.88  )
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

On Wed, 5 Mar 2025 18:47:49 -0800
Jakub Kicinski <kuba@kernel.org> wrote:

> On Wed, 5 Mar 2025 18:02:52 +0100 Maxime Chevallier wrote:
> > This series will very likely conflict with Stanislav's netdev lock
> > work [2], I'll of course be happy to rebase should it get merged :)  
> 
> Also this doesn't build. Please hold off on reposting for a couple of
> days - because of the large conflict radius the previous few revisions
> of the locking series haven't even gotten into the selftest CI queue :(

Sure no problem. I'll try t figure out what's up with the build in the
meantime, looks like I inverted a few changes that break
bissecatability.

I'll keep an eye on Stanislav's work in the meantime as well.

Thanks,

Maxime

