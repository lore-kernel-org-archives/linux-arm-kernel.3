Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8630DCAC5A0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 16:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=shQgo9HHRHtH1h5GrGkKJdxTrGZYUrn2Ymw4436jAn0=; b=oJWHUsc9C/zqceo3tPLBVC2e4z
	jEBj2AOUrS9cs3yquXcaxP4rD0LHDtzfc9IcPQfLBCO3X7m1Zfcujdz69kipd6GdmKv4ilco8yoZv
	gxRKUyPX5m9qUE56fAfiZ50oZW2KkHakAipZvbXTEtefNtB/4k7gtG1erej+nmoskNqsBBNNjhhV5
	rnVcs2NuE6n3CFU1PzZn+DKsqY9O4uN2DQyXjZmj1/XpsI5Yr3/4HOR7vl1wQkP7AqQU1/wNZJV/c
	UUDtyCQ+/wCWKzGCiNXookyRR5tM74wNqF6SgZSl0/r1/5VH5W/fns5JL77Mjp3QFCtz/0h4HWPaD
	z1EPvFVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyvEj-0000000DGpt-2gIt;
	Wed, 17 Sep 2025 16:42:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyvEj-0000000DGp1-05Ic
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 16:42:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 337C660239;
	Wed, 17 Sep 2025 16:42:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF2B3C4CEE7;
	Wed, 17 Sep 2025 16:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758127347;
	bh=sDmYzAVvLUWz02x4KttZh7bEAnkvy0jlE24JN3RphD8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Twr6BXe3WCu6jxGVx+sQE0MdQCydPBXeCkRNwPm12DNUXpQgMsaGRxeN242HdBfgs
	 g5Fc7Zeg1VQtAVbgNwwk2772RbCSoxsfZZdbZFfOPACoyNPdH7A8Ysfmy1eADzPC/w
	 LwJ8UEs0ozzRt3lK/0HWqqBWc3iVQ26KVHDKMjHpYuq7rwt29UP0OkpV7xHhfWExA7
	 qxSRIGuo0PYJovFKeV0vwa6+xkUUwMEcXpXZsRfrpvqmu7QZ8TT3XGM0kizlwsL5Vq
	 HmvvP6BqSZryj+7MnGKRW8OJmcZTvVb/820BXM4US5UL5uF/Tj1TI2A/2/X+gkN3ft
	 4Z117DwucYWoQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1uyvEf-00000007ACT-1qGd;
	Wed, 17 Sep 2025 16:42:25 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	Sascha Bischoff <Sascha.Bischoff@arm.com>
Cc: nd <nd@arm.com>,
	oliver.upton@linux.dev,
	Joey Gouly <Joey.Gouly@arm.com>,
	Suzuki Poulose <Suzuki.Poulose@arm.com>,
	yuzenghui@huawei.com,
	will@kernel.org,
	tglx@linutronix.de,
	lpieralisi@kernel.org,
	Timothy Hayes <Timothy.Hayes@arm.com>
Subject: Re: [PATCH 0/5] KVM: arm64: GICv5 legacy (GCIE_LEGACY) NV enablement and cleanup
Date: Wed, 17 Sep 2025 17:42:21 +0100
Message-Id: <175812733344.1632579.17001899303582807634.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250828105925.3865158-1-sascha.bischoff@arm.com>
References: <20250828105925.3865158-1-sascha.bischoff@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, Sascha.Bischoff@arm.com, nd@arm.com, oliver.upton@linux.dev, Joey.Gouly@arm.com, Suzuki.Poulose@arm.com, yuzenghui@huawei.com, will@kernel.org, tglx@linutronix.de, lpieralisi@kernel.org, Timothy.Hayes@arm.com
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

On Thu, 28 Aug 2025 10:59:41 +0000, Sascha Bischoff wrote:
> This series enables nested virtualization for GICv3-based VMs on GICv5
> hosts (w/ FEAT_GCIE_LEGACY) in KVM/arm64. In addition, it adds a CPU
> capability to track support for FEAT_GCIE_LEGACY across all CPUs.
> 
> The series fixes ICC_SRE_EL2 access handling for GICv5 hosts (to match
> the updated bet1+ specification [1]), and extends nested
> virtualization support to vGICv3 guests running on compatible GICv5
> systems. With these changes, it becomes possible to run with
> kvm-arm.mode=nested, and these changes have been tested with three
> levels of nesting on simulated hardware (Arm FVP).
> 
> [...]

Applied to next, thanks!

[1/5] KVM: arm64: Allow ICC_SRE_EL2 accesses on a GICv5 host
      (no commit info)
[2/5] KVM: arm64: Enable nested for GICv5 host with FEAT_GCIE_LEGACY
      commit: d5a012af348d4d84287267547eb8637b937545af
[3/5] arm64: cpucaps: Add GICv5 Legacy vCPU interface (GCIE_LEGACY) capability
      commit: 7847f51189343b29a24ca7edafb60a9032d5acf8
[4/5] KVM: arm64: Use ARM64_HAS_GICV5_LEGACY for GICv5 probing
      commit: 754e43b09561f59dd04e0b8aafe4f5c9a71a4d1f
[5/5] irqchip/gic-v5: Drop has_gcie_v3_compat from gic_kvm_info
      commit: 5c5db9efe323dd0b0d7917dbe5b9c0999c95e79e

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



