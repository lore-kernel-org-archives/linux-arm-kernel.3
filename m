Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FE4FC3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 11:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pwLly1E9fRrPlWe71xmVJNzf6mBqfIkSuqOIpsE3upQ=; b=lj+aO1NdpvvkF3SCppCucGLXPo
	ZjP6SfKmFYLt7L9aVAcicH6UnqVtp+OG/QzMXtN7H10KYBKMyxCrW3OpguFW8VRuPpQEwU1lWQ2ME
	sWhy0U3pDy2BJwCB0EBPsIK72rLSBM5liQqWa/6BV1Fba4aQaX6cZweCWfvzGk+zrfgesxA4+Vqoz
	ChcaLJ6zZY9eJ/rMgFNJEqDC6JyQv08IQ5gmFHEa0RFIkGLklFlbNNad2FmTMQn8LDy6dquthtNDp
	8DacP/jDa7mIL4Y5enQckDkFweEYOP4cLFuG3kyEVD7UGYZar+u6pqP5zrKj5U0FX7nSMT9OWVO5R
	C8ulz4ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIQBm-00000003fR3-1hZw;
	Fri, 23 May 2025 11:03:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIQ9b-00000003fCq-2kTI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 11:01:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E095E61154;
	Fri, 23 May 2025 11:01:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E563C4CEE9;
	Fri, 23 May 2025 11:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747998090;
	bh=i+bBzliGOaU9GAlvZj2GNd3o4IjHCNM5Ha0nUaD4hG0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DJBvNWPgO6j+c/lC7FRIhK7Tdr9pI8++y95+5/ML4j8gWvjVtm3EpovFYPSWqVP/1
	 /al/6zs1VBY8rrFoyKGDzuX6kpqB6cNGfDpf3QT0xRHRSxU2/zYdGQy9L/JBlRIccF
	 2NfEzi9spOyhM8u3A2GeFSW2RVIdM2ReoMdTj5mkU6wTiPW4GrZg2zikOZIisRvJZy
	 GdHgJ5EiaKplUY1dWqocQmafPdGCcMjvBY3zhjdzaHdLexnapuCfUI9En3dD/UTKxV
	 W6W0LHBJTe6QV2KczOeCQfRFK7RmfJD/Djliw4mzX6eFwHiYNQQqf5NFTTuuIH9Gfj
	 TKwfwRpcgOzyw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uIQ9Y-00HYcR-De;
	Fri, 23 May 2025 12:01:28 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH] KVM: arm64: nv: Handle TLBI S1E2 for VNCR invalidation with mmu_lock held
Date: Fri, 23 May 2025 12:01:12 +0100
Message-Id: <174799806252.145825.12198525188454044758.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250521110514.66305-1-maz@kernel.org>
References: <20250521110514.66305-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, maz@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com
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

On Wed, 21 May 2025 12:05:14 +0100, Marc Zyngier wrote:
> Calling invalidate_vncr_va() without the mmu_lock held for write
> is a bad idea, and lockdep tells you about that.
> 
> 

Applied to next, thanks!

[1/1] KVM: arm64: nv: Handle TLBI S1E2 for VNCR invalidation with mmu_lock held
      commit: beab7d058309bfe0460a441b1c73639941e33d38

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



