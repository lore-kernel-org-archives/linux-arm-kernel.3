Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EF37D767F7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 18:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o8oZOz6bx3rY3c9b+cY/Dimo4K6xxWzeL+kimqHVrYs=; b=VoVK6b0848ChSi2clql6mabE3J
	VWhYyfFi1MIuyrCPO83u2jv0rROO6D1QC2gOHP3E0oFu3XeteyXmlDXSjdtBVuVjjW/v/KvDpgCbH
	dxDQj2eXoopHUJnjlmKScQs07TBvBzkMqB7pq+d6AEO59XNBcHo1kDEPCufQeJryPDk41A32Par6F
	Ckja6/9IvDVKoqAFmXbGJDhjS8IQhzitDnF/LASmJrYmR6P2mW6cYnsmoXtYB/0M66HRVp0VAcw3N
	u+Mu2fzYzcquuObMAu8rSCELSPTAXlnlhZVmBQD70l1jYJ5R4FAqU6Z/5GyeQKJlRXAJcUyuox0s7
	tcLuz/sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6a9R-00000004Wyi-0dLA;
	Thu, 31 Oct 2024 18:44:09 +0000
Received: from out-175.mta1.migadu.com ([95.215.58.175])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6a7j-00000004WQN-2grA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 18:42:25 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1730400140;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o8oZOz6bx3rY3c9b+cY/Dimo4K6xxWzeL+kimqHVrYs=;
	b=mPYHUB4QG89z5DwHS8z8x4qAbIbEIuMfDaU5MtyVYBfjI5VbB5Kqyz858XZGHqDxCr4rFp
	asiGVPDAJutg9hBBd7X0WuXgx8zyy29y94qwjwOdUyM32ZSfxkCurDc6uO1uop9Ic/205N
	wt7R/3PETCOhsSe4IrSUk/0hmcMLVn4=
From: Oliver Upton <oliver.upton@linux.dev>
To: Joey Gouly <joey.gouly@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: Oliver Upton <oliver.upton@linux.dev>,
	Catalin Marinas <catalin.marinas@arm.com>,
	james.morse@arm.com,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Jing Zhang <jingzhangos@google.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	shameerali.kolothum.thodi@huawei.com,
	gshan@redhat.com,
	anshuman.khandual@arm.com
Subject: Re: [PATCH v6 0/7] KVM: arm64: Hide unsupported MPAM from the guest
Date: Thu, 31 Oct 2024 18:42:09 +0000
Message-ID: <173040012144.3070763.12098907901821115896.b4-ty@linux.dev>
In-Reply-To: <20241030160317.2528209-1-joey.gouly@arm.com>
References: <20241030160317.2528209-1-joey.gouly@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_114224_411583_94B9CFAF 
X-CRM114-Status: UNSURE (   8.01  )
X-CRM114-Notice: Please train this message.
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

On Wed, 30 Oct 2024 16:03:10 +0000, Joey Gouly wrote:
> changes since v5 [1]:
> 	- Removed Kconfig option, the KVM traps shouldn't rely on host kernel support
> 	- Renamed cpus_support_* to system_supports_* since that matches other functions
> 	- Replace static branch arm64_mpam_has_hcr with a normal cpufeature capability
> 	- Add MPAM*_EL2 regs to KVM (undef_access)
> 	- Use constants in the test, instead of hardcoded values
> 	- Added R-b and T-b tags
> 	- Rebased on v6.12-rc5
> 
> [...]

Applied to kvmarm/next, thanks!

[1/7] arm64/sysreg: Convert existing MPAM sysregs and add the remaining entries
      https://git.kernel.org/kvmarm/kvmarm/c/83732ce6a056
[2/7] arm64: head.S: Initialise MPAM EL2 registers and disable traps
      https://git.kernel.org/kvmarm/kvmarm/c/23b33d1e168c
[3/7] arm64: cpufeature: discover CPU support for MPAM
      https://git.kernel.org/kvmarm/kvmarm/c/09e6b306f3ba
[4/7] KVM: arm64: Fix missing traps of guest accesses to the MPAM registers
      https://git.kernel.org/kvmarm/kvmarm/c/31ff96c38ea3
[5/7] KVM: arm64: Add a macro for creating filtered sys_reg_descs entries
      https://git.kernel.org/kvmarm/kvmarm/c/7da540e29dea
[6/7] KVM: arm64: Disable MPAM visibility by default and ignore VMM writes
      https://git.kernel.org/kvmarm/kvmarm/c/6685f5d572c2
[7/7] KVM: arm64: selftests: Test ID_AA64PFR0.MPAM isn't completely ignored
      https://git.kernel.org/kvmarm/kvmarm/c/75cd027cbcb1

--
Best,
Oliver

