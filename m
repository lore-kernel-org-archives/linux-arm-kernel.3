Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E40B6CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 10:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WNEmHsCQ3cI11oAI1u83nSxC6LWPxu8t+VCOL7GAmx4=; b=wyqw+DY8KKcYXaD4wj5/YNvhbT
	BsH4nS1odqmoAFbHa3ySRgwoArGzxKDyzkyBHNI8VlRe7McaI95qupl7CM08Rs22fGVR7j7rJ5oeK
	qKoEBBYj5/K+l4QCFYtMeG3doP3t1SNbb8uBVjyWKOf+LizqzdOT8E/OMoVmpF78sfgksibML1p1K
	PxDtJhwkxbVWSf6jPptmj6Hbnul90/bNY9VWeWzOgRd/VHl2ogXnjX9ALMdXCU/WYAgvfvSycRob8
	IhAAN+9R+aKwJyoOFtZP/KQ6W8N3yKhgfd6CsdUUnmzzDMupzX5y8ZilTN7qD+f7LoAsMNkZok5di
	cvqt6Q/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ8St-00000008cJd-3UNP;
	Wed, 12 Nov 2025 10:52:39 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ8Sq-00000008cJA-3zHo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 10:52:38 +0000
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-4ede12521d4so87891cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 02:52:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762944755; x=1763549555; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WNEmHsCQ3cI11oAI1u83nSxC6LWPxu8t+VCOL7GAmx4=;
        b=wP+yD7dDGfG6JBdv07BHtZPvySPGhMnV7cGWw9QX9/nl4wvbpxQc0mLHZDj0R85lE4
         LiqX9dKzvhzJ62NGPSsswdj2NzmOAqhkUvnkXq/t1HZB0mEwFk3Mbtyy1tLK+/AcDVA0
         IjUGFxt+eVjTdM20jwbNwPYtJirdnGdqyLgny+lFLOIhoqiVg/YK1ja8Wt+N/m+ety+1
         GwNMsZBQFFJEZjT4RT5eEdmH1EjS1Q2ssRZpA2zGBS7kmFHhyrk/x7lk/XyVsNTT4drl
         YOoyfbkDeH4BuFprhyQw07R83NBBXXS7OxJEpK8OUmn8G+2wM6cF+Y84+7JOZj9Hmodc
         vnJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762944755; x=1763549555;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WNEmHsCQ3cI11oAI1u83nSxC6LWPxu8t+VCOL7GAmx4=;
        b=aMy38Ie3FTowHGSH9IJMGsdM7eIE752lPvWfEgOIigBzCA1pItjy46j/mtzMQZSEaH
         z6wmw3BR/N6i1fQMmBMuB17gjtNd5/EUS2q7coBGDwujUYDNiqa79CnENWR2dm8B1ACj
         DDgnKrYakztRjcv/UcJhGNEN8iE6fEaJKAuVoBnauLYuZ86XfoA39hO5BCfkfe5rrB8p
         EcMhEUTfStN45U1/L3zqU++ad0YMxluvzxtxBIvGQM5ZODrwkTcIoBfOdVyQmkiRfjNh
         9ksxZgj/jP5aQlWdF970Vkeu5Nb57U16O623gJctAt/OgZfZ63jJxD4rtzD4Kvz9yip4
         rNzA==
X-Forwarded-Encrypted: i=1; AJvYcCX8wdrQpRtQTG9qeDCIKXuBMx2hs48hdbRt1qO69NxCNaILFWSnDhl7PRcCQgCYrOHLOMfR2/NX40L2k6U6Trrz@lists.infradead.org
X-Gm-Message-State: AOJu0YxkYLIMIt8KYsVsFQxTI/LdYbmlL5U7L56OoZM+b4XVxEoCKfWz
	gGO45V2h/9EghSfWu1IunwIho29+Stgdm82CqPmMZ9KvDueuyJIJmQUz8bvvDayGUumd4BbTH+0
	5oSTA87u0jXLKZxHdxKmTfiUQSao5urg4oEbZxiqr
X-Gm-Gg: ASbGncsajRQJXWbb2aL/nhl/3nfQXry8EvLOSa2x2Nlp0uyeCknx+7xiGt2h2Ign3zg
	gckEZVjoX9/UgXS90XwRnpvzUk4nxfHXpHpJO4FfyJ0QMEgxQ058zxoYU+IDIZG/o2f1LA49+Ri
	Jo7nxHqbBU2hhCA6ABToBBqmVmSiciyY5d/k/dkt/eThGDtoxfPmGgDu3jTPUBS1nOn+F6aD1mQ
	jMsNU0foZUvBNaoBUmVUegNB/2mSdk2v+Gz7cD/jLcRDj6ojlfc/ZdCppktFnuMSNdjoK/Tc3GB
	DYp2BuPIs4f/0nahQV5Jr9vFUitJDcXrZqc=
X-Google-Smtp-Source: AGHT+IH2kbrp2wOONl68BTyAziYAcWVjit+MdfPXbN9/MBL9IDmErGLT+GrOxTm+S9zHBlZfWlLxLVKM03Url96aZNE=
X-Received: by 2002:a05:622a:246:b0:4e5:7827:f4b9 with SMTP id
 d75a77b69052e-4eddcf51ffdmr5007411cf.3.1762944754666; Wed, 12 Nov 2025
 02:52:34 -0800 (PST)
