Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D31CAEDF172
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Feb 2026 14:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CCdLVc9rOMgVc47DwAD9zaEsYL19CGfVcPedPzJ99SQ=; b=Imi8SSmb3Fb0rQWrJxXVD27Xth
	U4Z/OoHI5PqVdR+7HUaoFar21dcdNfNwlxLcQbpN8gXEPl0umMkKzM8Xi3lDqSUhIGrjN0tekjyQ0
	X2PqX1Hgt7kV5bTy7Jd4TINm0NBNTAoV5i1vMuhI9SErZq0ewJ7DB9o3k/rtrKFPD8zX1M3d3+n1h
	RhxwToqbTxxmaT+iopsy1rjd2lLc3O9PsmRFMxgxhPTg4LBicWaVkPrAExgA0ZRvYH0y8yxhH5Qpy
	0hNMTXcy+GGMPJ0C9/IMM7YV0vKNz4mqvvAqaloj7APvMZFFxW8LB+3S1heLwVqxXMo6OWOAqTD9s
	E1m+knIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqucq-00000003aGe-2Ypa;
	Fri, 13 Feb 2026 14:58:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqucp-00000003aGO-0kkA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Feb 2026 14:58:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F04706001A;
	Fri, 13 Feb 2026 14:58:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0A7FC116C6;
	Fri, 13 Feb 2026 14:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770994709;
	bh=a1VABnZngA4STd31yo3YpGNkB/nSTL3k7/EUbnDUuX4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BmWDoQfMXvwoMpDQnT0qo95sgLPwmcQFWK5jRYNRISQh/kuuKyAgtCXKMEOQTO3RG
	 d5/UL4eSLVcXTxTntoO4Fhi9s4TQVUnv/muUK5AlRx+Em2LpJx8D8camQjQAkxO0H6
	 MkxBGn6DpyoW343tdRFWLQB/KQ0uFnKq0x999ZX4H6hQN1y0j8FCkXRMZHj5wBVK5p
	 jF5poC5wR8J3kAI2GCbbkMckPT7YzzbYkjN/lATW7DAs2gmAMdTQ9GaHbagnRD/qOP
	 hKSumNH4pffUzhWIPG0us74MWcourR8Yt4HeYb+EQYWW998aDGyo8zvCuNmwkuRjlz
	 QnTCvMQRRWfNA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vqucl-0000000AuM4-244w;
	Fri, 13 Feb 2026 14:58:27 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Fuad Tabba <tabba@google.com>
Cc: joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	stable@vger.kernel.org,
	Oliver Upton <oupton@kernel.org>
Subject: Re: [PATCH v2 0/4] KVM: arm64: Fix guest feature sanitization and pKVM state synchronization
Date: Fri, 13 Feb 2026 14:58:24 +0000
Message-ID: <177099469863.1792134.7316507430953466702.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260213143815.1732675-1-tabba@google.com>
References: <20260213143815.1732675-1-tabba@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvm@vger.kernel.org, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, tabba@google.com, joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, stable@vger.kernel.org, oupton@kernel.org
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

On Fri, 13 Feb 2026 14:38:11 +0000, Fuad Tabba wrote:
> This series addresses state management and feature synchronization
> vulnerabilities in both standard KVM and pKVM implementations on arm64.
> The primary focus is ensuring that the hypervisor correctly handles
> architectural extensions during context switches to prevent state
> corruption.
> 
> Changes since v1 [1]:
> - Moved optimising away S1POE handling when not supported by host to a
>   separate patch.
> - Fixed clearing, checking and setting KVM_ARCH_FLAG_ID_REGS_INITIALIZED
> 
> [...]

Applied to fixes, thanks!

[1/4] KVM: arm64: Hide S1POE from guests when not supported by the host
      commit: f66857bafd4f151c5cc6856e47be2e12c1721e43
[2/4] KVM: arm64: Optimise away S1POE handling when not supported by host
      commit: 9cb0468d0b335ccf769bd8e161cc96195e82d8b1
[3/4] KVM: arm64: Fix ID register initialization for non-protected pKVM guests
      commit: 7e7c2cf0024d89443a7af52e09e47b1fe634ab17
[4/4] KVM: arm64: Remove redundant kern_hyp_va() in unpin_host_sve_state()
      commit: 02471a78a052b631204aed051ab718e4d14ae687

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



