Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70206C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 08:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+HCqftvyh10fMpY6IqpqVPtQHg/FJB6+bDbXuzWB9b8=; b=QA7oS/DRr9M1bI9KjGPNFVJPnB
	ClS1xEM/Zr3UfxlZw93/1uqfetN8Fp0KXlNw37mzTWnYv6SruPf6lEA3DqzdLMpCKFiEEacPnXjPY
	ljQKTeKi21ip1pxvBn9Ab91Svh6008dka3QeT50UVKGwtj58AL7tklyRlG2p4QWoW+kJQrJF9gWCC
	bovKZeEt9noCtXTV/wJk6WWFXdGa5UXru9/hJga3r4w4qx1qh+Je2dJEPmv+CAOWChq7udDWjAjva
	Cr6vOA7rXdIbZABsFR/SPEdq6ummNqlyntjxM+woiBvDwCkYGnQ3WK/yUUQsfwWleS5UH0HiZ4I5H
	mxEbiPAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjYk7-0000000BLHK-0Dsx;
	Tue, 14 Jul 2026 08:43:55 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjYk4-0000000BLGL-1IOG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 08:43:53 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-47df440fcd5so2214041f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 01:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784018630; x=1784623430; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+HCqftvyh10fMpY6IqpqVPtQHg/FJB6+bDbXuzWB9b8=;
        b=Qan/OR/JWrwSpyPOhFfSO38J6v8o2wOXjNKrr5uaWcrS7yvv0LYJAhKjaROyfepjhy
         cPzGkTTwqAd3eNWgcRGeQm5IsKyLpDwnaKzeFb4TXoQljPOzXP2WdgiWT71VB9WesWDN
         EeN1dMZJvQ5Awiv27fXHwdBYSCrg6VwUHLMsHQaPJ1Zd0MK8GLjtooGKery005rs8cu8
         KgpQdp3SKOkrkMaSc7jALFlvpJCy/YemzvaMDSzWnh1IJuQHaEhCqcjsmw3LahsIyom9
         r9m/MIvI/Evhhlg5zUtpcBg37tEyPrRvc6o2bxadx6JnGN94b61mFzMNqissw9/L7hwl
         Zaog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784018630; x=1784623430;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+HCqftvyh10fMpY6IqpqVPtQHg/FJB6+bDbXuzWB9b8=;
        b=FqS9NldUtL9uJRyGaedAaJFl+Trne2gbkJOpTl8lELjQzXQ7I1BnaEusrF62WuSExV
         5HHRVmPxFBLVM0CieGqm+ReEOifYBwqbKr9XBba5dZMjKb6XpHsnbrQWBesdwWgxEaaP
         rcOEQXqRYieZF1zrS2zl4xBQiDL80Bj3++/0IHm/dZ01iN5rdKs+8+i0ewqsQ2LPPoXu
         dXMr/QEOiXnnDeeP34Xp6R98gv5GiEMr49ihoujJQBDINSNPGTo1Ph044QT9yT35tByi
         SbFZoHsSLAd7wiDRXxMslF8AlSFIPRh+qsa7PX9nruCBBX5BsUcO9PAuBP+k+qJs1tnJ
         QBvA==
X-Gm-Message-State: AOJu0YzALGzBYr3djBLc94kqDdWkFuIKB0vT/f8TqIy2pt3JvCAwFYb+
	pAIJCzHSpn81U3W26zsIghXgoLHc+Cx7u70Y34TJYeG2Wa7CGzr2JoGP14MFMJeglQ==
X-Gm-Gg: AfdE7ckXQHSpSz3jDZbA7xfXcWyKt6q0T8IU9DUBxHFYEa761Tp3mKCf+j4+qYxs0IZ
	T3CclsG0XL4PGLyFB/+rSyYs8zO3Ey3NheQHH39Kysy6qc4k+AMhLvxivtvKWj1OyIDy7XYDHyk
	6hp4g+vUNde9Mzevt035EAuelRjhevLFJ48Gq6Ts5z1lbnJJx+tf49A37SWx9VBIw+IzCwsQdzZ
	GDvhE+Qg8E4G4zQ6EXGcJxlQBTgOBzjDPJ1KGwgkYEq6I3y1G6tqyNCgZ29n29GsfIyA4BMRAo+
	jQPWNA2JrBZSl4JI3cINfs4hdOG2+tQg8VykLucgpkKglCvoK+1VOwCQIgWRlvKUM0fkKarws0q
	XdjTSGyrXVlB2X01Z2d2RFLESDsZ3CSJ0NzN65UvU+69aSQcNFVwO+SyFBy2hPe+JAxLwMlDfy5
	1ZzmpfDxhFbcWLwIUrkypeJGz0Ly9VWrBEl1t5MMSua89TOXvf0tg=
