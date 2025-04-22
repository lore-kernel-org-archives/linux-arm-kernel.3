Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3EE4C369D7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 16:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5wQBSXq5gMB9p0PSlyEcreJi6xlp1HfzxXyQ7iVhE8Q=; b=XLIQ4mJv9852grzSOA+7qAQ0jA
	APAjmaZHyfWkLy7xP21IEHmjMCi9E3YH4cnq02VddqQsgi3J7VZLJilIw0o5cYOjIh6tw/UEq2UpO
	RxW5Br0+1e5JepiLHNJy/AScDJ7epIoLppyEfDpbgvsRE2FyntQL4rv+K14Sv/ck1x8L26yRJWRv6
	AUYIDKxpS9j/9Q7u/bVPYMIsZJnXQoZ78lWH/6PmExxjegr6gvcWCA+u7poeLuqqJZiX5yg6US7p1
	FfR8cbN0Gx9avqjS9MYOC4IUkU60tVHdw8zaLWvAH3hmNbRNjygzsyuBF7en0jjE4IzKK8AZhqwvK
	9qwTsV4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7GNm-00000007svm-3Kkl;
	Tue, 22 Apr 2025 16:22:02 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7EHS-00000007Qct-0e2w;
	Tue, 22 Apr 2025 14:07:24 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4D08E438B8;
	Tue, 22 Apr 2025 14:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745330839;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5wQBSXq5gMB9p0PSlyEcreJi6xlp1HfzxXyQ7iVhE8Q=;
	b=GVrP4kufEZOfGy/tFnOMdXAbL6gaybEyWDMLGZCYQ/fFdj4b5H/ZekXPJpZ/Ki+gmoPhUh
	L4pS/IhCwrddCrYuK1xRcbtzNcLESF2KUJJPpDYgD9FJGp8h7/ABLh+LcJe1tB9jNFkNWY
	TneYE+e4JvIaPkJnvRqS8zk3xVjI7I3OGURn61KMED7wAnLgcyAU3hFnOhOIk7SNQ0r359
	/FrBaXE17Sg5Etx0fd3fsmvZ7ZP/dk65Y4fZoMETcYd6rlxiIzDWGuglBNUvlJy/RA4rQP
	cryNSs+C3asamzoSJTCVO828IJkIfAWCMDSqTT/bUnwp14GjlwthHkj3s5pKcQ==
Date: Tue, 22 Apr 2025 16:07:16 +0200
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Biao
 Huang <biao.huang@mediatek.com>, Yinghua Pan <ot_yinghua.pan@mediatek.com>,
 kernel@collabora.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/2] net: ethernet: mtk-star-emac: rearm interrupts in
 rx_poll only when advised
Message-ID: <20250422160716.71a16b1a@fedora.home>
In-Reply-To: <20250422-mtk_star_emac-fix-spinlock-recursion-issue-v1-2-1e94ea430360@collabora.com>
References: <20250422-mtk_star_emac-fix-spinlock-recursion-issue-v1-0-1e94ea430360@collabora.com>
	<20250422-mtk_star_emac-fix-spinlock-recursion-issue-v1-2-1e94ea430360@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeefleefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeevledtvdevueehhfevhfelhfekveeftdfgiedufeffieeltddtgfefuefhueeknecukfhppedvrgdtudemtggsudelmeekugegheemgeeltddtmeeiheeikeemvdelsgdumeelvghfheemvgektgejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkegugeehmeegledttdemieehieekmedvlegsudemlegvfhehmegvkegtjedphhgvlhhopehfvgguohhrrgdrhhhomhgvpdhmrghilhhfrhhomhepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudekpdhrtghpthhtoheplhhouhhishgrlhgvgihishdrvgihrhgruhgusegtohhllhgrsghorhgrrdgtohhmpdhrtghpthhtohepnhgsugesnhgsugdrnhgrmhgvpdhrtghpthhtohepshgvrghnrdifrghnghesmhgvughir
 ghtvghkrdgtohhmpdhrtghpthhtoheplhhorhgvnhiioheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghnughrvgifodhnvghtuggvvheslhhunhhnrdgthhdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohepvgguuhhmrgiivghtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhg
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_070722_330949_F21A4FDC 
X-CRM114-Status: UNSURE (   9.57  )
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

Hi Louis-Alexis,

On Tue, 22 Apr 2025 15:03:39 +0200
Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com> wrote:

> In mtk_star_rx_poll function, on event processing completion, the
> mtk_star_emac driver calls napi_complete_done but ignores its return
> code and enable RX DMA interrupts inconditionally. This return code
> gives the info if a device should avoid rearming its interrupts or not,
> so fix this behaviour by taking it into account.
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Patch looks correct, however is it fixing a problematic behaviour
you've seen ? I'm asking because it lacks a Fixes: tag, as well as
targetting one of the net/net-next trees :)

Thanks,

Maxime


