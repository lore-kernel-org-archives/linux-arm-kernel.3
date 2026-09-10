Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 215A3C79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 12:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cC4mvysi1cGqTOJuilPewkPzp6rycC0jl7rMo1Vo1RE=; b=s1MABOht8gRe95U0DpPxbS09uw
	pGJTx8qM7u/W7shWzrGStS0d1nlZqxux32i0IMcZkqxLaeShQRFFAnRug4PUwuRjzaCoHNIWeV0xS
	Hl579kBpAdVYISi7bmRre1dvgkExbsduAb4f+cyeNEVZKOI0RZb/NQhUqH+SUThO8/8l0GpXHozBx
	roxkzsm/qDupnq3g2nS8sChPGMbP7q/9lzMLfNEPzBgj4k+i/5VCtNDSYfl/ag3fU2+KSSaOyuuqd
	afKdLraxEP8F2gEmZ8Hvx1tg7LvOcu64PAougClNXhzfg139tuwUBH6t9Dq6aWjxUxLn88dUhFSdi
	6meBFtaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4e7Y-0000000EMdY-2H6M;
	Thu, 10 Sep 2026 12:43:16 +0000
Received: from out-130.mta0.migadu.com ([2001:41d0:1004:224b::82] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4e7V-0000000EMca-3n4x
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 12:43:15 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=TLJMW+UBHyf2hULFG74qvyh3xriAmI6y3qUkZriPhlo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789044187; v=1; x=1789648987;
 b=mHQ0xPc1NTl7CIjNYa5HlI/RIV7OuKliN/tOYeoPzEK3gIy/32CyWsQTmYZmDA5VFsf1Xtvv
 3tpXo2S5dSsz3Yx2TQIkR830tExig0flM5/JpAqWvPaqvZGJGuQwq7zCq25ZAY23XsdvFnsstOP
 pztJ3AjZOSDTAn5eH3Qu9exQ=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 44b515527182e254;
	Thu, 10 Sep 2026 12:43:07 +0000
X-Mizu-Trace-ID: 44b515527182e254
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b78e073980so5444e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 05:43:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByP0/ixL+YHgRKuOxVgGk+uM/WN4kkP5qEBZhuGjnuUZkXq+fOctdth4F/HtAtA/IdrlbMIypu8NNn7bn7dzSro@lists.infradead.org
X-Gm-Message-State: AFuF++m6MN3yqbttceuYrbbEwG5467FNNXsLSrkiwpoMMlCrpBV7niiv
	laC1vQGfWNJ3ybr9fJ4F8g/i80Faw2G9FF74v1Ut8qs55dPAwdGMxaYrzgG5XIJhCDHtoh10wbQ
	+yOYIsSwNwSfOs5WAdUyqXQpXpzewtZ0UxApN8YJL
X-Received: by 2002:a05:6512:234c:b0:5b6:19c6:a91b with SMTP id
 2adb3069b0e04-5b89a6da833mr113965e87.14.1789044182010; Thu, 10 Sep 2026
 05:43:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260908162223.1683432-1-suzuki.poulose@arm.com>
 <20260908162223.1683432-11-suzuki.poulose@arm.com> <CA+EHjTw9ReyvsNT=y+-P6ng7VQ6Pvz9PFK9bO71qvTR1pOxx5Q@mail.gmail.com>
 <6152fc41-65f0-460f-90b4-1454c11bcba6@arm.com> <CA+EHjTxjk1JLR7Tf5LEfB_xypbUWnw3G3H-FT7bTE=nWTTRgAA@mail.gmail.com>
 <d22c863b-ea81-472c-b2a9-28f99e5b6f92@arm.com>
In-Reply-To: <d22c863b-ea81-472c-b2a9-28f99e5b6f92@arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 10 Sep 2026 13:42:25 +0100
X-Gmail-Original-Message-ID: <CA+EHjTx744tg1c3vX0Ugo8YN7n-wtq9-rWdjjSP+UXi8_vvq7g@mail.gmail.com>
X-Gm-Features: AcwNN1WSfg4g-Ni2N5yRIGRNfczplTeSi9HsXmirIR-L_CctNHI6kvs4aUKgPSE
Message-ID: <CA+EHjTx744tg1c3vX0Ugo8YN7n-wtq9-rWdjjSP+UXi8_vvq7g@mail.gmail.com>
Subject: Re: [PATCH v17 10/20] KVM: arm64: coco: Disable Steal time accounting
 for coco guests
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org, 
	will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, steven.price@arm.com, 
	aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com, 
	joey.gouly@arm.com, yuzenghui@huawei.com, linux-coco@lists.linux.dev, 
	gankulkarni@os.amperecomputing.com, sdonthineni@nvidia.com, 
	alpergun@google.com, fj0570is@fujitsu.com, WeiLin.Chang@arm.com, 
	lpieralisi@kernel.org, enju.kohei@fujitsu.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_054314_083677_61AB6175 
X-CRM114-Status: GOOD (  21.01  )
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

Hi Suzuki,

On Thu, 10 Sept 2026 at 11:28, Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
...
> Just to make sure I understand the picture:
>
> For coco VMs:
>
>   - check extension on coco KVM, KVM_CAP_STEAL_TIME => 0
>
> And a follow up DEVICE_HAS_ATTR => -EPERM ?
>
> But we tell the VMM, look you don't have the capabilit on this VM.
> But if you try to set the attribute isn't it more appropriate to
> say:
>   -ENXIO - No you don't have that feature on this VM (-ENXIO)
> rather than
>   -EPERM - No, I won't let you do that.
>
> Remember we are doing only in the "VM" context. It is a minor nit
> but I wanted to make sure we understand what we are thinking.

-ENXIO it is. I went back to api.rst for KVM_SET_DEVICE_ATTR: ENXIO is
for a group or attribute that's "unknown/unsupported for this device",
and EPERM for one that "cannot (currently) be accessed this way", a
state or access-mode refusal, so a VM type that doesn't have the
feature is the former. KVM_HAS_DEVICE_ATTR only documents ENXIO at
all. Your patch is good as it is.

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad



>
> Cheers
> Suzuki
>
> > it's just not permitted for a confidential VM, and -EPERM says exactly
> > that, whereas -ENXIO reads as "no such feature".
> >
> > Cheers,
> > /fuad
> >
> >>
> >>> steal-time exists but isn't permitted for a confidential VM, whereas
> >>> -ENXIO reads as "no such feature".
> >>
> >> Cheers
> >> Suzuki
> >>
> >>
> >>>
> >>> Cheers,
> >>> /fuad
> >>>
> >>>>
> >>>>    int kvm_arm_pvtime_set_attr(struct kvm_vcpu *vcpu,
> >>>> @@ -81,7 +81,7 @@ int kvm_arm_pvtime_set_attr(struct kvm_vcpu *vcpu,
> >>>>           int ret = 0;
> >>>>           int idx;
> >>>>
> >>>> -       if (!kvm_arm_pvtime_supported() ||
> >>>> +       if (!kvm_arm_pvtime_supported(kvm) ||
> >>>>               attr->attr != KVM_ARM_VCPU_PVTIME_IPA)
> >>>>                   return -ENXIO;
> >>>>
> >>>> @@ -110,7 +110,7 @@ int kvm_arm_pvtime_get_attr(struct kvm_vcpu *vcpu,
> >>>>           u64 __user *user = (u64 __user *)attr->addr;
> >>>>           u64 ipa;
> >>>>
> >>>> -       if (!kvm_arm_pvtime_supported() ||
> >>>> +       if (!kvm_arm_pvtime_supported(vcpu->kvm) ||
> >>>>               attr->attr != KVM_ARM_VCPU_PVTIME_IPA)
> >>>>                   return -ENXIO;
> >>>>
> >>>> @@ -126,7 +126,7 @@ int kvm_arm_pvtime_has_attr(struct kvm_vcpu *vcpu,
> >>>>    {
> >>>>           switch (attr->attr) {
> >>>>           case KVM_ARM_VCPU_PVTIME_IPA:
> >>>> -               if (kvm_arm_pvtime_supported())
> >>>> +               if (kvm_arm_pvtime_supported(vcpu->kvm))
> >>>>                           return 0;
> >>>>           }
> >>>>           return -ENXIO;
> >>>> --
> >>>> 2.43.0
> >>>>
> >>
>

