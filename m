Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E17DD1CDC6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 15:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FRSJPoZVIWwIEh7D+HUP6mvJWdSsS3ngbeEkLMitoU0=; b=YNRupeIY+GY7ZobrTArHtN3qcq
	LqwVr5CpLH+FCs9BxQ9yuVeG0peoQMjwgA/rswZSzgBHShKJCXBkkb5XWoD9venHeKYeRjtDP0q/l
	BH99j2TF6y+IEjwf7bOpvv5c1PmBTXpiNLyoGRZl04ZnYFH+KAnOjHLj0TdmcBafNtalLhANRlIjx
	3fhBSh9Swul4HkvVMVt6CvNHv1LmFa1YX8WXHMmK7nGR3iPP4CMuxXUfPfMPusfRyMFEhW8aPL6wI
	LOWfLdimSS3MN8aaUsH8Zpkw7GIqF+18zrLrJPxM442KsIkbmi7sJZtt/34vkCeGcFpW0f4MRx7g6
	VJ/E6eZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSzq0-0000000ESjo-3C5H;
	Tue, 09 Dec 2025 15:41:16 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSzpx-0000000ESiv-3PC5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 15:41:15 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-47a815c43baso25855e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Dec 2025 07:41:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765294872; x=1765899672; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FRSJPoZVIWwIEh7D+HUP6mvJWdSsS3ngbeEkLMitoU0=;
        b=JVkMHfQ/Jn5lz3RHu2oM7J3foivijkAqZrxv2uWAIsxD9O7vE+kS92XI1yTZaJ3aPY
         oAezGM7PDigh7OKXaUUybv8HGaVVL78LUyjOn4/S+OcFLdtyVo3bQMwJl+3eK4ocgPcj
         SBQJBGytYIRZ8hmzeLtHwW7YkFJwJpNh7KQlWSs8Lz079RaDgVs2iH5rXHjMpdoJu6fr
         o5yUaSDid6d7E73hko8qPb4I+iDVsQptnLD4vLdLw+whk8S6ekeCgQWLuf4DNO4swI3d
         QxQdQN9Io7BrhLzEDPf1E+ABDuAUNhz2A7qI01/slsKIEwzUyUEc/2HCOigrLUj3RhN+
         Inxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765294872; x=1765899672;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FRSJPoZVIWwIEh7D+HUP6mvJWdSsS3ngbeEkLMitoU0=;
        b=AlFjZeDoe417WQY/2MS2s49l/AbTh+x0uTeaLrH6q7WA8KG5LKRyalSFJwLWKntIms
         RAYFhQkB8mVgi0wSzYr891jsgmRmo4cwzOi8iXPEFKekV/LcO7a3W3Xe3gug4HViD6Dt
         EO6ANTYPKct1z4H+eGqb41uDnIw6jPGe6ubOtlR8oxq8YGHw2zkW7g+WIoUzNqzLLHC7
         UkbNKheGR3uc1z8qwhwxkmK8+gbLWi/woPo4qDBrB7pvtaESpJnfqfYreJI8Bny6V52V
         sgZESf7Ny4gYm+oZ9AnmM6bbSykaim4IEx5RcV/5GXABoGVcv9d6i3TDmp9Zrfxe/FRE
         wKow==
X-Forwarded-Encrypted: i=1; AJvYcCVmQos3g0bmQTN4+BIK++F6FXBUJ6gUvNQbFCy9egNI7yZ32TX/aVHV45WagO5GEvhT0KcthF/8l+fZaLppVhWI@lists.infradead.org
X-Gm-Message-State: AOJu0YxgMRWvOTmpAeQBaZvzcptKbiRuql+i1JTbFGdYje/Ts0AlAZCp
	qnQRfwdHSVnCnUQJMloP8uMCtZMBLj07x/CYvbuULryH43oC3F3rFS+YtAAci7Tisw==
X-Gm-Gg: ASbGncsmWsbsz9s1ibIM0GBUwp8iPwa2MA/C38ZAlN6kF5QyQwg6mqsbStjoQ5wzte1
	Z2FjxswU2ZwoSwq/m/FMd+wZqhRHkOgVTMUZPCChtmNjCT6ruzbVSobDzIBegjFN2W8AuvDeEOX
	wltnrr9QD+WYR4lx7DBnlqS4wQbXFJKenouv4Zyt7rlStONw/S0flBogVfEeVRecKpaL5BvNiBs
	4+qlvR/BR/8gj/Bc37ba2qKTDZvFwX1TJYf98usBtPK2Xm45J6deTVoxLUWOlMJyE1QgRAOpt9a
	Q9tvblHer0+q9NDg53Vy4+D47KZmYaEBfbJBk0vtohTC1zyRXiOIrfRqOjjbiwbRA5vbLwKH0Nb
	FoiVAIW8k3s75J1aVPt5zedz71+hiDLYDgX2ztWquqldDcg65ZpxvkHDuJjQtyxUPHb25ogEzZv
	7V/JzRa3fm1R8RhdDRcyAw2uq2ueREhHE03QYqWF64N7Rlf+FhCA==
