Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19653C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 17:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/EMqmo2MU1ji3Hlh43bjAmgobqmueLjTp3VIipY0ddQ=; b=rcjjdOKXOCH5qa+tGG+CdyWnTo
	MxuEhr9pzznkuxbWpl1L5kYxMoKCDYGyTje5ElZm5J3Pu+1SCUGKBBRjpM7BTxjmpTPKy1mnpTV5S
	X1U0uLKy1gUOWKUsSP3H4f41E2r9jQKf29cVI5qIFKpCHAfnJDJ53UnfcKx4J+qd3kH1+V+ymFYXs
	NbXKxtHePRf7DU0i1vgOYC2cHA2TE2SyH79hh9FxGjtlxFpykj/TUzdpN7ZfKs3fLbLGzX2e/gPcv
	gGUZ1vXzkFpfUlM0I795uqD0HDlWJnvUvCSVORyMpbJb/slH6DDUYNlgMPUbNn7NARuhIL3L3+CYp
	B1KnVuRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWfAM-00000006H2v-24yE;
	Tue, 01 Jul 2025 17:53:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWcjA-00000005rH4-426K
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 15:16:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A29FE46778;
	Tue,  1 Jul 2025 15:16:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81C6AC4CEED;
	Tue,  1 Jul 2025 15:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751383016;
	bh=EJQJBBlk1v5T+bL6aDyXe5U4Gd/9cKEPuNnqZJJuUwk=;
	h=From:To:Cc:Subject:Date:From;
	b=CvWkxYL8SVhr7on0sWNzcIn3DTjUQJaEHWksMZQGTQ1UoQbykCAfhnbI7+MvHr9R2
	 Y1eUIGrLM7/tSR54eCcf3nKAb1T9TemWKXrqQS34sMsMrs+ZmGlQx9CwTWE1PNOrBK
	 ttrCVMhOTZMduqreendX0w5OyMpoxziqJ2OAxSdGFER/XUaQltAWtwomBwKgfKZX9g
	 DLP+1A1KEc+YPfevkifWkwYQmBB6rRY7rjvYfQAjIFkMtECyr8Q2Ay6/5Lr+/CUUfC
	 3Jvi2UwvpPFynj3uYCwdAK6hgqgZ9/d9RANLXNcQyToTQIUSL1klxF+yJj4KPbS0Ad
	 Skjf4sv9NN7bQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uWcj8-00Bch8-Gf;
	Tue, 01 Jul 2025 16:16:54 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH 0/2] KVM: arm64: Fixes and clarifications for FEAT_S1POE
Date: Tue,  1 Jul 2025 16:16:46 +0100
Message-Id: <20250701151648.754785-1-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_081657_022200_C8ABB663 
X-CRM114-Status: UNSURE (   9.14  )
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

I (almost accidentally) spotted a couple of issues with the current NV
support for S1POE:

- wi->{e0,}poe and wr->{p,u}ov are used interchangeably, and sometimes
  in conjunction -- none of that makes much sense

- The two rules describing WXN are not exactly been applied to the
  correct state

These two patches address these issues (not that it matters much yet,
there is no S1POE HW out there).

Marc Zyngier (2):
  KVM: arm64: Remove the wi->{e0,}poe vs wr->{p,u}ov confusion
  KVM: arm64: Follow specification when implementing WXN

 arch/arm64/kvm/at.c | 80 +++++++++++++++++++++++++--------------------
 1 file changed, 44 insertions(+), 36 deletions(-)

-- 
2.39.2


