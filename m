Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E1C5C44501
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 16:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JYLHBFIYkSC00BT3OFNNZ7lMGwlI6NybvgfnsYZ8kCU=; b=hOU4GescQfia1BwUjK0ReVveZV
	v2FQk1uKFVH6rOrbwmB+waVmOUvzTNVwW5qM1VUlweevrtq/8iVMRads8NuRfjAou3Sr/yxAenDQg
	xMDdubVyISa/vvPyxKIDk1cbt3PMfOxdvdrA8v4mjJmZDdrjm7fza2XLRbJHQO56GL6HwX8yEaV1b
	fygdF2E2rpUN/7xKDV3RXAOfkj5unU8hMLL19Emqxz4g/+BpMphreg9hLgAJhvxzKUxkZ9ut0TBIJ
	bDmE8yKmIeAmhp+rL5nP3Vb6hNg1W7jOvVZOnmiPtpHPhNJ/nUydfB25mmt3/iprmwYR6euA0Cc6L
	mH3sgr3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh93F-0000000FV3S-0Aix;
	Tue, 07 Jul 2026 16:53:42 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh93C-0000000FV33-2SIY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 16:53:40 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-490cf3000f0so41695195e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 09:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783443216; x=1784048016; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JYLHBFIYkSC00BT3OFNNZ7lMGwlI6NybvgfnsYZ8kCU=;
        b=m8lVdYD97iSLGYX3Xns5/TaxAzZYSlUrSZ9SEp55FcojRqZWw/hdnuCb8Hp2CPGhzA
         ApVvVT7bbAIZx8Q8ukNEfgnqOaAtJWYU8Z+cFJBnMDvnCjYLdPvR+OLqIcAWLpMIMu/9
         COEWAz56BalJHdQ7MlmK+ApmqqALqEdluQI0mEpSc8Q7pTy3LjTt5oWasPKHsaDPlTKk
         tVK9eC8+9qVEyJddw67ETJsyK+Zdv90ZnnuDo1T0zMx4PZcK+icGeoroW42W04HMNTrZ
         6FC9v8+e+z4Sxr0/olNomXEa4B3vVs1UMML+ks67tKtRctDVYLr3uRu/h/ezI0+6lLY1
         0ZGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783443216; x=1784048016;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JYLHBFIYkSC00BT3OFNNZ7lMGwlI6NybvgfnsYZ8kCU=;
        b=Ci37qefypCn6HmX27Rt0fZ/sP0Z3hiA3/PqQ6OOsYkpouksMSoyJU05vDEks49RHFK
         8b3AIZX9rt5z/f6QsWiM/9K++XyaV1TJPz+GX4izaCyYLqov04JdzWM3Wj3Gp7uJ/jXK
         1v4oly1f2//yxY6WKeKv6SIxj+DBW/whMHNdu0i+54csgUIfZQGQX5jNo/vU5i/NFlF/
         QUo+afM4hGcyY41VxZtBBYErz0IBXMZrHU/4NJNrLC0+21daZtN3i0Q00Bye9ikfkzWW
         z3HL4vGFJDvPZkZaJJdNRDUvQgj/5QVaI0VYx/3pTIOeQIDIjiLUbmvCcNZsdGhv+N+5
         FyXw==
X-Forwarded-Encrypted: i=1; AHgh+RpHLlixXuLJmtz9h8SDHowS62nEgWUjNHYZCN8vpVoEv3MN+fkrGH89PbzCc9iO2MJcVusUgBbkZs9OZRg80/pE@lists.infradead.org
X-Gm-Message-State: AOJu0YxeJkfW3CUPGAK5wCha6G44GNHUOG01Rg/1u7v9ZIg7JkeDSMZS
	IJ7GEfGfTHd7MYEG9uo0AcfCvV3xQZOaIPILHPJstkR8FQyyACJEDNREfeSdQ0kWjg==
X-Gm-Gg: AfdE7ckTtRinKnJIFQD2E/pFnYFYEHRDenr4aA7DBhUEEdfiz9I3Aupw1+venBe8GWf
	vFbM1YlobfclVYfLpyhFB1BK5nV7BeMH0r/DIKmDIk8VPnBI86aYtCAphwO1JgiPEiMTaeg8KTW
	fx6LsfTc1H5hgTFqdJcCtu+FsogkHJme54retoHjAgntDE/g0aDHQO6TiP+lGAcmp0yTzZghuV7
	LEeW1wePupUfsvrHaYXmTLAt4prYdocFd0DFOvd/aFQsZlMfx79YSb0J1xc7Tze4DnDh43dbW4s
	QBDd6LoerqgYfqerNCQmnfrTd0YIZ50eMynmGbzP0uLSTC8jaxxvLA4KDUPvgzcOCEch4uqbYEl
	YxtNSE2VYY6R/NDLInMG8aBYcm/vHRVxFUwD63yeYNeqs9kX/hQ7toa44spY5kFatjmkSz7W6i7
	s6zsWoHvggIK+py+W22ocFlwj9fpXWjGj/yF0aAQ6gwvr2MsvWxnM=