X-Received: by 2002:a05:6000:2006:b0:47d:edab:a721 with SMTP id ffacd0b85a97d-47f2dce9698mr13848050f8f.31.1784018629391;
        Tue, 14 Jul 2026 01:43:49 -0700 (PDT)
Received: from google.com (137.69.77.34.bc.googleusercontent.com. [34.77.69.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464c7c96sm6294914f8f.33.2026.07.14.01.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 01:43:48 -0700 (PDT)
Date: Tue, 14 Jul 2026 09:43:44 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org,
	jgg@ziepe.ca, mark.rutland@arm.com, qperret@google.com,
	tabba@google.com, sebastianene@google.com, keirf@google.com
Subject: Re: [PATCH v6 09/25] KVM: arm64: iommu: Add memory pool
Message-ID: <alX2wISNtLcx7xPb@google.com>
References: <20260501111928.259252-1-smostafa@google.com>
 <20260501111928.259252-10-smostafa@google.com>
 <alEeyoXnMC0J4zFQ@google.com>
 <alS_gB5uSEbFV-jH@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alS_gB5uSEbFV-jH@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_014352_394554_C033176C 
X-CRM114-Status: GOOD (  33.00  )
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

[...]

> > nit: kvm_iommu_init uses nr_pages. 
> > 
> > >  {
> > >  	guard(mutex)(&kvm_iommu_reg_lock);
> > >  
> > > @@ -21,6 +22,36 @@ int kvm_iommu_register_driver(struct kvm_iommu_ops *hyp_ops)
> > >  	if (kvm_nvhe_sym(kvm_iommu_ops))
> > >  		return -EBUSY;
> > >  
> > > +	/* See kvm_iommu_pages() */
> > > +	if (pool_pages > kvm_nvhe_sym(hyp_kvm_iommu_pages)) {
> > > +		kvm_err("Not enough memory for the IOMMU pool, need 0x%x pages, check kvm-arm.hyp_iommu_pages",
> > > +			pool_pages);
> > > +		return -ENOMEM;
> > > +	}
> > > +
> > >  	kvm_nvhe_sym(kvm_iommu_ops) = hyp_ops;
> > >  	return 0;
> > >  }
> > > +
> > > +unsigned int kvm_iommu_pages(void)
> > > +{
> > > +	/*
> > > +	 * This is used very early during setup_arch() before any initcalls
> > > +	 * or any drivers are registered.
> > > +	 * This value is set by a command line option.
> > > +	 * Later, when the driver is registered, it will pass the number
> > > +	 * pages needed for it's page tables, if it was less that what
> > > +	 * the system has already allocated, the registration will fail.
> > > +	 */
> > > +	return kvm_nvhe_sym(hyp_kvm_iommu_pages);
> > > +}
> > 
> > Could we actually estimate the memory needed, based on the allocation for the
> > host stage-2 and an estimation of MMIO coverage? This would allow the whole
> > thing to run without setting this value as a best effort and to make it
> > optional, which is surely more user-friendly?
> 
> Not really, this abstracts the IOMMU, so it does not have to match the
> host stage-2, in addition that the SMMUv3 driver requires extra pages
> for other in-memory data-structure.

What I thought would be to take __hyp_pgtable_total_pages() and then add on top
of that memory to cover the MMIO region. As of "here's memory we think your
driver will need" and of course that can't take into account any
"driver"-specific struct.

To be fair, that is a bit weird to have memory reservation so early for a
"driver" but perhaps that is okay because the pKVM protection is only complete
if we have that "driver"?

> 
> At the moment, this is set from the command line which is not really
> best effort as the driver later confirms how much memory it needs.
> 
> > 
> > > +
> > > +/* Number of pages to reserve for iommu pool*/
> > > +static int __init early_hyp_iommu_pages(char *arg)
> > > +{
> > > +	if (!arg)
> > > +		return -EINVAL;
> > > +
> > > +	return kstrtouint(arg, 0, &kvm_nvhe_sym(hyp_kvm_iommu_pages));
> > 
> > How about using a memory size here with memparse()? This would be more
> > transparent for the commandline which can work on different page-size systems.
> 
> Makes sense, will do.
> 
> Thanks,
> Mostafa

