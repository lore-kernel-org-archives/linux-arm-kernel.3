Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80A7ACA5FFE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 05:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z6HKUn32Pl0RcC+t4ZBVYw0IBfWo3PWYr/PqqN0MysU=; b=BozJC1cn0M5+v30x59AbQwlHQ2
	LBzYugMhmle1ggZyL62TtKCWhp6z0iuZghE7ZhWtMwfYWhCmb4zTbsRzSVCpFScILiKgHBe90sMk2
	0oB8lZvByN//KYZh7Wf/D/XFH2Dbl0v+Hh7KeVL9Z5moByX5K11vLN2/6jZUkrUSyO0FRBe+XHmQo
	YJ5aT/jsKhbSJGSzsWK91iSIkk/W+LTnxOBI6aBCrbWtqw1Rr2wOlUlX/vO3r+XeG3GsQ+26NqRRa
	G+VdFaSb5tw2U7UwgtROeI5ebfNXdHtLp1kBYvo4PhdcJhiAgelRiHsFA5CUm9yZTjh+gMVA11byJ
	mY7O3qjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDxq6-000000004cu-3Ima;
	Tue, 06 Oct 2026 05:35:46 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDxq4-000000004cJ-335M
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 05:35:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791264939;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z6HKUn32Pl0RcC+t4ZBVYw0IBfWo3PWYr/PqqN0MysU=;
	b=hyfReefnzAFmHYVxWTxE/sXZwI/H++i5Z7kY+6fRKc6XtnR+jn3IHnVvteIORl/STx77xZ
	eE4Ft9CE4iB7F7oIrJIBGPiXgIiESwrn6UL6+79fdEGkBfUoEdJyN74TDpzo0I96hphD1I
	SZF8Kgsop61MMDnHdGqiOFKDVM1u2X0=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-121-iCvfw7ulOGSgrg1L7i6eLA-1; Tue, 06 Oct 2026 01:35:34 -0400
X-MC-Unique: iCvfw7ulOGSgrg1L7i6eLA-1
X-Mimecast-MFC-AGG-ID: iCvfw7ulOGSgrg1L7i6eLA_1791264932
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3a470ead068so2271177a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 22:35:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791264932; x=1791869732;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z6HKUn32Pl0RcC+t4ZBVYw0IBfWo3PWYr/PqqN0MysU=;
        b=J2PL/wGbjH06CysmCx4sMN/cxCgnRtmkCxV7J+Gv/y+Moo51gA1bRD1iKcHbPntXmX
         ElMUoTMjoVWKlpyE3OdrG3wyx1cYnO8bIFeXuqDeAfFcMb6ZHkmyu2MaO9BF769RjKvo
         nxTRqajkWHEXOk6+ljacT+Zhem58D1enFyIa968rc78WD/i9HWRUqVYA+NJi4PNNBc3D
         es2EuGOnWDsn8AL8pjZuNcOMatjSi+tkKyNHWCfC7INdHNW9dXr9OHG7eGWQQWtXDucU
         OYXqDqoP8BnL2vM7A4dqVaiigFTMJT3zt0oi/pPz0e3J2H51ubrgntCVHb/3q8mJOdym
         uZZg==
X-Forwarded-Encrypted: i=1; AKwUvBzYkKgb3HB+Q8TPkwhWWCkaGLy7aw27O8Z6rsq4NV4uRNw6EuYxtbjg2FAdbt4WX74yt+EwyQboReRad13JuRKT@lists.infradead.org
X-Gm-Message-State: AFq9FYLlL9Vqr9Tqiw22LBrGKL0QZ6znMvFrBu26moh7nybKT9s8E8nQ
	67CtRfQGu6S8zHnVOiA7efh8fgN1hCrBfONj7B1d7q6WL2Q2dLsnkUmS+bUrNGxB9mkQg/dmsLn
	wZQgK9eVBG2x3s/D1QMxo8+Xs4+VjcwDMZ2Xxq1OwsxazAlcuJRIV1ZZh2yGMjrF0ove26Ld7HM
	Y2
