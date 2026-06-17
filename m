Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E24BCD98E4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 12:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gI37bWtHllnRBBGUGfmHhE8TRqLaBhOaYW5Wb4FZGRk=; b=dm6wW46pw+pKKX2twLY6KYHesA
	PjGrq4OW5FHyD2AWlzHfDI/uFrZGgYxLPSADBdduAzzhxSTKDdixwn2BPaJO8V3QiHKY2DjUibvst
	PyA0w563CyY//IeYmkm2mPx9gt2Frp7XiwKx6vvC+PkO5lD6Ev6k2aawrF/60q1SrQm7Zk2xD9ud3
	j8vI7rDDpYJjtcZX8emHR9xHOA4FLbuHsoFL4j9Ai78efPCLFI9VyKJsTx0SKeEUvyrOVg/u6mFko
	Ib4LV+237fMzVroBrWqH1nLU2TJnVahqAQJhTmx4HkC7QxMmYlo8A5q07uWIW4v0RW5J5Ah0iDvbd
	hpF5zpVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZpa8-0000000HMB4-0Cgm;
	Wed, 17 Jun 2026 12:41:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZpa7-0000000HMAx-07Z2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 12:41:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 404BA6001D;
	Wed, 17 Jun 2026 12:41:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E70BA1F000E9;
	Wed, 17 Jun 2026 12:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781700082;
	bh=gI37bWtHllnRBBGUGfmHhE8TRqLaBhOaYW5Wb4FZGRk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=j8rdqYQDS88hkg06mnXbShq1Rfj1pe5laKALF1IEXFrMRrAoohE6tfs0dNaF1MSQH
	 Pi4/uOnztAEsakVFzU+SABfHKM72558O7ZdlWYXgNTBSAgR8gSCXRs5W34ejOnAKtS
	 xJIqfh6RuORXLPMCVPSFHToRRCya/t9Y2QjDFFzlP5oiPkfFyw8TSQxc429iHo0nap
	 GTCPlZsKZ30mvereXHWM71MXVt7lzP0d554DLGacHgWcBhkbEi4jl1FvjOxCPuvdl3
	 B5St1R136wB36X7TJ2wpNU0pprZxjinz70Z6N4WiHcwJKsOzaurTB8SzhQMuOCYzEO
	 g6PaJ+ADARYfQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wZpa4-0000000DgLp-09VF;
	Wed, 17 Jun 2026 12:41:20 +0000
From: Marc Zyngier <maz@kernel.org>
To: Oliver Upton <oupton@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fuad Tabba <tabba@google.com>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Andrew Jones <drjones@redhat.com>
Subject: Re: [PATCH] KVM: arm64: Sync SPSR_EL1 when injecting an exception into a pVM
Date: Wed, 17 Jun 2026 13:41:17 +0100
Message-ID: <178170006643.3087598.16279897743346268565.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260612113414.1022901-1-tabba@google.com>
References: <20260612113414.1022901-1-tabba@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: oupton@kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, tabba@google.com, joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, Sascha.Bischoff@arm.com, drjones@redhat.com
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

On Fri, 12 Jun 2026 12:34:14 +0100, Fuad Tabba wrote:
> When pKVM injects a synchronous exception into a protected guest, it
> re-enters without restoring the guest's EL1 sysregs and writes the EL1
> exception registers to hardware by hand: ESR_EL1 and ELR_EL1, but not
> SPSR_EL1. enter_exception64() sets SPSR_EL1 (the interrupted PSTATE)
> only in memory, so the guest's handler reads a stale SPSR_EL1 and
> restores the wrong PSTATE on eret.
> 
> [...]

Applied to fixes, thanks!

[1/1] KVM: arm64: Sync SPSR_EL1 when injecting an exception into a pVM
      commit: ec40342aaca8162bc8ab2607076535ebab1838b8

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



