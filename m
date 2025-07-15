Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0D37C83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 05:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A1k/U3hQfMUGlL/SXkrablVmE3MAWHpAEsTsDdMj+wg=; b=hOveFdJqO0d/hEixt1n/5SYdEg
	IWL+eG2facrRHgvLP3N52HeloPB+xyeI+0kFJlVqynsPq8ZIzTnnLZrOB/0autzt+G9HOKXSKpi2K
	h0pKA5SHlEXDRhsqZHlWIpLf1SAKydg4XLNmv6aW1q5tpUqv8diGVpU4K5eeuy0NIB1atmsaxBUK4
	GRUqL2OuuwqDjagTVLJYeF7+bCj8lfHm62Rhm9bbn8122n4Z9Sosl9SLZzl4g+xg7vSxl6n6Oht2G
	m5jzvN8+EkHP03KPAvbH9YwB0ZN/3RUF826R04K1WfY5pXqNoTGg7Ju6dkz1SwZAW5QPB8JZd96hK
	gNLALPxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubYhc-000000049gw-0g7w;
	Tue, 15 Jul 2025 05:59:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubYfA-000000049RW-1Ruj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 05:57:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 890D1462F5;
	Tue, 15 Jul 2025 05:57:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8964C4CEE3;
	Tue, 15 Jul 2025 05:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752559031;
	bh=wmvN79kkI2uY89k/rrcdVS6059/8dQL8TezMZWnf+rM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jJ0kddfRq/wi2cczPvscCBtaQBOvPPubaZPv3FhypEw+5UKK0WhctGzJqakUE47mj
	 0hgvMUtevpezIfVJrccsqdtSYPd2sjN0nRb9tN0vghFJ+c05Vt5+gWGqNDdNJk7p6H
	 Sh8oWOAYHvlvgAcM5ZwOV2KbvC/4LCYKyIt/WgUJb5b0ER0EaKLDgyQwMcQxcdZpWG
	 yRZoRdLWkXFBN0aAu91ZYkfbMxd4cRB9BrlHetz/bw9JgY4rGuKT9x+znMMEXCi7ry
	 xSs/2RLQ/Ed9IUoMZM+nwW7VQ7Wh00EVvhINdsIUSq31XrazAB7+UGLadWmjzYO5wH
	 BcbPsbS4HX8Vw==
Date: Tue, 15 Jul 2025 08:57:07 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Justin Stitt <justinstitt@google.com>,
	Jakub Kicinski <kuba@kernel.org>, linux-rdma@vger.kernel.org,
	linux-s390@vger.kernel.org, llvm@lists.linux.dev,
	Ingo Molnar <mingo@redhat.com>, Bill Wendling <morbo@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Salil Mehta <salil.mehta@huawei.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>, x86@kernel.org,
	Yisen Zhuang <yisen.zhuang@huawei.com>,
	Arnd Bergmann <arnd@arndb.de>, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Michael Guralnik <michaelgur@mellanox.com>, patches@lists.linux.dev,
	Niklas Schnelle <schnelle@linux.ibm.com>,
	Jijie Shao <shaojijie@huawei.com>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH v3 6/6] IB/mlx5: Use __iowrite64_copy() for write
 combining stores
Message-ID: <20250715055707.GC5882@unreal>
References: <0-v3-1893cd8b9369+1925-mlx5_arm_wc_jgg@nvidia.com>
 <6-v3-1893cd8b9369+1925-mlx5_arm_wc_jgg@nvidia.com>
 <20250714215504.GA2083014@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250714215504.GA2083014@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_225712_437913_B003F43E 
X-CRM114-Status: GOOD (  32.80  )
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

On Mon, Jul 14, 2025 at 06:55:04PM -0300, Jason Gunthorpe wrote:
> On Thu, Apr 11, 2024 at 01:46:19PM -0300, Jason Gunthorpe wrote:
> > mlx5 has a built in self-test at driver startup to evaluate if the
> > platform supports write combining to generate a 64 byte PCIe TLP or
> > not. This has proven necessary because a lot of common scenarios end up
> > with broken write combining (especially inside virtual machines) and there
> > is other way to learn this information.
> > 
> > This self test has been consistently failing on new ARM64 CPU
> > designs (specifically with NVIDIA Grace's implementation of Neoverse
> > V2). The C loop around writeq() generates some pretty terrible ARM64
> > assembly, but historically this has worked on a lot of existing ARM64 CPUs
> > till now.
> > 
> > We see it succeed about 1 time in 10,000 on the worst effected
> > systems. The CPU architects speculate that the load instructions
> > interspersed with the stores makes the WC buffers statistically flush too
> > often and thus the generation of large TLPs becomes infrequent. This makes
> > the boot up test unreliable in that it indicates no write-combining,
> > however userspace would be fine since it uses a ST4 instruction.
> 
> Hi Catalin,
> 
> After a year of testing this in real systems it turns out that still
> some systems are not good enough with the unrolled 8 byte store loop.
> In my view the CPUs are quite bad here and this WC performance
> optimization is not working very well.
> 
> There are only two more options to work around this issue, use the
> unrolled 16 byte STP or the single Neon instruction 64 byte store.
> 
> Since STP was rejected alread we've only tested the Neon version. It
> does make a huge improvement, but it still somehow fails to combine
> rarely sometimes. The CPU is really bad at this :(
> 
> So we want to make mlx5 use the single 64 byte neon store instruction
> like userspace has been using for a long time for this testing
> algorithm.
> 
> It is simple enough, but the question has come up where to put the
> code.  Do you want to somehow see the neon option to be in the
> arch/arm64 code or should we stick it in the driver under a #ifdef?
> 
> The entry/exit from neon is slow enough I don't think any driver doing
> performance work would want to use neon instead of __iowrite64_copy(),
> so I do not think it should be hidden inside __iowrite64_copy(). Nor
> have I thought of a name for an arch generic function..

__iowrite64_slow_copy() ????

> 
> Thanks,
> Jason

