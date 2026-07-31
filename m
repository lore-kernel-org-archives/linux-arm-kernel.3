Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02A44C55173
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 18:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F8FDpk1RyFSrE4ou3yw+A67uFkSWkxtrMp6e/F5xT4c=; b=08VBcgj1RdVAyKP7vIPcUlzttx
	xAMfV3ooIvgr+xsHyiJB40dl4gW5LeYPJMVgYpvUFqd24XdKy0rkD9IsP3ppuNqjHMyhkfeTx/q81
	dmnca3sTiSPDHiN4HsJhwuV+oB2K/cOOVqafQpOdTg39amywxySYezXzk886lxY4gNu6TEBqrLsm7
	EJeeyF750cXk6faEREYKJfv5QlLPUbhhQYMJwxAL5hYXqNnSLGnjTSCs24ejc1b2/qkpAM2+cnXfM
	0MxVjYKKsoKd5ZkwuI1CfRRxYJRfDqJIlnZUpRGf18UOMy66+l13pj3UUNfudjSFT8GWwJCTxv4S8
	3dwm49ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpsM5-0000000DQJ4-0Ivd;
	Fri, 31 Jul 2026 18:53:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpsKo-0000000DPmg-2Tuf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 18:51:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 40EE843CE8;
	Fri, 31 Jul 2026 18:51:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E23631F01559;
	Fri, 31 Jul 2026 18:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785523914;
	bh=F8FDpk1RyFSrE4ou3yw+A67uFkSWkxtrMp6e/F5xT4c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=AJj01EbGFKTqUwPQ+Q0KdEEsRAtJB6e3nBC9ngUkBNPybNJc1xsbt+DKUdTphwbNe
	 TSd8T0ObgQXx3EBlBJqifrBtkIS5tuQ/auBFHCmiiaFxrt26wM6qymtRJSfc3I/qD1
	 S927M6JYTJJuCnVKdEsOdzI4TDeuW1qlyiv3m9umGHmg8JFuEJ/SETjGVtHSSo8kol
	 0oob9LyrcQV7noSvOtB3cIQ3SLDnPKolAnhcZDtW2Bez2KDTdIT6H0iFCqrmzySiFd
	 Tn8zNq5VPxA7GlXx0L4zeIsAzt1CbnwKk3Cv/6zTIKhEnV723x72b5yv5E6kG2TAi1
	 QE6M8iO6ZuXQg==
From: Oliver Upton <oupton@kernel.org>
To: Marc Zyngier <maz@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fuad Tabba <fuad.tabba@linux.dev>
Cc: Oliver Upton <oupton@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Quentin Perret <qperret@google.com>,
	Sebastian Ene <sebastianene@google.com>,
	Hyunwoo Kim <imv4bel@gmail.com>,
	Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH v7 0/8] KVM: arm64: pKVM vCPU state management at EL2
Date: Fri, 31 Jul 2026 11:51:47 -0700
Message-ID: <178552142335.30097.18179093757678605679.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260729131823.2021516-1-fuad.tabba@linux.dev>
References: <20260729131823.2021516-1-fuad.tabba@linux.dev>
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

On Wed, 29 Jul 2026 14:18:15 +0100, Fuad Tabba wrote:
> Changes since v6 [1]:
>   - Rebased onto v7.2-rc5.
>   - Expanded the comment and commit message in patch 8 explaining why PC
>     and PSTATE are copied back on every exit. No functional change.
>   - Collected Steffen's Reviewed-by on patch 3 (thanks!).
> 
> Building on Will's pKVM infrastructure series [2], this series reworks
> how pKVM moves vCPU state between the host and EL2, and stops copying a
> non-protected guest's state on every world switch.
> 
> [...]

Applied to next, thanks!

[1/8] KVM: arm64: Extract MPIDR computation into a shared header
      https://git.kernel.org/kvmarm/kvmarm/c/c0646b964733
[2/8] KVM: arm64: Make vcpu_{read,write}_sys_reg available to HYP code
      https://git.kernel.org/kvmarm/kvmarm/c/f88099ad9fc2
[3/8] KVM: arm64: Factor out reusable vCPU reset helpers
      https://git.kernel.org/kvmarm/kvmarm/c/29b2e2ab7fa7
[4/8] KVM: arm64: Move PSCI helper functions to a shared header
      https://git.kernel.org/kvmarm/kvmarm/c/86db2bd7f5f0
[5/8] KVM: arm64: Add host and hypervisor vCPU lookup primitives
      https://git.kernel.org/kvmarm/kvmarm/c/e9f88aa0b16c
[6/8] KVM: arm64: Minimise EL2's exposure of host VGIC state during world switch
      https://git.kernel.org/kvmarm/kvmarm/c/79c3122a1e14
[7/8] KVM: arm64: Add primitives to flush/sync the VGIC state at EL2
      https://git.kernel.org/kvmarm/kvmarm/c/42fe26543e66
[8/8] KVM: arm64: Implement lazy vCPU state sync for non-protected guests
      https://git.kernel.org/kvmarm/kvmarm/c/734dc8c01c83

--
Best,
Oliver

