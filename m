Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42709CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 16:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=naXrlRhLiRbDnpo10qpIe7/CpoBph78T/jYLJIyQ0d4=; b=mtV3EvStqxwADHnzjoINlLegz/
	2KAWMJKqRqoercI7OSbJAGfxh7OsUf1XG4+v0+VaMbfvmjdH6Xrvtt6U7HTIdeYuS4wiOrSb+OuGh
	5fSMv6OHbX6fl89C/jCAX6SexeYoBjySFOXyDEqg47jCZmi3+fgF8E2dURvsQp9sQY2IjadCdnrWU
	F6c6fSNa0iNzzF47VRmThzU1l9xBAVMPn5gF9AR/j+vZB8rTX7FeCHcaugoLn8Ik4KburG95WIfgW
	XpmaJfEW8Cp7pb7Wt1Y3vDiN7Sr4F8yGLIlORd6yCvq7XtdGrlKWme6y5KWjmm+PrvMOncj1taz8j
	Jm/6frHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEVQv-00000004S0J-1ize;
	Thu, 30 Oct 2025 16:23:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEVQu-00000004Rzq-0CwM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 16:23:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 30AC0620E0;
	Thu, 30 Oct 2025 16:23:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 836C0C4CEFB;
	Thu, 30 Oct 2025 16:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761841406;
	bh=3oHW4EGzpi0IVzeps7hkcRmILdKRMCZknLPtO6MrMlk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IdCOFcwRQsPn8kKg0D46Mw2N6hltPH94r5uymscS6Qpm8ocEtO21Adt+KsxoqB4gt
	 P9OYnBJdxOGVO3H53IQYI87EXHSCWnqdEtxtrp4BALjUEwkxLoHkOIaQBiYXwasfrz
	 JAFCm1JZWW0v0Zp7lAM0BaOpCqer9WZsepK7GXAoKTVEu0qROQj/g2ZLpreinMySCW
	 Kkc+hRTsu+J6cGZabzI3AWDolw4NPMJC0+fCDdTJMdWQYOAGVctz+vUvkQvWTOkVHo
	 uxgN7F02v5VMNezCiNS1zieHCGeIfmt4HCs4NjL3Gbkx4sO/fjVasbS+vitPTecQiZ
	 l7LRQrFvkIv8A==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vEVQq-000000013A5-2eZL;
	Thu, 30 Oct 2025 16:23:24 +0000
From: Marc Zyngier <maz@kernel.org>
To: Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: selftests: Add SCTLR2_EL2 to get-reg-list
Date: Thu, 30 Oct 2025 16:23:21 +0000
Message-ID: <176184140111.2037675.2110055805883530232.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251023-b4-kvm-arm64-get-reg-list-sctlr-el2-v1-1-088f88ff992a@kernel.org>
References: <20251023-b4-kvm-arm64-get-reg-list-sctlr-el2-v1-1-088f88ff992a@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, pbonzini@redhat.com, shuah@kernel.org, broonie@kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Thu, 23 Oct 2025 22:19:29 +0100, Mark Brown wrote:
> We recently added support for SCTLR2_EL2 to the kernel but did not add it
> to get-reg-list, resulting in it reporting the missing register when it
> is available. Add it.
> 
> 

Applied to fixes, thanks!

[1/1] KVM: arm64: selftests: Add SCTLR2_EL2 to get-reg-list
      commit: 92e781c93ebe75e39ecdf78fb8ef1fdf1b63a9f8

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



