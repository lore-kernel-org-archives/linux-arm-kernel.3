Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFD59C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 18:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aau7YqWsEeb911OjZYniYaHSJbV5fCN7mLCTSFNG6T4=; b=kLPp4dnkmUjeRuSdgPBhjfeV7O
	Orwlce1A12FJMPasNx2X7Mq6yQ2+qqxtfMTmWb5DUqHGpzGOZG1MYWVhJQS5aXry+dHsHRG8LsdZ6
	2TCtM8E91PDe7TBhBmVNZRczCYbTZMkzBvAM/xsTpfa/FBJTI4A1sjryAk31aesQD39ssX+WB2s3o
	IzUQFJqdKDq5X4HWrotgoH4mGUoqaDYK5TrxnQmhN3w65OKNOowtsy3aBTm4pKud7rJlCcb7Q+gPa
	p+cNBIgxvhKJOavjQZAOpcdo/SJRBw/wnCH8JiHAFk7+J9I8MDPGuv4c5Ki7puxGg78Ow8aPvvaq4
	muuIBI3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCNCr-0000000D8R4-03lU;
	Tue, 06 May 2025 18:39:53 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCJZj-0000000CNVz-1kGi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 14:47:17 +0000
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4ZsLnp0cdTz6K5kv;
	Tue,  6 May 2025 22:46:54 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 0994E14011D;
	Tue,  6 May 2025 22:47:05 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 6 May
 2025 16:47:04 +0200
Date: Tue, 6 May 2025 15:47:02 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
CC: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>, Jonathan Corbet <corbet@lwn.net>,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, Joey
 Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>, James Clark <james.clark@linaro.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>, Leo Yan <leo.yan@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-perf-users@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<kvmarm@lists.linux.dev>, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v21 0/4] arm64/perf: Enable branch stack sampling
Message-ID: <20250506154702.00002b57@huawei.com>
In-Reply-To: <20250407-arm-brbe-v19-v21-0-ff187ff6c928@kernel.org>
References: <20250407-arm-brbe-v19-v21-0-ff187ff6c928@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500012.china.huawei.com (7.191.174.4) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_074715_727564_2182D566 
X-CRM114-Status: GOOD (  25.65  )
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

On Mon, 07 Apr 2025 12:41:29 -0500
"Rob Herring (Arm)" <robh@kernel.org> wrote:

> This series enables perf branch stack sampling support on arm64 via a 
> v9.2 arch feature called Branch Record Buffer Extension (BRBE). Details 
> on BRBE can be found in the Arm ARM[1] chapter D18.
> 
> I've picked up this series from Anshuman. v19 and v20 versions have been 
> reworked quite a bit by Mark and myself. The bulk of those changes are 
> in patch 4.
> 
> A git branch is here[2].
> 
> [1] https://developer.arm.com/documentation/ddi0487/latest/
> [2] git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git arm/brbe-v21

Hi Rob,

Expecting any changes on this?  Anything specific we can do to help then shout.

We need to pull in the reworked version into openeuler that is carrying older
code and would rather not do it more than once. 

Jonathan

> 
> v21:
> - Drop clean-up patches 1-7 already applied
> - Rebase on v6.15-rc1
> 
> v20:
>  - https://lore.kernel.org/r/20250218-arm-brbe-v19-v20-0-4e9922fc2e8e@kernel.org
>  - Added back some of the arm64 specific exception types. The x86 IRQ 
>    branches also include other exceptions like page faults. On arm64, we 
>    can distinguish the exception types, so we do. Also, to better 
>    align with x86, we convert 'call' branches which are user to kernel 
>    to 'syscall'.
>  - Only enable exceptions and exception returns if recording kernel
>    branches (matching x86)
>  - Drop requiring event and branch privileges to match
>  - Add "branches" caps sysfs attribute like x86
>  - Reword comment about FZP and MDCR_EL2.HPMN interaction
>  - Rework BRBE invalidation to avoid invalidating in interrupt handler
>    when no handled events capture the branch stack (i.e. when there are 
>    multiple users).
>  - Also clear BRBCR_ELx bits in brbe_disable(). This is for KVM nVHE 
>    checks if BRBE is enabled.
>  - Document that MDCR_EL3.SBRBE can be 0b01 also
> 
> v19:
>  - https://lore.kernel.org/all/20250202-arm-brbe-v19-v19-0-1c1300802385@kernel.org/
>  - Drop saving of branch records when task scheduled out (Mark). Make 
>    sched_task() callback actually get called. Enabling requires a call 
>    to perf_sched_cb_inc(). So the saving of branch records never 
>    happened.
>  - Got rid of added armpmu ops. All BRBE support is contained within 
>    pmuv3 code.
>  - Fix freeze on overflow for VHE
>  - The cycle counter doesn't freeze BRBE on overflow, so avoid assigning
>    it when BRBE is enabled.
>  - Drop all the Arm specific exception branches. Not a clear need for
>    them.
>  - Fix handling of branch 'cycles' reading. CC field is
>    mantissa/exponent, not an integer.
>  - Rework s/w filtering to better match h/w filtering
>  - Reject events with disjoint event filter and branch filter or with 
>    exclude_host set
>  - Dropped perf test patch which has been applied for 6.14
>  - Dropped patch "KVM: arm64: Explicitly handle BRBE traps as UNDEFINED"
>    which has been applied for 6.14
> 
> v18:
>  - https://lore.kernel.org/all/20240613061731.3109448-1-anshuman.khandual@arm.com/
> 
> For v1-v17, see the above link. Not going to duplicate it all here...
> 
> Signed-off-by: "Rob Herring (Arm)" <robh@kernel.org>
> ---
> Anshuman Khandual (4):
>       arm64/sysreg: Add BRBE registers and fields
>       arm64: Handle BRBE booting requirements
>       KVM: arm64: nvhe: Disable branch generation in nVHE guests
>       perf: arm_pmuv3: Add support for the Branch Record Buffer Extension (BRBE)
> 
>  Documentation/arch/arm64/booting.rst |  21 +
>  arch/arm64/include/asm/el2_setup.h   |  86 +++-
>  arch/arm64/include/asm/kvm_host.h    |   2 +
>  arch/arm64/include/asm/sysreg.h      |  17 +-
>  arch/arm64/kvm/debug.c               |   4 +
>  arch/arm64/kvm/hyp/nvhe/debug-sr.c   |  32 ++
>  arch/arm64/kvm/hyp/nvhe/switch.c     |   2 +-
>  arch/arm64/tools/sysreg              | 132 ++++++
>  drivers/perf/Kconfig                 |  11 +
>  drivers/perf/Makefile                |   1 +
>  drivers/perf/arm_brbe.c              | 802 +++++++++++++++++++++++++++++++++++
>  drivers/perf/arm_brbe.h              |  47 ++
>  drivers/perf/arm_pmu.c               |  15 +-
>  drivers/perf/arm_pmuv3.c             | 129 +++++-
>  include/linux/perf/arm_pmu.h         |   8 +
>  15 files changed, 1287 insertions(+), 22 deletions(-)
> ---
> base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
> change-id: 20250129-arm-brbe-v19-24d5d9e5e623
> 
> Best regards,


