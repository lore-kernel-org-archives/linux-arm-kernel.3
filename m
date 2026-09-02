Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E4C0C624D4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 16:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fE1q0U38xuL0deaYyC/F9213t4XUXm+oxD6nNaDgw4M=; b=OMb71b8yLZeKaqtC0+3Dza0JWf
	39M6xjU/wFXQxWs3fs9tgxCsN8cl66mRkNEQebruP+vf8lWhblyvcIFj/8Jr6N/M1pb2UK7jff3wD
	+KANw6c7SLiduMZ6QL4/DyT+0fs7MUYiScczujavs/m423sXOtYE1Z3Qs2eZ9qZqw2Ka/r94KUFUq
	0RRz9U4TLGSOPb6BSao9PiZ6s485T1gKmQoV5pYD5h73fL710vGoI30Yvntcu3B7E26/vSEgOwAGP
	BqtmvzSVj/zyOq4rn5014tRGbH4fyGvIE0iRPMOzEfv4fMgSIpjajx0Q9SXU1o78RUVnDtSlKPgck
	ZfoVX1tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1ns2-0000000FCqY-13eV;
	Wed, 02 Sep 2026 16:31:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1nrP-0000000FCjs-1Mlc
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 02 Sep 2026 16:30:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=fE1q0U38xuL0deaYyC/F9213t4XUXm+oxD6nNaDgw4M=; b=N79NzX71LZ+K9qg6NIG/MRM6vl
	5E8NAufdiqlLXM1seey8BHNGHCC3j5eELnZQwvp9pNEhlOnn0VDRgSbpK3iL/QOxccpK/KOmPU4gU
	9Gyqq//RW4f6UNtEHee6FrF7VWZez0P4AKXHTLZjuQVlWOEeANkLy9FWY8mixFmdZZSIrw6xBc/mX
	s53vxalrglOZK4XmzHiTKxfYaTVEum/1UyyrtvS6yF7R8Fxm6GqPISevUb5L8nc07vsW/AceZnGYt
	kpzVtpk89XOvqspYHZXAK5d/nTZR0Yq+3KJt6gRdf7xnaSPBlAoInVqiWTlPcPDbMqERFYhI7m8f1
	Ga5FQk8w==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x1nrL-0000000CCTE-46Sd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 16:30:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DF5AA165C;
	Wed,  2 Sep 2026 09:30:41 -0700 (PDT)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6869C3F882;
	Wed,  2 Sep 2026 09:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788366645; bh=RMlvZ3YXuMVOhDDXeCBDqAOcnoat3xP4LQ6OtgGDeVU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=B3dcRLnP9L3Xl5v7fW2zVaoKGzwYrvoHWWhLFlBC/dhW0ySfGu5cfAV2cbd5CTvqT
	 ul/ErXJPrAOvS2Io7nT7Bzc44tjNjRjpyKaaJtL5I0svvKQD8irUx9UC6wTIboyRKT
	 T67/R/0ZABmzV/q+RjI7heGlyWPForXik3k3Cil4=
From: Leonardo Bras <leo.bras@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Leonardo Bras <leo.bras@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Peter Maydell <peter.maydell@linaro.org>,
	Wei-Lin Chang <weilin.chang@arm.com>,
	Yao Yuan <yaoyuan@linux.alibaba.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v20 04/14] KVM: arm64: Ensure GCS memory effects are visible
Date: Wed,  2 Sep 2026 17:30:20 +0100
Message-ID: <aphPHJsdV4HWFjpg@LeoBrasDK>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260901-arm64-gcs-v20-4-f31750bdfadb@kernel.org>
References: <20260901-arm64-gcs-v20-0-f31750bdfadb@kernel.org> <20260901-arm64-gcs-v20-4-f31750bdfadb@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_173048_509070_445B3D0E 
X-CRM114-Status: GOOD (  19.94  )
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

On Tue, Sep 01, 2026 at 10:47:02PM +0100, Mark Brown wrote:
> In order to allow efficient implementation of GCS implementations are
> permitted to do GCS specific caching, with barriers implicit in stack
> switch operations and GCSB DSYNC as an explicit barrier.  Since we do
> not use GCS in the hypervisor or host kernel the hypervisor cannot rely
> on any barriers being present in vCPU context switches other than those
> it explicitly inserts.  Add explicit barriers when loading and saving
> vCPU state.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> Reviewed-by: Yuan Yao <yaoyuan@linux.alibaba.com>
> ---
>  arch/arm64/kvm/arm.c               | 7 +++++++
>  arch/arm64/kvm/hyp/nvhe/hyp-main.c | 7 +++++++
>  2 files changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 8b080804bc90..52f53f682e6a 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -755,6 +755,13 @@ void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
>  			vcpu_set_flag(vcpu, PKVM_HOST_STATE_DIRTY);
>  	}
>  
> +	/*
> +	 * Ensure any GCS memory effects from the outgoing vCPU are
> +	 * visible elsewhere.
> +	 */
> +	if (kvm_has_gcs(vcpu->kvm))
> +		gcsb_dsync();
> +

Makes sense as previously discussed:
Only gcsb when leaving the guest, if it's possible the vcpu will be 
migrated somewhere else.

>  	kvm_vcpu_put_debug(vcpu);
>  	kvm_arch_vcpu_put_fp(vcpu);
>  	if (has_vhe())
> diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> index 9a3b92e626ad..534db037c5f6 100644
> --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> @@ -261,6 +261,13 @@ static void sync_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
>  	fpsimd_sve_sync(&hyp_vcpu->vcpu);
>  	sync_debug_state(hyp_vcpu);
>  
> +	/*
> +	 * Ensure any GCS memory effects from the outgoing vCPU are
> +	 * visible elsewhere even if the host skips syncing.
> +	 */
> +	if (kvm_has_gcs(hyp_vcpu->vcpu.kvm))
> +		gcsb_dsync();
> +
>  	if (pkvm_hyp_vcpu_is_protected(hyp_vcpu)) {
>  		host_vcpu->arch.ctxt = hyp_vcpu->vcpu.arch.ctxt;
>  	} else {
> 

sync_hyp_vcpu() gets called only in handle___kvm_vcpu_run(), just after 
__kvm_vcpu_run(), and outside of the main loop. So it makes sense to gcsb 
here.

FWIW:
Reviewed-by: Leonardo Bras <leo.bras@arm.com>

Thanks!
Leo

