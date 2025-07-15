Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B993C83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 10:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HPB78W+8McYaaB33e9qRAKjQ4OIesc7d4iKUKh7nDhY=; b=WcKdaycMmaBSoEyqPjKy3Y/mvP
	5MWDFjtXEbq11z2tglwkhPkOuKHCSLCfd1kRRCeVk4ko5bgeG+pAN2rEJe1rplTyu8mUVXKOA47NE
	wW9TX/5rDwbTpLluBHn35qo4omuywWE1Qmv1mzbj+nOJoJDijw/zHCv1Mk7lIJ70NP3g7OrgNPCiG
	qi2zJ2aoDlGKmcLh0DQbBY9u867EVhY70f5YNRkipB79m4AP4ZIY9IJzwshimWWZc0fHUkIzShUrb
	sOI8xlFD35PJ+9DzgL32OrldsaWOSjWF6pgWa/SHarOpnaEf0E1UFzBlT4oi0NFMYid4qwFwdjCUI
	W6O2lerA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubcsJ-00000004pSN-3hQo;
	Tue, 15 Jul 2025 10:27:03 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubchE-00000004oGn-1L11
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 10:15:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 54D27A54ACB;
	Tue, 15 Jul 2025 10:15:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1BDCC4CEE3;
	Tue, 15 Jul 2025 10:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752574535;
	bh=IBYVlI+orIMPRgYFaIqphL4RshTJzkbjmDni9IWE3vI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FztlJ1OFq4eDjn612gnPl+YVBf7o63I7kavAKkN6NFFz2JarOIQLE/JFJXeCg6HIL
	 z4ZOGtGZqr2hPQKCDh6IFKndGWXk3RHqqyPPB3czhiyvHdDfjkLQATIl9Lfl8M5gID
	 0HJtGGxF+rGCtt710YXgmyHq4m4s6ORR7QRXexgQRC8ZUNIjSNQXBlfwaF88VnHy5Q
	 DAeqFE4EsBQdtOCEvZ/PIaHSEYH78SR85B5+0dobS6Zx5s4O7OpqEuvklCOv/kkzQZ
	 i3ZfJH1M7EPMLX9i6abuLL0sl0GpzfeP8svATD4gLx1MMmUlMd7S/CH7JSvW9yWmk3
	 gd5aHtoOobY1A==
Date: Tue, 15 Jul 2025 11:15:25 +0100
From: Will Deacon <will@kernel.org>
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
	Jakub Kicinski <kuba@kernel.org>, Leon Romanovsky <leon@kernel.org>,
	linux-rdma@vger.kernel.org, linux-s390@vger.kernel.org,
	llvm@lists.linux.dev, Ingo Molnar <mingo@redhat.com>,
	Bill Wendling <morbo@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Salil Mehta <salil.mehta@huawei.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>, x86@kernel.org,
	Yisen Zhuang <yisen.zhuang@huawei.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Leon Romanovsky <leonro@mellanox.com>, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Michael Guralnik <michaelgur@mellanox.com>, patches@lists.linux.dev,
	Niklas Schnelle <schnelle@linux.ibm.com>,
	Jijie Shao <shaojijie@huawei.com>
Subject: Re: [PATCH v3 6/6] IB/mlx5: Use __iowrite64_copy() for write
 combining stores
Message-ID: <aHYqPRqgcl5DQOpq@willie-the-truck>
References: <0-v3-1893cd8b9369+1925-mlx5_arm_wc_jgg@nvidia.com>
 <6-v3-1893cd8b9369+1925-mlx5_arm_wc_jgg@nvidia.com>
 <20250714215504.GA2083014@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250714215504.GA2083014@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_031536_498547_B5F4429C 
X-CRM114-Status: GOOD (  26.20  )
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

I think the thread was from last year so I've forgotten most of the
details, but wasn't STP rejected because it wasn't virtualisable? In
which case, doesn't NEON suffer from exactly the same (or possibly
worse) problem?

Also, have you managed to investigate why the CPU tends not to get this
right? Do we e.g. end up taking interrupts/exceptions while the self
test is running or something like that?

Sorry for the wall of questions!

Will

