Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 241941061B21
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 10:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1P8xMNkjc0V4HS4mhb0CNGRR+s6x/y/3od+1LqXU6qg=; b=QXtoPzsAJ/z1DbNruIJwWWsR2S
	4YyE9ThskupaVpqrEeP+v0WdoWxPrhZJS34MblCVfkPtRSFaz3zSF/9z+/zikWGFYxYM5nY0MdZmS
	wWTp85ElGt6YzoH6pS/76PY5m77s2I12Bg6BVo63v/GvWGmQe48nWGiBY+PDYRBpZhVKNJ/B8RiwW
	op2D3kCENH/fUmd1rTQ7hU2ko/kJQOl1+czLizs2oa7ykleL+ZZ9yCKMTIwZY3taaHO3hTNlttAxE
	JTnBQVYAt476lgVL123hGNyHl4HXDIIXUOJjED5dHtQRlb1EZOHuKq5GUSPkY/M2Mc2GPhB1hSCiE
	ZlFU2efw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7WBe-0000000Cljv-061E;
	Tue, 31 Mar 2026 10:19:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7WBc-0000000CljQ-2RHV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 10:19:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 78351493B;
	Tue, 31 Mar 2026 03:18:55 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 33DA53F7D8;
	Tue, 31 Mar 2026 03:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774952341; bh=LNkgaBupfNB4ugKnElfoJ44h22XXJr16J30q723B68I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dW4blMzh3hdGi0O/UAif71kYDtd9vMsbyLB53ph6vLXiQZkmRV/HJvfXfeRxwTEJG
	 VH/zVYXnni6n7T0IKeGEoD7fbWZ2ZrQSNzyRZehAfykH5TnJZcPP4bH55GKQQxSSdB
	 1E/htMhOcv4ljlwhSqdPrbTcgAlmCQN4SCnmembY=
Date: Tue, 31 Mar 2026 11:18:54 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Will Deacon <will@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Oliver Upton <oupton@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH] KVM: arm64: Don't populate TPIDR_EL2 in finalise_el2()
Message-ID: <acufjq_3NZGdv0hN@J2N7QTR9R3>
References: <20260330152927.26300-1-will@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260330152927.26300-1-will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_031904_659875_2270D291 
X-CRM114-Status: GOOD (  19.34  )
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

On Mon, Mar 30, 2026 at 04:29:26PM +0100, Will Deacon wrote:
> When running with VHE, TPIDR_EL2 is only used for the percpu offset once
> the ARM64_HAS_VIRT_HOST_EXTN capability has been detected, at which
> point cpu_copy_el2regs() will populate its contents from TPIDR_EL1.
> 
> Remove the redundant initialisation of TPIDR_EL2 from finalise_el2().

It wasn't clear to me how this worked for both the boot CPU and
secondaries, since they both call finalise_el2(). How about a slightly
more elaborate commit message, e.g.

| Currently, it is not necessary for __finalise_el2() to configure
| TPIDR_EL2:
|
| * The hyp stub code does not consume the value of TPIDR_EL2.
|
| * On the boot cpu, TPIDR_EL1 is used for the percpu offset until the
|   ARM64_HAS_VIRT_HOST_EXTN cpucap is detected and boot alternatives
|   are patched. Before boot alternatives are patched,
|   cpu_copy_el2regs() will copy TPIDR_EL1 into TPIDR_EL2. It is not
|   necessary for __finalise_el2() to initialise TPIDR_EL2 before this.
|
| * Secondary CPUs are brought up after boot alternatives have been
|   patched, and __secondary_switched() will initialize TPIDR_EL2 in
|   'init_cpu_task', after finalise_el2() calls __finalise_el2()
|
| * KVM hyp code which may consume TPIDR_EL2 is brought up after all
|   secondaries have been booted, once TPIDR_El2 has been configured on
|   all CPUs.
|
| Remove the redundant initialisation from __finalise_el2().

> Cc: Oliver Upton <oupton@kernel.org>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Will Deacon <will@kernel.org>

Reviewed-by: Mark Rutland <mark.rutland@arm.com>

Mark.

> ---
> 
> I spotted this by inspection as part of an ill-fated (abandoned) attempt
> at repurposing tpidr_elx for something else.
> 
>  arch/arm64/kernel/hyp-stub.S | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/kernel/hyp-stub.S b/arch/arm64/kernel/hyp-stub.S
> index 085bc9972f6b..8b8614c0b9a5 100644
> --- a/arch/arm64/kernel/hyp-stub.S
> +++ b/arch/arm64/kernel/hyp-stub.S
> @@ -105,11 +105,9 @@ SYM_CODE_START_LOCAL(__finalise_el2)
>  	msr_hcr_el2 x0
>  	isb
>  
> -	// Use the EL1 allocated stack, per-cpu offset
> +	// Use the EL1 allocated stack
>  	mrs	x0, sp_el1
>  	mov	sp, x0
> -	mrs	x0, tpidr_el1
> -	msr	tpidr_el2, x0
>  
>  	// FP configuration, vectors
>  	mrs_s	x0, SYS_CPACR_EL12
> -- 
> 2.53.0.1018.g2bb0e51243-goog
> 

