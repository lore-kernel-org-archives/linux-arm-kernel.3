Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0FA0C44507
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 11:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ta+kur5ryJs2I5yQGZkvpcOeEwa4qpkvMvmH1OmJGTs=; b=IrbADOZVUvpd/NeJ4lMqlzlWc5
	5mUeieDQbnMzej1VRfi1mxH6uzEIHIknxNcyFUwXtukO8KdxaM2Zja64Y7eI6EKKScBwvDjsYtOI4
	C7fTcRNjYZYz0K8orkK4QwebKXxKSsRoKNv8rA37wUmVEBEwD8FHfUJFJZheXXeha8RjqYwF+vRNh
	xfCeAkKN2X6dsGLGKjOwCGR/86n6XCF6BdIiI8/EiZJTjmeNLKLNT8TBoXu9wgrnJCFh/szBZ7/67
	ps62Ynn/4GqRJ27z3GOBzR5wwdTTld6h7MfzMlL4e/6V7d7i5ENvYSAn7b0FzCawJwdltrO3qzbfP
	zqQMQUww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjxtg-0000000EamV-1IjS;
	Wed, 15 Jul 2026 11:35:28 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjxtd-0000000Eam8-1pNL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 11:35:27 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so3343015e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 04:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784115324; x=1784720124; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ta+kur5ryJs2I5yQGZkvpcOeEwa4qpkvMvmH1OmJGTs=;
        b=k6mOtMSn5P1CV1DRIXRBW/68Byn+E5VKdNWanw2L4yWGAltNY+TIdnihi2yUF5yiah
         f/zbvPj7s/fZfYx56ZP0YZnCAvmIWmiJzeMFJEWDzk/MKDcKcDeHJX+3fgoGQDqN3UJq
         uCCF4Bi1iJ2S7n0UvdnCcK4KqKm6XbOlJfA6K332S78O0FyH5u6dXzs3fMtov2U9ul5V
         S5xwVQG2ipQxhlwhn3Cff/PJLlR9hytIE1NaXdi5Acrqq/Yf44Y/3DVdyXASbUBwdPOl
         sBL/Z7iaxBaLJTh9G8Wsg0JNnmttBiRIz4mBwjNfnvF6sIPyKFuI/pkaosadhjVAoRnH
         X7UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784115324; x=1784720124;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ta+kur5ryJs2I5yQGZkvpcOeEwa4qpkvMvmH1OmJGTs=;
        b=G+MmfUME/gCA6TkPAiKFzp6Dyd1QdqB8S+hqdCwNBVPFNS2x65+Cv0i2PrQT15xjfK
         QTRONrp17jPX3IWH07E/0AtWQVOyR3X45/uE1vHqeveGiw6TMRkB+y/vVdXoecf7ldhu
         ZkV1CKBKiBlSiht5raThRPTYGwAGOnp5orJ76omRwndvHOXel7rp9vSkbYIwqa5yaFKD
         UK+qfZtgJYo7BLgV9RLckHPegm9NlRaNQo2ocwYR/RIJATSlZnh1wMu+PU9yn86YHuk6
         vPekl1ZVELqUDmIA/pa377rbDDH5kfP/rmropRL6bUaPD6vvNbRfuy8RDKM2O6b3xhQG
         V44Q==
X-Forwarded-Encrypted: i=1; AHgh+Rrw9HY5RcF4TKZCLnWmFMeIzC5O2slXx6ZFxXO1RI2TM8cMmKHgf402MkOu0YDJXkC9awnP0OSco9uIQnJjvbLb@lists.infradead.org
X-Gm-Message-State: AOJu0YwI+gA3s2hNBc8mQsgUzVjwJI6L+f2X5w8VEVzsOsByIpdfila4
	opKtkQYPdIX6036kGKQ8nXSMACj0gE8fqb4MnB0JjUiFC7C67jUJuFrp69Q7ifPqvA==
X-Gm-Gg: AfdE7cmmvjfxxzB0r3xIxNlyUnDPPYWFkRYIIi6m7RB1b3B5Gnre+uCcqlv/9MTs/Li
	PHloGNOq4yVN0iW/7dRadD5GIRRTMqCVQIzMDDvqOklAgM/Tcuo5rg2xoz81ueSfvQk0zINxAB2
	SOrwf13PXgF0enJuE3fDMOZA8rIRNXny4+OMsb7uOPSS5gRMU/KZpst9rRSdK0T3PlJQT8cGE1j
	OWHZJzCPr5Ea6Z2bHHc1Pt/xUaqgHADyyO57IxAtZKEQn/gccVxFCpsM72/k/ykyf5hRMDam2NA
	FCYpfifF5QAqHPUKYEffazBj771f9nbeANzgss/SK7GV9xuDbC1gOhfhOegPj/q3fAhhbzU2tsk
	+BocFEd9DdmkkIsZqNeRxOF8nOnUDWCR26oEUX3tUbMu8DM/d5E4gyUL6jhU7X+3RG4wBFOVrkG
	AqQzEI5GB6moMjTiSDH4iMxFKjQXlPzVeNjJO78CN1CGzo2mUQ2Qw=
