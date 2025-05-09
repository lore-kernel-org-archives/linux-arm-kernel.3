Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1C1DC3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 03:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kReT668iljc+xdnx+sOA0B0XxmKP7afSe7koHAM3W0w=; b=LXQTrYiBCrhkjF91HuWyprQWUX
	0B+f5r8tOe5nkay4CrYhSv3QyyP2vlHmowXHpG/FfODssakr/nlpu3m6Zn5+mRB2Jch3E+dg5CT5J
	5Hyn4FvdTEIw2Rh3bovZWpSKqLvbPcvKsXeRQCsBbJRTu7CvepZva7hhmBTlXEwmTzpuLwbqLil2Y
	tYrAkXIYQQbyv8ICX9DkYotaj8GRnmMDVkac7s7KEJZUdgmxn4EHqL7Syuo4dl/Xnso1hSTdUhjc1
	znCv9NGQKiV4rQ7tOmqn8lILyO8yd63f3kUyhdZq4Nn0DPPwSKxQ9cMjcR5nHfCuurQQWUBIBMWLQ
	inAIRkqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDEqT-00000002PYL-2cWA;
	Fri, 09 May 2025 03:56:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDEAk-00000002Knw-3fWw;
	Fri, 09 May 2025 03:13:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3B05360008;
	Fri,  9 May 2025 03:13:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41002C4CEE7;
	Fri,  9 May 2025 03:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746760393;
	bh=rvYoCnD/Vbn1WCJh6yA8UpoAs4j9A3g4UDDTPLYIoec=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=IwQa1MdwFZSGbFKmCmvyZ5Xcqge2+s8LP5NIf7PU2+tel+c4uXjgg63pIkBWYil3I
	 uYx6bDmNym3bOhcxOK6Cg8lzJ8U3iiqDwfhVR67Q7e4tfD/MiPv+VySHmsqSfnI73I
	 HgfmAhscXk3dzD4WEjLfZpv3nxzlyKrdwSuJBAh+hvF2m2JTiZ0sul95iZ1AoyctDj
	 ZfEOGe7IeVnpHXeQhyxGCXm17d2LlgZWU96x2rca4oFRoTdZ3m8RxfCY9we2cJe0KG
	 F/e/EwZfI9e0+Duo1VfnpGkUuRJxqH8jImmSCgXmS8MAsjWIbe6BZqGsbq44A8vwg0
	 hHzLFoAA3Jj4g==
Date: Thu, 8 May 2025 20:13:12 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH net-next 2/2] net: airoha: Add the capability to
 allocate hw buffers in SRAM
Message-ID: <20250508201312.078a0a37@kernel.org>
In-Reply-To: <20250507-airopha-desc-sram-v1-2-d42037431bfa@kernel.org>
References: <20250507-airopha-desc-sram-v1-0-d42037431bfa@kernel.org>
	<20250507-airopha-desc-sram-v1-2-d42037431bfa@kernel.org>
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

On Wed, 07 May 2025 19:48:46 +0200 Lorenzo Bianconi wrote:
> In order to improve packet processing and packet forwarding
> performances, EN7581 SoC supports allocating buffers for hw forwarding
> queues in SRAM instead of DRAM if available on the system.
> Rely on SRAM for buffers allocation if available on the system and use
> DRAM as fallback.

drivers/net/ethernet/airoha/airoha_eth.c:1113:30: warning: incorrect type in assignment (different address spaces)
drivers/net/ethernet/airoha/airoha_eth.c:1113:30:    expected void *q
drivers/net/ethernet/airoha/airoha_eth.c:1113:30:    got void [noderef] __iomem *
-- 
pw-bot: cr

