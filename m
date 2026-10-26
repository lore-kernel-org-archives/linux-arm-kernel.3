Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85143606A321
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 12:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qx1LL4d2;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iQU6R3b6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=AIVeoWKmdDG0O50BSuUkLwHzb3lAGmVOI3CIZhzvB08=; b=qx1LL4d2GSjKKo
	ErzHYFN8xdBokHQnDHWnYPRxDjh/Vx33M+007HCvfsjRlYamAFWJVnl1khc7oAzLBtPSJ/I0DTtdw
	6ITgG5I7pStIgvoglncgKQiaoFnAmSRvZThPhK//qudcCg0KxTMupPSlC9BUwAbI9dlxbkzsv/PNf
	9IVgOp7WaqrCj5yujIH0be41RHOjtw9MGw9CI7P0cAdMRreNvLy3P9L2knkARIHjkWwVIpcVCtbWl
	xbv0dUKGH0trfP00A5tnuyz0QrDohbttQjmpP5Fq4Izh8jUFBQECSY0HgYk1IyiQvolLHWHSLTJlV
	0p2y1QmdH4Q2XbrntUNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLJOe-00000002RZM-0uGJ;
	Mon, 26 Oct 2026 12:01:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLJOB-00000002RId-1whh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 12:01:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3CD9C43E4D;
	Mon, 26 Oct 2026 12:01:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FD991F01829;
	Mon, 26 Oct 2026 12:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793016079;
	bh=AIVeoWKmdDG0O50BSuUkLwHzb3lAGmVOI3CIZhzvB08=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=iQU6R3b64z5XhJO+GpZwOdayO/fwXpIZnyxxo0QArU8le7Fq5kS5fGQU1dVBSeSNz
	 c1MLuPhl4OWUh9N+9X7Ak9BiQvQNC1tL02I7Vyzn4whBQ9GD4pSTF7EuO89gJ2F7qx
	 QFAgminj5mXZq9MVAW94xz6ePB5efUpmc8OT0Fss7svSlnMDR/vesxgBHZX9El38/U
	 H0Pp6nAAnSFG+ueCRnlrVh7mErmn6DseWdvP124qOxSLwuaWZ9aE0bUTp/EMASN1Ih
	 LCjY2TE0/nX+aKsEo71nCkbPmyJ8aJI6+T/NIAyh7XT22ORwg/BH2O/WJg27twb7gg
	 LQgppIxtZyC1Q==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1xLJO9-00000007Fr6-1ipv;
	Mon, 26 Oct 2026 12:01:17 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Fuad Tabba <fuad.tabba@linux.dev>
Subject: Re: [PATCH 0/7] KVM: arm64: Fix cross-CPU vcpu pausing
Date: Mon, 26 Oct 2026 12:01:04 +0000
Message-ID: <179301587173.2527370.7304328497562968477.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261015100539.1011760-1-maz@kernel.org>
References: <20261015100539.1011760-1-maz@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, maz@kernel.org, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, fuad.tabba@linux.dev
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 15 Oct 2026 11:05:32 +0100, Marc Zyngier wrote:
> This series is a follow-up on what I previously posted at [1], and has
> now grown a few more fixes, and inherited an improvement from Oliver.
> Some of the fixes have already been merged, so what we have here
> serves a slightly different goal.
> 
> As we are simplifying (and fixing) a bunch of vgic behaviours, it
> becomes necessary to pause one (or all) vcpu(s) and *reliably*
> introspect the state of interrupts.
> 
> [...]

Applied to fixes, thanks!

[1/7] KVM: arm64: nv: Move L2->L1 switch on interrupt early
      commit: 21d3b33234ebbb675c2a2a0fa7b12d2d83953d7a
[2/7] KVM: arm64: Move OUTSIDE_GUEST_MODE publication past context being saved
      commit: 1d4ce2901f1e25b06d447c0b02d105d6dd3550d8
[3/7] KVM: arm64: Move IN_GUEST_MODE ahead of state being loaded
      commit: 22b6557ad05bf05c73246f62c19af3e04017270e
[4/7] KVM: arm64: Turn vcpu->arch.pause into a counter
      commit: e64309198eda29415a95113def92aa40196cd422
[5/7] KVM: arm64: Add helpers to halt a vCPU
      commit: 134b6486dd3452d3ac2642b152e8149e7891d962
[6/7] KVM: arm64: vgic: Stop the target vcpu when disabling LPIs
      commit: a1b4bd2c2c262b8094c86afb99364d16ac08cb66
[7/7] KVM: arm64: vgic-its: Stop the VM when handling MOVALL
      commit: b31bce255a009b17c26bcada1f23c15ebc3fbff1

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



