Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3333AC02194
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 18:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uZlWgJHHtKooExUDbxizMfF2gf9NhqjN6TWwjblQVsE=; b=2y6LG6K0iKZd/u62+iQ9ccob+o
	BhCYmED+oGupo0U/fDaJ8tsFf2+9oWML8xiWkd95SwNJ8CKAg7dhWNZMZy91DooKwmktYskxdMupn
	lcnPMugEW4+GwrKhcGRdU5imWa0KoBUA/VjER+H7ip1YR7ml+4+0/QoJkat/5oxbM7UObJ6M/3JPR
	FadwDZLNOo1FNsW+qdOT4Gh+WPCb7T6N3q8fw0oVGZ+k/8LXHy6DPOPzyJKPiV5JgaI8WpHwjYcbs
	PrdcB1qKa7cLeyFGgQxCFWEgbwZyAvMZOwEeff5euRnSBccnlY8mseIF3TwTxf9TgdHD/qYkyisHQ
	Gbd1sawA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgT74-0000000Ai73-0mIu;
	Fri, 07 Feb 2025 18:30:02 +0000
Received: from out-188.mta1.migadu.com ([95.215.58.188])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgT1W-0000000AgYj-2x86
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 18:24:20 +0000
Date: Fri, 7 Feb 2025 10:24:08 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738952655;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uZlWgJHHtKooExUDbxizMfF2gf9NhqjN6TWwjblQVsE=;
	b=R1sEqAeywq2zKG4ay+tBaee7QijS5sAORcGOvqfiNnXpOHEjqkpUSE/+N5Zf3cGcWCle6K
	8J6CtUWcs3c1db/AcTvzq2KSrZEyzJFx+Lq8WtY8N5LXq99h2hJIe7hUjC1UUT6sbdZu0A
	74OW2FTgxQnQexZT1lViHbywZ5cs1Iw=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Cc: kvmarm@lists.linux.dev, maz@kernel.org, catalin.marinas@arm.com,
	will@kernel.org, mark.rutland@arm.com, cohuck@redhat.com,
	eric.auger@redhat.com, sebott@redhat.com, yuzenghui@huawei.com,
	wangzhou1@hisilicon.com, jiangkunkun@huawei.com,
	jonathan.cameron@huawei.com, anthony.jebson@huawei.com,
	linux-arm-kernel@lists.infradead.org, linuxarm@huawei.com
Subject: Re: [PATCH v6 3/4] KVM: arm64: Report all the KVM/arm64-specific
 hypercalls
Message-ID: <Z6ZPyKK7HLHTtxYu@linux.dev>
References: <20250205132222.55816-1-shameerali.kolothum.thodi@huawei.com>
 <20250205132222.55816-4-shameerali.kolothum.thodi@huawei.com>
 <Z6ZPDml0JKuSjLIO@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6ZPDml0JKuSjLIO@linux.dev>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_102418_891583_E676BE6E 
X-CRM114-Status: GOOD (  20.24  )
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

On Fri, Feb 07, 2025 at 10:21:13AM -0800, Oliver Upton wrote:
> On Wed, Feb 05, 2025 at 01:22:21PM +0000, Shameer Kolothum wrote:
> > Currently ARM_SMCCC_VENDOR_HYP_KVM_FEATURES_FUNC_ID returns the
> > bitmap corresponding to KVM_REG_ARM_VENDOR_HYP_BMAP and it only
> > returns _KVM_FEATURES_FUNC_ID and _KVM_PTP_FUNC_ID. Change that
> > to return all the KVM/arm64-specific hypercalls exposed by
> > KVM/arm64 to guest operating systems.
> > 
> > Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> > ---
> >  arch/arm64/kvm/hypercalls.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm64/kvm/hypercalls.c b/arch/arm64/kvm/hypercalls.c
> > index 27ce4cb44904..5cef2590ffdf 100644
> > --- a/arch/arm64/kvm/hypercalls.c
> > +++ b/arch/arm64/kvm/hypercalls.c
> > @@ -359,7 +359,11 @@ int kvm_smccc_call_handler(struct kvm_vcpu *vcpu)
> >  		val[3] = ARM_SMCCC_VENDOR_HYP_UID_KVM_REG_3;
> >  		break;
> >  	case ARM_SMCCC_VENDOR_HYP_KVM_FEATURES_FUNC_ID:
> > -		val[0] = smccc_feat->vendor_hyp_bmap;
> > +		val[0] = GENMASK(ARM_SMCCC_KVM_FUNC_PTP,
> > +				 ARM_SMCCC_KVM_FUNC_FEATURES);
> > +		/* Function numbers 2-63 are reserved for pKVM for now */
> > +		val[2] = GENMASK((ARM_SMCCC_KVM_FUNC_DISCOVER_IMPL_CPUS - 64),
> > +				 (ARM_SMCCC_KVM_FUNC_DISCOVER_IMPL_VER - 64));
> >  		break;
> 
> This isn't right, vendor_hyp_bmap is very much load bearing. We have a
> documented UAPI that allows userspace to control the hypercalls exposed
> to the guest.
> 
> The idea being a user wants kernel rollback safety and doesn't expose
> hypercalls that could potentially be revoked.
> 
> https://docs.kernel.org/virt/kvm/arm/fw-pseudo-registers.html#bitmap-feature-firmware-registers

To add:

KVM cannot advertise the DISCOVER_IMPL* stuff unconditionally, since the
expectation is that userspace implements these hypercalls. These bits
may need to be writable from userspace but have a reset value of 0.

-- 
Thanks,
Oliver

