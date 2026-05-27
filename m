Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8930CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 11:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HrN4Efw4Y/a6bQTK/fsG1WgQ1Bf8x3DscanOsqzoDcY=; b=GGqA+4jfllCZsH/04G6LjYTg3j
	k1zJcJOYAJAcyC6zzitYgPpJ/UuS1CaUq4kmDTtwdwJd3osT3KdjtWAPBzQ7vraQIKOWEk+3T/pjj
	HItEN3a6eNJAxctT7354DHkrf3rTp1/ulwbiyf9im0PjvxxCuYBkfE89aU7AiXBRemLNyLrBp2vpR
	EyWw/Y8Z83SLc6lv2bKNy9ZWQZBsAKQOED4aLwQ8fYcARTLL90zJIw82DerNTs67OctbJw7qqj5Vm
	zaGDbH58bp9RTaMNZf0Ow/u77Bs2BUECYgRG0EmedRkN0mS0zv4HhWuaJ+bMp123irq3TPdwPpOAw
	a+d7hOFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSCuM-000000042aW-0U5p;
	Wed, 27 May 2026 11:58:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSCuJ-000000042aB-1GRZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 11:58:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C977A41522;
	Wed, 27 May 2026 11:58:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 508DA1F000E9;
	Wed, 27 May 2026 11:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779883122;
	bh=HrN4Efw4Y/a6bQTK/fsG1WgQ1Bf8x3DscanOsqzoDcY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=K+Jss9j9WpJRdqCNFMwLay4V8QoWwC+I/if9dLJI+5M1CZVFdTRlB15a0B3SWXxLx
	 tHGIyKD7ElIQlKyKa1X7nukGQeTyCKOz/c3qmVFyITQWgYmSH0BT0rLSc0JYfDhHbT
	 7FBn7JQ9rI3M7xDInUWrJ8gk7pHJyTOJdkzcx5686mQ0jlTBssekeR04ReZ0YKKiyR
	 ULE8ffQumIHvw65o3WNvBeuoHtCXK9N+yqVc6x7Uhqdx99QPyqqifrRJNZ3ZTgRuf1
	 DgWJlB6+A4oYEykF9nlLCtZcpzF/clOAmbanaHWCMSqDIxI/rZGUzU42LXzpM8xnaV
	 DLyif9JfSuI7w==
Date: Wed, 27 May 2026 12:57:55 +0100
From: Simon Horman <horms@kernel.org>
To: Meghana Malladi <m-malladi@ti.com>
Cc: liuhangbin@gmail.com, h-mittal1@ti.com, haokexin@gmail.com,
	vadim.fedorenko@linux.dev, devnexen@gmail.com,
	jacob.e.keller@intel.com, arnd@arndb.de, afd@ti.com,
	basharath@couthit.com, parvathi@couthit.com,
	vladimir.oltean@nxp.com, rogerq@kernel.org, danishanwar@ti.com,
	pabeni@redhat.com, kuba@kernel.org, edumazet@google.com,
	davem@davemloft.net, andrew+netdev@lunn.ch,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, srk@ti.com,
	Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH net-next v6 0/2] Add Frame Preemption MAC Merge support
 for ICSSG
Message-ID: <20260527115755.GK2256768@horms.kernel.org>
References: <20260525182700.3135858-1-m-malladi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260525182700.3135858-1-m-malladi@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_045843_667422_299D4FD8 
X-CRM114-Status: GOOD (  14.57  )
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

On Mon, May 25, 2026 at 11:56:58PM +0530, Meghana Malladi wrote:
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
> v5: https://lore.kernel.org/all/20260430111723.497113-1-m-malladi@ti.com/
> 
> MD Danish Anwar (2):
>   net: ti: icssg-prueth: Add Frame Preemption MAC Merge support
>   net: ti: icssg-prueth: Add ethtool ops for Frame Preemption MAC Merge

Hi Meghana and MD,

There is another round of AI-generated reviews for this patch-set available at
https://netdev-ai.bots.linux.dev/ and https://sashiko.dev/

I would appreciate it if you could look over them and address any
issues that are either introduced by this patch-set, or directly
impact it.

I would not suggest expanding this patchset to address any other
pre-existing issues, but rather address them separately as appropriate.

