Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 070A7C02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 16:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HE4yjCfgJCVzVJTJmIR+RNCkXRIZf20x5P4RTDl4W0I=; b=KLBbtoICVTA52zdZlMMIVdX4Wh
	COzbUiFYCuSGpWQiUi1DYDipOATQUuYrNNB5eRhHDhpqSo60tapeLMiYO4KQJbtzJMTDXQWhUHD+G
	Npd5fmnwQOspPv71W6PIPuuVTzsCU0L7xM/HYviLkWQ9U4LbIJMQ9qrpY/r+wZAtfJYVV4SrMZk7J
	rWBbd3fwrXljM+so9fFCMaygh6M/c04bs+TvEGCr7JcYCEN387zOfecWx/YzhbkG2N+LAsRAxKl3k
	51nQKZIAp3TbXFumtHKTt1OqO1rzev77AMOj4u2CKGm0j8RlH+S+Xg8AL6NiAsWyR8ZDQIIuDFNtp
	fF2C5V8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thWSS-00000000TYq-2c60;
	Mon, 10 Feb 2025 16:16:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thWR3-00000000TAM-0AMk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 16:15:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E63395C004B;
	Mon, 10 Feb 2025 16:14:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6E4CC4CEE5;
	Mon, 10 Feb 2025 16:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739204100;
	bh=cYJKkYg6JWieggFljG8oREQ6zBfLbDJc0fdZqFCC5NM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ug3dLP8midRAMLXGpFLUPpRbJ4ymdgaeaim0RBgk4tUCzwHF46qCZmwCXVksvc583
	 fiIxYfVWB1PJuFrG9pd69Yfc3luMcm2a1LmhyxxxoekUosgCpxwAEiQxiZVpEAvU6O
	 3Vre5YNYouuWoeUtji2+hrAdbYDbh8H6KhUPg8iUgGNBbszR3KPJKzAPHWaca8wrdl
	 Ca47WRoxISGUgMsFDtxQfM/t+DtbKQfHt2JpSDZTsGrUL+dxJJP6Sjo/clkFI4y2Dg
	 CcYU603vedkauBtC9vYyaexQIgPWyeQvSXNEnX3E2G5zf54qmoTbxvVCQ/U4xuXi0n
	 LmbWX4KeF4wZQ==
Date: Mon, 10 Feb 2025 16:14:54 +0000
From: Will Deacon <will@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, broonie@kernel.org,
	catalin.marinas@arm.com, eauger@redhat.com, eric.auger@redhat.com,
	fweimer@redhat.com, jeremy.linton@arm.com, maz@kernel.org,
	oliver.upton@linux.dev, pbonzini@redhat.com, stable@vger.kernel.org,
	tabba@google.com, wilco.dijkstra@arm.com
Subject: Re: [PATCH v2 3/8] KVM: arm64: Remove VHE host restore of
 CPACR_EL1.ZEN
Message-ID: <20250210161453.GD7568@willie-the-truck>
References: <20250206141102.954688-1-mark.rutland@arm.com>
 <20250206141102.954688-4-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206141102.954688-4-mark.rutland@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_081501_123794_85B6516D 
X-CRM114-Status: GOOD (  15.43  )
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

On Thu, Feb 06, 2025 at 02:10:57PM +0000, Mark Rutland wrote:
> When KVM is in VHE mode, the host kernel tries to save and restore the
> configuration of CPACR_EL1.ZEN (i.e. CPTR_EL2.ZEN when HCR_EL2.E2H=1)
> across kvm_arch_vcpu_load_fp() and kvm_arch_vcpu_put_fp(), since the
> configuration may be clobbered by hyp when running a vCPU. This logic is
> currently redundant.
> 
> The VHE hyp code unconditionally configures CPTR_EL2.ZEN to 0b01 when
> returning to the host, permitting host kernel usage of SVE.
> 
> Now that the host eagerly saves and unbinds its own FPSIMD/SVE/SME
> state, there's no need to save/restore the state of the EL0 SVE trap.
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
>  arch/arm64/kvm/fpsimd.c           | 16 ----------------
>  2 files changed, 17 deletions(-)

Acked-by: Will Deacon <will@kernel.org>

Will

