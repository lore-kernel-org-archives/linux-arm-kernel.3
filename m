Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4224C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 18:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=emF8D5f5EgtnW/xsjxjLRVUkgCx7E5n49UQwRcvY9j0=; b=iBH/gaf7tiGPZSPOmXHFgj1rSH
	QCZGRfyLUtZ21/D+GRHivml9mqS4LUC+OTQCYXKjKHFdAvo3E/mSo+uD03T9SaS2sD5ECXt8kx89A
	uDFizpE+z3NQDM0QT1p9h9yKkPLms6O/a2g8nhEJwOZYdN82kCyjlm8E6AhGV3dSI5Oh1lC7TpM6e
	AmjcagTpriQRVhxEVx764pIkyt/LS2S0xRnLztoNupginnS27JMzkcHjU6YX5ohw0M4WaF8tEbCQI
	JfGPGtv7gzhtoQr6Hg69Qg69vSTgl608LhiBn7Kk74DMiKXEd1VWjs4sVxeNegl9pPGSXFa/bQ2ae
	ZECR77RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucpZe-0000000DHxG-3NXW;
	Fri, 18 Jul 2025 18:12:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucpXE-0000000DHpj-3l5f
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 18:10:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D071B601EF;
	Fri, 18 Jul 2025 18:10:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EA27C4CEEB;
	Fri, 18 Jul 2025 18:10:09 +0000 (UTC)
Date: Fri, 18 Jul 2025 19:10:06 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Will Deacon <will@kernel.org>,
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
Message-ID: <aHqN_hpJl84T1Usi@arm.com>
References: <0-v3-1893cd8b9369+1925-mlx5_arm_wc_jgg@nvidia.com>
 <6-v3-1893cd8b9369+1925-mlx5_arm_wc_jgg@nvidia.com>
 <20250714215504.GA2083014@nvidia.com>
 <aHYqPRqgcl5DQOpq@willie-the-truck>
 <20250715115200.GJ2067380@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250715115200.GJ2067380@nvidia.com>
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

On Tue, Jul 15, 2025 at 08:52:00AM -0300, Jason Gunthorpe wrote:
> On Tue, Jul 15, 2025 at 11:15:25AM +0100, Will Deacon wrote:
> > > Since STP was rejected alread we've only tested the Neon version. It
> > > does make a huge improvement, but it still somehow fails to combine
> > > rarely sometimes. The CPU is really bad at this :(
> > 
> > I think the thread was from last year so I've forgotten most of the
> > details, but wasn't STP rejected because it wasn't virtualisable? 
> 
> Yes, that was the claim.
> 
> > In which case, doesn't NEON suffer from exactly the same (or possibly
> > worse) problem?
> 
> In general yes, in specific no.

For a generic iowrite function, I wouldn't use STP or Neon since it may
end up being used on emulated MMIO.

BTW, for Neon, don't you need kernel_neon_begin/end()? This may have its
own overhead and also BUG_ON for different contexts. Again, not suitable
for a generic function.

Unfortunately, there's no way to know what this function is called on.
We might try to infer that the kernel started at EL2 but even that is
not entirely correct with nested virt. Or the OS may start at EL1 but
have direct access to mlx5 where we'd want the faster option.

> mlx5 (and other RDMA devices) have long used Neon for MMIO in
> userspace, so any VMM assigning mlx5 devices simply must make this
> work - it is already not optional. So we know that all VMs out there
> with mlx5 support neon for mlx5, and it is safe for mlx5 to use.

I can't think of any generic solution here, it may have to be a hack
specific to mlx5. We can also add add support for ST64B and have some
condition on system_supports_st64b() for future systems.

Even if we could handle virtualisation, I wonder whether
__iowrite64_copy() is the right function to implement 128-bit stores or
the larger 64-byte atomic stores. At least the comment for the generic
function suggests that it writes in 64-bit quantities. Some MMIO may
only handle such writes. A function like memcpy_toio() is more generic,
it doesn't imply any restrictions on the size of the writes (though I
think it guarantees natural alignment for the stores).

-- 
Catalin

