Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E2C3C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 13:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NDiXh8oxBb6uFOpEtruWNrSWsdouLS9fxXDMWhczUfI=; b=ZM5zsvpwcujHiKIbIyoX146Jv0
	OdujobRpdk+HD77tGlV1zMd2KaDxUErWMwodMmCXdMtiIU4oktE+mz5OriynUYsoSunfTmus1a9xy
	gLGJgy+/aXLnVnVt1TMsow02iF8laPrj2nGx/EZ5d6L8UtL29J27zqWwGYq7JDnWfmC4N14xKEa04
	zL1DwG8Dpdu3u4iUG/E+tsRyvYYPnC3nsH/jQ0+F90GNSALRqejzmMGApzlU40HvkX7zHDRQ++XcI
	bcR5OCN4/pgt9AinHVrgn4YSbxYntfSgRdcS9WU+0CGDkpNY/IyayfRNDZg9o0b0VqUnWOjfrIQod
	u3HF00tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Spc-00000006eMr-2S0m;
	Tue, 15 Sep 2026 13:04:16 +0000
Received: from canpmsgout11.his.huawei.com ([113.46.200.226])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6SpZ-00000006eLB-2KLY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 13:04:15 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=NDiXh8oxBb6uFOpEtruWNrSWsdouLS9fxXDMWhczUfI=;
	b=2L0jvUuVjRs5du+YZSCTFaVIJ9zyoohOkG1qL+ZsDSeeVhrJDVnvXSdgp68S7F07JT1tARF8l
	AvgP613TKVS9mUkfuF5le1xLhunjh6eJtRQUblg47P2gPj321pUiKo+NMnpUl3ekOA3XlDbGcmx
	uh4Cpdud+BNq6FjRbYJiFqk=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4hkhl04cm2zKm5t;
	Tue, 15 Sep 2026 20:53:00 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 6F5204048B;
	Tue, 15 Sep 2026 21:04:02 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemk200008.china.huawei.com (7.202.194.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 15 Sep 2026 21:03:59 +0800
Message-ID: <5cdfdfb6-c46e-4260-a89b-ac02528d46d7@huawei.com>
Date: Tue, 15 Sep 2026 21:03:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v18 00/14] arm64: entry: Convert to Generic Entry
To: <catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<oleg@redhat.com>, <kees@kernel.org>, <luto@amacapital.net>,
	<wad@chromium.org>, <peterz@infradead.org>, <ada.coupriediaz@arm.com>,
	<linusw@kernel.org>, <kevin.brodsky@arm.com>, <yeoreum.yun@arm.com>,
	<thuth@redhat.com>, <james.morse@arm.com>, <vladimir.murzin@arm.com>,
	<broonie@kernel.org>, <pengcan@kylinos.cn>, <liqiang01@kylinos.cn>,
	<ryan.roberts@arm.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20260902095537.602517-1-ruanjinjie@huawei.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260902095537.602517-1-ruanjinjie@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_060414_259798_1E3FA4FB 
X-CRM114-Status: GOOD (  15.70  )
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



在 2026/9/2 17:55, Jinjie Ruan 写道:
> This series converts arm64 to the generic entry infrastructure.
> 
> Currently, architectures such as x86, RISC-V, LoongArch, Powerprc
> and S390 use generic entry, which significantly reduces maintenance
> burden and improves code elegance. arm64 already adopted generic IRQ
> entry in commit b3cf07851b6c ("arm64: entry: Switch to generic IRQ entry"),
> making it the right time to complete the conversion.
> 
> This work brings arm64 in line with other major architectures,
> reducing duplicated code and enabling future improvements like
> Syscall User Dispatch and rseq time slice extension optimizations.
> 
> The series is rebased on v7.3-rc1 and has been tested on Kunpeng HIP09
> with stress-ng, hackbench, kselftests (ptrace, breakpoints, arm64/abi,
> arm64/fp, vDSO), ptrace stress test, and Pseudo-NMI load test.
> 
> Changes in v18:
> - Rebased on v7.3-rc1.
> - Drop the SUD patch as Mark suggeted.
> - Update the commit message.
> - Add Reviewed-by.
> - Link to v17: https://lore.kernel.org/all/20260721081858.1169276-1-ruanjinjie@huawei.com/

Hi Mark,

Thanks for your continuous and detailed guidance through the previous
iterations of this series.

Please let me know if there are any further review comments or code
modifications required from my side, or if this looks good to be queued
for the upcoming 7.4 cycle?

Thanks,
Jinjie

> 
> For changes in v7 to v16, please refer to the individual patch threads:
> - v16: https://lore.kernel.org/all/20260629130616.642022-1-ruanjinjie@huawei.com/
> - v15: https://lore.kernel.org/all/20260511092103.1974980-1-ruanjinjie@huawei.com/
> - v14: https://lore.kernel.org/all/20260320102620.1336796-1-ruanjinjie@huawei.com/
> - v13: https://lore.kernel.org/all/20260317082020.737779-1-ruanjinjie@huawei.com/
> - v12: https://lore.kernel.org/all/20260203133728.848283-1-ruanjinjie@huawei.com/
> - v11: https://lore.kernel.org/all/20260128031934.3906955-1-ruanjinjie@huawei.com/
> - v10: https://lore.kernel.org/all/20251222114737.1334364-1-ruanjinjie@huawei.com/
> - v9: https://lore.kernel.org/all/20251204082123.2792067-1-ruanjinjie@huawei.com/
> - v8: https://lore.kernel.org/all/20251126071446.3234218-1-ruanjinjie@huawei.com/
> - v7: https://lore.kernel.org/all/20251117133048.53182-1-ruanjinjie@huawei.com/
> 
> Jinjie Ruan (14):
>   arm64: ptrace: Fix redundant syscall exit stop for
>     PTRACE_SYSEMU_SINGLESTEP
>   arm64: ptrace: Rework audit_syscall_entry()
>   arm64: ptrace: Open-code seccomp check in syscall_trace_enter()
>   arm64: ptrace: Rename and clean up syscall_trace_enter()
>   arm64: ptrace: Protect rseq_syscall() from tracer PC modifications
>   arm64: syscall: Rework the syscall exit path in el0_svc_common()
>   arm64: ptrace: Pass thread flags to trace enter/exit
>   arm64: ptrace: Extract arm64_syscall_exit_to_user_mode_work() helper
>   arm64: ptrace: Align syscall exit work semantics with generic entry
>   arm64: syscall: Use exit-specific flags check in el0_svc_common()
>   arm64: syscall: Simplify el0_svc_common() syscall exit path
>   arm64: ptrace: Make return type of arm64_syscall_trace_enter() bool
>   arm64: entry: Convert to generic entry
>   arm64: Inline el0_svc_common()
> 
>  arch/arm64/Kconfig                    |   2 +-
>  arch/arm64/include/asm/entry-common.h |  77 +++++++++++++++++
>  arch/arm64/include/asm/syscall.h      |   5 +-
>  arch/arm64/include/asm/thread_info.h  |  16 +---
>  arch/arm64/kernel/debug-monitors.c    |   8 ++
>  arch/arm64/kernel/entry-common.c      |   2 +-
>  arch/arm64/kernel/ptrace.c            | 115 --------------------------
>  arch/arm64/kernel/signal.c            |   2 +-
>  arch/arm64/kernel/syscall.c           |  34 +++-----
>  9 files changed, 102 insertions(+), 159 deletions(-)
> 