X-Google-Smtp-Source: AGHT+IHQEZ8FLIilFiXNCi+g2Qu7gthEz4ALV/uyU+U+XaaH+GfBRniWK3APXG/SjEYT89Xm7QNmpg==
X-Received: by 2002:a05:600c:2054:b0:45f:2940:d194 with SMTP id 5b1f17b1804b1-47a7d390f34mr549265e9.2.1765294871501;
        Tue, 09 Dec 2025 07:41:11 -0800 (PST)
Received: from google.com (54.140.140.34.bc.googleusercontent.com. [34.140.140.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a816938d4sm15340565e9.1.2025.12.09.07.41.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 07:41:10 -0800 (PST)
Date: Tue, 9 Dec 2025 15:41:06 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, will@kernel.org, joro@8bytes.org,
	Tomasz Nowicki <tnowicki@google.com>
Subject: Re: [PATCH] iommu/io-pgtable-arm: Add misisng concatenated PGD cases
Message-ID: <aThDEnbbop8ZYAuG@google.com>
References: <20251130194506.593700-1-smostafa@google.com>
 <18a39079-2285-47fb-b306-040f2bc1bbaa@arm.com>
 <aTgX9qhaLyrQ5iye@google.com>
 <498bbad4-ea64-4a24-a63f-e131d271990a@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <498bbad4-ea64-4a24-a63f-e131d271990a@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_074113_892469_EFC97417 
X-CRM114-Status: GOOD (  34.18  )
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

On Tue, Dec 09, 2025 at 01:33:36PM +0000, Robin Murphy wrote:
> On 2025-12-09 12:37 pm, Mostafa Saleh wrote:
> > On Tue, Dec 09, 2025 at 11:34:34AM +0000, Robin Murphy wrote:
> > > On 2025-11-30 7:45 pm, Mostafa Saleh wrote:
> > > > arm_lpae_concat_mandatory() assumes that OAS >= IAS which is not
> > > > correct for SMMUs supporting AArch32, and have OAS = 32/36 bits,
> > > > as IAS would be 40 bits.
> > > 
> > > But that is only when *using* AArch32 format. The bit in chapter 3.4 of the
> > > SMMU architecture is talking about the maximum IAS that an SMMU
> > > implementation needs to be able to accommodate based on its configuration,
> > > but it does then attempt to clarify that the actual IPA size in use by any
> > > given context should depend on the VMSA format in use:
> > > 
> > > "VMSAv8-32 LPAE always supports an IPA size of 40 bits, whereas VMSAv8-64
> > > and VMSAv9-128 limits the maximum IPA size to the maximum PA size."
> > > 
> > > Rule R_SRKBC in the Arm ARM lays out the exact T0SZ constraints with this
> > > AArch32/AArch64 detail.
> > 
> > I see, thanks a lot for the explanation, I got confused by the this
> > statement:
> > Note: If AArch32 is implemented, IAS == MAX(40, OAS), otherwise IAS == OAS.
> 
> Indeed, that appears confusingly contradictory; I've filed a bug.
> 
> > However, I think this is still a bug but somewere else, as at the moment
> > the SMMUv3 dirver will use the SMMU IAS (40-bits) as input for AArch64
> > stage-2 page tables, so we need either to limit the IAS as:
> > 
> > diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> > index d16d35c78c06..d21153156daa 100644
> > --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> > +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> > @@ -2561,7 +2561,7 @@ static int arm_smmu_domain_finalise(struct arm_smmu_domain *smmu_domain,
> >          case ARM_SMMU_DOMAIN_S2:
> >                  if (enable_dirty)
> >                          return -EOPNOTSUPP;
> > -               pgtbl_cfg.ias = smmu->ias;
> > +               pgtbl_cfg.ias = min(smmu->ias, smmu->oas);
> >                  pgtbl_cfg.oas = smmu->oas;
> >                  fmt = ARM_64_LPAE_S2;
> >                  finalise_stage_fn = arm_smmu_domain_finalise_s2;
> > 
> > Or, don't populate IAS depending on AArch32 support as the driver
> > doesn't support it, effectively reverting:
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f0c453dbcce7767cd868deb809ba68083c93954e
> 
> It does appear we've missed the detail here. TBH I'm not really sure why
> we're bothering to consider the theoretical maximum IAS at all when it only
> makes any difference to a format we've never cared about supporting anyway.
> Frankly I'd be inclined to just remove smmu->ias altogether - even if we did
> ever want to support LPAE format, it would be just as trivial for that to
> hard-code pgtbl_cfg.ias = 40 based on the architecture rules.
> 

Makes sense, I will prepare a patch.

Thanks,
Mostafa

> Thanks,
> Robin.

