Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80530C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 19:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AyPewJh5BEy9NySFtfgH7rwsbuyu4A/VIdLsXjU3RwY=; b=FYnSpp/qHbGqSHYtiwb50jZiD1
	lm2WLpqrrzT/B+l6Jfwzyi8psF0Y5p29pcrpjVWjIUoJnjscftvzqCgdcmiLvk/gw2LUnuwd3xVFK
	u1w7caukGTTM0f4sJneDfKTUSBqL0CdIfVYcpkKwNaqMt5mMmqpIKJ5A/wEjXxJiyU8JCIZ5WIQMn
	K3GkijiHoTK7nyEpJOh0VCLMENvbcziakEfqEoFQqyAik6oO1hbO51HubILn99OLm+IFLAWZYpn7g
	9a20Ed7cqNp6lViUfIOTvDOHwfwfxfYTsxwnFdQOVhFCfR5skzvrw2FuSEFqN251GMt8AiVp36TAA
	WprcD9+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umHQd-0000000EsSN-2NF5;
	Wed, 13 Aug 2025 19:46:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umGac-0000000EjtC-1YlB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 18:52:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 896645C6E7C;
	Wed, 13 Aug 2025 18:52:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8478C4CEEB;
	Wed, 13 Aug 2025 18:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755111165;
	bh=I8r3tBkgphht3SwtUg5nL9KzEgLdeknTCCzdfgQO5b4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fGGQFzHTOutY+PikQOg+P+YHiU6NjTociyTwlUlMKJNB909IdYw+OmZ514aIBwUs1
	 4dU57N13Jqjkoh53Tqk7MoBxkLa9cYBLd+fphd5tjEnN4YsVyTDJiI8PZo4aNayqNF
	 cfCwRyAcwrvqeUStvHdnotiJzLpsxSm1iT19dxR8xEypH5xBPt4HPSTuo7K9yXf26E
	 UgStl/gwBTGBOnu61VjcwfVKX7u/FTfcqEtgBCi/PD76cmwdP6rXqfMW9Cu9FZvM6o
	 MtvtvEohCqNZ/Ukws+f1+wuFo8M/e5nAKepbnCtqmcgxvUZKODgK78EZ/wYQp1dxWh
	 4ISy8/MduRniA==
Date: Wed, 13 Aug 2025 13:52:44 -0500
From: Rob Herring <robh@kernel.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH] of/irq: Convert of_msi_map_id() callers to of_msi_xlate()
Message-ID: <20250813185244.GA553867-robh@kernel.org>
References: <20250805133443.936955-1-lpieralisi@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250805133443.936955-1-lpieralisi@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_115246_452054_AD538093 
X-CRM114-Status: GOOD (  17.36  )
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

On Tue, Aug 05, 2025 at 03:34:43PM +0200, Lorenzo Pieralisi wrote:
> With the introduction of the of_msi_xlate() function, the OF layer
> provides an API to map a device ID and retrieve the MSI controller
> node the ID is mapped to with a single call.
> 
> of_msi_map_id() is currently used to map a deviceID to a specific
> MSI controller node; of_msi_xlate() can be used for that purpose
> too, there is no need to keep the two functions.
> 
> Convert of_msi_map_id() to of_msi_xlate() calls and update the
> of_msi_xlate() documentation to describe how the struct device_node
> pointer passed in should be set-up to either provide the MSI controller
> node target or receive its pointer upon mapping completion.
> 
> Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Marc Zyngier <maz@kernel.org>
> ---
> As suggested by RobH:
> 
> https://lore.kernel.org/lkml/20250627213241.GA168190-robh@kernel.org/
> 
>  drivers/irqchip/irq-gic-v3-its-fsl-mc-msi.c |  2 +-
>  drivers/of/irq.c                            | 25 +++++----------------
>  drivers/pci/msi/irqdomain.c                 |  2 +-
>  include/linux/of_irq.h                      |  6 -----
>  4 files changed, 7 insertions(+), 28 deletions(-)

Looks good to me. I'm happy to take it with some acks.

Rob

