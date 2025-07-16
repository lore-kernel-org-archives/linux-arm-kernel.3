Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DF1FC83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 16:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PwYPcyN5ffSu6lALOEsqaBZ3FmFPW1VuXsd8RNbGzSg=; b=SA0b9HD2d9VUK2i/8t4RtvdA6e
	ga/RTR8yufryR1m9PeDQgJIVOKLqK1Yh5pf7fSsDzJ4Bu9R2niQ1QRAJdTgD9lV+0EITumM5IMSw2
	fxqg/XLnoKbznNAydgNaH3k1tznUvTE65LYUteQ+VnDgAVsxEom9Pg+0a0ythEJWeZsRyu82XgUcn
	K+U778ELWWcbtEWQlJYplwE8MawLFGI0hsv4oAV31HQIL2brGoiHK+BD5bsPpqVrStD5tpAP1uXj7
	TIQxDG+3eSFgvnQYZrL0upcVMh3lvw/6oZ86dPwVV97Dr/E0LOSfJWQphh3WJZkjQv56chwMTkb6C
	Z/EIVxHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc5LH-00000008Dpu-0KU8;
	Wed, 16 Jul 2025 16:50:51 +0000
Received: from out-186.mta1.migadu.com ([2001:41d0:203:375::ba])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc5Im-00000008DZ5-23fy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 16:48:18 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1752684491;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PwYPcyN5ffSu6lALOEsqaBZ3FmFPW1VuXsd8RNbGzSg=;
	b=XdKcKA4xgGAt3A6fo5ngf0BR2gFrXXau0lYlMPXtXv9fYNMeizRPx3BtirSZpS3Fzgynj7
	94v5kU/L4aZtL1RqBkHuVCRMQfi+xtp5en5lP2iI/fY8rneDjz1X5UlO8r7p6GHre0GYWb
	eXt/1pnHJ1oMb5UESn8dFTRn4WUa3So=
From: Oliver Upton <oliver.upton@linux.dev>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Eric Auger <eric.auger@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 00/11] KVM: arm64: nv: Userspace register visibility fixes
Date: Wed, 16 Jul 2025 09:47:53 -0700
Message-Id: <175268446557.2457435.15867128559478190522.b4-ty@linux.dev>
In-Reply-To: <20250714122634.3334816-1-maz@kernel.org>
References: <20250714122634.3334816-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_094817_277106_A48D8618 
X-CRM114-Status: UNSURE (   7.45  )
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

On Mon, 14 Jul 2025 13:26:23 +0100, Marc Zyngier wrote:
> Peter recently pointed out that we don't expose the EL2 GICv3
> registers in a consistent manner, as they are presented through the
> ONE_REG interface instead of KVM_DEV_ARM_VGIC_GRP_CPU_SYSREGS, despite
> the latter already exposing the EL1 GICv3 regs.
> 
> While I was looking at this, I ended up finding a small number of
> equally small problems:
> 
> [...]

Applied to next, thanks!

[01/11] KVM: arm64: Make RVBAR_EL2 accesses UNDEF
        https://git.kernel.org/kvmarm/kvmarm/c/1095b32665cf
[02/11] KVM: arm64: Don't advertise ICH_*_EL2 registers through GET_ONE_REG
        https://git.kernel.org/kvmarm/kvmarm/c/c70a4027f5f3
[03/11] KVM: arm64: Define constant value for ICC_SRE_EL2
        https://git.kernel.org/kvmarm/kvmarm/c/c6ef46861080
[04/11] KVM: arm64: Define helper for ICH_VTR_EL2
        https://git.kernel.org/kvmarm/kvmarm/c/ce7a1cff2e4c
[05/11] KVM: arm64: Let GICv3 save/restore honor visibility attribute
        https://git.kernel.org/kvmarm/kvmarm/c/1d14c9714562
[06/11] KVM: arm64: Expose GICv3 EL2 registers via KVM_DEV_ARM_VGIC_GRP_CPU_SYSREGS
        https://git.kernel.org/kvmarm/kvmarm/c/9fe9663e47e2
[07/11] KVM: arm64: Condition FGT registers on feature availability
        https://git.kernel.org/kvmarm/kvmarm/c/72c62700b279
[08/11] KVM: arm64: Advertise FGT2 registers to userspace
        https://git.kernel.org/kvmarm/kvmarm/c/a0aae0a9a70e
[09/11] KVM: arm64: selftests: get-reg-list: Simplify feature dependency
        https://git.kernel.org/kvmarm/kvmarm/c/9a4071807909
[10/11] KVM: arm64: selftests: get-reg-list: Add base EL2 registers
        https://git.kernel.org/kvmarm/kvmarm/c/3a90b6f27964
[11/11] KVM: arm64: Document registers exposed via KVM_DEV_ARM_VGIC_GRP_CPU_SYSREGS
        https://git.kernel.org/kvmarm/kvmarm/c/f68df3aee7d1

--
Best,
Oliver

