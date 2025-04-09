Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1B65C36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 16:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RO1XdhfQHXKNscOYjSEB29wxs3WdJcfFeOuEybfnsTs=; b=rWyiSZnbb8cvpP/QU6O3iJ83Vh
	wVHTLEa4QjUEwYVAnfSED/TAYMoQgvT4TNGQG9RE7vj2xMpleJzJqjF6zwhFHtmxsOoZqla8LLFCT
	2I7PJIOQueziy+Ki9tWSidydet7biDw/I4QpQoSv4EE843p34JJIrUDoR6FCWClE52B0wA7TmSvT3
	1lDNjT4o2Vrl3QYBYgU6lkmYPA1Ldn+IufKSbH/bUFmAqDRyLcSc5K5Lc3yvObsUzu2lVGczzXWsk
	3mHW+Pwj2fmWbkv5ELjsJrpfDzYK0Tj8BAjeOVLxvYkv8LnoxIzK7YmscGdDE1OtmQSgvKAcKMC8A
	4DPnLQfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2XvC-00000007p0Z-0eCL;
	Wed, 09 Apr 2025 16:05:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Xrf-00000007oQw-31sF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 16:01:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 05A37615EF;
	Wed,  9 Apr 2025 16:01:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93367C4CEE9;
	Wed,  9 Apr 2025 16:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744214482;
	bh=TxlTgX+2KxlezUcYIU53c1C9S/07ZENXKrK6moE2IX4=;
	h=From:To:Cc:Subject:Date:From;
	b=MfWCnatJDbL67OwmTSK9e1l7miKAxnuXSj4A7+cly8IIxtSL5wGm8Z5rLl4zftGlW
	 8XyjYTQVtSNeBjmP3S+c/urrGhhqTJRuEtJ3PSmyRlI1SRUsZ0jvR5sLMqz5H0Nz88
	 zLOKaMhthEpx/gIky6eR040iI8Ul9+vESzDk7uUyE6AYh7fxz4W9UrBSfGpQ/vByBo
	 2EGd/jd2ZZ/6XOst9sgP03f06ydlTu6dLFxNNOuBTLloqdGsRuO8+I/bP8KLpI8gFs
	 sRuSuUmFxsoKEKmmBdn8yv8WOeWfhCbGO8LeyAclsMMoucrHGx7D8dQeOaQmtihdV8
	 q/yaYHTG5DkZg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1u2Xrb-003vQT-PF;
	Wed, 09 Apr 2025 17:01:20 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH v2 0/6] KVM: arm64: EL2 PMU handling fixes
Date: Wed,  9 Apr 2025 17:01:00 +0100
Message-Id: <20250409160106.6445-1-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

Joey reports that some of his PMU tests do not behave quite as
expected:

- MDCR_EL2.HPMN is set to 0 out of reset

- PMCR_EL0.P should reset all the counters when written from EL2

Oliver points out that setting PMCR_EL0.N from userspace by writing to
the register is silly with NV, and that we need a new PMU attribute
instead.

On top of that, I figured out that we had a number of little gotchas:

- It is possible for a guest to write an HPMN value that is out of
  bound, and it seems valuable to limit it

- PMCR_EL0.N should be the maximum number of counters when read from
  EL2, and MDCR_EL2.HPMN when read from EL0/EL1

- Prevent userspace from updating PMCR_EL0.N when EL2 is available

I haven't added any Cc stable, as NV is not functional upstream yet.

* From v1 [1]:

  - Added patch for the new PMU attribute
  - Added fix for HPMN limit
  - Prevent update of PMCR_EL0.N with NV
  - Fix kvm_vcpu_read_pmcr()
  - Rebased on 6.15-rc1

[1] https://lore.kernel.org/r/20250217112412.3963324-1-maz@kernel.org

Marc Zyngier (6):
  KVM: arm64: Fix MDCR_EL2.HPMN reset value
  KVM: arm64: Contextualise the handling of PMCR_EL0.P writes
  KVM: arm64: Allow userspace to limit the number of PMU counters for
    EL2 VMs
  KVM: arm64: Don't let userspace write to PMCR_EL0.N when the vcpu has
    EL2
  KVM: arm64: Handle out-of-bound write to HDCR_EL2.HPMN
  KVM: arm64: Let kvm_vcpu_read_pmcr() return an EL-dependent value for
    PMCR_EL0.N

 Documentation/virt/kvm/devices/vcpu.rst | 24 ++++++++++++
 arch/arm64/include/uapi/asm/kvm.h       |  9 +++--
 arch/arm64/kvm/pmu-emul.c               | 51 ++++++++++++++++++++++---
 arch/arm64/kvm/sys_regs.c               | 43 ++++++++++++++++-----
 4 files changed, 107 insertions(+), 20 deletions(-)

-- 
2.39.2


