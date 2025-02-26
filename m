Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ABFDC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 14:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HoJVZSkyjUmn1nx4mDEJyzPRhyKl3ZXWHT9JGOVfnSI=; b=o+MvMZoLwe7hgLCVjWPIlfD+aL
	vxZzmgOPiQ7yvAAffDfNRwVjvp6Qe2xKWoLTcT7pKdex5ZZZJbED0k+Rp+bh98AwUEAVVLRHhooJ4
	kYstiWgUndCv4ikexOqf8yKCoIYu5RdKYfguJtxZoFSonNL4rDfSGzo1lFwHL1Q065k6MNHOP3Wud
	0+lC28R0ENJg0bfY0a36yAegAl7H0gocUvFyL1s+eLXjqypRpS3KiNhklWRTpsiWTWXm6ohg7wR9C
	HD977RJ+d5qutDM4E9o4bZHg1BGTj3hr1hnqHTDVMbDzIwMOlUb4+8yeA8yQXakNZI3RhvTzsAslK
	h4LPZVrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnIY3-000000047jD-2mDt;
	Wed, 26 Feb 2025 14:38:07 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnGee-00000003iIQ-0Zv7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 12:36:49 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-471fa3b19bcso230561cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Feb 2025 04:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740573406; x=1741178206; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HoJVZSkyjUmn1nx4mDEJyzPRhyKl3ZXWHT9JGOVfnSI=;
        b=R8iL6X/5CUbRlXxQ+Paie4Xq9mJQgWGRXlehbwNmCzQn+IAuj9PmqpBYXGWcm9/r4Y
         3AblhjpwSLZPkcEZVUbV2Lnu76Pi4SsvHjSyWyqzw4wsAwFpS4wbfXcez3K8ieDGYI23
         CWBJzk/7T42vSL0pyADDqDpCMLZWyYDEk6tFjoMNrR3SVtosWy3tzdFif1NdAec5mWwQ
         oBF5w6wJ5TJpwTHWpwxgsyevXXZHnkW+MXt2Zpy2+5dPukHErpgZjNyZlk1fJpSl9OFD
         jTEjGSXO3WIoBkuWLTAzueiOfZ/9rdBsT/6+QjRpwuhXT75KLGXVpgiEmmFbzAi1b/hX
         QYfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740573406; x=1741178206;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HoJVZSkyjUmn1nx4mDEJyzPRhyKl3ZXWHT9JGOVfnSI=;
        b=Y5JVtzGLqtOcpclbeZVj/S7qe5pAQBjlZKAAnVO8zbzLZjNNJUCpe1+AsfiqNAbLym
         X+5+EXfRT8+x/b2HB97GlkPgUP/OpJK1fL2hdFvbzw/kL3CIpaS+ytl6VxD1QVpHP3Rb
         M2ePQmvQFFwn0BpsJ+s/14rxWCfO6yUVwZcWNNtP2kjifa3Xc/Hnb75XHQm1lEPcybh6
         xZjNw/S4p76gNrjtfYQ+yiGlKBbe9bNJfuMlLK0FDcg8fihmBItC3+eiRu+WDROKwJlT
         hDEpwinoX8DoHecHQCKd4HZXWV/B2TseQbcVfmFJkRtGtwtPzmKdOxm6OObt/uc0jfn1
         DGMA==
X-Forwarded-Encrypted: i=1; AJvYcCVua5Jj3eIuYRQUElN5Vmc0062EDUdb0A1dc7D8X1DXT5Lergn09IJsvQUi7Sl2FxHBhsJRMG+k9Hxc2A8QtCuE@lists.infradead.org
X-Gm-Message-State: AOJu0YxmkWl7HIUALfJ2dBN92yBseoo0yFF4VkCo7ks1RR5wg27EqOjV
	b2KXdCbdcxwkpv2LKhphwb8To6xpSqkPI3iykDB404ZWxqS3h2L62eXpBRzFYO0bYTh5D4mo0Uc
	01S0PWt3Hyv6MhxnvB9LwQC0HrpWBheAhlLnV
