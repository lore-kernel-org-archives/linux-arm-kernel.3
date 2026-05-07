Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D17D6CD3439
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 13:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ns/a6A5OfHZ9FJw10SrmHZd5BFniI+8KztNlf9kJGbE=; b=H+S4nxwW1zNERu1rz7jjCdkFpL
	7ZcrpQiW84o7cM3s3Q8CmJPh/AKx2oU06nahT10LDZ256fBvaXsukWlHQcQJHDydx/mIJvGpQQ6fW
	iYFp7GJguvfckHLMIZXBM7TXLNN4xklX12sBGnKLO4upyQ/4U8xUFrX1+kwN9GM+6O0P0WNepRKLf
	mQFF8wxhnh8ogq1Q5XCBxgKByGgnxA651kbugJQNwLTUAnM90OAWWdCmrg4B7pfkpZk16laQVytTe
	pI3wF81WL5gRNIGBtuJhngKftSTyjulXadE7kSNU+X+u9AYg9dXk3f4XQBWhkq9DJ6uBDOglHcDY5
	HGPMIaMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKyeM-00000003tCU-2hfc;
	Thu, 07 May 2026 13:20:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKyeJ-00000003tC4-3xpE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 13:20:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 378D744127;
	Thu,  7 May 2026 13:20:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11717C2BCB2;
	Thu,  7 May 2026 13:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778160019;
	bh=36ZswlSdEoa6CeQfZEQN8KqozyQBxq2eB7Tc0h/yYIU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=B8HSypZiCPj9qsm8/i8LQ4YAD7nehVRteknpw9ph2arJnL2pPxB3EBmL3dAGahj9j
	 sZCTrYzPYsJOJY9lBy5ozrsDHwGQb3KkOUMzb/VDkwDPdRZfPH370snZJWPdDAfp/3
	 OvCtvvkrU/DtmwViqSqTnUCIq4uIJUdI+zMb6A8/wAinaOWvKJuFkRwGQdiVi/X1ps
	 oeUL7Sku6N7VAbfQcyI55LL+7j6vCP8GaVvHC8bcNAlI8i9oeEatjdfbFr9XZqEyHb
	 95CaKZp8yIJwE0UfTY4ab21x2T9drfmD//DwvU1HLGDnHWS6gNknjuVh45WFWLV7UY
	 Nj8i5My6W4B3w==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wKyeG-00000000dmL-3G5r;
	Thu, 07 May 2026 13:20:16 +0000
From: Marc Zyngier <maz@kernel.org>
To: Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <tabba@google.com>
Cc: james.morse@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	qperret@google.com,
	vdonnefort@google.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	yaoyuan@linux.alibaba.com,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 0/6] KVM: arm64: EL2 synchronisation and pKVM stage-2 error propagation fixes
Date: Thu,  7 May 2026 14:20:13 +0100
Message-ID: <177816000554.2904218.14736928674688744601.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260501112149.2824881-1-tabba@google.com>
References: <20260501112149.2824881-1-tabba@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: oupton@kernel.org, tabba@google.com, james.morse@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, qperret@google.com, vdonnefort@google.com, catalin.marinas@arm.com, will@kernel.org, yaoyuan@linux.alibaba.com, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, stable@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_062020_007221_93F6EF43 
X-CRM114-Status: UNSURE (   8.95  )
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

On Fri, 01 May 2026 12:21:43 +0100, Fuad Tabba wrote:
> V2 of the kvm/arm64 audit fixes [1].
> 
> Changes since v1:
> 
>     Patch 1 (SCTLR_EL2.EIS|EOS): Fixes: tag corrected to 0a35bd285f43
>     ("arm64: Convert SCTLR_EL2 to sysreg infrastructure"); the commit
>     message now explains that the conversion auto-generated
>     SCTLR_EL2_RES1 to UL(0).  Code unchanged.
> 
> [...]

Applied to fixes, thanks!

[1/6] KVM: arm64: Make EL2 exception entry and exit context-synchronization events
      commit: d7396a72eae795d7f968fb451237b6ac1616d712
[2/6] KVM: arm64: Guard against NULL vcpu on VHE hyp panic path
      commit: 300fac4cc266b7782d88602b6b6a7faf31ce6405
[3/6] KVM: arm64: Fix __deactivate_fgt macro parameter typo
      commit: d4d215e5b81ba5acb17752cab12c514a8062bada
[4/6] KVM: arm64: Seed pkvm_ownership_selftest vcpu memcache
      commit: 5130d450d1488e62e1b5310f41910a3c7320e827
[5/6] KVM: arm64: Pre-check vcpu memcache for host->guest share
      commit: 8234409ffb656970e2f5b29e416f041419980bef
[6/6] KVM: arm64: Pre-check vcpu memcache for host->guest donate
      commit: effc0a39b8e0f30670fe24f51e44329d4324e566

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



