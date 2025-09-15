Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E303CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 12:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nXHXQj4UGcmKnWBUkQirE5z5w+eHHgyz+v/aNrmeWic=; b=P+aI0EO1AHB3r0fgpLsW6t2/b+
	WmuqGnpNcJAQWtadyrDUdKsmbFO9eKadP7UljqGQhpSJeWC9JGHpKm8saOE4ccdCl6sLu/CPioAlK
	0ysvhsrp7X6HRBFdYHjzT2SWrDKhAkqRYkgQB0sQGyq2cfmCBaPXaK2b7wsv/QhwtCnCS9sN7SFM0
	+sTyXE2VLRBl+TT67Xem0IyYiLjNE/kzWeYvxizANTilwusvmhmzSiu0L8kzMN0YLVwPtNffE+vsA
	MbLqSMvNdsim4dRbBvkCyvcR8YXRbDQoEkXmxWrGn9hlftKCpNgl+oTsQlUh/fxb9hux53FrzBgNJ
	sCkNsYkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy7zl-000000044RJ-36I2;
	Mon, 15 Sep 2025 12:07:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy7zk-000000044Qs-054G
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 12:07:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B182A40827;
	Mon, 15 Sep 2025 12:07:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BEAFC4CEF7;
	Mon, 15 Sep 2025 12:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757938063;
	bh=05ALcJgejdF5mIHtoaH3aZBVq91WR4W7mnRP5XLeWwk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oxZJ1u4nCXwsus+hEae+/D/Vw437CbHUh2kp/YLZ0ci7MTEurN46y3GQq8I54huSi
	 +Jy6KObOJLT3Le8GSA8pW/jgdtbI7tzyYvoa52HVaLSsG6TorJxVY5h7PP20q2x7zq
	 8R8zuSZZ97ppsiBXHAdLJzjVuZtvwfWNtTFnS+nReE5znOvrzS7SgBoOPGExPbF+zD
	 74fYWwfxLk8/OQPYzvzMbl+Fh3q2NRxALAAkvTi0HEJZGuQkLJcrVtVGBeAwovhDgq
	 FOXazbFpFcPtR7WMVbyGpW1E5gmcTZ9rPlR1mCzhLKKg/+0Dt2++uJdmcBA6aDwMqc
	 1pn/IDVQcaX8Q==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1uy7zh-00000006Mst-1Sx1;
	Mon, 15 Sep 2025 12:07:41 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev,
	Mostafa Saleh <smostafa@google.com>
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	oliver.upton@linux.dev,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	perret@google.com,
	keirf@google.com
Subject: Re: [PATCH v2 0/2] Dump instructions on panic for pKVM/nvhe
Date: Mon, 15 Sep 2025 13:07:36 +0100
Message-Id: <175793804436.660835.10602448198623077028.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250909133631.3844423-1-smostafa@google.com>
References: <20250909133631.3844423-1-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, smostafa@google.com, catalin.marinas@arm.com, will@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, perret@google.com, keirf@google.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_050744_076796_901B3037 
X-CRM114-Status: GOOD (  10.78  )
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

On Tue, 09 Sep 2025 13:36:29 +0000, Mostafa Saleh wrote:
> This small series, adds support for dumping the faulting instructions on
> panic in pKVM and nvhe, similarly to what the kernel does as follow:
> [   12.012126] kvm [190]: nVHE hyp BUG at: [<ffff8000811c5f64>] __kvm_nvhe_handle___kvm_vcpu_run+0x4/0x8!
> [   12.015747] kvm [190]: Cannot dump pKVM nVHE stacktrace: !CONFIG_PROTECTED_NVHE_STACKTRACE
> [   12.016044] Code: a8c17bfd d50323bf d65f03c0 d503245f (d4210000)
> [   12.016082] kvm [190]: Hyp Offset: 0xffeff6887fe00000
> [   12.016325] Kernel panic - not syncing: HYP panic:
> [   12.016325] PS:204023c9 PC:000f8978013c5f64 ESR:00000000f2000800
> [   12.016325] FAR:fff00000c016e01c HPFAR:00000000010016e0 PAR:0000000000000000
> 
> [...]

Applied to next, thanks!

[1/2] KVM: arm64: Dump instruction on hyp panic
      commit: 92b7624fe052ffb0b7b70d96cd514e02e91664a8
[2/2] KVM: arm64: Map hyp text as RO and dump instr on panic
      commit: 6f1ece1e868839cf81a28c77e19420ff57df7ecf

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



