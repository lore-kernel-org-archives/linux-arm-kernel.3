Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69F19C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 15:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xKXOCD9CuZCCFOTORHsxB/Y4xy2wPXe8BRMSxN/bXRg=; b=VgymmbkXE90JtmK0PBf6WmFTBw
	EX+Jumaw4IfYIYrr32vkvOBwxgXLgFrIVeqhiNopi5Z3oP4+BLND/WJD+jKOab7jhRC6OYJjSDUxV
	TUZyDDzln5kNhQa5Mq5bDWysNGOQ7QyD2ZqJU4bFJCw8iOll8J6IAkcgr9fk4wuJRc6IzTdA+kKlr
	lSV8g7xrOy+F60S+15mICfWxup7TPn22hUn3o4ZN6OF7htc0ZG1FGRUmFjN6hbb4ns4BnqOe6ER3O
	pC8fmBbJHTbjPiNujfCAcBX2xbXY4UqxBmuuYgZBrKfh+8K7ySeUuMtwinzdSo7XtESnnWtGpwH8w
	lEPmPqyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvzPr-00000006QZ6-1BKP;
	Mon, 17 Aug 2026 15:38:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvzPq-00000006QYg-0YDi;
	Mon, 17 Aug 2026 15:38:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5FAF8601DE;
	Mon, 17 Aug 2026 15:38:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6664D1F000E9;
	Mon, 17 Aug 2026 15:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786981101;
	bh=xKXOCD9CuZCCFOTORHsxB/Y4xy2wPXe8BRMSxN/bXRg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=ZvjcytQro4FcohRmb7N6AK14yxjEkep/XoDVLoNLnoPY0rTz3/ej/NX2dU5EaOQS9
	 lWNnTpMnK7QCa12ivhA6fCXvPYeHe3hhr/ZwgtIK/JA5lhGCzu/GFzGVS7jPDHt41F
	 rSldX9QCcyshIOMubkTFvvIilwVY+Yz7v4tQ5jl+GfqyKjDr49jMH/5QoWa+MMoUvL
	 aYbYA0CtVghFN+b1UJh+he0Rk0JcUe8bgcJDX0nJ49Gpqys3jVSoI/nh4gBrzPrk41
	 4sIv9wtxaZiYUxw9DY423vOymteEHbxaKwvX7blDnvRLtHkHKIRAz8EZ5BI1uYh4Fa
	 25rgBGvslelWw==
Date: Mon, 17 Aug 2026 08:38:19 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Andrew
 Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Vladimir
 Oltean <olteanv@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "Chester A. Unal" <chester.a.unal@arinc9.com>, Daniel Golle
 <daniel@makrotopia.org>, Heiner Kallweit <hkallweit1@gmail.com>, Russell
 King <linux@armlinux.org.uk>, Simon Horman <horms@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org, mfd@lists.linux.dev, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v20 00/10] net: dsa: Add Airoha AN8855 support
Message-ID: <20260817083819.67dff919@kernel.org>
In-Reply-To: <20260817082034.20326-1-ansuelsmth@gmail.com>
References: <20260817082034.20326-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Mon, 17 Aug 2026 10:20:21 +0200 Christian Marangi wrote:
> This series add the initial support for the Airoha AN8855 Switch.

## Form letter - net-next-closed

The merge window for v7.3 has started, and therefore net-next is closed
for new drivers, features, code refactoring and optimizations.
We will only consider applying net-next patches which were posted
before the announcement:

https://lore.kernel.org/20260816155953.072d73da@kernel.org

Fixes are obviously welcome at any time. net-next patches may be sent
for review and discussion only with an RFC tag.

Please repost when net-next reopens.

See: https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#development-cycle
-- 
pw-bot: defer
pv-bot: closed

