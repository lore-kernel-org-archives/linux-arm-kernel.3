Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A05CBC28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 23:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oi1BLbE7r5Jv82rbxY9jzsh/6odGMKYOpVA/m+ctSAs=; b=dSf+XvHAFi0s86wPHQmCYoJlCO
	CNSwy8CCpj82BlyHKjgnLtCcjbdSOemagGugtbhvgBet/fPE/YJu3ekO+VqJ4KzQS605wwe8X7SvT
	5+zMZzMNVmBx0uBRbgfZpykzxQPL+wd9Dv0znIYl0SXqWKxdhseJYxKYwd71M94hvQrQb8UeeTkhx
	9VP+nldp2+sF8eTBBv0ttVeNxmJ55EPyueKDI41WnCH0SAnjC5m5EUON/EByqAN9aByRKDXGg+3X1
	N4krVq7SOTeXEHdJFHDFV4nEeicTCY38kxbdoKw7OfjUmhyvQ3Be+tfxD4YDVPSIAfo3crXuWHLw4
	ih3m5k6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts9K2-00000007D9j-3UVK;
	Tue, 11 Mar 2025 23:47:42 +0000
Received: from out-178.mta1.migadu.com ([95.215.58.178])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts9H8-00000007Cnr-3zBl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 23:44:45 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1741736680;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Oi1BLbE7r5Jv82rbxY9jzsh/6odGMKYOpVA/m+ctSAs=;
	b=oSMS2P3iID7v+wiMAoAinih2NDgr8K39BTILgxvDMNQ4bTMlDqOjbO4ZVovP48XrnBdkxd
	qMhQiTAjEyPSTOPvpeWC04oEh1iQ30UvNMzRSjX2lcYdOHVBoAYM0aW32Rh6EdNNdo26ZW
	Zq23OYzylV5zqv+GXg9OYrajB7Bxy4U=
From: Oliver Upton <oliver.upton@linux.dev>
To: kvmarm@lists.linux.dev,
	Oliver Upton <oliver.upton@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mingwei Zhang <mizhang@google.com>,
	Colton Lewis <coltonlewis@google.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Janne Grunau <j@jannau.net>
Subject: Re: [PATCH v3 00/14] KVM: arm64: FEAT_PMUv3 on Apple hardware
Date: Tue, 11 Mar 2025 16:44:26 -0700
Message-Id: <174173663466.1065484.5411031116504311230.b4-ty@linux.dev>
In-Reply-To: <20250305202641.428114-1-oliver.upton@linux.dev>
References: <20250305202641.428114-1-oliver.upton@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_164443_774160_9CFFEF90 
X-CRM114-Status: UNSURE (   6.72  )
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

On Wed, 05 Mar 2025 12:26:27 -0800, Oliver Upton wrote:
> Hopefully close to the last spin, this time addressing Marc's comments
> on v2.
> 
> Full details found in the v1 cover letter.
> 
> v1: https://lore.kernel.org/kvmarm/20241217212048.3709204-1-oliver.upton@linux.dev/
> v2: https://lore.kernel.org/kvmarm/20250203183111.191519-1-oliver.upton@linux.dev/
> 
> [...]

Applied to next, thanks!

[01/14] drivers/perf: apple_m1: Refactor event select/filter configuration
        https://git.kernel.org/kvmarm/kvmarm/c/75ecffc361bb
[02/14] drivers/perf: apple_m1: Support host/guest event filtering
        https://git.kernel.org/kvmarm/kvmarm/c/46573d944f00
[03/14] KVM: arm64: Compute PMCEID from arm_pmu's event bitmaps
        https://git.kernel.org/kvmarm/kvmarm/c/93b01528586b
[04/14] KVM: arm64: Always support SW_INCR PMU event
        https://git.kernel.org/kvmarm/kvmarm/c/ed335722b457
[05/14] KVM: arm64: Use a cpucap to determine if system supports FEAT_PMUv3
        https://git.kernel.org/kvmarm/kvmarm/c/6f34024d185e
[06/14] KVM: arm64: Drop kvm_arm_pmu_available static key
        https://git.kernel.org/kvmarm/kvmarm/c/a38b67d15183
[07/14] KVM: arm64: Use guard() to cleanup usage of arm_pmus_lock
        https://git.kernel.org/kvmarm/kvmarm/c/3d6d9172128e
[08/14] KVM: arm64: Move PMUVer filtering into KVM code
        https://git.kernel.org/kvmarm/kvmarm/c/56290316a443
[09/14] KVM: arm64: Compute synthetic sysreg ESR for Apple PMUv3 traps
        https://git.kernel.org/kvmarm/kvmarm/c/2c433f70dccc
[10/14] KVM: arm64: Advertise PMUv3 if IMPDEF traps are present
        https://git.kernel.org/kvmarm/kvmarm/c/bed9b8ec8c71
[11/14] KVM: arm64: Remap PMUv3 events onto hardware
        https://git.kernel.org/kvmarm/kvmarm/c/1e7dcbfa4b7c
[12/14] drivers/perf: apple_m1: Provide helper for mapping PMUv3 events
        https://git.kernel.org/kvmarm/kvmarm/c/2d00cab849be
[13/14] KVM: arm64: Provide 1 event counter on IMPDEF hardware
        https://git.kernel.org/kvmarm/kvmarm/c/1b92e65f5006
[14/14] arm64: Enable IMP DEF PMUv3 traps on Apple M*
        https://git.kernel.org/kvmarm/kvmarm/c/e1231aacb065

--
Best,
Oliver

