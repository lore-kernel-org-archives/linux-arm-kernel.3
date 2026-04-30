Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5067FF8873
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 14:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Subject:Cc:To:From:Message-ID:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=31PKwtT++y/9ilnStolieBqGAktcrpG8SbulnS6t+Es=; b=G5Me8NbTjDHiK9WFr/RypAapus
	vuQ6KdIwDpWuU1ux+uRTrrqF2cXnZytcsXmz0Kj9CIWV0n7Qnm+NWW0gYMLY3RXxDT0PCFfPj6W5F
	kO1DXT6rbc6ALkdyeKFLDO9SOTFBETKgEzQ6X7Fnrv0x6CTNnRvAOuP4Dap+ITxxa9gDgBdlOzd/6
	Ycy3dzQ6L52s+3fgx8vRUZQ5WwzEUu18daywAU7OvqtgvSjXi8yjTt7WpEDskh9mwNpal5Y4G8ASz
	J+YWECD0PcMNPead6Jf2sDbZGkoTjFnKDQcJY7mRtJWh2rU53CB3NPMhxtRIuQTryY1QG7mfGLx7U
	/YO8qxnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wISjg-00000005bG0-021A;
	Thu, 30 Apr 2026 14:51:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wISjc-00000005bFs-3YYo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 14:51:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D9FA460583;
	Thu, 30 Apr 2026 14:51:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B9C2C2BCB3;
	Thu, 30 Apr 2026 14:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777560683;
	bh=F04flt0u0jeUiSYW5q5UKAs4vTOREkSTch+Sz1CLuk0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=N06B4eCqsyK+pw6ROnfRJmBqvv47hgUyYU3hv0SxLfsuzCH4fxYZ1wmQDZ2ruXsdR
	 oIR/l0FOsZGg2ty2hV1U1a/W9uHxkOvVDSUqRjzq0hnYQpZtGBgqwztoqou2pEC9MS
	 y5WH0yO2QeyMqV05hlQNRaVYjji8gjkBXXSYtvI6/aIDb3Gyg7ozE8KP4Ly47lET7a
	 dlqPSNSIsPgTtBYzFCCq/5iK9YQiENFB6sL+kThbsctiHB4bwmsN1cnJ/7Mq0kyXJC
	 osnc32UOYzmWEvlvu7atHCyDaLBNpJ0PAvkNumGB/wBlm8sC5HRdQPqYZZ6oJpGvDu
	 TCkuI5i9o4vsw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=goblin-girl.misterjones.org)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wISjY-0000000GIer-3eg7;
	Thu, 30 Apr 2026 14:51:20 +0000
Date: Thu, 30 Apr 2026 15:51:20 +0100
Message-ID: <86a4ukzel3.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Leonardo Bras <leo.bras@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,	Will Deacon
 <will@kernel.org>,	Oliver Upton <oupton@kernel.org>,	Joey Gouly
 <joey.gouly@arm.com>,	Suzuki K Poulose <suzuki.poulose@arm.com>,	Zenghui Yu
 <yuzenghui@huawei.com>,	"Rafael J. Wysocki" <rafael@kernel.org>,	Len Brown
 <lenb@kernel.org>,	Saket Dumbre <saket.dumbre@intel.com>,	Paolo Bonzini
 <pbonzini@redhat.com>,	Chengwen Feng <fengchengwen@huawei.com>,	Jonathan
 Cameron <jic23@kernel.org>,	Kees Cook <kees@kernel.org>,	=?UTF-8?B?TWlr?=
 =?UTF-8?B?b8WCYWo=?= Lenczewski <miko.lenczewski@arm.com>,	Ryan Roberts
 <ryan.roberts@arm.com>,	Yang Shi <yang@os.amperecomputing.com>,	Thomas Huth
 <thuth@redhat.com>,	mrigendrachaubey <mrigendra.chaubey@gmail.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,	Mark Brown <broonie@kernel.org>,	Kevin
 Brodsky <kevin.brodsky@arm.com>,	James Clark <james.clark@linaro.org>,	Ard
 Biesheuvel <ardb@kernel.org>,	Fuad Tabba <tabba@google.com>,	Raghavendra
 Rao Ananta <rananta@google.com>,	Nathan Chancellor <nathan@kernel.org>,
	Vincent Donnefort <vdonnefort@google.com>,	Lorenzo Pieralisi
 <lpieralisi@kernel.org>,	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,	Tian Zheng
 <zhengtian10@huawei.com>,	Wei-Lin Chang <weilin.chang@arm.com>,
	linux-kernel@vger.kernel.org,	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,	linux-acpi@vger.kernel.org,
	acpica-devel@lists.linux.dev,	kvm@vger.kernel.org