X-Gm-Gg: AYBFou1QamwvnQ9ga3cxhgL41NVMwjgiLA3BHkcUbPXI373MTGs8TlwT34xZDI2MivF
	cSSFwIWpF3MRrsdExKiABqb5xVlvdkc7aAkWRIoaB77+TJofolkD1wMFgYi6OtbwGfPOCz1PkGW
	q6Sd4XRsqj/zjxKZnqZLhVtpPYV/UKaLuQXvlUHVyRmus1wO0kACRfbiT2QJwPL3w4t9H6EJ1iG
	Smu8XmHNt+jJUplGC0sjydeHrWiU93LHOVFseb7Odvnhhj0VFo4FGJ80xQPnlL66go/RwshEtTI
	9Y8enf81C+UgvujgCvLAG7HEhWwxo++DjhkA1RiGbGO7+hUL9pS2KYZ3+ntZVDNl9ugGAXaXQKW
	IgP5uIYBE1GpCx/zC3rzq1vMYC8E6wJa+o0HIRMGniA==
X-Received: by 2002:a17:90b:5101:b0:3a8:6b84:234d with SMTP id 98e67ed59e1d1-3a87254fb70mr144156a91.6.1791264931659;
        Mon, 05 Oct 2026 22:35:31 -0700 (PDT)
X-Received: by 2002:a17:90b:5101:b0:3a8:6b84:234d with SMTP id 98e67ed59e1d1-3a87254fb70mr144145a91.6.1791264931169;
        Mon, 05 Oct 2026 22:35:31 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8543deb6dsm3003847a91.16.2026.10.05.22.35.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 22:35:30 -0700 (PDT)
Message-ID: <d330fe17-d9a4-4c6c-9d6c-f47162bbfd14@redhat.com>
Date: Tue, 6 Oct 2026 15:35:21 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v22 22/23] KVM: arm64: CCA: Expose SVE VL register before
 VCPU finalization
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
 sudeep.holla@arm.com, jonathan.cameron@oss.qualcomm.com,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20261005090754.2140522-1-suzuki.poulose@arm.com>
 <20261005090754.2140522-23-suzuki.poulose@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20261005090754.2140522-23-suzuki.poulose@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: znvee0SGzjw1sKNuNFJiFpf3YS_mLbcYrx7QmSpeRUw_1791264932
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_223544_841965_CA7B218B 
X-CRM114-Status: GOOD (  32.32  )
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

On 10/5/26 7:07 PM, Suzuki K Poulose wrote:
> From: Jean-Philippe Brucker <jean-philippe@linaro.org>
> 
> Userspace must configure the SVE vector length before the Realm is created
> (as it is part of the parameter for Realm creation), but the Realm VCPUs
> cannot be finalized until after the Realm Descriptor has been created.
> 
> KVM_GET_REG_LIST currently rejects the unfinalized VCPUs, which prevents
> the userspace from discovering and configuring the VLs for  the Realm.
> 
> Allow KVM_GET_REG_LIST for unfinalized RECs and make the SVE register
> enumeration handle the unfinalized case explicitly. i.e., only expose
> KVM_REG_ARM64_SVE_VLS before SVE is finalized.
> 
> One adverse side effect of this change is that a KVM_GET_REG_LIST call that
> only probes for the array size will now succeed even if SVE is not
> finalized, but that seems harmless since the following KVM_GET_REG_LIST
> with the full array will fail.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> Signed-off-by: Steven Price <steven.price@arm.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
>   arch/arm64/kvm/arm.c   | 15 ++++++++++++++-
>   arch/arm64/kvm/guest.c | 10 +++++-----
>   2 files changed, 19 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index fe707a0c47308..d99e7818f5894 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -2004,6 +2004,19 @@ static int kvm_arm_vcpu_set_events(struct kvm_vcpu *vcpu,
>   	return __kvm_arm_vcpu_set_events(vcpu, events);
>   }
>   
> +/*
> + * Realm VCPUs can be finalized only after the Realm descriptor is created.
> + * But in order to seal the SVE VL, we need to allow the userspace to read/write
> + * to the SVE_VL, before everything is finalized.
> + * Allow the register list for RECs before the VCPUs are finalized.
> + */
> +static bool kvm_arm_vcpu_reg_list_allowed(struct kvm_vcpu *vcpu)
> +{
> +	if (kvm_arm_vcpu_is_finalized(vcpu))
> +		return true;
> +	return vcpu_is_rec(vcpu);
> +}
> +

