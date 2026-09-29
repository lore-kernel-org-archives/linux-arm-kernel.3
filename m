Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A88E7CA5FAD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 23:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c34lg2SSqJP/prfJ37melYcw0xJkVhsVpZy4ROI6WNQ=; b=CqpkUoX2pebeBDEvdiMIazpglu
	YgteaNPL2G1udAt448YTryjeaDjjIOPdCvDW1YuiLVneRrpeVnB02fcKMaHjuyLgLMa7J7y6CTPU8
	baTc12+AM1Latz+Yn6AwKa7KhX9NYosWGgGv+w+QzPtHCe+S8qYEgEfcxC7GSjXDBvPGzVnuOg70T
	zKUEJdwGyRftgN3QiEeZ4RdKGHbVaR33vY+t1f0wAKzfDBmvZCuI8SthD+auaMb/VjP2R59qzp9Ie
	Jjved/dTfce737uoIbXrH86BB8reBlGO/zHzMu0tuj/gGFvJnXRamIw3J/4aUX74uJP3Rk1h2jPTm
	cRILYEXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBgqA-00000004k9Z-0aI7;
	Tue, 29 Sep 2026 23:02:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBgq9-00000004k9G-0INo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 23:02:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7719F43CCD;
	Tue, 29 Sep 2026 23:02:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DD831F000FF;
	Tue, 29 Sep 2026 23:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790722944;
	bh=c34lg2SSqJP/prfJ37melYcw0xJkVhsVpZy4ROI6WNQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BkBWs7S7hjdEq6uQaiSmWQOfcDATgPWULZ+J7guuGa/CU28Q6gfTkC+xbHVOa7zs7
	 nH8RqrxpXqmeeiv4pA4MwgjKL8ROwIfLjpax4MKm8UKqaheqx447y8hifovoEIGaaT
	 PhurxWdQI7W3gaqoym/sj5LVd3M5OZLKKQXCtfGNBUYC6g2q9k2LH4lt4taA1+Xp8T
	 PNfVW6O+KTAbYQQsF1s0A6bROVcYg/8PQr/Q64mS1FJCGaLdVpXbbCFVygH/CLR0Tf
	 wkq3K5hcLAS9B+jUmby2sJPK6crtqvW7RCrMCMO27wbmLp7wsCKNAvPS6wUog1sIUV
	 mn4T4WaGnv1Cg==
Date: Tue, 29 Sep 2026 16:02:23 -0700
From: Oliver Upton <oupton@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>,
	Peter Maydell <peter.maydell@linaro.org>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Subject: Re: [PATCH v4 0/3] KVM: arm64: ID register finalisation fixes
Message-ID: <arxDf3AHHjKCv6rD@kernel.org>
References: <20260929-kvm-arm64-idreg-final-v4-0-75296dde994d@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929-kvm-arm64-idreg-final-v4-0-75296dde994d@kernel.org>
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

Hi,

On Tue, Sep 29, 2026 at 12:57:57PM +0100, Mark Brown wrote:
> While looking at some feature enablement I noticed that there are some
> scenarios where we can end up with an inconsistently configured vCPU due
> to finalizing configuration based on ID registers before we have blocked
> writes to the ID registers. This series aims to clean up these issues.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
> Changes in v4:
> - Rebase onto v7.3-rc3.
> - Add a lockdep assert.
> - Update Fuad's LLM tag.
> - Link to v3: https://patch.msgid.link/20260901-kvm-arm64-idreg-final-v3-0-a0ffa06fa872@kernel.org
> 
> Changes in v3:
> - Rebase onto v7.3-rc1.
> - Explain why KVM_ARCH_FLAG_ID_REGS_INITIALIZED is not reused.
> - Pull in Fuad's test cases.
> - Link to v2: https://patch.msgid.link/20260803-kvm-arm64-idreg-final-v2-0-d7d7e4efc640@kernel.org
> 
> Changes in v2:
> - Also replace the kvm_vm_has_ran_once() usage in kvm_set_vm_id_rg() and
>   kvm_vm_finalize_sys_regs() with kvm_id_regs_final().
> - Link to v1: https://patch.msgid.link/20260731-kvm-arm64-idreg-final-v1-0-3de2a5616dc6@kernel.org
> 
> ---
> Fuad Tabba (1):
>       KVM: arm64: selftests: Check ID regs are immutable after a failed run
> 
> Mark Brown (2):
>       KVM: arm64: Finalize guest-wide sysregs prior to per-vCPU sysregs
>       KVM: arm64: Block ID register changes after we rely on the values

I'm not too terribly jazzed about testing the relative ordering of
errors in the selftest, but I see why we need to do it. Otherwise,
everything looks good.

Reviewed-by: Oliver Upton <oupton@kernel.org>

Thanks,
Oliver

