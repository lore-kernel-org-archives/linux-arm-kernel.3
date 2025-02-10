Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C967C0219E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 16:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d9FAiNTMmSU1a/jusfRV6jgHMI73kO7mSYFgNnf+ESo=; b=xsC3LdkGZmAVN4swvpbxdUAXSb
	s5BeJ/uQYfsnrEQbmxvPsnCh7KZkIhpOQXjyxomSpMt/YWrtiq7DeMgH9qJYn6z+r6Lu4dWP7RlRe
	/wxUqLdM3eOSKRb4QAqZILJkGZ1fdDYi1DdRiCZ9g2NA8KFMKLpWbAspkH2DgNCS+QlUypqtVrRc8
	ZUfSWo4J5EoKZZrRfxZf6ukwMcMbgz1aiUqEphggO0ZkogT0eSRHYv/9SnKDkoOGCrHvyRTtbwZt5
	x5AVRm+lfOrLCWo0UTYdcQqh8ks1S+ytv0gBNMSzhIZp+yBVaG2y0HVHOXv8LhuTPsvxca6PDXrWN
	FY0tJRqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thWUT-00000000U3N-1D5N;
	Mon, 10 Feb 2025 16:18:33 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thWT4-00000000Tmv-0wKO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 16:17:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EBF3FA41924;
	Mon, 10 Feb 2025 16:15:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD192C4CED1;
	Mon, 10 Feb 2025 16:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739204225;
	bh=ErKSwxLO50h+kSbz6XppUCkzQZr/MW2XaZANa/yMCtQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TL/2g8ta3sY5fyUilVWWgsIHHDlVT/P2Uh3SNh3v0jTa86qEFPoMWb95H/eG4FqUq
	 I43yjvvKLQi4I9ZEmsERBnHAxakT/I6ipauMfGbzINnyhFpHOqxIR3qoSAL6r2PK3L
	 RNrlR9NGmorxA+N7kLfCBTwRR2DcWLCnILqk2cQ+TigGhMPalJUg+JDxavGwjqEhe3
	 TP3KV2QMvADzQ1HzNFn5KQ24HsXlkj2sfcTD/kwJ8hxZ+eG1fyrZRTKYoeyuJ5uvaN
	 GCs+C5SlA0sontLmupDo2p0NtZgr3BrNh5mDSwEcmf8exN2WInnlcodvsHjQEdUdag
	 17/Xh6aZmLGOw==
Date: Mon, 10 Feb 2025 16:16:59 +0000
From: Will Deacon <will@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, broonie@kernel.org,
	catalin.marinas@arm.com, eauger@redhat.com, eric.auger@redhat.com,
	fweimer@redhat.com, jeremy.linton@arm.com, maz@kernel.org,
	oliver.upton@linux.dev, pbonzini@redhat.com, stable@vger.kernel.org,
	tabba@google.com, wilco.dijkstra@arm.com
Subject: Re: [PATCH v2 4/8] KVM: arm64: Remove VHE host restore of
 CPACR_EL1.SMEN
Message-ID: <20250210161658.GE7568@willie-the-truck>
References: <20250206141102.954688-1-mark.rutland@arm.com>
 <20250206141102.954688-5-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206141102.954688-5-mark.rutland@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_081706_391019_E89DA26B 
X-CRM114-Status: GOOD (  23.68  )
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

On Thu, Feb 06, 2025 at 02:10:58PM +0000, Mark Rutland wrote:
> When KVM is in VHE mode, the host kernel tries to save and restore the
> configuration of CPACR_EL1.SMEN (i.e. CPTR_EL2.SMEN when HCR_EL2.E2H=1)
> across kvm_arch_vcpu_load_fp() and kvm_arch_vcpu_put_fp(), since the
> configuration may be clobbered by hyp when running a vCPU. This logic
> has historically been broken, and is currently redundant.
> 
> This logic was originally introduced in commit:
> 
>   861262ab86270206 ("KVM: arm64: Handle SME host state when running guests")
> 
> At the time, the VHE hyp code would reset CPTR_EL2.SMEN to 0b00 when
> returning to the host, trapping host access to SME state. Unfortunately,
> this was unsafe as the host could take a softirq before calling
> kvm_arch_vcpu_put_fp(), and if a softirq handler were to use kernel mode
> NEON the resulting attempt to save the live FPSIMD/SVE/SME state would
> result in a fatal trap.
> 
> That issue was limited to VHE mode. For nVHE/hVHE modes, KVM always
> saved/restored the host kernel's CPACR_EL1 value, and configured
> CPTR_EL2.TSM to 0b0, ensuring that host usage of SME would not be
> trapped.
> 
> The issue above was incidentally fixed by commit:
> 
>   375110ab51dec5dc ("KVM: arm64: Fix resetting SME trap values on reset for (h)VHE")
> 
> That commit changed the VHE hyp code to configure CPTR_EL2.SMEN to 0b01
> when returning to the host, permitting host kernel usage of SME,
> avoiding the issue described above. At the time, this was not identified
> as a fix for commit 861262ab86270206.
> 
> Now that the host eagerly saves and unbinds its own FPSIMD/SVE/SME
> state, there's no need to save/restore the state of the EL0 SME trap.
> The kernel can safely save/restore state without trapping, as described
> above, and will restore userspace state (including trap controls) before
> returning to userspace.
> 
> Remove the redundant logic.
> 
> Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> Reviewed-by: Mark Brown <broonie@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Fuad Tabba <tabba@google.com>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Oliver Upton <oliver.upton@linux.dev>
> Cc: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/include/asm/kvm_host.h |  1 -
>  arch/arm64/kvm/fpsimd.c           | 21 ---------------------
>  2 files changed, 22 deletions(-)

Acked-by: Will Deacon <will@kernel.org>

Will

