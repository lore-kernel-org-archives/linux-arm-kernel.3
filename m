Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FBEFC77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 08:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=40rcpiI/VBlaczYU7BvqikpluRDyju/1jJfWp8PFLnk=; b=ZRtzctx2SWvP5aWN5ABHGnjH+y
	WsU8q8ldt2dppopUCy9iCJaL9/j7mSSCJ8HT0uLK2szRZwZAkNWkeC/HiwxTfpdIs/evOpno84555
	me15199qW+F2kqnlQ+3YO0SqwMz5ycFAwXK9Rt+L1J2peyCHsbk8lX1/bl8u2YMfnd7RCah3KKHqV
	4f44gZjDTINvNak1b4jBhpUQytaE+iQrkKTORdtKgJIHLfW5fYWp2XIaIMJNaLsbXKNTiujwVY9LW
	quxkKhYPdMzUDVejlAGArNWZzH0lAU+3K8UCW2b8nLq2/3dLgLKKuNJHfv4HnZgv1jPyum3InBWfP
	Z2mxoXmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUhXp-0000000AsOY-18Qb;
	Thu, 26 Jun 2025 08:01:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUhQ9-0000000ArZI-07OG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 07:53:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6F60261127;
	Thu, 26 Jun 2025 07:53:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23DFCC4CEEB;
	Thu, 26 Jun 2025 07:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750924400;
	bh=pjppoiz7ViHXJGvWqCdSU9HQ/aOIYap1jzl8DIHCo8E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MnQ6LWlMe+2wYiBCFcn5tjJreD/T2jgmXmwxz6lFsBp+jZfpsJbIL9OSOl3wJf0k3
	 SonfgF0kuenpryOVQIOB+G7DJuR+SO4yGzMfoQ9NJM2tRlmhOwGguqU1h+X7IVilHZ
	 KK5I1rR9GARclkdcEytAw9oArcVKtvmV9w5yWnuRD4Ga4ahThvoD10GlKojMhfmgJh
	 Kuh8D1hy2OX/6Pnd0g0G1P2x6ckQR9SAQ6WUtEe0jKOQbDA7H9M8eBsqXuSrwpg221
	 Kugd+O+0esiXPGIs63/14oJVc+QuR6c+GfmgrfcsC5M0dAVnSxU+3x9DGMxW4H7qjq
	 IOz5VWGUSncaw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uUhQ6-00A8hJ-0Y;
	Thu, 26 Jun 2025 08:53:18 +0100
From: Marc Zyngier <maz@kernel.org>
To: Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Quentin Perret <qperret@google.com>
Cc: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: Adjust range correctly during host stage-2 faults
Date: Thu, 26 Jun 2025 08:53:15 +0100
Message-Id: <175092438911.7995.9528618735352034955.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250625105548.984572-1-qperret@google.com>
References: <20250625105548.984572-1-qperret@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, qperret@google.com, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
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

On Wed, 25 Jun 2025 10:55:48 +0000, Quentin Perret wrote:
> host_stage2_adjust_range() tries to find the largest block mapping that
> fits within a memory or mmio region (represented by a kvm_mem_range in
> this function) during host stage-2 faults under pKVM. To do so, it walks
> the host stage-2 page-table, finds the faulting PTE and its level, and
> then progressively increments the level until it finds a granule of the
> appropriate size. However, the condition in the loop implementing the
> above is broken as it checks kvm_level_supports_block_mapping() for the
> next level instead of the current, so pKVM may attempt to map a region
> larger than can be covered with a single block.
> 
> [...]

Applied to fixes, thanks!

[1/1] KVM: arm64: Adjust range correctly during host stage-2 faults
      commit: e728e705802fec20f65d974a5d5eb91217ac618d

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



