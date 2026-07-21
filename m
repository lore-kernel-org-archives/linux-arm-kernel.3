Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51352C4451C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 18:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JYK1SVsB1MqYcJihkmBUZ/fXnWOSDpdPDihlH2cnXBg=; b=Ps2lVd2F12uJZIhm0g4CuZVtYA
	FRBFkXzXib9XlnCatBAQIRuUbNMKb+sqms5W1e4tqNApwM6QtdD6PyhPiJ/F0p069/z7pZmK0PTc4
	ip08DBcJrese4fnJmusrECXR1M/RWdQIdiAbO4tPC/VlGVddCIM5YDWDCDxu+RXhoog2UFHILTMM4
	olZL56DhJwIAzPzZgub6rY/dk81ipaxnuCH/lAgpRHlvjgeSsG2w3gtPQiVF9Q6mCsIxPRoC+kOLo
	Zpty2gCwOpLRm2PV2G73wb/keY+m7r6iwj+wG26tNPNRYl8+w6HEeoN9FRKlaIWQLRZTn0PY7l8Kl
	winOvgDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmF8S-0000000AC73-3gLl;
	Tue, 21 Jul 2026 18:24:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmF8S-0000000AC6w-29Zx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 18:24:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2E13D40807;
	Tue, 21 Jul 2026 18:24:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB5AC1F000E9;
	Tue, 21 Jul 2026 18:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784658248;
	bh=JYK1SVsB1MqYcJihkmBUZ/fXnWOSDpdPDihlH2cnXBg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=TIxaR6GjtuMIXe+XSoWBc0o0bHsDMvHLj60PdpNjRrsphstpKb74XyvPmXW9pZUhd
	 gUn2X+V3o41322doBxgr8Iw3HXktD9pm1voBo16Jw2VDi8uXSD8cp4qwnmBWp6xvtn
	 Poxq+P/tQxTW+i9O5ekrvt2xx8IOosK4XCnqGEOyqn8aFkw8+bWdwbi4ZQvpUDY5U3
	 pFg6ekqQcD9WJlTGCriVG3FPHFYvMB7OODA+56UVxZ+r7JllCA8En2ycjMbCTCZlR6
	 4Pl14M1wxKU0SWU0nqJcTvGSbTQcYGu8JSeiiH9kv9iu/uub/EB5YwNl9f8+M3v/Oc
	 I2XYaJkbHUuOw==
From: Oliver Upton <oupton@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH v2 0/6] KVM: arm64: Make ICH_VTR_EL2 accesses an inlined literal
Date: Tue, 21 Jul 2026 11:24:04 -0700
Message-ID: <178465820769.2066547.9255034363625874099.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260721170754.3150521-1-maz@kernel.org>
References: <20260721170754.3150521-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Tue, 21 Jul 2026 18:07:48 +0100, Marc Zyngier wrote:
> I'm reposting this early as there were so many issues to the original
> posting that I decided to deviate from my own rules... Bite me.
> 
> This is the second version of this series I initially sent as [1],
> which aims at removing the large number of traps that ICH_VTR_EL2
> generates in NV environments, leading to pointless overheads.
> 
> [...]

Sashiko seems to have a done a good job reviewing v1. This looks to be in
decent shape now.

Applied to next, thanks!

[1/6] KVM: arm64: vgic-v3: Make vtr_to_* helpers use architectural field symbols
      https://git.kernel.org/kvmarm/kvmarm/c/719e67103c5e
[2/6] KVM: arm64: Move GICv3 broken SEIS implementation detection to a CPU errrata
      https://git.kernel.org/kvmarm/kvmarm/c/27a263e1a0fa
[3/6] KVM: arm64: Add a helper providing an inlined literal value for ICH_VTR_EL2
      https://git.kernel.org/kvmarm/kvmarm/c/4edfdc8ddebd
[4/6] KVM: arm64: Convert most ICH_VTR_EL2 accesses to inlined literal value
      https://git.kernel.org/kvmarm/kvmarm/c/2bba3d2c6092
[5/6] KVM: arm64: vgic-v3: Simplify initial GICv3 configuration sampling
      https://git.kernel.org/kvmarm/kvmarm/c/bea608299d28
[6/6] KVM: arm64: vgic-v3: Kill kvm_vgic_global_state.ich_vtr_el2
      https://git.kernel.org/kvmarm/kvmarm/c/36d32222fcab

--
Best,
Oliver

