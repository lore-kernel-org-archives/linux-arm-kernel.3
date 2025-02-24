Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 857FBC021BB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 19:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Xh1+d4+0/2s7r35AQ1iEnqkZSbg7dbv/TfdOk1/Ssg=; b=pEMuG9qdDNKkKnMLogsW9vQgqC
	9TZExZCSVFsLMa4JYqPF+9H75D2amofZ2SdarsyG8PdSzXu+51jTgYNQCbkY1CwjBjNJpG7bDPXkY
	YujfSRkTY0klSw6DsQd4n3jhkBkRAPsNEQU2mcW2xIjd+VAOuck/BAKV/F1YORCSsKlbj/yQMGem6
	dYlfYodpKIATJ5d+Ebxp3+KJt1n2MAlj+PrsLFThBIMhFUbrAA1pKidzrEjgZnTeyBJ5KgH4p4Mqd
	wuIAYoNkqhajzZvru69KIPwoXFtN1xw7u3wVqVkxYp3DzaCFeIAx6cM7Gji8Dtk72RdPZ4TbFK1Bb
	cpcuQ8Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmeXZ-0000000F0dI-0MgN;
	Mon, 24 Feb 2025 19:54:57 +0000
Received: from out-172.mta1.migadu.com ([95.215.58.172])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmeVo-0000000F0RU-0eUK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 19:53:09 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1740426782;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7Xh1+d4+0/2s7r35AQ1iEnqkZSbg7dbv/TfdOk1/Ssg=;
	b=aN0tE1Pd1MEvzE4n+wYxC+wbOBiJbdoTQwM05uEvYofjAXAPxnfokLf1kAfI9sWOuqxmp8
	hhsHxyhQr/nWZPPkewHxSc9EC8AH5L8F7zz3RIfJnceWkFkmSz3C2J52Frot0hhPBuWoXj
	cFWZwESFmcvtbDmYJQ662pddCSqOVuo=
From: Oliver Upton <oliver.upton@linux.dev>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Eric Auger <eric.auger@redhat.com>,
	gankulkarni@os.amperecomputing.com
Subject: Re: (subset) [PATCH v2 00/14] KVM: arm64: NV userspace ABI
Date: Mon, 24 Feb 2025 11:52:52 -0800
Message-Id: <174042670061.586392.7441716091084012083.b4-ty@linux.dev>
In-Reply-To: <20250220134907.554085-1-maz@kernel.org>
References: <20250220134907.554085-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_115308_344563_F8E0B0F9 
X-CRM114-Status: GOOD (  10.42  )
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

On Thu, 20 Feb 2025 13:48:53 +0000, Marc Zyngier wrote:
> Since the previous incarnation of the ABI was proved to be subtly
> wrong, I have reworked it to be more in line with the current way KVM
> operates.
> 
> No more late NV-specific adjustment nor writable ID_AA64MMFR0_EL1.VH.
> The NV configuration is now entirely selected from the vcpu flags.
> I've preserved the KVM_ARM_VCPU_EL2 flag which enables NV with VHE,
> and added KVM_ARM_VCPU_EL2_E2H0 which alters the NV behaviour to only
> allow nVHE guests without recursive NV support.
> 
> [...]

I fixed up the typos, including the one that breaks bisection. Can
always back this out if anything is out of place.

Applied to next, thanks!

[01/14] arm64: cpufeature: Handle NV_frac as a synonym of NV2
        https://git.kernel.org/kvmarm/kvmarm/c/88aea41b9bc5
[02/14] KVM: arm64: Hide ID_AA64MMFR2_EL1.NV from guest and userspace
        https://git.kernel.org/kvmarm/kvmarm/c/9d6745572899
[03/14] KVM: arm64: Mark HCR.EL2.E2H RES0 when ID_AA64MMFR1_EL1.VH is zero
        https://git.kernel.org/kvmarm/kvmarm/c/d9f943f76506
[04/14] KVM: arm64: Mark HCR.EL2.{NV*,AT} RES0 when ID_AA64MMFR4_EL1.NV_frac is 0
        https://git.kernel.org/kvmarm/kvmarm/c/8f8d6084f5b5
[05/14] KVM: arm64: Advertise NV2 in the boot messages
        https://git.kernel.org/kvmarm/kvmarm/c/2cd9542a375a
[06/14] KVM: arm64: Consolidate idreg callbacks
        https://git.kernel.org/kvmarm/kvmarm/c/57e7de2650c8
[07/14] KVM: arm64: Make ID_REG_LIMIT_FIELD_ENUM() more widely available
        https://git.kernel.org/kvmarm/kvmarm/c/179fd7e30f04
[08/14] KVM: arm64: Enforce NV limits on a per-idregs basis
        https://git.kernel.org/kvmarm/kvmarm/c/e7ef6ed4583e
[09/14] KVM: arm64: Move NV-specific capping to idreg sanitisation
        https://git.kernel.org/kvmarm/kvmarm/c/94f296dcd6d9
[10/14] KVM: arm64: Allow userspace to limit NV support to nVHE
        https://git.kernel.org/kvmarm/kvmarm/c/f83c41fb3ddd
[11/14] KVM: arm64: Make ID_AA64MMFR4_EL1.NV_frac writable
        https://git.kernel.org/kvmarm/kvmarm/c/642c23ea8b45
[12/14] KVM: arm64: Advertise FEAT_ECV when possible
        https://git.kernel.org/kvmarm/kvmarm/c/8b0b98ebf34d

--
Best,
Oliver

