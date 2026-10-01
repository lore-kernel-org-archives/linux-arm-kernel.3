Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4086ACA5FCB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 14:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NyQWHHCSmslcWPV2x1ylZVNMBV/seL+Wm39p7DMyN18=; b=E+E4XYM32iDxRJ4P8MJxrlG7D0
	6B1oea2MChVYg1yXhshvPKSdmjVVq9K8OZf72l5PjxldQsrz03QCvnxvlGTfrO8hDQZze8dNF0ioh
	1V17h+6Ye5ePSnyzdXKFg1j2euk+eECzuXcePbhlcdbV24TmohNEjPkz1AXf3HUrjjCzzxP/mvr+B
	dpO/K6xZYHotYvA93q5Z2QOE8QnbBzJYimxlf5YEI6DjVSJ4WOvGeZMmge1Fq6och+gNfmv08RRM8
	+DDawl+Rb56TIulRuhOqcIGZQ8zynYAJPiVm5Lk/zc/Bn1n72/VAHJqLMKUZXgXtriKkL57GlXFtl
	7fea7okg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCHhj-00000009MZ2-00Hc;
	Thu, 01 Oct 2026 14:24:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCHhh-00000009MYv-2fX8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 14:24:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0E7024389E;
	Thu,  1 Oct 2026 14:24:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E40291F00898;
	Thu,  1 Oct 2026 14:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790864648;
	bh=NyQWHHCSmslcWPV2x1ylZVNMBV/seL+Wm39p7DMyN18=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=F2SeWX0JiXkYZzwbySNjiyQFfYIvhrSpPFrJzcXtkRM0GjyZbzUUM9LE58PzSBWjH
	 Dy4meAJYjpIJLeg2dNacqW6mqLwv0jmyvooP/5pwWNaTbg6O72ei19KLXCrnMI0zig
	 XRX2cbJ2O+49ZFIEUfIDAoRsiV0KCvYTPORYmn9rp549fPyZuBvSMKWBlEtohcYrwj
	 McBzxbuCt0YsSuXENRm6EBzkow3ZXyyt+I6txyQLSH0/EMgtoQ7YI5STizqTZfmvLP
	 UkzCPtyELEEDkDHXWAlwPWqlX45n1iOrQd/87evGSooeNuvVc41kLjG5340ISqehP5
	 42XUO5UHnbKZw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1xCHhe-0000000FpD6-1kxa;
	Thu, 01 Oct 2026 14:24:06 +0000
From: Marc Zyngier <maz@kernel.org>
To: oupton@kernel.org,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Vincent Donnefort <vdonnefort@google.com>
Cc: joey.gouly@arm.com,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	kernel-team@android.com,
	fuad.tabba@linux.dev,
	qperret@google.com,
	weilin.chang@arm.com
Subject: Re: [PATCH v2 0/4] Fix guest_memfd and protected VMs on systems with pages larger than 4K
Date: Thu,  1 Oct 2026 15:24:03 +0100
Message-ID: <179086459527.3904893.12825390067092520410.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260928095454.3255918-1-vdonnefort@google.com>
References: <20260928095454.3255918-1-vdonnefort@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: oupton@kernel.org, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, vdonnefort@google.com, joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, weilin.chang@arm.com
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

On Mon, 28 Sep 2026 10:54:49 +0100, Vincent Donnefort wrote:
> This series allows booting protected VMs and guest_memfd-back VMs on
> systems with a page size larger than 4K.
> 
> Currently, the fault handling assumes 4K alignment, as HPFAR_EL2
> provides the IPA minus the bottom 12 bits regardless of the system page
> size. This leads to mapping failures on 16K and 64K systems.
> 
> [...]

Applied to next, thanks!

[1/4] KVM: arm64: Fix MMFR0 TGRAN advertisement for pVMs
      commit: 6c29285e78b5e4811145ebda382ac0ba732ce56a
[2/4] KVM: arm64: Pass kvm_s2_fault_desc to fault_supports_stage2_huge_mapping()
      commit: 10c5cc50f056a6425305557063ad70c3eb0e686b
[3/4] KVM: arm64: Use kvm_s2_fault_vma_info in gmem_abort()
      commit: 80b0b86dc5e4344e62a2fd3ee43d0ef816fe9122
[4/4] KVM: arm64: Use kvm_s2_fault_vma_info in pkvm_mem_abort()
      commit: 0cdcc1039200b3c4fbc2ae3f9b5c1be1bc9155e8

Again, a large number of conflicts (prefault, rmap). Please review the
conflict resolution.

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