X-Received: by 2002:a05:600c:4e03:b0:493:cd3f:d097 with SMTP id 5b1f17b1804b1-493df06b123mr64535395e9.12.1783443215304;
        Tue, 07 Jul 2026 09:53:35 -0700 (PDT)
Received: from google.com (137.69.77.34.bc.googleusercontent.com. [34.77.69.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0ebf593sm72423765e9.0.2026.07.07.09.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 09:53:34 -0700 (PDT)
Date: Tue, 7 Jul 2026 17:53:30 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Fuad Tabba <tabba@google.com>
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, rostedt@goodmis.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	kernel-team@android.com
Subject: Re: [PATCH v1 1/4] KVM: arm64: Allow early calls to pKVM
 host_share/unshare_hyp
Message-ID: <ak0vCmPyTlWIwFEI@google.com>
References: <20260612142245.1015744-1-vdonnefort@google.com>
 <20260612142245.1015744-2-vdonnefort@google.com>
 <CA+EHjTwSU67aNdgWvgR3ZGSB07Hu7wt4rUBkVGhrhoHKa_S1vw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTwSU67aNdgWvgR3ZGSB07Hu7wt4rUBkVGhrhoHKa_S1vw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_095338_640343_27907889 
X-CRM114-Status: GOOD (  20.76  )
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

On Sun, Jun 14, 2026 at 02:39:30PM +0100, Fuad Tabba wrote:
> On Fri, 12 Jun 2026 at 15:22, Vincent Donnefort <vdonnefort@google.com> wrote:
> >
> > The hypervisor tracing for pKVM relies on the __pkvm_host_share_hyp and
> > __pkvm_host_unshare_hyp HVCs. In order to start tracing as early as
> > possible, allow those two HVCs before the host is deprivileged.
> >
> > Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
> 
> To my good friend Sashiko:
> https://lore.kernel.org/all/20260529121755.2923500-1-tabba@google.com/
> 
> The hyp_trace_load() issue seems legit though.

I've just posted lore.kernel.org/all/20260707165029.3410701-1-vdonnefort@google.com
> 
> As for this patch itself:
> 
> Reviewed-by: Fuad Tabba <tabba@google.com>
> Tested-by: Fuad Tabba <tabba@google.com>
> 
> Cheers,
> /fuad
> 
> 
> >
> > diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
> > index 043495f7fc78..fb049c40d04f 100644
> > --- a/arch/arm64/include/asm/kvm_asm.h
> > +++ b/arch/arm64/include/asm/kvm_asm.h
> > @@ -89,12 +89,12 @@ enum __kvm_host_smccc_func {
> >         __KVM_HOST_SMCCC_FUNC___vgic_v3_restore_vmcr_aprs,
> >         __KVM_HOST_SMCCC_FUNC___vgic_v5_save_apr,
> >         __KVM_HOST_SMCCC_FUNC___vgic_v5_restore_vmcr_apr,
> > +       __KVM_HOST_SMCCC_FUNC___pkvm_host_share_hyp,
> > +       __KVM_HOST_SMCCC_FUNC___pkvm_host_unshare_hyp,
> >
> >         MARKER(__KVM_HOST_SMCCC_FUNC_PKVM_ONLY),
> >
> >         /* Hypercalls that are available only when pKVM has finalised. */
> > -       __KVM_HOST_SMCCC_FUNC___pkvm_host_share_hyp,
> > -       __KVM_HOST_SMCCC_FUNC___pkvm_host_unshare_hyp,
> >         __KVM_HOST_SMCCC_FUNC___pkvm_host_donate_guest,
> >         __KVM_HOST_SMCCC_FUNC___pkvm_host_share_guest,
> >         __KVM_HOST_SMCCC_FUNC___pkvm_host_unshare_guest,
> > diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > index 06db299c37a8..f0c52667cf52 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > @@ -721,9 +721,9 @@ static const hcall_t host_hcall[] = {
> >         HANDLE_FUNC(__vgic_v3_restore_vmcr_aprs),
> >         HANDLE_FUNC(__vgic_v5_save_apr),
> >         HANDLE_FUNC(__vgic_v5_restore_vmcr_apr),
> > -
> >         HANDLE_FUNC(__pkvm_host_share_hyp),
> >         HANDLE_FUNC(__pkvm_host_unshare_hyp),
> > +
> >         HANDLE_FUNC(__pkvm_host_donate_guest),
> >         HANDLE_FUNC(__pkvm_host_share_guest),
> >         HANDLE_FUNC(__pkvm_host_unshare_guest),
> > --
> > 2.54.0.1136.gdb2ca164c4-goog
> >

