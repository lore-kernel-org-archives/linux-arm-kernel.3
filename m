Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D503C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 18:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Xb119zHmBsmoCG7482SMd8hXLJjvQ5czpKGeKGm1EY=; b=ofVMNDXaK7bUZ/ZWQWQxaWwFz8
	FTsQmEdyF7fzBy13KYkrzSLZmH9pD0WuE4GVXATZD7182dpttE9Fqk1Xch5MRts+R8k1GUGmXrfMp
	lpCamMtm7P5nOI7kb+66mreqjRLPjRd+wVH06mm7vCCuP7yIhvZqM5RnEKaYfiUscfgmvtsnucFpq
	NkW5Rx53ClNCEaGalSd8o0p406g8Te7CElCCFoPqJXQB+5uyU45eE//mxzXjVQL9vdvDcJkILwl4X
	FNK4KEVLoIS5KyUacPf+Hv6HrqJGJk37hYbnL1hIMEUE7VUuKggbchoOhyH1wNz6O9f6MCaUQSSeL
	+hndKeAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCNMW-0000000D9VJ-1bjR;
	Tue, 06 May 2025 18:49:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCJjP-0000000CPaW-0hLd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 14:57:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 30C2F5C576D;
	Tue,  6 May 2025 14:54:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38291C4CEEB;
	Tue,  6 May 2025 14:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746543434;
	bh=bsqqyAJp0U5RCLC80okyrbHXY7J3utSy8jIiesJ61g0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cE3HsRGC4nh0bceeQdOwkwZd8W4wyHk3N9w5Dah5upNlqcLgosi6i8fziGSQZMdTQ
	 raCz2h6oJF7cZGNQ61yJodIzYroWKwl4MV+zW2si+bxLydMW0rtJmmuaGTxskX6Fyn
	 ZtIkKWTHKJO8ppUfr1tO/W2fSHyjMbPBNvK0lb2u754FHp+X6jxntLSP356MMl7n9w
	 yeNiePFQblHK4Y0HP1lSQUxf6uPeYTo0iGC2zP8pmokhlduq50nc/0sNKY52WuVh6E
	 49JnAh1SE3WLjQ9l0Y3Z+mQ1MiHvXvStNByIi+OCYcJ/Ybe/WmSu0aqpRaxWVDRes5
	 /0t10m58yyzUw==
Date: Tue, 6 May 2025 15:57:05 +0100
From: Will Deacon <will@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: =?utf-8?Q?Miko=C5=82aj?= Lenczewski <miko.lenczewski@arm.com>,
	ryan.roberts@arm.com, suzuki.poulose@arm.com,
	yang@os.amperecomputing.com, corbet@lwn.net,
	catalin.marinas@arm.com, jean-philippe@linaro.org,
	robin.murphy@arm.com, joro@8bytes.org, akpm@linux-foundation.org,
	paulmck@kernel.org, mark.rutland@arm.com, joey.gouly@arm.com,
	james.morse@arm.com, broonie@kernel.org, oliver.upton@linux.dev,
	baohua@kernel.org, david@redhat.com, ioworker0@gmail.com,
	jgg@ziepe.ca, nicolinc@nvidia.com, mshavit@google.com,
	jsnitsel@redhat.com, smostafa@google.com, kevin.tian@intel.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev
Subject: Re: [RESEND PATCH v6 1/3] arm64: Add BBM Level 2 cpu feature
Message-ID: <20250506145705.GB1246@willie-the-truck>
References: <20250428153514.55772-2-miko.lenczewski@arm.com>
 <20250428153514.55772-4-miko.lenczewski@arm.com>
 <20250506142508.GB1197@willie-the-truck>
 <86cyclhjw0.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <86cyclhjw0.wl-maz@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_075715_287738_B4A9FC3B 
X-CRM114-Status: GOOD (  27.71  )
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

On Tue, May 06, 2025 at 03:51:59PM +0100, Marc Zyngier wrote:
> On Tue, 06 May 2025 15:25:09 +0100,
> Will Deacon <will@kernel.org> wrote:
> > 
> > On Mon, Apr 28, 2025 at 03:35:14PM +0000, Mikołaj Lenczewski wrote:
> > > The Break-Before-Make cpu feature supports multiple levels (levels 0-2),
> > > and this commit adds a dedicated BBML2 cpufeature to test against
> > > support for, as well as a kernel commandline parameter to optionally
> > > disable BBML2 altogether.
> > > 
> > > This is a system feature as we might have a big.LITTLE architecture
> > > where some cores support BBML2 and some don't, but we want all cores to
> > > be available and BBM to default to level 0 (as opposed to having cores
> > > without BBML2 not coming online).
> > > 
> > > To support BBML2 in as wide a range of contexts as we can, we want not
> > > only the architectural guarantees that BBML2 makes, but additionally
> > > want BBML2 to not create TLB conflict aborts. Not causing aborts avoids
> > > us having to prove that no recursive faults can be induced in any path
> > > that uses BBML2, allowing its use for arbitrary kernel mappings.
> > > Support detection of such CPUs.
> > > 
> > > Signed-off-by: Mikołaj Lenczewski <miko.lenczewski@arm.com>
> > > Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> > > Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
> > > ---
> > >  .../admin-guide/kernel-parameters.txt         |  3 +
> > >  arch/arm64/Kconfig                            | 19 +++++
> > >  arch/arm64/include/asm/cpucaps.h              |  2 +
> > >  arch/arm64/include/asm/cpufeature.h           |  5 ++
> > >  arch/arm64/kernel/cpufeature.c                | 71 +++++++++++++++++++
> > >  arch/arm64/kernel/pi/idreg-override.c         |  2 +
> > >  arch/arm64/tools/cpucaps                      |  1 +
> > >  7 files changed, 103 insertions(+)
> > > 
> > > diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> > > index d9fd26b95b34..2749c67a4f07 100644
> > > --- a/Documentation/admin-guide/kernel-parameters.txt
> > > +++ b/Documentation/admin-guide/kernel-parameters.txt
> > > @@ -449,6 +449,9 @@
> > >  	arm64.no32bit_el0 [ARM64] Unconditionally disable the execution of
> > >  			32 bit applications.
> > >  
> > > +	arm64.nobbml2	[ARM64] Unconditionally disable Break-Before-Make Level
> > > +			2 support
> > 
> > Hmm, I'm not sure we really want this. It opens up the door for folks to
> > pass 'id_aa64mmfr2.bbm=2' without updating the allow-list which feels
> > like it's going to make crashes harder to reason about.
> 
> Passing id_aa64mmfr2.bbm=2 shouldn't have any effect if the HW doesn't
> advertise it already, as you can only downgrade features. Trying to
> upgrade features should leave a nastygram in the kernel log.

Ah, thanks, I was playing around in QEMU and my CPU already had BBML2
so I didn't spot that. In any case, I'd prefer to avoid adding the
option unless we need it -- this thing is driven from an MIDR-based
list and that should be maintained.

Will