X-Received: by 2002:a05:600c:a40c:b0:493:ee4d:5c5d with SMTP id 5b1f17b1804b1-493f882cb8cmr125670585e9.31.1784115323077;
        Wed, 15 Jul 2026 04:35:23 -0700 (PDT)
Received: from google.com (137.69.77.34.bc.googleusercontent.com. [34.77.69.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4953c6ff429sm35719355e9.1.2026.07.15.04.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 04:35:22 -0700 (PDT)
Date: Wed, 15 Jul 2026 12:35:18 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	kernel-team@android.com, qperret@google.com
Subject: Re: [PATCH v2 11/18] KVM: arm64: Add a shrinker for pKVM
Message-ID: <aldwduiixzAFNCa1@google.com>
References: <20260706175415.2604046-1-vdonnefort@google.com>
 <20260706175415.2604046-12-vdonnefort@google.com>
 <CA+EHjTwcz8T_RfgE46+xMKP_nz7Mi9rVCdhtnC2CbjtO1O5xCQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTwcz8T_RfgE46+xMKP_nz7Mi9rVCdhtnC2CbjtO1O5xCQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_043525_502758_5DBB59E1 
X-CRM114-Status: GOOD (  24.88  )
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

On Wed, Jul 15, 2026 at 12:20:51PM +0100, Fuad Tabba wrote:
> On Mon, 6 Jul 2026 at 18:54, Vincent Donnefort <vdonnefort@google.com> wrote:
> >
> > Integrate the pKVM memory reclaim interface with the host's memory
> > management subsystem.
> >
> > This allows the host to automatically recover unused memory fom the
> > hypervisor's heap allocator when the host is under memory pressure.
> >
> > Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
> >
> > diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> > index 50adfff75be8..3dc2b9d2c322 100644
> > --- a/arch/arm64/kvm/arm.c
> > +++ b/arch/arm64/kvm/arm.c
> > @@ -122,6 +122,8 @@ static bool vgic_present, kvm_arm_initialised;
> >
> >  static DEFINE_PER_CPU(unsigned char, kvm_hyp_initialized);
> >
> > +static struct shrinker *pkvm_shrinker;
> > +
> >  bool is_kvm_arm_initialised(void)
> >  {
> >         return kvm_arm_initialised;
> > @@ -2526,8 +2528,8 @@ static void __init teardown_hyp_mode(void)
> >                 }
> >
> >                 free_pages(kvm_nvhe_sym(kvm_arm_hyp_percpu_base)[cpu], nvhe_percpu_order());
> > -
> >         }
> > +       shrinker_free(pkvm_shrinker);
> >  }
> >
> >  static int __init do_pkvm_init(u32 hyp_va_bits)
> > @@ -2713,6 +2715,18 @@ static void pkvm_hyp_init_ptrauth(void)
> >         }
> >  }
> >
> > +static unsigned long
> > +pkvm_shrinker_count(struct shrinker *shrink, struct shrink_control *sc)
> > +{
> > +       return pkvm_hyp_reclaimable(PKVM_TOPUP_HYP_ALLOC) ?: SHRINK_EMPTY;
> > +}
> > +
> > +static unsigned long
> > +pkvm_shrinker_scan(struct shrinker *shrink, struct shrink_control *sc)
> > +{
> > +       return pkvm_hyp_reclaim(PKVM_TOPUP_HYP_ALLOC, sc->nr_to_scan);
> > +}
> > +
> >  /* Inits Hyp-mode on all online CPUs */
> >  static int __init init_hyp_mode(void)
> >  {
> > @@ -2883,6 +2897,16 @@ static int __init init_hyp_mode(void)
> >                         kvm_err("Failed to init hyp memory protection\n");
> >                         goto out_err;
> >                 }
> > +
> > +               pkvm_shrinker = shrinker_alloc(0, "pkvm");
> > +               if (pkvm_shrinker) {
> > +                       pkvm_shrinker->count_objects = pkvm_shrinker_count;
> > +                       pkvm_shrinker->scan_objects = pkvm_shrinker_scan;
> > +                       shrinker_register(pkvm_shrinker);
> > +               } else {
> > +                       kvm_err("Failed to register shrinker for pKVM\n");
> > +               }
> > +
> >         }
> 
> Sashiko might be onto something here. The shrinker goes live in
> init_hyp_mode(), but kvm_protected_mode_initialized isn't set until
> finalize_pkvm()...

I doubt the shrinker can be triggered that early... BUT 

The hyp tracing is a user of this hyp allocator and I have been working on
enabling early tracing [1] so I shall move those HVCs as well!

[1] https://lore.kernel.org/all/20260708075435.47419-2-vdonnefort@google.com/

> 
> Cheers,
> /fuad
> 
> >
> >         return 0;
> > --
> > 2.55.0.rc2.803.g1fd1e6609c-goog
> >

