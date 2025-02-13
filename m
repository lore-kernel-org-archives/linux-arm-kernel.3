Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B26AC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 22:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2hzS+FI60VI/+g6PwObbT206hn4do5C5OgJom8eIEiE=; b=hPViWcHC4t0eC45uaVyPWsU7pk
	YZew+wpOurq2Ky+yo9pe1yUrvTHR2pZt4Suw0w1mFoRaHY9KoopmvS1j7C+hb6h22jOt3CyqXpTbZ
	j/kyvyHAquPeseM0zVeJOlyKpZXHoBIt5pA8r3jCl7GUKHvUg9WLRvQgo0Kl4vl4t44aqnp3Xz8Qn
	Y8wBxmVl9/krwqF4BzlpjhWhAcvVG5jWY4A2873maOvNnHqkYDmrtqLvtVqiMdVaGEeyvR9GTmYuP
	ODftvQMc/nyYdSbZwisiV2HGltjE1+VASGR274h4/u/QyY7t7hL/6lVckL46sSSQLm/1m7oFMuLzr
	PvBMFfTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tihtw-0000000CqT9-45SP;
	Thu, 13 Feb 2025 22:41:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tihsU-0000000CqJt-3RCs;
	Thu, 13 Feb 2025 22:40:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E8C975C5B15;
	Thu, 13 Feb 2025 22:39:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B82A4C4CED1;
	Thu, 13 Feb 2025 22:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739486413;
	bh=0ZOnBBooSu9QRCdFCYo96n8iF9G3PFZPyQIsWCF0pk0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LDaOMRT+uzhZjygG3ZKdmKi4aVHXqmFSkP4S4em1YBqZM/3NHQwWdOWk/XnIy3TI8
	 r7uzSQeUc5CnTiJM8IFGjV+6udouVUw+jJj/pBmC416kCsnsKqa5v/DwK2tN9+OtoD
	 qzHxDNBnBjcXH70HtaGX9nCwE4hysG3dyd8YyCsuzEZUNHEeRSzPXNJqHH8R05HMq5
	 k7uqKOoMpVDpebEzYSqs4h1iYkCCsvXQZ57wncKCWQIHeG8xW3QleMAGCws18psgNl
	 OOT43jMG0gRbfQIyaPSJIz8Vn/hwU95cgTOJ7x9WuAay7n9nhHNbHIzTxZiZGp8K4o
	 E1AlSHXlAU/GA==
Date: Thu, 13 Feb 2025 23:40:10 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, Krzysztof Adamski <krzysztof.adamski@nokia.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Stefan Roese <sr@denx.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Gregory CLEMENT <gregory.clement@bootlin.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: Re: [PATCH v1 1/8] i2c: Introduce i2c_10bit_addr_from_msg()
Message-ID: <n7o3pkxkfw7jdvoce56jyxuzsnnpzkxaa2nrb725yut3i2twso@q7prmvzihysr>
References: <20250212163359.2407327-1-andriy.shevchenko@linux.intel.com>
 <20250212163359.2407327-2-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250212163359.2407327-2-andriy.shevchenko@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_144014_903391_BA14327D 
X-CRM114-Status: GOOD (  12.67  )
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

Hi Andy,

On Wed, Feb 12, 2025 at 06:32:26PM +0200, Andy Shevchenko wrote:
> There are already a lot of drivers that have been using
> i2c_8bit_addr_from_msg() for 7-bit addresses, now it's time
> to have the similar for 10-bit addresses.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

...

> +static inline u8 i2c_10bit_addr_from_msg(const struct i2c_msg *msg)
> +{
> +	/*
> +	 * 10-bit address
> +	 *   addr_1: 5'b11110 | addr[9:8] | (R/nW)
> +	 *   addr_2: addr[7:0]
> +	 */
> +	return 0xf0 | ((msg->addr & GENMASK(9, 8)) >> 7) | (msg->flags & I2C_M_RD);
> +}
> +

I personally like this patch and it was an item of my todo list.
I'm OK with having it merged.

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Andi

