Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8756EC36014
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 16:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uY+nwOwz9t1SKnSkwJ4vrIlcfWn/0vv+GTXW2UOhRoc=; b=jejW5m/wSQw1ndEQJT8M57Fcdi
	E0WOiIS586fQCP9OgVG7G8tOsVYom0bs9Y71JSygAoh/VmQN/12kclV9y0Yf7sKNHlAvrBb/4xC7j
	irG39wOuSC7eCqyQg8eGf/DnHKgiep3gcujvq5Aqlw+OHMAVx8t0qzi+4TreOMzj/WmtFKY3VmTe3
	VuoyQ60zkknje2IS1qbvcXMlT1x8Oc7mU0gdJHUEcKlBwhmfR6UF4ZVgpMuzrgC/oobUz9yJAPdpB
	vcj3U6NzHFDGfAnijNNiZU4huJJxCm5TAnKG3yNgfaYpUhhoblbSUGcQepCogyMr2r6IQhBt6ylZX
	LU89qMZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzeT4-00000003sQt-1o8e;
	Tue, 01 Apr 2025 16:28:02 +0000
Received: from out-173.mta0.migadu.com ([91.218.175.173])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzeFU-00000003pZ8-2GhW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 16:14:02 +0000
Date: Tue, 1 Apr 2025 09:13:44 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1743524035;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uY+nwOwz9t1SKnSkwJ4vrIlcfWn/0vv+GTXW2UOhRoc=;
	b=Wu7VTEU4JOgAUzleJPyVD0sDPlBmk7FuNuSVR8JUItg3UPgPiyiHBXbWAwJIwMgqHqbaMG
	bIApukatadPcn31vKMAfrcjliApZErlPuNPmjBoC+uN+leG3EwssYdemP9TVXA8QHjTO46
	Hm1fIY7dUGWigQp0DOkZ/TUOQdC01fM=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Yicong Yang <yangyicong@huawei.com>
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	corbet@lwn.net, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com, shuah@kernel.org,
	jonathan.cameron@huawei.com, shameerali.kolothum.thodi@huawei.com,
	linuxarm@huawei.com, prime.zeng@hisilicon.com, xuwei5@huawei.com,
	yangyicong@hisilicon.com, tangchengchang@huawei.com
Subject: Re: [PATCH v2 6/6] KVM: arm64: Handle DABT caused by LS64*
 instructions on unsupported memory
Message-ID: <Z-wQuJAefT3xNipl@linux.dev>
References: <20250331094320.35226-1-yangyicong@huawei.com>
 <20250331094320.35226-7-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250331094320.35226-7-yangyicong@huawei.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_091401_157354_689E9655 
X-CRM114-Status: GOOD (  23.25  )
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

Hi Yicong,

On Mon, Mar 31, 2025 at 05:43:20PM +0800, Yicong Yang wrote:
> From: Yicong Yang <yangyicong@hisilicon.com>
> 
> If FEAT_LS64WB not supported, FEAT_LS64* instructions only support
> to access Device/Uncacheable memory, otherwise a data abort for
> unsupported Exclusive or atomic access (0x35) is generated per spec.
> It's implementation defined whether the target exception level is
> routed and is possible to implemented as route to EL2 on a VHE VM.
> Per DDI0487K.a Section C3.2.12.2 Single-copy atomic 64-byte load/store:
> 
>   The check is performed against the resulting memory type after all
>   enabled stages of translation. In this case the fault is reported
>   at the final enabled stage of translation.

Just use section citations, this quote isn't very useful since it
doesn't adequately describe the different IMPLEMENTATION DEFINED
behavior.

> If it's implemented as generate the DABT to the final enabled stage
> (stage-2), inject a DABT to the guest to handle it.

This should be ordered _before_ the patch that exposes FEAT_LS64* to the
VM.

> @@ -1658,6 +1658,25 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>  	if (exec_fault && device)
>  		return -ENOEXEC;
>  
> +	if (esr_fsc_is_excl_atomic_fault(kvm_vcpu_get_esr(vcpu))) {
> +		/*
> +		 * Target address is normal memory on the Host. We come here
> +		 * because:
> +		 * 1) Guest map it as device memory and perform LS64 operations
> +		 * 2) VMM report it as device memory mistakenly
> +		 * Warn the VMM and inject the DABT back to the guest.
> +		 */
> +		if (!device)
> +			kvm_err("memory attributes maybe incorrect for hva 0x%lx\n", hva);

No, kvm_err() doesn't warn the VMM at all. KVM should never log anything
for a situation that can be caused by the guest, e.g. option #1 in your
comment.

Keep in mind that data aborts with DFSC == 0x35 can happen for a lot
more than LS64 instructions, e.g. an atomic on a Device-* mapping.

> @@ -1919,6 +1939,21 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
>  			goto out_unlock;
>  		}
>  
> +		/*
> +		 * If instructions of FEAT_{LS64, LS64_V} operated on
> +		 * unsupported memory regions, a DABT for unsupported
> +		 * Exclusive or atomic access is generated. It's
> +		 * implementation defined whether the exception will
> +		 * be taken to, a stage-1 DABT or the final enabled
> +		 * stage of translation (stage-2 in this case as we
> +		 * hit here). Inject a DABT to the guest to handle it
> +		 * if it's implemented as a stage-2 DABT.
> +		 */
> +		if (esr_fsc_is_excl_atomic_fault(esr)) {
> +			kvm_inject_dabt_excl_atomic(vcpu, kvm_vcpu_get_hfar(vcpu));
> +			return 1;
> +		}
> +

A precondition of taking such a data abort is having a valid mapping at
stage-2. If KVM can't resolve the HVA of the fault then there couldn't
have been a stage-2 mapping.

Thanks,
Oliver

