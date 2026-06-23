Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6F3ACDB46F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 13:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=meWB2memLOKnqS1ZBeDjChQ2kV5a6g9aSLarvrxbNlY=; b=Uyg2rLxO5Ccs8cqYppQM3M+pmu
	z8/4Yn5LK1eSYPQjgJB48zt/5JIgNZs7L6wnT4OP58lhDr/cDz3ULlQTKfWL9ASDAbiiQzigfqksM
	My+OGvvbrCMMqaHrVCCSxAYITpR8T0yYpKI+pPaxtP0hNO2ciSLIcH/EVoRGGoO8thQlglfypq6aU
	YZIeHsRozY/NnXnhIAxZ/J4yMJLQqZVGldRVBlckUpKrl8IZSB7yIQh0S8bX3NUw4LfYO9MXDpzTx
	63VZcgjHrvzScefljONgkVSsH3kG3CX3jekSXbxIaUVotEjrDfPT8AWXIsvM0i4hKrmfpezQqIAyE
	O4vWbjyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc1Z7-00000006NN4-2jDt;
	Tue, 23 Jun 2026 13:53:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc1Z4-00000006NLn-2hJG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 13:53:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DCC1C60120;
	Tue, 23 Jun 2026 13:53:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9346E1F00A3D;
	Tue, 23 Jun 2026 13:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782222801;
	bh=meWB2memLOKnqS1ZBeDjChQ2kV5a6g9aSLarvrxbNlY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=B7yv3SdDMwZTMmLqlpQQZn+9m3exZhTS6zIHORCh2+CuI2ZlnZnVis7V9XeLQeROQ
	 u1Rm1S6cS64kqPv+Gyxe1E7T8GG4wsaGd11+hCjXGUBOGoM6LqiBGZhiYajgHlc2jM
	 KFM9HtAV1kA00/NY4p76YnF+FJMyDndb2PFji5ATK3TGCon3rYo3dOZtcWzTAKH9R1
	 LvazuWcGZoPYEQD+amCpgKJAG4bmVVsL/LeoYunciOrnOBHsjKm9GzhMAYMWhuP/aH
	 aI1vFQEOtpOO02iU5p/5HPeN+/K3Jl9Wwc9zgpBv2BATi7N4XGrAWEUinjWsoXC7up
	 rs5paEi0z5uBg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wc1Z1-0000000FJ2G-36BW;
	Tue, 23 Jun 2026 13:53:19 +0000
From: Marc Zyngier <maz@kernel.org>
To: Oliver Upton <oupton@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fuad Tabba <tabba@google.com>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>
Subject: Re: [PATCH v2 0/7] KVM: arm64: Fix missing ESR_ELx.IL in syndrome injection
Date: Tue, 23 Jun 2026 14:53:17 +0100
Message-ID: <178222278589.523236.13973129583138292315.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260618121643.4105064-1-tabba@google.com>
References: <20260618121643.4105064-1-tabba@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: oupton@kernel.org, catalin.marinas@arm.com, will@kernel.org, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, tabba@google.com, joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, vdonnefort@google.com, Sascha.Bischoff@arm.com
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

On Thu, 18 Jun 2026 13:16:36 +0100, Fuad Tabba wrote:
> After sashiko caught the missing IL bug [1], I did an audit of all ESR
> syndrome construction sites in KVM/arm64 as Marc suggested. This series
> is the result of that audit.
> 
> The ARM architecture mandates ESR_ELx.IL=1 for several exception
> classes regardless of instruction length: EC=Unknown, Instruction
> Aborts, Data Aborts with ISV=0, and SError. For FPAC (EC=0x1C), IL
> reflects instruction length, but FPAC can only be generated by A64
> instructions, so IL must also be 1.
> 
> [...]

Applied to fixes, thanks!

[1/7] KVM: arm64: Set ESR_ELx.IL for injected undefined exceptions at EL2
      commit: daa71eca24fdfb43029830bd57ddaddf70c59b23
[2/7] KVM: arm64: Unconditionally set IL for injected undefined exceptions
      commit: 1d695dc827957e9570d1b56abac1250d2d13bf0c
[3/7] KVM: arm64: Unconditionally set IL for injected abort exceptions
      commit: add40af98b34764ff5603dce297160fde12d784c
[4/7] KVM: arm64: Set IL for injected FPAC exceptions during ERET emulation
      commit: a52d6d68ad30374dd794bff300d8538e35ee49a8
[5/7] KVM: arm64: Set IL for emulated SError injection
      commit: 7514f1785d526207af8512cc6ccb1c35c5c61767
[6/7] KVM: arm64: Set IL for nested SError injection
      commit: a69412287a33c931dca9e48d30c0dbf8cde0ffe6
[7/7] KVM: arm64: Set IL in fake ESR for pKVM memory sharing exit
      commit: cbe2278aa3dd6832c544782c6cfed1fbc1f71a42

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



