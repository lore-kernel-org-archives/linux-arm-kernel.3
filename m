Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBF21C02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 13:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8fbCQNn82WPnsjU2Q1nFUJ1v7PQn+jeSDNUO4slevdM=; b=OFLYRK7GkTKogs6+J+Eem5uy4n
	2Rlqywekgh1GDpWfUYwL2vadRPuXN55wgzn1vZcRVEAAw0dq+7rZjowjpqF+J1Vaut2aLbuDI5A2b
	fRRMto/5W05TVNOIErarr6l3vDclvtkh3aNx5fe7anbIZdELYcCfHntMxJEKkbP6U0SttgQvhxCxy
	v3lLz3PdC4khtQlnf7+ZOM9xqHg1hZDc20LDGCOijzDJ1J6T1s4MBbjg680FQFQVuIclGBg9ZjMks
	MsnKJiBGZl4YuMqtgS5rBSCIdTwcUINlCEy+kPC15SQTvwehIqWt18+Bo5/tanx5c8IBi1zsQpnD2
	3CPUQI9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taaZZ-0000000AFXb-1PIw;
	Wed, 22 Jan 2025 13:15:09 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taaYH-0000000AFRn-0Fti
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 13:13:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C7A16A425D9;
	Wed, 22 Jan 2025 13:12:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ECCEC4CED6;
	Wed, 22 Jan 2025 13:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737551628;
	bh=Pg6l1vJipWXLQ85LZCUUwCiUt36EuYl/z6XJ1txMOiA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PhpoVxp2nfLJrvRCK3UG1TwY8mzw/Xl+DRTyxPH5SnMPPI8TVO8i2tf8FrOR0Cx3g
	 xmN+HsR9s9CdLzUpGtXLf888jgJohZVZZ9mdTzYNhfeGrbBnx7L87ZjzMs7oP/vFKC
	 P9viMoohMzqxLiMi9H3hnssoy/tu2c/5Um8I2yxpAVXkcxPQhDnz0Lolc3zUMGf30k
	 jXGL3Lri/TOwfOgzucIrbIZwRMNzCKWzBpifyFniVBatv3dhcGqhN1AH2uVhd86Zu6
	 W0Q8mvlGc+WX9mBhAo80U7VZEbNGDCNgd23mv6hxXMiNYW5yqH3elDHon6rQpHwpG0
	 AR/KmgNabkHHQ==
Date: Wed, 22 Jan 2025 13:13:41 +0000
From: Simon Horman <horms@kernel.org>
To: Meghana Malladi <m-malladi@ti.com>
Cc: rogerq@kernel.org, danishanwar@ti.com, pabeni@redhat.com,
	kuba@kernel.org, edumazet@google.com, davem@davemloft.net,
	andrew+netdev@lunn.ch, bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, robh@kernel.org,
	matthias.schiffer@ew.tq-group.com, dan.carpenter@linaro.org,
	rdunlap@infradead.org, diogo.ivo@siemens.com,
	schnelle@linux.ibm.com, glaroque@baylibre.com,
	john.fastabend@gmail.com, hawk@kernel.org, daniel@iogearbox.net,
	ast@kernel.org, srk@ti.com, Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH net 0/3] Add native mode XDP support
Message-ID: <20250122131341.GH390877@kernel.org>
References: <20250122124951.3072410-1-m-malladi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250122124951.3072410-1-m-malladi@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_051349_157580_9CA5AE50 
X-CRM114-Status: UNSURE (   9.97  )
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

On Wed, Jan 22, 2025 at 06:19:48PM +0530, Meghana Malladi wrote:
> This series adds native XDP support using page_pool.
> XDP zero copy support is not included in this patch series.
> 
> Patch 1/3: Replaces skb with page pool for Rx buffer allocation
> Patch 2/3: Adds prueth_swdata struct for SWDATA for all swdata cases
> Patch 3/3: Introduces native mode XDP support

Hi Meghana,

Unless I am mistaken this patchset should be targeted at net-next,
as a new feature, rather than net, as bug fixes.

With that in mind:

## Form letter - net-next-closed

The merge window for v6.14 has begun. Therefore net-next is closed
for new drivers, features, code refactoring and optimizations.
We are currently accepting bug fixes only.

Please repost when net-next reopens after Feb 3rd.

RFC patches sent for review only are obviously welcome at any time.

See: https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#development-cycle

--
pw-bot: deferred

