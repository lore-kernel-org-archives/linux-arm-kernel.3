Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87774C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Mar 2025 09:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XRJEoxt60O83ppaAV+LL/miyh/fpyrDqP7zxjnOiPVo=; b=4S8uMSMyqNtKu9XFYyUWCPgEx1
	m1f5vcqd+ny1P0zAYYk8dSQe6ENH3ToPomAife0gWOY/NIqrkVyCZmXdzRAxPGmM4PnJjDO0qgtrI
	0j5ndIjJwvgSYpuIPA3wAqx9WdLQdvj2hmi2rq0rOKf7NQ1KUlWE5SREjkBpOaof4CK1+VJ4y+jUm
	X111TfxhpH3VQdoH7paLN9tYmevykCRumZ2gHXAI5EuNVMYSB6VZJNQYG1cdsVAp4xZyu9I3FskfH
	RCMJ3Tu7/ztjkD/ig22ZdQJL19bDkN++n7Xmov9Sn3F+7c5udrLnzYuPNVQWbYX6gKiipo3YkdC5t
	xqo9wMJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toJZL-0000000Diem-1cFM;
	Sat, 01 Mar 2025 09:55:39 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toJXl-0000000DiW6-38ne
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Mar 2025 09:54:03 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id DC07B204D3;
	Sat,  1 Mar 2025 09:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740822835;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XRJEoxt60O83ppaAV+LL/miyh/fpyrDqP7zxjnOiPVo=;
	b=KD+efzw6Gx9aL3vkkXqp2yVJUaIn7T+leY97gmNLuJrC8gFLPvpP3aSeeLkw1AlfHbcbij
	e5UBkq/wk9Q155/bzKuYsJ/SBwGFn7UfssPcxyvTJvqW7GdfBsftbTBqR8BYsUdwIpVely
	504F/0upXLq8ow18saZ62POCVbqVwiu68+ab24Y4a8wk5TB51PTFj3XirKt2Nd/utMZmue
	OnG0iBd9DfBAyf1hyJm+j3q4BwhQUGHtdSr0An9bvQ85dwOWnm5IyFxNXzpCBuGM0LG+Ty
	ywdqn5u9/h6xltqAc/Avup1TYVA2BcNPUi+ebq1tNeCa9re5IibnNxPG4IEvkw==
Date: Sat, 1 Mar 2025 10:53:52 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, Andrew Lunn <andrew@lunn.ch>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Heiner Kallweit
 <hkallweit1@gmail.com>, Parthiban Veerasooran
 <parthiban.veerasooran@microchip.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
 linux-arm-kernel@lists.infradead.org, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Herve Codina <herve.codina@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean
 <vladimir.oltean@nxp.com>, =?UTF-8?B?S8O2cnk=?= Maincent
 <kory.maincent@bootlin.com>, Oleksij Rempel <o.rempel@pengutronix.de>,
 Simon Horman <horms@kernel.org>, Romain Gantois
 <romain.gantois@bootlin.com>, Piergiorgio Beruto
 <piergiorgio.beruto@gmail.com>
Subject: Re: [PATCH net 2/2] net: ethtool: netlink: Pass a context for
 default ethnl notifications
Message-ID: <20250301105352.2951af4c@fedora.home>
In-Reply-To: <20250228182440.3c7f4709@kernel.org>
References: <20250227182454.1998236-1-maxime.chevallier@bootlin.com>
	<20250227182454.1998236-3-maxime.chevallier@bootlin.com>
	<20250228182440.3c7f4709@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdelvdelkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepofgrgihimhgvucevhhgvvhgrlhhlihgvrhcuoehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegveeltddvveeuhefhvefhlefhkeevfedtgfeiudefffeiledttdfgfeeuhfeukeenucfkphepvdgrtddumegtsgduleemkegugegtmeelfhdttdemsggtvddumeekkeelleemheegtdgtmegvheelvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeekugegtgemlehftddtmegstgdvudemkeekleelmeehgedttgemvgehlegvpdhhvghlohepfhgvughorhgrrdhhohhmvgdpmhgrihhlfhhrohhmpehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvtddprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopegvughum
 hgriigvthesghhoohhglhgvrdgtohhmpdhrtghpthhtohepphgrsggvnhhisehrvgguhhgrthdrtghomhdprhgtphhtthhopehhkhgrlhhlfigvihhtudesghhmrghilhdrtghomhdprhgtphhtthhopehprghrthhhihgsrghnrdhvvggvrhgrshhoohhrrghnsehmihgtrhhotghhihhprdgtohhmpdhrtghpthhtohepnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250301_015402_566241_0440A59F 
X-CRM114-Status: GOOD (  11.93  )
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

On Fri, 28 Feb 2025 18:24:40 -0800
Jakub Kicinski <kuba@kernel.org> wrote:

> On Thu, 27 Feb 2025 19:24:52 +0100 Maxime Chevallier wrote:
> > The only relevant user for now is PLCA, and it very likely that we never
> > ended-up in a situation where the follow-up notif wasn't targeting the
> > correct PHY as :  
> 
> PLCA uses the ethnl_default_* handlers but it seems to operate on PHYs
> now. How does the dump work? Shoehorning the PHY support into
> the ethnl_default_* handlers is starting to look pretty messy.

I agree, that's the less ugly quick solution I could think of :(

So maybe we need some generic PHY dump support for all PHY commands ?

I should probably re-send patch 1 only to fix the crash, and rework the
dump/notify for PHY commands separately if this is OK for you ?

Maxime

