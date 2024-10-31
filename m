Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96EB3D767FA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 19:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7k0lhlqVUH2PRuKZimC+zuSQ9tywYvWdXQj8NJnprjw=; b=vldM4evOAUKeoiRdcWzbS+ddzt
	elLF1S/dg/WrN/NVH32LrQRmfN3DCYE6bvnxgv/emzlm0E7JkfbCOX0kXwcaGlK/uJQIZOW37w0TK
	J40u8RtQWOlmv+YJdAU7m8NMrSiwCjiZtuzc9Cvxx9nJTl+E0f3bUc24KCpxSMIuaYME4zHTZHfzb
	UsG7F1ZJGV3oC7Mck+CuD07FyUk3L+f85SCkh3eQWFI0eaSt4Kl0VDsJ1ZyFLki5PLXd1JZwn7Qd0
	3K+9xlxpbcLgqtaXUSsQLUpBj9f075EzCSHuhiU6IgG4rQ5GjK05FQ8z4cssy4JTbk8vXZZK1F6a2
	0UQ6kxcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6ayb-00000004eqd-3wtP;
	Thu, 31 Oct 2024 19:37:01 +0000
Received: from out-178.mta0.migadu.com ([2001:41d0:1004:224b::b2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6awu-00000004ecZ-2uoV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 19:35:19 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1730403310;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7k0lhlqVUH2PRuKZimC+zuSQ9tywYvWdXQj8NJnprjw=;
	b=I6gpoXGk4WpkxHpqqw7B0hi70vPzUkPh1qxplJi+Yww9CwVFeFqJQDR4mycBdi0D6ZBbqu
	ccQdynerUPnHzj3IKoShuccqmsyFi7CDokBvhRmxXrKiG2UzT7r4Oxfb+qZt3C3IOqrA9h
	y9e1FBHwej5C57edUWznZzAULvg9XNc=
From: Oliver Upton <oliver.upton@linux.dev>
To: kvmarm@lists.linux.dev,
	Oliver Upton <oliver.upton@linux.dev>
Cc: linux-arm-kernel@lists.infradead.org,
	Will Deacon <will@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	linux-kernel@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH v4 00/18] KVM: arm64: nv: Support for EL2 PMU controls
Date: Thu, 31 Oct 2024 19:34:55 +0000
Message-ID: <173040329116.3311297.4818685036404939787.b4-ty@linux.dev>
In-Reply-To: <20241025182354.3364124-1-oliver.upton@linux.dev>
References: <20241025182354.3364124-1-oliver.upton@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_123518_028859_6F6FE004 
X-CRM114-Status: UNSURE (   5.15  )
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

On Fri, 25 Oct 2024 18:23:35 +0000, Oliver Upton wrote:
> v3 -> v4:
>  - Align sysreg definitions with DDI0601 2024-09
>  - Fix 'accessible' counter mask construction
>  - Fix MDCR_EL2.MTPME RES0 logic
> 
> v3: https://lore.kernel.org/kvmarm/20241007174559.1830205-1-oliver.upton@linux.dev/
> 
> [...]

Applied to kvmarm/next, thanks!

[01/18] KVM: arm64: Extend masking facility to arbitrary registers
        https://git.kernel.org/kvmarm/kvmarm/c/a0162020095e
[02/18] arm64: sysreg: Describe ID_AA64DFR2_EL1 fields
        https://git.kernel.org/kvmarm/kvmarm/c/93d7356e4b30
[03/18] arm64: sysreg: Migrate MDCR_EL2 definition to table
        https://git.kernel.org/kvmarm/kvmarm/c/641630313e9c
[04/18] arm64: sysreg: Add new definitions for ID_AA64DFR0_EL1
        https://git.kernel.org/kvmarm/kvmarm/c/3ecb1fe3842c
[05/18] KVM: arm64: Describe RES0/RES1 bits of MDCR_EL2
        https://git.kernel.org/kvmarm/kvmarm/c/eb609638da55
[06/18] KVM: arm64: nv: Allow coarse-grained trap combos to use complex traps
        https://git.kernel.org/kvmarm/kvmarm/c/18aeeeb57b93
[07/18] KVM: arm64: nv: Rename BEHAVE_FORWARD_ANY
        https://git.kernel.org/kvmarm/kvmarm/c/a4063b5aa0bd
[08/18] KVM: arm64: nv: Reinject traps that take effect in Host EL0
        https://git.kernel.org/kvmarm/kvmarm/c/d97e66fbcba7
[09/18] KVM: arm64: nv: Honor MDCR_EL2.{TPM, TPMCR} in Host EL0
        https://git.kernel.org/kvmarm/kvmarm/c/4ee5d5ff4b4d
[10/18] KVM: arm64: nv: Describe trap behaviour of MDCR_EL2.HPMN
        https://git.kernel.org/kvmarm/kvmarm/c/336afe0c832d
[11/18] KVM: arm64: nv: Advertise support for FEAT_HPMN0
        https://git.kernel.org/kvmarm/kvmarm/c/166b77a2f423
[12/18] KVM: arm64: Rename kvm_pmu_valid_counter_mask()
        https://git.kernel.org/kvmarm/kvmarm/c/a3034dab74fc
[13/18] KVM: arm64: nv: Adjust range of accessible PMCs according to HPMN
        https://git.kernel.org/kvmarm/kvmarm/c/9a1c58cfefb0
[14/18] KVM: arm64: Add helpers to determine if PMC counts at a given EL
        https://git.kernel.org/kvmarm/kvmarm/c/9d15f8290a22
[15/18] KVM: arm64: nv: Honor MDCR_EL2.HPME
        https://git.kernel.org/kvmarm/kvmarm/c/fe827f916662
[16/18] KVM: arm64: nv: Honor MDCR_EL2.HLP
        https://git.kernel.org/kvmarm/kvmarm/c/16535d55e91f
[17/18] KVM: arm64: nv: Apply EL2 event filtering when in hyp context
        https://git.kernel.org/kvmarm/kvmarm/c/8a34979030f6
[18/18] KVM: arm64: nv: Reprogram PMU events affected by nested transition
        https://git.kernel.org/kvmarm/kvmarm/c/ae323e035801

--
Best,
Oliver

