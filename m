Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26614C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 21:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ojmpRg/HOY6aK9s6IqWiNPKBEyVR6Jj69/+3d+ZdCh4=; b=Foy385ExV5bFY2Bb8NT7DEF9O+
	na/SkuVWO7vCLdhELsEbiM2b1qP5dPhYgfVmZsh/kcEdW1I5l3wAH842mLDO/G698h8KbnZDuVarc
	DNrsG6gRpZ8PGXHTi4m0bd76ZczBfDqihrJHRkjtHBEan//gCOB26nX4IxoIQ0jSbwwvX/hu9Ukxq
	b/eneD0OhQGLujaR8p0o8/ynrxEzt42JGjI9HK0hp9Jpv/5aCWciIZfkRXcrm40DoqqzBvQPli/Jz
	HHBNZybsxj7lHGlBwRmxCOjM1m2gDex37NodhU7xvUSfzUmdVsLfePWHH9aZzGochz+0Ggwfv9BXc
	+LRN/gyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdcJJ-00000009fSR-1AAg;
	Thu, 30 Jan 2025 21:42:53 +0000
Received: from out-189.mta0.migadu.com ([2001:41d0:1004:224b::bd])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdcHy-00000009fPj-2HKs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jan 2025 21:41:32 +0000
Date: Thu, 30 Jan 2025 13:41:04 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738273282;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ojmpRg/HOY6aK9s6IqWiNPKBEyVR6Jj69/+3d+ZdCh4=;
	b=LA2qhgbZmA6VzVvZVSo1cYrCXUmkBVvxEKcPO74NlnJvQxCgsXQGYyGA7SdoUveUNOkTQ5
	AOtsUnlqpOdDHYn7KpcAkDxoDu15xW+NZV3vb+7JHsrsC1F65p0FoDir5helebx0FjhwFm
	mS+2QQfSAySHTzLyIM0x7ZPQTeJQ5dg=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Wei-Lin Chang <r09922117@csie.ntu.edu.tw>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Dmytro Terletskyi <Dmytro_Terletskyi@epam.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH 3/3] KVM: arm64: timer: Consolidate NV configuration of
 virtual timers
Message-ID: <Z5vx8NVN8lF6QuJz@linux.dev>
References: <20250128161721.3279927-1-maz@kernel.org>
 <20250128161721.3279927-4-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250128161721.3279927-4-maz@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_134131_023464_261EE046 
X-CRM114-Status: GOOD (  10.16  )
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

> +void kvm_timer_vcpu_nv_init(struct kvm_vcpu *vcpu)
> +{
> +	/*
> +	 * A vcpu running at EL2 is in charge of the offset applied to
> +	 * the virtual timer, so use the physical VM offset, and point
> +	 * the vcpu offset to CNTVOFF_EL2.
> +	 *
> +	 * The virtual offset behaviour is "interesting", as it always
> +	 * applies when HCR_EL2.E2H==0, but only when accessed from EL1 when
> +	 * HCR_EL2.E2H==1. Apply it to the HV timer when E2H==0.
> +	 */

I'm definitely being pedantic, but all the talk of an HV timer when
E2H==0 isn't sitting well with me. Since a programmable E2H has gone
out the window there isn't such thing as an HV timer when E2H==0, as
FEAT_VHE isn't implemented for the VM.

And along those lines, accesses to CNTHV_*_EL2 registers should undef
when FEAT_VHE isn't implemented for the VM but I don't think we have any
enforcement of that.

-- 
Thanks,
Oliver