X-Gm-Gg: ASbGncuV+VHnHd/zvg2UO/BDyWG3xLr9JONEZE8QD0MfkdtV4o1gGweAwI3G1c6Gadf
	/HV0ZtvunAgTPnFMDeJUrGaAvFYwSgZMEJ16wfzt++vTC3HMr1/PsgF0SpXhqxFuCsUaQ7XaoY8
	868lw=
X-Google-Smtp-Source: AGHT+IGQpoOYHGptiR2VD3L+l8sXuhYzvycknZAF+6aEn7jh3aoLIT4QNEieVrCBkZ4ux2peeQiBtg8/jW2baiYhRMs=
X-Received: by 2002:ac8:598b:0:b0:471:939c:a304 with SMTP id
 d75a77b69052e-47376e6f148mr10041761cf.8.1740573405841; Wed, 26 Feb 2025
 04:36:45 -0800 (PST)
MIME-Version: 1.0
References: <20250214150258.464798-1-tabba@google.com> <20250214150258.464798-2-tabba@google.com>
 <Z77n_Gv0X0bolONW@linux.dev>
In-Reply-To: <Z77n_Gv0X0bolONW@linux.dev>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 26 Feb 2025 04:36:09 -0800
X-Gm-Features: AQ5f1JoIK-v03PmLAeWTFQ7bXIjF-g1Cy1tRsGsXRmbYU1wZIODsNrHvaEpey6E
Message-ID: <CA+EHjTx53+D0jd=73UozNesT=6q+5YsP3fjasM4yN615Rpx2=Q@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] KVM: arm64: Initialize HCRX_EL2 traps in pKVM
To: Oliver Upton <oliver.upton@linux.dev>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	maz@kernel.org, mark.rutland@arm.com, will@kernel.org, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	broonie@kernel.org, qperret@google.com, vdonnefort@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_043648_180682_CC737BB6 
X-CRM114-Status: GOOD (  24.61  )
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

On Wed, 26 Feb 2025 at 02:08, Oliver Upton <oliver.upton@linux.dev> wrote:
>
> Hi Fuad,
>
> Series LGTM overall, one comment:
>
> On Fri, Feb 14, 2025 at 03:02:56PM +0000, Fuad Tabba wrote:
> > Initialize and set the traps controlled by the HCRX_EL2 in pKVM
> > when the register is supported by the system.
> >
> > Signed-off-by: Fuad Tabba <tabba@google.com>
> > ---
> >  arch/arm64/kvm/hyp/nvhe/pkvm.c | 46 ++++++++++++++++++++++++++++++++++
> >  1 file changed, 46 insertions(+)
> >
> > diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> > index 3927fe52a3dd..668ebec27f1b 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> > @@ -58,6 +58,30 @@ static void pkvm_vcpu_reset_hcr(struct kvm_vcpu *vcpu)
> >               vcpu->arch.hcr_el2 |= HCR_ATA;
> >  }
> >
> > +static void pkvm_vcpu_reset_hcrx(struct pkvm_hyp_vcpu *hyp_vcpu)
> > +{
> > +     struct kvm_vcpu *host_vcpu = hyp_vcpu->host_vcpu;
> > +     struct kvm_vcpu *vcpu = &hyp_vcpu->vcpu;
> > +
> > +     if (!cpus_have_final_cap(ARM64_HAS_HCX))
> > +             return;
> > +
> > +     /*
> > +      * In general, all HCRX_EL2 bits are gated by a feature.
> > +      * The only reason we can set SMPME without checking any
> > +      * feature is that its effects are not directly observable
> > +      * from the guest.
> > +      */
> > +     vcpu->arch.hcrx_el2 = HCRX_EL2_SMPME;
> > +
>
> The comment isn't wrong, but we don't support SME at all in KVM at this
> point.
>
> Any objection to dropping this bit? I can fix it when applying the
> series, no need to respin.

No objections to dropping it. Regarding respinning though, it depends
on what I need to do to address Marc's comment. On that in my reply to
his email.

Thanks,
/fuad

> Thanks,
> Oliver