Subject: Re: [PATCH v1 00/12] KVM Dirty-bit cleaning accelerator (HACDBS)
In-Reply-To: <afNZQKIiKmHPD5My@devkitleo>
References: <20260430111424.3479613-2-leo.bras@arm.com>
	<86bjf0zj2p.wl-maz@kernel.org>
	<afNZQKIiKmHPD5My@devkitleo>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/30.1
 (aarch64-unknown-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: leo.bras@arm.com, catalin.marinas@arm.com, will@kernel.org, oupton@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, rafael@kernel.org, lenb@kernel.org, saket.dumbre@intel.com, pbonzini@redhat.com, fengchengwen@huawei.com, jic23@kernel.org, kees@kernel.org, miko.lenczewski@arm.com, ryan.roberts@arm.com, yang@os.amperecomputing.com, thuth@redhat.com, mrigendra.chaubey@gmail.com, yeoreum.yun@arm.com, broonie@kernel.org, kevin.brodsky@arm.com, james.clark@linaro.org, ardb@kernel.org, tabba@google.com, rananta@google.com, nathan@kernel.org, vdonnefort@google.com, lpieralisi@kernel.org, Sascha.Bischoff@arm.com, anshuman.khandual@arm.com, zhengtian10@huawei.com, weilin.chang@arm.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev, kvm@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

On Thu, 30 Apr 2026 14:29:37 +0100,
Leonardo Bras <leo.bras@arm.com> wrote:
> 
> On Thu, Apr 30, 2026 at 02:14:22PM +0100, Marc Zyngier wrote:
> > On Thu, 30 Apr 2026 12:14:04 +0100,
> > Leonardo Bras <leo.bras@arm.com> wrote:
> > 
> > > d - In __kvm_arch_dirty_log_clear() there is no way to predict how long
> > >     should be the buffer, so I used 1x PAGE_SIZE, and when it gets full
> > >     it's cleaned and reused. Should I let users configure that over a
> > >     parameter, or is it overthinking?
> > 
> > How long is a piece of string? We can't know that. A single page feels
> > very small in the 4kB case, and letting userspace define the size of
> > that buffer seems a likely requirement.
> > 
> 
> Ok, as a KVM parameter, or as a compile-time option?

Noticed the "userspace" word in there? It *has* to be controlled by
userspace one way or another. So not as a kernel parameter, and
*never* as a compile option.

> > > Kernel v7.0.0 + this patchset builds properly, passing both kvm selftests
> > > for dirty-bit tracking[2], on HW HACDBS enabled or disabled.
> > 
> > I have absolutely no trust in these tests.
> > 
> > Have you enabled a VMM to make use of these APIs, and actively
> > migrated running guests? That's the level of testing I'd like to see,
> > as the selftests are not what people run in production...
> > 
> 
> There is no enablement needed on VMM side.
> Yes, I have created a VM on upstream qemu with --enable-kvm and migrated it 
> on the same host. (Inside a model)
> 
> That was the first test I used, but then I found out that kvm selftests 
> stress up multiple scenarios in an easier way.

Except when they don't. In my experience, the selftests are only there
to give the CI people the fuzzy feeling that they are doing something
useful. I have a collection of examples indicating that what these
things test is not representative of the bugs we have in KVM.

> Do you prefer me to test on any specific scenario, or does whatever qemu
> uses as a default parameter work well enough?

I want to hear about testing at a scale that make sense for production
VMs, including live migrating between hosts while under memory
pressure (swapping out).

I'm also interested in efficiency: how much better is HACDBS compared
to the current page faulting? Just having patches for a feature is not
enough to decide adoption of that feature. Show me the benefits in a
quantitative way (within the limits of the model, of course).

Thanks,

	M.

-- 
Without deviation from the norm, progress is not possible.

