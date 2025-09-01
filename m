Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0C23CA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 08:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:CC:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rWDP44wRcTXZFVS2X2JY1p+lz+ZTJT1BUsM6r8D1shc=; b=Lf63niyGLT4h5kZiTRrJQwTq98
	8FiZnajOFD07VjvKbyzPceZAtw7OJ0d5Fm9A6+2tP11L04iAH9eu9c66kJSFSOz55C10ZzAz5X9E6
	fpkTDf7IXha4p5Ys03lf0UcbByBCJUf9CkmldSCNNQvYS506uEMLHIXEWB2MtcEZwUVDfPwzuNZ+O
	zf3TTu7Wxu7S7ukK8Egs3e8UOa9CoXx13OpAzaFpNcfilpCMTBTXO4VSFI96A684jm1AoYeKHNbMG
	NTTBPZDrH8EidFwf2YGbYY1Ey5NdRgw2jo4PGWmaqeWchj17z1tPirBR4ASzC7XwDNMis8kLVqmC3
	85AHZIKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut00D-0000000Bavh-3OZc;
	Mon, 01 Sep 2025 08:35:01 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uszaJ-0000000BXJ2-31M2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 08:08:17 +0000
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4cFhNT3Dsgz27hSv;
	Mon,  1 Sep 2025 16:09:13 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
	by mail.maildlp.com (Postfix) with ESMTPS id F05391400D2;
	Mon,  1 Sep 2025 16:08:05 +0800 (CST)
