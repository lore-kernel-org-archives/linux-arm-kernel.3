Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FF13C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 13:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B8bMV3NwRcE1hzN4J3o3cRGIKHoOIzyacT+46rTZMrQ=; b=QjvsyGwVsYpgzIDhCE7YucyBUf
	RQY446iyA9tmE9+Wz1Y6tozAfnDzyBzhBFrzuLFvQr3/WBF6G16X41mw+m8qu+a1jY3p79CdzdmCy
	5Ng/XkZudvnyqzZ+wzo8ss/3QO6O9FvtwqgUA/b4bZOC0uce0G8HMVitTWpuEBNF0AbmIBXkMy6R/
	xITnznwIKHskAehtfza7vvJoqnBvQLU7aPzloA3xHiDNG5r2I8a8DXCiqwfqDsOY7LMx8AyAwCDUH
	IAxHJGXwmxIzYvdZfOw0qdnsb9aQl+VnSjPGamcnLImgB6EQlQXk+79qHcXFlH2A5Ukv93foubdjl
	H4K5CBEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7aWX-0000000AgRb-1UGs;
	Wed, 23 Apr 2025 13:52:26 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7ZkN-0000000AWNF-0HcB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 13:02:40 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 056361FCE9;
	Wed, 23 Apr 2025 13:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745413355;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B8bMV3NwRcE1hzN4J3o3cRGIKHoOIzyacT+46rTZMrQ=;
	b=cdEUE4gxp1nKhx3LhaZV5bNGMQw2LTagDxZwhXwlyigGUjuYZ+CzjtrJjdGn3hfT0V0ekp
	L8pkeZKfiq1FS6//Jkt1UHLiFNZgmgDt/rJlKerX8KSTuXE7qLXq18Xo0pqM45dbcJMYYV
	Xwo2xKsZ6a64WDQKgKtDQD++Ae/NvoehAJ0IGzbz0No1wMzV50MEOTerP1hfZKf6iCKOVH
	EmJA3gHWC2LIZNKBG8l9yD2xTfTv8IOlvo0AzRdvEy1hoHd6uD/NVORXp3VbvzEZPQqGLr
	DgRDWQIW6KN8j5wbv1vtIBA5ZAk9UaMPQbPKkJV8taEUFn5zp0KT/6LjgroO5g==
Date: Wed, 23 Apr 2025 15:02:33 +0200
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Alexis =?UTF-8?B?TG90aG9yw6k=?= <alexis.lothore@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Richard Cochran <richardcochran@gmail.com>,
 Daniel Machon <daniel.machon@microchip.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Russell King (Oracle)" <linux@armlinux.org.uk>
Subject: Re: [PATCH net v2 2/2] net: stmmac: fix multiplication overflow
 when reading timestamp
Message-ID: <20250423150233.38fb5437@device-40.home>
In-Reply-To: <20250423-stmmac_ts-v2-2-e2cf2bbd61b1@bootlin.com>
References: <20250423-stmmac_ts-v2-0-e2cf2bbd61b1@bootlin.com>
	<20250423-stmmac_ts-v2-2-e2cf2bbd61b1@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeeiieejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertdejnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepuefhfefggfdthffghfdvhffhhfetuedtkeetgffhteevheehjeejgfduieduhedunecukfhppedvrgdtudemtggsudelmeekugegheemgeeltddtmeeiheeikeemvdelsgdumeelvghfheemvgektgejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkegugeehmeegledttdemieehieekmedvlegsudemlegvfhehmegvkegtjedphhgvlhhopeguvghvihgtvgdqgedtrdhhohhmvgdpmhgrihhlfhhrohhmpehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduiedprhgtphhtthhopegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrnhgurhgvfidonhgvthguvghvsehluhhnnhdrtghhpdhrtghpthhtohepuggrvhgvmhesuggrv
 hgvmhhlohhfthdrnhgvthdprhgtphhtthhopegvughumhgriigvthesghhoohhglhgvrdgtohhmpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehprggsvghnihesrhgvughhrghtrdgtohhmpdhrtghpthhtohepmhgtohhquhgvlhhinhdrshhtmhefvdesghhmrghilhdrtghomhdprhgtphhtthhopegrlhgvgigrnhgurhgvrdhtohhrghhuvgesfhhoshhsrdhsthdrtghomh
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_060239_391539_835268EB 
X-CRM114-Status: GOOD (  11.39  )
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

On Wed, 23 Apr 2025 09:12:10 +0200
Alexis Lothor=C3=A9 <alexis.lothore@bootlin.com> wrote:

> The current way of reading a timestamp snapshot in stmmac can lead to
> integer overflow, as the computation is done on 32 bits. The issue has
> been observed on a dwmac-socfpga platform returning chaotic timestamp
> values due to this overflow. The corresponding multiplication is done
> with a MUL instruction, which returns 32 bit values. Explicitly casting
> the value to 64 bits replaced the MUL with a UMLAL, which computes and
> returns the result on 64 bits, and so returns correctly the timestamps.
>=20
> Prevent this overflow by explicitly casting the intermediate value to
> u64 to make sure that the whole computation is made on u64. While at it,
> apply the same cast on the other dwmac variant (GMAC4) method for
> snapshot retrieval.
>=20
> Fixes: 477c3e1f6363 ("net: stmmac: Introduce dwmac1000 timestamping opera=
tions")
> Signed-off-by: Alexis Lothor=C3=A9 <alexis.lothore@bootlin.com>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Thanks,

Maxime

