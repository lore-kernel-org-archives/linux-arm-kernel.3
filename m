Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFEC0C88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 10:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c4Ufd9KRxptOwdsbJr5pMubhYaLXIT7/jFI8ghlsobw=; b=yeSjZx20MbdxtRY2Coe14VEulI
	/gmvpfihumdl+mqLa7OaPzInTbfDtR8G0TQL0vMFeHDIWeXohioy4cnoRw63rjGlNSYwBJx0t+CPm
	z/Vw/LGjRJAklQWFgJiGY7iOL9c9MYw5dloVPgu7CzY1EyrJ2n5Qw1I2zx92IqibRCz0xSQ+mC0PK
	595NhcYmrRurmrOFjlFgXKJoM6ZiXi3mqO/7tcPKRxZEACpl/CQPibJmDaT+v4tt2Nh+tt/KZKJvh
	wfzH+LBm+tEjWQp4PiZB1yN8CGGeMEKYy8Pg4k2uOTHOQd0TlmXPl1k46ZVhYO4+tGWnEIfZQ52bD
	bo/KC/zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6mZG-00000008w85-3rdw;
	Wed, 16 Sep 2026 10:08:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6mZE-00000008w7Y-0UVR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 10:08:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 55C3E152B;
	Wed, 16 Sep 2026 03:08:35 -0700 (PDT)
Received: from thinkpad-e142931.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8CB703F882;
	Wed, 16 Sep 2026 03:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789553318; bh=rPfrOTQ5oZS8SrKWqKFay5mhp8ATUr37rXa+UxcnFjs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D7hym+DtzqOo1Lr7h7LCEXYfKJE1jeuk5emATCzKr2bqhDmADUufXJ+d6DdYLD6ZX
	 kP7jHOHxQ8ipABjdpHZ93BmcpJwE/+ampQmPsJu8PSzl8XA8IaA6PZA2he2ngzb25A
	 e7yzrgQfJO8DmzYwcaWMcV0nLb+BL+bfIv4eHDeA=
Date: Wed, 16 Sep 2026 11:08:28 +0100
From: Wei-Lin Chang <weilin.chang@arm.com>
To: Marc Zyngier <maz@kernel.org>, 
	Itaru Kitayama <itaru.kitayama@fujitsu.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Oliver Upton <oupton@kernel.org>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Wang Han <wanghan@linux.alibaba.com>, Shuai Xue <xueshuai@linux.alibaba.com>, 
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Subject: Re: [PATCH v6 0/7] KVM: arm64: nv: Implement nested stage-2 reverse
 map
Message-ID: <pstlgffmaummwvxp6ldpel2y7ozubq77eqgrr7px2czc3f4qzn@nvmeyljx2anj>
References: <20260915154305.3852871-1-weilin.chang@arm.com>
 <aqoh27cSs5gMHeAL@sm-arm-grace07>
 <86mrth65ii.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86mrth65ii.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_030840_201417_0C9F3B60 
X-CRM114-Status: GOOD (  24.77  )
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

On Wed, Sep 16, 2026 at 08:04:53AM +0100, Marc Zyngier wrote:
> On Wed, 16 Sep 2026 05:58:03 +0100,
> Itaru Kitayama <itaru.kitayama@fujitsu.com> wrote:
> > 
> > Hi Wei-Lin,
> > 
> > On Tue, Sep 15, 2026 at 04:42:58PM +0100, Wei-Lin Chang wrote:
> > > Hi,
> > > 
> > > This is v6 of optimizing the shadow s2 mmu unmapping during MMU
> > > notifiers.
> > > 
> > > This version fixes a few issues, and adds Marc's space optimization
> > > for kvm_guest_s2_mapping [1]. Please see the changelog for the details.
> > > 
> > > Tested by booting L3, and running in-kernel targetted tests described
> > > in [2]. v5 got some tested-by's from Itaru and Wang (thanks), I didn't
> > > carry them over since some bugs fixed in v6 are non-obvious. Some
> > > retest would be much appreciated!
> > > 
> > > Series based on v7.3-rc3 + Marc's nested mmu lifecycle fixes [3].
> > 
> > Observed on QEMU (accel tcg) only, but I saw:
> > 
> > [ 1812.052752] BUG: sleeping function called from invalid context at kernel/locking/rwsem.c:1630
> > [ 1812.052896] in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 596, name: shadow_stage2
> > 
> > The kernel is built on top of Marc's fix and your version six series, but
> > the fix for debugfs will be posted later?
> > 
> > Your hello_nested and shadow_stage2 ran without an issue.
> > 
> > Tested-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>
> 
> So you have established that there is a critical locking bug, make
> sure you don't communicate any information to help narrow where that
> bug is, and yet give your Tested-by: tag?
> 
> What is the point? I'm baffled.
> 
> Can you at least provide an indication of what you did to get there as
> well as the full backtrace?

It is certainly the known shadow ptdump sleeping-in-atomic problem [1]
reported by Itaru, and not a problem of the reverse map series.

I have the fix for that, will send it shortly.

Thanks,
Wei-Lin Chang

[1]: https://lore.kernel.org/kvmarm/aiuF0KSvvv-ZozI1@sm-arm-grace07/

> 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.

