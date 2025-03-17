Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C1DBC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 20:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vu17wjBsFBCZ0+3MLyENCrSMY6OUYDwd3aPaG2b678Y=; b=UBI5xoVDXWkXYrQhVWHwX17biZ
	lv6tyEX1Ms/xAAeAzaqskhIt0+/Ym2MZzrel+73BZvd1nUvjVEP71SCbMsqjYAlWz0oQffNVmNAnh
	ivhtdPU5jpJkvZtBRIYcLh7+S5tg62hBONfnTUH0najnyIifmipFjwrFYIUOpEuty0CIDhf7Hcoju
	ccAIIilfXWkdeUwkgqzMru05iG0cNosT65su65M+6Vcq1u7O0bcbxTkUelOZ2TVz104US87f9hWsJ
	NZWbljUXUXgdM/wtccuV9aGX12myNtnvd296LHxZzf44tnFJXwpBfpcSzVtHczFWx95WC8Dprh68H
	gPKGyUXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuGg3-00000003sMC-3KHM;
	Mon, 17 Mar 2025 20:03:11 +0000
Received: from out-188.mta1.migadu.com ([2001:41d0:203:375::bc])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuGeM-00000003sDl-2y2Z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 20:01:28 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1742241680;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vu17wjBsFBCZ0+3MLyENCrSMY6OUYDwd3aPaG2b678Y=;
	b=iSqMGIM5dt9iMPdojc31nopo9hKqmXZO6m/dgNFvLRNdYeReE7hDnUkJqKY7bShOAFHp5h
	DEY80ffWRrxSJCsfjRKiFbxYdTwJK8ck8aMHT+o57UoCcCjsFxx6bjWFwJhXdYFIc/Gg07
	nheG9vUQcD647tUcUEwt1m88nlV037Y=
From: Oliver Upton <oliver.upton@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Andrew Jones <andrew.jones@linux.dev>,
	Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Oliver Upton <oliver.upton@linux.dev>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	devel@daynix.com,
	stable@vger.kernel.org
Subject: Re: [PATCH v5 0/5] KVM: arm64: PMU: Fix SET_ONE_REG for vPMC regs
Date: Mon, 17 Mar 2025 13:01:07 -0700
Message-Id: <174224155547.1588441.3490436622132208645.b4-ty@linux.dev>
In-Reply-To: <20250315-pmc-v5-0-ecee87dab216@daynix.com>
References: <20250315-pmc-v5-0-ecee87dab216@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_130126_888610_62C46B26 
X-CRM114-Status: UNSURE (   8.82  )
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

On Sat, 15 Mar 2025 18:12:09 +0900, Akihiko Odaki wrote:
> Prepare vPMC registers for user-initiated changes after first run. This
> is important specifically for debugging Windows on QEMU with GDB; QEMU
> tries to write back all visible registers when resuming the VM execution
> with GDB, corrupting the PMU state. Windows always uses the PMU so this
> can cause adverse effects on that particular OS.
> 
> This series also contains patch "KVM: arm64: PMU: Set raw values from
> user to PM{C,I}NTEN{SET,CLR}, PMOVS{SET,CLR}", which reverts semantic
> changes made for the mentioned registers in the past. It is necessary
> to migrate the PMU state properly on Firecracker, QEMU, and crosvm.
> 
> [...]

Squashed in a fix for CONFIG_HW_PERF_EVENTS=n build.

Applied to next, thanks!

[1/5] KVM: arm64: PMU: Set raw values from user to PM{C,I}NTEN{SET,CLR}, PMOVS{SET,CLR}
      https://git.kernel.org/kvmarm/kvmarm/c/f2aeb7bbd574
[2/5] KVM: arm64: PMU: Assume PMU presence in pmu-emul.c
      https://git.kernel.org/kvmarm/kvmarm/c/be5ccac3f15e
[3/5] KVM: arm64: PMU: Fix SET_ONE_REG for vPMC regs
      https://git.kernel.org/kvmarm/kvmarm/c/64074ca8ca92
[4/5] KVM: arm64: PMU: Reload when user modifies registers
      https://git.kernel.org/kvmarm/kvmarm/c/1db4aaa05589
[5/5] KVM: arm64: PMU: Reload when resetting
      https://git.kernel.org/kvmarm/kvmarm/c/fe53538069bb

--
Best,
Oliver

