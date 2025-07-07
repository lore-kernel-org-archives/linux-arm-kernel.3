Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C031C71130
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 18:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=92BuUE9Fst0NZuMj9uZhKQNXqERDflykzNyp8w8CTLk=; b=HVMJJFQjx2u/PYNKsifXojfbPd
	fxL/opBXpiJHhhujJqTP2Xe65nPss6uE3174XYXuex/F4VucWjIxzlGWxc1JGKeen+IiHjPrvffoW
	mvqptDRxOs87tbMdYi42IeGFvEkYlVimE9o4taBXO4yMKNVQoKN6e0jNyt4his2gOhP8p4Xqus/ZN
	isU9BF1XE+6FyQoPfCah+zZpNgPgtnifq9o7nITVS/ZSH+zsgrDzZbRYX+3JW/dCOv4OFmPQCOjJc
	okLghGLxXgvyKIYyvywsX29m0ydo7SV5vwSt7F2Rq46pnhn0h0CWmNEtiwsmUlhbReOQX4zUm4e8g
	UI5oEgSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYqEv-00000003FYy-2Vz7;
	Mon, 07 Jul 2025 18:06:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYp9g-000000035yx-1RYG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 16:57:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0D9BB168F;
	Mon,  7 Jul 2025 09:57:11 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C4EDF3F66E;
	Mon,  7 Jul 2025 09:57:19 -0700 (PDT)
Date: Mon, 7 Jul 2025 17:57:14 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Colton Lewis <coltonlewis@google.com>
Cc: kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Mingwei Zhang <mizhang@google.com>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>, Shuah Khan <shuah@kernel.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v3 06/22] perf: arm_pmuv3: Introduce method to partition
 the PMU
Message-ID: <aGv8arq8NgaRCu7h@J2N7QTR9R3>
References: <20250626200459.1153955-1-coltonlewis@google.com>
 <20250626200459.1153955-7-coltonlewis@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626200459.1153955-7-coltonlewis@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_095724_423578_DF1ADF24 
X-CRM114-Status: GOOD (  22.32  )
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

On Thu, Jun 26, 2025 at 08:04:42PM +0000, Colton Lewis wrote:
> For PMUv3, the register field MDCR_EL2.HPMN partitiones the PMU
> counters into two ranges where counters 0..HPMN-1 are accessible by
> EL1 and, if allowed, EL0 while counters HPMN..N are only accessible by
> EL2.
> 
> Create module parameter reserved_host_counters to reserve a number of
> counters for the host. This number is set at boot because the perf
> subsystem assumes the number of counters will not change after the PMU
> is probed.
> 
> Introduce the function armv8pmu_partition() to modify the PMU driver's
> cntr_mask of available counters to exclude the counters being reserved
> for the guest and record reserved_guest_counters as the maximum
> allowable value for HPMN.
> 
> Due to the difficulty this feature would create for the driver running
> at EL1 on the host, partitioning is only allowed in VHE mode. Working
> on nVHE mode would require a hypercall for every counter access in the
> driver because the counters reserved for the host by HPMN are only
> accessible to EL2.

It would be good if we could elaborate on this last point. When exactly
do we intend to configure HPMN (e.g. is that static, dynamic at
load/put, or dynamic at finer granularity)?

I ask becuase it's not immediately clear to me how this would break nVHE
without also breaking direct userspace access on VHE, unless we flip
HPMN dynamically at load/put, and this is only broken in some transient
windows on nVHE.

> 
> Signed-off-by: Colton Lewis <coltonlewis@google.com>
> ---
>  arch/arm/include/asm/arm_pmuv3.h   | 14 ++++++
>  arch/arm64/include/asm/arm_pmuv3.h |  5 ++
>  arch/arm64/include/asm/kvm_pmu.h   |  6 +++
>  arch/arm64/kvm/Makefile            |  2 +-
>  arch/arm64/kvm/pmu-part.c          | 23 ++++++++++

Maybe I'll contradict Oliver and Marc here (and whatever they say
rules), but IMO it'd be nice to spell out "partition" rather than "part"
here for clarity.

Mark.

