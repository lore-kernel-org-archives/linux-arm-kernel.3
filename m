Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDFCCC87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 15:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NYxvHyAGIujMjt10Hr2cXUrcaQeGziq4d4rNEh/+vRU=; b=IrQC5HvtBZt4qJ4fplH2Xq3bbL
	b+e31rR57cWYBPYCg2dkwpFHSjosjIoWqZaX6ELXOWrNQPe/9/+Xf5arGiWbW+kuIqtfV4AXumAT0
	GJA7J0jDRWbROMet3zSkvxyPoj0g0A9Dt+Jv7HoCt5xTnMDH5IpwXHj01gpsic8hNWKkiXmiRKtf/
	4qFgoOkFZ0Hjl2vNsiUhWNUWcGXMbBjoSpRRDansTjZqRZocO6OHrWb/Iqyv+nwAMFaEmIKUEcXDJ
	IKkwH3n7uoICHrGT7ataVp2wtkB6LlgolCi4SYAvIyjTtKTWNj2m0f6liYYtPyQS672iT3XFWwTzK
	cIQKem9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujJnC-0000000DBfC-09yS;
	Tue, 05 Aug 2025 15:41:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujIlj-0000000D26j-0tGn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 14:36:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8D2EB5C6387;
	Tue,  5 Aug 2025 14:35:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABCFEC4CEF0;
	Tue,  5 Aug 2025 14:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754404558;
	bh=mjTR2Ac96dwJ78Vr6Hwbo17H1JiZ8AXdWSfQTVJfiaU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qyF9co85JxIkRBe1+1ACJbgutEe+7iTw+i/nSgoCMpNAZHGybkxyiwF/Fx+5eBqIL
	 mU2BJRoQ3a0OfQRC9z9C/QqB91BnGzxgAvzpLxYoPXZR8JPjcwjkwMUPXKGiBA4hh+
	 UWG8Wm+fO0tgoI5O5yjRTYlcSBwFH50QvH5oCOOwZCTWI84E6RB13Ib/MPRS4ZOQdI
	 3FiqpjbngRxL/icPeztDPZ+aBKj6LWl2uNJ3w5FO9FOe5M8SOvvR1ZxrkYiIMXXk8g
	 rGThlW4GTFjaPP5rPHGZ5d1Smhkj2UwU+2tbp9BT67H5F0XdV/RdgP3y1JCpQrBjyn
	 Ks6KSBDg2U+KA==
Date: Tue, 5 Aug 2025 15:35:52 +0100
From: Will Deacon <will@kernel.org>
To: Fuad Tabba <tabba@google.com>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, vdonnefort@google.com, qperret@google.com,
	sebastianene@google.com, keirf@google.com, smostafa@google.com
Subject: Re: [PATCH v1 3/4] KVM: arm64: Sync protected guest VBAR_EL1 on
 injecting an undef exception
Message-ID: <aJIWyNwWAAaCf_cw@willie-the-truck>
References: <20250805135617.831971-1-tabba@google.com>
 <20250805135617.831971-4-tabba@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250805135617.831971-4-tabba@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_073559_290858_0177017F 
X-CRM114-Status: GOOD (  19.10  )
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

On Tue, Aug 05, 2025 at 02:56:16PM +0100, Fuad Tabba wrote:
> In pKVM, a race condition can occur if a guest updates its VBAR_EL1
> register and, before a vCPU exit synchronizes this change, the
> hypervisor needs to inject an undefined exception into a protected
> guest.
> 
> In this scenario, the vCPU still holds the stale VBAR_EL1 value from
> before the guest's update. When pKVM injects the exception, it ends up
> using the stale value.
> 
> Explicitly read the live value of VBAR_EL1 from the guest and update the
> vCPU value immediately before pending the exception. This ensures the
> vCPU's value is the same as the guest's and that the exception will be
> handled at the correct address upon resuming the guest.
> 
> Signed-off-by: Fuad Tabba <tabba@google.com>
> ---
>  arch/arm64/kvm/hyp/nvhe/sys_regs.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/sys_regs.c b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
> index bbd60013cf9e..b34b10be1ad7 100644
> --- a/arch/arm64/kvm/hyp/nvhe/sys_regs.c
> +++ b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
> @@ -253,6 +253,7 @@ static void inject_undef64(struct kvm_vcpu *vcpu)
>  
>  	*vcpu_pc(vcpu) = read_sysreg_el2(SYS_ELR);
>  	*vcpu_cpsr(vcpu) = read_sysreg_el2(SYS_SPSR);
> +	vcpu_write_sys_reg(vcpu, read_sysreg_el1(SYS_VBAR), VBAR_EL1);

You say "in pKVM" in the commit message, but why isn't this applicable
to !VHE in general?

Will