MIME-Version: 1.0
References: <20251112092051.1376245-1-tabba@google.com> <20251112092051.1376245-8-tabba@google.com>
 <aRRcYltFUrBlcbfX@kernel.org>
In-Reply-To: <aRRcYltFUrBlcbfX@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 12 Nov 2025 10:51:58 +0000
X-Gm-Features: AWmQ_blDGZmge2Sw8Vj1BBhA5Hq-sY9Tzxc1CXj4hBJ5LlqC72ETgAVnLelWlpE
Message-ID: <CA+EHjTwyu5PZnPeEuD6VRV2zfAnP=KSMq+VVcGeq-zGRSUjaSA@mail.gmail.com>
Subject: Re: [PATCH v4 7/8] KVM: arm64: Check whether a VM IOCTL is allowed in pKVM
To: Oliver Upton <oupton@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	vladimir.murzin@arm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_025236_998295_21DD5ABE 
X-CRM114-Status: GOOD (  21.49  )
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

Hi Oliver,

On Wed, 12 Nov 2025 at 10:07, Oliver Upton <oupton@kernel.org> wrote:
>
> Hi Fuad,
>
> On Wed, Nov 12, 2025 at 09:20:50AM +0000, Fuad Tabba wrote:
> > +/*
> > + * Check whether the KVM VM IOCTL is allowed in pKVM.
> > + *
> > + * Certain features are allowed only for non-protected VMs in pKVM, which is why
> > + * this takes the VM (kvm) as a parameter.
> > + */
> > +static inline bool kvm_pkvm_ioctl_allowed(struct kvm *kvm, unsigned int ioctl)
> > +{
> > +     switch (ioctl) {
> > +     case KVM_CREATE_IRQCHIP:
> > +             return kvm_pkvm_ext_allowed(kvm, KVM_CAP_IRQCHIP);
> > +     case KVM_ARM_SET_DEVICE_ADDR:
> > +             return kvm_pkvm_ext_allowed(kvm, KVM_CAP_ARM_SET_DEVICE_ADDR);
> > +     case KVM_ARM_MTE_COPY_TAGS:
> > +             return kvm_pkvm_ext_allowed(kvm, KVM_CAP_ARM_MTE);
> > +     case KVM_ARM_SET_COUNTER_OFFSET:
> > +             return kvm_pkvm_ext_allowed(kvm, KVM_CAP_COUNTER_OFFSET);
> > +     case KVM_HAS_DEVICE_ATTR:
> > +     case KVM_SET_DEVICE_ATTR:
> > +     case KVM_GET_DEVICE_ATTR:
> > +             return kvm_pkvm_ext_allowed(kvm, KVM_CAP_DEVICE_CTRL) ||
> > +                    kvm_pkvm_ext_allowed(kvm, KVM_CAP_VM_ATTRIBUTES);
> > +     case KVM_ARM_GET_REG_WRITABLE_MASKS:
> > +             return kvm_pkvm_ext_allowed(kvm, KVM_CAP_ARM_SUPPORTED_REG_MASK_RANGES);
> > +     default:
> > +             return true;
> > +     }
> > +}
> > +
>
> I was thinking of something a bit more tabular since CCA will impose its
> own restrictions + pKVM could share the ioctl <=> KVM_CAP association.

Sure. Before I respin, how about something along these lines:

struct kvm_ioctl_cap_map {
    unsigned int ioctl;
    long ext;
};

/*
 * Sorted by ioctl to allow for potential binary search,
 * though linear scan is sufficient for this size.
 * (Note to Oliver: If you like, I can add a runtime check if we want
to support binary search.)
 */
static const struct kvm_ioctl_cap_map vm_ioctl_caps[] = {
    { KVM_CREATE_IRQCHIP, KVM_CAP_IRQCHIP },
    { KVM_ARM_SET_DEVICE_ADDR, KVM_CAP_ARM_SET_DEVICE_ADDR },
    { KVM_ARM_MTE_COPY_TAGS, KVM_CAP_ARM_MTE },
    { KVM_SET_DEVICE_ATTR, KVM_CAP_DEVICE_CTRL },
    { KVM_GET_DEVICE_ATTR, KVM_CAP_DEVICE_CTRL },
    { KVM_HAS_DEVICE_ATTR, KVM_CAP_DEVICE_CTRL },
    { KVM_ARM_SET_COUNTER_OFFSET, KVM_CAP_COUNTER_OFFSET },
    { KVM_ARM_GET_REG_WRITABLE_MASKS, KVM_CAP_ARM_SUPPORTED_REG_MASK_RANGES },
    { KVM_ARM_PREFERRED_TARGET, -1 }, /* Basic IOCTLs, no gating capability */
};

/*
 * Set *ext to the capability, which is -1 for basic capabilities.
 * Return 0 if found, or -EINVAL if no IOCTL matches.
 */
long kvm_get_cap_for_kvm_ioctl(unsigned int ioctl, long *ext)
{
    int i;

    for (i = 0; i < ARRAY_SIZE(vm_ioctl_caps); i++) {
        if (vm_ioctl_caps[i]. ioctl == ioctl)
            *ext = vm_ioctl_caps[i].ext;
            return 0;
   }

    return -EINVAL;
}

> Anyway, ioctl filtering should be an allowlist (default to false) just
> like kvm_pkvm_ext_allowed(). The default assumption is that new UAPI is not
> supported for pVMs unless explicitly stated otherwise.

Of course, that's what we do with capability checks.

Thanks,
/fuad

> Thanks,
> Oliver

