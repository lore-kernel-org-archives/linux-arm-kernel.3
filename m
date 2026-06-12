Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BC36CD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 09:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JnSsKigRn5c+9jyMwus42zkZGVkrxMiJEJg8g85XgB8=; b=w0ir2Nq+LW8ZvfkJ5zas/ppdcL
	ExQUAcvJERmacfV9vSaYi4JnFlnpi8hfYdG1+TNfcsMs24fn5Nr5FFNBXaHAmDQ2O3XpIOzOBp2Cg
	8KY+7Hod2qboQhI3gMO/TFILY3c3OGzEG4uuU+WJd5DDb4FJPteYM8dvBzE1cjrimWeGhBM0vQOTw
	naoLyCwWitZV2lQj6WlmagAaEBDcCZpNxe5/8loBb3F+VnrcBEmij9x/K1tiZuCJzfmJ2O68shIw4
	s/2OGVIjCMHvEchhFFmUY0I9dBgYs0GoaJAaTnshRDGNkH/PRzTR5ffNb15ZDTTMXhy1l2AP7EjBa
	qfVbSgrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXxlZ-0000000AdNL-1TMs;
	Fri, 12 Jun 2026 09:01:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXxlY-0000000AdNC-1hQ7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 09:01:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CDFFA43756;
	Fri, 12 Jun 2026 09:01:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFC931F000E9;
	Fri, 12 Jun 2026 09:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781254887;
	bh=JnSsKigRn5c+9jyMwus42zkZGVkrxMiJEJg8g85XgB8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OzzIx0MxWjxzMrhfGvjizZFWDLyehvu+K58gQuyQ9+W96Q/GbX/fMeZUXOHV6dkRh
	 tQbqn9WBQH7hpivayGb6t7MvJEq/DYJPLf/lWtwhLI/YCTi0nC+ZxCu4vPqNeP48qO
	 RJtyYNfhLxGAVAbtAdmRpMc2BBaIvG26GBmaY2inKz/z0xsJM6yKPtztZZDEkswF+4
	 PuUYnf29ksfLGnbW57TGzLsBtgBHNbwOctn4HMiwNPDjvXi9A513aUkF//seTabDzw
	 K1o+S8NHFkOoxoPOYLWgKvbphdJQNj1jV76wvLKQuT9eWO7s8q/XMb89N26HgaGK/X
	 vuHvevGTK/hDQ==
Date: Fri, 12 Jun 2026 10:01:21 +0100
From: Simon Horman <horms@kernel.org>
To: Meghana Malladi <m-malladi@ti.com>
Cc: elfring@users.sourceforge.net, haokexin@gmail.com,
	vadim.fedorenko@linux.dev, devnexen@gmail.com,
	jacob.e.keller@intel.com, arnd@arndb.de, basharath@couthit.com,
	afd@ti.com, parvathi@couthit.com, vladimir.oltean@nxp.com,
	rogerq@kernel.org, danishanwar@ti.com, pabeni@redhat.com,
	kuba@kernel.org, edumazet@google.com, davem@davemloft.net,
	andrew+netdev@lunn.ch, linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, srk@ti.com,
	Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH net-next v7 0/2] Add Frame Preemption MAC Merge support
 for ICSSG
Message-ID: <20260612090121.GA625020@horms.kernel.org>
References: <20260610052511.781752-1-m-malladi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610052511.781752-1-m-malladi@ti.com>
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

On Wed, Jun 10, 2026 at 10:55:09AM +0530, Meghana Malladi wrote:
> This patch series adds QoS support to the ICSSG PRUETH driver.
> The first patch implements mqprio qdisc handling and TC offload hooks
> so userspace can request TC mappings and queue counts.
> 
> It also integrates a driver-side mechanism to program the firmware
> with the IET/FPE preemption mask and to kick the firmware verify state
> machine when frame preemption is enabled. The second patch adds ethtool
> perations for the MAC Merge (Frame Preemption) sublayer, exposing .get_mm,
> .set_mm and .get_mm_stats so admins can view and change MAC Merge
> parameters and retrieve preemption statistics.
> 
> v6: https://lore.kernel.org/all/20260525182700.3135858-1-m-malladi@ti.com/
> 
> MD Danish Anwar (2):
>   net: ti: icssg-prueth: Add Frame Preemption MAC Merge support
>   net: ti: icssg-prueth: Add ethtool ops for Frame Preemption MAC Merge

Hi Meghana and MD,

There is AI-generated review of this patch-set available on both
https://sashiko.dev and https://netdev-ai.bots.linux.dev/sashiko/
I would appreciate it if you could look over that with a view
to addressing any issues that directly affect this patch-set.

...