Needn't to keep this helper, and the code can be integrated to kvm_arch_vcpu_ioctl(),
see below.

>   long kvm_arch_vcpu_ioctl(struct file *filp,
>   			 unsigned int ioctl, unsigned long arg)
>   {
> @@ -2059,7 +2072,7 @@ long kvm_arch_vcpu_ioctl(struct file *filp,
>   			break;
>   
>   		r = -EPERM;
> -		if (!kvm_arm_vcpu_is_finalized(vcpu))
> +		if (!kvm_arm_vcpu_reg_list_allowed(vcpu))
>   			break;

Needn't to keep the helper kvm_arm_vcpu_reg_list_allowed() after its logic is
combined to kvm_arch_vcpu_ioctl().

		/*
		 * Realm vCPUs can be finalized only after the Realm descriptor is created.
		 * We need to allow access KVM_REG_ARM64_SVE_VLS before that so that the
		 * register can be sealed.
		 */
		if (!(vcpu_is_rec(vcpu) || kvm_arm_vcpu_is_finalized(vcpu))
			break;

>   
>   		r = -EFAULT;
> diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
> index b01d6622b8720..c3ca369882273 100644
> --- a/arch/arm64/kvm/guest.c
> +++ b/arch/arm64/kvm/guest.c
> @@ -598,8 +598,8 @@ static unsigned long num_sve_regs(const struct kvm_vcpu *vcpu)
>   	if (!vcpu_has_sve(vcpu))
>   		return 0;
>   
> -	/* Policed by KVM_GET_REG_LIST: */
> -	WARN_ON(!kvm_arm_vcpu_sve_finalized(vcpu));
> +	if (!kvm_arm_vcpu_sve_finalized(vcpu))
> +		return 1; /* KVM_REG_ARM64_SVE_VLS */
>   

Question: After a (Rec) vCPU is finalized, the returned number of registers won't
be 1. Is this expected? Otherwise, we need to use vcpu_is_rec() here.

	/*
	 * KVM_REG_ARM64_SVE_VLS is visible for realm vCPUs no matter if
	 * they have been finalized.
	 */
	if (vcpu_is_rec(vcpu))
		return 1;

>   	return slices * (SVE_NUM_PREGS + SVE_NUM_ZREGS + 1 /* FFR */)
>   		+ 1; /* KVM_REG_ARM64_SVE_VLS */
> @@ -616,9 +616,6 @@ static int copy_sve_reg_indices(const struct kvm_vcpu *vcpu,
>   	if (!vcpu_has_sve(vcpu))
>   		return 0;
>   
> -	/* Policed by KVM_GET_REG_LIST: */
> -	WARN_ON(!kvm_arm_vcpu_sve_finalized(vcpu));
> -
>   	/*
>   	 * Enumerate this first, so that userspace can save/restore in
>   	 * the order reported by KVM_GET_REG_LIST:
> @@ -628,6 +625,9 @@ static int copy_sve_reg_indices(const struct kvm_vcpu *vcpu,
>   		return -EFAULT;
>   	++num_regs;
>   
> +	if (!kvm_arm_vcpu_sve_finalized(vcpu))
> +		return num_regs;
> +

Same question as above.

>   	for (i = 0; i < slices; i++) {
>   		for (n = 0; n < SVE_NUM_ZREGS; n++) {
>   			reg = KVM_REG_ARM64_SVE_ZREG(n, i);

Thanks,
Gavin