Received: from kwepemq200018.china.huawei.com (7.202.195.108) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 1 Sep 2025 16:08:05 +0800
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemq200018.china.huawei.com (7.202.195.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 1 Sep 2025 16:08:04 +0800
CC: <yangyicong@hisilicon.com>, <joey.gouly@arm.com>,
	<suzuki.poulose@arm.com>, <yuzenghui@huawei.com>, <shuah@kernel.org>,
	<jonathan.cameron@huawei.com>, <shameerkolothum@gmail.com>,
	<linuxarm@huawei.com>, <prime.zeng@hisilicon.com>, <xuwei5@huawei.com>,
	<tangchengchang@huawei.com>, <wangzhou1@hisilicon.com>
Subject: Re: [PATCH v5 0/7] Add support for FEAT_{LS64, LS64_V} and related
 tests
To: <catalin.marinas@arm.com>, <will@kernel.org>, <maz@kernel.org>,
	<oliver.upton@linux.dev>, <corbet@lwn.net>,
	<linux-arm-kernel@lists.infradead.org>, <kvmarm@lists.linux.dev>,
	<linux-kselftest@vger.kernel.org>, <linux-doc@vger.kernel.org>
References: <20250818064806.25417-1-yangyicong@huawei.com>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <480c7a31-fa0d-89b6-4fa0-90dba64a31b3@huawei.com>
Date: Mon, 1 Sep 2025 16:08:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20250818064806.25417-1-yangyicong@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemq200018.china.huawei.com (7.202.195.108)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_010816_076599_B1606774 
X-CRM114-Status: GOOD (  19.56  )
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

a gentle ping...

hi Marc and Oliver,

the discussion since v2 are mainly about the LS64 fault hanlding by kvm/hypervisor,
does this version a proper one to go ahead?

thanks.

On 2025/8/18 14:47, Yicong Yang wrote:
> From: Yicong Yang <yangyicong@hisilicon.com>
> 
> Armv8.7 introduces single-copy atomic 64-byte loads and stores
> instructions and its variants named under FEAT_{LS64, LS64_V}.
> Add support for Armv8.7 FEAT_{LS64, LS64_V}:
> - Add identifying and enabling in the cpufeature list
> - Expose the support of these features to userspace through HWCAP3
>   and cpuinfo
> - Add related hwcap test
> - Handle the trap of unsupported memory (normal/uncacheable) access in a VM
> 
> A real scenario for this feature is that the userspace driver can make use of
> this to implement direct WQE (workqueue entry) - a mechanism to fill WQE
> directly into the hardware.
> 
> Picked Marc's 2 patches form [1] for handling the LS64 trap in a VM on emulated
> MMIO and the introduce of KVM_EXIT_ARM_LDST64B.
> 
> [1] https://lore.kernel.org/linux-arm-kernel/20240815125959.2097734-1-maz@kernel.org/
> 
> Tested with updated hwcap test:
> [root@localhost tmp]# dmesg | grep "All CPU(s) started"
> [   14.789859] CPU: All CPU(s) started at EL2
> [root@localhost tmp]# ./hwcap
> # LS64 present
> ok 217 cpuinfo_match_LS64
> ok 218 sigill_LS64
> ok 219 # SKIP sigbus_LS64_V
> # LS64_V present
> ok 220 cpuinfo_match_LS64_V
> ok 221 sigill_LS64_V
> ok 222 # SKIP sigbus_LS64_V
> # 115 skipped test(s) detected. Consider enabling relevant config options to improve coverage.
> # Totals: pass:107 fail:0 xfail:0 xpass:0 skip:115 error:0
> 
> root@localhost:/mnt# dmesg | grep "All CPU(s) started"
> [    0.281152] CPU: All CPU(s) started at EL1
> root@localhost:/mnt# ./hwcap
> # LS64 present
> ok 217 cpuinfo_match_LS64
> ok 218 sigill_LS64
> ok 219 # SKIP sigbus_LS64
> # LS64_V present
> ok 220 cpuinfo_match_LS64_V
> ok 221 sigill_LS64_V
> ok 222 # SKIP sigbus_LS64_V
> # 115 skipped test(s) detected. Consider enabling relevant config options to improve coverage.
> # Totals: pass:107 fail:0 xfail:0 xpass:0 skip:115 error:0
> 
> Change since v4:
> - Rebase on v6.17-rc2 and fix the conflicts
> Link: https://lore.kernel.org/linux-arm-kernel/20250715081356.12442-1-yangyicong@huawei.com/
> 
> Change since v3:
> - Inject DABT fault for LS64 fault on unsupported memory but with valid memslot
> Link: https://lore.kernel.org/linux-arm-kernel/20250626080906.64230-1-yangyicong@huawei.com/
> 
> Change since v2:
> - Handle the LS64 fault to userspace and allow userspace to inject LS64 fault
> - Reorder the patches to make KVM handling prior to feature support
> Link: https://lore.kernel.org/linux-arm-kernel/20250331094320.35226-1-yangyicong@huawei.com/
> 
> Change since v1:
> - Drop the support for LS64_ACCDATA
> - handle the DABT of unsupported memory type after checking the memory attributes
> Link: https://lore.kernel.org/linux-arm-kernel/20241202135504.14252-1-yangyicong@huawei.com/
> 
> Marc Zyngier (2):
>   KVM: arm64: Add exit to userspace on {LD,ST}64B* outside of memslots
>   KVM: arm64: Add documentation for KVM_EXIT_ARM_LDST64B
> 
> Yicong Yang (5):
>   KVM: arm64: Handle DABT caused by LS64* instructions on unsupported
>     memory
>   arm64: Provide basic EL2 setup for FEAT_{LS64, LS64_V} usage at EL0/1
>   arm64: Add support for FEAT_{LS64, LS64_V}
>   KVM: arm64: Enable FEAT_{LS64, LS64_V} in the supported guest
>   kselftest/arm64: Add HWCAP test for FEAT_{LS64, LS64_V}
> 
>  Documentation/arch/arm64/booting.rst      | 12 +++
>  Documentation/arch/arm64/elf_hwcaps.rst   |  6 ++
>  Documentation/virt/kvm/api.rst            | 43 +++++++++--
>  arch/arm64/include/asm/el2_setup.h        | 12 ++-
>  arch/arm64/include/asm/esr.h              |  8 ++
>  arch/arm64/include/asm/hwcap.h            |  2 +
>  arch/arm64/include/asm/kvm_emulate.h      |  7 ++
>  arch/arm64/include/uapi/asm/hwcap.h       |  2 +
>  arch/arm64/kernel/cpufeature.c            | 51 +++++++++++++
>  arch/arm64/kernel/cpuinfo.c               |  2 +
>  arch/arm64/kvm/inject_fault.c             | 22 ++++++
>  arch/arm64/kvm/mmio.c                     | 27 ++++++-
>  arch/arm64/kvm/mmu.c                      | 14 +++-
>  arch/arm64/tools/cpucaps                  |  2 +
>  include/uapi/linux/kvm.h                  |  3 +-
>  tools/testing/selftests/arm64/abi/hwcap.c | 90 +++++++++++++++++++++++
>  16 files changed, 292 insertions(+), 11 deletions(-)
> 

