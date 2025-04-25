Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 724C2C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 01:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E8QlRyan0PwNeBiRoeD1wpoSJfRt87bcFCiBLqWb95c=; b=QlXJsPY7dqFRVj+NqnvrPOdfKe
	A3+LfZ57f7DLfok9HKjCuT8mCZLzBR+yYgbTxNGomX5lzI6pSewnXMEEXKFYTNto76D99wygrK8Ce
	E0eA67o/llkBA/AABW0D/O8p2EOvjW4kOiVvRbBg7eGlhFri72emiLLdH0sJrJOPeKlNyBL5NuGnJ
	ycEkO8fEkRbCYxV+fsIATm6DednYHjXsbZ75Is4u2QzovQzs1idiKOT0XS8ZsPKcGfVq4d70eRsNB
	33xJrQiLAHWgv5r0lwL0Si1nzah4ngr01hlf0AlshArXeD3OacAw3/YygRxObDwqdH5Vl5ryo03fW
	IE7A8XJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u87do-0000000Fg6f-1h4O;
	Fri, 25 Apr 2025 01:14:08 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u87az-0000000Ffmd-1v4Q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 01:11:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8A4F2A4A00C;
	Fri, 25 Apr 2025 01:05:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51D6DC4CEE3;
	Fri, 25 Apr 2025 01:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745543472;
	bh=nLGs66opo0N3EZCpUzbatYQwr3fTWpeVoulS6yXDICc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ItoprWEXhQVfmXnGYnnfQd/7KVz/3MGTTbymR1IqOuAw4RL9yWdeVvtkFhFNI1+2S
	 M1D9SjbUawnI3/VFmowyD1LgJfJSMbX/7Yw/DsYU4ztcH1JQ0DH6aUJSaK2fcnlyAA
	 QttW+qiXmxC8OeSqh5t5Ugd5RFlerUXGET2VWuftPxM0VjPETrGsiRMtCnU/eDKrDk
	 4olu3wpqRVELbzbDHAHZuSP45Yr8eK6oxlsCI+vFrOrDFZFddqijuX7JYZQr1O6iwl
	 97PA+TEVD02Wl8HNeLe9EI2AdrV22TBzw5LV/LSCeYlZzbH5G3k4eu4RykrUg4gQqP
	 vCN2D/8n+qJOg==
Date: Thu, 24 Apr 2025 18:11:10 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Lukasz Majewski <lukma@denx.de>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Richard Cochran
 <richardcochran@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Stefan Wahren
 <wahrenst@gmx.net>, Simon Horman <horms@kernel.org>, Andrew Lunn
 <andrew@lunn.ch>
Subject: Re: [net-next v7 4/7] net: mtip: The L2 switch driver for imx287
Message-ID: <20250424181110.2734cd0b@kernel.org>
In-Reply-To: <20250423072911.3513073-5-lukma@denx.de>
References: <20250423072911.3513073-1-lukma@denx.de>
	<20250423072911.3513073-5-lukma@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_181113_572237_67A795CC 
X-CRM114-Status: GOOD (  15.58  )
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

On Wed, 23 Apr 2025 09:29:08 +0200 Lukasz Majewski wrote:
> This patch series provides support for More Than IP L2 switch embedded
> in the imx287 SoC.
> 
> This is a two port switch (placed between uDMA[01] and MAC-NET[01]),
> which can be used for offloading the network traffic.
> 
> It can be used interchangeably with current FEC driver - to be more
> specific: one can use either of it, depending on the requirements.
> 
> The biggest difference is the usage of DMA - when FEC is used, separate
> DMAs are available for each ENET-MAC block.
> However, with switch enabled - only the DMA0 is used to send/receive data
> to/form switch (and then switch sends them to respecitive ports).

Lots of sparse warnings and build issues here, at least on x86.

Could you make sure it's clean with an allmodconfig config, 
something like:

make C=1 W=1 drivers/net/ethernet/freescale/mtipsw/ 
-- 
pw-bot: cr

