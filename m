Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93BF0FF8873
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 13:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YuKxCgQE56OushmPFY2l3FfpElwNcEiVBY235DtF8z8=; b=dpNMtj68PzUEA4f9iqipVa4oDq
	7pZe1Wd37shuyGVWFf+Y8xcM0jrgPP0DE86mchnnnKVpeUWCG6QEYKb8Xc/3ssJYXFCTlg6hWuXB1
	bQqAIy/E6FGpnLIKbdBNsthgVyeTC/xw+iRl3TUa+xO25oIr+odZHB3/pfqxRbzEY1AIoDe68v2kP
	V8II/EQNbeitfiDXUdR+XryeegQqWUL2eAxekJ6ySL7jChE4APpM6aeFv4pPQXqfZtydvL1eeS5Ik
	gLq2Sdgoz3CinbhEwfpNsbb856eIUZu7YNVaikNejRLEOTlXAdYRL/jeWqmT4A0pBLhUqMZWHVIEG
	O0u2Ip6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIRSi-00000005XTC-1EZf;
	Thu, 30 Apr 2026 13:29:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIRSf-00000005XSG-3hJE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 13:29:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EBE341AED;
	Thu, 30 Apr 2026 06:29:42 -0700 (PDT)
Received: from devkitleo.cambridge.arm.com (devkitleo.cambridge.arm.com [10.1.196.90])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D026C3F7B4;
	Thu, 30 Apr 2026 06:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777555788; bh=/W1GRuxZq0cC6A7wpquemE4YB2GQRO11YgKNzJgpAzE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MIV0wfnWvMpN+DWDEs3DC7LO+ywU67ncAAqeBECPc/hmIVJgitsfq1OPtKUbFTwdg
	 nvOWGEn5C1XToufUlAVzncZQtaq2SSb2kSiSyexB5Rb+sxsNKCvPTOvEJa/YsvsNmT
	 E6Ci7q2Kk9ABl0De8i+eB010YSc/82PNfDsg8rYA=
From: Leonardo Bras <leo.bras@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Leonardo Bras <leo.bras@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Saket Dumbre <saket.dumbre@intel.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Chengwen Feng <fengchengwen@huawei.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Kees Cook <kees@kernel.org>,
	=?utf-8?Q?Miko=C5=82aj?= Lenczewski <miko.lenczewski@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Yang Shi <yang@os.amperecomputing.com>,
	Thomas Huth <thuth@redhat.com>,
	mrigendrachaubey <mrigendra.chaubey@gmail.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	James Clark <james.clark@linaro.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Vincent Donnefort <vdonnefort@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Tian Zheng <zhengtian10@huawei.com>,
	Wei-Lin Chang <weilin.chang@arm.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-acpi@vger.kernel.org,
	acpica-devel@lists.linux.dev,
	kvm@vger.kernel.org
Subject: Re: [PATCH v1 00/12] KVM Dirty-bit cleaning accelerator (HACDBS)
Date: Thu, 30 Apr 2026 14:29:37 +0100
Message-ID: <afNZQKIiKmHPD5My@devkitleo>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <86bjf0zj2p.wl-maz@kernel.org>
References: <20260430111424.3479613-2-leo.bras@arm.com> <86bjf0zj2p.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_062950_212978_0E87352F 
X-CRM114-Status: GOOD (  32.13  )
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

On Thu, Apr 30, 2026 at 02:14:22PM +0100, Marc Zyngier wrote:
> On Thu, 30 Apr 2026 12:14:04 +0100,
> Leonardo Bras <leo.bras@arm.com> wrote:
> 
> [...]
> 
> I haven't had a chance to look at any of this yet, but just on these
> points:
> 
> > b - checkpatch.pl keeps bothering me to add an entry in MAINTAINERS file,
> >     and I like the idea of maintaining this. Is there any rule or
> >     common sense on this? Should I add this entry, or should I leave it
> >     in the arch/arm64/kvm/ general rule?
> 
> No specific entry in MAINTAINERS required (or wanted). This falls into
> the normal KVM/arm64 maintenance. And don't worry, we know where to
> find you when it will come to fixing this stuff.
> 

Got it

> > c - There are some trace_prink() I have left in the code, as they could
> >     be helpful to check when HACDBS is not performing as well as it
> >     should. Should I introduce a tracepoint instead? or just ignore it?
> >     (it's triggered on HACDBS error, but as it falls back to software in
> >     that case, it should not impact correctness, only performance).
> 
> Debug infrastructure should be preferably *removed* altogether.
> trace_printk() is definitely a big no-no.
> 

Will remove it then

> > d - In __kvm_arch_dirty_log_clear() there is no way to predict how long
> >     should be the buffer, so I used 1x PAGE_SIZE, and when it gets full
> >     it's cleaned and reused. Should I let users configure that over a
> >     parameter, or is it overthinking?
> 
> How long is a piece of string? We can't know that. A single page feels
> very small in the 4kB case, and letting userspace define the size of
> that buffer seems a likely requirement.
> 

Ok, as a KVM parameter, or as a compile-time option?

> > 
> > Kernel v7.0.0 + this patchset builds properly, passing both kvm selftests
> > for dirty-bit tracking[2], on HW HACDBS enabled or disabled.
> 
> I have absolutely no trust in these tests.
> 
> Have you enabled a VMM to make use of these APIs, and actively
> migrated running guests? That's the level of testing I'd like to see,
> as the selftests are not what people run in production...
> 

There is no enablement needed on VMM side.
Yes, I have created a VM on upstream qemu with --enable-kvm and migrated it 
on the same host. (Inside a model)

That was the first test I used, but then I found out that kvm selftests 
stress up multiple scenarios in an easier way.

Do you prefer me to test on any specific scenario, or does whatever qemu 
uses as a default parameter work well enough?

Thanks!
Leo

